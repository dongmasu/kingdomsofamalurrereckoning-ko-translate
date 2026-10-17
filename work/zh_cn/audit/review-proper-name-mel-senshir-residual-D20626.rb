#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
prior = m.table(File.join(__dir__, 'proper-name-reviewed-mel-senshir-D20619.tsv'))
  .select { |row| row['status'] == 'uncertain' }
raise "unexpected held row count #{prior.length}" unless prior.length == 9

suffixes = %w[
  에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
  에서도 에서는 에까지 에서 에도 에는 으로도 으로는 으로만 으로
  로부터 로도 로는 로만 엔 처럼 만큼 보다 행 였던 이었던 까지 부터
  이라며 이라는 이라서 이라고 이라 라 은 는 이 가 을 를 와 과 의
  에 로 도 만
].uniq.sort_by { |value| -value.length }.map { |value| Regexp.escape(value) }.join('|')
pattern = /(?<![가-힣])(?<name>멜\s*센시르|메르\s*센시르|멜\s*센시어)(?:\s*\((?<label>[^()]*)\))?(?<particle>#{suffixes})?(?![가-힣])/

reviews = prior.map do |row|
  key = m.key(row)
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  visible_english = english.gsub(/\$[^$]*\$/, ' ')
  raise "English no longer confirms Mel Senshir #{key.inspect}" unless
    visible_english.match?(/(?<![A-Za-z])Mel Senshir(?![A-Za-z])/i)
  old = source.fetch('work_text')

  if key == ['default', '32891', '']
    {
      'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
      'entity_key' => 'place:mel-senshir', 'status' => 'excluded',
      'old' => old, 'new' => old,
      'evidence' => 'The only occurrence is the place-name parenthetical inside the complete rank label “Amaldor (Mel Senshir)”. The Korean mirrors that atomic label as 아말도르(멜 센시르); adding another parenthetical would create malformed nesting, so this occurrence is excluded from component-level edits.',
      'entity_dispositions_json' => JSON.generate('place:mel-senshir' => 'excluded')
    }
  else
    text = old.dup
    found = false
    text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
      next unless text[0...match.begin(0)].count('(') <= text[0...match.begin(0)].count(')')

      found = true
      particle = match[:particle].to_s
      label = match[:label]
      replacement = if label && label.match?(/(?<![A-Za-z])Mel Senshir(?![A-Za-z])/i)
                      "멜 센시르(Mel Senshir)#{particle}"
                    elsif label && label.match?(/[A-Za-z]/)
                      match[0]
                    else
                      "멜 센시르(Mel Senshir)#{particle}"
                    end
      text[match.begin(0)...match.end(0)] = replacement
    end
    raise "no safe residual name span #{key.inspect}" unless found
    status = text == old ? 'not-an-issue' : 'accepted'
    {
      'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
      'entity_key' => 'place:mel-senshir', 'status' => status,
      'old' => old, 'new' => text,
      'evidence' => 'D-20626 residual particle/span review: English identifies Mel Senshir, Japanese メル・センシア and Chinese 梅尔森溪 corroborate the city, and the Korean root is present with the attached ending. Added the canonical bilingual label before the existing ending without changing surrounding wording or line breaks.',
      'entity_dispositions_json' => JSON.generate('place:mel-senshir' => status)
    }
  end
end

out = File.join(__dir__, 'proper-name-reviewed-mel-senshir-residual-D20626.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, 20626, nil, review_states: ['uncertain'])
