#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
abort 'usage: review-proper-name-place-webwood-continuation.rb START_D' unless ARGV.length == 1
start_d = Integer(ARGV.fetch(0))
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
entity = 'place:webwood'
english_name = 'Webwood'
korean_name = '웹우드'

definition = glossary.headers.zip([
  entity, english_name, 'place', "#{korean_name}(#{english_name})", '',
  '웨브우드|위브우드|거미숲|위핑우드',
  'base:3265|default:14778|default:41578|default:45239|default:32228',
  'confirmed',
  'English identifies the named forest Webwood; Japanese ウェブウッド and Chinese 蛛网森林 corroborate it. Standardize bounded Korean references to 웹우드(Webwood), including source-aligned variants. Retain particles, line breaks, complete bilingual compounds, and unrelated descriptive phrases such as 실크숲.'
]).to_h

existing_definition = glossary.find { |row| row['entity_key'] == entity }
if existing_definition
  %w[english_canonical category korean_canonical status].each do |field|
    raise "conflicting Webwood definition field #{field}" unless
      existing_definition[field] == definition[field]
  end
end

inventory = m.refresh_inventory.values
generated = build_occurrences(inventory, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
sources = inventory.to_h { |row| [m.key(row), row.to_h] }

manual_evidence = {
  ['base', '1953', '11'] =>
    'Existing 웹우드(Webwood)의 역사 correctly labels the place component and preserves the Korean title construction; retain it without nesting or rewriting the compound.',
  ['base', '3962', '11'] =>
    'Existing 웹우드(Webwood)의 돌 correctly labels the place component and preserves the Korean compound; retain it without adding a second label.',
  ['default', '320', ''] =>
    'The English poem names Webwood in its opening line; Japanese ウェブウッド and Chinese 蛛网森林 corroborate. Standardize 거미숲의 while retaining all original verse line breaks.',
  ['default', '9418', ''] =>
    'Preserve the chained locative-genitive ending exactly: 웹우드에서의 becomes 웹우드(Webwood)에서의.',
  ['default', '14330', ''] =>
    'Change only 웨브우드(Webwood) to 웹우드(Webwood). The neighboring duplicated Canneroc label belongs to a separate entity and is intentionally untouched.',
  ['default', '24508', ''] =>
    'Keep 실크숲 in the separate “forest of the silk” phrase; the explicit Webwood mention is already correctly labeled.',
  ['default', '32228', ''] =>
    'The Korean 위핑우드 is the farm-edge location identified as Webwood in English, ウェブウッド in Japanese, and 蛛网森林 in Chinese; normalize that bounded place span.',
  ['default', '41559', ''] =>
    'Normalize the source-aligned Korean variant 위브우드; retain its genitive particle 의.',
  ['default', '45239', ''] =>
    'The Korean alias 거미숲 is explicitly the Webwood location in English, Japanese ウェブウッド, and Chinese 蛛网森林.',
  ['default', '61174', ''] =>
    'This lore passage contains several distinct Webwood mentions. Review and transform each bounded mention independently, preserving the complete passage and paragraph breaks.'
}.freeze

particle_pattern = %w[
  에서부터의 으로부터의 으로서의 으로써의 에게서부터 에게로부터
  에서부터는 에서부터도 에서부터 으로부터는 으로부터도 으로부터
  에서로부터 에서의 으로의 로부터의 로의 에의 에게서는 에게서
  에게도 에게는 에게 에서는 에까지 에까지는 에까지도 에서도
  에라도 에서라도 에는 에도 에서 으로서는 으로서도 으로써는
  으로써 으로까지 으로까지는 으로까지도 으로만 으로는 으로도
  으로 로부터 로서는 로서 로써 로도 로는 로만 로까지
  이라며 이라는 이라서 이라고 이라면 이라 라는 처럼 만큼
  보다 행 이었던 였던 까지 부터 은 는 이 가 을 를 와 과 의
  에 로 도 만
].uniq.sort_by { |value| -value.length }.map { |value| Regexp.escape(value) }.join('|')
name_pattern = /
  (?<![가-힣])
  (?<name>웹우드|웨브우드|위브우드|거미숲|위핑우드)
  (?:\s*\((?<label>[^()]*)\))?
  (?<particle>#{particle_pattern})?
  (?![가-힣])
/x
webwood_pattern = /(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i

reviews = generated.map do |occurrence|
  key = m.key(occurrence)
  source = sources.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  visible_english = english.gsub(/\$[^$]*\$/, ' ')
  old = source.fetch('work_text')
  text = old.dup
  visible_hit = visible_english.match?(webwood_pattern)
  found = false
  unsafe = false

  text.to_enum(:scan, name_pattern).map { Regexp.last_match.dup }.reverse_each do |match|
    next unless text[0...match.begin(0)].count('(') <= text[0...match.begin(0)].count(')')

    found = true
    label = match[:label]
    particle = match[:particle].to_s
    tail = text[match.end(0)..].to_s
    full_label = tail.match(/\A\s+[\p{Hangul} ]{1,80}\((?<value>[^()]*)\)/)

    replacement = if label && label.match?(webwood_pattern)
                    if label.strip.casecmp?(english_name)
                      "#{korean_name}(#{label})#{particle}"
                    else
                      # A longer bilingual compound already labels Webwood atomically.
                      match[0]
                    end
                  elsif label || tail.start_with?('(')
                    unsafe = true
                    match[0]
                  elsif full_label && full_label[:value].match?(webwood_pattern)
                    # Do not add a nested component label inside a full-name label.
                    match[0]
                  else
                    "#{korean_name}(#{english_name})#{particle}"
                  end
    text[match.begin(0)...match.end(0)] = replacement if replacement != match[0]
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
  exception = manual_evidence[key]
  evidence = if !visible_hit
               'The English hit occurs only inside an opaque variable, not visible player-facing text; excluded from this place-name pass.'
             elsif !found || unsafe
               'English identifies Webwood, but no safely bounded Korean place-name span was available; left unchanged for focused review.'
             elsif status == 'not-an-issue'
               'English identifies Webwood; Japanese ウェブウッド and Chinese 蛛网森林 corroborate. The bounded Korean name is already correctly paired or covered by a complete bilingual compound; left unchanged.'
             else
               'English identifies the named forest Webwood; Japanese ウェブウッド and Chinese 蛛网森林 corroborate. Standardized only bounded Webwood name spans to 웹우드(Webwood), preserving particles, complete bilingual compounds, line breaks, and surrounding text.'
             end
  evidence = "#{evidence} #{exception}" if exception

  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entity, 'status' => status, 'old' => old, 'new' => text,
    'evidence' => evidence,
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end.sort_by do |row|
  [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
end

counts = reviews.group_by { |row| row['status'] }.transform_values(&:length)
raise 'visible Webwood source inventory changed' unless
  generated.length == 119 && counts == { 'accepted' => 83, 'not-an-issue' => 36 }

index = m.table(m::INDEX)
raise 'duplicate generated Webwood entity-row keys' unless
  generated.map { |row| m.key(row) }.uniq.length == generated.length
existing_entity_rows = index.select { |row| row['entity_key'] == entity }
existing_entity_keys = existing_entity_rows.map { |row| m.key(row) }
raise 'duplicate existing Webwood entity-row keys' unless
  existing_entity_keys.uniq.length == existing_entity_keys.length
additions = generated.reject { |row| existing_entity_keys.include?(m.key(row)) }

unless existing_definition
  glossary << definition
end
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h))
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + additions)

out = File.join(__dir__, 'proper-name-reviewed-webwood-continuation.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, start_d, 50)
