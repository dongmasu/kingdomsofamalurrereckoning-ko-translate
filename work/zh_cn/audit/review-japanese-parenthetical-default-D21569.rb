#!/usr/bin/env ruby

require 'digest'
require 'fileutils'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'proper-name-cell-editor'

module ReviewJapaneseParentheticalDefaultD21569
  extend self

  M = ReviewedNameBatches
  D = 21_569
  RESOURCE = 'default'
  BACKUP_DIR = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-default-parenthetical-D#{D}"
  MANIFEST = File.join(__dir__, "japanese-parenthetical-review-D#{D}.tsv")
  REPORT = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  ADDENDUM = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  INDEX_BACKUP = File.join(BACKUP_DIR, 'proper-name-occurrences.tsv')
  CUE = /\A(?:while|with|vs\.?|at|during|from|when|in|against)\b/i
  SPAWN_IDS = %w[7021 10487 17772].freeze
  EXPECTED_CANDIDATES = 113
  EXPECTED_CONDITION_FRAGMENTS = 79
  EXPECTED_ACTION_FRAGMENTS = 3
  EXPECTED_PURPOSE_FRAGMENTS = 1
  EXPECTED_EXPLANATIONS = 30
  SLEIGHT_ID = '10487'
  FRAGMENT_LABELS = {
    '2124' => '셉터 사용 시',
    '2459' => '공황 상태인 대상 상대',
    '4843' => '페이블레이드(Faeblade) 사용 시',
    '6237' => '알파르(Alfar) 상대',
    '6875' => '요툰(Jottun) 상대',
    '13409' => '야간',
    '15947' => '차크람 사용 시',
    '17772' => "'사냥꾼-채집가' 생성",
    '18390' => '니스카루(Niskaru) 상대',
    '18538' => '나로스의 이빨(Teeth of Naros) 내',
    '20456' => '빙결된 대상 상대',
    '42399' => '콜로사이(Kollossae) 상대',
    '44895' => '에틴(Ettin) 상대',
    '45697' => '받아치기 중',
    '47775' => '경상을 입은 대상 상대',
    '50256' => '중상을 입은 대상 상대',
    '55425' => '투아사(Tuatha) 상대',
    '57928' => '주간',
    '58281' => '출혈 중인 대상 상대',
    '65065' => '중상을 입은 대상 상대'
  }.freeze

  DETAIL = <<~TEXT.chomp
    ### D-#{D}: Japanese Parenthetical Fragments in `default`

    Screened the 65,135 active default rows for Japanese cells whose entire
    text is parenthesized, matching the requested `;(...)` shape. Classified
    113 candidates by English meaning rather than punctuation alone: 79
    condition/weapon/target/location fragments, three short spawn-action
    labels, one purpose fragment, and 30 English-parenthesized asides,
    comments, or status labels. The 30 already had corresponding Korean
    parentheses and were retained. Of the 83 short fragments, six Korean
    labels already had the requested form; 77 cells were corrected.

    Followed Japanese's compact qualifier form, including `(야간)` and
    `(주간)`, and made target/weapon fragments suitable for postposed use.
    Normalized the 22 Familiar/Upgrade/Mastery level labels to 사역마,
    사역마 강화 and 사역마 숙련도, preserving every level and qualifier.
    Used the official Korean manual's 셉터 for Sceptres. At
    default:45697, distinguished parrying from ordinary blocking using
    default:41891/51696/52709 and Japanese パリィ中. At
    default:10487, the existing same-file translation `Sleight of Hand` =
    `손재주` at default:16773 supports `(손재주 생성)`. At default:26982,
    English says `to stun enemies` while Japanese instead says `vs. paralyzed
    enemies`; English meaning controls, and only the Korean fragment's outer
    parentheses were added. At default:58894, Japanese refers to undamaged
    boots, unlike English's unworn boots; retained the current English-led
    Korean meaning and recorded the source conflict without resolving it.
    Existing keys and dispositions were not reopened or recounted.
  TEXT

  def ensure_unused!
    paths = [MANIFEST, REPORT, ADDENDUM]
    paths.concat(Dir.glob(File.join(__dir__, "named-scope-*-D#{D}-*.md")))
    raise "D-#{D} artifacts already exist" if paths.any? { |path| File.exist?(path) }
    raise "D-#{D} backup directory already exists" if File.exist?(BACKUP_DIR)
  end

  def classification(id, english, korean)
    if CUE.match?(english)
      'condition-fragment'
    elsif SPAWN_IDS.include?(id) && english.start_with?('to spawn ')
      'spawn-action-fragment'
    elsif id == '26982' && english == 'to stun enemies'
      'purpose-fragment'
    elsif english.match?(/\A\(.*\)\z/) &&
          korean.start_with?('(') && korean.end_with?(')')
      'explanatory-parenthetical'
    else
      raise "unclassified Japanese-parenthetical candidate default:#{id}: #{english.inspect}"
    end
  end

  def proposed_text(id, category, old, english)
    return old if category == 'explanatory-parenthetical'
    if (match = english.match(/\Awith Level ([1-8]) Familiar(?: (Upgrade|Mastery))?\z/))
      label = {nil => '사역마', 'Upgrade' => '사역마 강화', 'Mastery' => '사역마 숙련도'}.fetch(match[2])
      return "(#{label} 레벨 #{match[1]})"
    end
    return "(#{FRAGMENT_LABELS.fetch(id)})" if FRAGMENT_LABELS.key?(id)
    return old if old.start_with?('(') && old.end_with?(')')
    return '(손재주 생성)' if id == SLEIGHT_ID

    "(#{old})"
  end

  def prepare
    ensure_unused!
    M::DOCS.each do |path|
      text = File.read(path)
      raise "missing checkpoint markers in #{path}" unless
        text.include?('<!-- current-proper-name-batch:start -->') &&
        text.include?('<!-- current-proper-name-batch:end -->')
    end
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    candidates = inventory.values.select do |row|
      row.fetch('resource') == RESOURCE &&
        JSON.parse(row.fetch('ja_texts_json') || '[]').compact.any? do |text|
          text.match?(/\A\(.*\)\z/)
        end
    end
    candidates.sort_by! { |row| [row.fetch('ID_Linha').to_i, row.fetch('Tipo_Variante').to_s] }
    raise "Japanese full-parenthesis candidate count differs: #{candidates.length}" unless
      candidates.length == EXPECTED_CANDIDATES

    rows = candidates.map do |source|
      id = source.fetch('ID_Linha')
      key = [RESOURCE, id, source.fetch('Tipo_Variante').to_s]
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      category = classification(id, english, old)
      related = index.select { |occurrence| M.key(occurrence) == key }
      {
        'resource' => RESOURCE,
        'ID_Linha' => id,
        'Tipo_Variante' => key[2],
        'old' => old,
        'new' => proposed_text(id, category, old, english),
        'classification' => category,
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'indexed_entities_json' => JSON.generate(related.map { |r| r.fetch('entity_key') }.sort),
        'indexed_statuses_json' => JSON.generate(
          related.to_h { |r| [r.fetch('entity_key'), r.fetch('status')] }
        ),
        'evidence' => evidence_for(id, category)
      }
    end
    counts = rows.group_by { |row| row.fetch('classification') }.transform_values(&:length)
    expected_counts = {
      'condition-fragment' => EXPECTED_CONDITION_FRAGMENTS,
      'spawn-action-fragment' => EXPECTED_ACTION_FRAGMENTS,
      'purpose-fragment' => EXPECTED_PURPOSE_FRAGMENTS,
      'explanatory-parenthetical' => EXPECTED_EXPLANATIONS
    }
    raise "candidate classifications differ: #{counts.inspect}" unless counts == expected_counts
    familiar_count = rows.count { |row| row.fetch('english').match?(/\Awith Level [1-8] Familiar(?: (Upgrade|Mastery))?\z/) }
    raise "expected 22 Familiar level labels, got #{familiar_count}" unless familiar_count == 22
    edits = rows.select { |row| row.fetch('old') != row.fetch('new') }
    raise "expected 77 actual edits, got #{edits.length}" unless edits.length == 77
    raise 'unexpected unparenthesized edit result' unless
      edits.all? { |row| row.fetch('new').start_with?('(') && row.fetch('new').end_with?(')') }
    raise 'opaque tokens or line breaks changed' unless
      edits.all? do |row|
        ProperNameCellEditor.tokens(row.fetch('old')) == ProperNameCellEditor.tokens(row.fetch('new')) &&
          row.fetch('old').scan(/\r\n|\r|\n/) == row.fetch('new').scan(/\r\n|\r|\n/)
      end

    puts "D-#{D} preparation: #{rows.length} candidates classified; #{edits.length} edits; #{rows.length - edits.length} retained; #{counts.inspect}; prepare only."
    rows
  end

  def evidence_for(id, category)
    if id == '45697'
      return 'English while parrying and Japanese パリィ中 denote a timed parry, not ordinary blocking. Same-file default:41891 and 51696 use 받아치기; default:52709 explicitly distinguishes blocking from parrying. Use (받아치기 중).'
    end
    if id == '58894'
      return 'Source conflict retained: English says when boots have not been worn; Japanese says when boots are not damaged. Preserve the current English-led Korean meaning; add only outer parentheses. Equipment/wear semantics remain unresolved without runtime context.'
    end
    if FRAGMENT_LABELS.key?(id)
      return 'English meaning and Japanese compact parenthetical form support the exact reviewed Korean qualifier. Use 야간/주간 for time, 상대 for targets, and short weapon/location conditions; Sceptres follows 셉터 in the official Korean manual. Preserve named entities and normalize only this fragment; doubled literal quotes in the Hunter-Gatherer label are reduced to a single matched pair.'
    end
    case category
    when 'condition-fragment'
      'Japanese encloses a short condition/weapon/target/location qualifier in parentheses. Preserve English meaning and use the same outer-parenthesis form. Familiar level labels consistently use 사역마, 사역마 강화, 사역마 숙련도; preserve the English level and Upgrade/Mastery distinction instead of the mistranslated 친숙/친숙화 or inconsistent 패밀리어.'
    when 'spawn-action-fragment'
      if id == SLEIGHT_ID
        'English says to spawn Sleight of Hand; Japanese and Chinese identify the same action. Reuse the established Korean label 손재주 from default:16773, then apply the Japanese outer-parenthesis format.'
      else
        'English, Japanese, and Chinese identify a short spawn-action label. Retain the current Korean wording and add only the Japanese outer-parenthesis format.'
      end
    when 'purpose-fragment'
      'English says to stun enemies and the current Korean conveys that purpose. Japanese instead says versus paralyzed enemies, so English controls meaning; add only the outer-parenthesis format.'
    when 'explanatory-parenthetical'
      'English itself presents an aside, stage direction, UI state, or complete explanatory note in parentheses. Korean already preserves that parenthetical form; retain unchanged rather than treating it as a postposed qualifier.'
    else
      raise "unknown classification #{category.inspect}"
    end
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

  def checkpoint_summary(check, verify_text, inventory, rows, edits)
    index = M.table(M::INDEX)
    counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    unreviewed = index.select { |row| row['status'] == 'needs-context' }
    held = index.select { |row| row['status'] == 'uncertain' }
    candidates = M.table(File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'))
    candidate_counts = candidates.group_by { |row| row.fetch('status') }.transform_values(&:length)
    prior_block = File.read(M::DOCS.first)[
      /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    ].to_s
    retained_lines = prior_block.lines.grep(/^- (affix|base|default): \d+ cells; pre .*backup `/)
    retained = retained_lines.to_h { |line| [line[/\A- (\w+):/, 1], line.strip] }
    retained['default'] =
      "- default: #{check.fetch(:cells)} cells; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    hashes = M.hashes
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    statuses_text = counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    last_backups = M::RESOURCES.map { |resource| retained[resource] }.compact.join("\n")
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    glossary_hash = Digest::SHA256.file(glossary_path).hexdigest
    <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Japanese parenthetical scan: #{rows.length} candidates classified; #{edits.length} `Texto` cells corrected; existing proper-name decisions were not reopened or recounted.
      Next batch: D-#{D + 1}; continue source-discovery/residual closure checks; no unreviewed indexed keys.
      Indexed matches: #{index.length}; #{statuses_text}.
      Remaining unreviewed indexed matches: #{unreviewed.length}, in #{unreviewed.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      These are focused entity/row index states, not global translation totals. The documented uncertain matches remain reviewed holds, not unreviewed work.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: #{candidates.length} terms; registered-reviewed=#{candidate_counts.fetch('registered-reviewed', 0)}, heuristic-not-reviewed=#{candidate_counts.fetch('heuristic-not-reviewed', 0)}. This list is not exhaustive; it does not establish an overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")}
      Last batch pre-edit backup and byte validation:
      - default: #{check.fetch(:cells)} cells; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`.
      #{verify_text}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{last_backups}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_hash}`.
      Proper-name glossary: #{M.table(glossary_path).length} entries; SHA-256 `#{glossary_hash}`.
      Report: `work/zh_cn/audit/#{File.basename(REPORT)}`.
      Addendum: `work/zh_cn/audit/#{File.basename(ADDENDUM)}`.
      Full Japanese-parenthetical candidate manifest: `work/zh_cn/audit/#{File.basename(MANIFEST)}`.
    TEXT
  end

  def apply
    rows = prepare
    manifest_headers = %w[
      resource ID_Linha Tipo_Variante old new classification english japanese
      chinese indexed_entities_json indexed_statuses_json evidence
    ]
    M.write_table(MANIFEST, manifest_headers, rows)
    edits = rows.select { |row| row.fetch('old') != row.fetch('new') }
    csv_path = M.csv_path(RESOURCE)
    csv_before = File.binread(csv_path)
    before_hash = Digest::SHA256.hexdigest(csv_before)
    csv_edits = edits.map do |row|
      row.slice('ID_Linha', 'Tipo_Variante', 'old', 'new')
    end
    csv_after, csv_row_count = ProperNameCellEditor.prepare(csv_before, csv_edits)

    index_before = File.binread(M::INDEX)
    index_table = M.table(M::INDEX)
    index_rows = index_table.map(&:to_h)
    target_map = edits.to_h { |row| [M.key(row), row] }
    index_changes = 0
    index_rows.each do |row|
      target = target_map[M.key(row)]
      next unless target

      row['korean_current'] = target.fetch('new')
      index_changes += 1
    end
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
    raise 'CSV write verification failed' unless File.binread(csv_path) == csv_after
    raise 'index write verification failed' unless File.binread(M::INDEX) == index_after

    before_index = M.table(INDEX_BACKUP)
    after_index = M.table(M::INDEX)
    raise 'index headers or row count changed' unless
      before_index.headers == after_index.headers && before_index.length == after_index.length
    before_index.each_with_index do |row, ordinal|
      expected = row.to_h
      target = target_map[M.key(expected)]
      expected['korean_current'] = target.fetch('new') if target
      raise "unexpected index change at row #{ordinal + 1}" unless expected == after_index[ordinal].to_h
    end

    inventory = M.refresh_inventory
    edits.each do |row|
      raise "post-edit mismatch at #{M.key(row).inspect}" unless
        inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('new')
    end
    check = {
      cells: edits.length,
      before_sha256: before_hash,
      after_sha256: Digest::SHA256.hexdigest(csv_after),
      backup: csv_backup
    }
    verify_text = "default: PASS #{edits.length} changed cells; #{csv_row_count} ordered rows; BOM, mixed line endings, exact row keys/order, opaque tokens, non-target bytes, and inverse backup reconstruction verified. Index: PASS #{index_changes} current-text caches updated; all keys, statuses, and evidence unchanged."
    summary = checkpoint_summary(check, verify_text, inventory, rows, edits)

    report = <<~TEXT
      # D-#{D}: Japanese Parenthetical Fragment Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope and Classification

      #{summary}

      Japanese full-cell pattern: `;\\(.*\\)$`, applied to read-only aligned
      locale inventory for `default`. Reviewed #{rows.length} matching rows:
      #{rows.count { |r| r['classification'] == 'condition-fragment' }} short
      condition/weapon/target/location fragments; #{rows.count { |r| r['classification'] == 'spawn-action-fragment' }} spawn-action
      fragments; #{rows.count { |r| r['classification'] == 'purpose-fragment' }} purpose
      fragment; and #{rows.count { |r| r['classification'] == 'explanatory-parenthetical' }} English-parenthesized
      asides, stage directions, UI states, or explanatory notes. The latter
      already had matching Korean parentheses and were left unchanged.

      ## Changes

      Standardized #{edits.length} short fragments as parenthetical qualifiers,
      preserving English meaning and all opaque tokens. Six other short
      fragments already had the requested form. Time labels are `(야간)` /
      `(주간)`; target/weapon/location labels use compact Korean conditions.
      Familiar level labels consistently use 사역마, 사역마 강화 and 사역마
      숙련도, retaining all original levels and the Upgrade/Mastery distinction.
      Sceptres follows 셉터 in the official Korean manual (extracted text
      lines 287-289; reference glossary entry Sceptres). The Hunter-Gatherer
      spawn label's doubled literal quotes were normalized.
      At default:45697, `while parrying` / パリィ中 becomes `(받아치기 중)`,
      distinguishing a timed parry from ordinary blocking using the
      explanations at default:41891, 51696 and 52709.
      At default:10487, localized `Sleight of
      Hand` as `손재주` by the same-file label at default:16773. At
      default:26982, followed English `to stun enemies` rather than Japanese's
      conflicting `versus paralyzed enemies`; only outer formatting changed.
      At default:58894, English's unworn-boots condition conflicts with
      Japanese's undamaged-boots condition. The existing English-led Korean
      was retained with outer parentheses; runtime semantics are unresolved.
      Existing occurrence keys, statuses, and evidence were not changed.
      No source CSV, PAK, or PAK-derived resource was modified or inspected.
    TEXT

    addendum = <<~TEXT
      # D-#{D} Edit Addendum

      #{summary}

      ## Exact Changes

      #{edits.map { |row| "- `default:#{row.fetch('ID_Linha')}`: `#{row.fetch('old')}` -> `#{row.fetch('new')}`." }.join("\n")}

      ## Candidate Dispositions

      The complete 113-row classification, aligned English/Japanese/Chinese
      evidence, before/after Korean text, and existing indexed entity/status
      snapshots are in `#{File.basename(MANIFEST)}`. Full-sentence
      parenthetical explanations/captions were retained; short condition and
      action fragments followed the Japanese outer-parenthesis format.

      #{verify_text}
    TEXT
    File.write(REPORT, report)
    File.write(ADDENDUM, addendum)
    update_checkpoint(summary, DETAIL)
    puts "D-#{D}: reviewed #{rows.length} candidates; corrected #{edits.length}; retained #{rows.length - edits.length}; updated #{index_changes} index text caches."
    puts verify_text
    puts "Backup: #{csv_backup}"
    puts "Active hashes: #{M.hashes.inspect}"
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewJapaneseParentheticalDefaultD21569.prepare
  when ['apply'] then ReviewJapaneseParentheticalDefaultD21569.apply
  else abort 'usage: review-japanese-parenthetical-default-D21569.rb [prepare|apply]'
  end
end
