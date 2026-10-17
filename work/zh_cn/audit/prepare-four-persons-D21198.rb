#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_198
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
context = 'English is the identity and meaning anchor; aligned Japanese and Chinese corroborate pronunciation and identity. The official Korean manual provides setting context but does not list these individual NPC names. Preserve source-local ranks and nicknames; annotate complete English name forms in Korean.'
definitions = [
  ['person:gwenna-hand', 'Gwenna Hand', 'person', '그웬나 핸드(Gwenna Hand)', '', '그웨나 핸드|그웬나 핸드',
   'default:1371|default:39086|default:41661|default:43277|default:63044',
   'Japanese グウェナ・ハンド and Chinese 格文那·汉德 corroborate Gwenna Hand. At default 1371 she self-identifies and says customers call her Gwen; keep Gwen as a distinct local nickname, not a full-name alias. Standardize the full-name spelling to 그웬나 핸드.'],
  ['person:declan-malus', 'Declan Malus', 'person', '데클런 말러스(Declan Malus)', '', '데클런 말러스|데클런 말루스|데클란 말루스|데클런 말러스',
   'default:9974|default:39992|default:41670|default:43046|default:48240|default:48891|default:55314|default:61894',
   'Japanese デクラン・マルス and Chinese 德克兰·马鲁斯/德克兰·马路斯 identify the same Warsworn contract holder. Normalize Korean spelling to 데클런 말러스 and pair complete-name mentions; preserve local wording, Jory and Warsworn references.'],
  ['person:cennar-bruge', 'Cennar Bruge', 'person', '세나르 브루주(Cennar Bruge)', '', '세나르 브루지|세나르 브루주',
   'default:13234|default:61461',
   'Japanese セナー・ブルージェ and Chinese 岑纳尔·布鲁格 corroborate the full name. Reuse the established Korean form 세나르 브루주; do not alter the separate Domus Politica/Tallyer role.'],
  ['person:koch', 'Koch', 'person', '코흐(Koch)', 'Captain Koch', '코치|코흐 대장|코흐 대위',
   'default:624|default:11210|default:18701|default:39084|default:51458|default:59132',
   'English Captain Koch, Japanese コチ隊長, and Chinese 科赫队长 identify the female leader of the Crownhold Garrison. Use the corroborated Korean name 코흐 and translate Captain consistently as 대위, preserving the title and source wording in each bilingual form. The bare Koch canonical identifies the person; Captain Koch is a source attested title-bearing alias.']
].map do |entity, english, category, korean, aliases, variants, ids, note|
  glossary.headers.zip([
    entity, english, category, korean, aliases, variants,
    "D-#{d}|#{ids}", 'confirmed', "#{note} #{context}"
  ]).to_h
end
existing = glossary.map { |row| row['entity_key'] }
raise 'one or more people already registered' unless
  (existing & definitions.map { |row| row['entity_key'] }).empty?

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
rewrites = {
  ['default', '39086', ''] => ['그웨나 핸드(Gwenna Hand)', '그웬나 핸드(Gwenna Hand)'],
  ['default', '41661', ''] => ['그웨나 핸드', '그웬나 핸드(Gwenna Hand)'],
  ['default', '43277', ''] => ['그웨나 핸드', '그웬나 핸드(Gwenna Hand)'],
  ['default', '63044', ''] => ['그웬나 핸드 밑에서', '그웬나 핸드(Gwenna Hand) 밑에서'],
  ['default', '9974', ''] => ['데클런 말러스는', '데클런 말러스(Declan Malus)는'],
  ['default', '39992', ''] => ['데클런 말러스', '데클런 말러스(Declan Malus)'],
  ['default', '41670', ''] => ['데클런 말러스가', '데클런 말러스(Declan Malus)가'],
  ['default', '43046', ''] => ['데클런 말루스에게 돌아가기', '데클런 말러스(Declan Malus)에게 돌아가기'],
  ['default', '48240', ''] => ['데클런 말루스', '데클런 말러스(Declan Malus)'],
  ['default', '48891', ''] => ['데클란 말루스에게 돌아가기', '데클런 말러스(Declan Malus)에게 돌아가기'],
  ['default', '55314', ''] => ['데클런 말루스(Declan Malus)', '데클런 말러스(Declan Malus)'],
  ['default', '13234', ''] => ['세나르 브루주(Cennar Bruge)', '세나르 브루주(Cennar Bruge)'],
  ['default', '61461', ''] => ['세나르 브루지(Cennar Bruge)', '세나르 브루주(Cennar Bruge)'],
  ['default', '624', ''] => ['코흐(Koch) 대위', '코흐 대위(Captain Koch)'],
  ['default', '11210', ''] => ['코흐(Koch) 대장에게 돌아가라', '코흐 대위(Captain Koch)에게 돌아가라'],
  ['default', '18701', ''] => ['코흐 대위에게 돌아가', '코흐 대위(Captain Koch)에게 돌아가'],
  ['default', '39084', ''] => ['코치 대장(Captain Koch)', '코흐 대위(Captain Koch)'],
  ['default', '51458', ''] => ['코흐 대장(Captain Koch)', '코흐 대위(Captain Koch)'],
  ['default', '59132', ''] => ['코흐 대장이다', '코흐 대위(Captain Koch)이다']
}
reviews = generated.group_by { |row| m.key(row) }.map do |key, matches|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = old.dup
  if (rewrite = rewrites[key])
    from, to = rewrite
    raise "expected rewrite span missing/ambiguous #{key.inspect}" unless new_text.scan(from).length == 1
    new_text.sub!(from, to)
  elsif key == ['default', '1371', ''] ||
        key == ['default', '13234', ''] ||
        key == ['default', '61894', '']
    # Existing canonical full-name rendering is retained.
  else
    raise "unreviewed generated name occurrence #{key.inspect}"
  end
  entities = matches.map { |row| row.fetch('entity_key') }.uniq
  status = old == new_text ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.sort.join('|'), 'status' => status,
    'old' => old, 'new' => new_text,
    'evidence' => definitions.select { |definition| entities.include?(definition['entity_key']) }
      .map { |definition| "#{definition['english_canonical']}: #{definition['notes']}" }.join(' '),
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, status] })
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

raise "expected 21 distinct source rows, got #{reviews.length}" unless reviews.length == 21
definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'preparation output exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "21 distinct row keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
