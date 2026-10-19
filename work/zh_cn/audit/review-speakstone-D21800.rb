#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewSpeakstoneD21800
  extend self

  M = ReviewedNameBatches
  D = 21_800
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21799.tsv')
  CANDIDATES = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  CANDIDATE_HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  ENTITY = 'item:speakstone'
  TERM_PATTERN = /(?<![A-Za-z0-9])Speakstone(?![A-Za-z0-9])/i
  KEYS = [
    ['base', '299', '11'],
    ['base', '3155', '11'],
    ['default', '7770', ''],
    ['default', '28801', ''],
    ['default', '31125', ''],
    ['default', '46018', ''],
    ['default', '58110', '']
  ].freeze
  REPLACEMENTS = {
    ['base', '299', '11'] => ['말하는 돌', '발화석(Speakstone)'],
    ['base', '3155', '11'] => ['말돌', '발화석(Speakstone)'],
    ['default', '31125', ''] => ['말돌', '발화석(Speakstone)'],
    ['default', '46018', ''] => ['발화석을', '발화석(Speakstone)을'],
    ['default', '58110', ''] => ['속삭임석', '발화석(Speakstone)']
  }.freeze
  SPECS = [{
    key: ENTITY,
    english: 'Speakstone',
    category: 'item',
    korean: '발화석(Speakstone)',
    aliases: '',
    variants: '말하는 돌|말돌|속삭임석|발화석',
    count: 7,
    notes: 'English uses Speakstone for the same communication stone: the Fae Speakstone label, Weod’s story, and the interaction “Use the speakstone.” Japanese さえずり石 and Chinese 传音石 corroborate a sound/voice-transmitting stone. Reuse the established, semantically clear Korean 발화석 and pair the exact item term as 발화석(Speakstone). Include lowercase generic references to this same device but do not infer new lore or mechanics. Preserve the prior findings only for the item-name span; D-9005’s other deferred terms and all unrelated sentence questions remain open.'
  }].freeze
  EDIT_EVIDENCE = 'English anchors the identity and use of Speakstone as a communication stone; Japanese さえずり石 and Chinese 传音石 corroborate. The active corpus already uses 발화석 at default:7770, default:28801 and default:46018, so standardize the same device to 발화석(Speakstone) in all seven exact source rows, including lowercase references and Fae Speakstone. Preserve generic Fae terminology, all particles, quotes, dialogue and prior unrelated entity dispositions. Resolve only the item-name questions at default:7770 and 58110, base:299:11 and default:31125; D-9005’s other terms and broader sentence/lore findings remain open.'

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def transform(_spec, row_key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "Speakstone source term missing at #{row_key.inspect}" unless
      english.match?(TERM_PATTERN)
    raise "unexpected Speakstone source key #{row_key.inspect}" unless KEYS.include?(row_key)
    replacement = REPLACEMENTS[row_key]
    return [text, false] unless replacement

    before, after = replacement
    count = text.scan(Regexp.new(Regexp.escape(before))).length
    raise "expected one Korean Speakstone span at #{row_key.inspect}; got #{count}" unless count == 1
    [text.sub(before, after), false]
  end

  def candidate_rows(candidate, inventory, prior_index, reviewed)
    memberships = (
      JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
      JSON.parse(candidate.fetch('paired_evidence_keys_json'))
    ).map { |parts| parts.map(&:to_s) }.uniq
    expected = [
      ['base', '299', '11'], ['default', '58110', ''],
      ['default', '28801', ''], ['default', '7770', '']
    ]
    raise 'Speakstone candidate coverage differs' unless memberships.to_set == expected.to_set
    changed = reviewed.select { |row| row.fetch('old') != row.fetch('new') }
                      .map { |row| key(row) }.to_set
    index_by_key = prior_index.group_by { |row| key(row) }
    memberships.map do |row_key|
      source = inventory.fetch(row_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "Speakstone missing in candidate row #{row_key.inspect}" unless english.match?(TERM_PATTERN)
      {
        'english_candidate' => 'Speakstone',
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
    raise 'D-21799 is not the active checkpoint' unless
      prior_block&.include?('Latest verified proper-name batch: D-21799 ')
    raise 'checkpoint documents differ' unless
      M::DOCS.all? { |path| File.read(path)[marker] == prior_block }
    raise 'Speakstone output already exists' if [
      CANDIDATES, SNAPSHOT,
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    prior_index = M.table(M::INDEX).map(&:to_h)
    raise 'Speakstone glossary entity already exists' if
      M.table(File.join(__dir__, 'proper-name-glossary.tsv')).any? { |row| row['entity_key'] == ENTITY }
    hits = build_occurrences(
      inventory.values,
      SPECS.map { |spec| {
        'entity_key' => spec.fetch(:key),
        'english_canonical' => spec.fetch(:english),
        'english_aliases' => ''
      } }
    )
    raise "expected seven exact Speakstone source rows; got #{hits.length}" unless
      hits.length == KEYS.length
    raise 'Speakstone source-key scope differs' unless
      hits.map { |hit| [hit[1], hit[2], hit[3]] }.to_set == KEYS.to_set
    candidate = M.table(INPUT).map(&:to_h).find do |row|
      row.fetch('english_candidate') == 'Speakstone'
    end
    raise 'Speakstone short-label candidate missing' unless candidate
    reviewed = KEYS.map do |row_key|
      source = inventory.fetch(row_key)
      old = source.fetch('work_text')
      new_text, = transform(SPECS.first, row_key, old, source)
      { 'resource' => row_key[0], 'ID_Linha' => row_key[1],
        'Tipo_Variante' => row_key[2], 'old' => old, 'new' => new_text }
    end
    raise 'expected five Speakstone text changes' unless
      reviewed.count { |row| row.fetch('old') != row.fetch('new') } == 5
    candidate_rows = candidate_rows(candidate, inventory, prior_index, reviewed)
    raise 'expected two accepted and two already-canonical candidate memberships' unless
      candidate_rows.count { |row| row['disposition'] == 'accepted' } == 2 &&
      candidate_rows.count { |row| row['disposition'] == 'not-an-issue' } == 2

    ReviewedDiscoverySpecs.run(
      D, 'Speakstone Communication Item', SPECS, EDIT_EVIDENCE,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, row_key, text, source| transform(spec, row_key, text, source) }

    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    rows = candidate_rows(candidate, inventory, prior_index, reviewed)
    M.write_table(CANDIDATES, CANDIDATE_HEADERS, rows)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    raise 'Speakstone remains in the refreshed candidate queue' if
      snapshot.any? { |row| row['english_candidate'] == 'Speakstone' }

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'Speakstone proper-name validation failed' unless validation.include?('PASS')
    raise 'Speakstone residual audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0')
    next_line = "Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first&.fetch('english_candidate', 'none')}`; not exhaustive or a completion estimate)."
    candidate_line = "Speakstone candidate memberships: 4 reviewed; 2 accepted corrections and 2 already canonical. Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`."
    M::DOCS.each do |path|
      text = File.read(path)
      block = text[marker]
      block = block.sub(/^Next batch:.*$/, next_line)
      block = block.sub(/^Next batch:.*\n/) { |line| "#{line}#{candidate_line}\n" }
      File.write(path, text.sub(marker, block))
    end
    note = <<~TEXT

      ## D-#{D}: Speakstone Candidate Membership Review

      The four short-label memberships comprise two corrected labels and two
      already-canonical labels. The source-wide item review covers seven exact
      keys across base/default, including lower-case dialogue references. The
      chosen item form is `발화석(Speakstone)`, supported by the existing
      aligned corpus usage plus Japanese さえずり石 and Chinese 传音石.
      D-2137, D-10088 and D-17536 are resolved only for the Speakstone item
      name; D-9005's unrelated deferred terms and broader sentence/lore
      findings remain open. Full proper-name discovery remains incomplete.
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
    puts "D-#{D}: reviewed all 7 Speakstone source rows; corrected 5 cells; next candidates=#{snapshot.length}."
  end
end

ReviewSpeakstoneD21800.run if $PROGRAM_NAME == __FILE__
