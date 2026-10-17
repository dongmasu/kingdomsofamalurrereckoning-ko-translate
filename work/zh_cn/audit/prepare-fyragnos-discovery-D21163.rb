#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
inventory = m.refresh_inventory

specs = [
  [
    'monster:fyragnos', 'Fyragnos', '피라그노스(Fyragnos)', '', 'monster',
    'English identifies Fyragnos as a named Niskaru Lord/creature. Japanese consistently uses フィラグノス and Chinese 弗拉格诺斯, corroborating the identity and supporting the established Korean form 피라그노스. Standardize only exact source-matched name occurrences; preserve creature pronouns, ranks, particles, and surrounding claims.'
  ],
  [
    'place:tomb-of-fyragnos', 'Tomb of Fyragnos',
    '피라그노스의 무덤(Tomb of Fyragnos)', '', 'place',
    'English identifies the Tomb of Fyragnos as the named underground ruin/catacomb beneath the canyon and Marches. Japanese フィラグノスの墓所 and Chinese 弗拉格诺斯之墓 corroborate the place. Pair the complete place name atomically; do not nest a second Fyragnos label inside it.'
  ],
  [
    'unique-item:psalm-to-fyragnos', 'Psalm to Fyragnos',
    '피라그노스를 위한 찬가(Psalm to Fyragnos)', '', 'unique item',
    'English names the carried psalm and the matching complete item label. Japanese フィラグノス賛歌 and Chinese 献给弗拉格诺斯的诗/诗篇 support the named work. Preserve the Korean chant/document meaning and pair the complete title atomically.'
  ],
  [
    'unique-item:ring-of-fyragnos', 'Ring of Fyragnos',
    '피라그노스의 반지(Ring of Fyragnos)', '', 'unique item',
    'English supplies the complete named ring label. Japanese フィラグノスの指輪 and Chinese 弗拉格诺斯之戒 corroborate it. Pair the complete item title atomically rather than nesting the personal-name label.'
  ],
  [
    'unique-item:tomb-of-fyragnos-key', 'Tomb of Fyragnos Key',
    '피라그노스의 무덤 열쇠(Tomb of Fyragnos Key)', '', 'unique item',
    'English supplies the complete key label; Japanese フィラグノスの墓所の鍵 and Chinese 弗拉格诺斯之墓钥匙 corroborate the referent. Pair the whole item title atomically and keep it distinct from the Tomb place name.'
  ],
  [
    'title:fyragnos-wish', "Fyragnos' Wish",
    "피라그노스의 소원(Fyragnos' Wish)", '', 'title',
    "English identifies the complete title Fyragnos' Wish. Japanese フィラグノスの望み and Chinese 弗拉格诺斯的愿望 corroborate its meaning. Pair the complete title atomically."
  ],
  [
    'title:fyragnos-comes',
    'Fyragnos Comes ‒ Why the Marches are colored red.',
    '피라그노스의 도래 ‒ 황무지가 붉게 물든 까닭(Fyragnos Comes ‒ Why the Marches are colored red.)',
    '', 'title',
    'English supplies the complete book/title label. Japanese フィラグノスの到来: なぜマーチズが赤く染まったのか and Chinese 弗拉格诺斯来了 ‒ 为什么边境被染成了红色 corroborate the title and its relation to the Marches. Preserve the existing Korean subtitle wording; pair the full title atomically without inferring a new regional label.'
  ]
].freeze

definitions = specs.map do |entity, english, korean, aliases, category, note|
  values = {
    'entity_key' => entity,
    'english_canonical' => english,
    'category' => category,
    'korean_canonical' => korean,
    'english_aliases' => aliases,
    'korean_variants' => '',
    'evidence_ids' => 'D-21163-D-21164',
    'status' => 'confirmed',
    'notes' => note
  }
  m.table(ReviewedProperNameDiscovery::GLOSSARY).headers
    .to_h { |header| [header, values[header]] }
end

generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
counts = generated.group_by { |row| row.fetch('entity_key') }
  .transform_values { |rows| rows.map { |row| m.key(row) }.uniq.length }
expected_counts = {
  'monster:fyragnos' => 81,
  'place:tomb-of-fyragnos' => 25,
  'unique-item:psalm-to-fyragnos' => 2,
  'unique-item:ring-of-fyragnos' => 1,
  'unique-item:tomb-of-fyragnos-key' => 1,
  'title:fyragnos-wish' => 1,
  'title:fyragnos-comes' => 1
}
raise "unexpected source counts: #{counts.inspect}" unless counts == expected_counts

by_key = generated.group_by { |row| m.key(row) }
reviews = by_key.keys.sort_by do |resource, id, variant|
  [m::RESOURCES.index(resource), id.to_i, variant]
end.map do |key|
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
  chinese = source.fetch('zh_text')
  raise "missing aligned language evidence: #{key.inspect}" if
    [english, japanese, chinese].any?(&:empty?)

  text = source.fetch('work_text').dup
  protected = {}
  protect = lambda do |pattern, replacement|
    text.gsub!(pattern) do |match|
      token = "\u0001PN#{protected.length}\u0002"
      protected[token] = replacement
      token
    end
  end

  name = '(?:피라그노스|퓌라그노스|파이라그노스|필라그노스)(?:\\(Fyragnos\\))?'
  protect.call(
    /#{name}의\s*무덤\s*열쇠(?:\(Tomb of Fyragnos Key\))?/,
    '피라그노스의 무덤 열쇠(Tomb of Fyragnos Key)'
  )
  protect.call(
    /#{name}의\s*(?:무덤|묘)(?:\(Tomb of Fyragnos\))?/,
    '피라그노스의 무덤(Tomb of Fyragnos)'
  )
  protect.call(
    /#{name}(?:를|을)\s*위한\s*찬가(?:\(Psalm to Fyragnos\))?/,
    '피라그노스를 위한 찬가(Psalm to Fyragnos)'
  )
  protect.call(
    /#{name}\s*찬가(?:\(Psalm to Fyragnos\))?/,
    '피라그노스를 위한 찬가(Psalm to Fyragnos)'
  )
  protect.call(
    /#{name}의\s*반지(?:\(Ring of Fyragnos\))?/,
    '피라그노스의 반지(Ring of Fyragnos)'
  )
  protect.call(
    /#{name}의\s*소원(?:\(Fyragnos' Wish\))?/,
    "피라그노스의 소원(Fyragnos' Wish)"
  )
  protect.call(
    /피라그노스의 도래\s*‒\s*황무지가 붉게 물든 까닭(?:\(Fyragnos Comes ‒ Why the Marches are colored red\.\))?/,
    '피라그노스의 도래 ‒ 황무지가 붉게 물든 까닭(Fyragnos Comes ‒ Why the Marches are colored red.)'
  ) if english.include?('Fyragnos Comes ‒ Why the Marches are colored red.')

  text.gsub!(
    /(?:피라그노스|퓌라그노스|파이라그노스|필라그노스)(?:\(Fyragnos\))?/,
    '피라그노스(Fyragnos)'
  )
  protected.each { |token, replacement| text.gsub!(token, replacement) }

  entities = by_key.fetch(key).map { |row| row.fetch('entity_key') }.sort
  entity_dispositions = entities.to_h do |entity|
    [entity, text == source.fetch('work_text') ? 'not-an-issue' : 'accepted']
  end
  status = text == source.fetch('work_text') ? 'not-an-issue' : 'accepted'
  notes = specs.to_h { |spec| [spec[0], spec[5]] }
  evidence = entities.map { |entity| notes.fetch(entity) }.uniq.join(' ')
  evidence += ' English is the identity/meaning authority; aligned Japanese is the primary pronunciation/register cross-check and Chinese is corroborative only. Only bounded, source-matched name/title spans change; preserve all unrelated wording and prior entity decisions.'
  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'),
    'status' => status,
    'old' => source.fetch('work_text'),
    'new' => text,
    'evidence' => evidence,
    'english' => english,
    'japanese' => japanese,
    'chinese' => chinese,
    'entity_dispositions_json' => JSON.generate(entity_dispositions)
  }
end

raise 'expected 81 distinct source row keys' unless reviews.length == 81
raise 'unexpected row resource counts' unless
  reviews.group_by { |row| row.fetch('resource') }.transform_values(&:length) ==
    { 'base' => 4, 'default' => 77 }

definition_path = File.join(__dir__, 'proper-name-discovery-definitions-D21163.tsv')
review_path = File.join(__dir__, 'proper-name-discovery-D21163.tsv')
[definition_path, review_path].each do |path|
  raise "already exists: #{path}" if File.exist?(path)
end
m.write_table(
  definition_path,
  m.table(ReviewedProperNameDiscovery::GLOSSARY).headers,
  definitions
)
m.write_table(review_path, m::HEADERS.take(12), reviews)

puts "D-21163-D-21164: #{reviews.length} distinct keys; #{counts.inspect}; batches 50+31"
puts "Proposed cells: #{reviews.count { |row| row['old'] != row['new'] }}; dispositions: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
