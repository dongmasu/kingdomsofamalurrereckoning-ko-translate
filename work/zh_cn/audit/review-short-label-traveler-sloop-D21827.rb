#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'
require_relative 'build-proper-name-occurrences'

module ReviewShortLabelTravelerSloopD21827
  extend self

  M = ReviewedNameBatches
  D = 21_827
  LABEL = 'Traveler Sloop'
  ENTITY = 'item:traveler-sloop'
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21826.tsv')
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  DISPOSITIONS = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  REVIEW_HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence english
    japanese chinese entity_dispositions_json
  ].freeze
  DISPOSITION_HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante english
    japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  TARGETS = {
    ['default', '47168', ''] => [
      '트래블러의 슬루프선',
      '트래블러 슬루프선(Traveler Sloop)',
      '旅行者斯洛浦',
      'トラベラーのスループ帆船',
      'accepted'
    ],
    ['default', '48988', ''] => [
      '트래블러 슬루프선',
      '트래블러 슬루프선(Traveler Sloop)',
      '旅行者斯洛浦',
      'トラベラーのスループ帆船',
      'accepted'
    ],
    ['default', '51424', ''] => [
      '트래블러 슬루프선(Traveler Sloop)',
      '트래블러 슬루프선(Traveler Sloop)',
      '旅行者斯洛浦',
      'トラベラーのスループ帆船',
      'not-an-issue'
    ]
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English supplies the exact capitalized label `Traveler Sloop` at all
    three source keys. Japanese `トラベラーのスループ帆船` identifies a
    Travelers-associated sloop sailing vessel, and Chinese `旅行者斯洛浦`
    supports the Traveler/Sloop reading. The label set and aligned translations
    identify a vessel-class label, not a named individual hull. The English
    Traveler modifier is the faction-associated form; the already reviewed
    faction:travelers exclusions at default:47168 and default:48988 remain
    untouched. Korean default:51424 already supplies the complete display
    `트래블러 슬루프선(Traveler Sloop)`, which is reused at the two unpaired
    labels. Nearby English `pirate sloop` and Korean `해적 슬루프`, plus
    `Red Legion Sloop II` / `레드 리전(Red Legion) 슬루프선 II`, support the
    Korean nautical wording. D-19679/default:51424 is already accepted and
    is retained without recounting. This review supersedes D-14415 at
    default:47168 and D-14991 at default:48988 only for the vessel-class
    identity and bilingual label; no unrelated Traveler faction disposition
    is reopened.
  TEXT

  def key(row)
    M.key(row)
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    prior_block = docs.fetch(M::DOCS.first)[marker]
    raise 'D-21826 checkpoint is not current' unless
      prior_block&.include?('Latest verified proper-name batch: D-21826 ')
    raise 'checkpoint documents differ' unless
      docs.values.all? { |text| text[marker] == prior_block }
    [REVIEWS, DISPOSITIONS, SNAPSHOT].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end

    candidate = M.table(INPUT).map(&:to_h).find do |row|
      row.fetch('english_candidate') == LABEL
    end
    raise 'Traveler Sloop candidate missing' unless candidate
    unpaired = JSON.parse(candidate.fetch('unpaired_label_keys_json'))
      .map { |parts| parts.map(&:to_s) }
    paired = JSON.parse(candidate.fetch('paired_evidence_keys_json'))
      .map { |parts| parts.map(&:to_s) }
    expected_unpaired = [
      ['default', '47168', ''],
      ['default', '48988', '']
    ]
    raise "unexpected Traveler Sloop keys: #{unpaired.inspect}, #{paired.inspect}" unless
      unpaired == expected_unpaired &&
      paired == [['default', '51424', '']]
    owners = JSON.parse(candidate.fetch('existing_label_owners_json'))
    expected_faction_exclusions = {
      'default:47168:' => [['faction:travelers', 'excluded']],
      'default:48988:' => [['faction:travelers', 'excluded']]
    }
    expected_faction_exclusions.each do |source_key, expected|
      actual = owners.fetch(source_key, [])
      raise "prior faction disposition changed at #{source_key}" unless
        actual == expected
    end

    inventory = M.refresh_inventory
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path).map(&:to_h)
    raise 'Traveler Sloop already registered' if glossary.any? do |row|
      ([row.fetch('english_canonical')] + row['english_aliases'].to_s.split('|'))
        .any? { |term| term.casecmp?(LABEL) }
    end
    index = M.table(M::INDEX).map(&:to_h)
    generated = build_occurrences(
      inventory.values,
      [{
        'entity_key' => ENTITY,
        'english_canonical' => LABEL,
        'english_aliases' => ''
      }]
    ).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    raise "unexpected Traveler Sloop source keys: #{generated.map { |row| key(row) }.inspect}" unless
      generated.map { |row| key(row) }.to_set == TARGETS.keys.to_set

    definition = {
      'entity_key' => ENTITY,
      'english_canonical' => LABEL,
      'category' => 'item',
      'korean_canonical' => '트래블러 슬루프선(Traveler Sloop)',
      'english_aliases' => '',
      'korean_variants' => '트래블러의 슬루프선|트래블러 슬루프선',
      'evidence_ids' => 'D-21827|default:47168|default:48988|default:51424',
      'status' => 'confirmed',
      'notes' => [
        'English uses Traveler Sloop as an exact vessel-class label at three',
        'keys; Japanese identifies it as a Travelers-associated sloop sailing',
        'vessel and Chinese supports the same source phrase.',
        'The reviewed Korean form is 트래블러 슬루프선(Traveler Sloop).',
        'This is a vessel-class display, not an assertion about an individual',
        'hull or ship name. Keep existing faction:travelers exclusions at',
        'default:47168/48988 and the already accepted D-19679/default:51424.',
        'D-14415 and D-14991 are superseded only for this name/class scope.'
      ].join(' ')
    }
    if File.exist?(DEFINITIONS)
      raise 'existing D-21827 definition differs from the reviewed entry' unless
        M.table(DEFINITIONS).map(&:to_h) == [definition]
    else
      M.write_table(DEFINITIONS, DEFINITION_HEADERS, [definition])
    end

    reviews = TARGETS.map do |source_key, (old, revised, chinese, japanese, status)|
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact
      japanese_texts = JSON.parse(source.fetch('ja_texts_json')).compact
      raise "stale Korean at #{source_key.inspect}" unless source.fetch('work_text') == old
      raise "unexpected English at #{source_key.inspect}" unless english == [LABEL]
      raise "unexpected Japanese at #{source_key.inspect}" unless japanese_texts == [japanese]
      raise "unexpected Chinese at #{source_key.inspect}" unless
        source.fetch('zh_text') == chinese
      if status == 'accepted'
        raise 'expected one new bilingual display' unless
          old != revised && revised.scan(/\(Traveler Sloop\)/).length == 1
      else
        raise 'accepted prior label must remain unchanged' unless old == revised
      end
      {
        'resource' => source_key[0],
        'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => revised,
        'evidence' => "#{EVIDENCE} Exact source key: #{source_key.join(':')}.",
        'english' => english.join("\n"),
        'japanese' => japanese_texts.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    M.write_table(REVIEWS, REVIEW_HEADERS, reviews)
    dispositions = reviews.map do |review|
      prior = index.select { |row| key(row) == key(review) }.map do |row|
        [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
      end
      {
        'english_candidate' => LABEL,
        'disposition' => review.fetch('status'),
        'resource' => review.fetch('resource'),
        'ID_Linha' => review.fetch('ID_Linha'),
        'Tipo_Variante' => review.fetch('Tipo_Variante'),
        'english' => review.fetch('english'),
        'japanese' => review.fetch('japanese'),
        'chinese' => review.fetch('chinese'),
        'korean' => review.fetch('old'),
        'evidence' => "#{EVIDENCE} Exact source key: #{key(review).join(':')}.",
        'prior_index_dispositions_json' => JSON.generate(prior)
      }
    end
    M.write_table(DISPOSITIONS, DISPOSITION_HEADERS, dispositions)
    M.command!(
      'ruby', File.join(__dir__, 'apply-reviewed-proper-name-discovery.rb'),
      DEFINITIONS, REVIEWS, D.to_s
    )

    inventory = M.refresh_inventory
    glossary = M.table(glossary_path).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, glossary, index,
      reviewed_dispositions: ShortLabelDiscovery20261018.reviewed_dispositions
    )
    raise 'Traveler Sloop remains in the refreshed candidate snapshot' if
      snapshot.any? { |row| row.fetch('english_candidate') == LABEL }
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    first = snapshot.first&.fetch('english_candidate', 'none') || 'none'
    next_line =
      "Next batch: D-#{D + 1}; continue refreshed short-label snapshot " \
      "`proper-name-short-label-discovery-D#{D}.tsv` " \
      "(#{snapshot.length} bounded groups; first `#{first}`; " \
      'not exhaustive or a completion estimate).'
    M::DOCS.each do |path|
      text = File.read(path)
      block = text[marker]
      raise "D-#{D} checkpoint block missing from #{path}" unless block
      block.sub!(/^Next batch: .*$/, next_line)
      text.sub!(marker, block)
      if path.end_with?('decision-register-20261009.md')
        text << <<~TEXT

          ## D-#{D}: Traveler Sloop Vessel-Class Label

          Registered `item:traveler-sloop` as the Travelers-associated sloop
          vessel-class label. Standardized the two unpaired cells to the
          already accepted `트래블러 슬루프선(Traveler Sloop)` at
          `default:47168` and `default:48988`. The `default:51424` display and
          D-19679 disposition remain unchanged. D-14415 and D-14991 are
          superseded only for this scope; existing `faction:travelers`
          exclusions remain unchanged.
        TEXT
      elsif path.end_with?('README.md')
        text << <<~TEXT

          ## D-#{D}: Traveler Sloop Vessel-Class Label

          Registered the exact vessel-class label and reused
          `트래블러 슬루프선(Traveler Sloop)` consistently. The already accepted
          third occurrence was not changed; prior faction exclusions were
          preserved.
        TEXT
      end
      File.write(path, text)
    end
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    details = reviews.map do |row|
      "- `#{key(row).join(':')}`: EN `#{row.fetch('english')}`; " \
        "JA `#{row.fetch('japanese')}`; ZH `#{row.fetch('chinese')}`; " \
        "KO `#{row.fetch('old')}` -> `#{row.fetch('new')}` " \
        "(#{row.fetch('status')})."
    end.join("\n")
    [report, addendum].each do |path|
      text = File.read(path)
      text.sub!(/^Next batch: .*$/, next_line)
      text << <<~TEXT

        ## D-#{D} Scope Detail

        #{EVIDENCE}

        ### Aligned Rows

        #{details}

        Candidate disposition: `proper-name-short-label-dispositions-D#{D}.tsv`.
        Refreshed candidate queue: `proper-name-short-label-discovery-D#{D}.tsv`
        (#{snapshot.length} bounded groups; first `#{first}`).
        D-19679/default:51424 remains the existing accepted disposition.
        D-14415/default:47168 and D-14991/default:48988 are superseded only for
        this vessel-class/bilingual-name scope.
      TEXT
      File.write(path, text)
    end
    puts "D-#{D}: registered #{ENTITY}; reviewed #{reviews.length} keys; two labels standardized; prior faction exclusions retained; next=#{first}; groups=#{snapshot.length}."
  end
end

ReviewShortLabelTravelerSloopD21827.run if $PROGRAM_NAME == __FILE__
