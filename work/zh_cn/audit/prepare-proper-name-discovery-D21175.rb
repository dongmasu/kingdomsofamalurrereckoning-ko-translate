#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
ReviewedProperNameDiscovery.ensure_unused_batch!(21175)

expected_hash = '0a0044225a09fad593fd6986ddb0eb1f12527f53d3e84a00a4c18ddf51ed1a87'
actual_hash = m.hashes.fetch('default')
raise "default CSV changed: #{actual_hash}" unless actual_hash == expected_hash

inventory = m.refresh_inventory
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)

specs = [
  {
    'entity_key' => 'monster:night-barghest',
    'english_canonical' => 'Night Barghest',
    'category' => 'monster',
    'korean_canonical' => '밤의 바게스트(Night Barghest)',
    'english_aliases' => '',
    'korean_variants' => '나이트 바게스트|나이트 바르게스트|밤 바게스트',
    'evidence_ids' => 'default:1038|default:6129|default:7491|default:8125|default:29530|default:31572|default:32015|default:45425|default:46397|default:47706|default:50266|default:51731|default:53993|default:54195|default:54358|default:60507',
    'status' => 'confirmed',
    'notes' => 'English repeatedly identifies the Night Barghest as a specific creature; Japanese ナイト・バーゲスト supports the name and Chinese 夜之魔狼 supports the translated night modifier. Reuse the confirmed Barghest species form 바게스트 and render the complete compound consistently as 밤의 바게스트(Night Barghest). Reviewed all aligned source rows listed in this definition. The official Korean manual provides general creature-setting context but does not name this creature.'
  },
  {
    'entity_key' => 'monster:bolgan-masters',
    'english_canonical' => 'Bolgan Masters',
    'category' => 'monster',
    'korean_canonical' => '볼간 마스터(Bolgan Masters)',
    'english_aliases' => '',
    'korean_variants' => '볼간 대가|볼간의 대가들|볼간 대가들|볼간의 거장들|볼간 대장들|볼간 마스터들',
    'evidence_ids' => 'default:7581|default:11905|default:24841|default:27777|default:35843|default:44309|default:49053|default:50511|default:51921|default:52788|default:61687|default:62945',
    'status' => 'confirmed',
    'notes' => 'English identifies Bolgan Masters as a distinct Bolgan monster rank/group, including special mages with powerful mind control who command ordinary Bolgan. Japanese ボルガンマスター and Chinese 波尔干兽王/波尔干大祭司 corroborate the distinct rank. Use the established game-style loanword form 볼간 마스터(Bolgan Masters), preserving separate ordinary Bolgan references. The official Korean manual does not enumerate this creature group.'
  },
  {
    'entity_key' => 'place:dannestar-tower',
    'english_canonical' => 'Dannestar Tower',
    'category' => 'place',
    'korean_canonical' => '대너스타 탑(Dannestar Tower)',
    'english_aliases' => '',
    'korean_variants' => '대네스타 탑|대네스타 타워',
    'evidence_ids' => 'base:1627|default:8475|default:12859|default:17280|default:20305|default:34030|default:61903|default:62424',
    'status' => 'confirmed',
    'notes' => 'English identifies the named tower and its collapse, Japanese ダネスターの塔 and Chinese 丹内斯达高塔/丹尼斯塔尔高塔 corroborate it. Reuse the confirmed place stem 대너스타 from place:dannestar while keeping the tower distinct from the island and other Dannestar locations. The official Korean manual does not name this tower.'
  }
]

definitions = specs.map do |spec|
  values = glossary.headers.to_h { |header| [header, spec[header]] }
  values
end

generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
raise 'discovery exceeds the 50-row-key batch limit' if
  generated.map { |row| m.key(row) }.uniq.length > 50

particles = %w[
  에게서 에게까지 에게부터 에게도 에게나 에게는 에게서부터 에게로
  에서부터 으로부터 으로써 으로서는 으로서 이라며 이라는 이라서
  이라고 라고는 라며 라는 라고 라서 만큼 까지 부터 처럼 보다
  조차 마저 라도 든지 든가 은 는 이 가 을 를 과 와 의 에게
  께 에서 으로 로 에 아 야 도 만 마다 나
].sort_by { |particle| -particle.length }
particle_pattern = particles.map { |particle| Regexp.escape(particle) }.join('|')

has_batchim = lambda do |text|
  last = text.each_char.to_a.last
  last && last.ord.between?(0xAC00, 0xD7A3) &&
    ((last.ord - 0xAC00) % 28).positive?
end

fix_particle = lambda do |particle, korean|
  return particle unless particle

  batchim = has_batchim.call(korean)
  case particle
  when '이', '가' then batchim ? '이' : '가'
  when '은', '는' then batchim ? '은' : '는'
  when '을', '를' then batchim ? '을' : '를'
  when '과', '와' then batchim ? '과' : '와'
  when '으로', '로'
    last = korean.each_char.to_a.last
    has_rieul = last && last.ord.between?(0xAC00, 0xD7A3) &&
      ((last.ord - 0xAC00) % 28 == 8)
    batchim && !has_rieul ? '으로' : '로'
  when '아', '야' then batchim ? '아' : '야'
  else particle
  end
end

patterns = {
  'monster:night-barghest' =>
    /(?<![가-힣])(?:나이트\s*바르게스트|나이트\s*바게스트|밤의\s*바게스트|밤\s*바게스트)(?:\s*\((?:Night )?Barghest\))?(?<particle>#{particle_pattern})?(?![가-힣])/,
  'monster:bolgan-masters' =>
    /(?<![가-힣])볼간(?:\s*\(Bolgan\))?\s*(?:의\s*)?(?:대가|거장|대장|마스터)(?<plural>들)?(?:\s*\(Bolgan Masters\))?(?<particle>#{particle_pattern})?(?![가-힣])/,
  'place:dannestar-tower' =>
    /(?<![가-힣])대(?:너|네)스타\s*(?:탑|타워)(?:\s*\(Dannestar Tower\))?(?<particle>#{particle_pattern})?(?![가-힣])/
}
canonical = definitions.to_h do |row|
  [row.fetch('entity_key'), row.fetch('korean_canonical')]
end

normalize = lambda do |text, entity|
  target = canonical.fetch(entity).sub(/\(.*\)\z/, '')
  english = definitions.find { |row| row['entity_key'] == entity }.fetch('english_canonical')
  found = false
  result = text.gsub(patterns.fetch(entity)) do |match|
    found = true
    match_data = Regexp.last_match
    particle = match_data[:particle]
    plural = match_data.names.include?('plural') ? match_data[:plural].to_s : ''
    new_form = target + plural
    new_particle = fix_particle.call(particle, new_form)
    korean_term = target + (plural.empty? ? '' : '들')
    "#{korean_term}(#{english})#{new_particle}"
  end
  [result, found]
end

reviews = generated.group_by { |row| m.key(row) }.map do |row_key, matches|
  source = inventory.fetch(row_key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
  old_text = source.fetch('work_text')
  new_text = old_text.dup
  entities = matches.map { |row| row.fetch('entity_key') }.uniq.sort
  dispositions = {}
  evidence = []

  entities.each do |entity|
    before = new_text.dup
    new_text, found = normalize.call(new_text, entity)
    unless found && english.match?(
      /(?<![A-Za-z])#{Regexp.escape(definitions.find { |row| row['entity_key'] == entity }.fetch('english_canonical'))}(?![A-Za-z])/i
    )
      dispositions[entity] = 'uncertain'
      evidence << "#{entity}: source/Korean alignment did not yield a safe exact normalization; left unchanged."
      next
    end
    dispositions[entity] = before == new_text ? 'not-an-issue' : 'accepted'
    evidence << "#{entity}: English identifies the complete named entity; aligned Japanese and Chinese were checked. Standardized only this exact source-matched Korean name, preserving surrounding text and adapting a particle only where the canonical form requires it."
  end

  {
    'resource' => row_key[0],
    'ID_Linha' => row_key[1],
    'Tipo_Variante' => row_key[2],
    'entity_key' => entities.join('|'),
    'status' => if new_text != old_text
                  'accepted'
                elsif dispositions.value?('uncertain')
                  'uncertain'
                elsif dispositions.values.all? { |status| status == 'excluded' }
                  'excluded'
                else
                  'not-an-issue'
                end,
    'old' => old_text,
    'new' => new_text,
    'evidence' => evidence.join(' '),
    'english' => english,
    'japanese' => japanese,
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end.sort_by do |row|
  [m::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
   row.fetch('Tipo_Variante')]
end

raise 'discovery terms do not cover all three entities' unless
  generated.map { |row| row['entity_key'] }.uniq.sort == definitions.map { |row| row['entity_key'] }.sort
failed = reviews.select do |row|
  JSON.parse(row.fetch('entity_dispositions_json')).value?('uncertain')
end
unless failed.empty?
  details = failed.map do |row|
    "#{row['resource']}:#{row['ID_Linha']} #{row['entity_key']} #{row['old'].inspect}"
  end.join("\n")
  raise "reviewed rows failed to normalize safely:\n#{details}"
end

m.write_table(
  File.join(__dir__, 'proper-name-discovery-definitions-D21175.tsv'),
  glossary.headers,
  definitions
)
m.write_table(
  File.join(__dir__, 'proper-name-discovery-D21175.tsv'),
  m::HEADERS.take(12),
  reviews
)

puts "#{reviews.length} row keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
reviews.each do |row|
  next if row['old'] == row['new']
  puts "#{row['resource']}:#{row['ID_Linha']}: #{row['old'].inspect} -> #{row['new'].inspect}"
end
