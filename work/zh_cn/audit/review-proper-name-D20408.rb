#!/usr/bin/env ruby

require 'csv'
require 'json'

module ProperNameD20408
  DIR = File.expand_path(__dir__)
  OCCURRENCES = File.join(DIR, 'proper-name-occurrences.tsv')
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  MANIFEST = File.join(DIR, 'proper-name-edits-D20408.tsv')
  ENTITY = 'person:anokatos'
  COUNT = 50
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze

  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def build
    occurrences = CSV.read(OCCURRENCES, headers: true, col_sep: "\t")
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
      .to_h { |row| [key(row), row.to_h] }
    pending = occurrences.select do |row|
      row.fetch('entity_key') == ENTITY && row.fetch('status') == 'needs-context'
    end.uniq { |row| key(row) }.sort_by do |row|
      resource, id, variant = key(row)
      [{ 'affix' => 0, 'base' => 1, 'default' => 2 }.fetch(resource),
       id.to_i, variant]
    end
    raise "expected #{COUNT} pending #{ENTITY} keys; found #{pending.length}" if
      pending.length < COUNT

    rows = pending.first(COUNT).map do |occurrence|
      row_key = key(occurrence)
      source = inventory.fetch(row_key)
      old = source.fetch('work_text')
      raise "stale occurrence at #{row_key.inspect}" unless
        occurrence.fetch('korean_current') == old
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      replacement = old.gsub(/아노카토스(?!\(Anokatos\))/,
                             '아노카토스(Anokatos)')
      status = replacement == old ? 'not-an-issue' : 'accepted'
      evidence = 'English identifies the Kollossae Primos Anokatos; Japanese アノカトス and Chinese 安诺卡托斯 corroborate the identity. Standardized every reviewed Korean mention as 아노카토스(Anokatos), including repeated mentions and attached particles.'
      [
        *row_key, ENTITY, status, old, replacement, evidence, english,
        JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
        source.fetch('zh_text')
      ]
    end
    CSV.open(MANIFEST, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    puts "D-20408 manifest: #{rows.length} keys; " \
         "#{rows.group_by { |row| row[4] }.transform_values(&:length).inspect}"
  end

  def sync_index
    manifest = CSV.read(MANIFEST, headers: true, col_sep: "\t")
    occurrences = CSV.read(OCCURRENCES, headers: true, col_sep: "\t")
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
      .to_h { |row| [key(row), row.to_h] }
    decisions = manifest.to_h { |row| [[row.fetch('entity_key'), *key(row)], row.to_h] }
    manifest.each do |review|
      source = inventory.fetch(key(review))
      raise "active text mismatch at #{key(review).inspect}" unless
        source.fetch('work_text') == review.fetch('new')
      review['english'] = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      review['japanese'] = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      review['chinese'] = source.fetch('zh_text')
    end
    occurrences.each do |row|
      row_key = key(row)
      row['korean_current'] = inventory.fetch(row_key).fetch('work_text')
      decision = decisions[[row.fetch('entity_key'), *row_key]]
      next unless decision
      row['status'] = decision.fetch('status')
      row['evidence'] = decision.fetch('evidence')
    end
    [[OCCURRENCES, occurrences, occurrences.headers],
     [MANIFEST, manifest, manifest.headers]].each do |path, rows, headers|
      CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
        csv << headers
        rows.each { |row| csv << headers.map { |header| row[header] } }
      end
    end
    puts "Updated #{decisions.length} exact Anokatos entity/row dispositions."
  end
end

case ARGV
when ['build']
  ProperNameD20408.build
when ['sync-index']
  ProperNameD20408.sync_index
else
  abort 'usage: review-proper-name-D20408.rb build|sync-index'
end
