#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
specs = [
  ['place:high-fulgen', 'High Fulgen', '하이 풀겐',
   '풀겐 고원', /(?:하이\s+풀겐|풀겐\s+고원)(?:\(High Fulgen\))?/,
   'English identifies the geographic High Fulgen; Japanese フルゲン高地 and Chinese 福尔根高地 agree. Reuse the existing 하이 풀겐 form and do not expand a source-shortened or unrelated Fulgen label without separate contextual evidence.'],
  ['place:dolve-arne', 'Dolve Arne', '돌브 아르네',
   '돌브 아른|돌베 아른|덜브 아른', /(?<name>(?:돌브|돌베|덜브)\s+아(?:르네|른))(?:\(Dolve Arne\))?(?<particle>이야|이었|이다|은|이|을|과|으로)?/,
   'English calls Dolve Arne a castle/Alfar stronghold and military post, distinct from the personal Arne surname. Japanese ドルブ・アーネ / ドルベ・アーン and Chinese 阿恩城堡 confirm the location. Reuse the established base spelling 돌브 아르네 and preserve Castle Dolve Arne as an atomic full compound.'],
  ['place:dolve-wayle', 'Dolve Wayle', '돌브 웨일',
   '돌브 웨일', /돌브\s+웨일(?:\(Dolve Wayle\))?/,
   'English identifies Dolve Wayle as a Tala-Rane stronghold, ritual location, and vault location. Japanese ドルブ・ウェイル / ドルベ・ウェイル and Chinese 韦勒城堡 corroborate it. Keep distinct from Dolve Arne.']
].freeze
definitions = specs.map do |key, english, korean, variants, _pattern, evidence|
  evidence_ids = {
    'place:high-fulgen' => 'default:17343|default:20577|default:19187',
    'place:dolve-arne' => 'base:2220|base:4319|default:34706|default:23836',
    'place:dolve-wayle' => 'base:1502|base:3508|default:19522|default:34706'
  }.fetch(key)
  values = [key, english, 'place', "#{korean}(#{english})", '', variants,
            "#{evidence_ids}|D-20607-D-20608", 'confirmed', evidence]
  glossary.headers.zip(values).to_h
end
raise 'place compounds already registered' if definitions.any? do |entry|
  glossary.any? { |old| old['entity_key'] == entry['entity_key'] }
end
inventory = m.table(m::INVENTORY)
generated = build_occurrences(inventory, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
by_key = inventory.to_h { |row| [m.key(row), row.to_h] }
reviews = generated.group_by { |row| m.key(row) }.map do |key, occurrences|
  source = by_key.fetch(key)
  old = source['work_text']
  text = old.dup
  entities = occurrences.map { |row| row['entity_key'] }.sort
  evidence = []
  specs.each do |entity, english, korean, _variants, pattern, explanation|
    next unless entities.include?(entity)
    raise "missing supported place span #{key.inspect}: #{english}" unless text.match?(pattern)
    original = text
    text = original.gsub(pattern) do
      match = Regexp.last_match
      if entity == 'place:dolve-arne' &&
          original[match.end(0)..].start_with?(' 성(Castle Dolve Arne)')
        korean
      else
        particle = entity == 'place:dolve-arne' ? match[:particle] : nil
        if particle && !match[:name].end_with?('아르네')
          particle = {
            '이야' => '야', '이었' => '였', '이다' => '다',
            '은' => '는', '이' => '가', '을' => '를',
            '과' => '와', '으로' => '로'
          }.fetch(particle, particle)
        end
        "#{korean}(#{english})#{particle}"
      end
    end
    evidence << explanation
  end
  status = old == text ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'), 'status' => status, 'old' => old, 'new' => text,
    'evidence' => evidence.join(' ') +
      ' The aligned English, Japanese and Chinese place contexts were inspected together. Official-manual world/faction context is background; its non-exhaustive place list does not determine omission. Normalize only these exact place spans, preserve other names and all tokens/line breaks, and adjust particles only where the reviewed Arne spelling changes batchim.',
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, status] })
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
raise "unexpected place scope #{reviews.length}" unless reviews.length == 71
out = File.join(__dir__, 'proper-name-reviewed-place-compounds-D20607.tsv')
index = m.table(m::INDEX)
m.write_table(out, m::HEADERS, reviews)
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + definitions)
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + generated)
m.run(out, 20607, nil)
