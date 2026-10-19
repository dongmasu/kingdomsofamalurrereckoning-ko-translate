#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewSouthernLightsD21798
  extend self

  M = ReviewedNameBatches
  D = 21_798
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21797.tsv')
  CANDIDATES = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  CANDIDATE_HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  ENTITY = 'lore:southern-lights'
  TERM_PATTERN = /(?<![A-Za-z0-9])Southern Lights(?![A-Za-z0-9])/i
  REPLACEMENTS = {
    '9739' => [['오로라', '남극광(Southern Lights)']],
    '12143' => [['남쪽 오로라', '남극광(Southern Lights)']],
    '42656' => [['남극광을', '남극광(Southern Lights)을']],
    '51561' => [['남쪽의 빛', '남극광(Southern Lights)']],
    '54539' => [['남쪽 빛(Southern Lights)', '남극광(Southern Lights)']]
  }.freeze
  SPECS = [{
    key: ENTITY,
    english: 'Southern Lights',
    category: 'lore term',
    korean: '남극광(Southern Lights)',
    aliases: '',
    variants: '오로라|남쪽 오로라|남극광|남쪽의 빛|남쪽 빛',
    count: 5,
    notes: 'Every exact English source hit refers to the visible Southern Lights: default:42656 explicitly says the speaker hopes to spot them, while the aligned Japanese uses オーロラ in all five rows. Chinese renders the name literally as southern light(s). This is the southern-hemisphere aurora, so use 남극광(Southern Lights); do not infer a faction or people from the rhetorical list at default:54539. The Korean astronomical terminology list maps Aurora Australis to 남극광. Resolve only the term questions D-3546/default:12143, D-13055/default:42656, and D-15704/default:51561; do not close D-16512’s separate dialogue questions.'
  }].freeze
  EDIT_EVIDENCE = 'English is the meaning anchor. All five exact hits use Southern Lights for the visible phenomenon; default:42656 explicitly says the speaker hopes to spot it. Japanese uses オーロラ throughout and Chinese renders it as southern light(s). Use the established Korean astronomical term 남극광(Southern Lights), not a faction/person classification. Resolve only the term questions at default:12143, default:42656, and default:51561; keep D-16512’s separate dialogue questions open.'

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def transform(_spec, row_key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "Southern Lights source term missing at #{row_key.inspect}" unless english.match?(TERM_PATTERN)
    raise "unexpected resource for Southern Lights #{row_key.inspect}" unless row_key[0] == 'default'
    replacements = REPLACEMENTS.fetch(row_key[1]) do
      raise "unclassified Southern Lights source row #{row_key.inspect}"
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
    candidate = candidate_rows.find { |row| row.fetch('english_candidate') == 'Southern Lights' }
    raise 'Southern Lights candidate missing from D-21797 snapshot' unless candidate
    keys = (
      JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
      JSON.parse(candidate.fetch('paired_evidence_keys_json'))
    ).map { |parts| parts.map(&:to_s) }.uniq
    expected = [
      ['default', '9739', ''], ['default', '12143', ''],
      ['default', '51561', ''], ['default', '54539', '']
    ]
    raise 'Southern Lights candidate memberships changed' unless
      keys.to_set == expected.to_set
    keys.map do |row_key|
      source = inventory.fetch(row_key)
      {
        'english_candidate' => 'Southern Lights',
        'disposition' => 'accepted',
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

  def refresh_candidate_checkpoint(candidate_rows)
    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    next_line = "Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first&.fetch('english_candidate', 'none')}`; not exhaustive or a completion estimate)."
    candidate_line = "Short-label candidate memberships: #{candidate_rows.length} reviewed; 4 accepted corrections. Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`."
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
      the Southern Lights phenomenon. It contains #{snapshot.length} bounded
      groups and begins with
      `#{snapshot.first&.fetch('english_candidate', 'none')}`; it is not an
      exhaustive remainder or completion estimate.

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
    raise 'D-21797 is not the active checkpoint' unless
      prior_block&.include?('Latest verified proper-name batch: D-21797 ')
    raise 'checkpoint documents differ' unless
      M::DOCS.all? { |path| File.read(path)[marker] == prior_block }
    raise 'D-21798 outputs already exist' if [
      SNAPSHOT,
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    definitions = SPECS.map do |spec|
      {
        'entity_key' => spec.fetch(:key),
        'english_canonical' => spec.fetch(:english),
        'english_aliases' => spec.fetch(:aliases, '')
      }
    end
    hits = build_occurrences(inventory.values, definitions)
    raise "expected five exact Southern Lights source rows, got #{hits.length}" unless
      hits.length == 5
    rows = hits.map { |hit| inventory.fetch([hit[1], hit[2], hit[3]]) }
    raise 'Southern Lights source-key coverage differs' unless
      rows.map { |row| row.fetch('ID_Linha') }.to_set == REPLACEMENTS.keys.to_set
    rows.each do |row|
      raise "missing aligned Japanese source at #{key(row).inspect}" unless
        JSON.parse(row.fetch('ja_texts_json')).compact.any? { |text| text.include?('オーロラ') }
      raise "missing aligned Chinese source at #{key(row).inspect}" if row.fetch('zh_text').empty?
      transform(SPECS.first, key(row), row.fetch('work_text'), row)
    end

    index = M.table(M::INDEX).map(&:to_h)
    candidate_rows = candidate_reviews(
      M.table(INPUT).map(&:to_h), inventory, index
    )
    raise 'expected four Southern Lights candidate memberships' unless candidate_rows.length == 4
    if File.exist?(CANDIDATES)
      raise 'partial D-21798 candidate dispositions differ from reviewed source' unless
        M.table(CANDIDATES).map(&:to_h) == candidate_rows
    else
      M.write_table(CANDIDATES, CANDIDATE_HEADERS, candidate_rows)
    end

    ReviewedDiscoverySpecs.run(
      D, 'Southern Lights Aurora Australis',
      SPECS,
      EDIT_EVIDENCE,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, row_key, text, source| transform(spec, row_key, text, source) }

    snapshot = refresh_candidate_checkpoint(candidate_rows)
    puts "D-#{D}: reviewed all 5 exact source rows; standardized #{REPLACEMENTS.length} labels; next candidates=#{snapshot.length}."
  end
end

ReviewSouthernLightsD21798.run if $PROGRAM_NAME == __FILE__
