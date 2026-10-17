#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module YolvanResidualD21295
  M = ReviewedNameBatches
  ENTITY = 'place:yolvan'
  PROPOSAL = File.join(M::AUDIT, 'proper-name-residual-review-D21295.tsv')
  SOURCE_FORM_IDS = %w[
    5410 7663 8239 10606 10688 12369 20486 20773 39691 40839
    46138 48840 53473 55532 57873 58164 60580 61118 62490
  ].to_set.freeze
  EXPLICIT_COUNTERPARTS = {
    ['base', '1336', '11'] => 'title:blades-of-yolvan',
    ['base', '1678', '11'] => 'title:yolvan-stone',
    ['base', '3011', '11'] => 'named work:a-history-of-yolvan',
    ['base', '3046', '11'] => 'place:castle-yolvan',
    ['default', '47163', ''] => 'title:yolvans-poison'
  }.freeze
  EXPECTED_CSV = {
    'affix' => 'a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586',
    'base' => '70de5056bb0e7929b8ea24e4020965fb6f349198820d56b4b2a85984237dfa85',
    'default' => '7899c7bb61befd08e18a022368fad761a44a2cce0a832acdd3f968f954fcbc4e'
  }.freeze
  EXPECTED_INDEX = 'e5f4f27949e7ecc2956cf682947c500e2f25338f629f69086cc802d9366d52d2'
  EXPECTED_GLOSSARY = 'f175439c200cd7cf977787e8bc056879ac43c523699e4740650f9eeb48c9f461'
  EXPECTED_INVENTORY = 'a88ca95503fcdeedfef2df22a8572e3cb8c3d0fbd4ca73130630febf039f1096'
  EXPECTED_KEYS = (
    [
      ['base', '1336', '11'], ['base', '1678', '11'],
      ['base', '3011', '11'], ['base', '3046', '11']
    ] + %w[
      5410 5608 6364 7158 7663 8239 8444 9455 10606 10688
      11143 11438 12257 12369 13801 14841 15468 15911 18177
      20486 20773 21680 23338 25141 27397 27652 36128 37120
      39691 40839 41559 41688 45582 46064 46138 47163 48840
      51828 53473 55420 55532 57351 57873 58164 59134 59677
    ].map { |id| ['default', id, ''] }
  ).freeze

  module_function

  def sha(path)
    Digest::SHA256.file(path).hexdigest
  end

  def counterpart(key)
    return EXPLICIT_COUNTERPARTS.fetch(key) if EXPLICIT_COUNTERPARTS.key?(key)
    return 'source-form:yolvan' if key.first == 'default' && SOURCE_FORM_IDS.include?(key[1])

    'place:castle-yolvan'
  end

  def run
    raise 'D-21295 artifacts already exist' if [
      PROPOSAL,
      File.join(M::AUDIT, 'proper-name-edits-D21295.tsv'),
      File.join(M::AUDIT, "named-scope-review-D21295-#{M::RUN_DATE_COMPACT}.md"),
      File.join(M::AUDIT, "named-scope-edit-addendum-D21295-#{M::RUN_DATE_COMPACT}.md")
    ].any? { |path| File.exist?(path) }

    raise "CSV checkpoint mismatch: #{M.hashes.inspect}" unless M.hashes == EXPECTED_CSV
    raise "index checkpoint mismatch: #{sha(M::INDEX)}" unless sha(M::INDEX) == EXPECTED_INDEX
    glossary_path = File.join(M::AUDIT, 'proper-name-glossary.tsv')
    raise "glossary checkpoint mismatch: #{sha(glossary_path)}" unless
      sha(glossary_path) == EXPECTED_GLOSSARY

    inventory = M.refresh_inventory
    raise "inventory checkpoint mismatch: #{sha(M::INVENTORY)}" unless
      inventory.length == 73_430 && sha(M::INVENTORY) == EXPECTED_INVENTORY
    glossary = M.table(glossary_path)
    raise 'confirmed Yolvan region changed' unless glossary.any? { |row|
      row['entity_key'] == ENTITY && row['english_canonical'] == 'Yolvan' &&
        row['status'] == 'confirmed'
    }

    index = M.table(M::INDEX)
    indexed = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }.to_set
    generated = build_occurrences(inventory.values, glossary.map(&:to_h)).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    residuals = generated.select do |row|
      row.fetch('entity_key') == ENTITY &&
        !indexed.include?([ENTITY, *M.key(row)])
    end.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s]
    end
    raise "expected 55 indexed Yolvan substring residuals, got #{residuals.length}" unless
      residuals.length == 55
    batch = residuals.first(50)
    raise 'D-21295 must contain exactly the reviewed first 50 row keys' unless
      batch.map { |row| M.key(row) } == EXPECTED_KEYS
    raise 'D-21296 residual scope changed' unless
      residuals.drop(50).map { |row| M.key(row) } ==
        %w[60580 60854 61118 62120 62490].map { |id| ['default', id, ''] }

    reviews = []
    additions = []
    batch.each do |candidate|
      key = M.key(candidate)
      source = inventory.fetch(key)
      existing_entities = index.select { |row| M.key(row) == key }
      expected_entity = counterpart(key)
      related = existing_entities.find { |row| row['entity_key'] == expected_entity }
      raise "expected terminal counterpart missing at #{key.inspect}" unless
        related && %w[accepted not-an-issue excluded uncertain].include?(related['status'])
      raise "Yolvan occurrence already indexed at #{key.inspect}" if
        indexed.include?([ENTITY, *key])

      reason = if expected_entity == 'source-form:yolvan'
                 'D-21289 already reviewed this exact row under the explicitly scoped unresolved source-form:yolvan record. Exclude the substring from confirmed place:yolvan; retain its prior spelling disposition without linking it to the region or Castle Yolvan.'
               elsif expected_entity == 'place:castle-yolvan'
                 'The exact source occurrence is the already registered complete place name Castle Yolvan. Exclude its Yolvan substring from the separate regional place:yolvan entity; preserve the existing Castle Yolvan disposition.'
               else
                 "The exact source occurrence is already registered as #{expected_entity}, a complete named title. Exclude its Yolvan substring from the separate regional place:yolvan entity; preserve the existing title disposition."
               end
      evidence = "D-21295: English-led residual matching found the literal Yolvan component, but the aligned row is already dispositioned under #{expected_entity}. Japanese and Chinese source cells and the active Korean label were checked against this exact row; this is an entity-scope exclusion only, not a reopening or a new identity claim. #{reason}"
      review = {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => 'excluded',
        'old' => source.fetch('work_text'), 'new' => source.fetch('work_text'),
        'evidence' => evidence,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'excluded'),
        'previous_status' => '', 'previous_evidence' => ''
      }
      occurrence = candidate.merge(
        'status' => 'needs-context',
        'evidence' => 'Source-generated substring match from the confirmed regional canonical Yolvan; requires row-level entity-scope review.'
      )
      reviews << review
      additions << OCCURRENCE_HEADERS.to_h { |header| [header, occurrence[header]] }
    end
    raise 'duplicate D-21295 row keys' unless reviews.map { |row| M.key(row) }.uniq.length == reviews.length

    index_rows = index.map(&:to_h) + additions
    raise 'duplicate occurrence key after scoped additions' unless
      index_rows.map { |row| [row.fetch('entity_key'), *M.key(row)] }.uniq.length == index_rows.length
    M.write_table(PROPOSAL, M::HEADERS, reviews)
    M.write_table(M::INDEX, index.headers, index_rows.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end)
    puts 'Prepared 50 exact Yolvan substring matches for exclusion from the regional entity only; five remain for D-21296.'
  end
end

YolvanResidualD21295.run if $PROGRAM_NAME == __FILE__
