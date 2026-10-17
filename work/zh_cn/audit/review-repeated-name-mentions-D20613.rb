#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
  .to_h { |row| [row['entity_key'], row.to_h] }
inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
targets = {
  'person:sagrell' => %w[587 14590 21739 27135 32776 51771 59397 59429],
  'person:creth' => %w[3891 10037 22469 53880],
  'person:brun' => %w[10701 17718 55108 62230],
  'person:tyr' => %w[10842],
  'person:agarth' => %w[11329 11665 27741],
  'person:abergast' => %w[11425],
  'person:raemund' => %w[15146],
  'person:orwae' => %w[15743],
  'person:adar' => %w[17702],
  'person:gnarsh' => %w[28555],
  'person:wyl' => %w[29034],
  'person:brighthelm' => %w[40473],
  'person:arkes' => %w[42824],
  'person:wulflac' => %w[45698],
  'person:golgoti' => %w[48802],
  'person:bruten' => %w[51702],
  'person:mattix' => %w[60114]
}.freeze
reviews = targets.flat_map do |entity, ids|
  entry = glossary.fetch(entity)
  english_name = entry['english_canonical']
  korean = entry['korean_canonical'].sub(/\(#{Regexp.escape(english_name)}\)\z/, '')
  variants = [korean, *entry['korean_variants'].to_s.split('|')]
    .uniq.select { |variant| variant.match?(/\A[가-힣 ]+\z/) }
  ids.map do |id|
    source = inventory.fetch(['default', id, ''])
    old = source['work_text']
    text = old.dup
    english = JSON.parse(source['en_texts_json']).compact.join("\n")
    raise "unmatched repeated English name #{id}" unless
      english.match?(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i)
    if entity == 'person:orwae'
      text = text.sub('오르웨이 네스(Orwae Nes)', '오르웨 네스(Orwae Nes)')
    elsif entity == 'person:mattix'
      raise 'unmatched Mattix Dace full name' unless english.include?('Mattix Dace')
      text = text.gsub(/매틱스 데이스(?!\(Mattix Dace\))/, '매틱스 데이스(Mattix Dace)')
    elsif entity == 'person:sagrell' && %w[32776 51771].include?(id)
      text = text.gsub(/사그렐 경(?!\(Sir Sagrell\))/, '사그렐 경(Sir Sagrell)')
    end
    variants.sort_by { |variant| -variant.length }.each do |variant|
      original = text
      text = original.gsub(/(?<![가-힣])#{Regexp.escape(variant)}/) do
        match = Regexp.last_match
        prefix = original[0...match.begin(0)]
        if prefix.count('(') > prefix.count(')')
          match[0]
        else
          tail = original[match.end(0)..]
          label = tail.match(/\A[가-힣 -]{0,40}\(([^()]+)\)/)
          covered = label && label[1].match?(
            /(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i
          )
          # Keep full-name labels and title compounds atomic.
          covered ? korean : "#{korean}(#{english_name})"
        end
      end
    end
    raise "repeated-name review made no supported change #{id}" if text == old
    raise "adjacent duplicated English labels #{id}" if
      text.match?(/\([A-Za-z][A-Za-z .'-]*\)\s*\([A-Za-z][A-Za-z .'-]*\)/)
    {
      'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
      'entity_key' => entity, 'status' => 'accepted', 'old' => old, 'new' => text,
      'evidence' => 'Final repeated-mention audit against the aligned English, Japanese and Chinese row. A first bilingual mention does not cover later unpaired Korean occurrences: pair the explicitly identified repeated name while retaining existing complete full-name/title labels atomically. Normalize supported Creth, Gnarsh, Wulflac and Orwae spelling variants to the confirmed dictionary form. Mattix Dace is annotated as a complete name, not a component insertion. The English record names both the letter addressee and relative in the Wulflac/Golgoti rows; surname labels do not assert that they are one individual. Full shop/item/band/place compounds, generic 이건, collective family/mine uses, and the four prior held rows are excluded from this correction scope. The official manual provides only non-exhaustive setting background; unrelated wording and existing decisions remain unchanged.',
      'entity_dispositions_json' => JSON.generate(entity => 'accepted')
    }
  end
end.sort_by { |row| row['ID_Linha'].to_i }
raise "unexpected repeated-name scope #{reviews.length}" unless reviews.length == 32
out = File.join(__dir__, 'proper-name-reviewed-repeated-mentions-D20613.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, 20613, nil, review_states: %w[accepted not-an-issue])
