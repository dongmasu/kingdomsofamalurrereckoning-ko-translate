#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewNamedResidualsD21770
  extend self

  M = ReviewedNameBatches
  D = 21_770
  SHORT_INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21769.tsv')
  SHORT_OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SHORT_SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  SHORT_HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  PREVIOUS_MARKER = '## D-21769: Generic Labels And Existing Person Name'
  SPECS = [
    {
      key: 'place:memory-walk',
      english: 'Memory Walk',
      category: 'place',
      korean: '기억의 길(Memory Walk)',
      aliases: '',
      variants: '추억의 길|메모리 워크|기억의 길',
      count: 7,
      notes: 'English explicitly calls Memory Walk a place and repeatedly gives it a stable definite name; the ambassador walks there and its inhabitants distinguish it as a place for their kind. Japanese 追憶の道 and Chinese 记忆长廊/记忆漫步 corroborate the place and path sense. Reuse the established Korean pair 기억의 길(Memory Walk), replacing only the exact name span. Preserve prior sentence judgments, including D-18561, without recounting them.'
    },
    {
      key: 'monster:mountain-barghest',
      english: 'Mountain Barghest',
      category: 'monster',
      korean: '산악 바게스트(Mountain Barghest)',
      aliases: 'Mountain Barghests',
      variants: '산 바게스트|산악 바르게스트|산악 바게스트(Barghest)',
      count: 5,
      notes: 'English identifies Mountain Barghest as a distinct qualified creature, contrasted with flatland cousins and supplying its characteristic tears. Japanese マウンテン・バーゲスト and Chinese 山地魔狼 corroborate the qualified monster name. Reuse the established Barghest spelling 바게스트, pair the full qualified English name, and keep this subtype separate from monster:barghest and monster:paragon-barghest. Existing Barghest-row decisions are not reopened or recounted.'
    },
    {
      key: 'place:mel-senshir-jail',
      english: 'Mel Senshir Jail',
      category: 'place',
      korean: '멜 센시르 감옥(Mel Senshir Jail)',
      aliases: '',
      variants: '멜 센시르(Mel Senshir) 감옥|멜 센시르 감옥',
      count: 4,
      notes: 'English uses Mel Senshir Jail as a specific map/location label and directly points out the jail as a place behind the speaker. Japanese メル・センシアの監獄 and Chinese 梅尔森溪监狱 corroborate the site. Reuse the established Mel Senshir spelling and pair the complete site name, without nested Mel Senshir parentheses. Preserve the existing place:mel-senshir and sentence-level findings, including D-17734, without recounting.'
    }
  ].freeze
  EDITS = {
    ['default', '10036', ''] => ['추억의 길', '기억의 길(Memory Walk)'],
    ['default', '44869', ''] => ['추억의 길', '기억의 길(Memory Walk)'],
    ['default', '47782', ''] => ['기억의 길', '기억의 길(Memory Walk)'],
    ['default', '49278', ''] => ['기억의 길', '기억의 길(Memory Walk)'],
    ['default', '64812', ''] => ['메모리 워크', '기억의 길(Memory Walk)'],
    ['default', '7656', ''] => ['산악 바르게스트(Mountain Barghest)', '산악 바게스트(Mountain Barghest)'],
    ['default', '22438', ''] => ['산 바게스트(Barghest)', '산악 바게스트(Mountain Barghest)'],
    ['default', '43056', ''] => ['산 바게스트(Barghest)', '산악 바게스트(Mountain Barghest)'],
    ['default', '43349', ''] => ['산 바게스트(Barghest)', '산악 바게스트(Mountain Barghest)'],
    ['default', '46413', ''] => ['산악 바게스트(Barghest)', '산악 바게스트(Mountain Barghest)'],
    ['base', '3747', '11'] => ['멜 센시르(Mel Senshir) 감옥', '멜 센시르 감옥(Mel Senshir Jail)'],
    ['default', '11391', ''] => ['멜 센시르(Mel Senshir) 감옥', '멜 센시르 감옥(Mel Senshir Jail)'],
    ['default', '57860', ''] => ['멜 센시르(Mel Senshir) 감옥', '멜 센시르 감옥(Mel Senshir Jail)'],
    ['default', '60745', ''] => ['멜 센시르(Mel Senshir) 감옥(Mel Senshir Jail)', '멜 센시르 감옥(Mel Senshir Jail)']
  }.freeze

  def transform(spec, key, text, source)
    term = spec.fetch(:english)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    source_terms = [term, *spec.fetch(:aliases, '').split('|')].reject(&:empty?)
    present = source_terms.any? do |source_term|
      english.match?(/(?<![A-Za-z])#{Regexp.escape(source_term)}(?![A-Za-z])/i)
    end
    raise "English #{term} absent at #{key.inspect}" unless present
    edit = EDITS[key]
    return [text, false] unless edit

    old_span, new_span = edit
    raise "unexpected old Korean span at #{key.inspect}" unless text.include?(old_span)
    raise "expected one target span at #{key.inspect}" unless text.scan(Regexp.new(Regexp.escape(old_span))).length == 1
    [text.sub(old_span, new_span), false]
  end

  def candidate_keys(row)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(row.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
  end

  def write_short_label_records
    raise 'D-21770 short-label records already exist' if File.exist?(SHORT_OUTPUT) || File.exist?(SHORT_SNAPSHOT)
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    candidates = M.table(SHORT_INPUT).map(&:to_h).to_h { |row| [row.fetch('english_candidate'), row] }
    prior_by_key = index.group_by { |row| M.key(row) }
    rows = SPECS.flat_map do |spec|
      term = spec.fetch(:english)
      candidate = candidates.fetch(term) { raise "missing short-label candidate #{term}" }
      keys = candidate_keys(candidate)
      expected = candidate.fetch('unpaired_label_keys_json').then { |v| JSON.parse(v) } +
        candidate.fetch('paired_evidence_keys_json').then { |v| JSON.parse(v) }
      raise "duplicate candidate membership for #{term}" unless expected.uniq.length == keys.length
      keys.map do |key|
        source = inventory.fetch(key) { raise "missing candidate source #{key.inspect}" }
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
        raise "#{term} candidate phrase absent at #{key.inspect}" unless
          english.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
        {
          'english_candidate' => term,
          'disposition' => 'accepted',
          'resource' => key[0],
          'ID_Linha' => key[1],
          'Tipo_Variante' => key[2],
          'english' => english,
          'japanese' => japanese,
          'chinese' => source.fetch('zh_text'),
          'korean' => source.fetch('work_text'),
          'evidence' => spec.fetch(:notes),
          'prior_index_dispositions_json' => JSON.generate(
            prior_by_key.fetch(key, []).map do |entry|
              [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')]
            end
          )
        }
      end
    end
    counts = rows.group_by { |row| row.fetch('english_candidate') }.transform_values(&:length)
    expected_counts = { 'Memory Walk' => 3, 'Mountain Barghest' => 2, 'Mel Senshir Jail' => 3 }
    raise "short-label membership totals differ: #{counts.inspect}" unless counts == expected_counts
    M.write_table(SHORT_OUTPUT, SHORT_HEADERS, rows)

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SHORT_SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    snapshot
  end

  def finalize(snapshot)
    candidate_note = <<~TEXT

      Short-label review D-#{D}: accepted `Memory Walk`, `Mountain Barghest`,
      and `Mel Senshir Jail` as source-supported named place/monster entries.
      Their candidate memberships were reviewed against exact aligned English,
      Japanese, Chinese, Korean, and prior-index cells. Candidate disposition:
      `proper-name-short-label-dispositions-D#{D}.tsv`.
      Bounded groups remaining: #{snapshot.length}, beginning
      `#{snapshot.first&.fetch('english_candidate', 'none')}`; not an exhaustive
      completion estimate. Full proper-name discovery remains incomplete.
    TEXT
    checkpoint_line = "Short-label checkpoint: D-#{D}; #{snapshot.length} bounded candidate groups remain, beginning `#{snapshot.first&.fetch('english_candidate', 'none')}`. Candidate snapshot: `proper-name-short-label-discovery-D#{D}.tsv`."
    M::DOCS.each do |path|
      text = File.read(path)
      marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
      raise "active batch checkpoint missing in #{path}" unless text.match?(marker)
      text.sub!(marker) { |block| block.sub('<!-- current-proper-name-batch:end -->', "#{checkpoint_line}\n<!-- current-proper-name-batch:end -->") }
      File.write(path, text)
    end
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      text = File.read(path)
      raise "D-#{D} summary marker missing in #{path}" unless text.include?("## D-#{D}:")
      text.sub!("## D-#{D}:", candidate_note + "\n## D-#{D}:")
      File.write(path, text)
    end
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + candidate_note)
    end

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'residual audit failed' unless residual.include?('missing=0') && residual.include?('undocumented extras=0')
    checks = residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip)
    verification = "\nD-#{D} index/residual validation: PASS.\n#{validation.strip}\nResidual bilingual/index audit: PASS; #{checks.join('; ')}\n"
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + verification)
    end
    puts "D-#{D}: three named entities registered; #{EDITS.length} exact Texto spans edited; #{snapshot.length} bounded candidate groups remain."
  end

  def run
    raise 'short-label input must be the current D-21769 snapshot' unless File.file?(SHORT_INPUT)
    ReviewedDiscoverySpecs.run(
      D, 'Memory Walk, Mountain Barghest, And Mel Senshir Jail',
      SPECS, 'Register and normalize three source-supported named entities. Review all exact English hits across affix/base/default, reusing existing Barghest and Mel Senshir spellings while keeping generic Barghest and the Mel Senshir city distinct.',
      PREVIOUS_MARKER, &method(:transform)
    )
    snapshot = write_short_label_records
    finalize(snapshot)
  end
end

ReviewNamedResidualsD21770.run if $PROGRAM_NAME == __FILE__
