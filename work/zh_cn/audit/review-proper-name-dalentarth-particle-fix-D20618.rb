#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
prior_path = File.join(__dir__, 'proper-name-reviewed-dalentarth-D20614.tsv')
prior = m.table(prior_path).select { |row| row['status'] == 'uncertain' }
raise "unexpected held row count #{prior.length}" unless prior.length == 7

particle_pattern = %w[
  에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
  에서도 에서는 에까지 에서 에도 에는 에서부터 으로도 으로는 으로만
  으로 로부터 로도 로는 로만 엔 처럼 까지 부터 이라며 이라는 이라서
  이라고 이라 라 은 는 이 가 을 를 와 과 의 에 로 도 만
].uniq.sort_by { |value| -value.length }.map { |value| Regexp.escape(value) }.join('|')
pattern = /(?<![가-힣])달렌타스(?:\s*\((?<label>[^()]*)\))?(?<particle>#{particle_pattern})?(?![가-힣])/

reviews = prior.map do |row|
  key = m.key(row)
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  visible_english = english.gsub(/\$[^$]*\$/, ' ')
  raise "English no longer confirms Dalentarth #{key.inspect}" unless
    visible_english.match?(/(?<![A-Za-z])Dalentarth(?![A-Za-z])/i)
  old = source.fetch('work_text')
  text = old.dup
  changed = 0
  text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
    next unless text[0...match.begin(0)].count('(') <= text[0...match.begin(0)].count(')')

    label = match[:label]
    particle = match[:particle].to_s
    replacement = if label && label.match?(/(?<![A-Za-z])Dalentarth(?![A-Za-z])/i)
                    "달렌타스(Dalentarth)#{particle}"
                  elsif label && label.match?(/[A-Za-z]/)
                    match[0]
                  else
                    "달렌타스(Dalentarth)#{particle}"
                  end
    next if replacement == match[0]

    text[match.begin(0)...match.end(0)] = replacement
    changed += 1
  end
  raise "no safe particle-bounded span for #{key.inspect}" if changed.zero?
  status = text == old ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => 'place:dalentarth', 'status' => status,
    'old' => old, 'new' => text,
    'evidence' => 'Focused follow-up to D-20614: English identifies Dalentarth, Japanese ダレンタース and Chinese 达伦塔斯 agree, and the Korean root 달렌타스 is present with an attached Korean ending/particle (including 라, 엔, 에도, and 엔). Added only the bilingual label before the existing ending; preserved the sentence, line breaks, and all other text.',
    'entity_dispositions_json' => JSON.generate('place:dalentarth' => status)
  }
end

out = File.join(__dir__, 'proper-name-reviewed-dalentarth-particle-fix-D20618.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, 20618, nil, review_states: ['uncertain'])
