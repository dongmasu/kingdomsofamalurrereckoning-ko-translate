#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module PrepareProperNameDiscoveryD21838
  extend self

  M = ReviewedNameBatches
  AUDIT = M::AUDIT
  ENTITY = 'item:maid-of-fortune'
  IDS = %w[1151 5239 7568 13675 17546 27645 33962 57264 61973].freeze
  KEYS = IDS.map { |id| ['default', id, ''] }.freeze
  DEFINITIONS = File.join(AUDIT, 'proper-name-discovery-definitions-D21838.tsv')
  REVIEWS = File.join(AUDIT, 'proper-name-discovery-D21838.tsv')
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze

  def run
    [DEFINITIONS, REVIEWS,
     File.join(AUDIT, 'proper-name-edits-D21838.tsv'),
     File.join(AUDIT, 'named-scope-review-D21838-20261019.md'),
     File.join(AUDIT, 'named-scope-edit-addendum-D21838-20261019.md')].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end

    inventory = M.refresh_inventory
    glossary = M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).map(&:to_h)
    raise "entity already exists: #{ENTITY}" if glossary.any? { |row| row['entity_key'] == ENTITY }
    collision = glossary.find do |row|
      ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
        .any? { |term| term.casecmp('Maid of Fortune').zero? }
    end
    raise "English canonical collision: #{collision['entity_key']}" if collision

    definition = {
      'entity_key' => ENTITY,
      'english_canonical' => 'Maid of Fortune',
      'category' => 'item',
      'korean_canonical' => '행운의 시녀호(Maid of Fortune)',
      'english_aliases' => '',
      'korean_variants' => '행운의 시녀호|메이드 오브 포춘|메이드 오브 포춘호',
      'evidence_ids' => 'D-21818|D-21838',
      'status' => 'confirmed',
      'notes' => 'English explicitly identifies Maid of Fortune as a chartered ship and repeatedly describes its hold, sailing, and passage. The complete aligned contexts distinguish it from the Ravenswing. Japanese メイド・オブ・フォーチュン号 and Chinese 命运少女号 corroborate the named vessel. All nine source rows already carry an English name pairing in Korean; preserve their source-local Korean variants in this identity-only registration. D-10967 and D-17975 wording questions remain separate and are not reclassified.'
    }

    generated = build_occurrences(inventory.values, [definition])
    generated_keys = generated.map { |row| [row[1], row[2], row[3].to_s] }.sort
    raise "unexpected exact occurrence keys: #{generated_keys.inspect}" unless generated_keys == KEYS.sort

    evidence = 'English contexts explicitly identify the Maid of Fortune as the chartered ship and describe its hold, sailing, and role in Walen’s escape. The Japanese ship suffix and Chinese ship-name rendering corroborate. The English identity is confirmed, while existing Korean lexical variants and the D-10967/D-17975 wording findings are preserved.'
    reviews = KEYS.map do |key|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "source no longer names Maid of Fortune at #{key.inspect}" unless english.match?(/\bMaid of Fortune\b/i)
      raise "Korean label lacks English pairing at #{key.inspect}" unless
        old.match?(/(?:Maid of Fortune)/i)

      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => 'not-an-issue',
        'old' => old,
        'new' => old,
        'evidence' => evidence,
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'not-an-issue'),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end

    M.write_table(DEFINITIONS, DEFINITION_HEADERS, [definition])
    M.write_table(REVIEWS, M::HEADERS, reviews)
    puts "D-21838 prepared: #{reviews.length} exact ship-name source keys; " \
         'all current Korean labels already include the English name.'
  end
end

PrepareProperNameDiscoveryD21838.run
