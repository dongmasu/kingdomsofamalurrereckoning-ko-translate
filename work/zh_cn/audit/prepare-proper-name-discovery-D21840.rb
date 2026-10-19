#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module PrepareProperNameDiscoveryD21840
  extend self

  M = ReviewedNameBatches
  AUDIT = M::AUDIT
  ENTITY = 'place:ansilla-dungeon'
  KEY = ['base', '369', '11'].freeze
  DEFINITIONS = File.join(AUDIT, 'proper-name-discovery-definitions-D21840.tsv')
  REVIEWS = File.join(AUDIT, 'proper-name-discovery-D21840.tsv')
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze

  def run
    [DEFINITIONS, REVIEWS,
     File.join(AUDIT, 'proper-name-edits-D21840.tsv'),
     File.join(AUDIT, 'named-scope-review-D21840-20261019.md'),
     File.join(AUDIT, 'named-scope-edit-addendum-D21840-20261019.md')].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end

    inventory = M.refresh_inventory
    glossary = M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).map(&:to_h)
    raise "entity already exists: #{ENTITY}" if glossary.any? { |row| row['entity_key'] == ENTITY }
    definition = {
      'entity_key' => ENTITY,
      'english_canonical' => 'Ansilla Dungeon',
      'category' => 'place',
      'korean_canonical' => '안실라 지하감옥(Ansilla Dungeon)',
      'english_aliases' => '',
      'korean_variants' => '안실라(Ansilla) 지하감옥',
      'evidence_ids' => 'D-21840|base:369',
      'status' => 'confirmed',
      'notes' => 'English base:369 names an Ansilla Dungeon and labels its key; Japanese アンシラ地下牢の鍵 and Chinese 安西拉地牢钥匙 corroborate the named dungeon. Pair the complete place phrase as 안실라 지하감옥(Ansilla Dungeon) and leave 열쇠 outside the name. Keep distinct from Castle Ansilla, House Ansilla, and individual Ansillas; infer no relationship to Castle Ansilla beyond the source wording.'
    }
    generated = build_occurrences(inventory.values, [definition])
    generated_keys = generated.map { |row| [row[1], row[2], row[3].to_s] }
    raise "expected one exact source match, got #{generated_keys.inspect}" unless
      generated_keys == [KEY]

    source = inventory.fetch(KEY)
    old = source.fetch('work_text')
    old_span = '안실라(Ansilla) 지하감옥 열쇠'
    new_span = '안실라 지하감옥(Ansilla Dungeon) 열쇠'
    raise "stale Korean target: #{old}" unless old.scan(old_span).length == 1
    new_text = old.sub(old_span, new_span)
    evidence = 'The complete English item label identifies the named place Ansilla Dungeon followed by a generic key descriptor. Japanese アンシラ地下牢 and Chinese 安西拉地牢 corroborate. Pair the place as 안실라 지하감옥(Ansilla Dungeon), keep 열쇠 outside the name, and do not merge it with Castle Ansilla.'
    review = {
      'resource' => KEY[0],
      'ID_Linha' => KEY[1],
      'Tipo_Variante' => KEY[2],
      'entity_key' => ENTITY,
      'status' => 'accepted',
      'old' => old,
      'new' => new_text,
      'evidence' => evidence,
      'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
      'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
      'chinese' => source.fetch('zh_text'),
      'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
      'previous_status' => '',
      'previous_evidence' => ''
    }
    M.write_table(DEFINITIONS, DEFINITION_HEADERS, [definition])
    M.write_table(REVIEWS, M::HEADERS, [review])
    puts "D-21840 prepared: #{ENTITY}; one exact source key; one reviewed cell."
  end
end

PrepareProperNameDiscoveryD21840.run
