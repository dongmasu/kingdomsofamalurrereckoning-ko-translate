#!/usr/bin/env ruby

require 'csv'
require 'json'

module AFamilyD20401
  DIR = File.expand_path(__dir__)
  OCCURRENCES = File.join(DIR, 'proper-name-occurrences.tsv')
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  MANIFEST = File.join(DIR, 'proper-name-edits-D20401.tsv')
  ENTITIES = %w[person:alfarinn person:alisen person:alleia person:aloff].freeze
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze
  RESOURCE_ORDER = { 'affix' => 0, 'base' => 1, 'default' => 2 }.freeze

  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def canonicalize(text, entity_key, row_key)
    case entity_key
    when 'person:alfarinn'
      text.gsub(/(?:에이사|아이사|에사)\s+알파린(?:\(Aesa Alfarinn\))?/,
                '에이사 알파린(Aesa Alfarinn)')
    when 'person:alisen'
      return text if row_key == ['default', '5083', '']
      text.gsub(/(?:알리센|앨리슨)(?:\(Alisen\))?/, '앨리슨(Alisen)')
    when 'person:alleia'
      text.gsub(/(?:알레이아|아레이아)(?:\(Alleia\))?/, '알레이아(Alleia)')
    when 'person:aloff'
      text
    else
      raise "unexpected entity #{entity_key}"
    end
  end

  def evidence(entity_key)
    case entity_key
    when 'person:alfarinn'
      'English identifies Aesa Alfarinn or Alfarinn; Japanese エイサ・アルファリン and Chinese 艾萨·阿尔法林 support the canonical 에이사 알파린(Aesa Alfarinn) form. Repeated and standalone name labels were checked.'
    when 'person:alisen'
      'English identifies Alisen; Japanese アリセン and Chinese 艾莉森 corroborate the name. Standardized the Korean form to 앨리슨(Alisen); the already bilingual full name Alisen Seawine was retained.'
    when 'person:alleia'
      'English identifies Alleia; Japanese アレイア and Chinese 艾莉亚 corroborate the reading. Standardized all mentions to 알레이아(Alleia), including affix variants.'
    when 'person:aloff'
      'The existing 알로프(Aloff) already matches the English name and Japanese/Chinese readings; no change is needed.'
    end
  end

  def build
    occurrences = CSV.read(OCCURRENCES, headers: true, col_sep: "\t")
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
      .to_h { |row| [key(row), row.to_h] }
    pending = occurrences.select do |row|
      ENTITIES.include?(row.fetch('entity_key')) &&
        row.fetch('status') == 'needs-context'
    end
    keys_by_entity = pending.group_by { |row| row.fetch('entity_key') }
      .transform_values { |rows| rows.map { |row| key(row) }.uniq }
    expected = {
      'person:alfarinn' => 17, 'person:alisen' => 9,
      'person:alleia' => 23, 'person:aloff' => 9
    }
    expected.each do |entity_key, count|
      actual = keys_by_entity.fetch(entity_key, []).length
      raise "#{entity_key}: expected #{count} pending keys, found #{actual}" unless actual == count
    end

    selected = ENTITIES.flat_map do |entity_key|
      keys_by_entity.fetch(entity_key).sort_by do |resource, id, variant|
        [RESOURCE_ORDER.fetch(resource), id.to_i, variant]
      end.map { |row_key| [row_key, entity_key] }
    end.first(50)
    row_keys = selected.map(&:first).uniq
    raise "expected 50 distinct row keys, found #{row_keys.length}" unless row_keys.length == 50

    rows = selected.map do |row_key, entity_key|
      source = inventory.fetch(row_key)
      old = source.fetch('work_text')
      occurrence = pending.find do |row|
        key(row) == row_key && row.fetch('entity_key') == entity_key
      end
      raise "stale occurrence at #{row_key.inspect}" unless
        occurrence && occurrence.fetch('korean_current') == old
      new_text = canonicalize(old, entity_key, row_key)
      status = new_text == old ? 'not-an-issue' : 'accepted'
      [
        *row_key, entity_key, status, old, new_text, evidence(entity_key),
        JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n"),
        JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
        source.fetch('zh_text')
      ]
    end
    counts = rows.group_by { |row| row[4] }.transform_values(&:length)
    CSV.open(MANIFEST, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    puts "D-20401 manifest: #{rows.length} row keys; #{counts.inspect}"
  end

  def sync_index
    manifest = CSV.read(MANIFEST, headers: true, col_sep: "\t")
    occurrences = CSV.read(OCCURRENCES, headers: true, col_sep: "\t")
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
      .to_h { |row| [key(row), row.to_h] }
    decisions = manifest.to_h { |row| [[row.fetch('entity_key'), *key(row)], row.to_h] }
    manifest.each do |review|
      row_key = key(review)
      source = inventory.fetch(row_key)
      raise "inventory mismatch at #{row_key.inspect}" unless
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
      if row.fetch('status') != 'needs-context'
        raise "conflicting prior terminal decision #{key(row).inspect}" unless
          row.fetch('status') == decision.fetch('status') &&
          row.fetch('evidence') == decision.fetch('evidence')
      end
      row['korean_current'] = decision.fetch('new')
      row['status'] = decision.fetch('status')
      row['evidence'] = decision.fetch('evidence')
    end
    CSV.open(OCCURRENCES, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << occurrences.headers
      occurrences.each { |row| csv << occurrences.headers.map { |header| row[header] } }
    end
    CSV.open(MANIFEST, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << manifest.headers
      manifest.each { |row| csv << manifest.headers.map { |header| row[header] } }
    end
    puts "Updated #{decisions.length} exact entity/row dispositions."
  end
end

case ARGV
when ['build']
  AFamilyD20401.build
when ['sync-index']
  AFamilyD20401.sync_index
else
  abort 'usage: review-a-family-D20401.rb build|sync-index'
end
