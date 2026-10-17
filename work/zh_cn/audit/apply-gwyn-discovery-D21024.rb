#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'
require_relative 'proper-name-cell-editor'

module GwynDiscoveryD21024
  M = ReviewedNameBatches
  AUDIT = M::AUDIT
  D = 21024
  BACKUP = '/private/tmp/ko-translate-backups/20261015/before-proper-name-D21024'
  MANIFEST = File.join(AUDIT, "proper-name-edits-D#{D}.tsv")
  DEFINITIONS_PATH = File.join(AUDIT, "proper-name-discovery-definitions-D#{D}.tsv")
  SCOUT_REVIEW_PATH = File.join(AUDIT, "proper-name-discovery-scout-D#{D}.tsv")
  ANWY_IDS = %w[
    5985 7527 8373 8564 12056 12857 14413 15962 16833 22533 22658
    27194 27574 30644 32331 33191 33291 44824 46652 54199 58273
    60809 61075 61473 62549 63633 64167 64493
  ].freeze
  ANWY_ENTITY = 'person:gwyn-anwy'
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese entity_dispositions_json previous_status previous_evidence
  ].freeze
  SCOPE_EVIDENCE = 'D-21024 row-scoped short form: English uses Gwyn without the surname in this exact row. The recurring Warsworn Vault/Oathblade storyline identifies her as Gwyn Anwy, corroborated by the full-name rows default:1850 and default:13031; Japanese グウィン and Chinese 格文 support the name. This exact-key decision does not register Gwyn as a global alias, which would collide with the distinct Gwyn Fawyn and Edar Gwyn.'
  SCOUT_HEADERS = %w[
    english_candidate source_rows already_terminal_full_name_rows
    row_scoped_gwyn_anwy separate_person_homonyms disposition evidence
  ].freeze

  module_function

  def definition(headers, entity_key:, english:, korean:, id:, notes:, variants: '')
    {
      'entity_key' => entity_key,
      'english_canonical' => english,
      'category' => 'person',
      'korean_canonical' => korean,
      'english_aliases' => '',
      'korean_variants' => variants,
      'evidence_ids' => "D-#{D}|default:#{id}",
      'status' => 'confirmed',
      'notes' => notes
    }.slice(*headers)
  end

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def source_texts(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json") || '[]').compact
  end

  def manifest_row(source, entity, status, old_text, new_text, evidence)
    {
      'resource' => source.fetch('resource'),
      'ID_Linha' => source.fetch('ID_Linha'),
      'Tipo_Variante' => source['Tipo_Variante'].to_s,
      'entity_key' => entity,
      'status' => status,
      'old' => old_text,
      'new' => new_text,
      'evidence' => evidence,
      'english' => source_texts(source, 'en').join("\n"),
      'japanese' => source_texts(source, 'ja').join("\n---\n"),
      'chinese' => source.fetch('zh_text').to_s,
      'entity_dispositions_json' => JSON.generate(entity => status),
      'previous_status' => '',
      'previous_evidence' => ''
    }
  end

  def run
    artifacts = [
      File.join(AUDIT, "named-scope-review-D#{D}-20261015.md"),
      File.join(AUDIT, "named-scope-edit-addendum-D#{D}-20261015.md"),
      MANIFEST, DEFINITIONS_PATH, SCOUT_REVIEW_PATH, BACKUP
    ]
    raise 'D-21024 artifact already exists' if artifacts.any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    glossary_path = File.join(AUDIT, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    existing_entities = glossary.map { |row| row.fetch('entity_key') }
    definitions = [
      definition(
        glossary.headers,
        entity_key: 'person:gwyn-fawyn',
        english: 'Gwyn Fawyn',
        korean: '그윈 파윈(Gwyn Fawyn)',
        id: '43000',
        variants: '귄 파윈',
        notes: 'The complete English person name appears at default:43000. Japanese グウィン・フェイン and Chinese 格文·法温 corroborate the identity and pronunciation. Keep distinct from Gwyn Anwy and from the Gwyn surname in Edar Gwyn; no short Gwyn alias is registered.'
      ),
      definition(
        glossary.headers,
        entity_key: 'person:edar-gwyn',
        english: 'Edar Gwyn',
        korean: '에다르 그윈(Edar Gwyn)',
        id: '53668',
        variants: '에다르 귄',
        notes: 'The English identifies Edar Gwyn as an Alfar actor and bard at default:53668; Japanese エダル・グウィン and Chinese 厄达尔·格文 corroborate. This complete personal-name entry supplements, but does not re-disposition, the existing person:edar component.'
      )
    ]
    raise 'D-21024 person entity already exists' unless
      (definitions.map { |row| row.fetch('entity_key') } & existing_entities).empty?

    existing_terms = glossary.flat_map do |row|
      [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
    end.map(&:downcase)
    new_terms = definitions.map { |row| row.fetch('english_canonical').downcase }
    raise 'English canonical collision' unless
      (new_terms & existing_terms).empty? && new_terms.uniq.length == new_terms.length

    anwy_reviews = ANWY_IDS.map do |id|
      source = inventory.fetch(['default', id, ''])
      english = source_texts(source, 'en').join("\n")
      raise "unexpected Gwyn Anwy source identity at default:#{id}" unless
        english.match?(/(?<![A-Za-z])Gwyn(?![A-Za-z])/i) &&
        !english.match?(/\bGwyn Anwy\b|\bGwyn Fawyn\b|\bEdar Gwyn\b/i)

      old_text = source.fetch('work_text')
      raise "full Korean name needs focused review at default:#{id}" if
        old_text.match?(/(?:그윈|귄)\s+안웨이/)
      pattern = /(?<![가-힣])(?:그윈|귄)(?:\(Gwyn\))?/
      english_mentions = english.scan(/(?<![A-Za-z])Gwyn(?![A-Za-z])/i).length
      korean_mentions = old_text.scan(pattern).length
      expected_korean_mentions = %w[30644 61075 63633].include?(id) ? 2 : english_mentions
      raise "English/Korean Gwyn mention count differs at default:#{id}" unless
        english_mentions.positive? && expected_korean_mentions == korean_mentions

      new_text = old_text.gsub(pattern, '그윈(Gwyn)')
      status = old_text == new_text ? 'not-an-issue' : 'accepted'
      evidence = SCOPE_EVIDENCE
      if %w[30644 61075 63633].include?(id)
        evidence += ' Korean repeats the established name in the clause where English switches to the pronoun “her”; both Korean references identify the same person.'
      end
      manifest_row(source, ANWY_ENTITY, status, old_text, new_text, evidence)
    end

    other_reviews = [
      ['43000', 'person:gwyn-fawyn', '귄 파윈', '그윈 파윈(Gwyn Fawyn)',
       'English names the distinct person Gwyn Fawyn; Japanese グウィン・フェイン and Chinese 格文·法温 corroborate. Standardize this complete name only and preserve it as distinct from Gwyn Anwy.'],
      ['53668', 'person:edar-gwyn', '에다르 귄(Edar Gwyn)', '에다르 그윈(Edar Gwyn)',
       'English identifies the Alfar actor and bard Edar Gwyn; Japanese エダル・グウィン and Chinese 厄达尔·格文 corroborate. Standardize the surname to the established Korean form 그윈; the existing person:edar disposition is not reopened.']
    ].map do |id, entity, old_span, new_span, evidence|
      source = inventory.fetch(['default', id, ''])
      english = source_texts(source, 'en').join("\n")
      canonical = entity == 'person:gwyn-fawyn' ? 'Gwyn Fawyn' : 'Edar Gwyn'
      raise "source name mismatch at default:#{id}" unless
        english.scan(/(?<![A-Za-z])#{Regexp.escape(canonical)}(?![A-Za-z])/i).length == 1
      old_text = source.fetch('work_text')
      raise "target span missing/ambiguous at default:#{id}" unless
        old_text.scan(old_span).length == 1
      new_text = old_text.sub(old_span, new_span)
      manifest_row(source, entity, 'accepted', old_text, new_text,
                   "D-21024: #{evidence}")
    end

    reviews = (anwy_reviews + other_reviews).sort_by do |row|
      [row.fetch('resource'), row.fetch('ID_Linha').to_i,
       row.fetch('Tipo_Variante')]
    end
    raise 'expected 30 distinct source row keys' unless
      reviews.length == 30 && reviews.map { |row| key(row) }.uniq.length == 30

    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected_new = [['default', '43000', ''], ['default', '53668', '']]
    raise "unexpected full-name source matches: #{generated.map { |row| key(row) }.inspect}" unless
      generated.map { |row| key(row) }.sort == expected_new.sort

    index_path = M::INDEX
    index = M.table(index_path)
    appended = []
    anwy_reviews.each do |review|
      row_key = key(review)
      raise "Gwyn Anwy key already indexed: #{row_key.inspect}" if index.any? do |row|
        row['entity_key'] == ANWY_ENTITY && M.key(row) == row_key[1..]
      end
      source = inventory.fetch(row_key)
      appended << {
        'entity_key' => ANWY_ENTITY,
        'resource' => 'default',
        'ID_Linha' => review.fetch('ID_Linha'),
        'Tipo_Variante' => '',
        'matched_english' => 'Gwyn [row-scoped short form; referent is Gwyn Anwy]',
        'english_source' => review.fetch('english').gsub("\n", "\n---\n"),
        'korean_current' => source.fetch('work_text'),
        'status' => 'needs-context',
        'evidence' => 'New exact-key candidate; row-scoped identity review is recorded in D-21024.'
      }
    end
    generated.each do |row|
      raise "full-name key already indexed: #{key(row).inspect}" if index.any? do |old|
        old['entity_key'] == row.fetch('entity_key') && M.key(old) == M.key(row)
      end
      appended << row
    end
    raise 'duplicate discovery index append' unless
      appended.map { |row| [row.fetch('entity_key'), *M.key(row)] }.uniq.length == appended.length

    M.write_table(MANIFEST, HEADERS, reviews)
    M.write_table(DEFINITIONS_PATH, glossary.headers, definitions)
    checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, BACKUP, M.hashes)
    verification = M.command!(
      'ruby', File.join(AUDIT, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', BACKUP
    )

    gwyn_entry = glossary.find { |row| row['entity_key'] == ANWY_ENTITY }
    raise 'Gwyn Anwy glossary entry missing' unless gwyn_entry
    gwyn_ids = ANWY_IDS.map { |id| "default:#{id}" }
    gwyn_entry['evidence_ids'] = (
      gwyn_entry['evidence_ids'].to_s.split('|') + ["D-#{D}"] + gwyn_ids
    ).uniq.join('|')
    gwyn_entry['notes'] = "#{gwyn_entry['notes']} D-#{D} reviewed 28 standalone Gwyn mentions in the Warsworn Vault storyline as row-scoped references to Gwyn Anwy. No global Gwyn alias was added because Gwyn Fawyn and Edar Gwyn are distinct people."
    M.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + definitions)
    M.write_table(index_path, index.headers, index.map(&:to_h) + appended)

    scout_row = {
      'english_candidate' => 'Gwyn',
      'source_rows' => '82',
      'already_terminal_full_name_rows' => '52',
      'row_scoped_gwyn_anwy' => '28',
      'separate_person_homonyms' => 'Gwyn Fawyn (default:43000); Edar Gwyn (default:53668)',
      'disposition' => 'reviewed; no global Gwyn alias',
      'evidence' => 'The 52 full-name Gwyn Anwy rows were already terminal; 28 standalone narrative references were tied to Anwy by the Warsworn Vault/Oathblade context and cross-checked against Japanese/Chinese. The two homonyms were registered as distinct complete people.'
    }
    M.write_table(SCOUT_REVIEW_PATH, SCOUT_HEADERS, [scout_row])
    M.checkpoint(D, reviews, checks, verification, M.refresh_inventory,
                 review_states: %w[needs-context])

    detail = <<~TEXT

      ## Discovery Finding

      The English-anchored scout reported 82 source rows containing the token
      `Gwyn`. Fifty-two full-name `Gwyn Anwy` rows were already terminal and
      were not counted again. This batch reviewed 28 previously unindexed
      standalone references in the Warsworn Vault storyline as row-scoped
      references to Gwyn Anwy, and registered the separate people Gwyn Fawyn
      and Edar Gwyn from their complete source names. No global `Gwyn` alias
      was added. The exact candidate triage is recorded in
      `proper-name-discovery-scout-D21024.tsv`.

      #{verification.strip}
    TEXT
    [File.join(AUDIT, "named-scope-review-D#{D}-20261015.md"),
     File.join(AUDIT, "named-scope-edit-addendum-D#{D}-20261015.md")].each do |path|
      File.open(path, 'a') { |file| file.write(detail) }
    end

    historical = <<~TEXT

      ## D-21024: Gwyn Names and Row-Scoped References

      Reviewed 30 distinct rows: 28 standalone `Gwyn` references were
      identified as Gwyn Anwy only in their exact Warsworn Vault narrative
      contexts; 52 full-name references were already terminal and were not
      recounted. Registered the distinct people Gwyn Fawyn and Edar Gwyn.
      Added missing/incorrect Korean-English labels without a global `Gwyn`
      alias. See [review](named-scope-review-D21024-20261015.md),
      [addendum](named-scope-edit-addendum-D21024-20261015.md),
      [manifest](proper-name-edits-D21024.tsv), and
      [candidate triage](proper-name-discovery-scout-D21024.tsv).
    TEXT
    [File.join(AUDIT, 'README.md'),
     File.join(AUDIT, 'decision-register-20261009.md')].each do |path|
      text = File.read(path)
      anchor = "<!-- current-proper-name-batch:end -->\n"
      raise "checkpoint anchor missing in #{path}" unless text.include?(anchor)
      text.sub!(anchor, "#{anchor}#{historical}")
      File.write(path, text)
    end

    puts "D-#{D}: #{reviews.length} row keys; #{reviews.count { |row| row['status'] == 'accepted' }} edits; #{reviews.count { |row| row['status'] == 'not-an-issue' }} retained."
    puts verification.strip
    puts "Backup: #{checks.map { |check| check.fetch(:backup) }.join(', ')}"
  end
end

GwynDiscoveryD21024.run if $PROGRAM_NAME == __FILE__
