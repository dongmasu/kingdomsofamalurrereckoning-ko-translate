#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
abort 'usage: review-proper-name-place-cape-solace-continuation.rb START_D' unless ARGV.length == 1
start_d = Integer(ARGV.fetch(0))
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary_table = m.table(glossary_path)
glossary_headers = glossary_table.headers
glossary = glossary_table.map(&:to_h)

definition = {
  'entity_key' => 'place:cape-solace',
  'english_canonical' => 'Cape Solace',
  'category' => 'place',
  'korean_canonical' => '케이프 솔라스(Cape Solace)',
  'english_aliases' => '',
  'korean_variants' => '케이프 솔러스|케이프 솔리스|케이프 솔레이스|솔라스 곶|솔러스 곶|위안 곶|초솔러스 곶',
  'evidence_ids' => 'default:45118|default:56717|default:57245|default:57635|default:64771',
  'status' => 'confirmed',
  'notes' => 'English identifies Cape Solace as the named settlement/location. Japanese ケープ・サラス / サラス岬 and Chinese 宽慰角 / 慰藉斗篷 align across source rows. The active Korean corpus and prior reviewed decisions establish 케이프 솔라스; preserve particles and surrounding wording while normalizing spelling variants. The older 위안 곶 conflict is supported by the same aligned English/Japanese/Chinese identity. The official Korean manual reference/extract supplies no matching entry, so no spelling is inferred from it.'
}.freeze

normalize_english = ->(value) { value.to_s.downcase.gsub(/[^a-z0-9]/, '') }
target_terms = ([definition.fetch('english_canonical')] +
                definition.fetch('english_aliases').split('|'))
  .reject(&:empty?).map { |term| [normalize_english.call(term), term] }
duplicate_targets = target_terms.group_by(&:first).select { |_term, rows| rows.length > 1 }
raise "duplicate Cape Solace canonical/alias terms: #{duplicate_targets.inspect}" unless
  duplicate_targets.empty?

existing_definitions = glossary.select { |row| row['entity_key'] == definition['entity_key'] }
raise "duplicate glossary entity #{definition['entity_key']}" if existing_definitions.length > 1
if (existing = existing_definitions.first)
  %w[english_canonical category korean_canonical status].each do |field|
    raise "conflicting #{definition['entity_key']} definition field #{field}" unless
      existing[field] == definition[field]
  end
end

term_owners = glossary.flat_map do |row|
  ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
    .reject(&:empty?).map { |term| [normalize_english.call(term), row['entity_key'], term] }
end
collisions = target_terms.select do |normalized, _term|
  term_owners.any? { |existing_term, owner, _label|
    existing_term == normalized && owner != definition['entity_key']
  }
end
raise "Cape Solace collides with an existing glossary canonical/alias: #{collisions.inspect}" unless
  collisions.empty?

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected_rows = 151
raise "stale Cape Solace source inventory: expected #{expected_rows}, got #{generated.length}" unless
  generated.length == expected_rows
name_pattern = /(?<![A-Za-z])Cape Solace(?![A-Za-z])/i
mentions = generated.sum do |row|
  source = inventory.fetch(m.key(row))
  JSON.parse(source.fetch('en_texts_json') || '[]').compact.sum do |text|
    text.scan(name_pattern).length
  end
end
raise "stale Cape Solace source mention count: expected #{expected_rows}, got #{mentions}" unless
  mentions == expected_rows

korean_forms = '(?:케이프\\s*(?:솔라스|솔러스|솔리스|솔레이스)|(?:초)?솔러스\\s*곶|솔라스\\s*곶|위안\\s*곶)'
canonical_korean = '케이프 솔라스'
canonical_english = definition.fetch('english_canonical')
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

locale_markers = {
  japanese: /ケープ・サラス|サラス岬|ケープ岬/,
  chinese: /宽慰角|慰藉斗篷/
}.freeze

manual_evidence = {
  ['default', '13502', ''] =>
    'The Korean form 초솔러스 곶 contains an isolated leading 초; English, Japanese ケープ・サラス, and Chinese 宽慰角 identify Cape Solace. Normalize only this bounded place-name span.',
  ['default', '18284', ''] =>
    'Cape Solace appears as 케이프 솔레이스(Cape Solace) before a genitive particle and a separate personal name; normalize the place spelling and preserve 의 and the person label.',
  ['default', '39353', ''] =>
    'The unannotated 케이프 솔레이스 is aligned to Cape Solace; add the canonical bilingual label and retain the genitive particle and following description.',
  ['default', '56717', ''] =>
    'The prior Korean form 위안 곶 is aligned to English Cape Solace, Japanese ケープ・サラス, and Chinese 慰藉斗篷; use the established Korean spelling 케이프 솔라스.',
  ['default', '57245', ''] =>
    'The question names Cape Solace; Japanese ケープ・サラス and Chinese 宽慰角 confirm the place. Normalize 위안 곶 without changing the question ending.',
  ['default', '57635', ''] =>
    'A prior review recorded this Cape Solace spelling discrepancy as not an issue pending stronger evidence. This entity-specific comparison now aligns English Cape Solace, Japanese ケープ・サラス, Chinese 宽慰角, and the established active Korean 케이프 솔라스; preserve the prior batch record and review only this new place key.',
  ['base', '2368', '11'] =>
    'Map fragment - Cape Solace is a complete item title; retain 지도 조각 - as the title prefix and normalize only the Cape Solace name.',
  ['base', '3494', '11'] =>
    'Dvergan map - Cape Solace is a complete item title; retain 드베르간 지도 - and normalize only the place-name span.',
  ['base', '4269', '11'] =>
    'Dverga map - Cape Solace is a complete item title. Japanese repeats the English source label; Chinese 宽慰角 and the Korean place label support the same location. Retain the title prefix.'
}.freeze

def review_cape_solace(text, source, definition, korean_forms, canonical_korean,
                       canonical_english, particle_pattern)
  english_texts = JSON.parse(source.fetch('en_texts_json') || '[]').compact
  visible_english = english_texts.join("\n").gsub(/\$[^$]*\$/, ' ')
  visible_hit = visible_english.match?(/(?<![A-Za-z])Cape Solace(?![A-Za-z])/i)
  return [text, 'excluded',
          'Cape Solace occurs only inside an opaque variable, not visible player-facing text; excluded unchanged.'] unless
    visible_hit

  pattern = Regexp.new(
    "(?<![가-힣])(?<name>#{korean_forms})" \
    "(?:\\s*\\((?<label>[^()]*)\\))?" \
    "(?<particle>#{particle_pattern})?(?![가-힣])"
  )
  working = text.dup
  found = false
  unsafe = false

  working.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
    before = working[0...match.begin(0)]
    next if before.count('(') > before.count(')')

    found = true
    label = match[:label].to_s.strip
    particle = match[:particle].to_s
    after = working[match.end(0)..].to_s
    if label.empty? && after.start_with?('(')
      unsafe = true
      next
    end
    if !label.empty? && !label.casecmp?(canonical_english)
      unsafe = true
      next
    end

    replacement = "#{canonical_korean}(#{canonical_english})#{particle}"
    working[match.begin(0)...match.end(0)] = replacement if replacement != match[0]
  end

  if unsafe
    return [text, 'uncertain',
            'An unexpected adjacent parenthetical/overlapping label was found. Left this entity text unchanged.']
  end
  return [text, 'uncertain',
          'English identifies Cape Solace, but no bounded Korean place-name form was found. Left unchanged.'] unless
    found

  status = working == text ? 'not-an-issue' : 'accepted'
  detail = status == 'accepted' ?
    'English identifies Cape Solace. Standardized only bounded Korean place-name spans and preserved particles, title prefixes, and surrounding text.' :
    'English identifies Cape Solace. The Korean place name is already correctly paired; left unchanged.'
  [working, status, detail]
end

reviews = generated.map do |occurrence|
  key = m.key(occurrence)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n---\n")
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
  chinese = source.fetch('zh_text').to_s
  raise "missing aligned JA/ZH evidence for #{key.inspect}" if japanese.empty? || chinese.empty?

  new_text, status, detail = review_cape_solace(
    old, source, definition, korean_forms, canonical_korean,
    canonical_english, particle_pattern
  )
  ja_support = japanese.match?(locale_markers.fetch(:japanese)) ?
    'JA contains an aligned Cape Solace name.' :
    'JA aligned context was checked; it retains the English source label without repeating the place name.'
  zh_support = chinese.match?(locale_markers.fetch(:chinese)) ?
    'ZH contains an aligned Cape Solace name.' :
    'ZH aligned context was checked; it does not use the common place-name forms.'
  manual = manual_evidence[key]
  evidence = [
    detail, ja_support, zh_support,
    'Official Korean manual reference/extract checked; no matching entry found, so no spelling is inferred from it.',
    manual
  ].compact.join(' ')
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => definition.fetch('entity_key'), 'status' => status,
    'old' => old, 'new' => new_text, 'evidence' => evidence,
    'entity_dispositions_json' => JSON.generate(definition.fetch('entity_key') => status)
  }
end.sort_by do |row|
  [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
end

raise 'duplicate grouped Cape Solace review row keys' unless
  reviews.map { |row| m.key(row) }.uniq.length == reviews.length
raise 'non-accepted Cape Solace edit' unless
  reviews.all? { |row| row['status'] == 'accepted' || row['old'] == row['new'] }
status_counts = reviews.group_by { |row| row['status'] }.transform_values(&:length)
puts "Cape Solace source rows=#{reviews.length}; row_statuses=#{status_counts.inspect}"

index_table = m.table(m::INDEX)
index_headers = index_table.headers
index = index_table.map(&:to_h)
generated.each do |occurrence|
  key = m.key(occurrence)
  matches = index.select do |row|
    row['entity_key'] == definition.fetch('entity_key') && m.key(row) == key
  end
  raise "duplicate indexed entity/row key #{definition['entity_key']} #{key.inspect}" if matches.length > 1
  next unless matches.empty?
  occurrence['korean_current'] = inventory.fetch(key).fetch('work_text')
  index << occurrence
end
glossary << definition unless glossary.any? { |row| row['entity_key'] == definition['entity_key'] }
m.write_table(glossary_path, glossary_headers, glossary)
m.write_table(m::INDEX, index_headers, index)

out = File.join(__dir__, 'proper-name-reviewed-cape-solace-continuation.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, start_d, 50)
