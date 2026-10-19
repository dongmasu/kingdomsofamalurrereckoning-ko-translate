#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewSpidersacIchorD21801
  extend self

  M = ReviewedNameBatches
  D = 21_801
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21800.tsv')
  CANDIDATES = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  CANDIDATE_HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  ENTITY = 'item:spidersac-ichor'
  TERM_PATTERN = /(?<![A-Za-z0-9])Spidersac Ichor(?![A-Za-z0-9])/i
  KEYS = [
    ['base', '3552', '11'],
    ['default', '8633', ''],
    ['default', '19569', ''],
    ['default', '30807', ''],
    ['default', '44368', ''],
    ['default', '45168', ''],
    ['default', '51518', '']
  ].freeze
  REPLACEMENTS = {
    ['base', '3552', '11'] => ['거미 주머니 이코르', '거미낭 이코르(Spidersac Ichor)'],
    ['default', '19569', ''] => ['거미낭 이코르', '거미낭 이코르(Spidersac Ichor)'],
    ['default', '30807', ''] => ['거미 주머니의 진액', '거미낭 이코르(Spidersac Ichor)'],
    ['default', '44368', ''] => ['거미 주머니의 진액', '거미낭 이코르(Spidersac Ichor)'],
    ['default', '45168', ''] => ['거미 주머니의 이코르', '거미낭 이코르(Spidersac Ichor)'],
    ['default', '51518', ''] => ['거미주머니 진액', '거미낭 이코르(Spidersac Ichor)']
  }.freeze
  SPECS = [{
    key: ENTITY,
    english: 'Spidersac Ichor',
    category: 'item',
    korean: '거미낭 이코르(Spidersac Ichor)',
    aliases: '',
    variants: '거미 주머니 이코르|거미낭 이코르|거미 주머니의 진액|거미 주머니의 이코르|거미주머니 진액',
    count: 7,
    notes: 'English identifies the same named reagent across capitalized inventory/quest labels and lowercase dialogue mentions. Japanese uses イコル in some rows and 蜘蛛の分泌液 in others; Chinese 蜘蛛囊液 corroborates the spider-sac substance. Existing Korean default:8633 already uses 거미낭 이코르(Spidersac Ichor), while D-6169 and D-19995 establish retaining the lore-specific 이코르 rather than generic 진액/혈액. Standardize all seven exact item references to 거미낭 이코르(Spidersac Ichor). Do not alter Fennwrac, grist, Jottun, or broader recipe/dialogue judgments. D-9980 and D-13832 are resolved only for this ingredient term; preserve their other open ingredient findings.'
  }].freeze
  EDIT_EVIDENCE = 'English is the meaning anchor for the same named Spidersac Ichor ingredient in inventory labels and lowercase dialogue. Japanese イコル supports the lore-specific “ichor” term where explicit and Japanese 蜘蛛の分泌液 plus Chinese 蜘蛛囊液 corroborate the substance. Reuse existing Korean 거미낭 이코르 at default:8633 and standardize all seven exact references to 거미낭 이코르(Spidersac Ichor). Do not change Fennwrac, grist, Jottun, quantities, or sentence wording. Resolve the name/ingredient term only; preserve D-9980/D-13832 questions about the other ingredients and all other prior decisions.'

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def transform(_spec, row_key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "Spidersac Ichor source term missing at #{row_key.inspect}" unless
      english.match?(TERM_PATTERN)
    raise "unexpected Spidersac Ichor source key #{row_key.inspect}" unless KEYS.include?(row_key)
    replacement = REPLACEMENTS[row_key]
    return [text, false] unless replacement

    before, after = replacement
    count = text.scan(Regexp.new(Regexp.escape(before))).length
    raise "expected one Korean Spidersac Ichor span at #{row_key.inspect}; got #{count}" unless count == 1
    [text.sub(before, after), false]
  end

  def build_candidate_rows(candidate, inventory, prior_index, reviewed)
    memberships = (
      JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
      JSON.parse(candidate.fetch('paired_evidence_keys_json'))
    ).map { |parts| parts.map(&:to_s) }.uniq
    expected = [
      ['base', '3552', '11'], ['default', '19569', ''],
      ['default', '51518', ''], ['default', '8633', '']
    ]
    raise 'Spidersac Ichor candidate coverage differs' unless memberships.to_set == expected.to_set
    changed = reviewed.select { |row| row.fetch('old') != row.fetch('new') }
                      .map { |row| key(row) }.to_set
    index_by_key = prior_index.group_by { |row| key(row) }
    memberships.map do |row_key|
      source = inventory.fetch(row_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "Spidersac Ichor missing in candidate row #{row_key.inspect}" unless
        english.match?(TERM_PATTERN)
      {
        'english_candidate' => 'Spidersac Ichor',
        'disposition' => changed.include?(row_key) ? 'accepted' : 'not-an-issue',
        'resource' => row_key[0], 'ID_Linha' => row_key[1], 'Tipo_Variante' => row_key[2],
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
        'chinese' => source.fetch('zh_text'),
        'korean' => source.fetch('work_text'),
        'evidence' => "D-#{D}: #{EDIT_EVIDENCE}",
        'prior_index_dispositions_json' => JSON.generate(
          index_by_key.fetch(row_key, []).map do |entry|
            [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')]
          end
        )
      }
    end
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    prior_block = File.read(M::DOCS.first)[marker]
    raise 'D-21800 is not the active checkpoint' unless
      prior_block&.include?('Latest verified proper-name batch: D-21800 ')
    raise 'checkpoint documents differ' unless
      M::DOCS.all? { |path| File.read(path)[marker] == prior_block }
    raise 'Spidersac Ichor output already exists' if [
      CANDIDATES, SNAPSHOT,
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    prior_index = M.table(M::INDEX).map(&:to_h)
    raise 'Spidersac Ichor glossary entity already exists' if
      M.table(File.join(__dir__, 'proper-name-glossary.tsv')).any? { |row| row['entity_key'] == ENTITY }
    definitions = SPECS.map do |spec|
      {
        'entity_key' => spec.fetch(:key),
        'english_canonical' => spec.fetch(:english),
        'english_aliases' => ''
      }
    end
    hits = build_occurrences(inventory.values, definitions)
    raise "expected seven Spidersac Ichor source rows; got #{hits.length}" unless
      hits.length == KEYS.length
    raise 'Spidersac Ichor source-key coverage differs' unless
      hits.map { |hit| [hit[1], hit[2], hit[3]] }.to_set == KEYS.to_set
    candidate = M.table(INPUT).map(&:to_h).find do |row|
      row.fetch('english_candidate') == 'Spidersac Ichor'
    end
    raise 'Spidersac Ichor short-label candidate missing' unless candidate
    reviewed = KEYS.map do |row_key|
      source = inventory.fetch(row_key)
      old = source.fetch('work_text')
      new_text, = transform(SPECS.first, row_key, old, source)
      { 'resource' => row_key[0], 'ID_Linha' => row_key[1],
        'Tipo_Variante' => row_key[2], 'old' => old, 'new' => new_text }
    end
    raise 'expected six Spidersac Ichor text changes' unless
      reviewed.count { |row| row.fetch('old') != row.fetch('new') } == 6
    candidate_rows = build_candidate_rows(candidate, inventory, prior_index, reviewed)
    raise 'expected three accepted and one already-canonical candidate membership' unless
      candidate_rows.count { |row| row['disposition'] == 'accepted' } == 3 &&
      candidate_rows.count { |row| row['disposition'] == 'not-an-issue' } == 1

    ReviewedDiscoverySpecs.run(
      D, 'Spidersac Ichor Alchemical Reagent', SPECS, EDIT_EVIDENCE,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, row_key, text, source| transform(spec, row_key, text, source) }

    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    rows = build_candidate_rows(candidate, inventory, prior_index, reviewed)
    M.write_table(CANDIDATES, CANDIDATE_HEADERS, rows)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    raise 'Spidersac Ichor remains in the refreshed candidate queue' if
      snapshot.any? { |row| row['english_candidate'] == 'Spidersac Ichor' }

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'Spidersac Ichor proper-name validation failed' unless validation.include?('PASS')
    raise 'Spidersac Ichor residual audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0')
    next_line = "Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first&.fetch('english_candidate', 'none')}`; not exhaustive or a completion estimate)."
    candidate_line = "Spidersac Ichor candidate memberships: 4 reviewed; 3 accepted corrections and 1 already canonical. Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`."
    M::DOCS.each do |path|
      text = File.read(path)
      block = text[marker]
      block = block.sub(/^Next batch:.*$/, next_line)
      block = block.sub(/^Next batch:.*\n/) { |line| "#{line}#{candidate_line}\n" }
      File.write(path, text.sub(marker, block))
    end
    note = <<~TEXT

      ## D-#{D}: Spidersac Ichor Candidate Membership Review

      The four short-label memberships include three corrected translations
      and one already-canonical entry. The source-wide item review covers all
      seven exact references, including lowercase dialogue. Use
      `거미낭 이코르(Spidersac Ichor)`, retaining the attested lore term
      `이코르` rather than generic “fluid/blood.” D-6169 and D-15696 are
      superseded only for this item-name choice. D-9980, D-13832, D-20499 and
      D-20501 retain their unrelated Fennwrac/grist/Jottun findings. Full
      proper-name discovery remains incomplete.
    TEXT
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |name|
      File.open(File.join(__dir__, name), 'a') do |file|
        file.write("\n#{note}\nCandidate validation: #{validation.strip}\n")
        file.write("Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}\n")
      end
    end
    %w[README.md decision-register-20261009.md].each do |name|
      path = File.join(__dir__, name)
      text = File.read(path)
      text = text.sub("<!-- current-proper-name-batch:start -->",
                      "#{note}\n<!-- current-proper-name-batch:start -->")
      File.write(path, text)
    end
    puts "D-#{D}: reviewed all 7 Spidersac Ichor source rows; corrected 6 cells; next candidates=#{snapshot.length}."
  end
end

ReviewSpidersacIchorD21801.run if $PROGRAM_NAME == __FILE__
