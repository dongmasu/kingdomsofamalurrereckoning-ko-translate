#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
entity = 'monster:niskaru'
english_name = 'Niskaru'
korean_name = '니스카루'
raise 'Niskaru already registered' if glossary.any? { |row| row['entity_key'] == entity }

definition = glossary.headers.zip([
  entity, english_name, 'monster', "#{korean_name}(#{english_name})", '', '',
  'base:1145|base:1404|default:1670|default:51625',
  'confirmed',
  'English identifies the Niskaru as a named Amalur monster species; Japanese ニスカル and Chinese 尼斯卡鲁 corroborate the name. The Korean corpus consistently uses 니스카루. Individual ranks such as Niskaru Lord remain source compounds, with the species label applied only to the bounded Niskaru span.'
]).to_h

inventory = m.table(m::INVENTORY)
generated = build_occurrences(inventory, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
sources = inventory.to_h { |row| [m.key(row), row.to_h] }
particle_pattern = %w[
  에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
  에서도 에서는 에까지 에서 에도 에는 으로도 으로는 으로만 으로
  로부터 로도 로는 로만 엔 처럼 만큼 보다 행 였던 이었던 까지 부터
  이라며 이라는 이라서 이라고 이라 라 은 는 이 가 을 를 와 과 의
  에 로 도 만 들 족 족은 족이 족을 어 어로 어의
].uniq.sort_by { |value| -value.length }.map { |value| Regexp.escape(value) }.join('|')
pattern = /(?<![가-힣])니스카루(?:\s*\((?<label>[^()]*)\))?(?<particle>#{particle_pattern})?(?![가-힣])/

reviews = generated.map do |occurrence|
  key = m.key(occurrence)
  source = sources.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  visible_english = english.gsub(/\$[^$]*\$/, ' ')
  old = source.fetch('work_text')
  text = old.dup
  visible_hit = visible_english.match?(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i)
  found = false
  changed = false

  text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
    next unless text[0...match.begin(0)].count('(') <= text[0...match.begin(0)].count(')')

    found = true
    particle = match[:particle].to_s
    label = match[:label]
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
               'The English hit occurs only inside an opaque variable, not visible player-facing text; excluded from this species-name pass.'
             elsif !found
               'English identifies Niskaru, but no safely bounded Korean 니스카루 span was found; left unchanged for focused context review.'
             else
               'English identifies the Niskaru monster species; Japanese ニスカル and Chinese 尼斯卡鲁 corroborate. Standardized only bounded Korean species-name spans to 니스카루(Niskaru), preserving particles, complete longer labels, line breaks, placeholders, and surrounding text.'
             end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entity, 'status' => status, 'old' => old, 'new' => text,
    'evidence' => evidence,
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

raise 'visible Niskaru source inventory changed' unless
  reviews.count { |row| row['status'] != 'excluded' } == 319
index = m.table(m::INDEX)
raise 'duplicate generated entity-row keys' unless
  generated.map { |row| m.key(row) }.uniq.length == generated.length
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + [definition])
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + generated)
out = File.join(__dir__, 'proper-name-reviewed-niskaru-D20627.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, 20627, nil)
