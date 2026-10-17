#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
ReviewedProperNameDiscovery.ensure_unused_batch!(21176)

expected_hash = '42416bbb3d2e63da4b6e40a21e5d1f1243ce06ca4af009560b905ac14e015783'
actual_hash = m.hashes.fetch('default')
raise "default CSV changed: #{actual_hash}" unless actual_hash == expected_hash

inventory = m.refresh_inventory
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)

spec = {
  'entity_key' => 'person:mad-harst',
  'english_canonical' => 'Mad Harst',
  'category' => 'person',
  'korean_canonical' => '미친 허스트(Mad Harst)',
  'english_aliases' => 'Harst',
  'korean_variants' => '매드 허스트|미친 하스트|미친 하르스트|허스트|하스트|하르스트',
  'evidence_ids' => 'default:4983|default:6986|default:8804|default:9436|default:12291|default:22666|default:26592|default:36405|default:39178|default:46652|default:50549|default:52063|default:54292|default:54381|default:56090|default:57257|default:57358|default:60539|default:61075|default:63633|default:63737',
  'status' => 'confirmed',
  'notes' => 'English explicitly calls him a man named Mad Harst at default:4983 and says the Fahrlangi answer to somebody called Mad Harst at default:8804. The same account immediately shortens the name to Harst, and later quest rows identify Harst as the same Customs House lair figure. Japanese イカれたハースト and Chinese 疯子哈斯特 corroborate the epithet and surname. Canonical full form is 미친 허스트(Mad Harst); use 허스트(Harst) when the English source itself uses the short form. The official Korean manual does not name this person.'
}
definition = glossary.headers.to_h { |header| [header, spec[header]] }

generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
raise "expected 21 source rows, got #{generated.map { |row| m.key(row) }.uniq.length}" unless
  generated.map { |row| m.key(row) }.uniq.length == 21

particles = %w[
  에게서 에게까지 에게부터 에게도 에게나 에게는 에게서부터 에게로
  에서부터 으로부터 으로써 으로서는 으로서 이라며 이라는 이라서
  이라고 라고는 라며 라는 라고 라서 만큼 까지 부터 처럼 보다
  조차 마저 라도 든지 든가 은 는 이 가 을 를 과 와 의 에게
  께 에서 으로 로 에 아 야 도 만 마다 나
].sort_by { |particle| -particle.length }
particle_pattern = particles.map { |particle| Regexp.escape(particle) }.join('|')

full_pattern =
  /(?<![가-힣])(?:매드\s*허스트|미친\s*허스트|미친\s*하스트|미친\s*하르스트)(?:\s*\(Mad Harst\))?(?<particle>#{particle_pattern})?(?![가-힣])/
short_pattern =
  /(?<!미친 )(?<![가-힣])(?:허스트|하스트|하르스트)(?:\s*\(Harst\))?(?<particle>#{particle_pattern})?(?![가-힣])/

reviews = generated.map do |match|
  row_key = m.key(match)
  source = inventory.fetch(row_key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
  old_text = source.fetch('work_text')
  new_text = old_text.dup
  source_has_full = english.match?(/(?<![A-Za-z])Mad Harst(?![A-Za-z])/i)
  source_has_short = english.match?(/(?<![A-Za-z])Harst(?![A-Za-z])/i)
  found_full = false
  found_short = false

  new_text = new_text.gsub(full_pattern) do |old|
    found_full = true
    "#{spec.fetch('korean_canonical')}#{Regexp.last_match[:particle]}"
  end
  new_text = new_text.gsub(short_pattern) do |old|
    found_short = true
    "허스트(Harst)#{Regexp.last_match[:particle]}"
  end

  unless (source_has_full && found_full) || (source_has_short && found_short)
    raise "source/Korean name alignment unresolved at #{row_key.inspect}"
  end

  changed = old_text != new_text
  {
    'resource' => row_key[0],
    'ID_Linha' => row_key[1],
    'Tipo_Variante' => row_key[2],
    'entity_key' => spec.fetch('entity_key'),
    'status' => changed ? 'accepted' : 'not-an-issue',
    'old' => old_text,
    'new' => new_text,
    'evidence' => 'English establishes Mad Harst as a person and links the short form Harst in the same theft/Customs House account; aligned Japanese イカれたハースト and Chinese 疯子哈斯特 corroborate the identity and epithet. Standardize the full source form as 미친 허스트(Mad Harst) and the source-local short form as 허스트(Harst), preserving sentence wording and adapting only exact name spans.',
    'english' => english,
    'japanese' => japanese,
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(spec.fetch('entity_key') => (changed ? 'accepted' : 'not-an-issue'))
  }
end.sort_by do |row|
  [m::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
   row.fetch('Tipo_Variante')]
end

m.write_table(
  File.join(__dir__, 'proper-name-discovery-definitions-D21176.tsv'),
  glossary.headers,
  [definition]
)
m.write_table(
  File.join(__dir__, 'proper-name-discovery-D21176.tsv'),
  m::HEADERS.take(12),
  reviews
)

puts "#{reviews.length} row keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
reviews.each do |row|
  next if row['old'] == row['new']
  puts "#{row['resource']}:#{row['ID_Linha']}: #{row['old'].inspect} -> #{row['new'].inspect}"
end
