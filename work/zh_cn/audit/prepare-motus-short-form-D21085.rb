#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module MotusShortFormD21085
  M = ReviewedNameBatches
  D = 21_085
  ENTITY = 'organization:motus-mining'
  TERM = 'Motus'
  REVIEW_PATH = File.join(M::AUDIT, "proper-name-discovery-D#{D}.tsv")
  INDEX_HEADERS = %w[
    entity_key resource ID_Linha Tipo_Variante matched_english english_source
    korean_current status evidence
  ].freeze
  EXCLUSIONS = {
    '3592' => 'Motus Report: Entry 41B is a document heading already carrying the short bilingual label. Preserve it outside the organization-reference scope; do not reinterpret the complete title as a corporate alias.',
    '37021' => 'Artan Motus is the personal-name signature, confirmed by Japanese アータン・モータス and Chinese 阿坦·莫图斯. Preserve 아르탄 모투스(Artan Motus) atomically; Motus here is not the company short name.',
    '38767' => 'The exact label Motus Miner is a complete role label, not a row-local company mention. Exclude this key from organization-name normalization; review the compound label atomically if needed.'
  }.freeze
  EVIDENCE = <<~TEXT.strip
    English uses the row-local short form Motus for the registered Motus Mining organization. Aligned Japanese モータス(社) and Chinese 莫图斯 identify the same company in these Hollowlands/Apotyre business contexts. Pair the exact Korean short reference only on this reviewed row; do not add Motus as a global alias or rewrite complete organization, place, person, role, or document names.
  TEXT

  module_function

  def english(row)
    JSON.parse(row.fetch('en_texts_json') || '[]').compact.join("\n---\n")
  end

  def candidate?(row)
    return false unless row.fetch('resource') == 'default'

    text = english(row)
    text.match?(/(?<![A-Za-z])Motus(?![A-Za-z])/i) &&
      !text.match?(/\bMotus Mining\b/i)
  end

  def paired_source?(text, localized_term)
    text.match?(localized_term) ||
      text.match?(/(?<![A-Za-z])Motus(?![A-Za-z])/i)
  end

  def reviews(inventory)
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    raise "missing registered entity #{ENTITY}" unless
      glossary.any? { |row| row['entity_key'] == ENTITY }

    rows = inventory.values.select { |row| candidate?(row) }
      .sort_by { |row| [row.fetch('ID_Linha').to_i, row['Tipo_Variante'].to_s] }
    raise "unexpected Motus candidate count: #{rows.length}" unless rows.length == 59

    rows.map do |source|
      key = M.key(source)
      text = english(source)
      english_count = text.scan(/(?<![A-Za-z])Motus(?![A-Za-z])/i).length
      korean_count = source.fetch('work_text').scan(/모투스/i).length
      raise "unmatched Korean Motus span at #{key.inspect}" unless
        english_count.positive? && english_count == korean_count
      raise "Japanese Motus evidence missing at #{key.inspect}" unless
        paired_source?(JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n"), /モータス/)
      raise "Chinese Motus evidence missing at #{key.inspect}" unless
        paired_source?(source.fetch('zh_text'), /莫图斯/)

      old = source.fetch('work_text')
      excluded = EXCLUSIONS.key?(key[1])
      new_text = if excluded
                   old
                 else
                   old.gsub(/모투스(?!\(Motus\))/i, '모투스(Motus)')
                 end
      status = if excluded
                 'excluded'
               elsif old == new_text
                 'not-an-issue'
               else
                 'accepted'
               end
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => excluded ? EXCLUSIONS.fetch(key[1]) :
          (key[1] == '12547' ?
            'The isolated label Motus is already 모투스(Motus). Japanese and Chinese both retain the literal Motus; preserve the existing bilingual label without expanding it to Motus Mining. This row-scoped label does not establish a global short-form alias.' :
            EVIDENCE),
        'english' => text,
        'japanese' => JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end
  end

  def prepare_and_run
    raise 'Motus discovery is already recorded; do not register it twice' if
      File.file?(REVIEW_PATH)
    M.command!('ruby', File.join(M::AUDIT, 'test-motus-short-form-D21085.rb'))
    inventory = M.refresh_inventory
    review_rows = reviews(inventory)
    statuses = review_rows.group_by { |row| row.fetch('status') }
      .transform_values(&:length)
    raise "unexpected Motus short-form dispositions: #{statuses.inspect}" unless
      statuses == { 'accepted' => 37, 'not-an-issue' => 19, 'excluded' => 3 }

    glossary_table = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    entry = glossary.find { |row| row['entity_key'] == ENTITY }
    row_keys = entry.fetch('evidence_ids').to_s.split('|')
    additions = review_rows.map do |row|
      [row.fetch('resource'), row.fetch('ID_Linha'),
       row.fetch('Tipo_Variante')].reject(&:empty?).join(':')
    end
    entry['evidence_ids'] = (row_keys + ["D-#{D}"] + additions).uniq.join('|')
    entry['notes'] += ' D-21085/D-21086 additionally review 59 row-scoped Motus candidates: company references are normalized locally; document heading 3592, personal signature 37021, and role label 38767 are excluded. No global Motus alias is registered.'
    M.write_table(File.join(M::AUDIT, 'proper-name-glossary.tsv'),
                  glossary_table.headers, glossary)

    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    indexed = index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row]
    end
    review_rows.each do |row|
      index_key = [ENTITY, *M.key(row)]
      raise "Motus key already indexed: #{index_key.inspect}" if indexed.key?(index_key)
      source = inventory.fetch(M.key(row))
      index << {
        'entity_key' => ENTITY,
        'resource' => row.fetch('resource'),
        'ID_Linha' => row.fetch('ID_Linha'),
        'Tipo_Variante' => row.fetch('Tipo_Variante'),
        'matched_english' => TERM,
        'english_source' => english(source),
        'korean_current' => source.fetch('work_text'),
        'status' => 'needs-context',
        'evidence' => "D-#{D} candidate: verify this row-scoped Motus reference against #{ENTITY}."
      }
    end
    M.write_table(M::INDEX, index_table.headers, index)
    M.write_table(REVIEW_PATH, M::HEADERS, review_rows)
    M.run(REVIEW_PATH, D, nil)
  end
end

if $PROGRAM_NAME == __FILE__
  MotusShortFormD21085.prepare_and_run
end
