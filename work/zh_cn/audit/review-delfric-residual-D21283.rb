#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module DelfricResidualD21283
  M = ReviewedNameBatches
  ENTITY = 'person:tine-delfric'
  PROPOSAL = File.join(M::AUDIT, 'proper-name-residual-review-D21283.tsv')
  DAY = M::RUN_DATE_COMPACT
  EDITS = {
    ['default', '8832', ''] => ['델프릭 장군님', '델프릭(Delfric) 장군님'],
    ['default', '9211', ''] => ['델프릭 성주', '델프릭(Delfric) 성주'],
    ['default', '13367', ''] => ['델프릭 처치', '델프릭(Delfric) 처치'],
    ['default', '19268', ''] => ['고대인 델프릭이', '고대인 델프릭(Delfric)이'],
    ['default', '25599', ''] => ['고대의 델프릭 대장군', '고대의 델프릭(Delfric) 대장군'],
    ['default', '34389', ''] => ['성주 델프릭이', '성주 델프릭(Delfric)이'],
    ['default', '35501', ''] => ['원로 델프릭이', '원로 델프릭(Delfric)이'],
    ['default', '37559', ''] => ['델프릭이 기다리고 있어', '델프릭(Delfric)이 기다리고 있어'],
    ['default', '40473', ''] => ['현자 델프릭이었다', '현자 델프릭(Delfric)이었다'],
    ['default', '41982', ''] => ['델프릭에게 알려야 해', '델프릭(Delfric)에게 알려야 해'],
    ['default', '45293', ''] => ['델프릭 성주를 찾아왔나', '델프릭(Delfric) 성주를 찾아왔나'],
    ['default', '49198', ''] => ['델프릭은 현명해', '델프릭(Delfric)은 현명해']
  }.freeze
  RESOURCE_ORDER = { 'affix' => 0, 'base' => 1, 'default' => 2 }.freeze

  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def run
    raise "D-21283 artifacts already exist" if [
      PROPOSAL,
      File.join(M::AUDIT, "proper-name-edits-D21283.tsv"),
      File.join(M::AUDIT, "named-scope-review-D21283-#{DAY}.md"),
      File.join(M::AUDIT, "named-scope-edit-addendum-D21283-#{DAY}.md"),
      "/private/tmp/ko-translate-backups/#{DAY}/before-proper-name-D21283"
    ].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    existing = index.map { |row| [row['entity_key'], *key(row)] }.to_set
    candidates = inventory.values.select do |row|
      english = JSON.parse(row.fetch('en_texts_json') || '[]').compact.join("\n")
      english.match?(/(?<![A-Za-z0-9_])Delfric(?![A-Za-z0-9_])/i) &&
        !existing.include?([ENTITY, *key(row)])
    end
    candidates.sort_by! do |row|
      [RESOURCE_ORDER.fetch(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s]
    end
    raise "expected 20 unindexed surname-only rows, got #{candidates.length}" unless candidates.length == 20
    raise 'duplicate candidate row key' unless candidates.map { |row| key(row) }.uniq.length == candidates.length

    proposals = candidates.map do |source|
      row_key = key(source)
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      raise "full-name hit must already be indexed: #{row_key.inspect}" if
        english.match?(/(?<![A-Za-z])Tine\s+Delfric(?![A-Za-z])/i)
      korean = source.fetch('work_text')
      change = EDITS[row_key]
      if change
        old_span, new_span = change
        raise "expected one source span at #{row_key.inspect}" unless korean.scan(old_span).length == 1
        new_korean = korean.sub(old_span, new_span)
        raise "missing bilingual surname at #{row_key.inspect}" unless new_korean.include?('델프릭(Delfric)')
        status = 'accepted'
      else
        raise "unexpected unpaired surname at #{row_key.inspect}" unless
          korean.match?(/델프릭\([^()]*Delfric[^()]*\)/)
        new_korean = korean
        status = 'not-an-issue'
      end
      dispositions = { ENTITY => status }
      {
        'entity_key' => ENTITY,
        'resource' => source.fetch('resource'),
        'ID_Linha' => source.fetch('ID_Linha'),
        'Tipo_Variante' => source['Tipo_Variante'].to_s,
        'status' => status,
        'old' => korean,
        'new' => new_korean,
        'evidence' => 'English establishes the exact proper-name form Delfric; aligned Japanese デルフリック and Chinese 德尔弗雷克 corroborate it. This row-scoped surname decision covers only the name label, adds no global surname alias, and does not resolve any separate rank, title, or referent hold.',
        'english' => '',
        'japanese' => '',
        'chinese' => '',
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end
    raise "accepted edit count differs: #{proposals.count { |row| row['status'] == 'accepted' }}" unless
      proposals.count { |row| row['status'] == 'accepted' } == EDITS.length

    additions = candidates.zip(proposals).map do |source, proposal|
      [
        ENTITY, source.fetch('resource'), source.fetch('ID_Linha'),
        source['Tipo_Variante'].to_s,
        'Delfric [row-scoped surname; no global alias]',
        JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n---\n"),
        source.fetch('work_text'), 'needs-context',
        'Newly discovered surname-only English hit; check whether this person-name component is already bilingual in Korean.'
      ]
    end
    occurrence_rows = index.map(&:to_h) + additions.map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'duplicate entity/row occurrence key' unless
      occurrence_rows.map { |row| [row.fetch('entity_key'), *key(row)] }.uniq.length == occurrence_rows.length

    M.write_table(PROPOSAL, M::HEADERS, proposals)
    M.write_table(M::INDEX, OCCURRENCE_HEADERS, occurrence_rows.sort_by do |row|
      [RESOURCE_ORDER.fetch(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end)
    puts "D-21283 prepared #{proposals.length} row keys: #{proposals.count { |row| row['status'] == 'accepted' }} accepted, #{proposals.count { |row| row['status'] == 'not-an-issue' }} not-an-issue."
  end
end

DelfricResidualD21283.run if $PROGRAM_NAME == __FILE__
