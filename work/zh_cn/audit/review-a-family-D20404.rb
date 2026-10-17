#!/usr/bin/env ruby

require 'csv'
require 'json'

module AFamilyD20404
  DIR = File.expand_path(__dir__)
  OCCURRENCES = File.join(DIR, 'proper-name-occurrences.tsv')
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  MANIFEST = File.join(DIR, 'proper-name-edits-D20404.tsv')
  GROUPS = {
    'person:alyn' => 6,
    'person:ametair' => 43,
    'person:amfast' => 1
  }.freeze
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze
  FULL_ALYN = /(?:에린|앨린|에일린|알린|아린)\s+(?:시어|시르|쉬어|쉬르|셔)(?:\(Alyn Shir\))?/

  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def canonicalize(text, entity_key, row_key)
    case entity_key
    when 'person:alyn'
      text.gsub(FULL_ALYN, '앨린 시어(Alyn Shir)')
          .gsub(/(?:에린|앨린|에일린|알린|아린)(?:\(Alyn\))?(?!\s+(?:시어|시르|쉬어|쉬르|셔)|\()/,
                '앨린(Alyn)')
    when 'person:ametair'
      text.gsub(/아메(?:테어|타이르|타이어)(?:\(Ametair\))?/, '아메테어(Ametair)')
    when 'person:amfast'
      raise "unexpected Amfast scope #{row_key.inspect}" unless row_key == ['default', '32189', '']
      text.gsub(/(?:앤레드|안레드)\s+앰패스트(?:\(Anred Amfast\))?/,
                '안레드 앰패스트(Anred Amfast)')
    else
      raise "unexpected entity #{entity_key}"
    end
  end

  def evidence(entity_key)
    case entity_key
    when 'person:alyn'
      'English identifies Alyn or Alyn Shir; Japanese エリン・シアー and Chinese 阿琳·希尔 corroborate the identity. Standardized full-name and given-name mentions while preserving Korean particles.'
    when 'person:ametair'
      'English identifies Ametair in the Buru Boots/Lord of the Hunt context; Japanese アメター and Chinese 阿美泰尔 corroborate the name. Standardized spelling to 아메테어(Ametair).'
    when 'person:amfast'
      'English identifies Anred Amfast; Japanese アンレッド・アムファスト and Chinese 安瑞德·安姆法斯特 corroborate the full name. Matched the already-established Korean full-name form at default ID 32812.'
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

    selected = GROUPS.flat_map do |entity_key, _count|
      by_entity.fetch(entity_key).uniq.sort_by do |resource, id, variant|
        [{ 'affix' => 0, 'base' => 1, 'default' => 2 }.fetch(resource), id.to_i, variant]
      end.first(GROUPS.fetch(entity_key)).map { |row_key| [entity_key, row_key] }
    end
    raise "expected 50 unique row keys, found #{selected.map(&:last).uniq.length}" unless
      selected.map(&:last).uniq.length == 50

    rows = selected.map do |entity_key, row_key|
      source = inventory.fetch(row_key)
      old = source.fetch('work_text')
      occurrence = pending.find { |row| row.fetch('entity_key') == entity_key && key(row) == row_key }
      raise "stale occurrence at #{row_key.inspect}" unless occurrence.fetch('korean_current') == old
      new_text = canonicalize(old, entity_key, row_key)
      status = new_text == old ? 'not-an-issue' : 'accepted'
      [
        *row_key, entity_key, status, old, new_text, evidence(entity_key),
        JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n"),
        JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
        source.fetch('zh_text')
      ]
    end
    CSV.open(MANIFEST, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    puts "D-20404 manifest: #{rows.length} row keys; #{rows.group_by { |row| row[4] }.transform_values(&:length).inspect}"
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
  AFamilyD20404.build
when ['sync-index']
  AFamilyD20404.sync_index
else
  abort 'usage: review-a-family-D20404.rb build|sync-index'
end
