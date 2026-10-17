#!/usr/bin/env ruby

require 'csv'
require 'json'

module MagnusD20400
  DIR = File.expand_path(__dir__)
  OCCURRENCES = File.join(DIR, 'proper-name-occurrences.tsv')
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  PROPOSALS = File.join(DIR, 'proper-name-proposals-M-Z-D20397.tsv')
  MANIFEST = File.join(DIR, 'proper-name-edits-D20400.tsv')
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze
  FULL_NAMES = {
    /(?:흐로스|호스)\s+(?:마그누스|매그너스)(?:\(Hroth Magnus\))?/ =>
      '흐로스 매그너스(Hroth Magnus)',
    /(?:티르|타이르)\s+(?:마그누스|매그너스)(?:\(Tyr Magnus\))?/ =>
      '티르 매그너스(Tyr Magnus)'
  }.freeze
  CONTEXTUAL_NAMES = {
    ['default', '34335', ''] =>
      '흐로스 매그너스(Hroth Magnus) 이후로 너처럼 싸우는 사람은 처음 봤어. 아, 그 초대 챔피언 말이야. 네가 함께 싸워 줘서 다행이었어.',
    ['default', '42767', ''] =>
      '초대 흐로스 매그너스(Hroth Magnus)가 페이에게서 투기장을 쟁취한 뒤로 계속 그래 왔어.',
    ['default', '61822', ''] =>
      '우리는 챔피언의 귀환을 기다리고 있다. 필멸자 흐로스 매그너스(Hroth Magnus)에게 패한 뒤 아직 돌아오지 않았다.'
  }.freeze

  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def canonicalize(text, row_key)
    # The full English title already identifies Magnus at this row.
    return text if row_key == ['default', '51049', '']
    return CONTEXTUAL_NAMES.fetch(row_key) if CONTEXTUAL_NAMES.key?(row_key)

    result = text.dup
    FULL_NAMES.each { |pattern, replacement| result.gsub!(pattern, replacement) }
    result.gsub(/(?<!흐로스 )(?<!티르 )(?:마그누스|매그너스)(?!\()/,
                '매그너스(Magnus)')
  end

  def build
    occurrences = CSV.read(OCCURRENCES, headers: true, col_sep: "\t")
    proposals = CSV.read(PROPOSALS, headers: true, col_sep: "\t")
      .to_h { |row| [key(row), row.to_h] }
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
      .to_h { |row| [key(row), row.to_h] }
    pending = occurrences.select do |row|
      row.fetch('entity_key').split('|').include?('person:magnus') &&
        row.fetch('status') == 'needs-context'
    end
    row_keys = pending.map { |row| key(row) }.uniq
    raise "expected 48 distinct remaining row keys, found #{row_keys.length}" unless row_keys.length == 48

    rows = row_keys.map do |row_key|
      related = pending.select { |row| key(row) == row_key }
      source = inventory.fetch(row_key)
      old = source.fetch('work_text')
      raise "stale occurrence text at #{row_key.inspect}" unless
        related.all? { |row| row.fetch('korean_current') == old }
      proposal = proposals[row_key]
      if proposal && proposal.fetch('old') != old
        raise "stale proposal at #{row_key.inspect}"
      end
      new_text = canonicalize(old, row_key)
      status = new_text == old ? 'not-an-issue' : 'accepted'
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      evidence = if CONTEXTUAL_NAMES.key?(row_key)
                   'English context identifies the first/mortal Magnus as Hroth Magnus; Japanese and Chinese confirm the first Magnus reading. Use the glossary full-name form.'
                 elsif row_key == ['default', '51049', '']
                   'The Korean label already includes the complete English title Magnus’ Trickery; adding a separate component annotation would duplicate the title.'
                 elsif row_key == ['default', '63582', '']
                   'English calls the person Old Magnus; Japanese and Chinese preserve the same reference. Keep the generic Magnus identity rather than guessing a full name.'
                 else
                   'Independently checked the exact English row for personal-name boundaries and repeated mentions; Japanese and Chinese corroborate the referenced identity. Applied only the established Magnus, Tyr Magnus, or Hroth Magnus Korean-English form.'
                 end
      [
        *row_key,
        related.map { |row| row.fetch('entity_key') }.uniq.join('|'),
        status, old, new_text, evidence, english, japanese, chinese
      ]
    end

    raise 'unexpected resource outside default' unless rows.all? { |row| row[0] == 'default' }
    counts = rows.group_by { |row| row[4] }.transform_values(&:length)
    accepted = rows.count { |row| row[4] == 'accepted' }
    CSV.open(MANIFEST, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    puts "D-20400 manifest: #{rows.length} distinct rows; #{counts.inspect}; #{accepted} edits"
  end

  def sync_index
    manifest = CSV.read(MANIFEST, headers: true, col_sep: "\t")
    occurrences = CSV.read(OCCURRENCES, headers: true, col_sep: "\t")
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
      .to_h { |row| [key(row), row.to_h] }
    decisions = manifest.to_h { |row| [key(row), row.to_h] }

    manifest.each do |review|
      row_key = key(review)
      source = inventory.fetch(row_key)
      raise "active inventory mismatch at #{row_key.inspect}" unless
        source.fetch('work_text') == review.fetch('new')
      review['english'] = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      review['japanese'] = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      review['chinese'] = source.fetch('zh_text')
      related_people = occurrences.select do |row|
        key(row) == row_key && row.fetch('entity_key').start_with?('person:')
      end
      raise "person occurrence missing at #{row_key.inspect}" if related_people.empty?
      related_people.each do |row|
        raise "unexpected prior disposition at #{row_key.inspect}" unless
          row.fetch('status') == 'needs-context'
        row['korean_current'] = review.fetch('new')
        row['status'] = review.fetch('status')
        row['evidence'] = review.fetch('evidence')
      end
      review['entity_key'] = related_people.map { |row| row.fetch('entity_key') }.uniq.join('|')
    end

    CSV.open(OCCURRENCES, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << occurrences.headers
      occurrences.each { |row| csv << occurrences.headers.map { |header| row[header] } }
    end
    CSV.open(MANIFEST, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << manifest.headers
      manifest.each { |row| csv << manifest.headers.map { |header| row[header] } }
    end
    puts "Updated #{manifest.length} row decisions and linked person-entity occurrences."
  end
end

case ARGV
when ['build']
  MagnusD20400.build
when ['sync-index']
  MagnusD20400.sync_index
else
  abort 'usage: review-magnus-D20400.rb build|sync-index'
end
