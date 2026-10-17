#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
ReviewedProperNameDiscovery.ensure_unused_batch!(21177)

expected_hash = '668a005b7160270758424439aa9f453ba66646d3c32c039a956b9f7899e9f379'
actual_hash = m.hashes.fetch('default')
raise "default CSV changed: #{actual_hash}" unless actual_hash == expected_hash

inventory = m.refresh_inventory
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)

spec = {
  'entity_key' => 'place:kandrian-keep',
  'english_canonical' => 'Kandrian Keep',
  'category' => 'place',
  'korean_canonical' => '칸드리안 요새(Kandrian Keep)',
  'english_aliases' => '',
  'korean_variants' => '칸드리안 성채',
  'evidence_ids' => 'base:4079:11|default:11917|default:15619|default:15909|default:20488|default:23884|default:26796|default:26917|default:29327|default:33988|default:36596|default:43276|default:44364|default:57499|default:58021|default:59130',
  'status' => 'confirmed',
  'notes' => 'English identifies Kandrian Keep as a specific fortress, including its role as the ancestral seat/bastion and its resistance to Ciara Sydanus. Japanese カンドリアン砦/カンドリアン・キープ and Chinese 坎德利安要塞 corroborate the place. Reuse the confirmed place stem 칸드리안 from place:kandrian while keeping the fortress distinct from the region, family, people, and other Kandrian compounds. Canonical complete form: 칸드리안 요새(Kandrian Keep). The official Korean manual has no Kandrian entry.'
}
definition = glossary.headers.to_h { |header| [header, spec[header]] }

generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
raise "expected 16 source rows, got #{generated.map { |row| m.key(row) }.uniq.length}" unless
  generated.map { |row| m.key(row) }.uniq.length == 16

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
pattern =
  /(?<![가-힣])칸드리안\s*(?:요새|성채)(?:\s*\(Kandrian Keep\))?(?<particle>#{particle_pattern})?(?![가-힣])/

reviews = generated.map do |match|
  row_key = m.key(match)
  source = inventory.fetch(row_key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
  old_text = source.fetch('work_text')
  found = false
  new_text = old_text.gsub(pattern) do
    found = true
    particle = fix_particle.call(Regexp.last_match[:particle], '칸드리안 요새')
    "#{spec.fetch('korean_canonical')}#{particle}"
  end
  raise "source/Korean name alignment unresolved at #{row_key.inspect}" unless
    found && english.match?(/(?<![A-Za-z])Kandrian Keep(?![A-Za-z])/i)

  changed = old_text != new_text
  {
    'resource' => row_key[0],
    'ID_Linha' => row_key[1],
    'Tipo_Variante' => row_key[2],
    'entity_key' => spec.fetch('entity_key'),
    'status' => changed ? 'accepted' : 'not-an-issue',
    'old' => old_text,
    'new' => new_text,
    'evidence' => 'English identifies the named Kandrian fortress; aligned Japanese カンドリアン砦/カンドリアン・キープ and Chinese 坎德利安要塞 corroborate it. Reused the established place stem 칸드리안 and standardized only the complete fortress name as 칸드리안 요새(Kandrian Keep), preserving surrounding text and adapting a particle only where needed.',
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
  File.join(__dir__, 'proper-name-discovery-definitions-D21177.tsv'),
  glossary.headers,
  [definition]
)
m.write_table(
  File.join(__dir__, 'proper-name-discovery-D21177.tsv'),
  m::HEADERS.take(12),
  reviews
)

puts "#{reviews.length} row keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
reviews.each do |row|
  next if row['old'] == row['new']
  puts "#{row['resource']}:#{row['ID_Linha']}: #{row['old'].inspect} -> #{row['new'].inspect}"
end
