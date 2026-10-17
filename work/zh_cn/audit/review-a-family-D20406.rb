#!/usr/bin/env ruby

require 'csv'
require 'json'

module AFamilyD20406
  DIR = File.expand_path(__dir__)
  OCCURRENCES = File.join(DIR, 'proper-name-occurrences.tsv')
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  MANIFEST = File.join(DIR, 'proper-name-edits-D20406.tsv')
  GROUPS = {
    'person:anela' => 45,
    'person:anjar' => 5
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
    when 'person:anela'
      text.gsub(/아넬라\s+(?:세르그렌|서그렌)(?:\(Anela Cergren\))?/,
                '아넬라 세르그렌(Anela Cergren)')
          .gsub(/아넬라(?:\(Anela\))?(?!\s+(?:세르그렌|서그렌)|\()/,
                '아넬라(Anela)')
    when 'person:anjar'
      if english.match?(/\bBor Anjar\b/i)
        text = text.gsub(/(?:보르|보)\s+안자르(?:\(Bor Anjar\))?/,
                         '보르 안자르(Bor Anjar)')
      end
      text.gsub(/(?<!보르 )안자르(?!\()/, '안자르(Anjar)')
    else
      raise "unexpected entity #{entity_key}"
    end
  end

  def evidence(entity_key)
    case entity_key
    when 'person:anela'
      'English identifies Anela or Anela Cergren; Japanese アネラ and アネラ・サーグレン and Chinese locale evidence corroborate the identity. Standardized the given name to 아넬라(Anela) and full name to 아넬라 세르그렌(Anela Cergren).'
    when 'person:anjar'
      'English identifies Anjar or Bor Anjar; Chinese 博尔·安贾尔 and Japanese locale evidence corroborate Bor Anjar. Standardized the full name to 보르 안자르(Bor Anjar) and the standalone name to 안자르(Anjar).'
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
      .transform_values { |rows| rows.map { |row| key(row) }.uniq }
    GROUPS.each do |entity_key, count|
      actual = by_entity.fetch(entity_key, []).length
      raise "#{entity_key}: expected at least #{count} pending keys, found #{actual}" if actual < count
    end

    selected = GROUPS.flat_map do |entity_key, count|
      by_entity.fetch(entity_key).uniq.sort_by do |resource, id, variant|
        [{ 'affix' => 0, 'base' => 1, 'default' => 2 }.fetch(resource), id.to_i, variant]
      end.first(count).map { |row_key| [entity_key, row_key] }
    end
    raise "expected 50 unique row keys, found #{selected.map(&:last).uniq.length}" unless
      selected.map(&:last).uniq.length == 50

    rows = selected.map do |entity_key, row_key|
      source = inventory.fetch(row_key)
      old = source.fetch('work_text')
      occurrence = pending.find { |row| row.fetch('entity_key') == entity_key && key(row) == row_key }
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
    puts "D-20406 manifest: #{rows.length} row keys; #{rows.group_by { |row| row[4] }.transform_values(&:length).inspect}"
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
    [[OCCURRENCES, occurrences, occurrences.headers],
     [MANIFEST, manifest, manifest.headers]].each do |path, rows, headers|
      CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
        csv << headers
        rows.each { |row| csv << headers.map { |header| row[header] } }
      end
    end
    puts "Updated #{decisions.length} exact A-family entity/row dispositions."
  end
end

case ARGV
when ['build']
  AFamilyD20406.build
when ['sync-index']
  AFamilyD20406.sync_index
else
  abort 'usage: review-a-family-D20406.rb build|sync-index'
end
