#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
abort 'usage: review-proper-name-rane-regions-continuation.rb START_D' unless ARGV.length == 1
start_d = Integer(ARGV.fetch(0))
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary_table = m.table(glossary_path)
glossary_headers = glossary_table.headers
glossary = glossary_table.map(&:to_h)

definitions = [
  {
    'entity_key' => 'place:lorca-rane',
    'english_canonical' => 'Lorca-Rane',
    'category' => 'place',
    'korean_canonical' => '로르카레인(Lorca-Rane)',
    'english_aliases' => '',
    'korean_variants' => '로르카-레인|로르카 레인|로르카 라네|로카레인',
    'evidence_ids' => 'base:843|default:6197|default:7371|default:16271',
    'status' => 'confirmed',
    'notes' => 'English identifies Lorca-Rane; Japanese ローカ＝レイン and Chinese 洛卡莱恩 corroborate. The official Korean manual reference/extract contains no entry, so no manual spelling is inferred. Preserve adjacent named people, Ohn’s Stand, and other complete labels.'
  },
  {
    'entity_key' => 'place:tala-rane',
    'english_canonical' => 'Tala-Rane',
    'category' => 'place',
    'korean_canonical' => '탈라레인(Tala-Rane)',
    'english_aliases' => '',
    'korean_variants' => '탈라-레인|탈라라네|타라레인|타라-레인',
    'evidence_ids' => 'base:1904|base:2948|default:29768|default:59022',
    'status' => 'confirmed',
    'notes' => 'English identifies Tala-Rane; Japanese タラ＝レイン and Chinese 塔拉莱恩 corroborate. The official Korean manual reference/extract contains no entry, so no manual spelling is inferred. Label Tala-Rane Stone, The Fall of Tala-Rane, and Southern Tala-Rane as complete compounds.'
  },
  {
    'entity_key' => 'place:cann-rane',
    'english_canonical' => 'Cann-Rane',
    'category' => 'place',
    'korean_canonical' => '칸레인(Cann-Rane)',
    'english_aliases' => '',
    'korean_variants' => '칸-레인|캔-레인|캔레인|칸레이',
    'evidence_ids' => 'base:3217|default:9141|default:16252|default:51173',
    'status' => 'confirmed',
    'notes' => 'English identifies Cann-Rane; Japanese カン＝レイン / カン・レイン and Chinese 卡恩莱恩 / 卡恩-莱恩 corroborate. The official Korean manual reference/extract contains no entry, so no manual spelling is inferred. Preserve nearby character/title labels and particles.'
  }
].freeze

normalize_english = ->(value) { value.to_s.downcase.gsub(/[^a-z0-9]/, '') }
target_terms = definitions.flat_map do |definition|
  ([definition.fetch('english_canonical')] + definition.fetch('english_aliases').split('|'))
    .reject(&:empty?).map { |term| [normalize_english.call(term), definition.fetch('entity_key'), term] }
end
duplicate_targets = target_terms.group_by(&:first).select { |_term, rows| rows.length > 1 }
raise "duplicate canonical/alias terms in Rane definitions: #{duplicate_targets.inspect}" unless
  duplicate_targets.empty?

definitions.each do |definition|
  matches = glossary.select { |row| row['entity_key'] == definition['entity_key'] }
  raise "duplicate glossary entity #{definition['entity_key']}" if matches.length > 1
  existing = matches.first
  if existing
    %w[english_canonical category korean_canonical status].each do |field|
      raise "conflicting #{definition['entity_key']} definition field #{field}" unless
        existing[field] == definition[field]
    end
  end
end
term_owners = glossary.flat_map do |row|
  ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
    .reject(&:empty?).map { |term| [normalize_english.call(term), row['entity_key'], term] }
end
collisions = target_terms.select do |normalized, entity, _term|
  term_owners.any? { |existing, owner, _label| existing == normalized && owner != entity }
end
raise "Rane name collides with an existing glossary canonical/alias: #{collisions.inspect}" unless
  collisions.empty?

inventory = m.refresh_inventory
inventory_rows = inventory.values.to_h { |row| [m.key(row), row.to_h] }
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected_rows = {
  'place:lorca-rane' => 34,
  'place:tala-rane' => 75,
  'place:cann-rane' => 17
}.freeze
expected_mentions = {
  'place:lorca-rane' => 34,
  'place:tala-rane' => 80,
  'place:cann-rane' => 17
}.freeze
expected_rows.each do |entity, expected|
  actual = generated.count { |row| row['entity_key'] == entity }
  raise "stale #{entity} source inventory: expected #{expected}, got #{actual}" unless
    actual == expected
  english_name = definitions.find { |row| row['entity_key'] == entity }.fetch('english_canonical')
  mentions = generated.select { |row| row['entity_key'] == entity }.sum do |row|
    texts = JSON.parse(inventory_rows.fetch(m.key(row)).fetch('en_texts_json') || '[]').compact
    texts.sum do |text|
      text.scan(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i).length
    end
  end
  raise "stale #{entity} source mention count: expected #{expected_mentions.fetch(entity)}, got #{mentions}" unless
    mentions == expected_mentions.fetch(entity)
end

entities = definitions.to_h { |row| [row['entity_key'], row] }
forms = {
  'place:lorca-rane' =>
    '(?:로르카\\s*[- ]?\\s*(?:레인|라네)|로카레인)',
  'place:tala-rane' =>
    '(?:탈라\\s*[- ]?\\s*레인|타라\\s*[- ]?\\s*레인|탈라라네)',
  'place:cann-rane' =>
    '(?:칸\\s*[- ]?\\s*레인|캔\\s*[- ]?\\s*레인|칸레이)'
}.freeze
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

compound_specs = [
  {
    entity: 'place:tala-rane',
    source: /\bTala-Rane Stone\b/i,
    label: 'Tala-Rane Stone',
    korean_canonical: '탈라레인의 돌',
    mode: :tala_stone
  },
  {
    entity: 'place:tala-rane',
    source: /\bThe Fall of Tala-Rane\b/i,
    label: 'The Fall of Tala-Rane',
    korean_canonical: '탈라레인의 몰락',
    mode: :tala_fall
  },
  {
    entity: 'place:tala-rane',
    source: /\bSouthern Tala-Rane\b/i,
    label: 'Southern Tala-Rane',
    korean_canonical: '탈라레인 남부',
    mode: :southern_tala
  }
].freeze
known_compound_labels = compound_specs.group_by { |spec| spec.fetch(:entity) }
  .transform_values { |specs| specs.map { |spec| spec.fetch(:label) } }

manual_evidence = {
  ['default', '7371', ''] =>
    'The person/title Oathblade Ordura is a separate name; normalize only the bounded Lorca-Rane span and retain both its locative particle and the full Ordura label.',
  ['default', '16271', ''] =>
    "Ohn's Stand is a separate complete location label; normalize only Lorca-Rane and preserve the adjacent genitive construction.",
  ['default', '33838', ''] =>
    "Ohn's Stand is a separate complete location label; normalize only Lorca-Rane and preserve all surrounding wording and punctuation.",
  ['default', '63161', ''] =>
    'Lorca-Rane of the Faelands is a descriptive source phrase, not a new canonical place name; preserve 패란즈의 and annotate only the bounded Lorca-Rane span.',
  ['base', '2948', '11'] =>
    'Tala-Rane Stone is one complete item name; Japanese タラ＝レインの石 and Chinese 塔拉莱恩之石 corroborate. Keep the genitive inside the single bilingual item label.',
  ['default', '19522', ''] =>
    'Dolve Wayle is a separate named stronghold; annotate only the Tala-Rane region and retain the full Dolve Wayle label.',
  ['default', '29768', ''] =>
    'The Fall of Tala-Rane is a complete title; Japanese タラ＝レインの没落 and Chinese 塔拉莱恩的陷落 corroborate. Pair the whole Korean title, not just Tala-Rane.',
  ['default', '59022', ''] =>
    'Southern Tala-Rane is the exact English region phrase; Japanese 南タラ＝レイン and Chinese 塔拉莱恩南部 corroborate. Label the complete Korean phrase and retain 에.',
  ['default', '25437', ''] =>
    'Witch Knight Anira is a separate title/name; normalize only the bounded Cann-Rane span and preserve the following Korean particle.',
  ['default', '53819', ''] =>
    'Warden is a separate role; normalize only the bounded Cann-Rane span and preserve its Korean genitive particle.'
}.freeze
locale_markers = {
  'place:lorca-rane' => [/ローカ＝レイン/, /洛卡(?:-|)莱恩/],
  'place:tala-rane' => [/タラ＝レイン/, /塔拉莱恩/],
  'place:cann-rane' => [/カン＝レイン|カン・レイン/, /卡恩(?:-|)莱恩/]
}.freeze

def compound_pattern(spec, forms, particle_pattern)
  prefix = "(?<![가-힣])(?:#{forms})(?:\\s*\\((?<component>[^()]*)\\))?"
  suffix = "(?:\\s*\\((?<label>[^()]*)\\))?(?<particle>#{particle_pattern})?(?![가-힣])"
  body = case spec.fetch(:mode)
         when :tala_stone
           '(?:의\\s*)?돌'
         when :tala_fall
           '(?:의\\s*)?몰락'
         when :southern_tala
           '\\s+남부'
         else
           raise "unknown Rane compound mode #{spec.fetch(:mode).inspect}"
         end
  Regexp.new("#{prefix}#{body}#{suffix}")
end

def review_entity(text, source, entity, definition, forms, particle_pattern,
                  compound_specs, known_compound_labels)
  english_name = definition.fetch('english_canonical')
  korean_name = definition.fetch('korean_canonical').sub(/\(.*\)\z/, '')
  english_texts = JSON.parse(source.fetch('en_texts_json') || '[]').compact
  visible_english = english_texts.join("\n").gsub(/\$[^$]*\$/, ' ')
  visible_hit = visible_english.match?(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i)
  return [text, 'excluded',
          'The English hit occurs only inside an opaque variable, not visible player-facing text; excluded without changing text.'] unless visible_hit

  working = text.dup
  found = false
  unsafe = false
  missing_compounds = []
  simple_pattern = Regexp.new(
    "(?<![가-힣])(?<name>#{forms})" \
    "(?:\\s*\\((?<label>[^()]*)\\))?" \
    "(?<particle>#{particle_pattern})?(?![가-힣])"
  )

  working.to_enum(:scan, simple_pattern).map { Regexp.last_match.dup }.reverse_each do |match|
    before = working[0...match.begin(0)]
    next if before.count('(') > before.count(')')

    found = true
    label = match[:label]
    particle = match[:particle].to_s
    after = working[match.end(0)..].to_s
    if label.nil? && after.start_with?('(')
      unsafe = true
      next
    end
    valid_compound = known_compound_labels.fetch(entity, []).any? do |compound|
      label && label.casecmp?(compound)
    end
    replacement = if label && label.casecmp?(english_name)
                    "#{korean_name}(#{english_name})#{particle}"
                  elsif valid_compound
                    match[0]
                  elsif label
                    unsafe = true
                    match[0]
                  else
                    "#{korean_name}(#{english_name})#{particle}"
                  end
    working[match.begin(0)...match.end(0)] = replacement if replacement != match[0]
  end

  compound_specs.select { |spec| spec.fetch(:entity) == entity }.each do |spec|
    source_match = visible_english.match(spec.fetch(:source))
    next unless source_match
    pattern = compound_pattern(spec, forms, particle_pattern)
    matches = working.to_enum(:scan, pattern).map { Regexp.last_match.dup }
    if matches.empty?
      missing_compounds << spec.fetch(:label)
      next
    end
    found = true
    matches.reverse_each do |match|
      before = working[0...match.begin(0)]
      next if before.count('(') > before.count(')')
      component = match[:component]
      label = match[:label]
      valid_component = component.nil? || component.casecmp?(english_name) ||
        component.casecmp?(spec.fetch(:label))
      valid_label = label.nil? || label.casecmp?(english_name) ||
        label.casecmp?(spec.fetch(:label))
      unless valid_component && valid_label
        unsafe = true
        next
      end
      replacement = "#{spec.fetch(:korean_canonical)}(#{source_match[0]})#{match[:particle]}"
      working[match.begin(0)...match.end(0)] = replacement
    end
  end

  if unsafe || !missing_compounds.empty?
    detail = []
    detail << 'An unexpected parenthetical/overlapping label structure was found.' if unsafe
    detail << "No bounded Korean form matched complete source compound(s): #{missing_compounds.join(', ')}." unless
      missing_compounds.empty?
    return [text, 'uncertain',
            "English identifies #{english_name}, but #{detail.join(' ')} Left this entity's text unchanged."]
  end
  return [text, 'uncertain',
          "English identifies #{english_name}, but no bounded Korean place-name span was found. Left unchanged."] unless found

  status = working == text ? 'not-an-issue' : 'accepted'
  evidence = if status == 'accepted'
               "English identifies #{english_name}. Standardized only bounded Korean name spans, paired known complete titles atomically, and preserved particles and surrounding text."
             else
               "English identifies #{english_name}. The Korean name/compound is already correctly paired; left unchanged."
             end
  [working, status, evidence]
end

grouped_occurrences = generated.group_by { |row| m.key(row) }
overlap_keys = grouped_occurrences.select { |_key, rows| rows.length > 1 }.keys
reviews = grouped_occurrences.map do |key, occurrences|
  source = inventory_rows.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n---\n")
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
  chinese = source.fetch('zh_text').to_s
  raise "missing aligned JA/ZH evidence for #{key.inspect}" if japanese.empty? || chinese.empty?
  old = source.fetch('work_text')
  text = old.dup
  dispositions = {}
  evidence = []

  occurrences.sort_by { |row| definitions.index { |definition| definition['entity_key'] == row['entity_key'] } }
    .each do |occurrence|
      entity = occurrence.fetch('entity_key')
      text, status, detail = review_entity(
        text, source, entity, entities.fetch(entity), forms.fetch(entity),
        particle_pattern, compound_specs, known_compound_labels
      )
      dispositions[entity] = status
      ja_marker, zh_marker = locale_markers.fetch(entity)
      ja_support = japanese.match?(ja_marker) ? 'JA contains the aligned region name.' :
        'JA aligned context was checked; it does not repeat the region name.'
      zh_support = chinese.match?(zh_marker) ? 'ZH contains the aligned region name.' :
        'ZH aligned context was checked; it does not repeat the region name.'
      evidence << "#{entity}: #{detail} #{ja_support} #{zh_support} Official Korean manual reference/extract checked; no matching entry found, so no spelling is inferred from it. JA=#{japanese}; ZH=#{chinese}"
      manual = manual_evidence[key]
      evidence << manual if manual && entity == 'place:tala-rane' && manual.include?('Tala-Rane')
      evidence << manual if manual && entity == 'place:lorca-rane' && manual.include?('Lorca-Rane')
      evidence << manual if manual && entity == 'place:cann-rane' && manual.include?('Cann-Rane')
    end

  statuses = dispositions.values
  status = if statuses.include?('accepted')
             'accepted'
           elsif statuses.include?('uncertain')
             'uncertain'
           elsif statuses.all? { |value| value == 'excluded' }
             'excluded'
           else
             'not-an-issue'
           end
  text = old if statuses.include?('uncertain') && statuses.length == 1
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => dispositions.keys.join('|'), 'status' => status,
    'old' => old, 'new' => text, 'evidence' => evidence.uniq.join(' '),
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end.sort_by do |row|
  [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
end

raise 'duplicate grouped Rane review row keys' unless reviews.map { |row| m.key(row) }.uniq.length == reviews.length
raise 'non-accepted Rane edit' unless
  reviews.all? { |row| row['status'] == 'accepted' || row['old'] == row['new'] }
status_counts = reviews.group_by { |row| row['status'] }.transform_values(&:length)
entity_status_counts = generated.map do |occurrence|
  review = reviews.find { |row| m.key(row) == m.key(occurrence) }
  [occurrence.fetch('entity_key'), JSON.parse(review.fetch('entity_dispositions_json')).fetch(occurrence.fetch('entity_key'))]
end.group_by(&:first).transform_values do |pairs|
  pairs.map(&:last).group_by(&:itself).transform_values(&:length)
end
puts "Rane source rows=#{reviews.length}; overlaps=#{overlap_keys.map { |key| key.join(':') }.inspect}; row_statuses=#{status_counts.inspect}; entity_statuses=#{entity_status_counts.inspect}"

index_table = m.table(m::INDEX)
index_headers = index_table.headers
index = index_table.map(&:to_h)
generated.each do |occurrence|
  entity = occurrence.fetch('entity_key')
  key = m.key(occurrence)
  matches = index.select { |row| row['entity_key'] == entity && m.key(row) == key }
  raise "duplicate indexed entity/row key #{entity} #{key.inspect}" if matches.length > 1
  next unless matches.empty?
  occurrence['korean_current'] = inventory_rows.fetch(key).fetch('work_text')
  index << occurrence
end

definitions.each do |definition|
  glossary << definition unless glossary.any? { |row| row['entity_key'] == definition['entity_key'] }
end
m.write_table(glossary_path, glossary_headers, glossary)
m.write_table(m::INDEX, index_headers, index)

out = File.join(__dir__, 'proper-name-reviewed-rane-regions-continuation.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, start_d, 50)
