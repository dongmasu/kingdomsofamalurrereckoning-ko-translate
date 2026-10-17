#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
inventory = m.refresh_inventory
specs = [
  {
    key: 'resource:softscrabble-powder', english: 'Softscrabble Powder',
    korean: '소프트스크래블 가루(Softscrabble Powder)', count: 16,
    pattern: /소프트스크래블(?:\(Softscrabble\))?[ \t]*가루(?:[ \t]*\(Softscrabble Powder\))?/,
    variants: '소프트스크래블 가루|소프트스크래블(Softscrabble) 가루',
    notes: 'English default:36133 explicitly identifies Softscrabble Powder as a mineral deposit used in Mana potions. Japanese ソフトスクラブル・パウダー and Chinese 软爪石粉末 corroborate. Pair the complete material label, not only Softscrabble. Existing canonical full annotations remain unchanged. Do not turn the mineral into a plant or merge it with Hardscrabble.'
  },
  {
    key: 'resource:softscrabble-deposits', english: 'Softscrabble Deposits',
    korean: '소프트스크래블 광상(Softscrabble Deposits)', count: 1,
    pattern: /소프트스크래블\(Softscrabble\) 광상/,
    variants: '소프트스크래블(Softscrabble) 광상',
    notes: 'English base:163 names the mineral deposit, distinct from the Powder item. Japanese ソフトスクラブルの保管場所 and Chinese 软爪石矿藏 corroborate the location/deposit context; English Deposits controls the mineral reading, supported by default:36133. Keep the existing Korean 광상 and pair the complete label.'
  },
  {
    key: 'resource:scarab-salts', english: 'Scarab Salts',
    korean: '풍뎅이 소금(Scarab Salts)', count: 13,
    pattern: /(?:풍뎅이 소금|딱정벌레 소금|스카라[브베] 소금)(?:[ \t]*\(Scarab Salts\))?/,
    variants: '풍뎅이 소금|딱정벌레 소금|스카라브 소금|스카라베 소금',
    notes: 'English base:2187/2747 and recipes identify Scarab Salts; default:52784 also names the material in crafting the Seal. Japanese スカラベの塩 and Chinese 甲虫盐 corroborate. Reuse both existing semantic base labels 풍뎅이 소금 and pair the full source material, unifying the phonetic variants. No bare Scarab alias: the Scarab Gornak creature context is unrelated.'
  },
  {
    key: 'resource:essence-of-fate', english: 'Essence of Fate',
    korean: '운명의 정수(Essence of Fate)', count: 57,
    pattern: /운명(?:의)?[ \t]*정수(?:[ \t]*\(Essence of Fate\))?/,
    variants: '운명의 정수|운명 정수',
    notes: 'English default:32014 explicitly identifies Essence of Fate as a special reagent obtained in Reckoning mode; base labels and potion recipes corroborate. Japanese フェイトエッセンス and Chinese 命运精华 support the same substance, including the forged shield at default:1369, Gallows bloom comparison at default:15444, and scholarly fluid discussion at default:50915. Reuse 운명의 정수, standardize the omitted genitive, and annotate the material only. Keep Fate, Fate energy, recipe effects, comparison claims and scholarly theories otherwise unchanged.'
  },
  {
    key: 'resource:hardscrabble', english: 'Hardscrabble',
    korean: '하드스크래블(Hardscrabble)', count: 3,
    pattern: /하드스크래블(?:[ \t]*\(Hardscrabble\))?/,
    variants: '하드스크래블',
    notes: 'English default:55550 compares Embereyes with Hardscrabble while discussing gathered reagents; Japanese and Chinese are recorded verbatim, with Chinese 硬皮草 supporting a named material and Japanese rendering the comparison differently. Retain the existing paired name without asserting a particular plant/mineral species. Lowercase hardscrabble in default:12614 (life) and default:44155 (existence) is an ordinary adjective, explicitly excluded and unchanged.'
  }
]
definitions = specs.map do |spec|
  {
    'entity_key' => spec[:key], 'english_canonical' => spec[:english],
    'category' => 'resource', 'korean_canonical' => spec[:korean],
    'english_aliases' => '', 'korean_variants' => spec[:variants],
    'evidence_ids' => 'D-21280', 'status' => 'confirmed', 'notes' => spec[:notes]
  }
end
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
actual = generated.group_by { |row| row['entity_key'] }.transform_values(&:length)
raise "source coverage differs #{actual}" unless actual == specs.to_h { |spec| [spec[:key], spec[:count]] }
reviews = generated.group_by { |row| m.key(row) }.sort_by do |key, _|
  [m::RESOURCES.index(key[0]), key[1].to_i, key[2]]
end.map do |key, matches|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = old.dup
  dispositions = {}
  matches.each do |match|
    spec = specs.find { |candidate| candidate[:key] == match['entity_key'] }
    if spec[:key] == 'resource:hardscrabble' && %w[12614 44155].include?(key[1])
      dispositions[spec[:key]] = 'excluded'
      next
    end
    raise "missing material name #{key} #{spec[:english]}" unless new_text.match?(spec[:pattern])
    before = new_text.dup
    new_text.gsub!(spec[:pattern], spec[:korean])
    dispositions[spec[:key]] = before == new_text ? 'not-an-issue' : 'accepted'
  end
  status = if old != new_text
             'accepted'
           elsif dispositions.values.all? { |value| value == 'excluded' }
             'excluded'
           else
             'not-an-issue'
           end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
    'old' => old, 'new' => new_text,
    'evidence' => 'English-first material-name consistency across affix/base/default. Official Korean manual PDF pp. 1, 3 and 5 supplies Fate/Reckoning context, and PDF pp. 4 and 8 supplies Alchemy/reagent context; the source UI and descriptions establish the specific material names. Preserve every quantity, effect, particle, token, exact line break and unrelated name. ' + matches.map { |row| specs.find { |spec| spec[:key] == row['entity_key'] }.fetch(:notes) }.join(' '),
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end
headers = m.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers
m.write_table(File.join(__dir__, 'proper-name-discovery-definitions-D21280.tsv'), headers, definitions)
m.write_table(File.join(__dir__, 'proper-name-discovery-D21280.tsv'), m::HEADERS.take(12), reviews)
puts "Prepared #{reviews.length} distinct rows; #{generated.length} entity matches; #{reviews.count { |row| row['old'] != row['new'] }} proposed cell edits."
