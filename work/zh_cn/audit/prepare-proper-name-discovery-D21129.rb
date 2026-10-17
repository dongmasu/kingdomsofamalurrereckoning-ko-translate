#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_129
entity = 'person:godric-payne'
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
definition = glossary.headers.zip([
  entity, 'Godric Payne', 'person', '고드릭 페인(Godric Payne)',
  'GodricPayne|Godric|Payne', '고드릭|페인', "D-#{d}", 'confirmed',
  'English explicitly names Godric Payne in dialogue, labels and the stolen Border Permit quest. Japanese ゴドリック・ペイン and Chinese 高德里克·佩恩 corroborate. GodricPayne is the unspaced source spelling at default:21701. Short Godric at default:48614 refers to the same permit owner, supported by default:28653 and default:33682. Payne aliases are row-scoped: default:44155 is a family reference and excluded, default:5041 does not establish full identity and remains uncertain. Preserve House Payne and Lunar Gardens wording outside this personal-name scope.'
]).to_h
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected = %w[
  2392 4910 5041 5740 9124 9568 12964 13189 18858 21701 26961
  28653 31098 33682 34422 40497 43400 44155 44907 48614 49277
  49315 51401 61967 62829 62932 64395
]
raise 'unexpected Godric/Payne matches' unless
  generated.map { |row| row['ID_Linha'] }.sort_by(&:to_i) == expected &&
  generated.all? { |row| row['resource'] == 'default' && row['Tipo_Variante'].empty? }

reviews = generated.sort_by { |row| row['ID_Linha'].to_i }.map do |match|
  key = m.key(match)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  proposed = old.dup
  id = key[1]
  unless %w[5041 44155].include?(id)
    proposed.gsub!(/고드릭 페인(?!\()/, '고드릭 페인(Godric Payne)')
    if %w[33682 44907].include?(id)
      proposed.gsub!(/(?<!고드릭 )페인(?!\()/, '페인(Payne)')
    end
    proposed.sub!('고드릭의', '고드릭(Godric)의') if id == '48614'
  end
  status = if id == '5041'
             'uncertain'
           elsif id == '44155'
             'excluded'
           elsif old == proposed
             'not-an-issue'
           else
             'accepted'
           end
  evidence = case id
             when '5041'
               'English lists Colet, Payne and Thorn without a first name or the Border Permit context. Already bilingual Korean is retained; the identity link to Godric Payne is uncertain.'
             when '44155'
               'English a Payne denotes family membership rather than a full or short personal-name label. Exclude this family reference from the Godric personal-name edit scope and retain the text.'
             when '48614'
               'English Godric possessive identifies the permit owner. Full-name quest rows default:28653 and default:33682 identify Godric Payne as that owner. Add only the local English short name, preserving the existing object wording.'
             when '40497'
               'English explicitly introduces Lord Godric Payne. Add the full-name English gloss only; retain the title, House Payne family reference and Lunar Gardens wording outside this focused scope.'
             when '21701'
               'English GodricPayne is the unspaced form of Lord Godric Payne, confirmed by Japanese and Chinese full-name readings. Existing Korean is canonical and unchanged.'
             else
               'English explicitly names Godric Payne or the pursued permit thief Payne. Japanese and Chinese corroborate the name. Standardize scoped full and short personal-name references, preserving titles and unrelated names.'
             end
  {
    'resource' => key[0], 'ID_Linha' => id, 'Tipo_Variante' => key[2],
    'entity_key' => entity, 'status' => status, 'old' => old, 'new' => proposed,
    'evidence' => evidence,
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end
definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'batch preparation exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, [definition])
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "D-#{d}: #{reviews.length} rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
