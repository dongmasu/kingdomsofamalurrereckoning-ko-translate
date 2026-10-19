#!/usr/bin/env ruby

require 'digest'
require 'csv'
require_relative 'proper-name-cell-editor'

ROOT = File.expand_path('../../..', __dir__)
AUDIT = __dir__
BACKUPS = '/private/tmp/ko-translate-backups/20261015'
RESOURCES = %w[affix base default].freeze
# Recorded hashes show D-21543 was applied before the later-numbered
# D-21541/D-21542 correction passes.
STAGE_SEQUENCE_OVERRIDES = { 21_543 => 21_540.5 }.freeze
NON_NAME_EDIT_STAGES = [
  {
    d: 21799, order: 1,
    manifest: File.join(AUDIT, 'proper-name-candidate-edits-D21799.tsv'),
    backup: '/private/tmp/ko-translate-backups/20261018/before-proper-name-D21799'
  },
  {
    d: 21814, order: 1,
    manifest: File.join(AUDIT, 'proper-name-short-label-edits-D21814.tsv'),
    backup: '/private/tmp/ko-translate-backups/20261018/before-proper-name-D21814'
  },
  {
    d: 21568, order: 1,
    manifest: File.join(AUDIT, 'proper-name-text-corrections-D21568.tsv'),
    backup: '/private/tmp/ko-translate-backups/20261017/before-proper-name-D21568'
  },
  {
    d: 21569, order: 1,
    manifest: File.join(AUDIT, 'japanese-parenthetical-review-D21569.tsv'),
    backup: '/private/tmp/ko-translate-backups/20261017/before-default-parenthetical-D21569'
  }
].freeze

def key(row)
  [row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
end

def backup_path(stage, filename)
  path = File.join(stage[:backup], filename)
  return path if File.file?(path)

  matches = Dir.glob(File.join(File.dirname(BACKUPS), '*', File.basename(stage[:backup])))
    .map { |directory| File.join(directory, filename) }
    .select { |candidate| File.file?(candidate) }
  if matches.empty?
    matches = Dir.glob(File.join(File.dirname(BACKUPS), '*', "before-proper-name-D#{stage[:d]}-*"))
      .map { |directory| File.join(directory, filename) }
      .select { |candidate| File.file?(candidate) }
  end
  return nil if matches.empty?
  raise "ambiguous backup D-#{stage[:d]} #{filename}: #{matches.inspect}" unless matches.length == 1

  matches.first
end

def document_hash(value)
  value.to_s.match(/[a-f0-9]{64}/)&.to_s
end

def document_resource(value)
  value.to_s.strip.match(/\A`?(affix|base|default)`?\z/i)&.captures&.first&.downcase
end

def parse_hash_section(lines, resource, fallback_resource)
  hashes = Hash.new { |mapping, name| mapping[name] = [] }
  pending_resource = nil

  lines.each do |line|
    value = line.strip
    next if value.empty?

    named_resource = document_resource(value.sub(/[;,.]\z/, ''))
    if named_resource
      pending_resource = named_resource
      next
    end

    hash = document_hash(value)
    next unless hash

    name = pending_resource || fallback_resource
    hashes[name] << hash if name
    pending_resource = nil
  end

  hashes
end

def parse_document_hashes(text, resource, stage_label: nil)
  lines = text.lines.map(&:strip)
  pairs = []
  lines.each do |line|
    match = line.match(
      /\A- #{Regexp.escape(resource)}: \d+ cells; pre `([a-f0-9]{64})`; post `([a-f0-9]{64})`;/
    )
    pairs << match.captures if match
  end

  lines.each_with_index do |line, index|
    next unless line.start_with?('|')

    headers = line.split('|', -1)[1...-1].map { |cell| cell.strip.downcase }
    next unless headers[0] == 'resource' || headers[0] == 'stage/resource'
    next unless headers.include?('pre-edit sha-256') &&
                headers.include?('post-edit sha-256')

    resource_column = 0
    pre_column = headers.index('pre-edit sha-256')
    post_column = headers.index('post-edit sha-256')
    lines[(index + 1)..].each do |row_line|
      break unless row_line.start_with?('|')

      cells = row_line.split('|', -1)[1...-1].map do |cell|
        cell.strip.sub(/\A`(.*)`\z/, '\1')
      end
      next unless cells.length == headers.length

      if headers[resource_column] == 'stage/resource'
        stage, row_resource = cells[resource_column].split(/\s*\/\s*/, 2)
        next unless stage_label && stage && row_resource
        next unless stage.casecmp?(stage_label.to_s) &&
                    row_resource.casecmp?(resource)
      else
        next unless cells[resource_column].casecmp?(resource)
      end

      pre_hash = document_hash(cells[pre_column])
      post_hash = document_hash(cells[post_column])
      pairs << [pre_hash, post_hash] if pre_hash && post_hash
    end
  end

  fallback_resource = text.scan(
    %r{locatexts_zh_cn\.koalocatext_(affix|base|default)\.csv}
  ).flatten.uniq
  fallback_resource = fallback_resource.one? ? fallback_resource.first : nil
  section_headers = lines.each_index.select do |index|
    lines[index].match?(/\A(?:Pre|Post)-edit SHA-256:/)
  end
  sections = {}
  section_headers.each do |index|
    label = lines[index].start_with?('Pre-edit') ? :pre : :post
    inline = lines[index].sub(/\A(?:Pre|Post)-edit SHA-256:\s*/, '')
    body = []
    ((index + 1)...lines.length).each do |next_index|
      next_line = lines[next_index]
      break if next_line.empty? ||
               next_line.match?(/\A(?:Pre|Post)-edit SHA-256:/)

      body << next_line
    end
    sections[label] ||= Hash.new { |mapping, name| mapping[name] = [] }
    parse_hash_section([inline, *body], resource, fallback_resource).each do |name, hashes|
      sections[label][name].concat(hashes)
    end
  end
  pre_hashes = sections.fetch(:pre, {}).fetch(resource, [])
  post_hashes = sections.fetch(:post, {}).fetch(resource, [])
  pairs.concat(pre_hashes.product(post_hashes))

  pairs
end

def resolve_recorded_hashes(documents, resource, stage_id:, stage_label: nil)
  pairs = documents.flat_map do |text|
    parse_document_hashes(text, resource, stage_label: stage_label)
  end.uniq
  raise "missing/ambiguous recorded hashes D-#{stage_id} #{resource}" unless pairs.length == 1

  pairs.first
end

def recorded_hashes(stage, resource)
  documents = Dir.glob(File.join(AUDIT, "named-scope-edit-addendum-D#{stage[:d]}-*.md"))
    .map { |path| File.read(path) }
  resolve_recorded_hashes(
    documents, resource, stage_id: stage[:d], stage_label: stage[:label]
  )
end

def reconstruct_before_with_count(after, targets)
  rows = ProperNameCellEditor.parse(after)
  spans = ProperNameCellEditor.records(after)
  texto = rows.headers.index('Texto')
  map = targets.to_h { |row| [key(row), row] }
  found = []
  inverse = after.dup
  rows.each_with_index.to_a.reverse_each do |row, ordinal|
    target = map[key(row)]
    next unless target

    raise "inverse manifest/new mismatch #{key(row).inspect}" unless row['Texto'] == target['new']
    inverse[spans.fetch(ordinal + 1).fetch(texto)] =
      CSV.generate_line([target.fetch('old')], col_sep: ';', row_sep: '').b
    found << key(row)
  end
  raise 'inverse missing target' unless found.length == targets.length

  [inverse, rows.length]
end

def reconstruct_before(after, targets)
  reconstruct_before_with_count(after, targets).first
end

def verify_full_chain
$stdout.sync = true
stages = Dir.glob(File.join(AUDIT, 'proper-name-edits-D*.tsv')).map do |manifest|
  d = File.basename(manifest)[/\Aproper-name-edits-D(\d+)\.tsv\z/, 1].to_i
  { d: d, order: 0,
    sequence: STAGE_SEQUENCE_OVERRIDES.fetch(d, d), manifest: manifest,
    backup: File.join(BACKUPS, "before-proper-name-D#{d}") }
end

stages.concat([
  *NON_NAME_EDIT_STAGES,
  {
    d: 21415, order: 1,
    manifest: File.join(AUDIT, 'proper-name-short-residual-D21415.tsv'),
    backup: File.join(BACKUPS, 'before-proper-name-D21415')
  },
  {
    d: 20392, order: 1,
    label: 'Peoples',
    manifest: File.join(AUDIT, 'proper-name-peoples-D20392.tsv'),
    backup: File.join(BACKUPS, 'before-proper-name-D20392-peoples')
  },
  {
    d: 20392, order: 2,
    label: 'Deities',
    manifest: File.join(AUDIT, 'proper-name-deities-D20392.tsv'),
    backup: File.join(BACKUPS, 'before-proper-name-D20392-deities')
  },
  {
    d: 20393, order: 1,
    manifest: File.join(AUDIT, 'proper-name-houses-D20393.tsv'),
    backup: File.join(BACKUPS, 'before-proper-name-D20393-houses')
  }
])
stages.sort_by! { |stage| [stage.fetch(:sequence, stage[:d]), stage[:order]] }

states = RESOURCES.to_h do |resource|
  path = File.join(ROOT, 'work/zh_cn',
                   "locatexts_zh_cn.koalocatext_#{resource}.csv")
  [resource, File.binread(path)]
end

stages.reverse_each do |stage|
  reviews = CSV.read(stage[:manifest], headers: true, col_sep: "\t")
  edits = reviews.select { |row| row['old'] != row['new'] }
  edits.group_by { |row| row.fetch('resource') }.each do |resource, targets|
    raise "unknown resource in D-#{stage[:d]}" unless RESOURCES.include?(resource)

    filename = "locatexts_zh_cn.koalocatext_#{resource}.csv"
    after = states.fetch(resource)
    backup = backup_path(stage, filename)
    if backup
      before = File.binread(backup)
      provenance = 'inverse backup'
    else
      pre_hash, post_hash = recorded_hashes(stage, resource)
      raise "recorded post hash differs D-#{stage[:d]} #{resource}" unless
        Digest::SHA256.hexdigest(after) == post_hash
      before, row_count = reconstruct_before_with_count(after, targets)
      raise "recorded pre hash differs D-#{stage[:d]} #{resource}" unless
        Digest::SHA256.hexdigest(before) == pre_hash
      raise "BOM/line endings changed D-#{stage[:d]}" unless
        before.byteslice(0, 3) == after.byteslice(0, 3) &&
        before.scan(/\r\n|\r|\n/n) == after.scan(/\r\n|\r|\n/n)

      states[resource] = before
      puts "PASS D-#{stage[:d]} #{File.basename(stage[:manifest])}: " \
           "#{targets.length} Texto cells; #{row_count} ordered rows; " \
           "field-only inverse, recorded pre/post SHA-256, BOM/line endings"
      next
    end
    original = ProperNameCellEditor.parse(before)
    current = ProperNameCellEditor.parse(after)
    raise "headers/row count changed D-#{stage[:d]}" unless
      original.headers == current.headers && original.length == current.length

    target_map = targets.to_h do |row|
      [[row.fetch('ID_Linha'), row['Tipo_Variante'].to_s], row]
    end
    raise "duplicate target D-#{stage[:d]}" unless target_map.length == targets.length

    before_spans = ProperNameCellEditor.records(before)
    after_spans = ProperNameCellEditor.records(after)
    texto = original.headers.index('Texto')
    ordinals = []
    original.each_with_index do |row, ordinal|
      raise "row order changed D-#{stage[:d]}" unless
        ProperNameCellEditor.key(row) == ProperNameCellEditor.key(current[ordinal])

      target = target_map[key(row)]
      expected = row.to_h
      if target
        raise "manifest mismatch D-#{stage[:d]} #{key(row).inspect}" unless
          row['Texto'] == target['old'] &&
          current[ordinal]['Texto'] == target['new']
        expected['Texto'] = target['new']
        ordinals << ordinal + 1
      end
      actual = current[ordinal].to_h
      unless expected == actual
        changed_fields = (expected.keys | actual.keys).select do |field|
          expected[field] != actual[field]
        end
        raise "non-target cell changed D-#{stage[:d]} " \
              "key=#{key(row).inspect} fields=#{changed_fields.inspect}"
      end
    end
    raise "missing target D-#{stage[:d]}" unless ordinals.length == targets.length

    masked_before = before.dup
    masked_after = after.dup
    inverse = after.dup
    ordinals.reverse_each do |ordinal|
      inverse[after_spans[ordinal][texto]] =
        before.byteslice(before_spans[ordinal][texto])
      masked_before[before_spans[ordinal][texto]] = ''
      masked_after[after_spans[ordinal][texto]] = ''
    end
    raise "non-target bytes changed D-#{stage[:d]}" unless
      masked_before == masked_after
    raise "inverse differs from backup D-#{stage[:d]}" unless inverse == before
    raise "BOM/line endings changed D-#{stage[:d]}" unless
      before.byteslice(0, 3) == after.byteslice(0, 3) &&
      before.scan(/\r\n|\r|\n/n) == after.scan(/\r\n|\r|\n/n)

    states[resource] = before
    puts "PASS D-#{stage[:d]} #{File.basename(stage[:manifest])}: " \
         "#{targets.length} Texto cells; #{original.length} ordered rows; " \
         "exact masked bytes, BOM/line endings, and #{provenance}"
  end
end

expected_start = {
  'affix' => '516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e',
  'base' => 'b5cd7ece89e1039a9bc7bc870bb7aa81eb61fd72f4e454dc3ec41651a5f968ac',
  'default' => 'f17ee0aee19bd5c1bd9a9681f235dcd8b6da3a063a40326af54ed73ed0926234'
}.freeze
states.each do |resource, bytes|
  actual = Digest::SHA256.hexdigest(bytes)
  raise "unexpected pre-D-20390 #{resource} hash: #{actual}" unless
    actual == expected_start.fetch(resource)
  puts "PASS reconstructed pre-D-20390 #{resource}: #{actual}"
end
puts "Verified #{stages.length} reviewed edit stages in reverse chronological order."
end

verify_full_chain if $PROGRAM_NAME == __FILE__
