#!/usr/bin/env ruby

require 'digest'
require 'fileutils'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'proper-name-cell-editor'

module CorrectDeityMenuNameOrderD21568
  extend self

  M = ReviewedNameBatches
  D = 21_568
  RESOURCE = 'default'
  BACKUP_DIR = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
  MANIFEST = File.join(__dir__, "proper-name-text-corrections-D#{D}.tsv")
  REPORT = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  ADDENDUM = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  INDEX_BACKUP = File.join(BACKUP_DIR, 'proper-name-occurrences.tsv')

  TARGETS = {
    '16784' => {
      name: 'Belen', title: 'God of Death',
      old: '죽음의 신 벨렌(Belen){*1 (바라니(Varani)와 도크알브(Dokkalfar)만 선택 가능)}',
      new: '벨렌(Belen), 죽음의 신{*1 (바라니(Varani)와 도크알브(Dokkalfar)만 선택 가능)}',
      entities: %w[deity:belen people:dokkalfar people:varani]
    },
    '9504' => {
      name: 'Lyria', title: 'Goddess of Fate',
      old: '리리아(Lyria), 운명의 여신 {*1(도크알브(Dokkalfar)만 선택 가능)}',
      new: '리리아(Lyria), 운명의 여신{*1(도크알브(Dokkalfar)만 선택 가능)}',
      entities: %w[deity:lyria people:dokkalfar]
    },
    '47669' => {
      name: 'Ethene', title: 'Goddess of Wisdom',
      old: '에테네(Ethene), 지혜의 여신{*1 (알마인(Almain), 료스알브(Ljosalfar), 도크알브(Dokkalfar))}',
      new: '에테네(Ethene), 지혜의 여신{*1 (알마인(Almain), 료스알브(Ljosalfar), 도크알브(Dokkalfar))}',
      entities: %w[deity:ethene people:almain people:dokkalfar people:ljosalfar]
    },
    '43034' => {
      name: 'Aryllia', title: 'Goddess of Love',
      old: '아릴리아(Aryllia), 사랑의 여신{*1 (도크알브(Dokkalfar)만 선택 가능)}',
      new: '아릴리아(Aryllia), 사랑의 여신{*1 (도크알브(Dokkalfar)만 선택 가능)}',
      entities: %w[deity:aryllia people:dokkalfar]
    },
    '2009' => {
      name: 'Lopoku', title: 'God of Mischief',
      old: '장난의 신 로포쿠(Lopoku){*1 (바라니(Varani)와 도크알브(Dokkalfar) 선택 가능)}',
      new: '로포쿠(Lopoku), 장난의 신{*1 (바라니(Varani)와 도크알브(Dokkalfar) 선택 가능)}',
      entities: %w[deity:lopoku people:dokkalfar people:varani]
    },
    '48696' => {
      name: 'Ohnshan', title: 'God of Air',
      old: '오샨(Ohnshan), 바람의 신{*1(료스알브(Ljosalfar)만 선택 가능)}',
      new: '오샨(Ohnshan), 바람의 신{*1(료스알브(Ljosalfar)만 선택 가능)}',
      entities: %w[deity:ohnshan people:ljosalfar]
    },
    '26106' => {
      name: 'Ynadon', title: 'God of Justice',
      old: '정의의 신 이나돈(Ynadon){*1 (알마인(Almain)과 료스알브(Ljosalfar)만 선택 가능)}',
      new: '이나돈(Ynadon), 정의의 신{*1 (알마인(Almain)과 료스알브(Ljosalfar)만 선택 가능)}',
      entities: %w[deity:ynadon people:almain people:ljosalfar]
    },
    '23706' => {
      name: 'Mitharu', title: 'God of Order',
      old: '질서의 신 미사루(Mitharu){*1 (알마인(Almain)과 료스알브(Ljosalfar)만 선택 가능)}',
      new: '미사루(Mitharu), 질서의 신{*1 (알마인(Almain)과 료스알브(Ljosalfar)만 선택 가능)}',
      entities: %w[deity:mitharu people:almain people:ljosalfar]
    },
    '15781' => {
      name: 'Gaea', title: 'Goddess of Earth',
      old: '가이아(Gaea), 대지의 여신{*1 (료스알브(Ljosalfar) 선택 가능)}',
      new: '가이아(Gaea), 대지의 여신{*1 (료스알브(Ljosalfar) 선택 가능)}',
      entities: %w[deity:gaea people:ljosalfar]
    },
    '21780' => {
      name: 'Njordir', title: 'God of Water',
      old: '물의 신 뇨르디르(Njordir){*1(바라니(Varani) 전용)}',
      new: '뇨르디르(Njordir), 물의 신{*1(바라니(Varani) 전용)}',
      entities: %w[deity:njordir people:varani]
    },
    '42685' => {
      name: 'Thyrdon', title: 'God of War',
      old: '전쟁의 신 사이르돈(Thyrdon){*1 (알마인(Almain)과 바라니(Varani)만 선택 가능)}',
      new: '사이르돈(Thyrdon), 전쟁의 신{*1 (알마인(Almain)과 바라니(Varani)만 선택 가능)}',
      entities: %w[deity:thyrdon people:almain people:varani]
    },
    '29436' => {
      name: 'Vraekor', title: 'God of Fire',
      old: '불의 신 브래코르(Vraekor){*1 (알마인(Almain)과 바라니(Varani) 선택 가능)}',
      new: '브래코르(Vraekor), 불의 신{*1 (알마인(Almain)과 바라니(Varani) 선택 가능)}',
      entities: %w[deity:vraekor people:almain people:varani]
    }
  }.freeze

  INDEXED_ROWS_EXPECTED = TARGETS.values.sum { |target| target.fetch(:entities).length }
  EXPECTED_CORRECTIONS = TARGETS.count { |_id, target| target.fetch(:old) != target.fetch(:new) }
  EXPECTED_CHANGED_INDEX_ROWS = TARGETS.sum do |_id, target|
    target.fetch(:old) == target.fetch(:new) ? 0 : target.fetch(:entities).length
  end

  DETAIL = <<~TEXT.chomp
    ### D-#{D}: Deity Menu Name-Title Order

    Checked the 12 requested default deity menu labels against
    `deity name (English), Korean title`, matching the English menu order and
    the official Korean manual's deity-name spellings (PDF p. 2). English
    identity/meaning was checked with the aligned Japanese and Chinese source
    cells. Eight cells needed correction; four already matched the requested
    order. Selection notes, race names, footnote markers, and their wording
    were preserved exactly. The eight changes affect eight `Texto` cells and
    the `korean_current` cache for 22 existing occurrence-index rows. Existing
    entity keys, statuses, and evidence remain unchanged; this is a text-only
    correction, not a new or reopened proper-name decision and not a tally
    recount. No source CSV, PAK, or PAK-derived resource was modified or
    inspected.
  TEXT

  def ensure_unused!
    raise 'D-21568 artifacts already exist' if
      [MANIFEST, REPORT, ADDENDUM].any? { |path| File.exist?(path) } ||
      Dir.glob(File.join(__dir__, "named-scope-*-D#{D}-*.md")).any?
    raise "D-#{D} backup directory already exists" if File.exist?(BACKUP_DIR)
    raise 'official manual reference does not document all deity spellings' unless
      File.read(File.join(__dir__, 'official-korean-manual-reference.md'))
        .then { |text| TARGETS.values.all? { |target| text.include?("| #{target[:name]} |") } }
  end

  def prepare
    ensure_unused!
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    rows = TARGETS.map do |id, target|
      key = [RESOURCE, id, '']
      source = inventory.fetch(key)
      raise "unexpected active Korean text at default:#{id}" unless
        source.fetch('work_text') == target.fetch(:old)

      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      expected_english = "#{target.fetch(:name)}, #{target.fetch(:title)}"
      raise "English menu order differs at default:#{id}" unless english.start_with?(expected_english)
      raise "missing aligned Japanese/Chinese evidence at default:#{id}" if
        japanese.empty? || chinese.empty?

      entities = index.select { |row| M.key(row) == key }
      actual_entities = entities.map { |row| row.fetch('entity_key') }.sort
      raise "indexed entities differ at default:#{id}: #{actual_entities.inspect}" unless
        actual_entities == target.fetch(:entities).sort
      raise "empty existing disposition at default:#{id}" if
        entities.any? { |row| row.fetch('status').to_s.empty? }

      {
        'resource' => RESOURCE,
        'ID_Linha' => id,
        'Tipo_Variante' => '',
        'old' => target.fetch(:old),
        'new' => target.fetch(:new),
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'indexed_entities_json' => JSON.generate(actual_entities),
        'indexed_statuses_json' => JSON.generate(
          entities.to_h { |row| [row.fetch('entity_key'), row.fetch('status')] }
        ),
        'result' => target.fetch(:old) == target.fetch(:new) ?
          'already-standardized' : 'corrected',
        'evidence' => 'D-21568 text-only menu-label order correction. English leads with the deity name followed by the divine title; Japanese and Chinese were cross-checked, and the official Korean manual reference supplies the established Korean deity spellings. Preserve the exact selection note and all existing entity dispositions; do not register, reopen, or recount any occurrence.'
      }
    end
    raise 'unexpected number of target cells' unless rows.length == 12
    raise 'unexpected number of indexed occurrence rows' unless
      rows.sum { |row| JSON.parse(row.fetch('indexed_entities_json')).length } == INDEXED_ROWS_EXPECTED
    raise 'unexpected number of corrections' unless
      rows.count { |row| row.fetch('result') == 'corrected' } == EXPECTED_CORRECTIONS
    raise 'target labels do not all follow name-title order' unless
      rows.all? do |row|
        name = row.fetch('english').split(', ', 2).first
        name_index = row.fetch('new').index("(#{name})")
        name_index && name_index < row.fetch('new').index(', ')
      end
    raise 'target edits change opaque tokens or line breaks' unless
      rows.all? do |row|
        ProperNameCellEditor.tokens(row.fetch('old')) == ProperNameCellEditor.tokens(row.fetch('new')) &&
          row.fetch('old').scan(/\r\n|\r|\n/) == row.fetch('new').scan(/\r\n|\r|\n/)
      end

    puts "D-#{D} preparation: #{rows.length} labels checked; #{EXPECTED_CORRECTIONS} cells to correct; #{rows.length - EXPECTED_CORRECTIONS} already standardized; #{INDEXED_ROWS_EXPECTED} indexed occurrences reviewed; prepare only."
    rows
  end

  def update_checkpoint(summary, detail)
    M::DOCS.each do |path|
      text = File.read(path)
      start_marker = '<!-- current-proper-name-batch:start -->'
      end_marker = '<!-- current-proper-name-batch:end -->'
      raise "missing current checkpoint markers in #{path}" unless
        text.include?(start_marker) && text.include?(end_marker)

      block = "#{start_marker}\n## Latest Verified Proper-Name Batch\n\n#{summary}#{end_marker}"
      text.sub!(/#{Regexp.escape(start_marker)}.*?#{Regexp.escape(end_marker)}/m, block)
      text.sub!(end_marker, "#{end_marker}\n\n#{detail}")
      File.write(path, text)
    end
  end

  def checkpoint_summary(checks, verify_text, inventory)
    index = M.table(M::INDEX)
    counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    unresolved = index.select { |row| %w[needs-context uncertain].include?(row['status']) }
    unreviewed = index.select { |row| row['status'] == 'needs-context' }
    held = index.select { |row| row['status'] == 'uncertain' }
    candidates = M.table(File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'))
    candidate_counts = candidates.group_by { |row| row.fetch('status') }.transform_values(&:length)
    prior_block = File.read(M::DOCS.first)[
      /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    ].to_s
    retained_lines = prior_block.lines.grep(/^- (affix|base|default): \d+ cells; pre .*backup `/)
    retained = retained_lines.to_h { |line| [line[/\A- (\w+):/, 1], line.strip] }
    retained['default'] = checks.map do |check|
      "- default: #{check.fetch(:cells)} cells; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    end.fetch(0)
    hashes = M.hashes
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    statuses_text = counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    last_backups = M::RESOURCES.map { |resource| retained[resource] }.compact.join("\n")
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    glossary_hash = Digest::SHA256.file(glossary_path).hexdigest
    <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Checked 12 distinct default deity menu labels; corrected #{EXPECTED_CORRECTIONS} cells and confirmed #{12 - EXPECTED_CORRECTIONS} already standardized; refreshed #{EXPECTED_CHANGED_INDEX_ROWS} existing occurrence-index text caches without changing keys, statuses, evidence, or tallies.
      Next batch: D-#{D + 1}; continue the defined source-discovery/residual closure checks; no unreviewed indexed keys.
      Indexed matches: #{index.length}; #{statuses_text}.
      Remaining unreviewed indexed matches: #{unreviewed.length}, in #{unreviewed.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      These are focused entity/row index states, not global translation totals. The 96 documented uncertain occurrences remain reviewed holds, not unreviewed work.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: #{candidates.length} terms; registered-reviewed=#{candidate_counts.fetch('registered-reviewed', 0)}, heuristic-not-reviewed=#{candidate_counts.fetch('heuristic-not-reviewed', 0)}. This list is not exhaustive; it does not establish an overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")}
      Last batch pre-edit backup and byte validation:
      #{checks.map { |check| "- default: #{check.fetch(:cells)} cells; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`." }.join("\n")}
      #{verify_text.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{last_backups}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_hash}`.
      Proper-name glossary: #{M.table(glossary_path).length} entries; SHA-256 `#{glossary_hash}`.
      Report: `work/zh_cn/audit/#{File.basename(REPORT)}`.
      Addendum: `work/zh_cn/audit/#{File.basename(ADDENDUM)}`.
      Text-only source comparison manifest: `work/zh_cn/audit/#{File.basename(MANIFEST)}`.
    TEXT
  end

  def apply
    rows = prepare
    manifest_headers = %w[
      resource ID_Linha Tipo_Variante old new english japanese chinese
      indexed_entities_json indexed_statuses_json result evidence
    ]
    M.write_table(MANIFEST, manifest_headers, rows)

    csv_path = M.csv_path(RESOURCE)
    csv_before = File.binread(csv_path)
    before_hash = Digest::SHA256.hexdigest(csv_before)
    expected_hash = M.hashes.fetch(RESOURCE)
    raise "active default hash changed during preparation: #{before_hash}" unless
      before_hash == expected_hash

    changed_rows = rows.select { |row| row.fetch('old') != row.fetch('new') }
    edits = changed_rows.map do |row|
      row.slice('ID_Linha', 'Tipo_Variante', 'old', 'new')
    end
    csv_after, csv_row_count = ProperNameCellEditor.prepare(csv_before, edits)

    index_before = File.binread(M::INDEX)
    index_table = M.table(M::INDEX)
    index_rows = index_table.map(&:to_h)
    targets = changed_rows.to_h { |row| [M.key(row), row] }
    index_changes = 0
    index_rows.each do |row|
      target = targets[M.key(row)]
      next unless target

      row['korean_current'] = target.fetch('new')
      index_changes += 1
    end
    raise "unexpected index cache update count: #{index_changes}" unless
      index_changes == EXPECTED_CHANGED_INDEX_ROWS

    staging_index = "/private/tmp/proper-name-occurrences-D#{D}-#{Process.pid}.tsv"
    M.write_table(staging_index, index_table.headers, index_rows)
    index_after = File.binread(staging_index)

    FileUtils.mkdir_p(BACKUP_DIR)
    csv_backup = File.join(BACKUP_DIR, File.basename(csv_path))
    FileUtils.copy_file(csv_path, csv_backup)
    FileUtils.copy_file(M::INDEX, INDEX_BACKUP)
    raise 'CSV pre-edit backup is not byte-identical' unless File.binread(csv_backup) == csv_before
    raise 'index pre-edit backup is not byte-identical' unless File.binread(INDEX_BACKUP) == index_before
    raise 'active CSV changed before write' unless File.binread(csv_path) == csv_before
    raise 'active index changed before write' unless File.binread(M::INDEX) == index_before

    File.binwrite(csv_path, csv_after)
    File.binwrite(M::INDEX, index_after)
    raise 'active CSV write verification failed' unless File.binread(csv_path) == csv_after
    raise 'active index write verification failed' unless File.binread(M::INDEX) == index_after

    original_csv = ProperNameCellEditor.parse(csv_before)
    updated_csv = ProperNameCellEditor.parse(File.binread(csv_path))
    raise 'CSV headers or row count changed' unless
      original_csv.headers == updated_csv.headers && original_csv.length == updated_csv.length
    raise 'CSV row order or key changed' unless
      original_csv.each_with_index.all? do |row, ordinal|
        ProperNameCellEditor.key(row) == ProperNameCellEditor.key(updated_csv[ordinal])
      end

    original_index = M.table(INDEX_BACKUP)
    updated_index = M.table(M::INDEX)
    raise 'index headers or row count changed' unless
      original_index.headers == updated_index.headers && original_index.length == updated_index.length
    original_index.each_with_index do |row, ordinal|
      expected = row.to_h
      target = targets[M.key(expected)]
      expected['korean_current'] = target.fetch('new') if target
      raise "unexpected index change at row #{ordinal + 1}" unless
        expected == updated_index[ordinal].to_h
    end

    inventory = M.refresh_inventory
    rows.each do |row|
      raise "post-edit text mismatch at #{M.key(row).inspect}" unless
        inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('new')
    end
    checks = [{
      cells: edits.length,
      before_sha256: before_hash,
      after_sha256: Digest::SHA256.hexdigest(csv_after),
      backup: csv_backup
    }]
    verify_text = "default: PASS #{edits.length} changed cells; #{csv_row_count} ordered rows; BOM, mixed line endings, row keys/order, exact target cells, opaque tokens, non-target bytes, and inverse backup reconstruction verified. Index: PASS #{index_changes} current-text caches updated; all entity keys, dispositions, and evidence unchanged."
    summary = checkpoint_summary(checks, verify_text, inventory)
    report_text = <<~TEXT
      # D-#{D}: Deity Menu Name-Title Order Correction

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Evidence and Result

      The English menu labels explicitly put each deity name before its divine
      title. The Japanese and Chinese cells were checked as supporting
      references. The official Korean manual reference gives the established
      Korean spellings for all 12 names on PDF page 2.

      The 12 requested `Texto` values were checked against the exact
      name-title order supplied for this correction; eight were corrected and
      four already conformed. Selection eligibility notes,
      race-name annotations, markers, punctuation inside the notes, row order,
      and every unrelated CSV byte were preserved. The 22 existing occurrence
      index rows for corrected cells have their cached Korean text synchronized.
      Their entity keys, statuses, and prior evidence were not changed; no
      proper-name finding was added, reopened, or recounted.

      No source CSV, PAK, or PAK-derived resource was modified or inspected.
    TEXT
    addendum_text = <<~TEXT
      # D-#{D} Text Correction Addendum

      #{summary}

      ## Exact Changes

      #{rows.map { |row| "- `default:#{row.fetch('ID_Linha')}`: #{row.fetch('result') == 'corrected' ? "`#{row.fetch('old')}` -> `#{row.fetch('new')}`" : 'already in requested order; unchanged'}." }.join("\n")}

      The byte-preserving editor verified the eight changed cells, BOM, mixed
      line-ending sequence, row count/order, opaque tokens, unchanged
      non-target bytes, and inverse reconstruction against the byte-identical
      pre-edit backup. The occurrence-index backup is also byte-identical;
      verification confirmed that only `korean_current` changed on its 22
      affected records.
    TEXT
    File.write(REPORT, report_text)
    File.write(ADDENDUM, addendum_text)
    update_checkpoint(summary, DETAIL)

    puts "D-#{D}: checked #{rows.length} labels; corrected #{edits.length}; already standardized=#{rows.length - edits.length}; synchronized #{index_changes} index caches; preserved all occurrence dispositions."
    puts verify_text
    puts "Backup: #{csv_backup}"
    puts "Active hashes: #{M.hashes.inspect}"
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then CorrectDeityMenuNameOrderD21568.prepare
  when ['apply'] then CorrectDeityMenuNameOrderD21568.apply
  else abort 'usage: correct-deity-menu-name-order-D21568.rb [prepare|apply]'
  end
end
