#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'

module PrepareValjeanMiningCompanyD21846
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_846
  ENTITY = 'organization:valjean-mining-company'
  DEFINITIONS = File.join(__dir__, 'proper-name-discovery-definitions-D21846.tsv')
  REVIEWS = File.join(__dir__, 'proper-name-discovery-D21846.tsv')
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  TARGETS = {
    ['base', '290', '11'] => {
      old: '발장(Valjean) 광산 회사 열쇠',
      new: '발지언 광업 회사(Valjean Mining Co.) 열쇠',
      en: /\AValjean Mining Co\. Key\z/,
      ja: /ヴァルジアン・マイニング社の鍵/,
      zh: /瓦尔津矿业公司钥匙/
    },
    ['default', '57545', ''] => {
      old: '발지언 광업 회사',
      new: '발지언 광업 회사(Valjean Mining Company)',
      en: /\AValjean Mining Company\z/,
      ja: /\Aヴァルジアン・マイニング社\z/,
      zh: /\A瓦尔津矿业公司\z/
    }
  }.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:57545 explicitly labels Valjean Mining Company; base:290
    names the key to Valjean Mining Co. Japanese ヴァルジアン・マイニング社
    and Chinese 瓦尔津矿业公司 identify the same company in both labels.
    Register the organization separately from place:valjean-mine: D-21240
    establishes Valjean Mine as a location, not the mining company. Reuse
    발지언 from that review and use 광업 회사 for the explicitly corporate
    source. Pair each exact local English company form; do not infer a global
    Valjean alias or classify the key itself as the company. The official
    Korean manual has no direct entry for this organization. Existing
    place:valjean-mine decisions remain unchanged and are not recounted.
  TEXT

  def definition
    {
      'entity_key' => ENTITY,
      'english_canonical' => 'Valjean Mining Company',
      'category' => 'organization',
      'korean_canonical' => '발지언 광업 회사(Valjean Mining Company)',
      'english_aliases' => 'Valjean Mining Co.',
      'korean_variants' => '발지언 광업 회사',
      'evidence_ids' => 'D-21846|base:290:11|default:57545',
      'status' => 'confirmed',
      'notes' => NOTE
    }
  end

  def run(apply: false)
    [DEFINITIONS, REVIEWS, File.join(__dir__, 'proper-name-edits-D21846.tsv'),
     File.join(__dir__, 'named-scope-review-D21846-20261019.md'),
     File.join(__dir__, 'named-scope-edit-addendum-D21846-20261019.md')].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end
    R.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    definition = definition()
    glossary_table = M.table(R::GLOSSARY)
    glossary = glossary_table.map(&:to_h)
    terms = [definition.fetch('english_canonical'), *definition.fetch('english_aliases').split('|')]
    collision = glossary.find do |row|
      ([row.fetch('english_canonical')] + row.fetch('english_aliases', '').to_s.split('|'))
        .any? { |term| terms.any? { |candidate| candidate.casecmp?(term) } }
    end
    raise "English term already owned by #{collision['entity_key']}" if collision
    raise 'entity key already exists' if glossary.any? { |row| row['entity_key'] == ENTITY }

    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'source keys differ' unless generated.map { |row| M.key(row) }.sort == TARGETS.keys.sort
    index_table = M.table(M::INDEX)
    indexed = index_table.map { |row| [row['entity_key'], *M.key(row)] }.to_set
    raise 'source key already indexed' if generated.any? { |row| indexed.include?([ENTITY, *M.key(row)]) }

    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      target = TARGETS.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      chinese = source.fetch('zh_text')
      raise "English differs at #{key}" unless english.match?(target.fetch(:en))
      raise "Japanese differs at #{key}" unless japanese.match?(target.fetch(:ja))
      raise "Chinese differs at #{key}" unless chinese.match?(target.fetch(:zh))
      old = source.fetch('work_text')
      raise "Korean differs at #{key}" unless old == target.fetch(:old)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => 'accepted', 'old' => old,
        'new' => target.fetch(:new),
        'evidence' => NOTE,
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
      }
    end
    R.validate_sources!(reviews, inventory)
    generated.each { |row| row['status'] = 'needs-context'; row['evidence'] = 'New exact organization match; reviewed in D-21846.' }
    if apply
      M.write_table(R::GLOSSARY, glossary_table.headers, glossary + [definition])
      M.write_table(M::INDEX, index_table.headers, index_table.map(&:to_h) + generated)
      M.write_table(DEFINITIONS, DEFINITION_HEADERS, [definition])
      M.write_table(REVIEWS, M::HEADERS, reviews)
      M.run(REVIEWS, D, 1)
    else
      ProperNameCellEditor.prepare(
        File.binread(M.csv_path('base')), reviews.select { |row| row['resource'] == 'base' }
      )
      ProperNameCellEditor.prepare(
        File.binread(M.csv_path('default')), reviews.select { |row| row['resource'] == 'default' }
      )
    end
    puts "D-#{D} #{apply ? 'applied' : 'prepared'}: one company; two exact labels."
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'old', 'new')) }
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then PrepareValjeanMiningCompanyD21846.run
  when ['apply'] then PrepareValjeanMiningCompanyD21846.run(apply: true)
  else abort 'usage: prepare-valjean-mining-company-D21846.rb [prepare|apply]'
  end
end
