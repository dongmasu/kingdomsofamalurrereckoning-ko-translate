#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewSoulbindCurseD21797
  extend self

  M = ReviewedNameBatches
  D = 21_797
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21796.tsv')
  CANDIDATES = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  CANDIDATE_HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  ENTITY = 'lore:soulbind'
  TERM_PATTERN = /(?<![A-Za-z0-9])(?:Soulbind(?:\s+Curse)?)(?![A-Za-z0-9])/i
  REPLACEMENTS = {
    '3410' => [['영혼 속박 저주', '영혼 결속 저주']],
    '18190' => [['영혼 결속 저주', '영혼 결속 저주(Soulbind Curse)']],
    '21963' => [['영혼결속 치료제', '영혼 결속(Soulbind) 치료제']],
    '29910' => [['영혼 결속 치료제', '영혼 결속(Soulbind) 치료제']],
    '32115' => [['영혼결속의 저주', '영혼 결속(Soulbind)의 저주']],
    '34443' => [['영혼 결속 저주', '영혼 결속 저주(Soulbind Curse)']],
    '36745' => [['영혼결속의 저주', '영혼 결속 저주(Soulbind Curse)']],
    '43681' => [['영혼 결속이라 부르는', '영혼 결속(Soulbind)이라 부르는']],
    '45004' => [['소울바인드로', '영혼 결속(Soulbind)으로']],
    '52078' => [['영혼 속박(Soulbind)', '영혼 결속(Soulbind)']]
  }.freeze
  EXCLUSIONS = {
    '1201' => 'Preserve terminal D-19591/D-165 row judgment; do not edit or recount it.',
    '23313' => 'Preserve terminal D-18607 finding that 영혼 결속 directly renders the source label.'
  }.freeze
  ALREADY_CANONICAL = ['61690'].freeze
  SOURCE_IDS = (REPLACEMENTS.keys + EXCLUSIONS.keys + ALREADY_CANONICAL).to_set.freeze
  SPECS = [{
    key: ENTITY,
    english: 'Soulbind',
    category: 'lore term',
    korean: '영혼 결속(Soulbind)',
    aliases: 'Soulbind Curse',
    variants: '영혼결속|영혼 속박|소울바인드|영혼 결속 저주|영혼 속박 저주',
    count: 13,
    notes: 'English repeatedly identifies Soulbind as Ticneri’s named curse and creation; the explicit Soulbind Curse labels, cure instructions, and related dialogue identify the same curse. Japanese 魂縛の呪い and Chinese 魂缚诅咒 corroborate. Use 영혼 결속(Soulbind), with Soulbind Curse as a source-attested alias and complete compound Korean labels paired in full. Do not infer gameplay mechanics. Preserve terminal D-19591/D-165 at default:1201 and D-18607 at default:23313 without changing their Korean cells or prior judgments.'
  }].freeze
  EDIT_EVIDENCE = 'English dialogue explicitly identifies Soulbind as Ticneri’s named curse, latest creation, and the condition cured by the potion; explicit Soulbind Curse labels identify the same lore term. Japanese 魂縛の呪い and Chinese 魂缚诅咒 corroborate. Use 영혼 결속(Soulbind), and pair complete compound labels as 영혼 결속 저주(Soulbind Curse). Preserve terminal D-19591/D-165 and D-18607 without reopening them.'
  CANDIDATE_DISPOSITIONS = {
    ['default', '23313', ''] => 'not-an-issue',
    ['default', '52078', ''] => 'accepted',
    ['default', '61690', ''] => 'not-an-issue',
    ['default', '18190', ''] => 'accepted',
    ['default', '36745', ''] => 'accepted',
    ['default', '3410', ''] => 'accepted'
  }.freeze

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def source_term?(text)
    text.match?(TERM_PATTERN)
  end

  def transform(_spec, row_key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "Soulbind source term missing at #{row_key.inspect}" unless
      JSON.parse(source.fetch('en_texts_json')).compact.any? { |part| source_term?(part) }
    raise "unexpected resource for Soulbind #{row_key.inspect}" unless row_key[0] == 'default'
    return [text, true] if EXCLUSIONS.key?(row_key[1])
    return [text, false] if ALREADY_CANONICAL.include?(row_key[1])

    replacements = REPLACEMENTS.fetch(row_key[1]) do
      raise "unclassified Soulbind source row #{row_key.inspect}"
    end
    updated = text.dup
    replacements.each do |before, after|
      count = updated.scan(Regexp.new(Regexp.escape(before))).length
      raise "expected one Korean span at #{row_key.inspect}, got #{count}" unless count == 1
      updated = updated.sub(before, after)
    end
    [updated, false]
  end

  def candidate_reviews(candidate_rows, inventory, index)
    candidate_map = candidate_rows.to_h { |row| [row.fetch('english_candidate'), row] }
    specifications = {
      'Soulbind' => [
        [['default', '23313', ''], 'not-an-issue'],
        [['default', '52078', ''], 'accepted'],
        [['default', '61690', ''], 'not-an-issue']
      ],
      'Soulbind Curse' => [
        [['default', '18190', ''], 'accepted'],
        [['default', '36745', ''], 'accepted'],
        [['default', '3410', ''], 'accepted']
      ]
    }
    specifications.flat_map do |term, expected|
      candidate = candidate_map.fetch(term) do
        raise "candidate missing from prior snapshot: #{term}"
      end
      actual_keys = (
        JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
        JSON.parse(candidate.fetch('paired_evidence_keys_json'))
      ).map { |parts| parts.map(&:to_s) }.uniq
      expected_keys = expected.map(&:first)
      raise "candidate memberships changed for #{term}" unless
        actual_keys.to_set == expected_keys.to_set

      expected.map do |row_key, disposition|
        source = inventory.fetch(row_key)
        {
          'english_candidate' => term,
          'disposition' => disposition,
          'resource' => row_key[0], 'ID_Linha' => row_key[1], 'Tipo_Variante' => row_key[2],
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'), 'korean' => source.fetch('work_text'),
          'evidence' => "D-#{D}: #{EDIT_EVIDENCE}",
          'prior_index_dispositions_json' => JSON.generate(
            index.select { |entry| key(entry) == row_key }.map do |entry|
              [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')]
            end
          )
        }
      end
    end
  end

  def refresh_candidate_checkpoint(candidate_rows)
    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    next_line = "Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first&.fetch('english_candidate', 'none')}`; not exhaustive or a completion estimate)."
    candidate_line = "Short-label candidate memberships: #{candidate_rows.length} reviewed; 4 accepted and 2 already canonical/terminal. Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`."
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    M::DOCS.each do |path|
      text = File.read(path)
      block = text.match(marker)&.[](0)
      raise "active checkpoint missing from #{path}" unless block
      updated = block.sub(/^Next batch:.*$/, next_line)
      updated = updated.sub(/^Next batch:.*\n/) { |line| "#{line}#{candidate_line}\n" }
      File.write(path, text.sub(marker, updated))
    end

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'proper-name residual validation failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0')
    note = <<~TEXT

      ## Refreshed Candidate Queue

      Rebuilt `proper-name-short-label-discovery-D#{D}.tsv` after registering
      the Soulbind curse term. It contains #{snapshot.length} bounded groups and
      begins with `#{snapshot.first&.fetch('english_candidate', 'none')}`; it is
      not an exhaustive remainder or completion estimate.

      Validation: #{validation.strip}
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}
    TEXT
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |filename|
      File.open(File.join(__dir__, filename), 'a') { |file| file.write(note) }
    end
    snapshot
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    prior_block = File.read(M::DOCS.first)[marker]
    raise 'D-21796 is not the active checkpoint' unless
      prior_block&.include?('Latest verified proper-name batch: D-21796 ')
    raise 'checkpoint documents differ' unless
      M::DOCS.all? { |path| File.read(path)[marker] == prior_block }
    raise 'D-21797 outputs already exist' if [
      SNAPSHOT,
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    definitions = SPECS.map do |spec|
      {
        'entity_key' => spec.fetch(:key),
        'english_canonical' => spec.fetch(:english),
        'english_aliases' => spec.fetch(:aliases)
      }
    end
    matches = build_occurrences(inventory.values, definitions).map do |row|
      [row[1], row[2], row[3]]
    end
    raise "expected 13 exact Soulbind source rows, got #{matches.length}" unless
      matches.length == 13
    source_rows = matches.map { |resource, id, variant| inventory.fetch([resource, id, variant]) }
    source_ids = source_rows.map { |row| row.fetch('ID_Linha') }.to_set
    raise 'Soulbind source classification differs' unless source_ids == SOURCE_IDS
    previews = source_rows.map do |row|
      transform(SPECS.first, key(row), row.fetch('work_text'), row)
    end
    raise 'Soulbind edit count differs' unless
      source_rows.zip(previews).count { |row, (updated, excluded)|
        !excluded && updated != row.fetch('work_text')
      } == REPLACEMENTS.length
    source_rows.each do |row|
      raise "missing aligned Japanese source at #{key(row).inspect}" if
        JSON.parse(row.fetch('ja_texts_json')).compact.empty?
      raise "missing aligned Chinese source at #{key(row).inspect}" if row.fetch('zh_text').empty?
    end

    index = M.table(M::INDEX).map(&:to_h)
    candidate_rows = candidate_reviews(
      M.table(INPUT).map(&:to_h), inventory, index
    )
    raise 'expected six Soulbind candidate memberships' unless candidate_rows.length == 6
    candidate_counts = candidate_rows.group_by { |row| row.fetch('disposition') }
                                     .transform_values(&:length)
    raise "unexpected candidate disposition counts #{candidate_counts.inspect}" unless
      candidate_counts == { 'accepted' => 4, 'not-an-issue' => 2 }
    if File.exist?(CANDIDATES)
      raise 'partial D-21797 candidate dispositions differ from reviewed source' unless
        M.table(CANDIDATES).map(&:to_h) == candidate_rows
    else
      M.write_table(CANDIDATES, CANDIDATE_HEADERS, candidate_rows)
    end

    ReviewedDiscoverySpecs.run(
      D, 'Soulbind Named Curse',
      SPECS,
      EDIT_EVIDENCE,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, row_key, text, source| transform(spec, row_key, text, source) }

    snapshot = refresh_candidate_checkpoint(candidate_rows)
    puts "D-#{D}: reviewed 13 exact source rows; corrected #{REPLACEMENTS.length} cells, preserved 2 terminal rows and 1 canonical label; next candidates=#{snapshot.length}."
  end
end

ReviewSoulbindCurseD21797.run if $PROGRAM_NAME == __FILE__
