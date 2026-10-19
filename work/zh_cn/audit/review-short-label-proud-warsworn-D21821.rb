#!/usr/bin/env ruby

require 'digest'
require 'fileutils'
require 'json'
require 'set'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelProudWarswornD21821
  extend self

  M = ReviewedNameBatches
  D = 21_821
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21820.tsv')
  DISPOSITIONS = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  EXPECTED = {
    ['default', '4852', ''] => [
      '긍지 높은 워스원(Warsworn)',
      '긍지 높은 워스원(The Proud Warsworn)',
      'accepted'
    ],
    ['base', '1769', '11'] => [
      '긍지 높은 워스원(The Proud Warsworn)',
      '긍지 높은 워스원(The Proud Warsworn)',
      'not-an-issue'
    ]
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English gives the exact standalone label `The Proud Warsworn`. The
    aligned Japanese `誇り高きウォースウォーン` and Chinese `骄傲的誓战者`
    support the “proud Warsworn” reading. Reuse the complete bilingual form
    already present at base:1769:11 and replace only the incomplete
    faction-component annotation at default:4852. D-20771's separate
    `faction:warsworn` not-an-issue decision remains unchanged; this label
    pairing does not establish a new faction or entity.
  TEXT

  def key(row)
    M.key(row)
  end

  def sync_occurrence_snapshot!(backup_dir)
    path = M::INDEX
    backup = File.join(backup_dir, 'proper-name-occurrences.tsv')
    FileUtils.mkdir_p(backup_dir)
    if File.exist?(backup)
      raise 'occurrence-index backup is stale' unless File.binread(backup) == File.binread(path)
    else
      FileUtils.copy_file(path, backup)
    end

    old_field = '"긍지 높은 워스원(Warsworn)"'.b
    new_field = '"긍지 높은 워스원(The Proud Warsworn)"'.b
    prefix = "\"faction:warsworn\"\t\"default\"\t\"4852\"\t\"\"\t" \
      "\"Warsworn\"\t\"The Proud Warsworn\"\t".b
    bytes = File.binread(path)
    offset = bytes.index(prefix)
    raise 'target occurrence row is not unique' unless offset &&
      bytes.index(prefix, offset + 1).nil?
    cell_offset = offset + prefix.bytesize
    raise 'stale occurrence Korean snapshot' unless
      bytes.byteslice(cell_offset, old_field.bytesize) == old_field
    raise 'occurrence status/evidence fields differ' unless
      bytes.byteslice(cell_offset + old_field.bytesize, 21).start_with?("\t\"not-an-issue\"\t")
    updated = bytes.dup
    updated[cell_offset, old_field.bytesize] = new_field
    File.binwrite(path, updated)
    raise 'occurrence snapshot write failed' unless File.binread(path) == updated

    before = M.table(backup).map(&:to_h)
    after = M.table(path).map(&:to_h)
    raise 'occurrence row count changed' unless before.length == after.length
    changed = []
    before.each_with_index do |row, ordinal|
      current = after.fetch(ordinal)
      next if row == current
      expected = row.dup
      expected['korean_current'] = '긍지 높은 워스원(The Proud Warsworn)'
      raise "unexpected occurrence-index change at row #{ordinal}" unless
        row.fetch('entity_key') == 'faction:warsworn' &&
        M.key(row) == ['default', '4852', ''] &&
        expected == current
      changed << row
    end
    raise "unexpected occurrence rows changed: #{changed.length}" unless changed.length == 1
    {
      backup: backup,
      before_sha256: Digest::SHA256.file(backup).hexdigest,
      after_sha256: Digest::SHA256.file(path).hexdigest,
      rows: after.length,
      changed_rows: changed.length
    }
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    prior_block = docs.fetch(M::DOCS.first)[marker]
    raise 'D-21820 checkpoint is not current' unless
      prior_block&.include?('Latest verified proper-name batch: D-21820 ')
    raise 'checkpoint documents differ' unless docs.values.all? { |text| text[marker] == prior_block }

    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [DISPOSITIONS, MANIFEST, SNAPSHOT, report, addendum].each do |path|
      raise "D-#{D} output already exists: #{path}" if File.exist?(path)
    end

    before_hashes = M.hashes
    inventory = M.refresh_inventory
    index_hash_before = Digest::SHA256.file(M::INDEX).hexdigest
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_hash = Digest::SHA256.file(glossary_path).hexdigest
    index = M.table(M::INDEX).map(&:to_h)
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    candidate = candidates.fetch('The Proud Warsworn')
    candidate_keys = %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
    raise "unexpected candidate keys: #{candidate_keys.inspect}" unless
      candidate_keys.to_set == EXPECTED.keys.to_set
    raise 'unexpected unpaired label' unless
      JSON.parse(candidate.fetch('unpaired_label_keys_json')).map { |parts| parts.map(&:to_s) } ==
        [['default', '4852', '']]
    raise 'unexpected paired evidence' unless
      JSON.parse(candidate.fetch('paired_evidence_keys_json')).map { |parts| parts.map(&:to_s) } ==
        [['base', '1769', '11']]

    prior_by_key = index.group_by { |row| key(row) }
    reviews = EXPECTED.map do |source_key, (old, revised, disposition)|
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      chinese = source.fetch('zh_text')
      current = source.fetch('work_text')
      raise "stale Korean text at #{source_key.inspect}" unless current == old
      raise "unexpected English label at #{source_key.inspect}" unless english == 'The Proud Warsworn'
      raise "unexpected aligned locale at #{source_key.inspect}" unless
        japanese == '誇り高きウォースウォーン' && chinese == '骄傲的誓战者'
      prior = prior_by_key.fetch(source_key, [])
      if source_key == ['default', '4852', '']
        raise 'D-20771 faction disposition is missing or changed' unless
          prior.any? { |row| row.fetch('entity_key') == 'faction:warsworn' &&
            row.fetch('status') == 'not-an-issue' }
      end
      {
        'english_candidate' => 'The Proud Warsworn',
        'disposition' => disposition,
        'resource' => source_key[0],
        'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2],
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'korean' => old,
        'evidence' => "#{EVIDENCE} Exact source key: #{source_key.join(':')}.",
        'prior_index_dispositions_json' => JSON.generate(
          prior.map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        ),
        'old' => old,
        'new' => revised,
        'entity_key' => 'candidate:The Proud Warsworn',
        'status' => disposition,
        'entity_dispositions_json' => '{}',
        'previous_status' => JSON.generate(
          prior.to_h { |row| [row.fetch('entity_key'), row.fetch('status')] }
        ),
        'previous_evidence' => JSON.generate(
          prior.to_h { |row| [row.fetch('entity_key'), row.fetch('evidence')] }
        )
      }
    end

    M.write_table(DISPOSITIONS, HEADERS,
                  reviews.map { |row| HEADERS.to_h { |field| [field, row[field]] } })
    M.write_table(MANIFEST, M::HEADERS,
                  reviews.map { |row| M::HEADERS.to_h { |field| [field, row.fetch(field, '')] } })
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, backup_dir, before_hashes)
    raise 'unexpected edit set' unless checks.map { |check| check.fetch(:resource) } == ['default']
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', backup_dir
    )

    inventory = M.refresh_inventory
    raise 'target label did not update' unless
      inventory.fetch(['default', '4852', '']).fetch('work_text') ==
        '긍지 높은 워스원(The Proud Warsworn)'
    index_check = sync_occurrence_snapshot!(backup_dir)
    raise 'occurrence index row count changed' unless index_check.fetch(:rows) == index.length
    index = M.table(M::INDEX).map(&:to_h)
    raise 'glossary changed unexpectedly' unless Digest::SHA256.file(glossary_path).hexdigest == glossary_hash

    reviewed = ShortLabelDiscovery20261018.reviewed_dispositions
    reviewed.merge(reviews.map do |row|
      [row.fetch('english_candidate'), row.fetch('resource'),
       row.fetch('ID_Linha'), row.fetch('Tipo_Variante').to_s]
    end)
    snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, M.table(glossary_path).map(&:to_h), index,
      reviewed_dispositions: reviewed
    )
    raise 'reviewed Proud Warsworn candidate was not removed' if
      snapshot.any? { |row| row.fetch('english_candidate') == 'The Proud Warsworn' }
    raise 'unexpected next candidate' unless
      snapshot.first&.fetch('english_candidate') == 'The Travelers'
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'residual audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')

    status_counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    held = index.select { |row| row.fetch('status') == 'uncertain' }
    variants = M.table(File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'))
    variant_counts = variants.group_by { |row| row.fetch('status') }.transform_values(&:length)
    hashes = M.hashes
    integrity = checks.map do |check|
      "- #{check.fetch(:resource)}: #{check.fetch(:cells)} cells; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    end.join("\n")
    counts_text = status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed both bounded `The Proud Warsworn` memberships: replaced the incomplete `Warsworn` component annotation at default:4852 with the complete label `The Proud Warsworn`; retained the already paired base:1769:11 display.
      English, Japanese, and Chinese support the “proud Warsworn” reading. D-20771's existing `faction:warsworn` not-an-issue status at default:4852 remains unchanged; no new entity, glossary entry, indexed status/count, or cumulative total was added.
      Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first.fetch('english_candidate')}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{counts_text} (unchanged).
      Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |row| key(row) }.uniq.length} distinct CSV row keys.
      These focused index counts are not global translation totals. Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: #{variants.length} terms; registered-reviewed=#{variant_counts.fetch('registered-reviewed', 0)}, heuristic-not-reviewed=#{variant_counts.fetch('heuristic-not-reviewed', 0)}. This list is not exhaustive and establishes no overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Edit manifest: `work/zh_cn/audit/proper-name-edits-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      Last batch pre-edit backup and byte validation:
      #{integrity}
      #{verification.strip}
      Occurrence index: #{index.length} rows; pre-refresh SHA-256 `#{index_check.fetch(:before_sha256)}`; post-refresh SHA-256 `#{index_check.fetch(:after_sha256)}`; backup `#{index_check.fetch(:backup)}`. Only `korean_current` at faction:warsworn/default:4852 was refreshed; all statuses, evidence, row order/count, and cumulative counts are unchanged.
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Proper-name glossary: #{M.table(glossary_path).length} entries; SHA-256 `#{glossary_hash}` (unchanged).
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}.
      Data validation: #{validation.strip}
      Report: `work/zh_cn/audit/#{File.basename(report)}`.
      Addendum: `work/zh_cn/audit/#{File.basename(addendum)}`.
    TEXT

    details = reviews.map do |row|
      "- `#{key(row).join(':')}` (#{row.fetch('disposition')}): EN `#{row.fetch('english')}`; JA `#{row.fetch('japanese')}`; ZH `#{row.fetch('chinese')}`; KO `#{row.fetch('old')}`#{row.fetch('old') == row.fetch('new') ? '' : " -> `#{row.fetch('new')}`"}."
    end.join("\n")
    replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "checkpoint changed during D-#{D}: #{path}" unless text[marker] == prior_block
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << "\n## D-#{D}: The Proud Warsworn Label Pairing\n\nUpdated default:4852 from the incomplete `긍지 높은 워스원(Warsworn)` to the complete label `긍지 높은 워스원(The Proud Warsworn)`, matching base:1769:11. The existing D-20771 faction disposition remains unchanged; no new entity or cumulative count was created.\n"
      elsif path.end_with?('README.md')
        text << "\n## D-#{D}: The Proud Warsworn Label Pairing\n\nReplaced the incomplete faction-component annotation with the complete source label at default:4852, matching base:1769:11. D-20771 remains intact and the faction glossary/index was not changed.\n"
      end
      File.write(path, text)
    end
    File.write(report, <<~TEXT)
      # D-#{D}: The Proud Warsworn Short-Label Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Aligned Source Evidence

      English gives the exact label `The Proud Warsworn`; Japanese
      `誇り高きウォースウォーン` and Chinese `骄傲的誓战者` corroborate the
      “proud Warsworn” reading. The base label already carries the complete
      bilingual phrase. At default:4852, preserve the Korean wording and
      replace only `(Warsworn)` with `(The Proud Warsworn)`.

      #{details}

      ## Historical Scope

      The existing `faction:warsworn` row status and D-20771 evidence at
      default:4852 remain unchanged. This batch records the full label pairing
      only; it does not add a faction alias or reopen a prior translation
      judgment.
    TEXT
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      Only default:4852 changed: `긍지 높은 워스원(Warsworn)` ->
      `긍지 높은 워스원(The Proud Warsworn)`. The already paired
      base:1769:11 label was retained. No glossary or occurrence disposition
      changed. The `korean_current` cache in `proper-name-occurrences.tsv` was
      refreshed for `faction:warsworn` / `default:4852` only; all other fields
      and bytes are preserved. Its byte-identical pre-refresh backup is
      `#{index_check.fetch(:backup)}` (pre `#{index_check.fetch(:before_sha256)}`,
      post `#{index_check.fetch(:after_sha256)}`).

      #{summary}

      The byte-preserving editor and independent verifier checked the
      byte-identical pre-edit backup, BOM, mixed line endings, row order/count,
      target cell, unchanged non-target bytes, and inverse reconstruction.
      The occurrence index's `korean_current` snapshot for faction:warsworn /
      default:4852 was also refreshed from the exact CSV cell. Its pre-edit
      byte-identical backup and one-field-only change were verified; status,
      evidence, row order, row count, and cumulative status counts are unchanged.
    TEXT
    puts "D-#{D}: two memberships reviewed; complete source label paired; validation and residual audit PASS."
  end
end

ReviewShortLabelProudWarswornD21821.run if $PROGRAM_NAME == __FILE__
