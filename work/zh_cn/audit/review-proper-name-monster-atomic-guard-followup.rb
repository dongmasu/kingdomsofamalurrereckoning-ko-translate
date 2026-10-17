#!/usr/bin/env ruby

require_relative 'review-proper-name-monsters-other-continuation'

module MonsterAtomicGuardFollowup
  M = ReviewedNameBatches
  OUT = File.join(__dir__, 'proper-name-reviewed-monster-atomic-guard-followup.tsv')
  EXPECTED_IDS = %w[
    2056 2738 3851 5072 8480 9650 11613 17675 17768 20509 22852 23332
    24059 28555 31607 38045 44880 48808 50987 51586 54256 55379 55747 58680
  ].freeze

  module_function

  def run
    inventory = M.refresh_inventory
    residuals = M.table(File.join(__dir__, 'proper-name-residual-missing-bilingual-final.tsv'))
      .select { |row| row['entity_key'].start_with?('monster:') }
    ids = residuals.map { |row| row['ID_Linha'] }.sort_by(&:to_i)
    raise "residual source keys changed: #{ids.inspect}" unless ids == EXPECTED_IDS.sort_by(&:to_i)
    reviews = residuals.map do |row|
      source = inventory.fetch(M.key(row))
      spec = SPECS.find { |candidate| candidate[:entity_key] == row['entity_key'] }
      raise "unknown residual species #{row['entity_key']}" unless spec
      old = source.fetch('work_text')
      status, proposed, evidence = review_species(spec, source, M.key(row), old)
      {
        'resource' => row['resource'], 'ID_Linha' => row['ID_Linha'],
        'Tipo_Variante' => row['Tipo_Variante'].to_s,
        'entity_key' => row['entity_key'], 'status' => status,
        'old' => old, 'new' => proposed,
        'evidence' => "Corrective residual review: an unrelated adjacent English label does not cover a species name. Existing occurrence keys are updated in place, never appended or added to historical global tallies. #{evidence}",
        'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n"),
        'chinese' => source['zh_text'],
        'entity_dispositions_json' => JSON.generate(row['entity_key'] => status)
      }
    end
    reviews.sort_by! { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
    M.write_table(OUT, M::HEADERS, reviews)
    puts reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect
  end
end

MonsterAtomicGuardFollowup.run if $PROGRAM_NAME == __FILE__
