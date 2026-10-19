#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'
require_relative 'proper-name-cell-editor'

module ReviewFontShortLabelD21814
  extend self

  M = ReviewedNameBatches
  D = 21_814
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21813.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  TARGETS = {
    ['default', '12405', ''] => 'accepted',
    ['default', '1331', ''] => 'accepted',
    ['default', '14580', ''] => 'accepted',
    ['default', '41822', ''] => 'accepted',
    ['default', '9163', ''] => 'accepted',
    ['default', '9272', ''] => 'accepted',
    ['default', '46948', ''] => 'accepted',
    ['base', '4633', '11'] => 'not-an-issue',
    ['default', '10833', ''] => 'not-an-issue',
    ['default', '2563', ''] => 'not-an-issue',
    ['default', '45783', ''] => 'not-an-issue'
  }.freeze
  EDITS = {
    ['default', '12405', ''] => ['샘(Font)', '샘(The Font)'],
    ['default', '1331', ''] => ['샘(Font)', '샘(The Font)'],
    ['default', '14580', ''] => ['샘(Font)', '샘(The Font)'],
    ['default', '41822', ''] => ['샘', '샘(The Font)'],
    ['default', '9163', ''] => ['원천(The Font)', '샘(The Font)'],
    ['default', '9272', ''] => [
      '노메론(Nomeron)과 엮이지 마. 그는 어리석은 선동가야. 원천(The Font)이 마를 거라고? 미친 소리지.',
      '노메론(Nomeron)과 엮이지 마. 그는 어리석은 선동가야. 샘(The Font)이 마를 거라고? 미친 소리지.'
    ],
    ['default', '46948', ''] => [
      '모든 여름 궁정(Summer Court) 마법의 원천인 샘, 폰트(The Font)의 주인 노메론(Nomeron)이니까 알지. 샘물이 가장 풍성하게 흐르는 것도 봤지만, 이렇게 말라붙은 건 처음이야.',
      '모든 여름 궁정(Summer Court) 마법의 원천인 샘(The Font)의 주인 노메론(Nomeron)이니까 알지. 샘물이 가장 풍성하게 흐르는 것도 봤지만, 이렇게 말라붙은 건 처음이야.'
    ]
  }.freeze
  EVIDENCE = {
    'accepted' => <<~TEXT.strip.freeze,
      The merged English evidence identifies the Font as one specific
      wellspring of Summer Court magic: default:31067 says Ysa chose his
      hollow above a potent wellspring of Fae energy known as the Font;
      default:1192, 48638 and 53537 independently describe its age, magical
      source, flow and drying. At the reviewed label keys, Japanese イーサの泉
      and Chinese 圣泉 support the spring/source sense. Reuse D-3127's
      already accepted Korean display 샘(The Font). This is a focused proper-
      name display correction, not a recount or reopening of prior sentence
      dispositions. Do not generalize it to Njordir's Font, Font of the
      Crossing, Prismere Font, lower-case generic fonts, or metaphors.
    TEXT
    'not-an-issue' => <<~TEXT.strip.freeze
      The existing Korean label already preserves the complete source name
      in context. Keep the localized Ysa possessive in base:4633; the other
      labels already use 샘(The Font). This candidate membership requires no
      edit. Do not reopen prior entity or sentence dispositions.
    TEXT
  }.freeze

  def candidate_keys(row)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(row.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
  end

  def build_reviews(inventory, index, candidates)
    candidate = candidates.fetch('The Font')
    keys = candidate_keys(candidate)
    raise "The Font candidate keys differ: #{keys.inspect}" unless
      keys.to_set == TARGETS.keys.to_set && keys.length == TARGETS.length

    prior_by_key = index.group_by { |row| M.key(row) }
    context = inventory.fetch(['default', '31067', ''])
    context_en = JSON.parse(context.fetch('en_texts_json')).compact.join("\n")
    raise 'explicit Font origin evidence changed' unless
      context_en.include?('a potent wellspring of fae energy known as the Font')

    keys.map do |key|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      korean = source.fetch('work_text')
      raise "English The Font evidence missing at #{key.join(':')}" unless
        english.match?(/(?<![A-Za-z])the Font(?![A-Za-z])/i)
      raise "Japanese spring evidence missing at #{key.join(':')}" unless
        japanese.include?('泉')
      raise "Chinese sacred-spring evidence missing at #{key.join(':')}" unless
        chinese.include?('圣泉')

      disposition = TARGETS.fetch(key)
      if EDITS.key?(key)
        raise "stale Korean cell at #{key.join(':')}" unless
          EDITS.fetch(key).include?(korean)
      elsif key == ['base', '4633', '11']
        raise 'base:4633 complete bilingual label changed' unless
          korean == '이사의 샘 (The Font)'
      elsif key == ['default', '10833', ''] ||
            key == ['default', '2563', ''] ||
            key == ['default', '45783', '']
        raise "existing canonical Korean label changed at #{key.join(':')}" unless
          korean.include?('샘(The Font)')
      end

      {
        'english_candidate' => 'The Font',
        'disposition' => disposition,
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'korean' => EDITS.key?(key) ? EDITS.fetch(key).last : korean,
        'evidence' => "#{EVIDENCE.fetch(disposition)} Exact source key: #{key.join(':')}.",
        'prior_index_dispositions_json' => JSON.generate(
          prior_by_key.fetch(key, []).map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        )
      }
    end
  end

  def run
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [OUTPUT, SNAPSHOT, report, addendum].each do |path|
      raise "refusing to overwrite existing artifact #{path}" if File.exist?(path)
    end

    before_hashes = M.hashes
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_hash = Digest::SHA256.file(glossary_path).hexdigest
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    reviews = build_reviews(inventory, index, candidates)
    raise 'expected eleven Font memberships on eleven distinct keys' unless
      reviews.length == 11 && reviews.map { |row| M.key(row) }.uniq.length == 11

    edit_rows = EDITS.map do |key, (old, new)|
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => 'place:the-font',
        'status' => 'accepted',
        'old' => old,
        'new' => new,
        'evidence' => 'D-21814: ' + EVIDENCE.fetch('accepted'),
        'english' => JSON.parse(inventory.fetch(key).fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(inventory.fetch(key).fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => inventory.fetch(key).fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate({ 'place:the-font' => 'accepted' }),
        'previous_status' => '{}',
        'previous_evidence' => '{}'
      }
    end
    edit_manifest = File.join(__dir__, "proper-name-short-label-edits-D#{D}.tsv")
    if File.exist?(edit_manifest)
      existing = M.table(edit_manifest).map(&:to_h)
      raise "existing edit manifest differs: #{edit_manifest}" unless existing == edit_rows
    else
      M.write_table(edit_manifest, M::HEADERS, edit_rows)
    end

    backup_dir = File.join(
      '/private/tmp/ko-translate-backups',
      M::RUN_DATE_COMPACT,
      "before-proper-name-D#{D}"
    )
    backup = File.join(backup_dir, 'locatexts_zh_cn.koalocatext_default.csv')
    active_default = ProperNameCellEditor.parse(File.binread(M.csv_path('default'))).to_h do |row|
      [[row['ID_Linha'], row['Tipo_Variante'].to_s], row['Texto']]
    end
    states = EDITS.map do |key, (old, new)|
      value = active_default.fetch(key[1, 2])
      value == old ? :old : (value == new ? :new : :conflict)
    end.uniq
    raise "mixed/stale active edit state: #{states.inspect}" unless
      states.length == 1 && states.first != :conflict
    if states.first == :old
      checks = ProperNameCellEditor.apply(M::ROOT, edit_manifest, backup_dir, before_hashes)
    else
      raise "missing pre-edit byte backup #{backup}" unless File.file?(backup)
      backup_hash = Digest::SHA256.file(backup).hexdigest
      expected_updated, = ProperNameCellEditor.prepare(File.binread(backup), edit_rows)
      raise 'active file does not match edit reconstruction from backup' unless
        File.binread(M.csv_path('default')) == expected_updated
      checks = [{
        resource: 'default', cells: EDITS.length,
        rows: ProperNameCellEditor.parse(File.binread(M.csv_path('default'))).length,
        before_sha256: backup_hash,
        after_sha256: Digest::SHA256.file(M.csv_path('default')).hexdigest,
        backup: backup,
        validation: 'BOM/line-endings/rows/order/tokens/non-target bytes/inverse PASS (verified during initial apply)'
      }]
    end
    raise 'expected one default CSV backup/edit group' unless checks.length == 1 &&
      checks.first.fetch(:resource) == 'default' && checks.first.fetch(:cells) == EDITS.length
    backup_hash = Digest::SHA256.file(backup).hexdigest
    raise 'backup hash does not match recorded pre-edit CSV hash' unless
      checks.first.fetch(:before_sha256) == backup_hash
    after_hashes = M.hashes
    raise 'an unexpected CSV changed' unless
      after_hashes['affix'] == before_hashes['affix'] &&
        after_hashes['base'] == before_hashes['base'] &&
        after_hashes['default'] == checks.first.fetch(:after_sha256)
    inventory = M.refresh_inventory
    raise 'incomplete post-edit aligned inventory' unless inventory.length == 73_430
    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    edits_by_key = EDITS.keys.to_set
    indexed_targets = index.select { |row| edits_by_key.include?(M.key(row)) }
    indexed_targets.each do |row|
      row['korean_current'] = inventory.fetch(M.key(row)).fetch('work_text')
    end
    synced_keys = indexed_targets.map { |row| M.key(row).join(':') }.uniq.sort
    raise "unexpected indexed snapshot keys: #{synced_keys.inspect}" unless
      synced_keys == %w[default:46948: default:9272:]
    M.write_table(M::INDEX, index_table.headers, index)
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    raise 'glossary changed during short-label-only review' unless
      Digest::SHA256.file(glossary_path).hexdigest == glossary_hash
    reviewed = ShortLabelDiscovery20261018.reviewed_dispositions
    added = reviews.map do |row|
      [row.fetch('english_candidate'), row.fetch('resource'),
       row.fetch('ID_Linha'), row.fetch('Tipo_Variante').to_s]
    end
    glossary = M.table(glossary_path).map(&:to_h)
    next_snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, glossary, index,
      reviewed_dispositions: reviewed + added
    )
    raise 'The Font remains in refreshed candidate snapshot' if
      next_snapshot.any? { |row| row['english_candidate'] == 'The Font' }

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'residual bilingual/index validation failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0')
    raise 'validation changed index or glossary' unless
      Digest::SHA256.file(M::INDEX).hexdigest == index_hash &&
        Digest::SHA256.file(glossary_path).hexdigest == glossary_hash

    counts = reviews.group_by { |row| row.fetch('disposition') }
                    .transform_values(&:length)
    status_counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    unresolved = index.select { |row| row['status'] == 'uncertain' }
                      .map { |row| M.key(row) }.uniq.length
    variant_candidates = M.table(File.join(
      __dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'
    )).map(&:to_h)
    variant_counts = variant_candidates.group_by { |row| row['status'] }
                                       .transform_values(&:length)
    prior_block = File.read(M::DOCS.first)[
      /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    ].to_s
    retained = prior_block[
      /Retain last actual pre-edit backups:\n(.*?)(?=\nAligned inventory)/m, 1
    ]
    raise 'retained backup checkpoint missing' unless retained
    next_first = next_snapshot.first&.fetch('english_candidate', 'none')
    inventory_hash = Digest::SHA256.file(M::INVENTORY).hexdigest
    glossary_count = glossary.length
    backup_summary = checks.map do |check|
      "- #{check.fetch(:resource)}: #{check.fetch(:cells)} cells; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    end.join("\n")
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed 11 `The Font` short-label memberships in 11 distinct source keys: #{counts.inspect}.
      Candidate group: {"The Font"=>11}. Last reviewed candidate: The Font / default:9272.
      Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{next_snapshot.length} bounded groups; first `#{next_first}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')} (statuses unchanged; #{indexed_targets.length} existing Korean snapshots synchronized).
      Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
      Reviewed unresolved indexed holds: #{status_counts.fetch('uncertain', 0)}, in #{unresolved} distinct CSV row keys.
      Candidate classifications do not alter occurrence-index dispositions or cumulative counts. The D-21814 edits apply only to the seven listed Korean name spans; two existing indexed rows have their Korean snapshots synchronized while statuses/evidence remain unchanged. The Ysa Font's source-wide occurrence review remains separate. Earlier sentence-level dispositions, including D-19591, are not reopened or recounted.
      These focused index states are not global translation totals.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: #{variant_candidates.length} terms; registered-reviewed=#{variant_counts.fetch('registered-reviewed', 0)}, heuristic-not-reviewed=#{variant_counts.fetch('heuristic-not-reviewed', 0)}. This list is not exhaustive and establishes no overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Edit manifest: `work/zh_cn/audit/proper-name-short-label-edits-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
      Active CSV SHA-256:
      - affix: `#{after_hashes.fetch('affix')}`.
      - base: `#{after_hashes.fetch('base')}`.
      - default: `#{after_hashes.fetch('default')}`.
      Latest actual CSV-edit backup:
      #{backup_summary}
      Earlier retained CSV-edit backups:
      #{retained.strip}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{inventory_hash}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_hash}`.
      Proper-name glossary: #{glossary_count} entries; SHA-256 `#{glossary_hash}`.
      Report: `work/zh_cn/audit/named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
    TEXT

    M.write_table(OUTPUT, HEADERS, reviews)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, next_snapshot)
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "checkpoint missing in #{path}" unless text.match?(marker)
      File.write(path, text.sub(marker, block))
    end

    details = reviews.map do |row|
      "- `#{M.key(row).join(':')}`: #{row['disposition']}. #{row['evidence']}"
    end.join("\n")
    File.write(report, <<~TEXT)
      # D-#{D}: The Font Short-Label Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Findings

      #{details}

      English default:31067 identifies the Font as a specific wellspring of
      Fae energy chosen by Ysa. Japanese and Chinese support the sacred-spring
      reading, and the already accepted default:10833 establishes the active
      Korean form `샘(The Font)`. Seven exact Korean name spans were
      standardized; four complete labels were retained. This focused
      short-label review does not classify every corpus use of `Font`, and
      does not merge the distinct Njordir's Font, Font of the Crossing, or
      Prismere Font. D-19591 sentence dispositions and the occurrence index
      were not reopened or recounted.

      ## Validation

      #{validation.strip}
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}
      CSV byte-preservation: #{checks.map { |check| check.fetch(:validation) }.join('; ')}.
    TEXT
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      #{summary}

      The pre-edit default backup is byte-identical and is recorded above.
      Only seven reviewed `Texto` cells changed. Existing row ordering, BOM,
      mixed line-ending sequence, non-target fields/bytes, and reversible
      reconstruction were verified by `ProperNameCellEditor`. No source CSV
      or glossary entry was changed. Two existing occurrence-index rows had
      only their Korean snapshot field synchronized; statuses and evidence
      were preserved. Prior translation dispositions remain intact.

      Validation: #{validation.strip}
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}
    TEXT

    note = <<~NOTE

      ## D-#{D}: The Font Short-Label Review

      Reviewed all 11 memberships in the bounded `The Font` short-label
      candidate group. English context identifies Ysa's specific magical
      wellspring; Japanese `イーサの泉` and Chinese `圣泉` corroborate the
      spring/source sense. Reuse the established `샘(The Font)` form. Seven
      exact `Texto` cells were standardized; four complete labels were
      retained. This does not generalize to Njordir's Font, Font of the
      Crossing, Prismere Font, or generic/metaphorical `font`, and does not
      reopen D-19591 sentence decisions or recount index totals. Full
      source-wide Font discovery remains incomplete. See
      `named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
    NOTE
    [File.join(__dir__, 'README.md'),
     File.join(__dir__, 'decision-register-20261009.md')].each do |path|
      File.open(path, 'a') { |file| file.write(note) }
    end
    puts "D-#{D}: 11 Font memberships reviewed; 7 cells edited; #{next_snapshot.length} bounded groups remain."
  end
end

ReviewFontShortLabelD21814.run if $PROGRAM_NAME == __FILE__
