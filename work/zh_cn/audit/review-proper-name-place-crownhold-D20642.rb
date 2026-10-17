#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
entity = 'place:crownhold'
english_name = 'Crownhold'
korean_name = '크라운홀드'
raise 'Crownhold already registered' if glossary.any? { |row| row['entity_key'] == entity }

definition = glossary.headers.zip([
  entity, english_name, 'place', "#{korean_name}(#{english_name})", '', '',
  'base:4561|default:327|default:10372|default:40312',
  'confirmed',
  'English identifies Crownhold as a named city; Japanese クラウンホールド and Chinese 皇冠堡 corroborate. The active Korean form 크라운홀드 is consistent. Complete location labels such as Crownhold City, Crownhold Prison, Crownhold Armory, and Crownhold Garrison are paired atomically rather than component-by-component.'
]).to_h

inventory = m.table(m::INVENTORY)
generated = build_occurrences(inventory, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
sources = inventory.to_h { |row| [m.key(row), row.to_h] }
compound_labels = {
  ['default', '327', ''] => ['크라운홀드 시', '크라운홀드 시(Crownhold City)'],
  ['default', '10372', ''] => ['크라운홀드 감옥', '크라운홀드 감옥(Crownhold Prison)'],
  ['default', '40312', ''] => ['크라운홀드 무기고', '크라운홀드 무기고(Crownhold Armory)'],
  ['default', '54067', ''] => ['크라운홀드 주둔지', '크라운홀드 주둔지(Crownhold Garrison)']
}.freeze
particle_pattern = %w[
  에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
  에게 에서도 에서는 에까지 에서 에도 에는 으로도 으로는 으로만 으로
  로부터 로도 로는 로만 엔 처럼 만큼 보다 행 였던 이었던 까지 부터
  이라며 이라는 이라서 이라고 이라 라 은 는 이 가 을 를 와 과 의
  에 로 도 만
].uniq.sort_by { |value| -value.length }.map { |value| Regexp.escape(value) }.join('|')
pattern = /(?<![가-힣])크라운홀드(?:\s*\((?<label>[^()]*)\))?(?<particle>#{particle_pattern})?(?![가-힣])/

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

  if compound_labels.key?(key)
    expected, replacement = compound_labels.fetch(key)
    raise "stale complete compound #{key.inspect}" unless old == expected
    text = replacement
    found = true
    changed = true
  else
    text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
      next unless text[0...match.begin(0)].count('(') <= text[0...match.begin(0)].count(')')
      found = true
      label = match[:label]
      particle = match[:particle].to_s
      tail = text[match.end(0)..]
      full_label = tail.match(/\A\s+[\p{Hangul} ]{1,55}\((?<value>[^()]*)\)/)
      replacement = if label && label.match?(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i)
                      "#{korean_name}(#{english_name})#{particle}"
                    elsif label && label.match?(/[A-Za-z]/)
                      match[0]
                    elsif full_label && full_label[:value].match?(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i)
                      match[0]
                    else
                      "#{korean_name}(#{english_name})#{particle}"
                    end
      next if replacement == match[0]
      text[match.begin(0)...match.end(0)] = replacement
      changed = true
    end
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
               'The English hit occurs only inside an opaque variable, not visible player-facing text; excluded from this city-name pass.'
             elsif !found
               'English identifies Crownhold, but no safely bounded Korean place-name span was found; left unchanged.'
             elsif compound_labels.key?(key)
               'English identifies the complete named location; added its full bilingual label atomically rather than annotating the Crownhold component separately. Japanese and Chinese place forms were cross-checked.'
             else
               'English identifies Crownhold as a named city; Japanese クラウンホールド and Chinese 皇冠堡 corroborate. Standardized bounded Korean place-name spans to 크라운홀드(Crownhold), preserving complete longer labels, particles, line breaks, placeholders, and surrounding text.'
             end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entity, 'status' => status, 'old' => old, 'new' => text,
    'evidence' => evidence,
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

raise 'visible Crownhold source inventory changed' unless
  reviews.count { |row| row['status'] != 'excluded' } == 173
index = m.table(m::INDEX)
raise 'duplicate generated entity-row keys' unless
  generated.map { |row| m.key(row) }.uniq.length == generated.length
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + [definition])
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + generated)
out = File.join(__dir__, 'proper-name-reviewed-crownhold-D20642.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, 20642, nil)
