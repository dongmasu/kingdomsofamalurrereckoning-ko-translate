#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
ReviewedProperNameDiscovery.ensure_unused_batch!(21_185)
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
definitions = [
  [
    'item:piercing-light', 'Piercing Light', 'unique item',
    '관통의 빛(Piercing Light)', '', '관통의 빛|꿰뚫는 빛',
    'D-21185|base:4013:11|default:459|default:25693', 'confirmed',
    'English identifies the named spear carved from the Niskaru duke Gajaor’s tusk, sought by Tilera at Urul-Tusk; Japanese 光の槍 and Chinese 穿刺之光 corroborate. Reuse the base-label Korean 관통의 빛 and annotate its full English name. Manual PDF p. 9 provides unique-item/lore context, not an explicit translation of this weapon.'
  ],
  [
    'title:high-kings-guide', "High King's Guide", 'title',
    "지고왕의 길잡이(High King's Guide)", '', '최고왕의 안내자|지고왕의 길잡이|대왕의 안내자',
    'D-21185|default:25033|default:33919|default:43945|default:57713', 'confirmed',
    'English explicitly grants this title at default 57713; the male/female introductions at 25033/33919 refer to that same title. Japanese 至高王の案内人 and Chinese 向导/幕僚 corroborate. Use 지고왕 from D-21182 and the established introduction noun 길잡이; keep the complete title atomic, without nested High King parentheses. Manual PDF p. 1 supplies the fate-changing protagonist context, not this exact title.'
  ]
].map { |values| glossary.headers.zip(values).to_h }

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
counts = generated.group_by { |row| row.fetch('entity_key') }.transform_values(&:length)
raise "unexpected source coverage #{counts.inspect}" unless
  counts == { 'item:piercing-light' => 13, 'title:high-kings-guide' => 4 }

reviews = generated.group_by { |row| m.key(row) }.map do |key, matches|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = old.dup
  if matches.any? { |row| row['entity_key'] == 'item:piercing-light' }
    new_text.gsub!(/(?:관통의 빛|꿰뚫는 빛)(?:\s*\(Piercing Light\))?/, '관통의 빛(Piercing Light)')
  end
  if matches.any? { |row| row['entity_key'] == 'title:high-kings-guide' }
    new_text.gsub!(
      /(?:지고왕|최고왕|대왕)(?:\s*\(High King\))?의\s+(?:길잡이|안내자)(?:\s*\(High King's Guide\))?/,
      "지고왕의 길잡이(High King's Guide)"
    )
  end
  status = old == new_text ? 'not-an-issue' : 'accepted'
  evidence = if matches.first['entity_key'] == 'item:piercing-light'
               'Named spear: English default 459/25693 identifies Piercing Light as the Niskaru-tusk spear sought by Tilera, not an ordinary beam of light. Japanese 光の槍 and Chinese 穿刺之光 agree; base 4013 anchors 관통의 빛. Preserve unrelated wording. Manual PDF p. 9 provides item/lore context only.'
             else
               "Named bestowed title: English default 57713 explicitly proclaims High King's Guide; default 25033/33919 are gendered introductions to the same title. Japanese 至高王の案内人 and Chinese 向导/幕僚 support the advisor/guide role. Use 지고왕의 길잡이 with the full English title, preserving previous personal-name annotations. Manual PDF p. 1 provides protagonist context only."
             end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => matches.map { |row| row['entity_key'] }.sort.join('|'),
    'status' => status, 'old' => old, 'new' => new_text, 'evidence' => evidence,
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(matches.to_h { |row| [row['entity_key'], status] })
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

definitions_path = File.join(__dir__, 'proper-name-discovery-definitions-D21185.tsv')
reviews_path = File.join(__dir__, 'proper-name-discovery-D21185.tsv')
raise 'preparation output exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "#{reviews.length} distinct row keys; #{counts.inspect}"
puts reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect
