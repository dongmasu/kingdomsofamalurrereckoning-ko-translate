#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

module ExactPairSpellingD20928
  extend self

  M = ReviewedNameBatches
  TARGETS = {
    ['monster:bolgan', 'default', '4163', ''] => ['볼건(Bolgan)', '볼간(Bolgan)'],
    ['monster:leanashe', 'default', '13321', ''] => ['레아나시(leanashe)', '리아네시(Leanashe)'],
    ['monster:boggart', 'default', '61548', ''] => ['보가트(Boggart)(boggart)', '보가트(Boggart)']
  }.freeze

  def canonical_prefix?(prefix, korean)
    prefix.match?(/#{Regexp.escape(korean)}(?:족|인|어| 경| 마을)?\z/)
  end

  def mismatch_keys(index, glossary)
    entities = glossary.to_h { |row| [row.fetch('entity_key'), row] }
    index.each_with_object([]) do |row, result|
      next unless %w[accepted not-an-issue].include?(row['status'])
      entry = entities.fetch(row.fetch('entity_key'))
      english = entry.fetch('english_canonical')
      korean = entry.fetch('korean_canonical').sub(/\(#{Regexp.escape(english)}\)\z/, '')
      row.fetch('korean_current').to_enum(:scan, /\(#{Regexp.escape(english)}\)/i).each do
        match = Regexp.last_match
        next if canonical_prefix?(match.pre_match, korean)
        result << [row.fetch('entity_key'), *M.key(row)]
      end
    end.uniq
  end

  def run
    index = M.table(M::INDEX).map(&:to_h)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    mismatches = mismatch_keys(index, glossary)
    raise "unexpected spelling mismatch keys: #{mismatches.inspect}" unless mismatches.sort == TARGETS.keys.sort
    inventory = M.table(M::INVENTORY).map(&:to_h).to_h { |row| [M.key(row), row] }
    reviews = TARGETS.map do |key, (old_span, new_span)|
      entity, resource, id, variant = key
      source = inventory.fetch([resource, id, variant])
      old = source.fetch('work_text')
      raise "unexpected span at #{key.inspect}" unless old.scan(old_span).length == 1
      previous = index.find { |row| [row.fetch('entity_key'), *M.key(row)] == key }
      raise "missing terminal occurrence #{key.inspect}" unless previous &&
        %w[accepted not-an-issue].include?(previous.fetch('status'))
      {
        'resource' => resource, 'ID_Linha' => id, 'Tipo_Variante' => variant,
        'entity_key' => entity, 'status' => 'accepted',
        'old' => old, 'new' => old.sub(old_span, new_span),
        'evidence' => "New exact-pair residual evidence: the active span #{old_span.inspect} does not equal the registered canonical spelling/pairing; #{new_span.inspect} does. Prior evidence claimed an already canonical/normalized label, but direct inspection disproves that specific claim. Correct only this spelling or duplicated English label; retain the source meaning and all surrounding text. English anchors the species; aligned Japanese and Chinese corroborate. Reuse the existing confirmed glossary rather than proposing a new reading. The official manual provides world/combat context, not a direct species spelling. Update the existing occurrence in place, retain its prior status/evidence in the manifest, and do not add a new occurrence or recount historical global totals. No PAK-derived evidence.",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => 'accepted'),
        'previous_status' => JSON.generate(entity => previous.fetch('status')),
        'previous_evidence' => JSON.generate(entity => previous.fetch('evidence'))
      }
    end
    path = File.join(__dir__, 'proper-name-reviewed-exact-pair-spelling-D20928.tsv')
    M.write_table(path, M::HEADERS, reviews)
    puts "Reviewed #{index.length} indexed snapshots against #{glossary.length} glossary entries."
    puts "Prepared #{reviews.length} existing-key spelling/pairing corrections; no new entities or occurrences."
  end
end

ExactPairSpellingD20928.run if $PROGRAM_NAME == __FILE__
