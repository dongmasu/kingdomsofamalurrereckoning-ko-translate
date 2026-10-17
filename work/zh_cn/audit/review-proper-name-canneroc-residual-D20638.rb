#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
prior = m.table(File.join(__dir__, 'proper-name-reviewed-canneroc-D20635.tsv'))
  .select { |row| row['status'] == 'uncertain' }
raise "unexpected held row count #{prior.length}" unless prior.length == 2

suffixes = %w[
  에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
  에게 에서도 에서는 에까지 에서 에도 에는 으로도 으로는 으로만 으로
  로부터 로도 로는 로만 한테서 한테에게 한테 한테는 한테도 엔 처럼
  만큼이나 만큼 보다 행 였던 이었던 까지 부터 이라며 이라는 이라서 이라고
  이라 라 은 는 이 가 을 를 와 과 의 에 로 도 만
].uniq.sort_by { |value| -value.length }.map { |value| Regexp.escape(value) }.join('|')
pattern = /(?<![가-힣])(?<name>캐너록|캐네록|캐네로크|카네록|가네록)(?:\s*\((?<label>[^()]*)\))?(?<particle>#{suffixes})?(?![가-힣])/

reviews = prior.map do |row|
  key = m.key(row)
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  raise "English no longer confirms Canneroc #{key.inspect}" unless
    english.gsub(/\$[^$]*\$/, ' ').match?(/(?<![A-Za-z])Canneroc(?![A-Za-z])/i)
  old = source.fetch('work_text')
  text = old.dup
  found = false
  text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
    next unless text[0...match.begin(0)].count('(') <= text[0...match.begin(0)].count(')')
    found = true
    label = match[:label]
    particle = match[:particle].to_s
    replacement = if label && label.match?(/(?<![A-Za-z])Canneroc(?![A-Za-z])/i)
                    "캐너록(Canneroc)#{particle}"
                  elsif label && label.match?(/[A-Za-z]/)
                    match[0]
                  else
                    "캐너록(Canneroc)#{particle}"
                  end
    text[match.begin(0)...match.end(0)] = replacement
  end
  raise "no safe residual settlement span #{key.inspect}" unless found
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => 'place:canneroc', 'status' => 'accepted',
    'old' => old, 'new' => text,
    'evidence' => 'D-20638 residual review: English identifies Canneroc/Canneroc gossamer; Japanese キャネロック and Chinese 坎能洛克 corroborate the settlement and its locally made material. Normalized the attached particle case and the Korean place-name variant 가네록 to 캐너록(Canneroc), preserving the surrounding material term and sentence.',
    'entity_dispositions_json' => JSON.generate('place:canneroc' => 'accepted')
  }
end

out = File.join(__dir__, 'proper-name-reviewed-canneroc-residual-D20638.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, 20638, nil, review_states: ['uncertain'])
