#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

abort 'usage: review-proper-name-mithros-kandrian-apotyre-continuation.rb START_D' unless ARGV.length == 1

m = ReviewedNameBatches
start_d = Integer(ARGV.fetch(0))
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)

definitions = [
  {
    'entity_key' => 'place:mithros',
    'english_canonical' => 'Mithros',
    'category' => 'place',
    'korean_canonical' => '미스로스(Mithros)',
    'english_aliases' => '',
    'korean_variants' => '미트로스',
    'evidence_ids' => 'default:5260|default:6270|default:52978',
    'status' => 'confirmed',
    'notes' => 'English names the region Mithros; Japanese ミスロス and Chinese 米萨罗斯 corroborate. Retain the established sound-backed 미스로스 and normalize 미트로스. Pair the named Mithros Arena atomically. Titles such as The Sound of Mithros and creature labels such as Mithros Icy/Prismere Troll are outside this place entity. The official Korean manual extraction/reference has no Mithros entry.'
  },
  {
    'entity_key' => 'place:kandrian',
    'english_canonical' => 'Kandrian',
    'category' => 'place',
    'korean_canonical' => '칸드리안(Kandrian)',
    'english_aliases' => '',
    'korean_variants' => '칸드리아|칸드리|캔드리안|캔드리언',
    'evidence_ids' => 'base:2907|default:36489|default:49355',
    'status' => 'confirmed',
    'notes' => 'English identifies the region Kandrian; Japanese カンドリアン and Chinese 坎德利安 corroborate. Retain 칸드리안. Lord/Indre/Demosthenes/Derfel Kandrian, the Kandrian family, faction or creature labels, and named item titles are distinct contexts and are not normalized as the place. Pair complete place compounds such as Kandrian Keep/Cove/Stockade/Jail atomically. The official Korean manual extraction/reference has no Kandrian entry.'
  },
  {
    'entity_key' => 'place:apotyre',
    'english_canonical' => 'Apotyre',
    'category' => 'place',
    'korean_canonical' => '아포타이어(Apotyre)',
    'english_aliases' => '',
    'korean_variants' => '아포티르|아포티어|아포티레|아포티아|아포타이르',
    'evidence_ids' => 'base:3750|default:61443|default:62919|D-20315|D-20320',
    'status' => 'confirmed',
    'notes' => 'English names the region Apotyre; Japanese アポティア and Chinese 阿波泰尔 corroborate. Retain the later accepted project spelling 아포타이어 (D-20315 and D-20320), normalizing older 아포티아 as well as phonetic variants. Do not consume mining-family, mineral/item, sickness, or quest-title compounds as place labels. The official Korean manual extraction/reference has no Apotyre entry.'
  }
].freeze

entities = definitions.map { |row| row.fetch('entity_key') }
raise 'duplicate target place definition' unless entities.uniq.length == definitions.length
definitions.each do |definition|
  existing = glossary.select { |row| row['entity_key'] == definition.fetch('entity_key') }
  raise "duplicate glossary definition for #{definition['entity_key']}" if existing.length > 1
  next if existing.empty?
  row = existing.first
  raise "conflicting glossary definition for #{definition['entity_key']}" unless
    row['english_canonical'] == definition['english_canonical'] &&
    row['category'] == definition['category'] &&
    row['korean_canonical'] == definition['korean_canonical']
end

inventory = m.refresh_inventory.values
generated = build_occurrences(inventory, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
sources = inventory.to_h { |row| [m.key(row), row.to_h] }

particle_pattern = %w[
  에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
  에게 에서도 에서는 에까지 에서 에도 에는 으로도 으로는 으로만 으로
  로부터 로도 로는 로만 처럼 만큼 보다 행 였던 이었던 까지 부터
  이라며 이라는 이라서 이라고 이라 라고 라며 라 은 는 이 가 을 를 와 과 의
  에 로 도 만 들
].uniq.sort_by { |value| -value.length }.map { |value| Regexp.escape(value) }.join('|')

name_data = {
  'place:mithros' => {
    canonical: '미스로스',
    variants: %w[미스로스 미트로스],
    source_name: /\bMithros\b/i,
    excluded_source: [
      /\bThe\s+Sound\s+of\s+Mithros\b/i,
      /\bMithros\s+(?:Icy|Prismere)\s+Troll\b/i,
      /\bGiants\s+of\s+Mithros\b/i
    ],
    excluded_korean_tails: [/\A\s*의\s*(?:소리|거인들)/]
  },
  'place:kandrian' => {
    canonical: '칸드리안',
    variants: %w[칸드리안 칸드리아 칸드리 캔드리안 캔드리언],
    source_name: /\bKandrian\b/i,
    excluded_source: [
      /\b(?:The\s+)?Lord\s+(?:Indre\s+)?Kandrian\b/i,
      /\bIndre\s+Kandrian\b/i,
      /\bDemosthenes\s+Kandrian\b/i,
      /\bDerfel\s+Kandrian\b/i,
      /\bKandrian\s+family\b/i,
      /\bKandrian\s+kings?\b/i,
      /\bRose\s+of\s+Kandrian\b/i,
      /\bKandrian\s+(?:Stone|Trade\s+Writ|Goods|Guard|Bandit|Gatekeeper|Rogue)\b/i
    ],
    excluded_korean_tails: [/\A\s*(?:경|가문|왕조)/],
    ambiguous_source: [
      /\b(?:kill|assassinate)\s+Kandrian\b/i,
      /\bKandrian(?:'s)?\s+as\s+good\s+as\s+dead\b/i
    ]
  },
  'place:apotyre' => {
    canonical: '아포타이어',
    variants: %w[아포타이어 아포티르 아포티어 아포티레 아포티아 아포타이르],
    source_name: /\bApotyre\b/i,
    excluded_source: [
      /\bApotyre\s+(?:Mining\s+Families|Families|family|families|Miner|sickness|Stone)\b/i,
      /\bApotyre(?:'s)?\s+Lorestones\b/i
    ],
    excluded_korean_tails: [
      /\A\s*(?:광산\s*)?가문(?:들)?/,
      /\A\s*병(?!사)/,
      /\A\s*(?:돌|로어스톤)/
    ]
  }
}.freeze

compound_specs = [
  {
    entity: 'place:mithros', english: /\bMithros Arena\b/i,
    korean: /(?<![가-힣])(?:미스로스|미트로스)(?:\s*\(Mithros\))?\s*투기장(?:\s*\(Mithros Arena\))?(?<particle>#{particle_pattern})?(?![가-힣])/,
    label: 'Mithros Arena', korean_canonical: '미스로스 투기장'
  },
  {
    entity: 'place:kandrian', english: /\bKandrian Cove\b/i,
    korean: /(?<![가-힣])(?:칸드리안|칸드리아|칸드리|캔드리안|캔드리언)(?:\s*\(Kandrian\))?(?<noun>\s*만)(?:\s*\(Kandrian Cove\))?(?<particle>#{particle_pattern})?(?![가-힣])/,
    label: 'Kandrian Cove', korean_canonical: '칸드리안'
  },
  {
    entity: 'place:kandrian', english: /\bKandrian Stockade\b/i,
    korean: /(?<![가-힣])(?:칸드리안|칸드리아|칸드리|캔드리안|캔드리언)(?:\s*\(Kandrian\))?(?<noun>\s*(?:감금소|감옥))(?:\s*\(Kandrian Stockade\))?(?<particle>#{particle_pattern})?(?![가-힣])/,
    label: 'Kandrian Stockade', korean_canonical: '칸드리안'
  },
  {
    entity: 'place:kandrian', english: /\bKandrian Keep\b/i,
    korean: /(?<![가-힣])(?:칸드리안|칸드리아|칸드리|캔드리안|캔드리언)(?:\s*\(Kandrian\))?(?<noun>\s*(?:요새|성채))(?:\s*\(Kandrian Keep\))?(?<particle>#{particle_pattern})?(?![가-힣])/,
    label: 'Kandrian Keep', korean_canonical: '칸드리안'
  },
  {
    entity: 'place:kandrian', english: /\bKandrian Jail\b/i,
    korean: /(?<![가-힣])(?:칸드리안|칸드리아|칸드리|캔드리안|캔드리언)(?:\s*\(Kandrian\))?(?<noun>\s*감옥)(?:\s*\(Kandrian Jail\))?(?<particle>#{particle_pattern})?(?![가-힣])/,
    label: 'Kandrian Jail', korean_canonical: '칸드리안'
  },
  {
    entity: 'place:kandrian', english: /\bKandrian's Stockade\b/i,
    korean: /(?<![가-힣])(?:칸드리안|칸드리아|칸드리|캔드리안|캔드리언)(?:\s*\(Kandrian\))?\s*의\s*수용소(?:\s*\(Kandrian's Stockade\))?(?<particle>#{particle_pattern})?(?![가-힣])/,
    label: "Kandrian's Stockade", korean_canonical: '칸드리안의 수용소'
  }
].freeze

def visible_english(texts)
  texts.map { |text| text.to_s.gsub(/\$[^$]*\$/, ' ') }.join("\n")
end

def place_source_text(text, config)
  config.fetch(:excluded_source).each { |pattern| text = text.gsub(pattern, ' ') }
  text
end

def replace_place_compounds(text, source_text, entity, specs)
  changed = false
  matched = []
  missing = []
  specs.each do |spec|
    next unless spec.fetch(:entity) == entity && source_text.match?(spec.fetch(:english))
    matches = text.to_enum(:scan, spec.fetch(:korean)).map { Regexp.last_match.dup }
    if matches.empty?
      missing << spec.fetch(:label)
      next
    end
    matched << spec.fetch(:label)
    matches.reverse_each do |match|
      particle = match[:particle].to_s
      noun = match.names.include?('noun') ? match[:noun].to_s : ''
      korean = noun.empty? ? spec.fetch(:korean_canonical) :
        "#{spec.fetch(:korean_canonical)}#{noun}"
      replacement = "#{korean}(#{spec.fetch(:label)})#{particle}"
      next if match[0] == replacement
      text[match.begin(0)...match.end(0)] = replacement
      changed = true
    end
  end
  [text, changed, matched, missing]
end

def review_entity(entity, source, config, compound_specs, particle_pattern)
  english_texts = JSON.parse(source.fetch('en_texts_json') || '[]').compact
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n")
  chinese = source.fetch('zh_text').to_s
  old = source.fetch('work_text')
  english = visible_english(english_texts)
  scoped_english = place_source_text(english, config)
  ambiguous = config.fetch(:ambiguous_source, []).any? { |pattern| english.match?(pattern) }
  config.fetch(:ambiguous_source, []).each { |pattern| scoped_english = scoped_english.gsub(pattern, ' ') }
  visible_hit = english.match?(config.fetch(:source_name))
  place_hit = scoped_english.match?(config.fetch(:source_name))
  text = old.dup
  found = false
  changed = false
  compounds = []
  missing_compounds = []
  blockers = []

  text, compound_changed, compounds, missing_compounds =
    replace_place_compounds(text, scoped_english, entity, compound_specs)
  found ||= !compounds.empty?
  changed ||= compound_changed

  if !missing_compounds.empty?
    blockers.concat(missing_compounds)
  elsif place_hit
    variants = config.fetch(:variants).sort_by { |value| -value.length }
      .map { |value| Regexp.escape(value) }.join('|')
    english_name = entity.split(':').last.capitalize
    pattern = /(?<![가-힣])(?<name>#{variants})(?:\s*\(#{Regexp.escape(english_name)}\))?(?<particle>#{particle_pattern})?(?![가-힣])/
    text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
      before = text[0...match.begin(0)]
      after = text[match.end(0)..].to_s
      next if before.count('(') > before.count(')')
      next if config.fetch(:excluded_korean_tails).any? { |tail| after.match?(tail) }
      next if after.match?(/\A\s*\(/)

      if entity == 'place:kandrian'
        next if after.match?(/\A\s*경/)
        next if before.match?(/(?:인드레|데모스테네스|더펠)(?:\s*\([^()]*\))?\s*\z/)
      end
      next if after.match?(/\A[^()\r\n]{0,60}\([^()]*#{Regexp.escape(english_name)}[^()]*\)/i)
      found = true
      particle = match[:particle].to_s
      replacement = "#{config.fetch(:canonical)}(#{entity.split(':').last.capitalize})#{particle}"
      next if match[0] == replacement
      text[match.begin(0)...match.end(0)] = replacement
      changed = true
    end
  end

  status, reason = if japanese.empty? || chinese.empty?
    ['uncertain', 'Aligned Japanese and Chinese evidence is incomplete; left the row unchanged pending source verification.']
  elsif !visible_hit
    ['excluded', 'No visible English occurrence of this place name; the candidate was produced by non-visible/runtime source data and is excluded from player-facing place review.']
  elsif ambiguous
    ['uncertain', 'English includes an unresolved Kandrian personified/kill-target formulation. Even if another place mention occurs in this row, the layout has not been separately reviewed, so the whole cell is left unchanged.']
  elsif !place_hit
    ['excluded', 'The English hit belongs only to a person/family, named item, faction/creature, or title compound outside this place entity. The complete Korean phrase is preserved.']
  elsif !blockers.empty?
    ['uncertain', "English identifies the complete place compound(s) #{blockers.join(', ')}, but no safely bounded complete Korean counterpart was found; left the entire cell unchanged rather than annotate a component."]
  elsif !found
    ['uncertain', 'English identifies this place, but no safely bounded Korean place span was found outside the excluded person/title/compound contexts; left unchanged.']
  elsif changed
    ['accepted', "English identifies #{entity.split(':').last.capitalize}; aligned Japanese and Chinese corroborate. Standardized only bounded Korean place spans to #{config.fetch(:canonical)}(#{entity.split(':').last.capitalize}) and paired recognized complete place compounds atomically. Preserved person/family/item/title contexts, particles, existing full labels, placeholders, line breaks, and all surrounding text."]
  else
    ['not-an-issue', "English identifies #{entity.split(':').last.capitalize}; aligned Japanese and Chinese corroborate. The bounded Korean place span already uses the accepted form, or a complete recognized place compound is already paired; no edit is needed."]
  end
  text = old.dup if %w[uncertain excluded].include?(status)
  {
    entity: entity, status: status, old: old, new: text,
    evidence: reason
  }
end

grouped = generated.group_by { |row| m.key(row) }
raise 'duplicate generated entity/source keys' unless
  generated.map { |row| [row.fetch('entity_key'), *m.key(row)] }.uniq.length == generated.length

reviews = grouped.map do |key, occurrences|
  source = sources.fetch(key)
  decisions = occurrences.map do |occurrence|
    review_entity(occurrence.fetch('entity_key'), source,
                  name_data.fetch(occurrence.fetch('entity_key')),
                  compound_specs, particle_pattern)
  end
  raise "overlapping place transformations disagree at #{key.inspect}" unless
    decisions.map { |decision| decision[:old] }.uniq.length == 1
  old = decisions.first.fetch(:old)
  new_text = old.dup
  decisions.each do |decision|
    next if decision[:status] == 'uncertain'
    new_text = ReviewedNameBatches.rebase_review(old, decision.fetch(:new), new_text) if
      decision.fetch(:new) != old
  end
  statuses = decisions.to_h { |decision| [decision.fetch(:entity), decision.fetch(:status)] }
  status = if old != new_text
    'accepted'
  elsif statuses.values.include?('uncertain')
    'uncertain'
  elsif statuses.values.include?('accepted')
    'not-an-issue'
  elsif statuses.values.uniq.length == 1
    statuses.values.first
  else
    'not-an-issue'
  end
  evidence = decisions.map { |decision| "#{decision.fetch(:entity)}: #{decision.fetch(:evidence)}" }.join(' ')
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => decisions.map { |decision| decision.fetch(:entity) }.join('|'),
    'status' => status, 'old' => old, 'new' => new_text, 'evidence' => evidence,
    'entity_dispositions_json' => JSON.generate(statuses)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

raise 'non-accepted edit' unless
  reviews.all? { |row| row['status'] == 'accepted' || row['old'] == row['new'] }

index = m.table(m::INDEX)
index_keys = index.to_h { |row| [[row['entity_key'], *m.key(row)], row] }
raise 'duplicate existing entity/source keys' unless index_keys.length == index.length
new_occurrences = generated.reject do |occurrence|
  index_keys.key?([occurrence.fetch('entity_key'), *m.key(occurrence)])
end
new_occurrences.each do |occurrence|
  occurrence['korean_current'] = sources.fetch(m.key(occurrence)).fetch('work_text')
end

definitions_to_add = definitions.reject do |definition|
  glossary.any? { |row| row['entity_key'] == definition['entity_key'] }
end
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + definitions_to_add)
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + new_occurrences)

out = File.join(__dir__, 'proper-name-reviewed-mithros-kandrian-apotyre-continuation.tsv')
m.write_table(out, m::HEADERS, reviews)
puts "Mithros/Kandrian/Apotyre: #{generated.length} entity-row matches; " \
     "#{reviews.length} distinct resource/ID/variant keys; " \
     "#{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
m.run(out, start_d, 50)
