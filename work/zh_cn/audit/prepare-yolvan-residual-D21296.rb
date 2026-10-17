#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module YolvanResidualD21296
  M = ReviewedNameBatches
  ENTITY = 'place:yolvan'
  PROPOSAL = File.join(M::AUDIT, 'proper-name-residual-review-D21296.tsv')
  EXPECTED_KEYS = %w[60580 60854 61118 62120 62490]
    .map { |id| ['default', id, ''] }.freeze
  EXPECTED_CSV = {
    'affix' => 'a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586',
    'base' => '70de5056bb0e7929b8ea24e4020965fb6f349198820d56b4b2a85984237dfa85',
    'default' => '7899c7bb61befd08e18a022368fad761a44a2cce0a832acdd3f968f954fcbc4e'
  }.freeze
  EXPECTED_INDEX = '039e4cd491f0f2e475d01c2b26757a3c4823b25c4fe8901b283440d29fc1a017'
  EXPECTED_GLOSSARY = 'f175439c200cd7cf977787e8bc056879ac43c523699e4740650f9eeb48c9f461'
  EXPECTED_INVENTORY = 'a88ca95503fcdeedfef2df22a8572e3cb8c3d0fbd4ca73130630febf039f1096'
  COUNTERPARTS = {
    '60580' => 'source-form:yolvan',
    '60854' => 'place:castle-yolvan',
    '61118' => 'source-form:yolvan',
    '62120' => 'place:castle-yolvan',
    '62490' => 'source-form:yolvan'
  }.freeze

  module_function

  def sha(path)
    Digest::SHA256.file(path).hexdigest
  end

  def run
    raise 'D-21296 artifacts already exist' if [
      PROPOSAL,
      File.join(M::AUDIT, 'proper-name-edits-D21296.tsv'),
      File.join(M::AUDIT, "named-scope-review-D21296-#{M::RUN_DATE_COMPACT}.md"),
      File.join(M::AUDIT, "named-scope-edit-addendum-D21296-#{M::RUN_DATE_COMPACT}.md")
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
    raise 'confirmed Yolvan region missing' unless glossary.any? do |row|
      row['entity_key'] == ENTITY && row['english_canonical'] == 'Yolvan' &&
        row['status'] == 'confirmed'
    end
    index = M.table(M::INDEX)
    indexed = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }.to_set
    generated = build_occurrences(inventory.values, glossary.map(&:to_h)).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    residuals = generated.select do |row|
      row.fetch('entity_key') == ENTITY &&
        !indexed.include?([ENTITY, *M.key(row)])
    end.sort_by { |row| row.fetch('ID_Linha').to_i }
    raise "expected five final Yolvan residuals: #{residuals.map { |r| M.key(r).inspect }}" unless
      residuals.map { |row| M.key(row) } == EXPECTED_KEYS

    reviews = residuals.map do |candidate|
      key = M.key(candidate)
      source = inventory.fetch(key)
      id = key[1]
      prior_entity = COUNTERPARTS.fetch(id)
      prior = index.find do |row|
        M.key(row) == key && row['entity_key'] == prior_entity
      end
      raise "terminal counterpart missing at #{key.inspect}" unless
        prior && %w[accepted not-an-issue excluded uncertain].include?(prior['status'])
      raise "Yolvan residual already indexed at #{key.inspect}" if
        indexed.include?([ENTITY, *key])

      reason = if prior_entity == 'source-form:yolvan'
                 'D-21289 already reviewed this exact row under the explicitly scoped unresolved source-form:yolvan record. Exclude the substring from the confirmed regional place:yolvan scope only; retain the spelling disposition without linking it to the region or Castle Yolvan.'
               else
                 'The exact source occurrence is the already registered complete place name Castle Yolvan. Exclude its Yolvan substring from the separate regional place:yolvan scope only; preserve the existing Castle Yolvan disposition.'
               end
      evidence = "D-21296: English-led matching found the literal Yolvan component; aligned Japanese and Chinese sources and the active Korean cell were checked. #{reason}"
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
        'evidence' => 'Source-generated substring match from confirmed regional Yolvan; exact row is scoped to a distinct prior entity record.'
      )
      [review, OCCURRENCE_HEADERS.to_h { |header| [header, occurrence[header]] }]
    end
    raise 'duplicate D-21296 keys' unless reviews.map { |review, _| M.key(review) }.uniq.length == 5

    additions = reviews.map(&:last)
    index_rows = index.map(&:to_h) + additions
    raise 'duplicate entity/row key after additions' unless
      index_rows.map { |row| [row.fetch('entity_key'), *M.key(row)] }.uniq.length == index_rows.length
    M.write_table(PROPOSAL, M::HEADERS, reviews.map(&:first))
    M.write_table(M::INDEX, index.headers, index_rows.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end)
    puts 'Prepared the final five Yolvan residual keys for exclusion from place:yolvan only; prior scopes remain unchanged.'
  end
end

YolvanResidualD21296.run if $PROGRAM_NAME == __FILE__
