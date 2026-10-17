#!/usr/bin/env ruby

require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module AronCompanyResidualD21286
  M = ReviewedNameBatches
  ENTITY = 'organization:aron-excavations'
  PROPOSAL = File.join(M::AUDIT, 'proper-name-residual-review-D21286.tsv')
  SPANS = {
    '11781' => ["아론의 채굴장(Aron's Excavations)", "아론 채굴사(Aron's Excavations)"],
    '37302' => ['아론 채굴단을', "아론 채굴사(Aron's Excavations)를"],
    '47872' => ['아론 발굴단의', "아론 채굴사(Aron's Excavations)의"]
  }.freeze
  EVIDENCE = "English explicitly names Aron's Excavations as the mining company run by Edgar Aron; Japanese アロン採掘所/アロンの採掘所 and Chinese 埃隆开采计划/埃隆矿业 corroborate the organization. Reuse the existing organization:aron-excavations canonical stem 아론 채굴사 while retaining this row's exact possessive English company spelling. This is not a new entity or a global personal Aron alias. Preserve the already reviewed Edgar Aron and Calovar spans and all other content. Official Korean manual PDF pp. 1, 4 and 7 supplies setting, crafting and faction/quest context, not this company's name."

  module_function

  def run
    raise 'proposal already exists' if File.exist?(PROPOSAL)
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    existing = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }.to_set
    sources = SPANS.keys.map { |id| inventory.fetch(['default', id, '']) }
    reviews = sources.map do |source|
      key = M.key(source)
      raise "company key already indexed: #{key.inspect}" if existing.include?([ENTITY, *key])
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise 'possessive company source changed' unless english.include?("Aron's Excavations")
      old_span, new_span = SPANS.fetch(source.fetch('ID_Linha'))
      old = source.fetch('work_text')
      raise "company span mismatch: #{key.inspect}" unless old.scan(old_span).length == 1
      {
        'resource' => 'default', 'ID_Linha' => source.fetch('ID_Linha'),
        'Tipo_Variante' => '', 'entity_key' => ENTITY, 'status' => 'accepted',
        'old' => old, 'new' => old.sub(old_span, new_span), 'evidence' => EVIDENCE,
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    additions = sources.map do |source|
      [ENTITY, *M.key(source), "Aron's Excavations",
       JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n"),
       source.fetch('work_text'), 'needs-context', 'Newly discovered explicit possessive company-name occurrence.']
    end
    rows = index.map(&:to_h) + additions.map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    M.write_table(PROPOSAL, M::HEADERS, reviews)
    M.write_table(M::INDEX, OCCURRENCE_HEADERS, rows.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end)
    puts "Prepared #{reviews.length} explicit company-name corrections; ambiguous Aron worker references are not assigned."
  end
end

AronCompanyResidualD21286.run if $PROGRAM_NAME == __FILE__
