#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_179
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
definitions = [
  [
    'monster:bloody-bones',
    'Bloody Bones',
    'monster',
    '블러디 본즈(Bloody Bones)',
    '',
    '피투성이 뼈|핏빛 뼈|핏빛 뼈들|블러디 본스|블러디 본즈',
    "D-#{d}|default:39204|default:40618",
    'confirmed',
    'English identifies Bloody Bones as the cursed, immortal Fae antagonist and explicitly distinguishes this form from the same individual formerly called Famor (default:39204 and 40618). Japanese consistently uses ブラッディ・ボーンズ; Chinese 血腥骸骨 corroborates the epithet. Use the established phonetic Korean form 블러디 본즈(Bloody Bones), not literal variants such as 피투성이 뼈 or 핏빛 뼈. Famor remains a separately indexed former-name entity so each English name can retain its own Korean label. Complete title/place labels are handled atomically without nested parentheses. The official Korean manual does not cover this antagonist; its omission is not contrary evidence.'
  ],
  [
    'named work:ballad-of-bloody-bones',
    'Ballad of Bloody Bones',
    'named work',
    '블러디 본즈의 발라드(Ballad of Bloody Bones)',
    'The Ballad of Bloody Bones|The Ballad of the Bloody Bones|Ballad of the Bloody Bones',
    '피투성이 뼈의 발라드|피투성이 뼈들의 발라드|블러디 본즈의 발라드',
    "D-#{d}|default:4149|default:29712|default:35337|default:36301|default:56332",
    'confirmed',
    'English explicitly labels the recurring Fae ballad, including article and definite-article variants. Japanese ブラッディ・ボーンズの物語 and Chinese 血腥骸骨之歌谣 corroborate the same work. Use the full Korean title 블러디 본즈의 발라드(Ballad of Bloody Bones); preserve surrounding quotation/title marks and do not insert a nested Bloody Bones label.'
  ],
  [
    'place:bloody-bones-lair',
    "Bloody Bones' Lair",
    'place',
    "블러디 본즈의 은신처(Bloody Bones' Lair)",
    '',
    '블러디 본즈(Bloody Bones)의 은신처',
    "D-#{d}|base:4377:11",
    'confirmed',
    "English presents Bloody Bones' Lair as a complete named location label. Japanese アジト and Chinese 巢穴 support the hideout/lair meaning. Retain the established Korean 은신처 wording and pair the complete English place name; do not nest the monster label inside it."
  ]
].map { |values| glossary.headers.zip(values).to_h }

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
source_candidates = m.table(File.join(__dir__, 'proper-name-candidates.tsv'))
monster_candidate = source_candidates.find do |row|
  row['candidate_key'] == 'candidate:bloody bones'
end
raise 'missing Bloody Bones source candidate' unless monster_candidate
expected_monster = monster_candidate.fetch('source_context_keys').split('|').map do |value|
  resource, id, variant = value.split(':', 3)
  [resource, id, variant.to_s]
end
kill_candidate = source_candidates.find do |row|
  row['candidate_key'] == 'candidate:kill bloody bones'
end
raise 'missing Kill Bloody Bones source candidate' unless kill_candidate
expected_monster.concat(kill_candidate.fetch('source_context_keys').split('|').map do |value|
  resource, id, variant = value.split(':', 3)
  [resource, id, variant.to_s]
end)
expected_monster.uniq!
expected_title = %w[4149 29712 35337 36301 56332].map do |id|
  ['default', id, '']
end
expected_place = [['base', '4377', '11']]
expected_by_entity = {
  'monster:bloody-bones' => expected_monster,
  'named work:ballad-of-bloody-bones' => expected_title,
  'place:bloody-bones-lair' => expected_place
}
actual_by_entity = generated.group_by { |row| row.fetch('entity_key') }
  .transform_values { |rows| rows.map { |row| m.key(row) }.sort }
raise "source key mismatch: #{actual_by_entity.inspect}" unless
  actual_by_entity == expected_by_entity.transform_values(&:sort)
reviews_by_key = generated.group_by { |row| m.key(row) }
raise 'more than 50 distinct row keys' if reviews_by_key.length > 50

monster_label = '블러디 본즈(Bloody Bones)'
work_label = '블러디 본즈의 발라드(Ballad of Bloody Bones)'
place_label = "블러디 본즈의 은신처(Bloody Bones' Lair)"
person_pattern = /(?:피투성이 뼈|핏빛 뼈|블러디 본스|블러디 본즈)(?:\s*\(Bloody Bones\))?/
work_pattern = /(?:피투성이 뼈들의 발라드|피투성이 뼈의 발라드|블러디 본즈의 발라드)(?:\s*\(Ballad of Bloody Bones\))?/
reviews = reviews_by_key.sort_by do |key, _matches|
  [m::RESOURCES.index(key[0]), key[1].to_i, key[2]]
end.map do |key, matches|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  entities = matches.map { |row| row.fetch('entity_key') }.uniq.sort
  proposed = old.dup
  if entities.include?('place:bloody-bones-lair')
    proposed.gsub!(/블러디 본즈(?:\(Bloody Bones\))?의 은신처/, place_label)
  elsif entities.include?('named work:ballad-of-bloody-bones')
    proposed.gsub!(work_pattern, work_label)
  else
    proposed.gsub!(/핏빛 뼈들은/, "#{monster_label}는")
    proposed.gsub!(person_pattern, monster_label)
  end

  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  expected_mentions = english.scan(/(?<![A-Za-z])Bloody Bones(?![A-Za-z])/i).length
  korean_mentions = proposed.scan(/블러디 본즈/).length
  raise "name/title alignment mismatch #{key.inspect}: EN=#{expected_mentions}, KO=#{korean_mentions}" unless
    expected_mentions == korean_mentions

  dispositions = entities.to_h do |entity|
    protected_component = entity == 'monster:bloody-bones' &&
      (entities.include?('named work:ballad-of-bloody-bones') ||
       entities.include?('place:bloody-bones-lair'))
    entity_status = if protected_component
                      'not-an-issue'
                    elsif proposed == old
                      'not-an-issue'
                    else
                      'accepted'
                    end
    [entity, entity_status]
  end
  status = dispositions.value?('accepted') ? 'accepted' : 'not-an-issue'
  evidence = 'English identifies Bloody Bones as the named cursed Fae antagonist; the aligned Japanese phonetic form and Chinese epithet corroborate. Normalize only this exact name to 블러디 본즈(Bloody Bones). Treat the Ballad title and Bloody Bones’ Lair as complete atomic names, preserving their full English labels without nested component parentheses. Keep Famor as a separately indexed former-name entity. This scoped name review resolves only name identity/display form where earlier rows left that question open; it does not reopen poem quality, narrative meaning, or unrelated prior dispositions.'
  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'),
    'status' => status,
    'old' => old,
    'new' => proposed,
    'evidence' => evidence,
    'english' => english,
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end

definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'batch preparation exists' if [definition_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definition_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "D-#{d}: #{reviews.length} keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
reviews.each do |row|
  next if row['old'] == row['new']
  puts "#{row['resource']}:#{row['ID_Linha']}: #{row['old'].inspect} -> #{row['new'].inspect}"
end
