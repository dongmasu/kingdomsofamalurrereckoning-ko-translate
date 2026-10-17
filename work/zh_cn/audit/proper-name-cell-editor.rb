#!/usr/bin/env ruby

require 'csv'
require 'digest'
require 'fileutils'
require 'json'

module ProperNameCellEditor
  module_function

  # Identify physical field spans without reserializing untouched CSV bytes.
  def records(bytes)
    result = []
    fields = []
    start = bytes.start_with?("\xEF\xBB\xBF".b) ? 3 : 0
    field_start = start
    quoted = false
    index = start
    while index < bytes.bytesize
      byte = bytes.getbyte(index)
      if byte == 34
        if quoted && bytes.getbyte(index + 1) == 34
          index += 1
        else
          quoted = !quoted
        end
      elsif byte == 59 && !quoted
        fields << (field_start...index)
        field_start = index + 1
      elsif byte == 10 && !quoted
        finish = index > 0 && bytes.getbyte(index - 1) == 13 ? index - 1 : index
        fields << (field_start...finish)
        result << fields
        fields = []
        field_start = index + 1
      end
      index += 1
    end
    raise 'unclosed CSV quote' if quoted
    if field_start < bytes.bytesize || !fields.empty?
      fields << (field_start...bytes.bytesize)
      result << fields
    end
    result
  end

  def parse(bytes)
    CSV.parse(bytes.dup.force_encoding('UTF-8').delete_prefix("\uFEFF"),
              headers: true, col_sep: ';')
  end

  def key(row)
    [row['ID_Linha'], row['Tipo_Variante'].to_s]
  end

  def tokens(text)
    text.scan(/\{[^}]*\}/).map do |token|
      # {*1...} contains translated display text, not an opaque variable.
      token.match?(/\A\{\*\d+/) ? token[/\A\{\*\d+/] + '}' : token
    end
  end

  def disposition_preserving_correction?(edit)
    return false unless edit['status'] == 'not-an-issue' &&
      edit['old'] != edit['new'] &&
      edit['evidence'].to_s.start_with?('Corrective particle-only residual audit.')

    previous = JSON.parse(edit.fetch('previous_status'))
    !previous.empty? && previous.values.all? { |status| status == 'not-an-issue' }
  rescue JSON::ParserError, KeyError
    false
  end

  def applyable_edit?(edit)
    edit['old'] != edit['new'] &&
      (edit['status'] == 'accepted' || disposition_preserving_correction?(edit))
  end

  def prepare(bytes, edits)
    rows = parse(bytes)
    spans = records(bytes)
    raise 'physical/logical record count differs' unless spans.length == rows.length + 1
    texto = rows.headers.index('Texto')
    raise 'missing Texto' unless texto
    index = rows.each_with_index.group_by { |row, _ordinal| key(row) }
    seen = {}
    patches = edits.map do |edit|
      row_key = [edit.fetch('ID_Linha'), edit.fetch('Tipo_Variante').to_s]
      raise "duplicate edit #{row_key.inspect}" if seen[row_key]
      seen[row_key] = true
      matches = index.fetch(row_key) { raise "missing key #{row_key.inspect}" }
      raise "ambiguous target #{row_key.inspect}" unless matches.length == 1
      row, ordinal = matches.first
      raise "stale old text #{row_key.inspect}" unless row['Texto'] == edit.fetch('old')
      replacement = edit.fetch('new')
      raise "empty/no-op target #{row_key.inspect}" if replacement == row['Texto']
      old = row['Texto']
      raise "line breaks changed #{row_key.inspect}" unless old.scan(/\r\n|\r|\n/) == replacement.scan(/\r\n|\r|\n/)
      raise "tokens changed #{row_key.inspect}" unless tokens(old) == tokens(replacement)
      span = spans.fetch(ordinal + 1).fetch(texto)
      encoded = CSV.generate_line([replacement], col_sep: ';', row_sep: '').b
      [span, bytes.byteslice(span), encoded, ordinal, edit]
    end
    updated = bytes.dup
    patches.sort_by { |patch| -patch[0].begin }.each do |span, _old, encoded, _ordinal, _edit|
      updated[span] = encoded
    end
    after = parse(updated)
    raise 'header/order/count changed' unless after.headers == rows.headers && after.length == rows.length
    targets = patches.to_h { |_span, _old, _encoded, ordinal, edit| [ordinal, edit] }
    rows.each_with_index do |row, ordinal|
      expected = row.to_h
      expected['Texto'] = targets[ordinal].fetch('new') if targets.key?(ordinal)
      raise "unexpected cell change at row #{ordinal}" unless after[ordinal].to_h == expected
    end
    raise 'BOM changed' unless updated.byteslice(0, 3) == bytes.byteslice(0, 3)
    raise 'line-ending sequence changed' unless updated.scan(/\r\n|\r|\n/n) == bytes.scan(/\r\n|\r|\n/n)
    inverse = updated.dup
    after_spans = records(updated)
    patches.sort_by { |patch| -patch[3] }.each do |_span, old, _encoded, ordinal, _edit|
      inverse[after_spans.fetch(ordinal + 1).fetch(texto)] = old
    end
    raise 'non-target bytes/inverse reconstruction failed' unless inverse == bytes
    [updated, rows.length]
  end

  def apply(root, manifest_path, backup_dir, expected_hashes)
    edits = CSV.read(manifest_path, headers: true, col_sep: "\t").map(&:to_h)
               .select { |edit| applyable_edit?(edit) }
    edits.group_by { |edit| edit.fetch('resource') }.map do |resource, group|
      raise "unknown resource #{resource}" unless %w[affix base default].include?(resource)
      path = File.join(root, 'work/zh_cn', "locatexts_zh_cn.koalocatext_#{resource}.csv")
      bytes = File.binread(path)
      before = Digest::SHA256.hexdigest(bytes)
      raise "hash mismatch #{resource}: #{before}" unless before == expected_hashes.fetch(resource)
      updated, count = prepare(bytes, group)
      FileUtils.mkdir_p(backup_dir)
      backup = File.join(backup_dir, File.basename(path))
      if File.exist?(backup)
        raise "backup differs #{backup}" unless File.binread(backup) == bytes
      else
        FileUtils.copy_file(path, backup)
      end
      raise 'backup not byte identical' unless File.binread(backup) == bytes
      raise 'active file changed during validation' unless File.binread(path) == bytes
      File.binwrite(path, updated)
      raise 'write verification failed' unless File.binread(path) == updated
      {
        resource: resource, cells: group.length, rows: count,
        before_sha256: before, after_sha256: Digest::SHA256.hexdigest(updated),
        backup: backup, validation: 'BOM/line-endings/rows/order/tokens/non-target bytes/inverse PASS'
      }
    end
  end
end
