#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
repairs = [
  ['14318', 'person:harit', '하리트(Harit) 과일(Harit Wyle)', '하리트 와일(Harit Wyle)',
   'Harit Wyle', 'ハリット・ワイル', '哈里特·怀尔'],
  ['17797', 'person:dren', '캐리스 드렌(Dren)(Callis Dren)', '캐리스 드렌(Callis Dren)',
   'Callis Dren', 'キャリス・ドレン', '卡利斯∙德伦'],
  ['27676', 'person:ariope', '아리오페(Ariope)(Ariope)', '아리오페(Ariope)',
   'Ariope', 'エリオプ', '阿里欧佩'],
  ['60301', 'person:grian', '그리안 셰인(Grian Shane)(Castellan Grian Shane)', '그리안 셰인(Grian Shane)',
   'Grian Shane', 'グリアン・シェイン', '格里安·谢恩']
].freeze
reviews = repairs.map do |id, entity, before, after, english_name, japanese_name, chinese_name|
  source = inventory.fetch(['default', id, ''])
  english = JSON.parse(source['en_texts_json']).compact.join("\n")
  japanese = JSON.parse(source['ja_texts_json']).compact.join("\n")
  raise "source identity mismatch #{id}" unless english.include?(english_name) &&
    japanese.include?(japanese_name) && source['zh_text'].include?(chinese_name)
  old = source['work_text']
  raise "missing exact defective label #{id}" unless old.scan(before).length == 1
  new_text = old.sub(before, after)
  {
    'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
    'entity_key' => entity, 'status' => 'accepted', 'old' => old, 'new' => new_text,
    'evidence' => "Final label-shape correction, not a new global classification. English #{english_name}, Japanese #{japanese_name}, and Chinese #{chinese_name} identify the same name. Retain one atomic full-name label without adjacent duplicated English labels. For Harit Wyle, Japanese ワイル and the existing Guenfear Wyle/Wyle Home rows support 와일, not the accidental ordinary noun 과일. For Castellan Grian Shane, preserve the already translated Korean title outside the name rather than annotating the same name twice. The official manual does not list these individuals; unrelated wording is unchanged.",
    'entity_dispositions_json' => JSON.generate(entity => 'accepted')
  }
end
out = File.join(__dir__, 'proper-name-reviewed-label-cleanup-D20601.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, 20601, nil, review_states: %w[accepted not-an-issue])
