#!/usr/bin/env ruby

require 'csv'
require 'json'

module AFamilyD20405
  DIR = File.expand_path(__dir__)
  OCCURRENCES = File.join(DIR, 'proper-name-occurrences.tsv')
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  MANIFEST = File.join(DIR, 'proper-name-edits-D20405.tsv')
  GROUPS = {
    'person:amfast' => 5,
    'person:andronikos' => 34,
    'person:anela' => 11
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
    when 'person:amfast'
      if english.match?(/\bAnred Amfast\b/i)
        text = text.gsub(/(?:앤레드|안레드)\s+앰패스트(?:\(Anred Amfast\))?/,
                         '안레드 앰패스트(Anred Amfast)')
      end
      text.gsub(/(?<!안레드 )앰패스트(?!\()/, '앰패스트(Amfast)')
    when 'person:andronikos'
      text.gsub(/안드로니코스(?:\(Andronikos\))?(?:의)?\s*극장(?:\((?:The )?Theater of Andronikos\))?/,
                '안드로니코스 극장(Theater of Andronikos)')
          .gsub(/안드로니코스(?:\(Andronikos\))?\s+사부(?:\(Master Andronikos\))?/,
                '안드로니코스(Andronikos) 사부')
          .gsub(/안드로니코스(?:\(Andronikos\))?(?!\s*극장|\()/,
                '안드로니코스(Andronikos)')
    when 'person:anela'
      text.gsub(/아넬라\s+(?:세르그렌|서그렌)(?:\(Anela Cergren\))?/,
                '아넬라 세르그렌(Anela Cergren)')
          .gsub(/아넬라(?:\(Anela\))?(?!\s+(?:세르그렌|서그렌)|\()/,
                '아넬라(Anela)')
    else
      raise "unexpected entity #{entity_key}"
    end
  end

  def evidence(entity_key)
    case entity_key
    when 'person:amfast'
      'English identifies Anred Amfast or Amfast; Japanese アンレッド・アムファスト and Chinese 安瑞德·安姆法斯特 corroborate the name. Standardized the full name to 안레드 앰패스트(Anred Amfast) and the standalone surname to 앰패스트(Amfast).'
    when 'person:andronikos'
      'English identifies the Kollossae playwright Andronikos and the Theater of Andronikos; Japanese アンドロニコス and Chinese transliteration support the identity. Distinguished the person form 안드로니코스(Andronikos) from 안드로니코스 극장(Theater of Andronikos).'
    when 'person:anela'
      'English identifies Anela or Anela Cergren; Japanese アネラ and アネラ・サーグレン corroborate the identity. Standardized the given name to 아넬라(Anela) and full name to 아넬라 세르그렌(Anela Cergren).'
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
    puts "D-20405 manifest: #{rows.length} row keys; #{rows.group_by { |row| row[4] }.transform_values(&:length).inspect}"
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
  AFamilyD20405.build
when ['sync-index']
  AFamilyD20405.sync_index
else
  abort 'usage: review-a-family-D20405.rb build|sync-index'
end
