#!/usr/bin/env ruby

require 'csv'
require 'json'

module AFamilyD20407
  DIR = File.expand_path(__dir__)
  OCCURRENCES = File.join(DIR, 'proper-name-occurrences.tsv')
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  MANIFEST = File.join(DIR, 'proper-name-edits-D20407.tsv')
  GROUPS = {
    'person:anjar' => 3,
    'person:anokatos' => 47
  }.freeze
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze

  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def canonicalize(text, entity_key, english)
    case entity_key
    when 'person:anjar'
      if english.match?(/\bBor Anjar\b/i)
        text = text.gsub(/보르\s+안자르(?:\(Bor Anjar\))?/,
                         '보르 안자르(Bor Anjar)')
      end
      text.gsub(/안자르(?!\((?:Anjar|Bor Anjar)\))/,
                '안자르(Anjar)')
    when 'person:anokatos'
      text.gsub(/아노카토스(?!\(Anokatos\))/,
                '아노카토스(Anokatos)')
    else
      raise "unexpected entity #{entity_key}"
    end
  end

  def evidence(entity_key)
    case entity_key
    when 'person:anjar'
      'English identifies Anjar or Bor Anjar; Japanese reading and Chinese 博尔·安贾尔 corroborate the personal name. Standardized the standalone and full-name forms as 안자르(Anjar) and 보르 안자르(Bor Anjar).'
    when 'person:anokatos'
      'English identifies the Kollossae Primos Anokatos; Japanese アノカトス and Chinese 安诺卡托斯 corroborate the identity. Standardized each Korean name mention as 아노카토스(Anokatos), including attached particles and repeated mentions.'
    end
  end

  def build
    occurrences = CSV.read(OCCURRENCES, headers: true, col_sep: "\t")
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
      .to_h { |row| [key(row), row.to_h] }
    pending = occurrences.select do |row|
      GROUPS.key?(row.fetch('entity_key')) && row.fetch('status') == 'needs-context'
    end
    by_entity = pending.group_by { |row| row.fetch('entity_key') }
      .transform_values do |rows|
        rows.uniq { |row| key(row) }.sort_by do |row|
          resource, id, variant = key(row)
          [{ 'affix' => 0, 'base' => 1, 'default' => 2 }.fetch(resource),
           id.to_i, variant]
        end
      end
    selected = GROUPS.flat_map do |entity_key, count|
      rows = by_entity.fetch(entity_key, [])
      raise "#{entity_key}: expected #{count}, found #{rows.length}" if rows.length < count
      rows.first(count).map { |row| [entity_key, row] }
    end
    unique_keys = selected.map { |_entity, row| key(row) }.uniq
    raise "expected 50 unique row keys, found #{unique_keys.length}" unless unique_keys.length == 50

    rows = selected.map do |entity_key, occurrence|
      row_key = key(occurrence)
      source = inventory.fetch(row_key)
      old = source.fetch('work_text')
      raise "stale occurrence at #{row_key.inspect}" unless occurrence.fetch('korean_current') == old
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      new_text = canonicalize(old, entity_key, english)
      status = new_text == old ? 'not-an-issue' : 'accepted'
      [
        *row_key, entity_key, status, old, new_text, evidence(entity_key),
        english,
        JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
        source.fetch('zh_text')
      ]
    end
    CSV.open(MANIFEST, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    puts "D-20407 manifest: #{rows.length} keys; " \
         "#{rows.group_by { |row| row[4] }.transform_values(&:length).inspect}"
  end

  def sync_index
    manifest = CSV.read(MANIFEST, headers: true, col_sep: "\t")
    occurrences = CSV.read(OCCURRENCES, headers: true, col_sep: "\t")
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
      .to_h { |row| [key(row), row.to_h] }
    decisions = manifest.to_h do |row|
      [[row.fetch('entity_key'), *key(row)], row.to_h]
    end
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
    puts "Updated #{decisions.length} exact Anjar/Anokatos entity/row dispositions."
  end
end

case ARGV
when ['build']
  AFamilyD20407.build
when ['sync-index']
  AFamilyD20407.sync_index
else
  abort 'usage: review-a-family-D20407.rb build|sync-index'
end
