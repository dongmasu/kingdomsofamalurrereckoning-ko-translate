#!/usr/bin/env ruby

require 'csv'
require 'json'
require 'digest'
require_relative 'apply-reviewed-proper-name-discovery'

module LyriaTempleAliasD21372
  M = ReviewedNameBatches
  ENTITY = 'place:lyrias-temple'
  ALIAS = 'Temple of Lyria'
  START_D = 21_372
  GLOSSARY = File.join(M::AUDIT, 'proper-name-glossary.tsv')
  INDEX = M::INDEX
  CANDIDATES = File.join(M::AUDIT, 'proper-name-variant-discovery-candidates-20261015.tsv')
  REVIEW = File.join(M::AUDIT, 'proper-name-alias-review-D21372.tsv')
  DEFINITION = File.join(M::AUDIT, 'proper-name-alias-definition-D21372.tsv')
  NOTE = 'D-21372: English Temple of Lyria is the alternate source phrasing for the existing Rathir place place:lyrias-temple (canonical source form Lyria\'s Temple). The exact English venue descriptions and labels, plus the same Japanese リリア寺院 and Chinese 莉里亚神庙 used for the existing base:529 label, establish one temple rather than a second site. The official Korean manual PDF p. 2 establishes the deity spelling 리리아 but does not list this site. Use the existing Korean canonical 리리아의 사원 and preserve the exact source-local alias in parentheses. Keep the deity Lyria and all named objects/rites separate.'
  TARGETS = {
    ['base', '2522'] => ['리리아(Lyria)의 신전', '리리아의 사원(Temple of Lyria)'],
    ['default', '384'] => ['리리아(Lyria) 신전', '리리아의 사원(Temple of Lyria)'],
    ['default', '1428'] => ['리리아(Lyria) 신전', '리리아의 사원(Temple of Lyria)'],
    ['default', '2174'] => ['리리아(Lyria) 신전', '리리아의 사원(Temple of Lyria)'],
    ['default', '8683'] => ['리리아(Lyria) 신전', '리리아의 사원(Temple of Lyria)'],
    ['default', '9894'] => ['리리아(Lyria) 신전', '리리아의 사원(Temple of Lyria)'],
    ['default', '10578'] => ['라시르(Rathir)의 리리아(Lyria) 신전', '라시르(Rathir)에 있는 리리아의 사원(Temple of Lyria)'],
    ['default', '16247'] => ['리리아 신전(Temple of Lyria)의 세라논(Seranon) 사제', '리리아의 사원(Temple of Lyria)에 있는 세라논(Seranon) 사제'],
    ['default', '20206'] => ['리리아(Lyria)의 신전', '리리아의 사원(Temple of Lyria)'],
    ['default', '21020'] => ['리리아(Lyria) 신전', '리리아의 사원(Temple of Lyria)'],
    ['default', '23064'] => ['리리아(Lyria) 신전', '리리아의 사원(Temple of Lyria)'],
    ['default', '25018'] => ['리리아(Lyria) 사원', '리리아의 사원(Temple of Lyria)'],
    ['default', '42159'] => ['라시르(Rathir) 리리아(Lyria) 사원의 입문자가', '라시르(Rathir)에 있는 리리아의 사원(Temple of Lyria)에서 입문자가'],
    ['default', '49616'] => ['리리아 사원', '리리아의 사원(Temple of Lyria)'],
    ['default', '50710'] => ['리리아(Lyria) 신전의 처녀의 두건(Cowl of the Maiden)', '리리아의 사원(Temple of Lyria)에 있는 처녀의 두건(Cowl of the Maiden)'],
    ['default', '52592'] => ['리리아(Lyria) 사원', '리리아의 사원(Temple of Lyria)'],
    ['default', '57372'] => ['리리아(Lyria)의 기도 사원에서', '리리아의 사원(Temple of Lyria)에서 진행하는 기도 의식(Orison)의'],
    ['default', '58737'] => ['리리아(Lyria) 사원', '리리아의 사원(Temple of Lyria)'],
    ['default', '59882'] => ['리리아(Lyria)의 사원', '리리아의 사원(Temple of Lyria)'],
    ['default', '61462'] => ['리리아(Lyria) 사원', '리리아의 사원(Temple of Lyria)'],
    ['default', '62365'] => ['리리아 신전(Temple of Lyria)', '리리아의 사원(Temple of Lyria)']
  }.freeze

  module_function

  def append(old, values)
    (old.to_s.split('|').reject(&:empty?) + values).uniq.join('|')
  end

  def updated_entity(glossary)
    row = glossary.find { |entry| entry.fetch('entity_key') == ENTITY }
    raise 'existing place entity changed' unless row &&
      row['english_canonical'] == "Lyria's Temple" &&
      row['korean_canonical'] == '리리아의 사원(Lyria\'s Temple)' &&
      row['status'] == 'confirmed'
    collisions = glossary.reject { |entry| entry['entity_key'] == ENTITY }.any? do |entry|
      ([entry['english_canonical']] + entry['english_aliases'].to_s.split('|'))
        .any? { |term| term.casecmp?(ALIAS) }
    end
    raise 'English alias already belongs to another entity' if collisions
    raise 'alias unexpectedly already registered' if row['english_aliases'].to_s.split('|').include?(ALIAS)

    row.merge(
      'english_aliases' => append(row['english_aliases'], [ALIAS]),
      'korean_variants' => append(row['korean_variants'], [
        '리리아(Lyria) 신전', '리리아(Lyria)의 신전', '리리아(Lyria) 사원',
        '리리아(Lyria)의 사원', '리리아 신전', '리리아 사원', '리리아(Lyria)의 기도 사원'
      ]),
      'evidence_ids' => append(row['evidence_ids'], [
        'D-21372', 'base:2522:11', *TARGETS.keys.map { |resource, id| "#{resource}:#{id}" }
      ]),
      'notes' => [row['notes'], NOTE].reject(&:empty?).join(' ')
    )
  end

  def reviewed_rows(entity, inventory, index)
    existing = index.to_h { |row| [[row.fetch('entity_key'), *M.key(row)], row] }
    generated = build_occurrences(inventory.values, [entity]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    new_alias_hits = generated.select do |row|
      row['matched_english'].to_s.split('|').include?(ALIAS)
    end
    expected_keys = TARGETS.keys.map do |resource, id|
      [ENTITY, resource, id, resource == 'base' ? '11' : '']
    end
    actual_keys = new_alias_hits.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise "alias hit coverage differs: #{actual_keys.inspect}" unless actual_keys.sort == expected_keys.sort
    raise 'an alias key is already indexed' unless (actual_keys & existing.keys).empty?
    raise 'reviewed target scope differs' unless TARGETS.length == 21

    new_alias_hits.map do |row|
      key = M.key(row)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      fragment, replacement = TARGETS.fetch(key.values_at(0, 1))
      raise "expected Korean span is not unique at #{key.inspect}" unless old.scan(Regexp.new(Regexp.escape(fragment))).length == 1
      updated = old.sub(fragment, replacement)
      raise "Korean target did not change at #{key.inspect}" if updated == old
      raise "opaque tokens or line breaks changed at #{key.inspect}" unless
        ProperNameCellEditor.tokens(old) == ProperNameCellEditor.tokens(updated) &&
        old.scan(/\r\n|\r|\n/) == updated.scan(/\r\n|\r|\n/)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => 'accepted', 'old' => old, 'new' => updated,
        'evidence' => "#{NOTE} Correct only this row's complete place-name span; preserve all surrounding narrative, particles, other entities, tokens and line breaks.",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
  end

  def run
    applying = ARGV == ['--apply']
    raise 'usage: prepare-lyrias-temple-alias-D21372.rb [--apply]' unless ARGV.empty? || applying
    ReviewedProperNameDiscovery.ensure_unused_batch!(START_D)

    glossary_table = M.table(GLOSSARY)
    index_table = M.table(INDEX)
    glossary = glossary_table.map(&:to_h)
    original_index = index_table.map(&:to_h)
    entity = updated_entity(glossary)
    initial_hashes = M.hashes
    initial_glossary = File.binread(GLOSSARY)
    initial_index = File.binread(INDEX)
    inventory = M.refresh_inventory
    rows = reviewed_rows(entity, inventory, original_index)
    rows.group_by { |row| row['resource'] }.each do |resource, targets|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), targets)
    end

    if applying
      raise 'prepared review changed; inspect and prepare again' unless
        M.table(REVIEW).map(&:to_h) == rows &&
        M.table(DEFINITION).map(&:to_h) == [entity]
      raise 'active CSV/glossary/index changed since preflight' unless
        initial_hashes == M.hashes &&
        initial_glossary == File.binread(GLOSSARY) &&
        initial_index == File.binread(INDEX)

      pending = rows.map do |row|
        row.merge(
          'evidence' => 'D-21372: Existing Lyria temple alias review; prepared manifest pending application.',
          'previous_status' => JSON.generate(ENTITY => 'needs-context'),
          'previous_evidence' => JSON.generate(ENTITY => 'Candidate hit from newly registered Temple of Lyria source alias.')
        )
      end
      updated_glossary = glossary.map { |row| row['entity_key'] == ENTITY ? entity : row }
      M.write_table(GLOSSARY, glossary_table.headers, updated_glossary)
      M.write_table(INDEX, index_table.headers, original_index + pending.map do |row|
        {
          'entity_key' => ENTITY, 'resource' => row['resource'],
          'ID_Linha' => row['ID_Linha'], 'Tipo_Variante' => row['Tipo_Variante'],
          'matched_english' => ALIAS, 'english_source' => row['english'],
          'korean_current' => row['old'], 'status' => 'needs-context',
          'evidence' => 'Candidate hit from newly registered Temple of Lyria source alias.'
        }
      end)
      M.run(REVIEW, START_D, 1)

      final_glossary = M.table(GLOSSARY).map(&:to_h)
      raise 'unexpected glossary mutation' unless final_glossary ==
        updated_glossary
      final_index = M.table(INDEX).map(&:to_h)
      final_by_key = final_index.to_h { |row| [[row.fetch('entity_key'), *M.key(row)], row] }
      raise 'duplicate final occurrence key' unless final_by_key.length == final_index.length
      original_index.each do |before|
        key = [before.fetch('entity_key'), *M.key(before)]
        after = final_by_key.fetch(key)
        next if key.first == ENTITY && rows.any? { |row| [ENTITY, *M.key(row)] == key }
        raise "historical disposition/evidence changed #{key.inspect}" unless
          before['status'] == after['status'] && before['evidence'] == after['evidence']
      end
      puts "Registered #{ALIAS} as an alias of #{ENTITY}; reviewed #{rows.length} new rows."
    else
      if [REVIEW, DEFINITION].any? { |path| File.exist?(path) }
        old_review = M.table(REVIEW).map(&:to_h)
        old_definition = M.table(DEFINITION).map(&:to_h)
        raise 'existing preparation belongs to a different scope' unless
          old_definition.length == 1 && old_definition.first['entity_key'] == ENTITY &&
          old_review.map { |row| M.key(row) }.sort == rows.map { |row| M.key(row) }.sort &&
          old_review.all? { |row| row['entity_key'] == ENTITY }
      end
      M.write_table(REVIEW, M::HEADERS, rows)
      M.write_table(DEFINITION, glossary_table.headers, [entity])
      puts "Prepared #{rows.length} rows: #{rows.count { |row| row['old'] != row['new'] }} accepted edits. No glossary/index/CSV changes."
    end
  end
end

LyriaTempleAliasD21372.run if $PROGRAM_NAME == __FILE__
