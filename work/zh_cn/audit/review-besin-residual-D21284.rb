#!/usr/bin/env ruby

require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

# Row-scoped surname review; the complete-name glossary entry is unchanged.
module BesinResidualD21284
  M = ReviewedNameBatches
  ENTITY = 'person:anru-besin'
  PROPOSAL = File.join(M::AUDIT, 'proper-name-residual-review-D21284.tsv')
  IDS = %w[
    1752 1977 3540 4081 4300 4983 5270 7736 8564 9696 14508 15661
    16126 16646 17265 18206 19506 20052 20636 21266 21378 21554
    22337 22796 23650 23779 25314 26914 26997 27574 27748 28943
    29029 29831 30548 31734 32107 33775 34246 34726 34776 36405
    37408 37580 37832 39492 42118 42716 42932 42934 44386 45127
    45192 52669 52971 54076 54109 54292 54309 55488 56498 61591
    61711 61713 61735 63929 63975 64167 64664
  ].freeze
  EVIDENCE = 'English uses Besin/Lord Besin for the Alfar lord whose identity is established by default:29469 as Anru Besin, corroborated by Japanese ベシン and Chinese 贝辛 in the same Fahrlangi/Niskaru plot. Add only the row-local bilingual surname label, preserving already-complete Lord Besin labels, titles, quest instructions and other entities. No global surname alias or new person is registered. Official Korean manual PDF p. 7 (printed pp. 13-14) supplies Warsworn/faction context, not this personal name. Earlier sequential decisions and unrelated holds are not reopened.'

  module_function

  def run
    raise 'proposal already exists' if File.exist?(PROPOSAL)
    [21_284, 21_285].each do |d|
      raise "D-#{d} already recorded" unless
        Dir.glob(File.join(M::AUDIT, "named-scope-*-D#{d}-*.md")).empty?
      raise "D-#{d} backup already exists" if
        File.exist?("/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{d}")
    end
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    existing = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }.to_set
    sources = inventory.values.select do |row|
      english = JSON.parse(row.fetch('en_texts_json')).compact.join("\n")
      english.match?(/\bBesin\b/i) && !existing.include?([ENTITY, *M.key(row)])
    end
    sources.sort_by! { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante'].to_s] }
    raise 'source discovery differs from reviewed key set' unless
      sources.map { |row| M.key(row) } == IDS.map { |id| ['default', id, ''] }
    reviews = sources.map do |source|
      old = source.fetch('work_text')
      raise 'unrecognized Korean Besin form' unless old.include?('베신')
      new_text = old.gsub(/베신 경\(Lord Besin\)|베신\(Fahrlang and Besin\)|베신(?:\(Besin\))?/) do |span|
        span == '베신 경(Lord Besin)' ? span : '베신(Besin)'
      end
      status = old == new_text ? 'not-an-issue' : 'accepted'
      evidence = EVIDENCE.dup
      if source['ID_Linha'] == '14508'
        evidence += ' Both English and aligned Japanese/Chinese coordinate two people; replace the erroneous whole-question annotation attached to Besin with Besin alone, retaining the existing separate Fahrlang label.'
      end
      {
        'resource' => source.fetch('resource'),
        'ID_Linha' => source.fetch('ID_Linha'),
        'Tipo_Variante' => source['Tipo_Variante'].to_s,
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => evidence,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end
    additions = sources.map do |source|
      [
        ENTITY, *M.key(source), 'Besin',
        JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n"),
        source.fetch('work_text'), 'needs-context',
        'New surname/title source hit; compare with existing Anru Besin identity and bilingual labels.'
      ]
    end
    rows = index.map(&:to_h) + additions.map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    raise 'duplicate entity/row key' unless
      rows.map { |row| [row.fetch('entity_key'), *M.key(row)] }.uniq.length == rows.length
    M.write_table(PROPOSAL, M::HEADERS, reviews)
    M.write_table(M::INDEX, OCCURRENCE_HEADERS, rows.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end)
    puts "Prepared #{reviews.length} keys: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

BesinResidualD21284.run if $PROGRAM_NAME == __FILE__
