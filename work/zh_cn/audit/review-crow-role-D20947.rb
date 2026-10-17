#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module CrowRoleD20947
  extend self

  M = ReviewedNameBatches
  ENTITY = 'organization:the-crows'
  ROLE_IDS = %w[20755 23181 32860 35179].freeze
  OVERLAP_ID = '744'
  CORRECTION_ID = '20959'
  EXPECTED_IDS = %w[
    744 1944 2182 7819 9776 9896 11803 13306 17085 18072 20755 23181
    23800 24089 30705 32860 34212 35179 37698 38629 42997 52906 55594
    55891 56367 56414 57110 58396 59563 59903 61098 64792
  ].freeze
  DEFINITION_ALIAS = 'Crow'
  TEAM_CORRECTION =
    '우린 이제 더는 크로우즈(The Crows)가 아니야, 챔피언. 대회는 끝났어. 그리고 역사상 최초로 우승한 크로우즈(The Crows)였지!'
  ROLE_TEXT = {
    '20755' => ['크로우가', '크로우(Crow)가'],
    '23181' => nil,
    '32860' => nil,
    '35179' => ['크로우가', '크로우(Crow)가']
  }.freeze

  def record(source, key, status, new_text, evidence, previous = nil)
    english_texts = JSON.parse(source.fetch('en_texts_json') || '[]').compact
    previous_status = previous ? previous.fetch('status') : 'needs-context'
    previous_evidence = previous ? previous.fetch('evidence') :
      'Candidate hit from the English source; verify this occurrence in context.'
    {
      'resource' => key[0],
      'ID_Linha' => key[1],
      'Tipo_Variante' => key[2],
      'entity_key' => ENTITY,
      'status' => status,
      'old' => source.fetch('work_text'),
      'new' => new_text,
      'evidence' => evidence,
      'english' => english_texts.join("\n"),
      'japanese' => JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
      'chinese' => source.fetch('zh_text'),
      'entity_dispositions_json' => JSON.generate(ENTITY => status),
      'previous_status' => JSON.generate(ENTITY => previous_status),
      'previous_evidence' => JSON.generate(ENTITY => previous_evidence)
    }
  end

  def role_evidence(id)
    case id
    when '20755'
      'English defines the Valor Arena survivor title Crow. Japanese クロウズ and Chinese 鸦群 corroborate the Arena-specific role; add the missing bilingual label without changing the sentence.'
    when '23181'
      'English defines Crow as the Arena tournament survivor title. Japanese クロウズ and Chinese 鸦群 corroborate; the existing 크로우(Crow) is already correct.'
    when '32860'
      'English directly addresses the new Arena Crow. Japanese クロウズ and Chinese 鸦群 corroborate; the existing 크로우(Crow) is already correct.'
    when '35179'
      'English defines Crow as the Arena survivor who escapes after losing teammates. Japanese クロウズ and Chinese 鸦群 corroborate; add the missing bilingual label without changing the sentence.'
    else
      raise "unexpected Crow role ID #{id}"
    end
  end

  def exclusion_evidence(english)
    if english.match?(/\bCrow Peak\b/i)
      'Excluded from the Arena-team entity: English explicitly names the separate place Crow Peak; the place name is reviewed under its own entity.'
    elsif english.match?(/\bcrow\b/i)
      'Excluded from the Arena-team entity: English uses crow as an ordinary bird or in a non-team comparison, not the Valor Arena group or survivor title.'
    else
      raise "unclassified Crow candidate #{english.inspect}"
    end
  end

  def recover_partial_run(manifest)
    raise 'D-20947 checkpoint already exists' if
      File.exist?(File.join(__dir__, 'named-scope-review-D20947-20261015.md'))

    expected_hashes = {
      'affix' => 'a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586',
      'base' => '851e01e95528ec088e4ce35b2a3adfb7a82d6ac91d78c611aad351c4828ee468',
      'default' => 'e5e1ec52dd051a061bebfd61ea313dc721f5f608a54a428b901dc8174e53f501'
    }
    current_hashes = M.hashes
    raise "affix/base hashes changed during recovery: #{current_hashes.inspect}" unless
      current_hashes.values_at('affix', 'base') == expected_hashes.values_at('affix', 'base')

    backup = '/private/tmp/ko-translate-backups/20261015/before-proper-name-D20947'
    backup_path = File.join(backup, 'locatexts_zh_cn.koalocatext_default.csv')
    before = File.binread(backup_path)
    before_hash = Digest::SHA256.hexdigest(before)
    raise "D-20947 backup hash mismatch: #{before_hash}" unless
      before_hash == expected_hashes.fetch('default')
    reviews = M.table(manifest).map(&:to_h)
    accepted = reviews.select { |row| row['status'] == 'accepted' }
    expected_after, row_count = ProperNameCellEditor.prepare(before, accepted)
    active_path = M.csv_path('default')
    active = File.binread(active_path)
    raise 'active default is not the exact reviewed D-20947 output' unless active == expected_after

    verify_output = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', manifest, '--backup-dir', backup
    )
    inventory = M.refresh_inventory
    reviews.each do |row|
      raise "post-edit mismatch at #{M.key(row).inspect}" unless
        inventory.fetch(M.key(row)).fetch('work_text') == row['new']
    end

    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    rows = glossary.map(&:to_h)
    position = rows.index { |row| row['entity_key'] == ENTITY }
    raise 'missing/duplicate Crows glossary entry during recovery' unless
      position && rows.count { |row| row['entity_key'] == ENTITY } == 1
    definition = rows.fetch(position)
    aliases = definition.fetch('english_aliases').to_s.split('|')
    raise 'Crow alias unexpectedly registered during recovery' if aliases.include?(DEFINITION_ALIAS)
    crow_definition = definition.merge(
      'english_aliases' => (aliases + [DEFINITION_ALIAS]).join('|')
    )

    generated = build_occurrences(inventory.values, [crow_definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "expanded Crows source-match count changed: #{generated.length}" unless generated.length == 172
    index = M.table(M::INDEX)
    existing = index.select { |row| row['entity_key'] == ENTITY }
                    .to_h { |row| [M.key(row), row.to_h] }
    raise "existing Crows index count changed: #{existing.length}" unless existing.length == 141
    missing_previous = existing.keys - generated.map { |row| M.key(row) }
    raise "previous Crows matches missing: #{missing_previous.inspect}" unless missing_previous.empty?
    new_index_rows = generated.reject { |row| existing.key?(M.key(row)) }
    raise "new Crow match count changed: #{new_index_rows.length}" unless new_index_rows.length == 31

    index_rows = index.map(&:to_h) + new_index_rows
    index_rows.sort_by! do |row|
      [row['resource'], row['ID_Linha'].to_i, row['Tipo_Variante'].to_s, row['entity_key']]
    end
    rows[position] = crow_definition
    M.write_table(glossary_path, glossary.headers, rows)
    M.write_table(M::INDEX, index.headers, index_rows)

    checks = [{
      resource: 'default', cells: accepted.length, rows: row_count,
      before_sha256: before_hash,
      after_sha256: Digest::SHA256.hexdigest(active),
      backup: backup_path,
      validation: 'BOM/line-endings/rows/order/tokens/non-target bytes/inverse PASS'
    }]
    M.checkpoint(
      20_947, reviews, checks, verify_output, inventory,
      review_states: %w[needs-context accepted]
    )
    puts "D-20947 recovery: #{reviews.length} reviewed keys; #{accepted.length} edited cells; #{new_index_rows.length} new Crow candidates indexed."
  end

  def run
    manifest = File.join(__dir__, 'proper-name-edits-D20947.tsv')
    return recover_partial_run(manifest) if File.exist?(manifest)

    inventory = M.refresh_inventory
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    definition = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'The Crows glossary entry missing or duplicated' unless
      definition && glossary.count { |row| row['entity_key'] == ENTITY } == 1
    aliases = definition.fetch('english_aliases').to_s.split('|')
    raise 'Crow alias already registered' if aliases.include?(DEFINITION_ALIAS)

    crow_definition = definition.to_h.merge(
      'english_aliases' => (aliases + [DEFINITION_ALIAS]).join('|')
    )
    crow_only_definition = {
      'entity_key' => ENTITY,
      'english_canonical' => DEFINITION_ALIAS,
      'category' => 'organization',
      'english_aliases' => ''
    }
    crow_candidates = build_occurrences(inventory.values, [crow_only_definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end.select { |row| row['resource'] == 'default' }
    found_ids = crow_candidates.map { |row| row['ID_Linha'] }.uniq.sort_by(&:to_i)
    raise "Crow source-key mismatch: #{found_ids.inspect}" unless found_ids == EXPECTED_IDS
    raise 'unexpected Crow-only candidate count' unless crow_candidates.length == 32

    generated = build_occurrences(inventory.values, [crow_definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end

    index = M.table(M::INDEX)
    existing = index.select { |row| row['entity_key'] == ENTITY }
                    .to_h { |row| [M.key(row), row.to_h] }
    generated_keys = generated.map { |row| M.key(row) }
    missing_previous = existing.keys - generated_keys
    raise "previous Crows candidates missing after alias expansion: #{missing_previous.inspect}" unless
      missing_previous.empty?
    crow_overlaps = crow_candidates.select { |row| existing.key?(M.key(row)) }
    raise "unexpected Crow-role overlap: #{crow_overlaps.map { |row| row['ID_Linha'] }.inspect}" unless
      crow_overlaps.map { |row| row['ID_Linha'] }.sort_by(&:to_i) == [OVERLAP_ID]
    raise 'previous Crows term candidates missing' unless existing.length == 141
    raise 'unexpected expanded Crows index size' unless generated.length == 172

    current_hashes = M.hashes
    expected_hashes = {
      'affix' => 'a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586',
      'base' => '851e01e95528ec088e4ce35b2a3adfb7a82d6ac91d78c611aad351c4828ee468',
      'default' => 'e5e1ec52dd051a061bebfd61ea313dc721f5f608a54a428b901dc8174e53f501'
    }
    raise "active CSV hashes differ: #{current_hashes.inspect}" unless current_hashes == expected_hashes

    reviews = crow_candidates.map do |match|
      key = M.key(match)
      id = key[1]
      next if id == OVERLAP_ID

      source = inventory.fetch(key)
      current = source.fetch('work_text')
      if ROLE_IDS.include?(id)
        replacement = ROLE_TEXT.fetch(id)
        new_text = if replacement
          before, after = replacement
          raise "expected one role span at #{id}" unless current.scan(Regexp.new(Regexp.escape(before))).length == 1
          current.sub(before, after)
        else
          current
        end
        status = new_text == current ? 'not-an-issue' : 'accepted'
        evidence = role_evidence(id)
      elsif id == CORRECTION_ID
        previous = existing.fetch(key)
        raise 'D-20959 no longer has the recorded mistaken text' unless
          current == '우린 이제 더는 크로우(Crow)가 아니야, 챔피언. 대회는 끝났어. 그리고 역사상 최초로 우승한 크로우(Crow)들이지!'
        raise 'D-20959 is not the prior terminal accepted disposition' unless previous['status'] == 'accepted'
        new_text = TEAM_CORRECTION
        status = 'accepted'
        evidence = 'Supersedes only the incorrect D-20945 singular-Crow rendering at this exact key. English Crows is the Valor Arena team in both clauses; Japanese クロウズ and Chinese 鸦群队 independently confirm the plural group. Correct the team-name span; do not recount the earlier accepted finding.'
      else
        new_text = current
        status = 'excluded'
        evidence = exclusion_evidence(JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n"))
      end

      record(source, key, status, new_text, evidence,
             id == CORRECTION_ID ? existing.fetch(key) : nil)
    end.compact

    raise "review row mismatch #{reviews.length}" unless reviews.length == 31
    correction_source = inventory.fetch(['default', CORRECTION_ID, ''])
    correction = record(
      correction_source, ['default', CORRECTION_ID, ''], 'accepted',
      TEAM_CORRECTION,
      'Supersedes only the incorrect D-20945 singular-Crow rendering at this exact key. English Crows is the Valor Arena team in both clauses; Japanese クロウズ and Chinese 鸦群队 independently confirm the plural group. Correct the team-name span; do not recount the earlier accepted finding.',
      existing.fetch(['default', CORRECTION_ID, ''])
    )
    reviews << correction
    reviews.sort_by! { |row| row.fetch('ID_Linha').to_i }
    raise 'expected 32 reviewed rows' unless reviews.length == 32
    raise 'expected exactly three text edits' unless
      reviews.count { |row| row['status'] == 'accepted' && row['old'] != row['new'] } == 3
    raise 'expected two retained roles and 27 exclusions' unless
      reviews.count { |row| row['status'] == 'not-an-issue' } == 2 &&
      reviews.count { |row| row['status'] == 'excluded' } == 27

    M.write_table(manifest, M::HEADERS, reviews)

    new_index_rows = generated.reject { |row| existing.key?(M.key(row)) }
    raise 'new candidate row count mismatch' unless new_index_rows.length == 31
    index_rows = index.map(&:to_h)
    index_rows.concat(new_index_rows)
    index_rows.sort_by! do |row|
      [row['resource'], row['ID_Linha'].to_i, row['Tipo_Variante'].to_s, row['entity_key']]
    end

    backup = '/private/tmp/ko-translate-backups/20261015/before-proper-name-D20947'
    checks = ProperNameCellEditor.apply(M::ROOT, manifest, backup, current_hashes)
    verify_output = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', manifest, '--backup-dir', backup
    )
    inventory = M.refresh_inventory
    reviews.each do |row|
      raise "post-edit mismatch at #{M.key(row).inspect}" unless
        inventory.fetch(M.key(row)).fetch('work_text') == row['new']
    end

    # Make the expanded matcher and its newly reviewed candidates available
    # only after the CSV edits have their verified pre-edit backup.
    glossary_rows = glossary.map(&:to_h)
    definition_position = glossary_rows.index { |row| row['entity_key'] == ENTITY }
    raise 'Crows glossary definition disappeared before write' unless definition_position
    glossary_rows[definition_position] = crow_definition
    M.write_table(glossary_path, glossary.headers, glossary_rows)
    M.write_table(M::INDEX, index.headers, index_rows)
    M.checkpoint(
      20_947, reviews, checks, verify_output, inventory,
      review_states: %w[needs-context accepted]
    )
    puts "D-20947: #{reviews.length} reviewed keys; #{checks.sum { |check| check[:cells] }} edited cells; #{new_index_rows.length} new Crow candidates indexed; prior overlap #{OVERLAP_ID} not recounted."
  end
end

CrowRoleD20947.run if $PROGRAM_NAME == __FILE__
