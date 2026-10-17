#!/usr/bin/env ruby

require 'csv'
require 'json'

module MagnusD20399
  DIR = File.expand_path(__dir__)
  OCCURRENCES = File.join(DIR, 'proper-name-occurrences.tsv')
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  PROPOSALS = File.join(DIR, 'proper-name-proposals-M-Z-D20397.tsv')
  MANIFEST = File.join(DIR, 'proper-name-edits-D20399.tsv')
  RELATED_KEYS = %w[
    person:magnus person:tyr person:tyr-magnus person:hroth-magnus
  ].freeze
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze
  EXCLUDED = {
    ['default', '8625', ''] => 'Magnus is the transferable Arena Grand Champion title here, not a personal-name occurrence.',
    ['default', '15137', ''] => 'Magnus modifies the family as a collective; this row does not identify the person Magnus.',
    ['default', '29812', ''] => 'Magnus denotes the Champion title in this comparison, not the person.'
  }.freeze

  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def canonicalize(text)
    text.gsub(/티르\s+마그누스(?!\()/, '티르 매그너스(Tyr Magnus)')
        .gsub(/티르\s+매그너스(?!\()/, '티르 매그너스(Tyr Magnus)')
        .gsub(/타이르\s+마그누스(?!\()/, '티르 매그너스(Tyr Magnus)')
        .gsub(/흐로스\s+마그누스(?!\()/, '흐로스 매그너스(Hroth Magnus)')
        .gsub(/흐로스\s+매그너스(?!\()/, '흐로스 매그너스(Hroth Magnus)')
        .gsub('흐로스 마그누스(Hroth Magnus)', '흐로스 매그너스(Hroth Magnus)')
        .gsub(/호스\s+매그너스(?!\()/, '흐로스 매그너스(Hroth Magnus)')
        .gsub(/흐로스\s+매그너스\((?!Hroth Magnus\))[^()\r\n]*\)/,
              '흐로스 매그너스(Hroth Magnus)')
  end

  def build
    occurrences = CSV.read(OCCURRENCES, headers: true, col_sep: "\t")
    candidates = CSV.read(PROPOSALS, headers: true, col_sep: "\t")
    candidate_by_key = candidates.to_h { |row| [key(row), row.to_h] }
    hits = occurrences.select do |row|
      row.fetch('entity_key').split('|').include?('person:magnus')
    end.first(50)
    raise "expected 50 indexed hits, found #{hits.length}" unless hits.length == 50
    raise 'selected hit keys are not unique' unless hits.map { |row| key(row) }.uniq.length == 50

    rows = hits.map do |hit|
      row_key = key(hit)
      candidate = candidate_by_key[row_key]
      if candidate && candidate.fetch('old') != hit.fetch('korean_current')
        raise "stale proposal at #{row_key.inspect}"
      end
      source = candidate || {
        'entity_key' => hit.fetch('entity_key'),
        'old' => hit.fetch('korean_current'),
        'new' => hit.fetch('korean_current'),
        'english' => hit.fetch('english_source'),
        'japanese' => '',
        'chinese' => ''
      }
      status = candidate ? candidate.fetch('status') : 'not-an-issue'
      new_text = candidate ? candidate.fetch('new') : source.fetch('old')
      evidence = 'D-20399 independent English-led review of the exact source row; Japanese and Chinese corroborated names and identity; full Korean row checked for name boundaries, titles, family references, and repeated mentions.'

      if (reason = EXCLUDED[row_key])
        status = 'excluded'
        new_text = source.fetch('old')
        evidence += " Excluded from the personal-name disposition: #{reason}"
      elsif row_key == ['default', '10842', '']
        status = 'accepted'
        new_text = canonicalize(source.fetch('old'))
        evidence += ' The memoir explicitly identifies Tyr Magnus and Hroth Magnus; canonical full-name forms were applied at each named mention.'
      elsif row_key == ['default', '18198', '']
        status = 'accepted'
        new_text = canonicalize(new_text)
        new_text = new_text.gsub('티르 매그너스:', '티르 매그너스(Tyr Magnus):')
        evidence += ' The betting list names Tyr Magnus repeatedly; each occurrence uses the single canonical full-name form.'
      elsif %w[6489 8770 24373].include?(row_key[1]) && row_key[0] == 'default'
        status = 'accepted'
        new_text = canonicalize(new_text)
        evidence += ' Both Tyr Magnus and Hroth Magnus are explicitly named in the title; each full name is annotated once per occurrence.'
      elsif row_key == ['default', '9280', '']
        status = 'accepted'
        new_text = canonicalize(source.fetch('old'))
        evidence += ' The row identifies Hroth Magnus; normalize and annotate the full name.'
      elsif row_key == ['default', '13972', '']
        status = 'accepted'
        new_text = canonicalize(source.fetch('old'))
        evidence += ' The existing Hroth Magnus annotation is correct; normalize its Korean component to the canonical form.'
      elsif candidate
        new_text = canonicalize(new_text)
        status = 'not-an-issue' if status == 'accepted' && new_text == source.fetch('old')
      end

      if status == 'uncertain'
        raise "unresolved row in bounded review: #{row_key.inspect}"
      end
      raise "invalid status #{status.inspect}" unless %w[accepted not-an-issue excluded].include?(status)
      if status != 'accepted'
        new_text = source.fetch('old')
      elsif new_text == source.fetch('old')
        status = 'not-an-issue'
      end

      entity_keys = if candidate
                      candidate.fetch('entity_key')
                    else
                      related = occurrences.select { |row| key(row) == row_key }
                      related.map { |row| row.fetch('entity_key') }.uniq.join('|')
                    end
      [
        *row_key, entity_keys, status, source.fetch('old'), new_text, evidence,
        source.fetch('english'), source.fetch('japanese'), source.fetch('chinese')
      ]
    end

    counts = rows.group_by { |row| row[0] }
      .transform_values { |group| group.group_by { |row| row[4] }.transform_values(&:length) }
    expected = {
      'base' => { 'accepted' => 1, 'not-an-issue' => 3 },
      'default' => { 'accepted' => 32, 'not-an-issue' => 11, 'excluded' => 3 }
    }
    raise "unexpected disposition counts: #{counts.inspect}" unless counts == expected
    edits = rows.select { |row| row[4] == 'accepted' }
    raise "expected 33 edits, got #{edits.length}" unless edits.length == 33
    CSV.open(MANIFEST, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    puts "D-20399 manifest: #{rows.length} rows, #{edits.length} accepted edits; #{counts.inspect}"
  end

  def sync_index
    manifest = CSV.read(MANIFEST, headers: true, col_sep: "\t")
    rows = CSV.read(OCCURRENCES, headers: true, col_sep: "\t")
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
    inventory_by_key = inventory.to_h { |row| [key(row), row.to_h] }
    dispositions = {}
    manifest.each do |row|
      row_key = key(row)
      source = inventory_by_key.fetch(row_key) do
        raise "review row missing from refreshed source inventory: #{row_key.inspect}"
      end
      raise "review text differs from active inventory: #{row_key.inspect}" unless
        source.fetch('work_text') == row.fetch('new')
      row['english'] = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n---\n")
      row['japanese'] = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      row['chinese'] = source.fetch('zh_text')
      related = rows.select { |occurrence| key(occurrence) == row_key }
        .map { |occurrence| occurrence.fetch('entity_key') }
        .select { |entity_key| RELATED_KEYS.include?(entity_key) }
      row['entity_key'] = (row.fetch('entity_key').split('|') & RELATED_KEYS)
        .concat(related).uniq.join('|')
      raise "Magnus occurrence missing from manifest row #{row_key.inspect}" unless
        row.fetch('entity_key').split('|').include?('person:magnus')
      row.fetch('entity_key').split('|').each do |entity_key|
        dispositions[[entity_key, *row_key]] = row
      end
    end
    rows.each do |row|
      row_key = key(row)
      review = dispositions[[row.fetch('entity_key'), *row_key]]
      next unless review
      row['korean_current'] = review.fetch('new')
      row['status'] = review.fetch('status')
      row['evidence'] = review.fetch('evidence')
      dispositions.delete([row.fetch('entity_key'), *row_key])
    end
    raise "manifest rows absent from occurrence index: #{dispositions.keys.first.inspect}" unless dispositions.empty?
    CSV.open(OCCURRENCES, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << rows.headers
      rows.each { |row| csv << rows.headers.map { |header| row[header] } }
    end
    CSV.open(MANIFEST, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << manifest.headers
      manifest.each { |row| csv << manifest.headers.map { |header| row[header] } }
    end
    puts "Occurrence index updated from D-20399: #{manifest.length} reviewed row keys."
  end
end

case ARGV
when ['build']
  MagnusD20399.build
when ['sync-index']
  MagnusD20399.sync_index
else
  abort 'usage: review-magnus-D20399.rb build|sync-index'
end
