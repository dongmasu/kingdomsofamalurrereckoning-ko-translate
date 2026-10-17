#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
inventory = m.refresh_inventory
definitions = [
  {
    'entity_key' => 'resource:embereyes', 'english_canonical' => 'Embereyes',
    'category' => 'resource', 'korean_canonical' => '엠버아이즈(Embereyes)',
    'english_aliases' => '', 'korean_variants' => '잿불눈|엠버아이|엠버아이즈',
    'evidence_ids' => 'D-21270|base:3430:11|base:4369:11|default:62263',
    'status' => 'confirmed',
    'notes' => 'English default:62263 explicitly identifies Embereyes as an herb, and recipes list it as a reagent. Japanese エンバーアイズ and Chinese 灰烬之眼 corroborate. Preserve the established majority source-name transcription 엠버아이즈; unify 잿불눈 and 엠버아이. Greater Embereyes keeps its qualifier. On Embereyes is a separate complete book title: exclude its reagent occurrence and review its full title independently. The manual defines Alchemy/reagents generically, not this plant spelling.'
  },
  {
    'entity_key' => 'resource:searstalk', 'english_canonical' => 'Searstalk',
    'category' => 'resource', 'korean_canonical' => '시어스토크(Searstalk)',
    'english_aliases' => '', 'korean_variants' => '시어스탈크|시어스토크',
    'evidence_ids' => 'D-21270|base:1533:11|base:3691:11|default:46910',
    'status' => 'confirmed',
    'notes' => 'English default:46910 identifies Searstalk as the rare Sidhe plant used to treat Luca Soren, and default:25890/28795/48762 confirms the same cure. Japanese シアスターク and Chinese 火炎叶 corroborate. Retain the established quest spelling 시어스토크 and normalize the isolated base 시어스탈크. Preserve other character/place names, quest actions and particles. No affix hit.'
  },
  {
    'entity_key' => 'resource:seaflax', 'english_canonical' => 'Seaflax',
    'category' => 'resource', 'korean_canonical' => '바닷아마(Seaflax)',
    'english_aliases' => '', 'korean_variants' => '바닷아마|바다아마|바다 아마|시플랙스|씨플랙스|시 플랙스',
    'evidence_ids' => 'D-21270|base:1068:11|base:3134:11|default:10994|default:59501',
    'status' => 'confirmed',
    'notes' => 'English default:10994 describes dried braided Seaflax threads as a protective potion reagent; default:59501 gives its planting/crop context. Japanese シーフラックス and Chinese 海亚麻 identify the same plant in labels, recipes and prose. Reuse the existing semantic base label 바닷아마 and pair Seaflax, replacing the unpaired/variant phonetic forms only in English-mapped rows. Preserve quantities, recipe effects and crop timing. No affix hit.'
  },
  {
    'entity_key' => 'resource:bloodroot', 'english_canonical' => 'Bloodroot',
    'category' => 'resource', 'korean_canonical' => '혈근초(Bloodroot)',
    'english_aliases' => '', 'korean_variants' => '혈근초|혈근|피뿌리|블러드루트',
    'evidence_ids' => 'D-21270|base:3330:11|base:4407:11|default:63572',
    'status' => 'confirmed',
    'notes' => 'English labels and potion recipes identify Bloodroot as a plant reagent; default:63572 also describes a blooming bloodroot. Japanese ブラッドルート and Chinese 血根草 corroborate. Reuse existing Korean base 혈근초 and already-paired recipes, unifying 블러드루트, 혈근 and 피뿌리. Do not infer real-world pharmacology or change quantities/effects. No affix hit.'
  },
  {
    'entity_key' => 'work:on-embereyes', 'english_canonical' => 'On Embereyes',
    'category' => 'named work', 'korean_canonical' => '엠버아이즈에 관하여(On Embereyes)',
    'english_aliases' => '', 'korean_variants' => '잿불눈에 관하여',
    'evidence_ids' => 'D-21270|base:2158:11', 'status' => 'confirmed',
    'notes' => 'The standalone English book label On Embereyes is distinguished from the plant name, corroborated by Japanese オン・エンバーアイズ and Chinese 论灰烬之眼. Keep its existing Korean title construction, use the standardized plant spelling, and pair the entire English title without nested annotation.'
  }
]
expected = {
  'resource:embereyes' => 23, 'resource:searstalk' => 14,
  'resource:seaflax' => 27, 'resource:bloodroot' => 56,
  'work:on-embereyes' => 1
}
patterns = {
  'resource:embereyes' => /(?:엠버아이즈|엠버아이|잿불눈)(?:[ \t]*\(Embereyes\))?/,
  'resource:searstalk' => /(?:시어스탈크|시어스토크)(?:[ \t]*\(Searstalk\))?/,
  'resource:seaflax' => /(?:바닷아마|바다[ \t]*아마|[씨시][ \t]*플랙스)(?:[ \t]*\(Seaflax\))?/,
  'resource:bloodroot' => /(?:혈근초|혈근|피뿌리|블러드루트)(?:[ \t]*\(Bloodroot\))?/
}
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
actual = generated.group_by { |row| row['entity_key'] }.transform_values(&:length)
raise "source coverage differs: #{actual}" unless actual == expected
by_entity = definitions.to_h { |row| [row['entity_key'], row] }
reviews = generated.group_by { |row| m.key(row) }.sort_by do |key, _|
  [m::RESOURCES.index(key[0]), key[1].to_i, key[2]]
end.map do |key, matches|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = old.dup
  dispositions = {}
  matches.each do |match|
    entity = match.fetch('entity_key')
    if entity == 'resource:embereyes' && key == ['base', '2158', '11']
      dispositions[entity] = 'excluded'
      next
    end
    before = new_text.dup
    if entity == 'work:on-embereyes'
      raise 'book title differs' unless new_text == '잿불눈에 관하여'
      new_text = by_entity.fetch(entity).fetch('korean_canonical')
    else
      pattern = patterns.fetch(entity)
      raise "missing Korean reagent span #{entity} #{key}" unless new_text.match?(pattern)
      new_text.gsub!(pattern, by_entity.fetch(entity).fetch('korean_canonical'))
    end
    dispositions[entity] = before == new_text ? 'not-an-issue' : 'accepted'
  end
  status = old == new_text ? 'not-an-issue' : 'accepted'
  notes = matches.map { |row| by_entity.fetch(row['entity_key']).fetch('notes') }.join(' ')
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
    'old' => old, 'new' => new_text,
    'evidence' => 'English-first reagent consistency review across affix/base/default. Official Korean manual PDF p. 4 (Alchemy skill) and p. 8 (crafting, Reagents and Recipes) supply gameplay context, not plant-specific names. Edit only mapped name spans; retain all effects, quantities, existing other-name annotations, tokens, line breaks, prose and particles. ' + notes,
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end
glossary_headers = m.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers
m.write_table(File.join(__dir__, 'proper-name-discovery-definitions-D21270.tsv'), glossary_headers, definitions)
m.write_table(File.join(__dir__, 'proper-name-discovery-D21270.tsv'), m::HEADERS.take(12), reviews)
puts "Prepared #{reviews.length} distinct rows, #{generated.length} entity matches; #{reviews.count { |row| row['old'] != row['new'] }} proposed cell edits."
