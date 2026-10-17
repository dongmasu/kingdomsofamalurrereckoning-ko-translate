#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
prior = m.table(File.join(__dir__, 'proper-name-reviewed-crownhold-D20642.tsv'))
  .select { |row| row['status'] == 'uncertain' }
raise "unexpected held row count #{prior.length}" unless prior.length == 3

suffixes = %w[
  에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
  에게 에서도 에서는 에선 에까지 에서 에도 에는 으로도 으로는 으로만
  으로 로부터 로도 로는 로만 엔 처럼 만큼은 만큼 보다 행 였던 이었던
  까지 부터 이라며 이라는 이라서 이라고 이라 야 라 은 는 이 가 을 를
  와 과 의 에 로 도 만
].uniq.sort_by { |value| -value.length }.map { |value| Regexp.escape(value) }.join('|')
pattern = /(?<![가-힣])크라운홀드(?<particle>#{suffixes})?(?![가-힣])/

reviews = prior.map do |row|
  key = m.key(row)
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  raise "English no longer confirms Crownhold #{key.inspect}" unless
    english.gsub(/\$[^$]*\$/, ' ').match?(/(?<![A-Za-z])Crownhold(?![A-Za-z])/i)
  old = source.fetch('work_text')
  text = old.dup
  changed = 0
  text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
    next unless text[0...match.begin(0)].count('(') <= text[0...match.begin(0)].count(')')
    particle = match[:particle].to_s
    text[match.begin(0)...match.end(0)] = "크라운홀드(Crownhold)#{particle}"
    changed += 1
  end
  raise "no safe residual city-name span #{key.inspect}" if changed.zero?
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => 'place:crownhold', 'status' => 'accepted',
    'old' => old, 'new' => text,
    'evidence' => 'D-20646 residual review: English identifies Crownhold, Japanese クラウンホールド and Chinese 皇冠堡 corroborate, and the Korean form is attached to a colloquial/conjunctive ending. Inserted the canonical city label before that ending without changing the surrounding phrase.',
    'entity_dispositions_json' => JSON.generate('place:crownhold' => 'accepted')
  }
end

out = File.join(__dir__, 'proper-name-reviewed-crownhold-residual-D20646.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, 20646, nil, review_states: ['uncertain'])
