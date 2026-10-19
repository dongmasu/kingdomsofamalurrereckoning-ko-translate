#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-inventory'
require_relative 'build-proper-name-occurrences'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewAugurD21696
  extend self

  M = ReviewedNameBatches
  D = 21_696
  SNAPSHOT = File.join(__dir__, 'proper-name-short-label-discovery-D21695.tsv')
  CANDIDATE_MANIFEST = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  CANDIDATE_SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")

  DEFAULT_IDS = %w[
    381 1760 1797 3420 4328 5296 7078 7250 11136 11941 13635
    13920 15029 15642 16541 24761 25758 29800 30820 32041 35220
    39780 41678 42420 43686 43738 46276 48017 48888 49679 51047
    51082 52685 54383 54494 55295 55885 56360 56393 60328 60975
    62788 63083
  ].freeze
  EXCLUDED_KEYS = (11..24).select { |variant| %w[11 12 14 21 22 24].include?(variant.to_s) }
    .map { |variant| ['affix', '293', variant.to_s] }
    .push(['base', '826', '11']).to_set.freeze
  PERSON_KEYS = DEFAULT_IDS.map { |id| ['default', id, ''] }.to_set.freeze
  EXPECTED_KEYS = (EXCLUDED_KEYS + PERSON_KEYS).freeze

  SPEC = {
    key: 'person:augur',
    english: 'Augur',
    aliases: '',
    category: 'person',
    korean: '예언자(Augur)',
    variants: '오거|아우구르|점술가|점술사|예언자|예언자(오거)',
    count: 50,
    notes: 'English default:43738 explicitly calls the Revival leader a man named Augur, and default:4328 says he calls himself Augur; default:381 identifies him as the camp prophet. The same singular male leader, Telogrus devotee, and Revival antagonist recurs across the 43 default matches. Japanese consistently translates the role as 予言者; Chinese 奥格尔 transliterates the personal epithet and supports the same identity. Use 예언자(Augur) as the bilingual display without inferring a birth name. Preserve existing deity, faction, settlement, and person decisions in overlapping rows. The six generic affix forms Augur’s and base:826:11 Augur’s Gem do not establish this person as their owner and are explicitly excluded from the person scope.'
  }.freeze

  EDITS = {
    '381' => [['상주 예언자 오거(Augur)', '상주 예언자(Augur)']],
    '1760' => [],
    '1797' => [],
    '3420' => [],
    '4328' => [],
    '5296' => [],
    '7078' => [
      ['지도자 예언자(Augur)', '지도자인 예언자(Augur)'],
      ['야영지에 있는 예언자를', '야영지에 있는 예언자(Augur)를']
    ],
    '7250' => [['아우구르(Augur)', '예언자(Augur)']],
    '11136' => [],
    '11941' => [],
    '13635' => [['예언자는', '예언자(Augur)는']],
    '13920' => [],
    '15029' => [['텔로그루스(Telogrus)의 자칭 예언자 아우구르도',
                 '텔로그루스(Telogrus)의 자칭 예언자(Augur)도']],
    '15642' => [],
    '16541' => [],
    '24761' => [['예언자', '예언자(Augur)']],
    '25758' => [['예언자의 교리', '예언자(Augur)의 교리']],
    '29800' => [['예언자님은', '예언자(Augur)님은']],
    '30820' => [['예언자에게', '예언자(Augur)에게']],
    '32041' => [['예언자와', '예언자(Augur)와']],
    '35220' => [['오거(Augur)', '예언자(Augur)']],
    '39780' => [['점술가', '예언자(Augur)']],
    '41678' => [['점술사만', '예언자(Augur)만']],
    '42420' => [['예언자는', '예언자(Augur)는']],
    '43686' => [['예언자에 대해', '예언자(Augur)에 대해']],
    '43738' => [['오거라는 사내', '예언자(Augur)라는 사내']],
    '46276' => [['오거는', '예언자(Augur)는']],
    '48017' => [['예언자', '예언자(Augur)']],
    '48888' => [['오거는', '예언자(Augur)는']],
    '49679' => [['예언자(오거)', '예언자(Augur)']],
    '51047' => [],
    '51082' => [],
    '52685' => [],
    '54383' => [['아우구르(Augur)', '예언자(Augur)']],
    '54494' => [['아우구르(Augur)', '예언자(Augur)']],
    '55295' => [],
    '55885' => [['점술가', '예언자(Augur)']],
    '56360' => [['예언자', '예언자(Augur)']],
    '56393' => [['예언자', '예언자(Augur)']],
    '60328' => [['점술가(Augur)', '예언자(Augur)']],
    '60975' => [['오거(Augur)', '예언자(Augur)']],
    '62788' => [['오거', '예언자(Augur)']],
    '63083' => [['가짜 \'예언자\'라는 오거(Augur)', '가짜 \'예언자\'(Augur)']]
  }.freeze

  def definition
    {
      key: SPEC.fetch(:key),
      english: SPEC.fetch(:english),
      aliases: SPEC.fetch(:aliases),
      category: SPEC.fetch(:category),
      korean: SPEC.fetch(:korean),
      variants: SPEC.fetch(:variants),
      count: SPEC.fetch(:count),
      notes: SPEC.fetch(:notes)
    }
  end

  def occurrence_definition
    {
      'entity_key' => SPEC.fetch(:key),
      'english_canonical' => SPEC.fetch(:english),
      'english_aliases' => SPEC.fetch(:aliases),
      'status' => 'confirmed'
    }
  end

  def candidate_keys
    raise 'D-21695 short-label snapshot missing' unless File.file?(SNAPSHOT)
    candidate = M.table(SNAPSHOT).find { |row| row.fetch('english_candidate') == 'Augur' }
    raise 'Augur candidate missing from D-21695 snapshot' unless candidate
    keys = (JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
      JSON.parse(candidate.fetch('paired_evidence_keys_json')))
      .map { |key| key.map(&:to_s) }.uniq
    raise "Augur short-label scope differs: #{keys.length}" unless keys.length == 30
    keys
  end

  def corroborated?(source)
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    japanese.match?(/予言者|オーガーズ|ジェム/) &&
      chinese.match?(/奥格尔|占卜师/)
  end

  def transform(_spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "English Augur source missing at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])Augur(?![A-Za-z])/i)
    raise "aligned JA/ZH evidence differs at #{key.inspect}" unless corroborated?(source)
    return [text, true] if EXCLUDED_KEYS.include?(key)

    edits = EDITS.fetch(key[1]) { raise "unreviewed Augur key #{key.inspect}" }
    revised = text.dup
    edits.each do |old, replacement|
      raise "Korean span count differs at #{key.inspect}: #{old}" unless
        revised.scan(old).length == 1
      revised.sub!(old, replacement)
    end
    [revised, false]
  end

  def dry_run
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [occurrence_definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    actual_keys = generated.map { |row| M.key(row) }.to_set
    raise "Augur source matches differ: #{actual_keys.length}" unless actual_keys == EXPECTED_KEYS
    raise 'candidate short-label keys are not in the audited person scope' unless
      (candidate_keys.to_set - actual_keys).empty?
    raise "default Augur transform table differs: #{EDITS.length} rows" unless
      EDITS.keys.to_set == DEFAULT_IDS.to_set
    edit_count = generated.count do |row|
      key = M.key(row)
      old = inventory.fetch(key).fetch('work_text')
      revised, = transform(SPEC, key, old, inventory.fetch(key))
      old != revised
    end
    puts "D-#{D} read-only dry run: #{generated.length} English matches " \
         "(#{PERSON_KEYS.length} person rows, #{EXCLUDED_KEYS.length} source-local exclusions), " \
         "#{candidate_keys.length} short-label candidate keys, #{edit_count} Texto edits."
    edit_count
  end

  def write_candidate_manifest(inventory, prior_index)
    headers = %w[
      english_candidate disposition resource ID_Linha Tipo_Variante
      english japanese chinese korean evidence prior_index_dispositions_json
    ]
    evidence = 'D-21696 registers the Revival leader Augur as one person. Every candidate row is checked against the full 50-key affix/base/default source scope; existing row owners remain unchanged.'
    rows = candidate_keys.map do |key|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact
      {
        'english_candidate' => 'Augur',
        'disposition' => 'registered-person',
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'english' => english.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
        'chinese' => source.fetch('zh_text'),
        'korean' => source.fetch('work_text'),
        'evidence' => evidence,
        'prior_index_dispositions_json' => JSON.generate(
          prior_index.select { |entry| M.key(entry) == key }
            .map { |entry| [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')] }
        )
      }
    end
    raise 'duplicate Augur candidate key' unless rows.map { |row| M.key(row) }.uniq.length == rows.length
    raise 'D-21696 candidate manifest already exists' if File.exist?(CANDIDATE_MANIFEST)
    M.write_table(CANDIDATE_MANIFEST, headers, rows)
    rows
  end

  def refresh_candidate_snapshot(inventory)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    rows = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    raise 'D-21696 candidate snapshot already exists' if File.exist?(CANDIDATE_SNAPSHOT)
    M.write_table(CANDIDATE_SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, rows)
    rows
  end

  def apply
    dry_run
    prior_inventory = M.refresh_inventory
    prior_index = M.table(M::INDEX).map(&:to_h)
    ReviewedDiscoverySpecs.run(
      D, 'Augur, The Revival Prophet', [definition],
      'Register Augur as the named Revival individual who styles himself as Telogrus’ prophet. Normalize only his person references to 예언자(Augur), preserving role language, sentence meaning, particles, and complete neighboring labels. Exclude the six generic affix variants and Augur’s Gem from the person entity; their possessive phrases do not prove ownership by this individual. Existing faction, deity, settlement, person, and historical row decisions in overlapping cells remain unchanged.',
      '<!-- current-proper-name-batch:start -->'
    ) do |spec, key, text, source|
      transform(spec, key, text, source)
    end

    post_inventory = M.refresh_inventory
    candidate_manifest = write_candidate_manifest(prior_inventory, prior_index)
    candidates = refresh_candidate_snapshot(post_inventory)
    candidate_note = <<~TEXT

      ## D-#{D}: Augur Short-Label Candidate Closure

      The 30-key `Augur` short-label group in the prior snapshot is covered by
      this 50-key full-source review. The Revival prophet is registered as
      `person:augur`; generic affix uses and `Augur's Gem` are excluded from
      that person identity. Exact candidate rows and pre-existing owner states
      are in `proper-name-short-label-dispositions-D#{D}.tsv`.
    TEXT
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [report, addendum].each { |path| File.open(path, 'a') { |file| file.write(candidate_note) } }

    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    docs.each do |path, text|
      block = text[marker]
      raise "D-#{D} checkpoint missing in #{path}" unless
        block&.include?("Latest verified proper-name batch: D-#{D} ")
      block.sub!(/Next batch: D-#{D + 1};.*?\n/,
                 "Next batch: D-#{D + 1}; continue unreviewed short-label candidates from `proper-name-short-label-discovery-D#{D}.tsv` (#{candidates.length} bounded groups, not an exhaustive total or completion estimate). Preserve explicit candidate holds in prior batch manifests.\n")
      text.sub!(marker, block)
      text << candidate_note if path.end_with?('README.md') || path.end_with?('decision-register-20261009.md')
      File.write(path, text)
    end
    puts "D-#{D}: reviewed 50 distinct source keys; #{candidate_manifest.length} short-label keys registered; #{candidates.length} bounded groups remain."
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['dry-run'] then ReviewAugurD21696.dry_run
  when ['apply'] then ReviewAugurD21696.apply
  else abort 'usage: review-augur-D21696.rb dry-run|apply'
  end
end
