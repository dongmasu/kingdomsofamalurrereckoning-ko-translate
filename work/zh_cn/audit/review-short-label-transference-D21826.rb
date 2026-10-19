#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'
require_relative 'build-proper-name-occurrences'

module ReviewShortLabelTransferenceD21826
  extend self

  M = ReviewedNameBatches
  D = 21_826
  LABEL = 'Transference'
  ENTITY = 'skill:transference'
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21825.tsv')
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
    ['default', '5870', ''] => [
      '전이',
      '전이(Transference)',
      '转让',
      'トランスファレンス',
      'accepted'
    ],
    ['default', '16350', ''] => [
      '마법으로 페어 고르타(Faer Gorta)를 빠르게 만들어 곁에서 싸우게 합니다. 전이(Transference)와 숙련된 창조(Masterful Construction)에 포인트를 투자해 소환수를 강화하세요.',
      '마법으로 페어 고르타(Faer Gorta)를 빠르게 만들어 곁에서 싸우게 합니다. 전이(Transference)와 숙련된 창조(Masterful Construction)에 포인트를 투자해 소환수를 강화하세요.',
      '使用魔法迅速拼起一具骷髅兵来与你并肩作战。在“转化”与“驾驭”上加点可以升级你的小兵。',
      'フェアゴータを召喚し、味方にする。"トランスファレンス"と"マスターコンストラクション"を習得すると、フェアゴータを強化できる。',
      'not-an-issue'
    ]
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English default:16350 calls Transference an upgradeable ability: it is
    paired with Masterful Construction in the instruction to invest points
    in both to upgrade a Faer Gorta minion. English default:5870 supplies the
    exact standalone label. Japanese renders the label as トランスファレンス
    and repeats it in the minion-upgrade sentence; Chinese uses 转让 for the
    isolated label and 转化 in the sentence, but remains supplementary.
    Register the named ability as skill:transference and reuse the established
    Korean 전이. Add only the missing English parenthetical at default:5870;
    default:16350 is already correctly paired. This narrow name classification
    does not close D-5141's broader terminology/mechanics uncertainty or alter
    its historical disposition.
  TEXT

  def key(row)
    M.key(row)
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    prior_block = docs.fetch(M::DOCS.first)[marker]
    raise 'D-21825 checkpoint is not current' unless
      prior_block&.include?('Latest verified proper-name batch: D-21825 ')
    raise 'checkpoint documents differ' unless
      docs.values.all? { |text| text[marker] == prior_block }
    [REVIEWS, DISPOSITIONS, SNAPSHOT].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end

    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    candidate = candidates.fetch(LABEL)
    unpaired = JSON.parse(candidate.fetch('unpaired_label_keys_json'))
      .map { |parts| parts.map(&:to_s) }
    paired = JSON.parse(candidate.fetch('paired_evidence_keys_json'))
      .map { |parts| parts.map(&:to_s) }
    raise "unexpected Transference label keys: #{unpaired.inspect}, #{paired.inspect}" unless
      unpaired == [['default', '5870', '']] &&
      paired == [['default', '16350', '']]

    inventory = M.refresh_inventory
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path).map(&:to_h)
    raise 'Transference already registered' if glossary.any? do |row|
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
    raise "unexpected Transference source keys: #{generated.map { |row| key(row) }.inspect}" unless
      generated.map { |row| key(row) }.to_set == TARGETS.keys.to_set

    definition = {
      'entity_key' => ENTITY,
      'english_canonical' => LABEL,
      'category' => 'skill',
      'korean_canonical' => '전이(Transference)',
      'english_aliases' => '',
      'korean_variants' => '전이',
      'evidence_ids' => 'D-21826|default:5870|default:16350',
      'status' => 'confirmed',
      'notes' => [
        'English default:16350 identifies Transference as an investable',
        'minion-upgrade ability; default:5870 is its exact standalone label.',
        'Japanese トランスファレンス corroborates the named ability.',
        'The isolated Chinese 转让 and contextual 转化 are supplementary.',
        'D-5141 remains open for its broader terminology/mechanics question;',
        'this entry does not change or recount that historical disposition.'
      ].join(' ')
    }
    if File.exist?(DEFINITIONS)
      raise 'existing D-21826 definition differs from the reviewed entry' unless
        M.table(DEFINITIONS).map(&:to_h) == [definition]
    else
      M.write_table(DEFINITIONS, DEFINITION_HEADERS, [definition])
    end

    reviews = TARGETS.map do |source_key, (old, revised, chinese, japanese, status)|
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact
      japanese_texts = JSON.parse(source.fetch('ja_texts_json')).compact
      raise "stale Korean at #{source_key.inspect}" unless source.fetch('work_text') == old
      raise "unexpected English at #{source_key.inspect}" unless
        english.any? { |text| text.match?(/(?<![A-Za-z])Transference(?![A-Za-z])/) }
      raise "unexpected Japanese at #{source_key.inspect}" unless
        japanese_texts.include?(japanese)
      raise "unexpected Chinese at #{source_key.inspect}" unless
        source.fetch('zh_text') == chinese
      raise 'unexpected standalone English name' if
        source_key[1] == '5870' && english != [LABEL]
      raise 'default:16350 should already have a complete bilingual label' if
        source_key[1] == '16350' &&
          !old.include?('전이(Transference)')
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
    raise 'Transference remains in the refreshed candidate snapshot' if
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

          ## D-#{D}: Transference Ability Name

          Registered `skill:transference` from the exact `default:5870` label
          and its upgrade context at `default:16350`. Added the missing English
          pairing at `default:5870`; the complete label at `default:16350`
          remains unchanged. D-5141's broader terminology/mechanics uncertainty
          remains open and is not reclassified or recounted.
        TEXT
      elsif path.end_with?('README.md')
        text << <<~TEXT

          ## D-#{D}: Transference Ability Name

          Registered the investable minion-upgrade ability as
          `전이(Transference)` and paired the standalone label. The contextual
          reference was already paired. D-5141's broader terminology/mechanics
          question remains open.
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
        D-5141's broader terminology/mechanics uncertainty remains open.
      TEXT
      File.write(path, text)
    end
    puts "D-#{D}: registered #{ENTITY}; reviewed #{reviews.length} keys; one missing English pairing added; D-5141 preserved; next=#{first}; groups=#{snapshot.length}."
  end
end

ReviewShortLabelTransferenceD21826.run if $PROGRAM_NAME == __FILE__
