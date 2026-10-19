#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-inventory'
require_relative 'build-proper-name-occurrences'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21695
  extend self

  M = ReviewedNameBatches
  D = 21_695
  SNAPSHOT = File.join(__dir__, 'proper-name-short-label-discovery-D21694.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  CANDIDATE_SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")

  REVIEWED = {
    'Adept' => {
      disposition: 'not-an-issue',
      count: 10,
      evidence: 'All six affix forms and both standalone labels translate the Scholia Arcana rank as 숙련자; Japanese アデプト and Chinese 侍者 corroborate the role. The two contextual rows already include the source term in parentheses. Adept is a translated rank, not a person or separately named entity; preserve the existing faction decisions.'
    },
    'Antechamber' => {
      disposition: 'uncertain',
      count: 3,
      evidence: 'The exact candidate keys include a bare base label (Antechamber) and two Hyperian-context rows that already pair 전실(Antechamber). An existing place:hyperian-antechamber owner covers qualified source labels, but the bare base label does not establish whether it is that unique room or a generic room type. Japanese 控えの間 and Chinese 前厅 are semantic corroboration, not proof of identity. Preserve D-21000 ownership boundaries and current text; do not add a global alias.'
    },
    'Archsage' => {
      disposition: 'not-an-issue',
      count: 14,
      evidence: 'The standalone labels translate the Scholia Arcana office/rank as 대현자; Japanese 大賢者 and Chinese 大贤者 corroborate. Contextual rows consistently render the title and several already pair 대현자(Archsage). This is a translated title, not a personal name; preserve all person, faction, and lore-term row decisions.'
    },
    'Ascension' => {
      disposition: 'accepted',
      count: 2,
      evidence: 'English uses Ascension as the named historical period associated with Mitharan settlement. Default:13305 explicitly places Linza Aimar in the sixty perilous days of the Ascension; Japanese 昇天 and Chinese 浮空 corroborate the upward-ascent sense. The standalone label default:7802 currently says 즉위, matching a divergent Japanese 即位 rendering but not the English-led event sense or Chinese 升天. Register a distinct named event and correct only that label to 승천(Ascension); keep the existing people:mitharan decision on default:13305 unchanged.'
    },
    'Aurochs' => {
      disposition: 'uncertain',
      count: 3,
      evidence: 'Two standalone labels transliterate Aurochs as 오록스, while a lowercase comparison in default:1779 already has 오록스(aurochs); Japanese オーロック and Chinese 野牛 support an animal sense. These rows do not establish whether Aurochs is a named Amalur creature class in the requested glossary scope or an ordinary animal term. Preserve all cells and do not promote it to a monster/creature entity without that identity evidence.'
    },
    'Awesome House' => {
      disposition: 'uncertain',
      count: 2,
      evidence: 'The two exact base labels are Awesome House and Key to Awesome House. Japanese 素晴らしい家 and Chinese 惊奇房屋 render the phrase descriptively; Korean alternates between 멋진 집 and 어썸 하우스(Awesome House). The source keys do not establish whether this denotes a named place/item or a descriptive label. Preserve both texts and do not register a place or item from capitalization alone.'
    },
    'Basilica' => {
      disposition: 'uncertain',
      count: 3,
      evidence: 'The standalone Basilica label and two contextual mentions likely refer to Adessa’s Basilica Gnostra; the contextual Korean already carries Basilica in parentheses. However, place:basilica-gnostra has no registered Basilica alias, and the short form also occurs throughout the corpus. Preserve the existing entity and these rows; defer alias registration until every source-local short-form context is reconciled, rather than adding a partial global alias.'
    },
    'Battle for Galafor Plain' => {
      disposition: 'accepted',
      count: 2,
      evidence: 'English and aligned Japanese ガラフォー平原の戦い and Chinese 加拉弗尔平原战役/加拉弗平原之战 identify the named historical battle. Default:10739 narrates it, default:52524 already pairs it, and default:24307 is the standalone title without English. Register a distinct named event and pair default:10739 and 24307. Preserve place:galafor=accepted for the separate geographic mention at default:10739 and place:galafor=excluded at the title-only default:24307 key.'
    }
  }.freeze

  DEFINITIONS = [
    {
      key: 'event:ascension',
      english: 'Ascension',
      aliases: '',
      category: 'named event',
      korean: '승천(Ascension)',
      variants: '즉위',
      count: 5,
      notes: 'English uses Ascension as the named historical period tied to Mitharan settlement; default:13305 says Linza Aimar carried the scepter during its sixty perilous days. Japanese 昇天 and Chinese 浮空 corroborate ascent. The standalone Japanese 即位 diverges, but Chinese 升天 and the English context support 승천 rather than 즉위. Correct default:7802 and preserve people:mitharan at default:13305. Exclude the unrelated lowercase generic ascension uses at default:10908, 40339, and 44996.'
    },
    {
      key: 'event:battle-for-galafor-plain',
      english: 'Battle for Galafor Plain',
      aliases: '',
      category: 'named event',
      korean: '갈라포르 평원 전투(Battle for Galafor Plain)',
      variants: '갈라포르 평원의 전투|갈라포르 평원 전투',
      count: 3,
      notes: 'English default:10739 and 52524 identify the named Battle for Galafor Plain and its historical consequences; Japanese ガラフォー平原の戦い and Chinese 加拉弗尔平原战役/加拉弗平原之战 corroborate. Standardize default:10739 and the standalone default:24307 label to the already-used complete Korean title. Preserve place:galafor=accepted for the separate geographic mention at default:10739 and place:galafor=excluded at the title-only default:24307 row. The battle is a separate event, not a Galafor place alias.'
    }
  ].freeze

  TRANSFORMS = {
    ['default', '7802', ''] => ['즉위', '승천(Ascension)'],
    ['default', '13305', ''] => nil,
    ['default', '10908', ''] => nil,
    ['default', '40339', ''] => nil,
    ['default', '44996', ''] => nil,
    ['default', '10739', ''] => ['갈라포르 평원 전투', '갈라포르 평원 전투(Battle for Galafor Plain)'],
    ['default', '24307', ''] => ['갈라포르 평원의 전투', '갈라포르 평원 전투(Battle for Galafor Plain)'],
    ['default', '52524', ''] => nil
  }.freeze
  EXCLUDED_KEYS = %w[10908 40339 44996].map { |id| ['default', id, ''] }.to_set.freeze

  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Reviewed eight short-label candidate groups from the bounded D-21694
    snapshot, preserving all existing indexed decisions. Register the named
    Ascension period and Battle for Galafor Plain as separate events; do not
    confuse either with the existing Mitharan or Galafor owners. Adept and
    Archsage are translated ranks/titles, and Aurochs is not proven to be a
    named Amalur creature. Antechamber, Awesome House, and Basilica remain
    explicit identity/alias holds; their cells and prior owner histories are
    unchanged. Exact aligned rows and prior index states are in the candidate
    disposition manifest.
  TEXT

  def candidate_rows
    raise "D-#{D - 1} candidate snapshot missing" unless File.file?(SNAPSHOT)
    rows = M.table(SNAPSHOT).to_h { |row| [row.fetch('english_candidate'), row.to_h] }
    REVIEWED.each do |term, decision|
      raise "candidate missing: #{term}" unless rows.key?(term)
      keys = keys_for(rows.fetch(term))
      raise "#{term} key coverage differs: #{keys.length} != #{decision.fetch(:count)}" unless
        keys.length == decision.fetch(:count)
    end
    rows
  end

  def keys_for(row)
    (JSON.parse(row.fetch('unpaired_label_keys_json')) +
      JSON.parse(row.fetch('paired_evidence_keys_json')))
      .map { |key| key.map(&:to_s) }.uniq
  end

  def corroborated?(entity, source)
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    case entity
    when 'event:ascension'
      japanese.match?(/昇天|即位/) && chinese.match?(/升天|浮空/)
    when 'event:battle-for-galafor-plain'
      japanese.include?('ガラフォー平原の戦い') &&
        chinese.match?(/加拉弗尔?平原(?:之战|战役)/)
    else
      false
    end
  end

  def transform(spec, key, text, source)
    entity = spec.fetch(:key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    phrase = Regexp.escape(spec.fetch(:english))
    raise "English source term missing at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])#{phrase}(?![A-Za-z])/i)
    return [text, true] if EXCLUDED_KEYS.include?(key)
    raise "aligned JA/ZH evidence differs at #{key.inspect}" unless corroborated?(entity, source)

    edit = TRANSFORMS.fetch(key, :missing)
    raise "transformation coverage missing at #{key.inspect}" if edit == :missing
    return [text, false] unless edit

    old, revised = edit
    raise "Korean span count differs at #{key.inspect}" unless text.scan(old).length == 1
    [text.sub(old, revised), false]
  end

  def definitions
    DEFINITIONS.map do |spec|
      spec.slice(:key, :english, :aliases, :category, :korean, :variants, :count, :notes)
    end
  end

  def occurrence_definitions
    DEFINITIONS.map do |spec|
      {
        'entity_key' => spec.fetch(:key),
        'english_canonical' => spec.fetch(:english),
        'english_aliases' => spec.fetch(:aliases),
        'status' => 'confirmed'
      }
    end
  end

  def write_candidate_manifest(inventory, prior_index)
    headers = %w[
      english_candidate disposition resource ID_Linha Tipo_Variante
      english japanese chinese korean evidence prior_index_dispositions_json
    ]
    rows = REVIEWED.flat_map do |term, decision|
      keys_for(candidate_rows.fetch(term)).map do |key|
        source = inventory.fetch(key) { raise "source key missing: #{key.inspect}" }
        english = JSON.parse(source.fetch('en_texts_json')).compact
        pattern = /(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i
        unless english.any? { |text| text.match?(pattern) }
          raise "candidate absent from exact English source at #{key.inspect}: #{term}"
        end
        prior = prior_index.select { |entry| M.key(entry) == key }
        {
          'english_candidate' => term,
          'disposition' => decision.fetch(:disposition),
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'english' => english.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
          'chinese' => source.fetch('zh_text'),
          'korean' => source.fetch('work_text'),
          'evidence' => decision.fetch(:evidence),
          'prior_index_dispositions_json' => JSON.generate(
            prior.map { |entry| [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')] }
          )
        }
      end
    end
    unique_keys = rows.map { |row| M.key(row) }.uniq
    raise "D-#{D} exceeds 50 distinct keys: #{unique_keys.length}" if unique_keys.length > 50
    raise 'candidate term/key rows are not unique' unless
      rows.map { |row| [row.fetch('english_candidate'), *M.key(row)] }.uniq.length == rows.length
    raise "D-#{D} manifest exists" if File.exist?(OUTPUT)
    M.write_table(OUTPUT, headers, rows)
    rows
  end

  def refresh_candidate_snapshot(inventory)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    rows = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    raise "D-#{D} candidate snapshot exists" if File.exist?(CANDIDATE_SNAPSHOT)
    M.write_table(CANDIDATE_SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, rows)
    rows
  end

  def dry_run
    candidate_map = candidate_rows
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, occurrence_definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    counts = generated.group_by { |row| row.fetch('entity_key') }.transform_values(&:length)
    expected = DEFINITIONS.to_h { |spec| [spec.fetch(:key), spec.fetch(:count)] }
    raise "source coverage differs: #{counts.inspect}" unless counts == expected
    keys = generated.map { |row| M.key(row) }.to_set
    target_keys = DEFINITIONS.flat_map do |spec|
      keys_for(candidate_map.fetch(spec.fetch(:english)))
    end.to_set
    raise 'reviewed event candidate key is not registered' unless (target_keys - keys).empty?
    expected_keys = [
      %w[7802 10908 13305 40339 44996].map { |id| ['default', id, ''] },
      %w[10739 24307 52524].map { |id| ['default', id, ''] }
    ].flatten(1).to_set
    raise 'new event source-key coverage differs' unless keys == expected_keys
    change_count = generated.count do |row|
      key = M.key(row)
      old = inventory.fetch(key).fetch('work_text')
      revised, = transform(
        DEFINITIONS.find { |spec| spec.fetch(:key) == row.fetch('entity_key') },
        key, old, inventory.fetch(key)
      )
      old != revised
    end
    raise "expected three Texto edits, found #{change_count}" unless change_count == 3
    reviewed_keys = REVIEWED.flat_map { |term, _| keys_for(candidate_map.fetch(term)) }.uniq
    raise "candidate scope exceeds 50 keys: #{reviewed_keys.length}" if reviewed_keys.length > 50
    puts "D-#{D} read-only dry run: #{REVIEWED.length} candidate groups, " \
         "#{reviewed_keys.length} distinct candidate keys, #{generated.length} new event matches, " \
         "#{change_count} Texto edits; #{REVIEWED.values.count { |d| d[:disposition] == 'uncertain' }} holds."
  end

  def apply
    dry_run
    raise 'event transformation coverage differs' unless
      DEFINITIONS.flat_map { |spec| TRANSFORMS.keys.select { |key| key[0] == 'default' && expected_entity_for(key) == spec.fetch(:key) } }.to_set ==
      TRANSFORMS.keys.to_set
    prior_inventory = M.refresh_inventory
    prior_index = M.table(M::INDEX).map(&:to_h)
    definitions_run = ReviewedDiscoverySpecs
    definitions_run.run(D, 'Ascension And Battle For Galafor Plain', definitions, NOTE,
                        '<!-- current-proper-name-batch:start -->') do |spec, key, text, source|
      transform(spec, key, text, source)
    end

    post_inventory = M.refresh_inventory
    manifest = write_candidate_manifest(prior_inventory, prior_index)
    candidate_snapshot = refresh_candidate_snapshot(post_inventory)
    hold_note = <<~TEXT

      ## D-#{D}: Short-Label Candidate Dispositions

      Reviewed #{manifest.map { |row| M.key(row) }.uniq.length} distinct source
      keys across eight candidate groups: two named events registered, two
      translated ranks/species-adjacent terms closed as not an issue, and four
      identity/alias questions retained as uncertain. Existing index-owner
      histories are preserved. Exact source rows are in
      `proper-name-short-label-dispositions-D#{D}.tsv`.
    TEXT
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [report, addendum].each { |path| File.open(path, 'a') { |f| f.write(hold_note) } }

    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    docs.each do |path, text|
      current = text[marker]
      raise "D-#{D} checkpoint missing in #{path}" unless
        current&.include?("Latest verified proper-name batch: D-#{D} ")
      current.sub!(/Next batch: D-#{D + 1};.*?\n/,
                   "Next batch: D-#{D + 1}; continue unreviewed short-label candidates from `proper-name-short-label-discovery-D#{D}.tsv` (#{candidate_snapshot.length} bounded groups, not an exhaustive total or completion estimate). Preserve explicit holds in `proper-name-short-label-dispositions-D#{D}.tsv`.\n")
      text.sub!(marker, current)
      if path.end_with?('README.md') || path.end_with?('decision-register-20261009.md')
        text << hold_note
      end
      File.write(path, text)
    end
    puts "D-#{D}: reviewed #{manifest.map { |row| M.key(row) }.uniq.length} distinct keys; " \
         "#{candidate_snapshot.length} bounded groups remain in the refreshed snapshot."
  end

  def expected_entity_for(key)
    return 'event:ascension' if %w[7802 10908 13305 40339 44996].include?(key[1])
    return 'event:battle-for-galafor-plain' if %w[10739 24307 52524].include?(key[1])
    nil
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['dry-run'] then ReviewShortLabelCandidatesD21695.dry_run
  when ['apply'] then ReviewShortLabelCandidatesD21695.apply
  else abort 'usage: review-short-label-candidates-D21695.rb dry-run|apply'
  end
end
