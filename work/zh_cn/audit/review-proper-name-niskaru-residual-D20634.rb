#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
prior = m.table(File.join(__dir__, 'proper-name-reviewed-niskaru-D20627.tsv'))
  .select { |row| row['status'] == 'uncertain' }
raise "unexpected held row count #{prior.length}" unless prior.length == 19

suffixes = %w[
  에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
  에서도 에서는 에까지 에서 에도 에는 으로도 으로는 으로만 으로
  에게 에게서 에게도 에게는 로부터 로도 로는 로만 한테서 한테에게 한테 한테는 한테도
  라고들 이라고들 라고는 라고도 라고 라니 라며 이라며 이라는 이라서
  이라고 이라 인가 이며 이었다 였다 였던 이었던 만의 지만 들이 들은 들을
  군 나 야 라 은 는 이 가 을 를 와 과 의 에 로 도 만 들 족 족은
].uniq.sort_by { |value| -value.length }.map { |value| Regexp.escape(value) }.join('|')
pattern = /(?<![가-힣])니스카루(?<particle>#{suffixes})?(?![가-힣])/

reviews = prior.map do |row|
  key = m.key(row)
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  visible_english = english.gsub(/\$[^$]*\$/, ' ')
  raise "English no longer confirms Niskaru #{key.inspect}" unless
    visible_english.match?(/(?<![A-Za-z])Niskaru(?![A-Za-z])/i)
  old = source.fetch('work_text')
  text = old.dup

  if key == ['default', '24125', '']
    raise 'Niskaru lord parenthetical changed' unless
      english.match?(/Niskaru lord/i) && text.include?('(니스카루 군주')
    text.sub!('(니스카루 군주', '(니스카루(Niskaru) 군주')
  else
    changed = 0
    text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
      next unless text[0...match.begin(0)].count('(') <= text[0...match.begin(0)].count(')')

      particle = match[:particle].to_s
      replacement = "니스카루(Niskaru)#{particle}"
      next if replacement == match[0]

      text[match.begin(0)...match.end(0)] = replacement
      changed += 1
    end
    raise "no safe residual species span #{key.inspect}" if changed.zero?
  end

  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => 'monster:niskaru', 'status' => 'accepted',
    'old' => old, 'new' => text,
    'evidence' => 'D-20634 residual particle/span review: English identifies the Niskaru species, Japanese ニスカル and Chinese 尼斯卡鲁 corroborate, and the Korean root 니스카루 is present with a bound particle/ending. Added the bilingual label before the ending. The Bloodgrin record explicitly names a Niskaru lord inside a Korean prose parenthetical; labeled that bounded species span without altering the surrounding parenthetical.',
    'entity_dispositions_json' => JSON.generate('monster:niskaru' => 'accepted')
  }
end

out = File.join(__dir__, 'proper-name-reviewed-niskaru-residual-D20634.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, 20634, nil, review_states: ['uncertain'])
