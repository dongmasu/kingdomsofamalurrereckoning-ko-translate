#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
ReviewedProperNameDiscovery.ensure_unused_batch!(21171)
inventory = m.refresh_inventory
glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY)
specs = [
  ['person:jakin-madsen', 'Jakin Madsen', '제이킨 매드슨(Jakin Madsen)', 'person',
   'English identifies the Valor Arena manager/reward contact; Japanese ジェイキン・マドセン and Chinese 雅金·麦德森 corroborate. Prefer the Japanese-supported pronunciation 제이킨 over the inconsistent 자킨 spelling; normalize surname 매드슨.'],
  ['resource:rialte-brocaire', 'Rialte Brocaire', '리알테 브로케어(Rialte Brocaire)', 'resource',
   'English explicitly identifies a rare northern vintage and bottle, not a person. Japanese リアルテ・ブロケール and Chinese 莱尔特·布洛凯里 corroborate the named wine. Reuse the prevalent Korean form, normalizing the isolated 브로카이레 and missing bilingual labels.'],
  ['person:maisie-calhoun', 'Maisie Calhoun', '메이지 칼훈(Maisie Calhoun)', 'person',
   'English identifies the Revival settler whose ring Maisie’s Luck is missing/stolen; Japanese メイジー・カルホーン and Chinese 梅齐·卡尔霍恩 corroborate. Reuse 메이지 칼훈 and normalize 캘훈/메이시 variants; keep the separate ring title unchanged.'],
  ['person:osgar-krast', 'Osgar Krast', '오스가르 크라스트(Osgar Krast)', 'person',
   'English identifies Medgar’s brother, Red Legion captain/bandit; Japanese オスガー・クラスト and Chinese 奥斯加·克拉斯特 corroborate. Reuse 오스가르 크라스트 and normalize 크래스트/오스거 only in this person scope.'],
  ['unique item:osgar-krasts-blade', "Osgar Krast's Blade", "오스가르 크라스트의 칼(Osgar Krast's Blade)", 'unique item',
   'English supplies the complete base item label Osgar Krast’s Blade. Japanese describes the ceremonial dagger and Chinese a sword; preserve the existing generic Korean 칼 and pair the whole title atomically without nested person parentheses.'],
  ['person:castor-redhand', 'Castor Redhand', '캐스터 레드핸드(Castor Redhand)', 'person',
   'English identifies the Wolds bandit leader with an active bounty; Japanese カストール・レッドハンド and Chinese 卡斯托·红手 corroborate. Reuse the prevalent 캐스터 레드핸드 and add missing bilingual labels.'],
  ['person:dolan-hardy', 'Dolan Hardy', '도란 하디(Dolan Hardy)', 'person',
   'English identifies the settler who stole Godric Payne’s border permit and is subject to the investigation. Japanese ドラン・ハーディー and Chinese 多兰·哈迪 corroborate 도란 하디; normalize 돌런/돌란 only in this person scope.'],
  ['person:donovan-byrnes', 'Donovan Byrnes', '도노번 번스(Donovan Byrnes)', 'person',
   'English identifies the caravan leader and named debtor/merchant. Japanese ドノヴァン・バーンズ and Chinese 多诺万·伯恩斯 corroborate 도노번 번스; normalize 도너번 variants and missing bilingual labels.']
]
definitions = specs.map do |entity, english, korean, category, note|
  values = {
    'entity_key' => entity, 'english_canonical' => english,
    'category' => category, 'korean_canonical' => korean,
    'english_aliases' => '', 'korean_variants' => '',
    'evidence_ids' => 'D-21171-D-21172', 'status' => 'confirmed',
    'notes' => "#{note} The official Korean manual PDF provides setting/quest context but does not list these named characters or the vintage."
  }
  glossary.headers.to_h { |header| [header, values[header]] }
end
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
by_key = generated.group_by { |row| m.key(row) }
reviews = by_key.keys.sort_by { |resource, id, variant| [m::RESOURCES.index(resource), id.to_i, variant] }.map do |key|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  text = old.dup
  entities = by_key.fetch(key).map { |row| row['entity_key'] }.sort
  if entities.include?('unique item:osgar-krasts-blade')
    text.gsub!(/(?:오스가르|오스거) 크라스트(?:\(Osgar Krast\))?의 칼/, "\u0001BLADE\u0002")
  end
  if entities.include?('person:jakin-madsen')
    text.gsub!(/(?:자킨|제이킨) 매드슨(?:\(Jakin Madsen\))?/, '제이킨 매드슨(Jakin Madsen)')
    text.gsub!(/자킨 마드슨(?:\(Jakin Madsen\))?/, '제이킨 매드슨(Jakin Madsen)')
  end
  if entities.include?('resource:rialte-brocaire')
    text.gsub!(/리알테 브로(?:케어|카이레)(?:\(Rialte Brocaire\))?/, '리알테 브로케어(Rialte Brocaire)')
  end
  if entities.include?('person:maisie-calhoun')
    text.gsub!(/메이지 (?:칼훈|캘훈)|메이시 칼훈/, '메이지 칼훈')
    text.gsub!(/메이지 칼훈(?:\(Maisie Calhoun\))?/, '메이지 칼훈(Maisie Calhoun)')
  end
  if entities.include?('person:osgar-krast')
    text.gsub!(/(?:오스가르|오스거) 크라스트(?:\(Osgar Krast\))?/, '오스가르 크라스트(Osgar Krast)')
    text.gsub!(/오스가르 크래스트(?:\(Osgar Krast\))?/, '오스가르 크라스트(Osgar Krast)')
  end
  text.gsub!(/캐스터 레드핸드(?:\(Castor Redhand\))?|카스토르 레드핸드(?:\(Castor Redhand\))?/, '캐스터 레드핸드(Castor Redhand)') if entities.include?('person:castor-redhand')
  text.gsub!(/(?:돌런|돌란|도란) 하디(?:\(Dolan Hardy\))?/, '도란 하디(Dolan Hardy)') if entities.include?('person:dolan-hardy')
  text.gsub!(/(?:도너번|도노번) 번스(?:\(Donovan Byrnes\))?/, '도노번 번스(Donovan Byrnes)') if entities.include?('person:donovan-byrnes')
  text.gsub!("\u0001BLADE\u0002", "오스가르 크라스트의 칼(Osgar Krast's Blade)")
  status = text == old ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'), 'status' => status, 'old' => old, 'new' => text,
    'evidence' => entities.map { |entity| definitions.find { |row| row['entity_key'] == entity }.fetch('notes') }.join(' ') + ' Aligned English, Japanese, and Chinese source contexts were checked. Standardize only exact scoped names; keep Lady Ansilla/House Ansilla and unrelated named items distinct, preserve particles, formatting and prior dispositions.',
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, status] })
  }
end
raise "unexpected source count #{reviews.length}" unless reviews.length == 55
m.write_table(File.join(__dir__, 'proper-name-discovery-definitions-D21171.tsv'), glossary.headers, definitions)
m.write_table(File.join(__dir__, 'proper-name-discovery-D21171.tsv'), m::HEADERS.take(12), reviews)
puts "#{reviews.length} rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
