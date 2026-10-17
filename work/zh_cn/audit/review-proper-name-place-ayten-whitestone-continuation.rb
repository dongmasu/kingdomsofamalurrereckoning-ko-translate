#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
abort 'usage: review-proper-name-place-ayten-whitestone-continuation.rb START_D' unless ARGV.length == 1
start_d = Integer(ARGV.fetch(0))
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary_table = m.table(glossary_path)
glossary_headers = glossary_table.headers
glossary = glossary_table.map(&:to_h)

definitions = [
  {
    'entity_key' => 'place:ayten',
    'english_canonical' => 'Ayten',
    'category' => 'place',
    'korean_canonical' => '아이텐(Ayten)',
    'english_aliases' => '',
    'korean_variants' => '아이튼|에이튼|에이텐|아텐|아이트엔',
    'evidence_ids' => 'base:2894|base:3026|default:17316|default:52384|default:64579',
    'status' => 'confirmed',
    'notes' => 'English identifies the place Ayten; Japanese アイテン and Chinese 艾滕 corroborate. Keep Ayten Circle, Lawstone, Job Board, Jail, Prison Key, Militia, Prisoner, and Inn as complete bilingual compounds rather than annotating only the place component.'
  },
  {
    'entity_key' => 'place:whitestone',
    'english_canonical' => 'Whitestone',
    'category' => 'place',
    'korean_canonical' => '화이트스톤(Whitestone)',
    'english_aliases' => '',
    'korean_variants' => '휘트스톤',
    'evidence_ids' => 'base:2595|base:398|base:3368|default:24232|default:38676|default:61721',
    'status' => 'confirmed',
    'notes' => 'English identifies Whitestone; Japanese ホワイトストーン and Chinese 白石镇 corroborate. Keep Passage, Cage Key, Prison Key, Jail, Inn, Mercenary, Tarnished, and the Mayor property titles as complete bilingual compounds.'
  }
].freeze

definitions.each do |definition|
  existing = glossary.find { |row| row['entity_key'] == definition['entity_key'] }
  next unless existing
  %w[english_canonical category korean_canonical status].each do |field|
    raise "conflicting #{definition['entity_key']} definition field #{field}" unless
      existing[field] == definition[field]
  end
end

inventory = m.refresh_inventory.values
generated = build_occurrences(inventory, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
sources = inventory.to_h { |row| [m.key(row), row.to_h] }
expected_rows = { 'place:ayten' => 98, 'place:whitestone' => 177 }
expected_rows.each do |entity, expected|
  actual = generated.count { |row| row['entity_key'] == entity }
  raise "stale #{entity} source inventory: expected #{expected}, got #{actual}" unless actual == expected
end

particle_pattern = %w[
  에서부터의 으로부터의 으로서의 으로써의 에게서부터 에게로부터
  에서부터는 에서부터도 에서부터 으로부터는 으로부터도 으로부터
  에서로부터 에서의 으로의 로부터의 로의 에의 에게서는 에게서
  에게도 에게는 에게 에서는 에까지는 에까지도 에까지 에서도
  에라도 에서라도 에는 에도 에서 으로서는 으로서도 으로써는
  으로써 으로까지는 으로까지도 으로까지 으로만 으로는 으로도
  으로 로부터 로서는 로서 로써 로도 로는 로만 로까지 이라며
  이라는 이라서 이라고 이라면 이라 라는 처럼 만큼 보다 행
  이었던 였던 까지 부터 은 는 이 가 을 를 와 과 의 에 로 도 만
].uniq.sort_by { |value| -value.length }
  .map { |value| Regexp.escape(value) }.join('|')

place_forms = {
  'place:ayten' => %w[아이텐 아이튼 에이튼 에이텐 아텐 아이트엔],
  'place:whitestone' => %w[화이트스톤 휘트스톤]
}.freeze
canonical_korean = {
  'place:ayten' => '아이텐',
  'place:whitestone' => '화이트스톤'
}.freeze
canonical_english = {
  'place:ayten' => 'Ayten',
  'place:whitestone' => 'Whitestone'
}.freeze

# Full title/name compounds are labeled as one unit, never as nested components.
compounds = [
  ['place:ayten', 'Ayten Circle', %w[서클]],
  ['place:ayten', 'Ayten Job Board', ['구인 게시판', '의뢰 게시판']],
  ['place:ayten', 'Ayten Jail', ['감옥']],
  ['place:ayten', 'Ayten Prison Key', ['감옥 열쇠']],
  ['place:ayten', 'Ayten Militia', ['민병대']],
  ['place:ayten', 'Ayten Prisoner', ['죄수'], :ayten_prisoner],
  ['place:whitestone', 'Whitestone Passage', ['통로']],
  ['place:whitestone', 'Whitestone Cage Key', ['감옥 열쇠']],
  ['place:whitestone', 'Whitestone Prison Key', ['감옥 열쇠']],
  ['place:whitestone', 'Whitestone Jail', ['감옥']],
  ['place:whitestone', 'Whitestone Inn', ['여관']],
  ['place:whitestone', 'Whitestone Mercenary', ['용병']],
  ['place:whitestone', 'Whitestone Tarnished', [], :tarnished],
  ["place:whitestone", "Whitestone Mayor's cave", ['시장(?:의)? 동굴']],
  ["place:whitestone", "Whitestone Mayor's Villa", ['시장 저택']],
  ["place:whitestone", "Whitestone Mayor's Cottage", ['시장 별장']]
].freeze
known_compound_labels = compounds.group_by(&:first).transform_values do |rows|
  rows.map { |row| row[1] }
end
known_compound_labels['place:ayten'] = [
  *known_compound_labels.fetch('place:ayten', []),
  'Ayten Lawstone',
  "Ayten's Inn"
].freeze

manual_evidence = {
  ['base', '1106', '11'] =>
    'Ayten Lawstone is already labeled as one complete bilingual item name; preserve the established Korean rendering 법석 and do not nest an Ayten label.',
  ['base', '1147', '11'] =>
    'Ayten Job Board is a complete item/title in English, Japanese アイテンの依頼掲示板, and Chinese 艾滕招聘板; label the whole Korean compound.',
  ['base', '2982', '11'] =>
    'Ayten Prison Key is a complete item name in English, Japanese アイテン監獄の鍵, and Chinese 艾滕监狱钥匙; retain 감옥 열쇠 as one compound.',
  ['base', '3026', '11'] =>
    'Ayten Jail is a complete location name in English, Japanese アイテンの監獄, and Chinese 艾滕监狱; label the whole Korean compound.',
  ['base', '1995', '11'] =>
    'Whitestone Cage Key is a complete item name in English, Japanese ホワイトストーンの檻の鍵, and Chinese 白石镇囚笼钥匙; label the whole Korean compound.',
  ['base', '3368', '11'] =>
    'Whitestone Prison Key is a complete item name in English, Japanese ホワイトストーン監獄の鍵, and Chinese 白石镇监狱钥匙; label the whole Korean compound.',
  ['default', '17316', ''] =>
    'Ayten Circle is the named location south of town; Japanese アイテン・サークル and Chinese 艾滕的风石环 corroborate. Label the complete compound.',
  ['default', '46750', ''] =>
    'Ayten Circle is explicitly named in English and Japanese アイテン・サークル; Chinese 艾滕风石环 confirms the location. Preserve the genitive particle after the complete label.',
  ['default', '50388', ''] =>
    'Ayten Circle is explicitly named in English and Japanese アイテン・サークル; Chinese 艾滕的风石环 corroborates. Preserve the Korean particle after the complete label.',
  ['default', '58497', ''] =>
    'Ayten Circle occurs twice in the English source and Japanese アイテン・サークル; Chinese 艾滕石阵 corroborates. Label both Korean mentions atomically.',
  ['default', '64579', ''] =>
    'Ayten Circle is explicitly named in English and Japanese アイテン・サークル; Chinese 艾滕石阵 corroborates. Preserve the locative particle after the complete label.',
  ['default', '26037', ''] =>
    "Whitestone Mayor's cave is a complete location/item title; Japanese ホワイトストーン市長の洞窟 and Chinese 白石镇镇长的洞穴 corroborate. Keep the city and mayor-property phrase atomic.",
  ['default', '38676', ''] =>
    "Whitestone Mayor's Villa is a complete location/item title; Japanese ホワイトストーン市長の家 and Chinese 白石镇镇长的别墅 corroborate. Keep the city and property phrase atomic.",
  ['default', '61721', ''] =>
    "Whitestone Mayor's Cottage is a complete location/item title; Japanese ホワイトストーン市長のコテージ and Chinese 白石镇镇长的小屋 corroborate. Keep the city and property phrase atomic.",
  ['default', '60152', ''] =>
    "Ayten's Inn is already a complete bilingual compound in English and Korean; preserve the established label and do not replace it with a nested Ayten label."
}.freeze

reviews = generated.map do |occurrence|
  key = m.key(occurrence)
  source = sources.fetch(key)
  entity = occurrence.fetch('entity_key')
  english_name = canonical_english.fetch(entity)
  korean_name = canonical_korean.fetch(entity)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
  chinese = source.fetch('zh_text')
  visible_english = english.gsub(/\$[^$]*\$/, ' ')
  visible_hit = visible_english.match?(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i)
  old = source.fetch('work_text')
  text = old.dup
  found = false
  unsafe = false

  forms = place_forms.fetch(entity).map { |form| Regexp.escape(form) }.join('|')
  simple_pattern = /
    (?<![가-힣])
    (?<name>#{forms})
    (?:\s*\((?<label>[^()]*)\))?
    (?<particle>#{particle_pattern})?
    (?![가-힣])
  /x

  text.to_enum(:scan, simple_pattern).map { Regexp.last_match.dup }.reverse_each do |match|
    next unless text[0...match.begin(0)].count('(') <= text[0...match.begin(0)].count(')')

    found = true
    label = match[:label]
    particle = match[:particle].to_s
    tail = text[match.end(0)..].to_s
    if label.nil? && tail.start_with?('(')
      unsafe = true
      next
    end

    replacement = if label && label.casecmp?(english_name)
                    "#{korean_name}(#{english_name})#{particle}"
                  elsif label && entity == 'place:ayten' &&
                        ['Ayten Lawstone', "Ayten's Inn"].any? { |compound| label.casecmp?(compound) }
                    match[0]
                  elsif label && known_compound_labels.fetch(entity).any? { |compound| label.casecmp?(compound) }
                    match[0]
                  elsif label
                    unsafe = true
                    match[0]
                  else
                    "#{korean_name}(#{english_name})#{particle}"
                  end
    text[match.begin(0)...match.end(0)] = replacement if replacement != match[0]
  end

  compounds.each do |compound_entity, full_english, modifiers, mode|
    next unless compound_entity == entity
    next unless visible_english.match?(/(?<![A-Za-z])#{Regexp.escape(full_english)}(?![A-Za-z])/i)

    variants = place_forms.fetch(entity).map { |form| Regexp.escape(form) }.join('|')
    modifiers_pattern = modifiers.map { |modifier| "(?:#{modifier})" }.join('|')
    compound_pattern = case mode
                       when :ayten_prisoner
                         /
                           (?<![가-힣])
                           (?:#{variants})
                           (?:\s*\((?<component>[^()]*)\))?
                           (?:의\s*)?죄수
                           (?:\s*\((?<label>[^()]*)\))?
                           (?<particle>#{particle_pattern})?
                           (?![가-힣])
                         /x
                       when :tarnished
                         /
                           (?<![가-힣])
                           더럽혀진\s*(?:#{variants})
                           (?:\s*\((?<component>[^()]*)\))?
                           (?:\s*\((?<label>[^()]*)\))?
                           (?<particle>#{particle_pattern})?
                           (?![가-힣])
                         /x
                       else
                         /
                           (?<![가-힣])
                           (?:#{variants})
                           (?:\s*\((?<component>[^()]*)\))?
                           \s+(?<modifier>#{modifiers_pattern})
                           (?:\s*\((?<label>[^()]*)\))?
                           (?<particle>#{particle_pattern})?
                           (?![가-힣])
                         /x
                       end

    text.to_enum(:scan, compound_pattern).map { Regexp.last_match.dup }.reverse_each do |match|
      next unless text[0...match.begin(0)].count('(') <= text[0...match.begin(0)].count(')')
      component = match[:component]
      label = match[:label]
      valid_component = component.nil? || component.casecmp?(english_name) ||
        component.casecmp?(full_english)
      valid_label = label.nil? || label.casecmp?(full_english) || label.casecmp?(english_name)
      unless valid_component && valid_label
        unsafe = true
        next
      end
      found = true
      replacement = if mode == :ayten_prisoner
                      "#{korean_name}의 죄수"
                    elsif mode == :tarnished
                      "더럽혀진 #{korean_name}"
                    else
                      "#{korean_name} #{match[:modifier]}"
                    end
      replacement = "#{replacement}(#{full_english})#{match[:particle]}"
      text[match.begin(0)...match.end(0)] = replacement
    end
  end

  text = old if unsafe
  status = if !visible_hit
             'excluded'
           elsif !found || unsafe
             'uncertain'
           elsif text == old
             'not-an-issue'
           else
             'accepted'
           end
  locale_support = "JA=#{japanese}; ZH=#{chinese}"
  row_exception = manual_evidence[key]
  evidence = if !visible_hit
               'The English hit occurs only inside an opaque variable, not visible player-facing text; excluded from this place-name pass.'
             elsif !found || unsafe
               "English identifies #{english_name}, but no safely bounded Korean place-name span or known bilingual-label structure was available; left unchanged for focused review. #{locale_support}"
             elsif status == 'not-an-issue'
               "English identifies #{english_name}; Japanese and Chinese corroborate the place. Existing Korean label/compound is already acceptable; left unchanged. #{locale_support}"
             else
               "English identifies #{english_name}; Japanese and Chinese corroborate the place. Standardized only the bounded Korean place span or complete named compound, preserving particles and surrounding text. #{locale_support}"
             end
  evidence = "#{evidence} #{row_exception}" if row_exception

  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entity, 'status' => status, 'old' => old, 'new' => text,
    'evidence' => evidence,
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end.sort_by do |row|
  [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante'], row['entity_key']]
end

counts = reviews.group_by { |row| row['entity_key'] }.transform_values do |rows|
  rows.group_by { |row| row['status'] }.transform_values(&:length)
end
raise 'candidate rows contain duplicate entity/row keys' unless
  generated.map { |row| [row['entity_key'], m.key(row)] }.uniq.length == generated.length
puts "Reviewed source candidates: #{expected_rows.inspect}; statuses=#{counts.inspect}"

index_table = m.table(m::INDEX)
index_headers = index_table.headers
index = index_table.map(&:to_h)
generated.each do |row|
  existing = index.find do |indexed|
    indexed['entity_key'] == row['entity_key'] && m.key(indexed) == m.key(row)
  end
  next unless existing
  raise "duplicate existing occurrence #{row['entity_key']} #{m.key(row).inspect}" if
    index.count { |indexed| indexed['entity_key'] == row['entity_key'] && m.key(indexed) == m.key(row) } > 1
end
additions = generated.reject do |row|
  index.any? { |indexed| indexed['entity_key'] == row['entity_key'] && m.key(indexed) == m.key(row) }
end

definitions.each do |definition|
  glossary << definition unless glossary.any? { |row| row['entity_key'] == definition['entity_key'] }
end
m.write_table(glossary_path, glossary_headers, glossary)
m.write_table(m::INDEX, index_headers, index + additions)

out = File.join(__dir__, 'proper-name-reviewed-ayten-whitestone-continuation.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, start_d, 50)
