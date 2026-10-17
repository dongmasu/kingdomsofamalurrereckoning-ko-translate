#!/usr/bin/env ruby

require 'csv'
require 'digest'
require 'json'

module PersonGMGadflow01
  AUDIT_DIR = File.expand_path(__dir__)
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  INDEX = File.join(AUDIT_DIR, 'proper-name-occurrences.tsv')
  GLOSSARY = File.join(AUDIT_DIR, 'proper-name-glossary.tsv')
  OUT = File.join(AUDIT_DIR, 'proper-name-reviewed-G-M-gadflow-01.tsv')
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze

  # Every row was checked in full across English, Japanese, Chinese, and Korean.
  # Same-row G-M entities share one decision and one final Korean string.
  DECISIONS = [
    [['person:gadflow'], 'default', '9', '', 'not-an-issue', [],
     'cb1ee6de4cce6a0aa123ea58c780536b57e2904940293b7e29872d89a767601f'],
    [['person:gadflow'], 'default', '130', '', 'not-an-issue', [],
     '1b80a847287fa2ddd0bcd1c7c13cd909d8fc4336ed9e85e26aee080030ba535f'],
    [['person:gadflow'], 'default', '314', '', 'accepted',
     [['가드플로는', '가드플로(Gadflow)는']],
     '3e0b4b78b97ba53bfc866361c294577d7d7615017dec46c050c414072aa228b8'],
    [['person:gadflow'], 'default', '342', '', 'accepted',
     [['가드플로가 어떤 자인지', '가드플로(Gadflow)가 어떤 자인지']],
     'b9049254e89b147e939ac34c9411d6de59eb1db01c656cca9fff802e1bbb1488'],
    [%w[person:gadflow person:gask], 'default', '349', '', 'accepted',
     [['가드플로의 연기', '가드플로(Gadflow)의 연기']],
     'a3e994e9369e9f79e1c2b2f0518aa618adbc0b46a5068277bb82305942af11cd'],
    [['person:gadflow'], 'default', '366', '', 'accepted',
     [['가드플로가 대가', '가드플로(Gadflow)가 대가']],
     'd144f25e6ba667333da7930e4eaffabd0306be16bc383b75dbc7c4297ca1b4e2'],
    [['person:gadflow'], 'default', '882', '', 'not-an-issue', [],
     '04809e8a4410cf648669865bb433fa51f1357563e609cdcfc3493769f26172f6'],
    [['person:gadflow'], 'default', '956', '', 'not-an-issue', [],
     '5723caceccce835663b0434610bdfabb4f0847ec232cffea5bbcc83d0d61d590'],
    [['person:gadflow'], 'default', '1253', '', 'not-an-issue', [],
     '094636c8db7de5b78bee3503736a8dd5468f20927cb122458999633eca1bed92'],
    [['person:gadflow'], 'default', '2701', '', 'not-an-issue', [],
     'c36ad799e7a75ce8495da37c36dceee5db2409eaa12843af8bda4c6869fa63a6'],
    [['person:gadflow'], 'default', '3044', '', 'not-an-issue', [],
     '048ac0af48286e0acf2c7ff7660a51aa836b6de6a0ab70848e0c0fd84952d628']
  ].freeze

  module_function

  def row_key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def fingerprint(row)
    [row['en_texts_json'], row['ja_texts_json'], row['zh_text'], row['work_text']].join("\0")
  end

  def apply_replacements(old_text, replacements, key)
    new_text = old_text.dup
    replacements.each do |before, after|
      count = new_text.scan(Regexp.new(Regexp.escape(before))).length
      raise "replacement fragment count #{count} at #{key.inspect}: #{before.inspect}" unless count == 1
      new_text.sub!(before, after)
    end
    new_text
  end

  def validate_text!(old_text, new_text, status, key)
    raise "non-accepted edit at #{key.inspect}" if status != 'accepted' && old_text != new_text
    raise "accepted no-op at #{key.inspect}" if status == 'accepted' && old_text == new_text
    old_text.scan(/\([^()\r\n]*\)/).each do |annotation|
      raise "lost source parenthetical at #{key.inspect}" unless new_text.include?(annotation)
    end
    raise "token change at #{key.inspect}" unless old_text.scan(/\{[^{}]*\}/) == new_text.scan(/\{[^{}]*\}/)
    raise "line-break change at #{key.inspect}" unless old_text.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)
    raise "unbalanced parentheses at #{key.inspect}" unless new_text.count('(') == new_text.count(')')
  end

  def source_texts(source)
    english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n---\n")
    japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
    [english, japanese, source.fetch('zh_text').to_s]
  end

  def run
    source_by_key = {}
    CSV.foreach(INVENTORY, headers: true, col_sep: "\t") do |row|
      key = row_key(row)
      raise "duplicate inventory key #{key.inspect}" if source_by_key.key?(key)
      source_by_key[key] = row
    end

    pending = {}
    CSV.foreach(INDEX, headers: true, col_sep: "\t") do |row|
      pending[[row.fetch('entity_key'), row_key(row)]] = row['status'] == 'needs-context'
    end
    glossary = {}
    CSV.foreach(GLOSSARY, headers: true, col_sep: "\t") do |row|
      glossary[row.fetch('entity_key')] = row
    end

    rows = []
    seen_keys = {}
    DECISIONS.each do |entity_keys, resource, id, variant, status, replacements, expected_fingerprint|
      key = [resource, id, variant]
      raise "duplicate decision key #{key.inspect}" if seen_keys[key]
      seen_keys[key] = true
      source = source_by_key[key]
      raise "inventory row missing #{key.inspect}" unless source
      entity_keys.each do |entity_key|
        entity = glossary[entity_key]
        raise "unconfirmed/out-of-scope entity #{entity_key}" unless
          entity && entity['category'] == 'person' && entity['status'] == 'confirmed'
        raise "not a G-M entity #{entity_key}" unless
          entity_key.match?(/\Aperson:[g-m]/i) || entity_key == 'person:gask'
        raise "not pending #{entity_key} at #{key.inspect}" unless pending[[entity_key, key]]
      end
      actual_fingerprint = Digest::SHA256.hexdigest(fingerprint(source))
      raise "stale source/context at #{key.inspect}; re-review before regeneration" unless
        actual_fingerprint == expected_fingerprint

      old_text = source.fetch('work_text')
      new_text = apply_replacements(old_text, replacements, key)
      validate_text!(old_text, new_text, status, key)
      english, japanese, chinese = source_texts(source)
      evidence = "Human-reviewed exact source row for #{entity_keys.join('|')}. English anchors the source name(s); Japanese and Chinese corroborate them. Canonical Korean spellings and existing full bilingual titles were checked in the full Korean row."
      rows << [
        *key, entity_keys.sort.join('|'), status, old_text, new_text, evidence,
        english, japanese, chinese
      ]
    end

    row_keys = rows.map { |row| row[0, 3] }
    raise 'duplicate reviewed resource/ID/variant key' unless row_keys.uniq.length == rows.length
    rows.sort_by! { |row| [row[0], row[1].to_i, row[2]] }
    CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    counts = Hash.new(0)
    rows.each { |row| counts[row[4]] += 1 }
    puts "Wrote #{rows.length} reviewed rows to #{OUT}; statuses=#{counts.inspect}"
  end
end

PersonGMGadflow01.run if $PROGRAM_NAME == __FILE__
