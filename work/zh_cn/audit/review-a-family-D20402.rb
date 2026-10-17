#!/usr/bin/env ruby

require 'csv'
require 'json'

module AFamilyD20402
  DIR = File.expand_path(__dir__)
  OCCURRENCES = File.join(DIR, 'proper-name-occurrences.tsv')
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  MANIFEST = File.join(DIR, 'proper-name-edits-D20402.tsv')
  GROUPS = { 'person:aloff' => 8, 'person:alyn' => 42 }.freeze
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze
  FULL_ALYN = /(?:에린|앨린|에일린|알린|아린)\s+(?:시어|시르|쉬어|쉬르|셔)(?:\(Alyn Shir\))?/

  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def canonicalize(text, entity_key)
    case entity_key
    when 'person:aloff'
      text.gsub(/사냥꾼\s+알로프(?:\(Aloff(?: the Hunter)?\))?/,
                '사냥꾼 알로프(Aloff)')
          .gsub(/(?<!사냥꾼 )알로프(?!\()/, '알로프(Aloff)')
    when 'person:alyn'
      text.gsub(FULL_ALYN, '앨린 시어(Alyn Shir)')
          .gsub(/(?:에린|앨린|에일린|알린|아린)(?:\(Alyn\))?(?!\s+(?:시어|시르|쉬어|쉬르|셔)|\()/,
                '앨린(Alyn)')
    else
      raise "unexpected entity #{entity_key}"
    end
  end

  def evidence(entity_key)
    if entity_key == 'person:aloff'
      'English identifies Aloff, sometimes with the translated epithet the Hunter; Japanese アロフ and Chinese 阿洛夫 corroborate the name. Standardized the name annotation to 알로프(Aloff).'
    else
      'English identifies Alyn or Alyn Shir; Japanese エリン・シアー and Chinese 阿琳·希尔 corroborate the identity. Standardized full-name mentions to 앨린 시어(Alyn Shir) and given-name mentions to 앨린(Alyn).'
    end
  end

  def build
    occurrences = CSV.read(OCCURRENCES, headers: true, col_sep: "\t")
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
      .to_h { |row| [key(row), row.to_h] }
    pending = occurrences.select do |row|
      GROUPS.key?(row.fetch('entity_key')) &&
        row.fetch('status') == 'needs-context'
    end
    keys_by_entity = pending.group_by { |row| row.fetch('entity_key') }
      .transform_values { |rows| rows.map { |row| key(row) }.uniq }
    GROUPS.each do |entity_key, count|
      actual = keys_by_entity.fetch(entity_key, []).length
      valid_count = entity_key == 'person:aloff' ? actual == count : actual >= count
      raise "#{entity_key}: expected at least #{count} pending keys, found #{actual}" unless valid_count
    end

    selected = GROUPS.flat_map do |entity_key, count|
      keys_by_entity.fetch(entity_key).sort_by do |resource, id, variant|
        [resource, id.to_i, variant]
      end.first(count).map { |row_key| [entity_key, row_key] }
    end
    row_keys = selected.map(&:last)
    raise 'selected row keys are not unique' unless row_keys.uniq.length == 50

    rows = selected.map do |entity_key, row_key|
      source = inventory.fetch(row_key)
      old = source.fetch('work_text')
      occurrence = pending.find do |row|
        row.fetch('entity_key') == entity_key && key(row) == row_key
      end
      raise "stale occurrence at #{row_key.inspect}" unless
        occurrence && occurrence.fetch('korean_current') == old
      new_text = canonicalize(old, entity_key)
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
    puts "D-20402 manifest: #{rows.length} row keys; #{counts.inspect}"
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
        raise "conflicting prior terminal decision #{row_key.inspect}" unless
          row.fetch('status') == decision.fetch('status') &&
          row.fetch('evidence') == decision.fetch('evidence')
      end
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
    puts "Updated 50 exact entity/row dispositions and aligned active text snapshots."
  end
end

case ARGV
when ['build']
  AFamilyD20402.build
when ['sync-index']
  AFamilyD20402.sync_index
else
  abort 'usage: review-a-family-D20402.rb build|sync-index'
end
