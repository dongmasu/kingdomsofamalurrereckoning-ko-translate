#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
  .to_h { |row| [row['entity_key'], row.to_h] }
index = m.table(m::INDEX)
inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
by_key = {}
index.each do |occurrence|
  entry = glossary.fetch(occurrence['entity_key'])
  next unless entry['category'] == 'person' &&
    %w[accepted not-an-issue].include?(occurrence['status'])
  next if occurrence['entity_key'] == 'person:ventrinio'
  english = entry['english_canonical']
  korean = entry['korean_canonical'].sub(/\(#{Regexp.escape(english)}\)\z/, '')
  next unless korean.match?(/\A[가-힣]+\z/)
  # Sagrell's already-reviewed honorific is not a spelling mismatch.
  next if occurrence['entity_key'] == 'person:sagrell' && occurrence['ID_Linha'] == '1407'
  text = occurrence['korean_current']
  wrong = text.scan(/([가-힣]+)\(#{Regexp.escape(english)}\)/)
    .flatten.reject { |name| name == korean }.uniq
  next if wrong.empty?
  key = m.key(occurrence)
  (by_key[key] ||= []) << [occurrence['entity_key'], english, korean, wrong]
end
reviews = by_key.map do |key, entries|
  source = inventory.fetch(key)
  old = source['work_text']
  text = old.dup
  english_source = JSON.parse(source['en_texts_json']).compact.join("\n")
  entries.each do |_entity, english, korean, wrong|
    raise "English label not source-supported #{key.inspect}" unless
      english_source.match?(/(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])/i)
    wrong.each do |variant|
      pattern = /#{Regexp.escape(variant)}\(#{Regexp.escape(english)}\)(?<particle>라는|라고|라며|라서|으로|은|는|이|가|을|를|과|와|로)?/
      text = text.gsub(pattern) do
        match = Regexp.last_match
        particle = match[:particle]
        old_batchim = (variant[-1].ord - 0xAC00) % 28 != 0
        new_batchim = (korean[-1].ord - 0xAC00) % 28 != 0
        if particle && old_batchim != new_batchim
          particle = {
            '은' => '는', '는' => '은', '이' => '가', '가' => '이',
            '을' => '를', '를' => '을', '과' => '와', '와' => '과',
            '으로' => '로', '로' => '으로',
            '라는' => '이라는', '라고' => '이라고',
            '라며' => '이라며', '라서' => '이라서'
          }.fetch(particle, particle)
        end
        "#{korean}(#{english})#{particle}"
      end
    end
  end
  entities = entries.map(&:first).sort
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'), 'status' => 'accepted', 'old' => old, 'new' => text,
    'evidence' => 'Final exact-label spelling audit: the existing parenthetical already matches the English named token, but the immediately preceding Korean name differs from its confirmed glossary form. Compare the aligned English, Japanese and Chinese row and normalize only that paired name; retain all other names and complete compounds. Octienne particle changes follow the new final consonant, including 옥티엔이라는. Magnus 59924 retains exactly the source-shortened Magnus label, not an invented Tyr/Hroth expansion or an identity claim. Sagrell 1407 is an explicitly retained honorific exception. Ventrinio is reviewed separately because its dictionary spelling itself requires correction. No new global classification or duplicate tally is made.',
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, 'accepted'] })
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
raise "unexpected canonical-label scope #{reviews.length}" unless reviews.length == 50
out = File.join(__dir__, 'proper-name-reviewed-canonical-labels-D20609.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, 20609, nil, review_states: %w[accepted not-an-issue])
