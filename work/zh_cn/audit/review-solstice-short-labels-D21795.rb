#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'

module ReviewSolsticeShortLabelsD21795
  extend self

  M = ReviewedNameBatches
  D = 21_795
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21794.tsv')
  CANDIDATES = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  SOURCE_KEYS = {
    ['base', '1446', '11'] => ['accepted', '동지', '솔스티스(Solstice)'],
    ['base', '3187', '11'] => ['accepted', '동지', '솔스티스(Solstice)'],
    ['default', '3154', ''] => [
      'not-an-issue', '솔스티스(Solstice)에 들어가기',
      '솔스티스(Solstice)에 들어가기'
    ],
    ['default', '15467', ''] => [
      'accepted', '솔스티스에서 나가기',
      '솔스티스(Solstice)에서 나가기'
    ],
    ['default', '25061', ''] => ['uncertain', '솔스티스', '솔스티스'],
    ['default', '30187', ''] => [
      'accepted',
      '여름 궁정 문양을 더한 실리 페이(Seelie Fae) 양식처럼 보이지만, 페이(Fae) 마법부여사들은 솔스티스가 시일리 음유시인들에게는 알려지지 않았다고 주장한다.',
      '여름 궁정 문양을 더한 실리 페이(Seelie Fae) 양식처럼 보이지만, 페이(Fae) 마법부여사들은 솔스티스(Solstice)가 시일리 음유시인들에게는 알려지지 않았다고 주장한다.'
    ],
    ['default', '47781', ''] => [
      'accepted', '꿈을 사용해 솔스티스에 들어가기',
      '꿈을 사용해 솔스티스(Solstice)에 들어가기'
    ]
  }.freeze
  CANDIDATE_DISPOSITIONS = {
    ['base', '1446', '11'] => 'accepted',
    ['base', '3187', '11'] => 'accepted',
    ['default', '25061', ''] => 'uncertain',
    ['default', '3154', ''] => 'not-an-issue'
  }.freeze
  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def source_matches(inventory)
    pattern = /(?<![A-Za-z0-9])Solstice(?![A-Za-z0-9])/i
    inventory.values.select do |row|
      JSON.parse(row.fetch('en_texts_json')).compact.any? { |text| text.match?(pattern) }
    end.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
  end

  def reviews(inventory)
    matches = source_matches(inventory)
    raise "expected seven exact English source rows, got #{matches.length}" unless
      matches.length == SOURCE_KEYS.length
    raise 'Solstice source-key coverage differs' unless
      matches.map { |row| key(row) }.to_set == SOURCE_KEYS.keys.to_set

    matches.map do |source|
      row_key = key(source)
      status, old, proposed = SOURCE_KEYS.fetch(row_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "English source mismatch at #{row_key.inspect}" unless
        english.match?(/(?<![A-Za-z0-9])Solstice(?![A-Za-z0-9])/i)
      raise "Japanese support missing at #{row_key.inspect}" unless japanese.include?('ソルスティス')
      raise "unexpected Korean source at #{row_key.inspect}" unless
        [old, proposed].include?(source.fetch('work_text'))
      if row_key == ['default', '30187', '']
        raise 'Chinese weapon context changed' unless chinese.include?('这件武器')
      end
      {
        'resource' => row_key[0], 'ID_Linha' => row_key[1], 'Tipo_Variante' => row_key[2],
        'entity_key' => 'unresolved-name-reference:solstice',
        'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => evidence(row_key),
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(
          'unresolved-name-reference:solstice' => status
        ),
        'previous_status' => '[]', 'previous_evidence' => '[]'
      }
    end
  end

  def evidence(row_key)
    common = 'English is the semantic anchor; Japanese ソルスティス corroborates the name reading. '
    case row_key
    when ['base', '1446', '11'], ['base', '3187', '11']
      common + 'The base label is currently the common noun 동지; replace it with the established bilingual name form. Exact item/entity identity is not inferred from this isolated base row.'
    when ['default', '3154', '']
      common + 'The destination action already has the bilingual name; preserve it.'
    when ['default', '15467', ''], ['default', '47781', '']
      common + 'The English action explicitly uses Solstice as a destination; pair the existing Korean transliteration without changing the action.'
    when ['default', '25061', '']
      common + 'This one-word dialogue response does not identify whether Solstice is a place, item, or another referent. Preserve the text and retain D-8201 uncertainty.'
    when ['default', '30187', '']
      common + 'English and Chinese explicitly frame Solstice as a weapon name. Add the bilingual annotation while preserving the independent Fae and House mentions.'
    else
      raise "unreviewed source key #{row_key.inspect}"
    end
  end

  def candidate_reviews(candidate_rows, inventory, index, row_reviews)
    candidate = candidate_rows.find { |row| row.fetch('english_candidate') == 'Solstice' }
    raise 'Solstice candidate missing from prior snapshot' unless candidate
    keys = (
      JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
      JSON.parse(candidate.fetch('paired_evidence_keys_json'))
    ).map { |parts| parts.map(&:to_s) }.uniq
    raise "unexpected Solstice candidate memberships: #{keys.inspect}" unless
      keys.to_set == CANDIDATE_DISPOSITIONS.keys.to_set

    old_texts = row_reviews.to_h { |row| [key(row), row.fetch('old')] }
    keys.map do |row_key|
      source = inventory.fetch(row_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      disposition = CANDIDATE_DISPOSITIONS.fetch(row_key)
      {
        'english_candidate' => 'Solstice',
        'disposition' => disposition,
        'resource' => row_key[0], 'ID_Linha' => row_key[1], 'Tipo_Variante' => row_key[2],
        'english' => english, 'japanese' => japanese,
        'chinese' => source.fetch('zh_text'),
        'korean' => old_texts.fetch(row_key, source.fetch('work_text')),
        'evidence' => "D-#{D}: #{evidence(row_key)}",
        'prior_index_dispositions_json' => JSON.generate(
          index.select { |entry| key(entry) == row_key }.map do |entry|
            [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')]
          end
        )
      }
    end
  end

  def checks_from_existing_backups(manifest_rows, backup_dir)
    manifest_rows.select { |row| row.fetch('old') != row.fetch('new') }
                 .group_by { |row| row.fetch('resource') }.map do |resource, edits|
      path = M.csv_path(resource)
      backup = File.join(backup_dir, File.basename(path))
      raise "missing pre-edit backup #{backup}" unless File.file?(backup)
      before = File.binread(backup)
      active = File.binread(path)
      reconstructed, rows = ProperNameCellEditor.prepare(before, edits)
      raise "active #{resource} bytes do not match the reviewed edits" unless
        reconstructed == active
      {
        resource: resource, cells: edits.length, rows: rows,
        before_sha256: Digest::SHA256.hexdigest(before),
        after_sha256: Digest::SHA256.hexdigest(active),
        backup: backup,
        validation: 'BOM/line-endings/rows/order/tokens/non-target bytes/inverse PASS'
      }
    end
  end

  def refresh_index_text!(index, inventory, manifest_rows)
    changed_keys = manifest_rows.select { |row| row.fetch('old') != row.fetch('new') }
                                .map { |row| key(row) }.to_set
    prior = index.map(&:dup)
    index.each do |row|
      row['korean_current'] = inventory.fetch(key(row)).fetch('work_text') if
        changed_keys.include?(key(row))
    end
    raise 'index status/evidence or non-target fields changed' unless
      prior.zip(index).all? do |before, after|
        before.all? { |field, value| field == 'korean_current' || after[field] == value } &&
          (changed_keys.include?(key(before)) ||
           before['korean_current'] == after['korean_current'])
      end
    M.write_table(M::INDEX, M.table(M::INDEX).headers, index)
    changed_keys
  end

  def update_docs(snapshot, checks, index, refreshed_index_keys)
    hashes = M.hashes
    counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    status_text = counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    check_lines = checks.map do |check|
      "- #{check.fetch(:resource)}: #{check.fetch(:cells)} cells; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    end.join("\n")
    old_block = File.read(M::DOCS.first)[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1
    ]
    raise 'could not preserve prior last-edit backup records' unless old_block
    merged = (old_block.lines + check_lines.lines).each_with_object({}) do |line, result|
      resource = line[/\A- (\w+): \d+ cells; pre .*backup `/, 1]
      result[resource] = line.strip if resource
    end
    last_backups = M::RESOURCES.map { |resource| merged[resource] }.compact.join("\n")
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed every exact English source occurrence of Solstice across base/default: 7 distinct source keys; corrected 5 Texto cells to the supported Korean name form `솔스티스(Solstice)`, preserved 1 already-canonical bilingual action, and held 1 one-word dialogue response as uncertain.
      Japanese ソルスティス corroborates the name reading; Chinese is supplementary. Default:30187 identifies a weapon, while default:3154/15467/47781 use a destination frame. These contexts are not merged into one glossary entity without evidence that they share an identity. Existing index statuses/evidence and glossary remain unchanged; Korean snapshots were synchronized for #{refreshed_index_keys.length} already-indexed row keys.
      Short-label candidate memberships: 4 reviewed; 2 accepted corrections, 1 already canonical, 1 uncertain. Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Next batch: D-#{D + 1}; continue refreshed short-label candidate snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first&.fetch('english_candidate', 'none')}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{status_text}.
      Remaining unreviewed indexed matches: 0; reviewed unresolved indexed holds: #{index.count { |row| row.fetch('status') == 'uncertain' }}. These focused index counts do not measure discovery remaining.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      Last batch pre-edit backups and byte validation:
      #{check_lines}
      #{M.command!('ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
                   '--review', MANIFEST, '--backup-dir', "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}").strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{last_backups}
      Aligned inventory: 73430 rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{M.table(File.join(__dir__, 'proper-name-glossary.tsv')).length} entries; SHA-256 `#{Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest}`.
      Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D#{D}.tsv`.
      Entity identity hold: default:25061 remains uncertain under D-8201; no Solstice entity merge or new glossary owner was asserted.
    TEXT

    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "active checkpoint missing from #{path}" unless text.match?(marker)
      File.write(path, text.sub(marker, block))
    end

    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    File.write(report, <<~TEXT)
      # D-#{D}: Solstice Source-Label Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Evidence And Preservation

      English is the meaning anchor. All seven exact source hits were compared
      with aligned Japanese and Chinese. Japanese uses ソルスティス throughout.
      Base IDs 1446 and 3187 use the common-noun Korean `동지`; normalize these
      isolated name labels to `솔스티스(Solstice)`. The destination actions at
      default IDs 15467 and 47781 receive the same bilingual name annotation;
      ID 3154 was already canonical. At default:30187, Chinese explicitly
      identifies a weapon and English names it Solstice, so annotate that name.
      Do not infer that the weapon and destination are the same entity.

      The one-word dialogue response at default:25061 remains unchanged and
      uncertain, preserving D-8201. No glossary entity or occurrence-index row
      was added because the source evidence does not resolve the shared name's
      entity identity. Existing row owners, statuses, and evidence were
      preserved; only `korean_current` snapshots at already-indexed edited
      keys were refreshed. Cumulative totals were not changed or recounted.
    TEXT
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      #{summary}

      The byte-preserving editor and independent verifier checked byte-identical
      pre-edit backups, BOM, mixed line endings, headers, row count/order, exact
      target cells, unchanged non-target bytes, and inverse reconstruction.
      Only the five reviewed `Texto` cells in the source manifest changed.
    TEXT
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    prior_block = File.read(M::DOCS.first)[marker]
    raise 'D-21794 is not the active checkpoint' unless
      prior_block&.include?('Latest verified proper-name batch: D-21794 ')
    raise 'checkpoint documents differ' unless
      M::DOCS.all? { |path| File.read(path)[marker] == prior_block }
    output_paths = [
      CANDIDATES, SNAPSHOT,
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ]
    raise "D-#{D} output already exists" if output_paths.any? { |path| File.exist?(path) }

    before_hashes = M.hashes
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    inputs = M.table(INPUT).map(&:to_h)
    row_reviews = reviews(inventory)
    if File.exist?(MANIFEST)
      raise 'partial D-21795 manifest differs from reviewed source' unless
        M.table(MANIFEST).map(&:to_h) == row_reviews
    else
      M.write_table(MANIFEST, M::HEADERS, row_reviews)
    end

    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    changed_rows = row_reviews.select { |row| row.fetch('old') != row.fetch('new') }
    if changed_rows.all? do |row|
         inventory.fetch(key(row)).fetch('work_text') == row.fetch('new')
       end
      checks = checks_from_existing_backups(row_reviews, backup_dir)
    elsif changed_rows.all? do |row|
            inventory.fetch(key(row)).fetch('work_text') == row.fetch('old')
          end
      checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, backup_dir, before_hashes)
    else
      raise 'active CSV contains a partial or conflicting D-21795 edit'
    end
    expected_checks = { 'base' => 2, 'default' => 3 }
    raise 'edited resource/cell counts differ' unless
      checks.to_h { |check| [check.fetch(:resource), check.fetch(:cells)] } == expected_checks

    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', backup_dir
    )
    raise 'byte-preserving verification failed' unless verification.include?('PASS')
    refreshed_inventory = M.refresh_inventory
    refreshed_index_keys = refresh_index_text!(
      index, refreshed_inventory, row_reviews
    )
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    raise "proper-name data validation failed: #{validation}" unless validation.include?('PASS')
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise "proper-name residual audit failed: #{residual}" unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0')
    raise 'unexpected resource changed' unless
      M.hashes.fetch('affix') == before_hashes.fetch('affix')

    candidate_rows = candidate_reviews(inputs, inventory, index, row_reviews)
    raise 'expected four Solstice candidate memberships' unless candidate_rows.length == 4
    raise 'candidate dispositions differ' unless
      candidate_rows.group_by { |row| row.fetch('disposition') }
                    .transform_values(&:length) ==
        { 'accepted' => 2, 'not-an-issue' => 1, 'uncertain' => 1 }
    M.write_table(CANDIDATES, HEADERS, candidate_rows)

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    refreshed_index = M.table(M::INDEX).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(
      refreshed_inventory.values, glossary, refreshed_index
    )
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    update_docs(snapshot, checks, refreshed_index, refreshed_index_keys)
    puts "D-#{D}: reviewed all 7 exact Solstice source rows; edited 5 cells, preserved 1 canonical row, held 1 uncertain; next candidates=#{snapshot.length}."
  end
end

ReviewSolsticeShortLabelsD21795.run if $PROGRAM_NAME == __FILE__
