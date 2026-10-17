#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_197
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
context = 'English anchors identity and capitalization; Japanese ウルフパック/神の嵐 and Chinese 狼群/上帝风暴 corroborate. The official Korean manual provides general faction and history context but does not prescribe these specific names. Preserve generic wolf packs as ordinary nouns and do not conflate the separately registered Withering War.'
definitions = [
  ['faction:wolf-pack', 'Wolf Pack', 'faction', '울프 팩(Wolf Pack)', '', '늑대 무리|늑대 팩|울프팩|울프 팩',
   'default:2672|default:2862|default:8310|default:9861|default:12021|default:17155|default:18198|default:20019|default:26896|default:29204|default:32783|default:33984|default:37691|default:53529|default:54674|default:55649|default:58892|default:58933|default:60253',
   'confirmed',
   'English identifies Wolf Pack as the named mercenary/death-squad unit associated with Brogan Adair, its members, and the arena team. Japanese ウルフパック supports a phonetic faction/team name; Chinese 狼群 is literal corroboration. Normalize faction references to 울프 팩(Wolf Pack), including repeated mentions in a single row. Exclude lower-case wolf pack in the two Fae contest fables at default 5605 and 27731 as generic animal-group imagery.'],
  ['event:god-storm', 'God Storm', 'named event', '신의 폭풍(God Storm)', 'The God Storm', '신폭풍',
   'default:3411|default:7155|default:32097|default:35334|default:39650|default:61425',
   'confirmed',
   'English identifies God Storm as the named Fae conflict; Japanese 神の嵐 and Chinese 上帝风暴 corroborate. Standardize as 신의 폭풍(God Storm), preserving the distinct and separately registered Withering War.']
].map do |entity, english, category, korean, aliases, variants, ids, status, note|
  glossary.headers.zip([
    entity, english, category, korean, aliases, variants,
    "D-#{d}|#{ids}", status, "#{note} #{context}"
  ]).to_h
end
raise 'one or more entities already registered' unless
  (glossary.map { |row| row['entity_key'] } & definitions.map { |row| row['entity_key'] }).empty?

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
rewrites = {
  ['default', '7155', ''] => [['신폭풍(God Storm)', '신의 폭풍(God Storm)']],
  ['default', '8310', ''] => [['늑대 무리(Wolf Pack)', '울프 팩(Wolf Pack)']],
  ['default', '9861', ''] => [['늑대 무리', '울프 팩(Wolf Pack)']],
  ['default', '12021', ''] => [['늑대 무리', '울프 팩(Wolf Pack)']],
  ['default', '17155', ''] => [['울프팩', '울프 팩(Wolf Pack)']],
  ['default', '18198', ''] => [
    ['늑대 무리(The Wolf Pack)', '울프 팩(The Wolf Pack)'],
    [' - 늑대 무리', ' - 울프 팩(Wolf Pack)', 3]
  ],
  ['default', '20019', ''] => [['늑대 무리는 지금까지', '울프 팩(Wolf Pack)은 지금까지']],
  ['default', '26896', ''] => [
    ['울프 팩이라는 정예', '울프 팩(Wolf Pack)이라는 정예'],
    ['울프 팩의 또 다른 대원', '울프 팩(Wolf Pack)의 또 다른 대원']
  ],
  ['default', '29204', ''] => [['늑대 무리(Wolf Pack)', '울프 팩(Wolf Pack)']],
  ['default', '32097', ''] => [['신의 폭풍이 대지를', '신의 폭풍(God Storm)이 대지를']],
  ['default', '32783', ''] => [
    ['늑대 무리를 둘러싼', '울프 팩(Wolf Pack)을 둘러싼'],
    ['늑대 무리에게 책임지울', '울프 팩(Wolf Pack)에게 책임지울']
  ],
  ['default', '33984', ''] => [['울프 팩이 커스우드', '울프 팩(Wolf Pack)이 커스우드']],
  ['default', '35334', ''] => [['신의 폭풍이 대지를', '신의 폭풍(God Storm)이 대지를']],
  ['default', '37691', ''] => [['늑대 무리 사건', '울프 팩(Wolf Pack) 사건']],
  ['default', '39650', ''] => [['신의 폭풍', '신의 폭풍(The God Storm)']],
  ['default', '53529', ''] => [['늑대 무리', '울프 팩(The Wolf Pack)']],
  ['default', '58892', ''] => [['늑대 무리가 우정을', '울프 팩(Wolf Pack)이 우정을']],
  ['default', '58933', ''] => [['늑대 무리가 내 목숨', '울프 팩(Wolf Pack)이 내 목숨']]
}
expected_generic = %w[5605 27731]
reviews = generated.group_by { |row| m.key(row) }.map do |key, matches|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = old.dup
  if expected_generic.include?(key[1])
    raise "unexpected generic Wolf Pack row #{key.inspect}" unless
      key[0] == 'default' && JSON.parse(source.fetch('en_texts_json')).join(' ').match?(/the chaos of the wolf pack/i)
  elsif (operations = rewrites[key])
    operations.each do |operation|
      from, to, expected_count = operation
      count = expected_count || 1
      raise "expected #{count} rewrite span(s) missing/ambiguous #{key.inspect}: #{from}" unless
        new_text.scan(from).length == count
      new_text.gsub!(from, to)
    end
  elsif key == ['default', '2672', ''] ||
        key == ['default', '2862', ''] ||
        key == ['default', '3411', ''] ||
        key == ['default', '54674', ''] ||
        key == ['default', '55649', ''] ||
        key == ['default', '60253', ''] ||
        key == ['default', '61425', '']
    # Existing bilingual canonical form is retained.
  else
    raise "unreviewed generated occurrence #{key.inspect}"
  end
  entities = matches.map { |row| row.fetch('entity_key') }.uniq
  excluded = expected_generic.include?(key[1])
  status = if excluded
             'excluded'
           elsif old == new_text
             'not-an-issue'
           else
             'accepted'
           end
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

raise "expected 27 distinct source rows, got #{reviews.length}" unless reviews.length == 27
definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'preparation output exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "27 distinct row keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
