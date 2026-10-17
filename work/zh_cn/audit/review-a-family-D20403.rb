#!/usr/bin/env ruby

require 'csv'
require 'json'

module AFamilyD20403
  DIR = File.expand_path(__dir__)
  OCCURRENCES = File.join(DIR, 'proper-name-occurrences.tsv')
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  MANIFEST = File.join(DIR, 'proper-name-edits-D20403.tsv')
  ENTITY = 'person:alyn'
  COUNT = 50
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze
  FULL_ALYN = /(?:에린|앨린|에일린|알린|아린)\s+(?:시어|시르|쉬어|쉬르|셔)(?:\(Alyn Shir\))?/

  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def canonicalize(text)
    text.gsub(FULL_ALYN, '앨린 시어(Alyn Shir)')
        .gsub(/(?:에린|앨린|에일린|알린|아린)(?:\(Alyn\))?(?!\s+(?:시어|시르|쉬어|쉬르|셔)|\()/,
              '앨린(Alyn)')
  end

  def build
    occurrences = CSV.read(OCCURRENCES, headers: true, col_sep: "\t")
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
      .to_h { |row| [key(row), row.to_h] }
    pending = occurrences.select do |row|
      row.fetch('entity_key') == ENTITY && row.fetch('status') == 'needs-context'
    end
    keys = pending.map { |row| key(row) }.uniq.sort_by do |resource, id, variant|
      [{ 'affix' => 0, 'base' => 1, 'default' => 2 }.fetch(resource), id.to_i, variant]
    end
    raise "expected at least #{COUNT} pending Alyn keys, found #{keys.length}" if keys.length < COUNT
    selected = keys.first(COUNT)
    rows = selected.map do |row_key|
      source = inventory.fetch(row_key)
      occurrence = pending.find { |row| key(row) == row_key }
      old = source.fetch('work_text')
      raise "stale occurrence at #{row_key.inspect}" unless occurrence.fetch('korean_current') == old
      new_text = canonicalize(old)
      status = new_text == old ? 'not-an-issue' : 'accepted'
      [
        *row_key, ENTITY, status, old, new_text,
        'English identifies Alyn or Alyn Shir; Japanese エリン・シアー and Chinese 阿琳·希尔 corroborate the identity. Standardized full-name mentions to 앨린 시어(Alyn Shir) and given-name mentions to 앨린(Alyn), preserving Korean particles.',
        JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n"),
        JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
        source.fetch('zh_text')
      ]
    end
    CSV.open(MANIFEST, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    puts "D-20403 manifest: #{rows.length} row keys; #{rows.group_by { |row| row[4] }.transform_values(&:length).inspect}"
  end

  def sync_index
    manifest = CSV.read(MANIFEST, headers: true, col_sep: "\t")
    occurrences = CSV.read(OCCURRENCES, headers: true, col_sep: "\t")
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
      .to_h { |row| [key(row), row.to_h] }
    decisions = manifest.to_h { |row| [[row.fetch('entity_key'), *key(row)], row.to_h] }
    manifest.each do |review|
      source = inventory.fetch(key(review))
      raise "inventory mismatch at #{key(review).inspect}" unless source.fetch('work_text') == review.fetch('new')
      review['english'] = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      review['japanese'] = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      review['chinese'] = source.fetch('zh_text')
    end
    occurrences.each do |row|
      row_key = key(row)
      row['korean_current'] = inventory.fetch(row_key).fetch('work_text')
      decision = decisions[[row.fetch('entity_key'), *row_key]]
      next unless decision
      row['korean_current'] = decision.fetch('new')
      row['status'] = decision.fetch('status')
      row['evidence'] = decision.fetch('evidence')
    end
    [ [OCCURRENCES, occurrences, occurrences.headers],
      [MANIFEST, manifest, manifest.headers] ].each do |path, rows, headers|
      CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
        csv << headers
        rows.each { |row| csv << headers.map { |header| row[header] } }
      end
    end
    puts "Updated #{decisions.length} exact Alyn entity/row dispositions."
  end
end

case ARGV
when ['build']
  AFamilyD20403.build
when ['sync-index']
  AFamilyD20403.sync_index
else
  abort 'usage: review-a-family-D20403.rb build|sync-index'
end
