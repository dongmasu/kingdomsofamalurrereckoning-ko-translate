#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
ReviewedProperNameDiscovery.ensure_unused_batch!(21174)

expected_hash = '39a39a01df021991d21aa46176cc0d54a3020427109e5eae7e04f4081f2ce5e1'
actual_hash = m.hashes.fetch('default')
raise "default CSV changed: #{actual_hash}" unless actual_hash == expected_hash

inventory = m.refresh_inventory
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)
specs = [
  [
    'person:mad-dog', 'Mad Dog', '미친개(Mad Dog)', 'person',
    '', '미친개|미친 개|매드 독|매드독|매드 도그|매드도그|광견',
    'default:17246|default:19204|default:27759|default:32323',
    'English identifies the same named veteran gladiator across the Arena dialogue, opponent labels, and fight records; default:19204 explicitly says he is a veteran named Mad Dog. Japanese マッドドッグ and Chinese 疯狗 corroborate the epithet. D-19801 treated the phrase as a literal epithet, so retain the established Korean meaning 미친개 while pairing the English name. Apply only to exact English source matches; do not change the prior translation dispositions.'
  ],
  [
    'organization:mad-men', 'The Mad Men', '광인들(The Mad Men)', 'organization',
    'Mad Men', '광인들|광인|미치광이들|미치광이|미친 자들|매드 맨들|매드맨들|매드 맨|매드맨|매드 멘',
    'default:18198|default:19204|default:4841|default:7180',
    'English identifies The Mad Men as the named Arena team: the roster at default:18198 lists its members and default:19204 links the group to Mad Dog. Japanese マッドメン and Chinese 疯人队 corroborate the group identity. Standardize the translated team name as 광인들(The Mad Men), changing only exact English source matches; preserve previously reviewed findings about other entities.'
  ]
]

definitions = specs.map do |entity, english, korean, category, aliases, variants, evidence_ids, note|
  values = {
    'entity_key' => entity,
    'english_canonical' => english,
    'category' => category,
    'korean_canonical' => korean,
    'english_aliases' => aliases,
    'korean_variants' => variants,
    'evidence_ids' => evidence_ids,
    'status' => 'confirmed',
    'notes' => "#{note} Aligned English is primary; Japanese and Chinese were checked as corroborating source locales. No PAK or PAK-derived resource was consulted."
  }
  glossary.headers.to_h { |header| [header, values[header]] }
end

generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
by_key = generated.group_by { |row| m.key(row) }

particle_list = %w[
  에게서 에게까지 에게부터 에게도 에게나 에게는 에게서부터 에게로
  에서부터 으로부터 으로써 으로서는 으로서 이라며 이라는 이라서
  이라고 라고는 라며 라는 라고 라서 만큼 까지 부터 처럼 보다
  조차 마저 라도 든지 든가 은 는 이 가 을 를 과 와 의 에게
  께 에서 으로 로 에 아 야 도 만 마다 나
].sort_by { |particle| -particle.length }
particle_pattern = particle_list.map { |particle| Regexp.escape(particle) }.join('|')

has_batchim = lambda do |text|
  last = text.each_char.to_a.last
  last && last.ord.between?(0xAC00, 0xD7A3) &&
    ((last.ord - 0xAC00) % 28).positive?
end

adapt_particle = lambda do |particle, target|
  return particle unless particle
  if has_batchim.call(target)
    {
      '는' => '은', '가' => '이', '를' => '을', '와' => '과',
      '로' => '으로', '야' => '아', '라는' => '이라는',
      '라고' => '이라고', '라며' => '이라며', '라서' => '이라서'
    }.fetch(particle, particle)
  else
    {
      '은' => '는', '이' => '가', '을' => '를', '과' => '와',
      '으로' => '로', '으로써' => '로써', '으로서' => '로서',
      '으로서는' => '로서는', '으로부터' => '로부터', '아' => '야',
      '이라는' => '라는', '이라고' => '라고',
      '이라며' => '라며', '이라서' => '라서'
    }.fetch(particle, particle)
  end
end

patterns = {
  'person:mad-dog' => [
    /미친\s*개/, /매드\s*독/, /매드독/, /매드\s*도그/, /매드도그/, /광견/
  ],
  'organization:mad-men' => [
    /미치광이들?/, /미친\s*자들/, /광인들?/, /매드\s*맨들?/,
    /매드맨들?/, /매드\s*멘/
  ]
}
canonical = {
  'person:mad-dog' => ['미친개', 'Mad Dog'],
  'organization:mad-men' => ['광인들', 'The Mad Men']
}

normalize = lambda do |text, entity|
  korean, english = canonical.fetch(entity)
  variants = patterns.fetch(entity).map { |pattern| pattern.source }
    .sort_by { |variant| -variant.length }
  variant_pattern = variants.join('|')
  english_pattern = entity == 'person:mad-dog' ? '(?:The )?Mad Dog' : '(?:The )?Mad Men'
  pattern = Regexp.new(
    "(?<!\\p{Hangul})(?:#{variant_pattern})(?:\\s*\\(#{english_pattern}\\))?" \
    "(?<particle>#{particle_pattern})?(?!\\p{Hangul})"
  )
  found = false
  result = text.gsub(pattern) do |match|
    found = true
    particle = Regexp.last_match[:particle]
    suffix = adapt_particle.call(particle, korean)
    "#{korean}(#{english})#{suffix}"
  end
  [result, found]
end

reviews = by_key.keys.sort_by do |resource, id, variant|
  [m::RESOURCES.index(resource), id.to_i, variant]
end.map do |key|
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  old = source.fetch('work_text')
  text = old.dup
  entities = by_key.fetch(key).map { |row| row.fetch('entity_key') }.sort
  dispositions = {}
  evidence = []

  entities.each do |entity|
    before = text.dup
    text, found = normalize.call(text, entity)
    if !found
      dispositions[entity] = 'uncertain'
      evidence << "#{entity}: exact English source evidence is present, but no row-local Korean target span was found; left unchanged."
    else
      dispositions[entity] = before == text ? 'not-an-issue' : 'accepted'
      evidence << "#{entity}: standardized the exact source-matched name to #{canonical.fetch(entity).join(' / ')}; preserved surrounding text and adjusted only Korean particles required by the canonical form."
    end
  end
  if key == ['default', '34010', ''] &&
     text.include?('광인들(The Mad Men) 무리')
    text.sub!('광인들(The Mad Men) 무리와', '광인들(The Mad Men)과') ||
      text.sub!('광인들(The Mad Men) 무리', '광인들(The Mad Men)')
    evidence << 'The source names the team directly; removed the redundant Korean classifier 무리 after pairing the group name.'
  end

  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'),
    'status' => if text != old
                  'accepted'
                elsif dispositions.value?('uncertain')
                  'uncertain'
                else
                  'not-an-issue'
                end,
    'old' => old,
    'new' => text,
    'evidence' => evidence.join(' '),
    'english' => english,
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end

raise "expected 40 distinct source keys, got #{reviews.length}" unless reviews.length == 40
raise 'discovery terms do not cover both entities' unless
  generated.map { |row| row['entity_key'] }.uniq.sort == definitions.map { |row| row['entity_key'] }.sort

m.write_table(
  File.join(__dir__, 'proper-name-discovery-definitions-D21174.tsv'),
  glossary.headers,
  definitions
)
m.write_table(
  File.join(__dir__, 'proper-name-discovery-D21174.tsv'),
  m::HEADERS.take(12),
  reviews
)

puts "#{reviews.length} row keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
reviews.each do |row|
  next if row['old'] == row['new']
  puts "#{row['resource']}:#{row['ID_Linha']}: #{row['old'].inspect} -> #{row['new'].inspect}"
end
