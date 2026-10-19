#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21767
  extend self

  M = ReviewedNameBatches
  D = 21_767
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21766.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean proposed_korean evidence
    prior_index_dispositions_json
  ].freeze
  CANDIDATE_TERMS = %w[MERCANTILE Mercantile].freeze
  EXCLUDED_KEYS = [
    ['base', '1140', '11'],
    ['default', '6760', ''],
    ['default', '11269', ''],
    ['default', '27513', '']
  ].freeze

  SPEC = {
    key: 'skill:mercantile',
    english: 'Mercantile',
    category: 'skill',
    korean: '상술(Mercantile)',
    count: 25,
    variants: '상업|상업 기술|상술 기술|상업 훈련|상업 기술 교관|상술 스킬',
    notes: 'Review every exact case-insensitive English Mercantile hit across affix/base/default. English and its skill/training/upgrade contexts identify the named gameplay skill in 21 source rows; four commerce/business uses are explicitly excluded. The official Korean manual extraction/reference names the skill 상술(Mercantile), PDF p. 4. Aligned Japanese 商才 and Chinese 交易 corroborate the commerce skill. Annotate only direct references to the gameplay skill; do not classify generic mercantile dealings, prowess, or business descriptors as the skill. Preserve prior translation decisions, other entities, values, tokens, and line breaks.'
  }.freeze

  NOTES = {
    '482' => ['base', '11', '기술서(상업)', '상술(Mercantile) 기술서'],
    '1994' => ['default', '', '상업 기술', '상술(Mercantile) 기술'],
    '9061' => ['default', '', '상술 기술', '상술(Mercantile) 기술'],
    '13010' => ['default', '', '상업 기술', '상술(Mercantile)'],
    '14578' => ['default', '', '상술 스킬', '상술(Mercantile) 스킬'],
    '16206' => ['default', '', '상술 기술', '상술(Mercantile) 기술'],
    '16408' => ['default', '', '상업 기술', '상술(Mercantile) 기술'],
    '17987' => ['default', '', '상업 기술', '상술(Mercantile) 기술'],
    '19769' => ['default', '', '상업 훈련', '상술(Mercantile) 훈련'],
    '25640' => ['default', '', '상술', '상술(Mercantile)'],
    '25690' => ['default', '', '상술', '상술(Mercantile)'],
    '31256' => ['default', '', '상업 기술 교관', '상술(Mercantile) 기술 교관'],
    '32315' => ['default', '', '상업 기술', '상술(Mercantile) 기술'],
    '41184' => ['default', '', '상술', '상술(Mercantile)'],
    '45232' => ['default', '', '상업', '상술(Mercantile)'],
    '47644' => ['default', '', '상술 훈련', '상술(Mercantile) 훈련'],
    '52608' => ['default', '', '상업 기술', '상술(Mercantile) 기술'],
    '53885' => ['default', '', '상술 스킬', '상술(Mercantile) 스킬'],
    '54011' => ['default', '', '상술 스킬', '상술(Mercantile) 스킬'],
    '54262' => ['default', '', '상술', '상술(Mercantile)'],
    '54765' => ['default', '', '상술 기술(Mercantile)', '상술(Mercantile) 기술']
  }.freeze

  SKILL_EVIDENCE = 'English identifies Mercantile as the named gameplay skill; the official Korean manual gives 상술(Mercantile), PDF p. 4. Japanese 商才 and Chinese 交易 corroborate. Preserve the prior row finding and annotate only this skill name.'
  GENERIC_EVIDENCE = 'English uses mercantile as an ordinary commerce/business descriptor, not the named gameplay skill. Japanese and Chinese support the general trade meaning. Exclude from skill identity and preserve the existing Korean text and prior row finding.'

  def row_key(row)
    M.key(row)
  end

  def exact_skill_source?(source)
    JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        .match?(/(?<![A-Za-z])Mercantile(?![A-Za-z])/i)
  end

  def transform(_spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    hits = english.scan(/(?<![A-Za-z])Mercantile(?![A-Za-z])/i).length
    raise "Mercantile source-hit count differs at #{key.inspect}: #{hits}" unless hits == 1
    raise "unexpected non-default/base resource at #{key.inspect}" unless %w[base default].include?(key[0])

    if EXCLUDED_KEYS.include?(key)
      return [text, true]
    end

    resource, variant, old_span, new_span = NOTES.fetch(key[1]) do
      raise "unreviewed Mercantile source key #{key.inspect}"
    end
    raise "resource/variant mismatch for #{key.inspect}" unless
      resource == key[0] && variant == key[2]
    raise "expected Korean skill span missing at #{key.inspect}" unless text.include?(old_span)
    raise "canonical skill pair already present at #{key.inspect}" if text.include?('상술(Mercantile)')

    [text.sub(old_span, new_span), false]
  end

  def candidate_row(term, key, source, index_by_key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    disposition = EXCLUDED_KEYS.include?(key) ? 'excluded' : 'accepted'
    proposed, = transform(SPEC, key, source.fetch('work_text'), source)
    {
      'english_candidate' => term,
      'disposition' => disposition,
      'resource' => key[0],
      'ID_Linha' => key[1],
      'Tipo_Variante' => key[2],
      'english' => english,
      'japanese' => japanese,
      'chinese' => source.fetch('zh_text'),
      'korean' => source.fetch('work_text'),
      'proposed_korean' => proposed,
      'evidence' => disposition == 'accepted' ? SKILL_EVIDENCE : GENERIC_EVIDENCE,
      'prior_index_dispositions_json' => JSON.generate(
        index_by_key.fetch(key, []).map do |row|
          [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
        end
      )
    }
  end

  def build_candidate_reviews(inventory, index)
    expected = (NOTES.keys.map do |id|
      resource, variant = NOTES.fetch(id)
      [resource, id, variant]
    end + EXCLUDED_KEYS)
    raise 'duplicate source rows in Mercantile review scope' unless expected.uniq.length == expected.length
    index_by_key = index.group_by { |row| row_key(row) }
    reviews = expected.map do |key|
      source = inventory.fetch(key) { raise "missing aligned row #{key.inspect}" }
      raise "English Mercantile absent from #{key.inspect}" unless exact_skill_source?(source)
      candidate_row('Mercantile', key, source, index_by_key)
    end
    raise 'Mercantile scope must contain exactly 25 source rows' unless reviews.length == SPEC.fetch(:count)
    raise 'Mercantile disposition totals differ' unless
      reviews.group_by { |row| row.fetch('disposition') }.transform_values(&:length) ==
        { 'accepted' => 21, 'excluded' => 4 }
    reviews
  end

  def snapshot_summary(snapshot)
    term = snapshot.first&.fetch('english_candidate', 'none')
    "Next batch: D-#{D + 1}; continue short-label review from `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; begins `#{term}`; not exhaustive or a completion estimate)."
  end

  def checkpoint_details(snapshot)
    hashes = M.hashes
    backups = {
      'affix' => [21_762, 12],
      'base' => [D, 1],
      'default' => [D, 20]
    }
    backup_lines = backups.map do |resource, (batch, cells)|
      path = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{batch}/locatexts_zh_cn.koalocatext_#{resource}.csv"
      before = Digest::SHA256.file(path).hexdigest
      "- #{resource}: #{cells} cells; pre `#{before}`; post `#{hashes.fetch(resource)}`; backup `#{path}`."
    end.join("\n")
    index = M.table(M::INDEX)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    inventory_hash = Digest::SHA256.file(M::INVENTORY).hexdigest
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    glossary_hash = Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest
    candidate_lines = <<~TEXT
      Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
    TEXT
    <<~TEXT

      #{candidate_lines.rstrip}
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      Last actual CSV-edit backups:
      #{backup_lines}
      Aligned inventory: 73430 rows; SHA-256 `#{inventory_hash}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_hash}`.
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{glossary_hash}`.
      Report: `work/zh_cn/audit/named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D#{D}.tsv`.
      Bounded candidate groups remaining: #{snapshot.length}; next is `#{snapshot.first&.fetch('english_candidate', 'none')}`.
    TEXT
  end

  def update_checkpoint(path, snapshot)
    text = File.read(path)
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    active = text[marker]
    details_marker = /<!-- proper-name-checkpoint-details:start -->.*?<!-- proper-name-checkpoint-details:end -->/m
    details = checkpoint_details(snapshot)
    if active
      active.gsub!(details_marker, '')
      active.sub!(/^Next batch:.*$/, snapshot_summary(snapshot))
      active.sub!(
        /<!-- current-proper-name-batch:end -->/,
        "<!-- proper-name-checkpoint-details:start -->#{details}<!-- proper-name-checkpoint-details:end -->\n"
      )
      text.sub!(marker, "#{active}<!-- current-proper-name-batch:end -->")
    else
      candidate_lines = details.delete_prefix("\n")
      text.sub!(/^Next batch:.*$/, "#{snapshot_summary(snapshot)}\n#{candidate_lines.rstrip}") ||
        raise("next-batch line missing in #{path}")
    end
    File.write(path, text)
  end

  def candidate_note(snapshot)
    <<~TEXT

      Short-label audit: merged the case-insensitive `MERCANTILE` and
      `Mercantile` groups. Reviewed all 25 exact English source rows:
      accepted the 21 gameplay-skill references as `상술(Mercantile)` and
      excluded four ordinary commerce/business uses. The standalone and
      paired label candidates are covered by this source-wide scope.
      Candidate disposition manifest:
      `proper-name-short-label-dispositions-D#{D}.tsv`.
      Remaining bounded candidate groups: #{snapshot.length}, beginning
      `#{snapshot.first&.fetch('english_candidate', 'none')}`; this is not an
      exhaustive completion estimate.
    TEXT
  end

  def finalize_existing
    raise 'D-21767 report or edit manifest is missing' unless
      File.file?(File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")) &&
      File.file?(File.join(__dir__, "proper-name-edits-D#{D}.tsv"))
    raise 'D-21767 candidate disposition manifest is missing' unless File.file?(OUTPUT)

    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    if File.exist?(SNAPSHOT)
      actual_snapshot = CSV.read(SNAPSHOT, headers: true, col_sep: "\t")
      raise 'existing D-21767 candidate snapshot differs from rebuilt snapshot' unless
        actual_snapshot.map(&:to_h) == snapshot
    else
      M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    end

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    verify = M.command!('ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
                        '--review', File.join(__dir__, "proper-name-edits-D#{D}.tsv"),
                        '--backup-dir', "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}")
    raise 'proper-name index validation failed' unless validation.include?('PASS')
    raise 'proper-name residual audit failed' unless residual.include?('missing=0') &&
      residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')
    validation_note = <<~TEXT

      D-#{D} final verification: PASS.
      #{validation.strip}
      #{verify.strip}
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}
    TEXT

    note = candidate_note(snapshot)
    paths = M::DOCS + [
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ]
    paths.each do |path|
      update_checkpoint(path, snapshot)
      existing = File.read(path)
      File.write(path, existing + note) unless existing.include?(note.strip)
      existing = File.read(path)
      File.write(path, existing + validation_note) unless existing.include?("D-#{D} final verification: PASS.")
    end
    puts "D-#{D}: candidate snapshot finalized; #{snapshot.length} bounded groups remain."
  end

  def run
    if File.exist?(OUTPUT)
      return finalize_existing
    end
    raise "D-#{D} candidate snapshot exists without its disposition manifest" if File.exist?(SNAPSHOT)

    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    candidate_reviews = build_candidate_reviews(inventory, index)
    original_candidates = M.table(INPUT).map(&:to_h)
    found_terms = original_candidates.select do |row|
      CANDIDATE_TERMS.any? { |term| row.fetch('english_candidate').casecmp?(term) }
    end
    raise 'expected overlapping MERCANTILE short-label groups not found' unless found_terms.length == 2
    short_label_keys = found_terms.flat_map do |row|
      %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
        JSON.parse(row.fetch(field)).map { |parts| parts.map(&:to_s) }
      end
    end.uniq
    raise 'case-insensitive short-label source coverage differs' unless
      short_label_keys.sort == [['default', '25690', ''], ['default', '45232', ''], ['default', '54765', '']].sort

    M.write_table(OUTPUT, HEADERS, candidate_reviews)
    ReviewedDiscoverySpecs.run(
      D, 'Mercantile Named Skill', [SPEC],
      'D-21767 merges the case-insensitive `MERCANTILE`/`Mercantile` candidate groups and reviews every exact English source hit. The 21 skill contexts are registered as skill:mercantile; four ordinary commerce/business descriptors are excluded. Existing translation judgments and historical totals are preserved.',
      '## D-21766: Generic Lorestone Label Exclusions',
      &method(:transform)
    )

    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    note = candidate_note(snapshot)
    checkpoint_paths = M::DOCS + [
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ]
    checkpoint_paths.each do |path|
      update_checkpoint(path, snapshot)
      File.write(path, File.read(path) + note)
    end
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + note) unless File.read(path).include?(note.strip)
    end
    puts "D-#{D}: accepted 21 Mercantile skill rows, excluded 4 generic rows; #{snapshot.length} candidate groups remain."
  end
end

ReviewShortLabelCandidatesD21767.run if $PROGRAM_NAME == __FILE__
