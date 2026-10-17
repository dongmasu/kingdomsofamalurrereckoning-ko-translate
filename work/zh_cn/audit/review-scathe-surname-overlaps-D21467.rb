#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'apply-reviewed-proper-name-discovery'

module ScatheSurnameOverlapsD21467
  extend self

  M = ReviewedNameBatches
  D = 21_467
  ITEM = 'item:scathe'
  PERSON = 'person:corialia-scathe'
  REVIEW = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  IDS = %w[
    6 6059 12514 17564 19589 19892 22660 25375 27452 27584 29155
    30854 35226 36195 38394 40552 46005 49998 54186 56733 59471
  ].freeze
  EVIDENCE = 'English Scathe in this row is the surname or title-form reference of the already registered surgeon Corialia Scathe, not the standalone base:4596 item label. The same exact row is independently indexed to person:corialia-scathe; aligned Japanese and Chinese support the person context. Exclude only this item-candidate occurrence; do not connect the item to the person, add aliases, or change the Korean cell.'

  def build_reviews(inventory, index)
    item_keys = index.select { |row| row['entity_key'] == ITEM }.map { |row| M.key(row) }
    person_by_key = index.select { |row| row['entity_key'] == PERSON }
      .to_h { |row| [M.key(row), row] }
    candidates = inventory.values.select do |source|
      JSON.parse(source.fetch('en_texts_json')).compact.any? do |text|
        text.match?(/(?<![A-Za-z])Scathe(?![A-Za-z])/i)
      end
    end
    new_candidates = candidates.reject { |source| item_keys.include?(M.key(source)) }
    raise 'D-21467 Scathe surname source scope differs' unless
      new_candidates.map { |source| M.key(source) }.sort ==
        IDS.map { |id| ['default', id, ''] }.sort

    new_candidates.map do |source|
      key = M.key(source)
      person = person_by_key[key]
      raise "missing exact Corialia context at #{key.inspect}" unless person &&
        %w[accepted not-an-issue excluded uncertain].include?(person['status'])

      english_texts = JSON.parse(source.fetch('en_texts_json')).compact
      japanese_texts = JSON.parse(source.fetch('ja_texts_json')).compact
      english = english_texts.join("\n")
      japanese = japanese_texts.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "Scathe not a person reference at #{key.inspect}" unless
        english_texts.any? { |text| text.match?(/\b(?:Corialia Scathe|Mistress Scathe)\b/i) }
      raise "Japanese surname evidence missing at #{key.inspect}" unless
        japanese.match?(/スケイズ|コリアリア/)
      raise "Chinese surname evidence missing at #{key.inspect}" unless
        chinese.match?(/斯卡|斯凯瑟|科里亚利亚/)

      old = source.fetch('work_text')
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ITEM, 'status' => 'excluded', 'old' => old, 'new' => old,
        'evidence' => EVIDENCE, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese, 'entity_dispositions_json' => JSON.generate(ITEM => 'excluded')
      }
    end.sort_by { |row| row['ID_Linha'].to_i }
  end

  def run
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    item = glossary.find { |row| row['entity_key'] == ITEM }
    person = glossary.find { |row| row['entity_key'] == PERSON }
    raise 'Scathe item/person glossary entries differ' unless
      item && item['english_canonical'] == 'Scathe' && item['category'] == 'item' &&
      person && person['english_canonical'] == 'Corialia Scathe'

    inventory = M.refresh_inventory
    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    reviews = build_reviews(inventory, index)
    raise 'D-21467 Scathe rows must remain unchanged exclusions' unless
      reviews.length == 21 && reviews.all? do |row|
        row['status'] == 'excluded' && row['old'] == row['new']
      end
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    target_keys = reviews.map { |row| [ITEM, *M.key(row)] }
    indexed_keys = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'D-21467 repeats an existing item occurrence' unless
      (target_keys & indexed_keys).empty?

    previous_index = index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)],
       row.reject { |field, _| field == 'korean_current' }]
    end
    new_index_rows = reviews.map do |review|
      {
        'entity_key' => ITEM, 'resource' => review.fetch('resource'),
        'ID_Linha' => review.fetch('ID_Linha'),
        'Tipo_Variante' => review.fetch('Tipo_Variante'),
        'matched_english' => 'Scathe', 'english_source' => review.fetch('english'),
        'korean_current' => review.fetch('old'), 'status' => 'needs-context',
        'evidence' => 'Candidate hit from the English source; verify this occurrence in context.'
      }
    end
    M.write_table(REVIEW, M::HEADERS.take(12), reviews)
    M.write_table(M::INDEX, index_table.headers, index + new_index_rows)
    M.run(REVIEW, D, 1)

    final_index = M.table(M::INDEX).map(&:to_h)
    final_by_key = final_index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)],
       row.reject { |field, _| field == 'korean_current' }]
    end
    previous_index.each do |key, row|
      raise "prior Scathe disposition changed #{key.inspect}" unless final_by_key[key] == row
    end
    final_glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    raise 'D-21467 changed glossary entries' unless final_glossary == glossary
    puts "D-#{D}: excluded 21 surname/title false positives from item:scathe; CSV unchanged."
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-scathe-surname-overlaps-D21467.rb' unless ARGV.empty?
  ScatheSurnameOverlapsD21467.run
end
