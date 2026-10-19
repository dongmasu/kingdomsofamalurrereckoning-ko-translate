#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21792
  extend self

  M = ReviewedNameBatches
  D = 21_792
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21791.tsv')
  CANDIDATES = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  CHANGES = {
    ['default', '58585', ''] => {
      candidate: 'Savant',
      entity: 'title:savant-rank',
      english: 'Savant',
      japanese: '一級魔道師',
      chinese: '博学者',
      old: '사반트',
      new: '사반트(Savant)',
      prior: 'D-19509 closes the translation/rank finding as not-an-issue: the formal rank is already rendered 사반트. This follow-up addresses only the separate bilingual-label requirement; it does not reopen the rank or translation judgment.'
    },
    ['default', '47690', ''] => {
      candidate: 'Savant Aethan Engar',
      entity: 'person:aethan-engar',
      english: 'Savant Aethan Engar',
      japanese: '一級魔道師イーサン・エンガー',
      chinese: '博学者艾森·恩加尔',
      old: '사반트 에이선 엥가르(Aethan Engar)',
      new: '사반트 에이선 엥가르(Savant Aethan Engar)',
      prior: 'D-19512/D-20831 establish the rank and canonical person spelling. Preserve the terminal person:aethan-engar disposition; add only the omitted English rank to this complete displayed title/name label.'
    }
  }.freeze

  def candidate_keys(row)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(row.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
  end

  def build_reviews(inventory, index, candidates)
    by_key = index.group_by { |row| M.key(row) }
    reviews = CHANGES.map do |key, change|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      raise "English source mismatch at #{key.inspect}" unless english == change.fetch(:english)
      raise "Japanese source mismatch at #{key.inspect}" unless japanese == change.fetch(:japanese)
      raise "Chinese source mismatch at #{key.inspect}" unless source.fetch('zh_text') == change.fetch(:chinese)
      raise "Korean source mismatch at #{key.inspect}" unless source.fetch('work_text') == change.fetch(:old)

      candidate = candidates.fetch(change.fetch(:candidate))
      raise "candidate does not contain target #{key.inspect}" unless
        candidate_keys(candidate).include?(key)

      prior = by_key.fetch(key, [])
      if change.fetch(:entity) == 'person:aethan-engar'
        owner = prior.find { |row| row.fetch('entity_key') == change.fetch(:entity) }
        raise 'existing Aethan Engar disposition missing' unless owner
        raise 'existing Aethan Engar disposition is not accepted' unless owner.fetch('status') == 'accepted'
      else
        raise 'Savant standalone row unexpectedly indexed; review its history first' unless prior.empty?
      end

      {
        key: key, change: change, source: source, english: english,
        japanese: japanese, prior: prior
      }
    end
    raise 'duplicate reviewed source keys' unless reviews.map { |row| row.fetch(:key) }.uniq.length == reviews.length
    reviews
  end

  def checkpoint_text(reviews, candidate_manifest, snapshot, inventory, index, hashes, checks, verification, residual, validation, retained)
    changed = reviews.map do |review|
      key = review.fetch(:key)
      change = review.fetch(:change)
      "#{key.join(':')} `#{change.fetch(:old)}` -> `#{change.fetch(:new)}`"
    end.join('; ')
    counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    counts_text = counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    integrity = checks.map do |check|
      "- #{check.fetch(:resource)}: #{check.fetch(:cells)} cells; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    end.join("\n")
    <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed the `Savant` and `Savant Aethan Engar` short-label candidates at two distinct source keys. Added only the missing English rank/title labels: #{changed}.
      D-19509's standalone-rank translation closure and the existing D-19512/D-20831 Aethan identity disposition remain unchanged; no indexed status or cumulative match count was reopened or recounted.
      Next batch: D-#{D + 1}; continue the refreshed short-label candidate snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first&.fetch('english_candidate', 'none')}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{counts_text}.
      Remaining unreviewed indexed matches: 0; reviewed unresolved indexed holds: #{index.count { |row| row.fetch('status') == 'uncertain' }}. These focused index counts do not measure discovery remaining.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      Last batch pre-edit backup and byte validation:
      #{integrity}
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{M.table(File.join(__dir__, 'proper-name-glossary.tsv')).length} entries; SHA-256 `#{Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest}` (unchanged).
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}.
      Data validation: #{validation.strip}
      Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D#{D}.tsv`.
    TEXT
  end

  def run
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    prior_block = docs.values.first[marker]
    raise 'D-21791 checkpoint is not current' unless
      prior_block&.include?('Latest verified proper-name batch: D-21791 ')
    raise 'checkpoint documents differ' unless docs.values.all? { |text| text[marker] == prior_block }

    names = [
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      CANDIDATES, SNAPSHOT, MANIFEST
    ]
    raise "D-#{D} artifacts already exist" if names.any? { |path| File.exist?(path) }

    before_hashes = M.hashes
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    candidate_rows = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    reviews = build_reviews(inventory, index.map(&:to_h), candidate_rows)

    candidate_records = reviews.map do |review|
      key = review.fetch(:key)
      change = review.fetch(:change)
      source = review.fetch(:source)
      {
        'english_candidate' => change.fetch(:candidate),
        'disposition' => 'accepted',
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'english' => review.fetch(:english),
        'japanese' => review.fetch(:japanese),
        'chinese' => source.fetch('zh_text'),
        'korean' => source.fetch('work_text'),
        'evidence' => change.fetch(:prior),
        'prior_index_dispositions_json' => JSON.generate(
          review.fetch(:prior).map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        )
      }
    end
    M.write_table(CANDIDATES, HEADERS, candidate_records)

    edits = reviews.map do |review|
      key = review.fetch(:key)
      change = review.fetch(:change)
      previous_status = review.fetch(:prior).to_h do |row|
        [row.fetch('entity_key'), row.fetch('status')]
      end
      previous_evidence = review.fetch(:prior).to_h do |row|
        [row.fetch('entity_key'), row.fetch('evidence')]
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => change.fetch(:entity), 'status' => 'accepted',
        'old' => change.fetch(:old), 'new' => change.fetch(:new),
        'evidence' => "D-#{D}: #{change.fetch(:prior)}",
        'english' => review.fetch(:english), 'japanese' => review.fetch(:japanese),
        'chinese' => review.fetch(:source).fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(change.fetch(:entity) => 'accepted'),
        'previous_status' => JSON.generate(previous_status),
        'previous_evidence' => JSON.generate(previous_evidence)
      }
    end
    M.write_table(MANIFEST, M::HEADERS, edits)

    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, backup_dir, before_hashes)
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', backup_dir
    )

    inventory = M.refresh_inventory
    reviews.each do |review|
      change = review.fetch(:change)
      raise "edited value mismatch #{review.fetch(:key).inspect}" unless
        inventory.fetch(review.fetch(:key)).fetch('work_text') == change.fetch(:new)
    end
    index = M.table(M::INDEX)
    reviews.each do |review|
      key = review.fetch(:key)
      change = review.fetch(:change)
      rows = index.select do |row|
        M.key(row) == key && row.fetch('entity_key') == change.fetch(:entity)
      end
      next if rows.empty? && key == ['default', '58585', '']
      raise "expected one preserved indexed owner at #{key.inspect}" unless rows.length == 1
      raise "indexed status/evidence changed at #{key.inspect}" unless
        rows.first.fetch('status') == 'accepted' &&
        rows.first.fetch('evidence').start_with?('D-20831:')
      index.select { |row| M.key(row) == key }.each do |row|
        row['korean_current'] = change.fetch(:new)
      end
    end
    M.write_table(M::INDEX, index.headers, index)

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise "residual audit failed:\n#{residual}" unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    snapshot_rows = ShortLabelDiscovery20261018.build(
      inventory.values, glossary, index.map(&:to_h)
    )
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot_rows)
    hashes = M.hashes
    raise 'unexpected resources edited' unless checks.map { |check| check.fetch(:resource) } == ['default']
    raise 'CSV hashes changed unexpectedly' unless hashes.fetch('affix') == before_hashes.fetch('affix') &&
      hashes.fetch('base') == before_hashes.fetch('base')

    retained = prior_block[/Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1]
    raise 'last backup block missing' unless retained
    retained_lines = retained.lines.reject { |line| line.start_with?('- default:') }
    check = checks.fetch(0)
    retained_lines << "- default: #{check.fetch(:cells)} cells; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    summary = checkpoint_text(
      reviews, candidate_records, snapshot_rows, inventory, index, hashes,
      checks, verification, residual, validation, retained_lines.map(&:strip).join("\n")
    )

    report_path = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum_path = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    detail = reviews.map do |review|
      key = review.fetch(:key)
      change = review.fetch(:change)
      "- `#{key.join(':')}`: `#{change.fetch(:old)}` -> `#{change.fetch(:new)}`. #{change.fetch(:prior)}"
    end.join("\n")
    File.write(report_path, <<~TEXT)
      # D-#{D}: Savant Short-Label And Title Pairing

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Evidence

      English establishes `Savant` as the displayed formal rank; D-18268
      fixes its Korean form as `사반트`. The Japanese `一級魔道師` supports
      the formal mage-rank reading, while Chinese `博学者` is corroborative
      and does not override English. The Aethan Engar title/name spelling
      follows the established complete label at default:18347, 54082, and
      760. This batch adds only missing English display labels. D-19509's
      translation closure at default:58585 and D-19512/D-20831's person
      disposition at default:47690 remain terminal; no index status or
      historical count is changed.

      #{detail}
    TEXT
    File.write(addendum_path, <<~TEXT)
      # D-#{D} Edit Addendum

      Two default `Texto` cells were corrected to complete bilingual
      title/name labels. The byte-preserving editor and independent verifier
      checked byte-identical pre-edit backup, BOM, mixed line endings,
      row count/order, target cells, unchanged non-target bytes, and inverse
      reconstruction. Existing occurrence statuses/evidence are preserved.

      #{summary}

      #{detail}
    TEXT

    docs.each do |path, text|
      replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << "\n## D-#{D}: Savant Bilingual Title Labels\n\nD-#{D} added the missing English rank label to default:58585 (`사반트(Savant)`) and the complete title/name label at default:47690 (`사반트 에이선 엥가르(Savant Aethan Engar)`). D-19509's semantic/rank closure and D-19512/D-20831's person status remain unchanged; no indexed status or historical count was reopened or recounted.\n"
      elsif path.end_with?('README.md')
        text << "\n## D-#{D}: Savant Bilingual Title Labels\n\nThe bounded short-label discovery found two Savant labels whose Korean translation was established but whose English title was missing from the parenthetical. D-#{D} adds the exact English labels using the D-18268 rank form and the established Aethan Engar spelling. Earlier index statuses/counts remain unchanged; see the report and edit addendum.\n"
      end
      File.write(path, text)
    end
    puts "D-#{D}: corrected 2 title labels; prior decisions preserved; #{validation.strip}; residual audit PASS."
  end
end

ReviewShortLabelCandidatesD21792.run if $PROGRAM_NAME == __FILE__
