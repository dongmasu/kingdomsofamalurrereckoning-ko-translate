#!/usr/bin/env ruby

require 'digest'
require 'fileutils'
require 'json'
require 'set'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelTwoFacedTrollD21823
  extend self

  M = ReviewedNameBatches
  D = 21_823
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21822.tsv')
  DISPOSITIONS = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  LABEL = 'The Two-Faced Troll'
  TARGETS = {
    ['default', '18848', ''] => [
      '두 얼굴의 트롤(Troll)', '두 얼굴의 트롤(The Two-Faced Troll)'
    ],
    ['base', '1221', '11'] => [
      '두 얼굴의 트롤 (The Two-Faced Troll)', '두 얼굴의 트롤(The Two-Faced Troll)'
    ]
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English gives the exact label `The Two-Faced Troll`; Japanese
    `双頭のトロール` and Chinese `双头巨魔` corroborate the Troll referent
    but describe a two-headed form rather than English “two-faced.” Preserve
    the established Korean `두 얼굴의 트롤` unchanged. At default:18848,
    replace only the incomplete `(Troll)` annotation with the complete source
    label; at base:1221:11, remove only the space before the existing English
    parenthesis so the two exact labels share one display format. D-5952 at
    default:18848 remains uncertain about the intended image/face-versus-head
    distinction; this label-only edit does not resolve or recount it.
  TEXT

  def key(row)
    M.key(row)
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    prior_block = docs.fetch(M::DOCS.first)[marker]
    raise 'D-21822 checkpoint is not current' unless
      prior_block&.include?('Latest verified proper-name batch: D-21822 ')
    raise 'checkpoint documents differ' unless docs.values.all? { |text| text[marker] == prior_block }

    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [DISPOSITIONS, MANIFEST, SNAPSHOT, report, addendum].each do |path|
      raise "D-#{D} output already exists: #{path}" if File.exist?(path)
    end

    before_hashes = M.hashes
    inventory = M.refresh_inventory
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    index = M.table(M::INDEX)
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_hash = Digest::SHA256.file(glossary_path).hexdigest
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    candidate = candidates.fetch(LABEL)
    unpaired = JSON.parse(candidate.fetch('unpaired_label_keys_json'))
                 .map { |parts| parts.map(&:to_s) }
    paired = JSON.parse(candidate.fetch('paired_evidence_keys_json'))
               .map { |parts| parts.map(&:to_s) }
    raise "unexpected unpaired key: #{unpaired.inspect}" unless
      unpaired == [['default', '18848', '']]
    raise "unexpected paired key: #{paired.inspect}" unless
      paired == [['base', '1221', '11']]

    index_by_key = index.group_by { |row| key(row.to_h) }
    reviews = TARGETS.map do |source_key, (old, revised)|
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.uniq
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.uniq
      current = source.fetch('work_text')
      raise "stale Korean at #{source_key.inspect}" unless current == old
      raise "unexpected English at #{source_key.inspect}" unless english == [LABEL]
      raise "unexpected Japanese at #{source_key.inspect}" unless japanese == ['双頭のトロール']
      raise "unexpected Chinese at #{source_key.inspect}" unless source.fetch('zh_text') == '双头巨魔'
      prior = index_by_key.fetch(source_key, [])
      expected_status = source_key[0] == 'base' ? 'not-an-issue' : 'accepted'
      raise "prior Troll disposition differs at #{source_key.inspect}" unless
        prior.length == 1 && prior.first.fetch('entity_key') == 'monster:troll' &&
        prior.first.fetch('status') == expected_status
      {
        'english_candidate' => LABEL,
        'disposition' => 'accepted',
        'resource' => source_key[0],
        'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2],
        'english' => english.join("\n"),
        'japanese' => japanese.join("\n"),
        'chinese' => source.fetch('zh_text'),
        'korean' => current,
        'evidence' => "#{EVIDENCE} Exact source key: #{source_key.join(':')}.",
        'prior_index_dispositions_json' => JSON.generate(
          prior.map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        ),
        'old' => old,
        'new' => revised,
        'entity_key' => "candidate:#{LABEL}",
        'status' => 'accepted',
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
    raise 'expected two cells in default and base' unless
      checks.to_h { |check| [check.fetch(:resource), check.fetch(:cells)] } == {
        'base' => 1, 'default' => 1
      }
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', backup_dir
    )

    inventory = M.refresh_inventory
    TARGETS.each do |source_key, (_old, revised)|
      raise "post-edit mismatch at #{source_key.inspect}" unless
        inventory.fetch(source_key).fetch('work_text') == revised
    end
    raise 'glossary changed unexpectedly' unless
      Digest::SHA256.file(glossary_path).hexdigest == glossary_hash

    index_backup = File.join(backup_dir, 'proper-name-occurrences.tsv')
    FileUtils.mkdir_p(backup_dir)
    old_index_bytes = File.binread(M::INDEX)
    raise 'occurrence index changed before refresh' unless
      Digest::SHA256.hexdigest(old_index_bytes) == index_hash
    if File.exist?(index_backup)
      raise 'existing occurrence-index backup differs' unless File.binread(index_backup) == old_index_bytes
    else
      File.binwrite(index_backup, old_index_bytes)
    end
    raise 'occurrence-index backup is not byte-identical' unless
      File.binread(index_backup) == old_index_bytes
    before_index = M.table(M::INDEX).map(&:to_h)
    target_keys = TARGETS.keys.to_set
    refreshed = before_index.map do |row|
      row['korean_current'] = inventory.fetch(key(row)).fetch('work_text') if
        target_keys.include?(key(row))
      row
    end
    raise 'expected two cached occurrence rows' unless
      before_index.count { |row| target_keys.include?(key(row)) } == 2
    before_counts = before_index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    M.write_table(M::INDEX, M.table(M::INDEX).headers, refreshed)
    current_index = M.table(M::INDEX).map(&:to_h)
    raise 'index rows/order changed' unless
      current_index.length == before_index.length &&
      current_index.map { |row| [row['entity_key'], *key(row)] } ==
        before_index.map { |row| [row['entity_key'], *key(row)] }
    before_index.zip(current_index).each do |before, after|
      expected = before.dup
      expected['korean_current'] = after['korean_current'] if target_keys.include?(key(before))
      raise "unexpected index field change at #{key(before).inspect}" unless after == expected
    end
    after_counts = current_index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    raise 'index status totals changed' unless before_counts == after_counts
    index_hash_after = Digest::SHA256.file(M::INDEX).hexdigest

    reviewed = ShortLabelDiscovery20261018.reviewed_dispositions
    reviewed.merge(reviews.map do |row|
      [row.fetch('english_candidate'), row.fetch('resource'),
       row.fetch('ID_Linha'), row.fetch('Tipo_Variante').to_s]
    end)
    snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, M.table(glossary_path).map(&:to_h), current_index,
      reviewed_dispositions: reviewed
    )
    raise 'reviewed candidate remains in snapshot' if
      snapshot.any? { |row| row.fetch('english_candidate') == LABEL }
    raise 'unexpected next candidate count' unless snapshot.length == 12
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'residual audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')
    raise 'index changed during validation' unless
      Digest::SHA256.file(M::INDEX).hexdigest == index_hash_after

    variants = M.table(File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'))
    variant_counts = variants.group_by { |row| row.fetch('status') }.transform_values(&:length)
    status_counts = current_index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    held = current_index.select { |row| row.fetch('status') == 'uncertain' }
    hashes = M.hashes
    index_hash_before = Digest::SHA256.hexdigest(old_index_bytes)
    counts_text = status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    backup_lines = checks.map do |check|
      "- #{check.fetch(:resource)}: #{check.fetch(:cells)} cell; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    end.join("\n")
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed both bounded `The Two-Faced Troll` labels. At default:18848, added the full source label to the existing Korean translation; at base:1221:11, removed only the space before the already complete English parenthesis.
      English `The Two-Faced Troll` anchors the source wording. Japanese `双頭のトロール` and Chinese `双头巨魔` describe a two-headed Troll; the distinction from English “two-faced” remains unresolved under D-5952 at default:18848. No translation wording or prior entity disposition was changed or recounted.
      Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first.fetch('english_candidate')}`; not exhaustive or a completion estimate).
      Indexed matches: #{current_index.length}; #{counts_text} (statuses unchanged).
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
      Last batch pre-edit backups and byte validation:
      #{backup_lines}
      #{verification.strip}
      Occurrence index: #{current_index.length} rows; pre-refresh SHA-256 `#{index_hash_before}`; post-refresh SHA-256 `#{index_hash_after}`; backup `#{index_backup}`. Exactly two existing `korean_current` cells changed; status, evidence, key order, row count, and status totals are unchanged.
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Proper-name glossary: #{M.table(glossary_path).length} entries; SHA-256 `#{glossary_hash}` (unchanged).
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}.
      Data validation: #{validation.strip}
      Report: `work/zh_cn/audit/#{File.basename(report)}`.
      Addendum: `work/zh_cn/audit/#{File.basename(addendum)}`.
    TEXT

    details = reviews.map do |row|
      "- `#{key(row).join(':')}`: EN `#{row.fetch('english')}`; JA `#{row.fetch('japanese')}`; ZH `#{row.fetch('chinese')}`; KO `#{row.fetch('old')}` -> `#{row.fetch('new')}`."
    end.join("\n")
    replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "checkpoint changed during D-#{D}: #{path}" unless text[marker] == prior_block
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << "\n## D-#{D}: The Two-Faced Troll Label Pairing\n\nAdded the complete English label at default:18848 and removed only the stray pre-parenthesis space at base:1221:11. The Korean phrase `두 얼굴의 트롤` is unchanged. D-5952's uncertain face-versus-head/image finding remains open and unmodified.\n"
      elsif path.end_with?('README.md')
        text << "\n## D-#{D}: The Two-Faced Troll Label Pairing\n\nStandardized both exact label displays to `두 얼굴의 트롤(The Two-Faced Troll)` without changing the Korean wording. D-5952's semantic/image uncertainty remains open.\n"
      end
      File.write(path, text)
    end
    File.write(report, <<~TEXT)
      # D-#{D}: The Two-Faced Troll Short-Label Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Aligned Source Evidence

      English gives the exact label `The Two-Faced Troll`. Japanese
      `双頭のトロール` and Chinese `双头巨魔` support the Troll referent but
      read the descriptor as “two-headed.” The existing Korean
      `두 얼굴의 트롤` follows English and remains unchanged. Only the
      incomplete `(Troll)` annotation at default:18848 and the spacing in
      base:1221:11 are corrected.

      #{details}

      ## Historical Scope

      D-5952 at default:18848 remains `uncertain`: the intended image and
      face-versus-head distinction are not resolved by this label pairing.
      Existing `monster:troll` index statuses/evidence remain unchanged.
      Official Korean manual extraction/reference has no direct Two-Faced
      Troll entry.
    TEXT
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      default:18848 changed from `두 얼굴의 트롤(Troll)` to
      `두 얼굴의 트롤(The Two-Faced Troll)`. base:1221:11 changed only from
      `두 얼굴의 트롤 (The Two-Faced Troll)` to the no-space display
      `두 얼굴의 트롤(The Two-Faced Troll)`.

      The byte-preserving editor and independent verifier checked the
      byte-identical pre-edit backups, BOM, mixed line endings, row order/count,
      target cells, unchanged non-target bytes, and inverse reconstruction.
      The two `korean_current` cache fields for `monster:troll` were refreshed
      from those active cells; all other index fields, dispositions, row order,
      row count, and totals are unchanged. Index backup: `#{index_backup}`.

      #{summary}

      D-5952 remains uncertain. No interpretation of the image or the
      face-versus-head distinction is added by this edit.
    TEXT
    puts "D-#{D}: both source labels standardized; D-5952 uncertainty preserved; byte, index, data, and residual validation PASS."
  end
end

ReviewShortLabelTwoFacedTrollD21823.run if $PROGRAM_NAME == __FILE__
