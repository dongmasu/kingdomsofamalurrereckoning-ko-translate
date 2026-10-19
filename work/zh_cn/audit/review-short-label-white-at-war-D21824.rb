#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'set'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelWhiteAtWarD21824
  extend self

  M = ReviewedNameBatches
  D = 21_824
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21823.tsv')
  DISPOSITIONS = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  LABEL = 'The White At War'
  TARGETS = {
    ['default', '13500', ''] => [
      '전쟁터의 백색', '전쟁터의 백색(The White At War)', '战争中的白色'
    ],
    ['base', '1712', '11'] => [
      '전쟁 중의 백색 (The White At War)', '전쟁 중의 백색(The White At War)', '参战的老兵'
    ]
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English gives the exact label `The White At War`. Japanese `戦場の白`
    reads as “white on the battlefield”; Chinese differs by row, with
    `战争中的白色` at default:13500 and `参战的老兵` at base:1712:11.
    Preserve each existing Korean rendering: add the missing exact English
    parenthetical at default:13500 and remove only the extra space before the
    already complete parenthetical at base:1712:11. This bilingual-label
    normalization does not decide whether “White” refers to a person/group
    or visual image. D-4003 at default:13500 remains uncertain and is not
    resolved or recounted.
  TEXT

  def key(row)
    M.key(row)
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    prior_block = docs.fetch(M::DOCS.first)[marker]
    raise 'D-21823 checkpoint is not current' unless
      prior_block&.include?('Latest verified proper-name batch: D-21823 ')
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
      unpaired == [['default', '13500', '']]
    raise "unexpected paired key: #{paired.inspect}" unless
      paired == [['base', '1712', '11']]

    reviews = TARGETS.map do |source_key, (old, revised, expected_chinese)|
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.uniq
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.uniq
      current = source.fetch('work_text')
      raise "stale Korean at #{source_key.inspect}" unless current == old
      raise "unexpected English at #{source_key.inspect}" unless english == [LABEL]
      raise "unexpected Japanese at #{source_key.inspect}" unless japanese == ['戦場の白']
      raise "unexpected Chinese at #{source_key.inspect}" unless source.fetch('zh_text') == expected_chinese
      prior = index.select { |row| key(row.to_h) == source_key }
      raise "unexpected prior indexed owner at #{source_key.inspect}" unless prior.empty?
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
        'prior_index_dispositions_json' => '[]',
        'old' => old,
        'new' => revised,
        'entity_key' => "candidate:#{LABEL}",
        'status' => 'accepted',
        'entity_dispositions_json' => '{}',
        'previous_status' => '{}',
        'previous_evidence' => '{}'
      }
    end

    M.write_table(DISPOSITIONS, HEADERS,
                  reviews.map { |row| HEADERS.to_h { |field| [field, row[field]] } })
    M.write_table(MANIFEST, M::HEADERS,
                  reviews.map { |row| M::HEADERS.to_h { |field| [field, row.fetch(field, '')] } })
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, backup_dir, before_hashes)
    raise 'expected one edit in each resource' unless
      checks.to_h { |check| [check.fetch(:resource), check.fetch(:cells)] } == {
        'base' => 1, 'default' => 1
      }
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', backup_dir
    )
    inventory = M.refresh_inventory
    TARGETS.each do |source_key, (_old, revised, _chinese)|
      raise "post-edit mismatch at #{source_key.inspect}" unless
        inventory.fetch(source_key).fetch('work_text') == revised
    end
    raise 'occurrence index changed unexpectedly' unless
      Digest::SHA256.file(M::INDEX).hexdigest == index_hash
    raise 'glossary changed unexpectedly' unless
      Digest::SHA256.file(glossary_path).hexdigest == glossary_hash

    reviewed = ShortLabelDiscovery20261018.reviewed_dispositions
    reviewed.merge(reviews.map do |row|
      [row.fetch('english_candidate'), row.fetch('resource'),
       row.fetch('ID_Linha'), row.fetch('Tipo_Variante').to_s]
    end)
    snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, M.table(glossary_path).map(&:to_h), index,
      reviewed_dispositions: reviewed
    )
    raise 'reviewed candidate remains in snapshot' if
      snapshot.any? { |row| row.fetch('english_candidate') == LABEL }
    raise 'unexpected next candidate count' unless snapshot.length == 11
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'residual audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')
    raise 'index changed during validation' unless
      Digest::SHA256.file(M::INDEX).hexdigest == index_hash

    variants = M.table(File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'))
    variant_counts = variants.group_by { |row| row.fetch('status') }.transform_values(&:length)
    status_counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    held = index.select { |row| row.fetch('status') == 'uncertain' }
    hashes = M.hashes
    counts_text = status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    backup_lines = checks.map do |check|
      "- #{check.fetch(:resource)}: #{check.fetch(:cells)} cell; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    end.join("\n")
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed both bounded `The White At War` labels. Added the exact English parenthetical at default:13500 and removed only the extra parenthesis spacing at base:1712:11; both Korean translations were retained unchanged.
      English `The White At War` anchors the label. Japanese `戦場の白` reads “white on the battlefield”; Chinese differs by row (`战争中的白色` at default:13500, `参战的老兵` at base:1712:11). These readings do not settle the fragment's referent. D-4003 at default:13500 remains uncertain whether “White” names a person/group or a visual image; no entity or index disposition was added.
      Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first.fetch('english_candidate')}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{counts_text} (unchanged).
      Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |row| key(row.to_h) }.uniq.length} distinct CSV row keys.
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
      No occurrence-index or glossary changes; no new index backup required.
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
        text << "\n## D-#{D}: The White At War Label Pairing\n\nAdded the exact English label at default:13500 and normalized only the space before the already complete parenthetical at base:1712:11. Both Korean renderings remain unchanged. D-4003's referent uncertainty remains open; no proper-name entity or index entry was added.\n"
      elsif path.end_with?('README.md')
        text << "\n## D-#{D}: The White At War Label Pairing\n\nAdded the missing English pairing and normalized parenthesis spacing while preserving both Korean renderings. D-4003's uncertainty about “White” remains open; no entity was classified.\n"
      end
      File.write(path, text)
    end
    File.write(report, <<~TEXT)
      # D-#{D}: The White At War Short-Label Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Aligned Source Evidence

      English is the source-label anchor, `The White At War`. Japanese
      `戦場の白` reads “white on the battlefield.” Chinese renders
      `战争中的白色` at default:13500 but `参战的老兵` at base:1712:11.
      Preserve the uncertain referent. Keep the active Korean
      `전쟁터의 백색` and `전쟁 중의 백색`; add the English parenthetical
      at default:13500 and remove only the stray space in the already paired
      base label.

      #{details}

      ## Historical Scope

      D-4003 at default:13500 remains uncertain about whether “White” refers
      to a person/group or a visual image. This label-pairing correction does
      not resolve or recount it. No occurrence-index or glossary row is added.
    TEXT
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      default:13500 changed from `전쟁터의 백색` to
      `전쟁터의 백색(The White At War)`. base:1712:11 changed only from
      `전쟁 중의 백색 (The White At War)` to
      `전쟁 중의 백색(The White At War)`. Korean lexical wording is unchanged.

      The byte-preserving editor and independent verifier checked the
      byte-identical pre-edit backups, BOM, mixed line endings, row order/count,
      target cells, unchanged non-target bytes, and inverse reconstruction.
      The occurrence index and glossary remain byte-identical to their
      pre-batch versions. D-4003 remains uncertain.

      #{summary}
    TEXT
    puts "D-#{D}: two labels reviewed; English pairing/spacing normalized; D-4003 uncertainty preserved; validation PASS."
  end
end

ReviewShortLabelWhiteAtWarD21824.run if $PROGRAM_NAME == __FILE__
