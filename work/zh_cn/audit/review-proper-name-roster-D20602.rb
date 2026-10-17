#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
inventory = m.table(m::INVENTORY)
specs = [
  ['grian-shane', 'Grian Shane', '그리안 셰인', /그리안(?:\(Grian\))?\s+셰인/, '',
   'グリアン・シェイン / 格里安·谢恩'],
  ['tine-delfric', 'Tine Delfric', '타인 델프릭', /(?:타인|티네)(?:\(Tine\))?\s+델프릭/, '',
   'タイン・デルフリック / 泰恩·德尔弗雷克'],
  ['oda-celfred', 'Oda Celfred', '오다 셀프레드', /오다\s+셀프레드/, '',
   'オダ・セルフレッド / 奥达·塞尔弗雷德'],
  ['lirin-cynric', 'Lirin Cynric', '리린 신릭', /리린\s+신릭/, '',
   'リリン・シンリック / 利林·辛瑞克'],
  ['idwold-freyward', 'Idwold Freyward', '이드월드 프레이워드',
   /이드월드\s+(?:프레이워드|프리워드)/, 'Idwold Freward',
   'イドワルド・フレイワード (roster) / イドワルド・フレワード (contract), 艾德沃尔德·弗雷瓦德'],
  ['hanrik-aulde', 'Hanrik Aulde', '한릭 올드', /한릭\s+올드/, '',
   'ハンリク・オールデ / 汉里克·奥尔德'],
  ['adrith-deofrit', 'Adrith Deofrit', '아드리스 데오프리트',
   /(?:아드리스|애드리스)\s+데오프(?:리트|릿)/, '',
   'アドリス・デオフリト / 阿德里斯·迪欧弗里特'],
  ['sverri-kura', 'Sverri Kura', '스베리 쿠라', /스베리(?:\(Sverri\))?\s+쿠라/, '',
   'スヴェリ・クーラ / 斯维里·库那']
].freeze
additions = specs.map do |slug, english, korean, _pattern, aliases, corroboration|
  values = [
    "person:#{slug}", english, 'person', "#{korean}(#{english})", aliases,
    case slug
    when 'tine-delfric' then '티네 델프릭'
    when 'idwold-freyward' then '이드월드 프리워드'
    when 'adrith-deofrit' then '아드리스 데오프릿|애드리스 데오프릿'
    else korean
    end,
    'default:32891|D-20602-D-20604', 'confirmed',
    "Complete personal name identified by the Warsworn roster, titles, and source-aligned dialogue/quest rows. #{corroboration}. Preserve the full span atomically; do not infer a different person from a short-name spelling. " +
      (aliases.empty? ? '' : 'The same Shieldring curate appears as Idwold Freward in contract rows and Idwold Freyward in the roster. Preserve each exact English source spelling in its label while unifying the Korean name; no English source file is changed.')
  ]
  glossary.headers.zip(values).to_h
end
raise 'roster entries already registered' if additions.any? do |entry|
  glossary.any? { |old| old['entity_key'] == entry['entity_key'] }
end
generated = build_occurrences(inventory, additions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
by_key = inventory.to_h { |row| [m.key(row), row.to_h] }
reviews = generated.group_by { |row| m.key(row) }.map do |key, occurrences|
  source = by_key.fetch(key)
  old = source['work_text']
  text = old.dup
  english = JSON.parse(source['en_texts_json']).compact.join("\n")
  evidence = []
  entities = occurrences.map { |row| row['entity_key'] }.sort
  specs.each do |slug, name, korean, pattern, aliases, corroboration|
    next unless entities.include?("person:#{slug}")
    spelling = [name, *aliases.split('|')].find { |term| english.include?(term) }
    raise "source-name mismatch #{key.inspect}" unless spelling
    raise "missing Korean full-name span #{key.inspect}: #{name}" unless text.match?(pattern)
    full_pattern = /#{pattern}(?:\((?:#{Regexp.escape(name)}|#{Regexp.escape(aliases)}|Castellan #{Regexp.escape(name)})\))?/
    text = text.gsub(full_pattern, "#{korean}(#{spelling})")
    evidence << "#{name}: English explicitly names the person; #{corroboration} corroborates the aligned identity/reading. Preserve the existing consistent Hanrik spelling; normalize the evidenced Tine and Adrith variants and annotate the complete name once."
  end
  # These rows explicitly identify the Warsworn commander, not Tine Grastar.
  if %w[1993 17277 9244 26441 43286].include?(key[1]) && key[0] == 'default'
    text = text.gsub(/(?<![가-힣])(?:타인|티네)(?!\(Tine| 델프릭)/,
                     '타인(Tine)')
    evidence << 'Short Tine mentions in this specific commander/Heart of Sibun correspondence are 타인(Tine); unrelated Tine Grastar rows and the previously held letter at 31969 are untouched.'
  end
  raise "duplicated English label #{key.inspect}" if
    text.match?(/\([A-Za-z][A-Za-z .'-]*\)\s*\([A-Za-z][A-Za-z .'-]*\)/)
  status = text == old ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'), 'status' => status,
    'old' => old, 'new' => text, 'evidence' => evidence.join(' ') +
      ' The official manual supplies setting/faction context but is not an exhaustive character-name list. Existing component-key dispositions are not reclassified or recounted.',
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, status] })
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
raise "unexpected roster scope #{reviews.length}" unless reviews.length == 104
index = m.table(m::INDEX)
out = File.join(__dir__, 'proper-name-reviewed-roster-D20602.tsv')
m.write_table(out, m::HEADERS, reviews)
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + additions)
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + generated)
puts "Registered #{additions.length} full names; #{generated.length} newly indexed matches in #{reviews.length} distinct rows"
m.run(out, 20602, nil)
