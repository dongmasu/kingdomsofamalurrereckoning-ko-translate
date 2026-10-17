#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
entity = 'place:mel-senshir'
english_name = 'Mel Senshir'
korean_name = '멜 센시르'
raise 'Mel Senshir already registered' if glossary.any? { |row| row['entity_key'] == entity }

definition = glossary.headers.zip([
  entity, english_name, 'place', "#{korean_name}(#{english_name})", '',
  '메르 센시르|멜 센시어', 'base:1480|base:1928|default:125|default:687|default:1431',
  'confirmed',
  'English identifies Mel Senshir as a named city/Alfar stronghold; Japanese メル・センシール and Chinese 梅尔森希尔 corroborate the location. The established Korean form 멜 센시르 is preferred over the minor 메르 센시르 and 멜 센시어 variants. The official Korean manual does not list this city, so its omission is not contrary evidence.'
]).to_h

inventory = m.table(m::INVENTORY)
generated = build_occurrences(inventory, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
sources = inventory.to_h { |row| [m.key(row), row.to_h] }

variants = %w[멜\ 센시르 메르\ 센시르 멜\ 센시어]
name_pattern = variants.map { |value| Regexp.escape(value).gsub('\\ ', '[[:space:]]+') }
  .sort_by { |value| -value.length }.join('|')
particle_pattern = %w[
  에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
  에서도 에서는 에까지 에서 에도 에는 으로도 으로는 으로만 으로
  로부터 로도 로는 로만 엔 처럼 까지 부터 이라며 이라는 이라서
  이라고 이라 라 은 는 이 가 을 를 와 과 의 에 로 도 만
].uniq.sort_by { |value| -value.length }.map { |value| Regexp.escape(value) }.join('|')
pattern = /(?<![가-힣])(?<name>#{name_pattern})(?:\s*\((?<label>[^()]*)\))?(?<particle>#{particle_pattern})?(?![가-힣])/

reviews = generated.map do |occurrence|
  key = m.key(occurrence)
  source = sources.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  visible_english = english.gsub(/\$[^$]*\$/, ' ')
  old = source.fetch('work_text')
  text = old.dup
  visible_hit = visible_english.match?(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i)
  changed = false
  found = false

  text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
    next unless text[0...match.begin(0)].count('(') <= text[0...match.begin(0)].count(')')

    found = true
    label = match[:label]
    particle = match[:particle].to_s
    replacement = if label && label.match?(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i)
                    "#{korean_name}(#{english_name})#{particle}"
                  elsif label && label.match?(/[A-Za-z]/)
                    match[0]
                  else
                    "#{korean_name}(#{english_name})#{particle}"
                  end
    next if replacement == match[0]

    text[match.begin(0)...match.end(0)] = replacement
    changed = true
  end

  status = if !visible_hit
             'excluded'
           elsif !found
             'uncertain'
           elsif changed
             'accepted'
           else
             'not-an-issue'
           end
  evidence = if !visible_hit
               'The English hit occurs only inside an opaque variable, not visible player-facing text; excluded from the place-name consistency pass.'
             elsif !text.match?(/멜\s*센시르/)
               'English identifies Mel Senshir and the aligned Japanese/Chinese rows identify the city, but no safely bounded Korean name span was found; left unchanged.'
             else
               'English identifies the named city Mel Senshir; Japanese メル・センシール and Chinese 梅尔森希尔 corroborate the established Korean 멜 센시르. Standardized visible name spans and the reviewed 메르 센시르/멜 센시어 variants, preserving atomic longer English title labels, particles, line breaks, placeholders, and surrounding text. The official Korean manual does not enumerate this city.'
             end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entity, 'status' => status, 'old' => old, 'new' => text,
    'evidence' => evidence,
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

raise 'visible Mel Senshir source inventory changed' unless
  reviews.count { |row| row['status'] != 'excluded' } == 301
index = m.table(m::INDEX)
raise 'duplicate generated entity-row keys' unless
  generated.map { |row| m.key(row) }.uniq.length == generated.length
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + [definition])
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + generated)
out = File.join(__dir__, 'proper-name-reviewed-mel-senshir-D20619.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, 20619, nil)
