#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module MotusDocumentTitlesD21093
  M = ReviewedNameBatches
  D = 21_093
  DEFINITIONS = File.join(M::AUDIT, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(M::AUDIT, "proper-name-discovery-D#{D}.tsv")
  CASES = [
    ['1999', 'work:motus-reports-iv', 'Motus Reports IV', '모투스(Motus) 보고서 IV', '모투스 보고서 IV'],
    ['3235', 'work:motus-memoradum', 'Motus Memoradum', '모투스(Motus) 비망록', '모투스 비망록'],
    ['4165', 'work:motus-reports-vi', 'Motus Reports VI', '모투스 보고서 VI', '모투스 보고서 VI'],
    ['4619', 'work:motus-handbook', 'Motus Handbook', '모투스 사 안내서', '모투스 사 안내서'],
    ['4725', 'work:motus-reports-v', 'Motus Reports V', '모투스 보고서 V', '모투스 보고서 V']
  ].freeze
  NOTES = 'These are complete base document/book labels, not company short references. English is the label authority; Japanese モータス社報告 / モータス社のメモ / モータス社の手引書 and Chinese 莫图斯报告 / 莫图斯备忘录 / 莫图斯手册 corroborate. Pair the whole title and preserve each Roman volume number; remove a nested Motus-only label when present. Preserve the original Korean title wording including 사 in the Handbook. English Memoradum is the actual source spelling, not a newly introduced typo; preserve it in the English parenthetical and immutable source. The manual supplies no spelling for these titles. This does not reopen or recount the company-reference decisions in D-21085/D-21086.'

  module_function

  def definitions
    CASES.map do |id, entity, english, old, korean|
      {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => 'named work', 'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '', 'korean_variants' => old.gsub('(Motus)', ''),
        'evidence_ids' => "D-#{D}|base:#{id}:11", 'status' => 'confirmed',
        'notes' => NOTES
      }
    end
  end

  def reviews(inventory)
    CASES.map do |id, entity, english, old, korean|
      source = inventory.fetch(['base', id, '11'])
      raise "Motus title source mismatch #{id}" unless
        JSON.parse(source.fetch('en_texts_json')).compact == [english]
      raise "Motus title draft mismatch #{id}" unless source.fetch('work_text') == old
      {
        'resource' => 'base', 'ID_Linha' => id, 'Tipo_Variante' => '11',
        'entity_key' => entity, 'status' => 'accepted', 'old' => old,
        'new' => "#{korean}(#{english})", 'evidence' => NOTES,
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => 'accepted'),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
  end

  def run
    inventory = M.refresh_inventory
    review_rows = reviews(inventory)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    ReviewedProperNameDiscovery.validate!(
      definitions, review_rows, generated, glossary.map(&:to_h), index.map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(review_rows, inventory)
    raise 'unexpected Motus document source scope' unless generated.length == 5
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS, review_rows)
    puts 'Prepared five complete Motus document titles; no CSV changes yet.'
  end
end

MotusDocumentTitlesD21093.run if $PROGRAM_NAME == __FILE__
