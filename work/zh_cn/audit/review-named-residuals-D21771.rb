#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewNamedResidualsD21771
  extend self

  M = ReviewedNameBatches
  D = 21_771
  SHORT_INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21770.tsv')
  SHORT_OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SHORT_SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  SHORT_HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  PREVIOUS_MARKER = '## D-21770: Memory Walk, Mountain Barghest, And Mel Senshir Jail'
  SPECS = [
    {
      key: 'title:master-mystic',
      english: 'Master Mystic',
      category: 'title',
      korean: '신비술의 대가(Master Mystic)',
      aliases: '',
      variants: '신비의 대가|신비술의 대가',
      count: 7,
      notes: 'English default:51713 explicitly calls Master Mystic a title formally proclaimed to the player; default:5300/61515 independently use it in introductions. Japanese 神秘を極めし者 and Chinese 神秘大师 corroborate the title. Reuse 신비술의 대가(Master Mystic) for title references. The same English phrase in base:1064/3593/3802 is an item-quality modifier (Master Mystic Rivets/Bindings/Grip), not the player title; exclude those three source-local matches from this title entity and preserve their Korean item labels. No other item, person, or prior row finding is changed.'
    },
    {
      key: 'skill:masterful-construction',
      english: 'Masterful Construction',
      category: 'skill',
      korean: '숙련된 창조(Masterful Construction)',
      aliases: '',
      variants: '뛰어난 건축|숙련된 창조',
      count: 2,
      notes: 'English default:16350 places Masterful Construction alongside Transference as an investable minion-upgrade ability, while default:18829 is its standalone UI label. Japanese マスターコンストラクション and Chinese 驾驭 provide supporting ability context. Reuse the already paired Korean form 숙련된 창조(Masterful Construction), correcting only the standalone label; preserve the prior D-5141 translation finding without recounting.'
    }
  ].freeze
  EXCLUDED_TITLE_KEYS = [
    ['base', '1064', '11'],
    ['base', '3593', '11'],
    ['base', '3802', '11']
  ].freeze
  EDITS = {
    ['default', '41774', ''] => ['신비의 대가', '신비술의 대가(Master Mystic)'],
    ['default', '5300', ''] => ['신비학의 대가', '신비술의 대가(Master Mystic)'],
    ['default', '61515', ''] => ['신비술의 대가', '신비술의 대가(Master Mystic)'],
    ['default', '18829', ''] => ['뛰어난 건축', '숙련된 창조(Masterful Construction)']
  }.freeze

  def transform(spec, key, text, source)
    term = spec.fetch(:english)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "English #{term} absent at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
    if spec.fetch(:key) == 'title:master-mystic' && EXCLUDED_TITLE_KEYS.include?(key)
      raise "unexpected item-modifier Korean text at #{key.inspect}" unless text.include?('장인급 신비')
      return [text, true]
    end
    edit = EDITS[key]
    return [text, false] unless edit
    old_span, new_span = edit
    raise "unexpected old Korean span at #{key.inspect}" unless text.include?(old_span)
    raise "expected one target span at #{key.inspect}" unless
      text.scan(Regexp.new(Regexp.escape(old_span))).length == 1
    [text.sub(old_span, new_span), false]
  end

  def candidate_keys(row)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(row.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
  end

  def write_short_label_records
    raise 'D-21771 short-label records already exist' if File.exist?(SHORT_OUTPUT) || File.exist?(SHORT_SNAPSHOT)
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    candidates = M.table(SHORT_INPUT).map(&:to_h).to_h { |row| [row.fetch('english_candidate'), row] }
    prior_by_key = index.group_by { |row| M.key(row) }
    rows = SPECS.flat_map do |spec|
      term = spec.fetch(:english)
      candidate = candidates.fetch(term) { raise "missing short-label candidate #{term}" }
      keys = candidate_keys(candidate)
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
    raise "short-label membership totals differ: #{counts.inspect}" unless
      counts == { 'Master Mystic' => 2, 'Masterful Construction' => 2 }
    M.write_table(SHORT_OUTPUT, SHORT_HEADERS, rows)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SHORT_SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    snapshot
  end

  def finalize(snapshot)
    candidate_note = <<~TEXT

      Short-label review D-#{D}: registered `Master Mystic` as a formal title
      and `Masterful Construction` as a named ability. Their exact short-label
      candidates were checked against the full English-led contexts and aligned
      Japanese/Chinese support. Candidate manifest:
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
    puts "D-#{D}: two named entities reviewed across nine source rows; #{EDITS.length} exact Texto spans edited, three title/item homonyms excluded; #{snapshot.length} bounded candidate groups remain."
  end

  def run
    ReviewedDiscoverySpecs.run(
      D, 'Master Mystic Title And Masterful Construction Ability',
      SPECS, 'Register the player-awarded Master Mystic title and the named Masterful Construction minion-upgrade ability; review all exact English source hits and reuse the Korean forms already established in body text.',
      PREVIOUS_MARKER, &method(:transform)
    )
    snapshot = write_short_label_records
    finalize(snapshot)
  end
end

ReviewNamedResidualsD21771.run if $PROGRAM_NAME == __FILE__
