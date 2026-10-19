#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewSylvaniteD21805
  extend self

  M = ReviewedNameBatches
  D = 21_805
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21804.tsv')
  DISPOSITIONS = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  BASE_IDS = %w[
    854 919 1141 1616 1623 1927 2155 2213 2394 3024 3168 3376 3611 3850 4078
  ].freeze
  AFFIX_TYPES = %w[11 12 14 21 22 24].freeze
  DEFAULT_IDS = %w[3476 4730 30434].freeze
  SOURCE_KEYS = (
    AFFIX_TYPES.map { |variant| ['affix', '30', variant] } +
    BASE_IDS.map { |id| ['base', id, '11'] } +
    DEFAULT_IDS.map { |id| ['default', id, ''] }
  ).freeze
  CANDIDATE_KEYS = (
    AFFIX_TYPES.map { |variant| ['affix', '30', variant] } +
    [['default', '30434', ''], ['default', '3476', ''], ['default', '4730', '']]
  ).freeze
  ENTITY = 'resource:sylvanite'
  TERM_PATTERN = /(?<![A-Za-z0-9])Sylvanite(?![A-Za-z0-9])/i
  CANONICAL = '실바나이트(Sylvanite)'
  SPECS = [{
    key: ENTITY,
    english: 'Sylvanite',
    category: 'resource',
    korean: CANONICAL,
    aliases: '',
    variants: '실바나이트',
    count: 24,
    notes: 'English identifies Sylvanite as the same named mineral/resource in six affix variants, fifteen equipment/resource labels, and three default rows. Japanese シルバナイト corroborates the mineral name; Chinese 针碲金银矿 and shorter 金银矿 forms corroborate the ore/resource reading. Use 실바나이트(Sylvanite), annotating only the exact material term in longer labels and dialogue. Preserve all surrounding item wording and the two default rows already paired. D-724 is superseded only for the Sylvanite name spelling at default:3476; its necklace-quality and crude-rune questions remain open. D-9867 is narrowed only for this exact Sylvanite label at default:30434; its other named-term questions remain unchanged. Default:8646 contains Korean 실바나이트 but English says lower-case “sylvan spear,” not Sylvanite; it is not an occurrence of this entity and remains outside this proper-name correction.'
  }].freeze
  EDIT_EVIDENCE = 'English is the meaning and identity anchor for the named mineral/resource Sylvanite across affix/base/default. Japanese シルバナイト corroborates the name; Chinese 针碲金银矿 and 金银矿 corroborate its ore/material reading. Reuse the consistent Korean 실바나이트 and pair the term as 실바나이트(Sylvanite), changing only the term span in six affix variants, fifteen base labels, and default:30434. Default:3476 and 4730 are already paired and remain unchanged. Default:8646 is expressly outside this entity scope because English says lower-case “sylvan spear,” not Sylvanite. Preserve all other item labels, sentences, particles and tokens.'
  ACCEPTED_CANDIDATES = (
    AFFIX_TYPES.map { |variant| ['affix', '30', variant] } +
    [['default', '30434', '']]
  ).freeze

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def transform(_spec, row_key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "Sylvanite source term missing at #{row_key.inspect}" unless
      english.match?(TERM_PATTERN)
    raise "unexpected Sylvanite source key #{row_key.inspect}" unless SOURCE_KEYS.include?(row_key)
    count = text.scan('실바나이트').length
    raise "expected one Korean Sylvanite term at #{row_key.inspect}; got #{count}" unless count == 1
    return [text, false] if text.include?(CANONICAL)

    [text.sub('실바나이트', CANONICAL), false]
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    prior = File.read(M::DOCS.first)[marker]
    raise 'D-21804 is not the active checkpoint' unless
      prior&.include?('Latest verified proper-name batch: D-21804 ')
    raise 'active checkpoint documents differ' unless
      M::DOCS.all? { |path| File.read(path)[marker] == prior }
    raise 'candidate output already exists' if File.exist?(DISPOSITIONS)

    inventory = M.refresh_inventory
    candidate = M.table(INPUT).map(&:to_h).find do |row|
      row.fetch('english_candidate') == 'Sylvanite'
    end
    raise 'Sylvanite short-label candidate missing' unless candidate
    candidate_members = (
      JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
      JSON.parse(candidate.fetch('paired_evidence_keys_json'))
    ).map { |parts| parts.map(&:to_s) }.uniq
    raise 'Sylvanite short-label membership changed' unless
      candidate_members.to_set == CANDIDATE_KEYS.to_set
    hits = inventory.values.select do |row|
      JSON.parse(row.fetch('en_texts_json')).compact.join("\n").match?(TERM_PATTERN)
    end.map { |row| key(row) }.to_set
    raise "Sylvanite all-resource coverage differs: #{hits.length}" unless
      hits == SOURCE_KEYS.to_set && hits.length == 24
    raise 'Sylvanite glossary entity already exists' if
      M.table(File.join(__dir__, 'proper-name-glossary.tsv')).any? do |row|
        row['entity_key'] == ENTITY
      end

    reviewed = SOURCE_KEYS.map do |row_key|
      source = inventory.fetch(row_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      raise "missing aligned Japanese at #{row_key.inspect}" if japanese.empty?
      [row_key, source, english]
    end
    raise 'English Sylvanite candidate does not align with mineral label' unless
      reviewed.all? { |_row_key, _source, english| english.match?(TERM_PATTERN) }

    ReviewedDiscoverySpecs.run(
      D, 'Sylvanite Mineral And Material Name', SPECS, EDIT_EVIDENCE,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, row_key, text, source| transform(spec, row_key, text, source) }

    refreshed = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    index_by_key = index.group_by { |row| key(row) }
    candidate_rows = CANDIDATE_KEYS.sort_by do |parts|
      [M::RESOURCES.index(parts[0]), parts[1].to_i, parts[2]]
    end.map do |parts|
      source = refreshed.fetch(parts)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      disposition = ACCEPTED_CANDIDATES.include?(parts) ? 'accepted' : 'not-an-issue'
      {
        'english_candidate' => 'Sylvanite',
        'disposition' => disposition,
        'resource' => parts[0], 'ID_Linha' => parts[1], 'Tipo_Variante' => parts[2],
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'korean' => source.fetch('work_text'),
        'evidence' => "D-#{D}: #{EDIT_EVIDENCE}",
        'prior_index_dispositions_json' => JSON.generate(
          index_by_key.fetch(parts, []).map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        )
      }
    end
    raise 'Sylvanite candidate disposition counts differ' unless
      candidate_rows.count { |row| row['disposition'] == 'accepted' } == 7 &&
      candidate_rows.count { |row| row['disposition'] == 'not-an-issue' } == 2
    M.write_table(DISPOSITIONS, HEADERS, candidate_rows)

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(refreshed.values, glossary, index)
    snapshot_path = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
    M.write_table(snapshot_path, ShortLabelDiscovery20261018::HEADERS, snapshot)
    raise 'Sylvanite remains in refreshed candidate queue' if
      snapshot.any? { |row| row.fetch('english_candidate') == 'Sylvanite' }
    next_line = "Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first&.fetch('english_candidate', 'none')}`; not exhaustive or a completion estimate)."
    candidate_line = "Sylvanite candidate memberships: 9 reviewed; 7 corrected and 2 already canonical. The source-wide resource review covered 24 exact keys. Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`."
    M::DOCS.each do |path|
      text = File.read(path)
      block = text[marker]
      block = block.sub(/^Next batch:.*$/, next_line)
      block = block.sub(/^(Next batch:.*\n)/, "\\1#{candidate_line}\n")
      File.write(path, text.sub(marker, block))
    end
    note = <<~TEXT

      ## D-#{D}: Sylvanite Candidate Membership Review

      The English-led all-resource review covered 24 exact `Sylvanite`
      occurrences: six affix variants, fifteen base labels, and three default
      rows. Standardize the material term as `실바나이트(Sylvanite)`. The two
      already paired default lines remain unchanged. Candidate dispositions:
      `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.

      D-724 is superseded only for Sylvanite's name spelling at default:3476;
      its necklace-quality and crude-rune questions remain open. D-9867 is
      narrowed only for the exact Sylvanite label at default:30434; other
      named-term questions remain unchanged.

      Scope note: Korean default:8646 says `실바나이트 창`, while English
      says lower-case `sylvan spear`; that is not a Sylvanite source match
      and was not altered in this proper-name batch.
    TEXT
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |name|
      path = File.join(__dir__, name)
      File.open(path, 'a') { |file| file.write(note) }
      text = File.read(path)
      File.write(path, text.sub(/^Next batch:.*$/, next_line))
    end
    %w[README.md decision-register-20261009.md].each do |name|
      File.open(File.join(__dir__, name), 'a') { |file| file.write(note) }
    end
    puts "D-#{D}: reviewed 24 Sylvanite source keys; standardized #{candidate_rows.count { |row| row['disposition'] == 'accepted' }} candidate memberships; prior unrelated decisions preserved."
  end
end

ReviewSylvaniteD21805.run if $PROGRAM_NAME == __FILE__
