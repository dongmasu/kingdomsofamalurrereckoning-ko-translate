#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'

module PrepareWhitePalmItemLabelsD21849
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_849
  DEFINITIONS = File.join(__dir__, 'proper-name-discovery-definitions-D21849.tsv')
  REVIEWS = File.join(__dir__, 'proper-name-discovery-D21849.tsv')
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  ITEMS = {
    ['base', '1762', '11'] => {
      en: 'White Palm Armor', ja: 'ホワイトパーム団の鎧', zh: '白掌护甲',
      ko: ['화이트 팜(White Palm) 갑옷', '화이트 팜 갑옷(White Palm Armor)'],
      entity: 'item:white-palm-armor'
    },
    ['base', '3614', '11'] => {
      en: 'White Palm Hood', ja: 'ホワイトパーム団のフード', zh: '白掌兜帽',
      ko: ['화이트 팜(White Palm)단 두건', '화이트 팜 두건(White Palm Hood)'],
      entity: 'item:white-palm-hood'
    },
    ['base', '3788', '11'] => {
      en: 'White Palm Boots', ja: 'ホワイトパーム団のブーツ', zh: '白掌靴子',
      ko: ['화이트 팜(White Palm)단 장화', '화이트 팜 장화(White Palm Boots)'],
      entity: 'item:white-palm-boots'
    },
    ['base', '4676', '11'] => {
      en: 'White Palm Gloves', ja: 'ホワイトパーム団のグローブ', zh: '白掌手套',
      ko: ['화이트 팜(White Palm)단의 장갑', '화이트 팜 장갑(White Palm Gloves)'],
      entity: 'item:white-palm-gloves'
    },
    ['default', '1596', ''] => {
      en: 'Garb of the White Palm', ja: 'ホワイトパーム団の服', zh: '白色棕榈服装',
      ko: ['화이트 팜(White Palm)의 의복', '화이트 팜 의복(Garb of the White Palm)'],
      entity: 'item:garb-of-the-white-palm'
    }
  }.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Each exact English source row names one item; aligned Japanese
    ホワイトパーム団の鎧/フード/ブーツ/グローブ/服 and Chinese 白掌/白色棕榈
    equipment labels corroborate the complete item identities. Pair each
    Korean display with its complete source-local English item name. D-21536
    separately registered White Palm Leggings; this batch adds only the five
    exact item labels listed here. Do not infer set identity, rarity, stats,
    or a shared owner beyond the source wording. The faction:white-palm
    dispositions from D-21848 are retained independently and not recounted.
  TEXT

  def definitions
    ITEMS.map do |key, item|
      {
        'entity_key' => item.fetch(:entity),
        'english_canonical' => item.fetch(:en),
        'category' => 'item',
        'korean_canonical' => item.fetch(:ko).last,
        'english_aliases' => '',
        'korean_variants' => '',
        'evidence_ids' => "D-#{D}|#{key.join(':')}",
        'status' => 'confirmed',
        'notes' => NOTE
      }
    end
  end

  def run(apply: false)
    [DEFINITIONS, REVIEWS, File.join(__dir__, 'proper-name-edits-D21849.tsv'),
     File.join(__dir__, 'named-scope-review-D21849-20261019.md'),
     File.join(__dir__, 'named-scope-edit-addendum-D21849-20261019.md')].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end
    R.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    definitions = definitions()
    glossary_table = M.table(R::GLOSSARY)
    glossary = glossary_table.map(&:to_h)
    raise 'item entity collision' if definitions.any? do |definition|
      glossary.any? do |row|
        row['entity_key'] == definition['entity_key'] ||
          ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
            .any? { |term| term.casecmp?(definition['english_canonical']) }
      end
    end
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = ITEMS.map { |key, item| [item.fetch(:entity), *key] }.sort
    raise 'complete source/entity key set differs' unless
      generated.map { |row| [row['entity_key'], *M.key(row)] }.sort == expected
    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    existing = index.map { |row| [row['entity_key'], *M.key(row)] }.to_set
    raise 'item occurrence already indexed' if
      generated.any? { |row| existing.include?([row['entity_key'], *M.key(row)]) }

    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      item = ITEMS.fetch(key)
      source = inventory.fetch(key)
      english_texts = JSON.parse(source.fetch('en_texts_json')).compact
      japanese_texts = JSON.parse(source.fetch('ja_texts_json')).compact
      english = english_texts.join("\n")
      japanese = japanese_texts.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "English label differs at #{key}" unless english_texts == [item.fetch(:en)]
      raise "Japanese label differs at #{key}" unless japanese_texts == [item.fetch(:ja)]
      raise "Chinese label differs at #{key}" unless chinese == item.fetch(:zh)
      old = source.fetch('work_text')
      before, after = item.fetch(:ko)
      raise "Korean label differs at #{key}" unless old == before
      entity = item.fetch(:entity)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => 'accepted', 'old' => old, 'new' => after,
        'evidence' => NOTE, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(entity => 'accepted')
      }
    end
    R.validate_sources!(reviews, inventory)
    R.validate!(definitions, reviews, generated, glossary, index)
    if apply
      M.write_table(R::GLOSSARY, glossary_table.headers, glossary + definitions)
      generated.each { |row| row['status'] = 'needs-context'; row['evidence'] = "New named item reviewed in D-#{D}." }
      M.write_table(M::INDEX, index_table.headers, index + generated)
      M.write_table(DEFINITIONS, DEFINITION_HEADERS, definitions)
      M.write_table(REVIEWS, M::HEADERS, reviews)
      M.run(REVIEWS, D, 1)
    else
      reviews.group_by { |row| row['resource'] }.each do |resource, rows|
        ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
      end
    end
    puts "D-#{D} #{apply ? 'applied' : 'prepared'}: five distinct item labels, five Texto edits."
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'entity_key', 'old', 'new')) }
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then PrepareWhitePalmItemLabelsD21849.run
  when ['apply'] then PrepareWhitePalmItemLabelsD21849.run(apply: true)
  else abort 'usage: prepare-white-palm-item-labels-D21849.rb [prepare|apply]'
  end
end
