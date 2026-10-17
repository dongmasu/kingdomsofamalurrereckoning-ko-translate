#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

module FirstswornParticlesD21099
  M = ReviewedNameBatches
  D = 21_099
  ENTITY = 'faction:firstsworn'
  PATH = File.join(M::AUDIT, "proper-name-discovery-D#{D}.tsv")
  CORRECTIONS = {
    '51339' => {
      '첫서약자(Firstsworn)이' => '첫서약자(Firstsworn)가',
      '첫서약자(Firstsworn)으로서' => '첫서약자(Firstsworn)로서'
    },
    '62666' => {
      '첫서약자(Firstsworn)이라' => '첫서약자(Firstsworn)라'
    }
  }.freeze
  EVIDENCE = 'Corrective particle-only residual audit. The independently verified Firstsworn canonical root changed from consonant-final 퍼스트스원 to vowel-final 첫서약자. Correct only the resulting singular 가/로서/라 particles; preserve plural 들 particles, all identities, bilingual labels, Eamonn/Eagonn, surrounding prose, tokens, and line breaks. This preserves the existing accepted entity disposition and does not register a new key or increase any tally. The original D-21087/D-21088 decisions remain in previous_evidence and their immutable historical manifests.'

  module_function

  def reviews(inventory)
    CORRECTIONS.map do |id, corrections|
      source = inventory.fetch(['default', id, ''])
      old = source.fetch('work_text')
      new_text = old.dup
      corrections.each do |from, to|
        raise "Firstsworn particle target absent/ambiguous #{id}: #{from}" unless
          new_text.scan(from).length == 1
        new_text = new_text.sub(from, to)
      end
      {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'entity_key' => ENTITY, 'status' => 'accepted',
        'old' => old, 'new' => new_text, 'evidence' => EVIDENCE,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
  end

  def run
    raise 'Firstsworn particle correction already recorded' if File.file?(PATH)
    inventory = M.refresh_inventory
    review_rows = reviews(inventory)
    index = M.table(M::INDEX)
    review_rows.each do |review|
      matches = index.select do |row|
        row['entity_key'] == ENTITY && M.key(row) == M.key(review)
      end
      raise 'Firstsworn particle key is not already accepted' unless
        matches.length == 1 && matches.first['status'] == 'accepted'
    end
    before_counts = index.group_by { |row| row['status'] }.transform_values(&:length)
    M.write_table(PATH, M::HEADERS, review_rows)
    M.run(PATH, D, nil, review_states: ['accepted'])
    after_counts = M.table(M::INDEX).group_by { |row| row['status'] }.transform_values(&:length)
    raise 'particle correction altered occurrence/status counts' unless before_counts == after_counts
    puts 'PASS Firstsworn particle correction preserves all occurrence/status counts'
  end
end

FirstswornParticlesD21099.run if $PROGRAM_NAME == __FILE__
