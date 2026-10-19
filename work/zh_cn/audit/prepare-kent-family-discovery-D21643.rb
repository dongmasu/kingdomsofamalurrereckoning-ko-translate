#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module KentFamilyDiscoveryD21643
  extend self
  M = ReviewedNameBatches
  D = 21_643
  ENTITY = 'family:kent'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONTEXT = 'English explicitly labels this group the Kent Family; Japanese ケント家 and Chinese 肯特家族 corroborate the family reading. Standardize only these three exact family labels as 켄트 가문(Kent Family). The existing person:niahm-kent exclusions on these same rows remain intact and are not recounted. Do not add a global Kent or Niahm alias, link House Kent or ancient Aster-era Kents to this scope, or infer additional lineage.'
  TARGETS = {
    ['default', '25264', ''] => {
      english: 'Kent Family', japanese: 'ケント家', chinese: '肯特家族',
      old: '켄트 가문', new: '켄트 가문(Kent Family)'
    },
    ['default', '45188', ''] => {
      english: 'Kent Family', japanese: 'ケント家', chinese: '肯特家族',
      old: '켄트 가문', new: '켄트 가문(Kent Family)'
    },
    ['default', '47079', ''] => {
      english: 'Kent Family', japanese: 'ケント家', chinese: '肯特家族',
      old: '켄트 가문', new: '켄트 가문(Kent Family)'
    }
  }.freeze

  def source_matches(inventory)
    pattern = /(?<![A-Za-z0-9])Kent Family(?![A-Za-z0-9])/i
    inventory.values.select do |source|
      JSON.parse(source.fetch('en_texts_json')).compact.any? { |text| text.match?(pattern) }
    end.map { |source| M.key(source) }.uniq.sort
  end

  def reviews(inventory)
    TARGETS.map do |key, spec|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      raise "English source changed at #{key.inspect}" unless english == spec.fetch(:english)
      raise "Japanese source changed at #{key.inspect}" unless japanese == spec.fetch(:japanese)
      raise "Chinese source changed at #{key.inspect}" unless source.fetch('zh_text') == spec.fetch(:chinese)
      raise "Korean source changed at #{key.inspect}" unless source.fetch('work_text') == spec.fetch(:old)

      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => 'accepted',
        'old' => spec.fetch(:old), 'new' => spec.fetch(:new),
        'evidence' => CONTEXT, 'english' => english, 'japanese' => japanese,
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
      }
    end
  end

  def definition
    {
      'entity_key' => ENTITY, 'english_canonical' => 'Kent Family',
      'category' => 'people', 'korean_canonical' => '켄트 가문(Kent Family)',
      'english_aliases' => '', 'korean_variants' => '켄트 가문',
      'evidence_ids' => 'D-21643|default:25264|default:45188|default:47079',
      'status' => 'confirmed',
      'notes' => "#{CONTEXT} This registration covers the exact complete label only; it does not assert equivalence with any other Kent-named person, house, or historical group."
    }
  end

  def run
    raise 'D-21643 discovery files already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    inventory = M.refresh_inventory
    expected = TARGETS.keys.sort
    raise "unexpected exact Kent Family source scope: #{source_matches(inventory).inspect}" unless
      source_matches(inventory) == expected
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    raise 'Kent family entity already registered' if glossary.any? { |row| row['entity_key'] == ENTITY }
    rows = reviews(inventory)
    raise 'unexpected review scope' unless rows.length == 3
    M.write_table(DEFINITIONS, glossary.headers, [definition])
    M.write_table(REVIEWS, M::HEADERS.take(12), rows)
    puts "Prepared #{rows.length} Kent Family rows; no CSV or registration state changed."
  end
end

KentFamilyDiscoveryD21643.run if $PROGRAM_NAME == __FILE__
