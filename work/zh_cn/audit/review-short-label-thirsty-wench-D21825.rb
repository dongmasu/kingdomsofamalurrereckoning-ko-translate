#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'
require_relative 'build-proper-name-occurrences'

module ReviewShortLabelThirstyWenchD21825
  extend self

  M = ReviewedNameBatches
  D = 21_825
  ENTITY = 'place:thirsty-wench'
  LABEL = 'Thirsty Wench'
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
    ['base', '4046', '11'] => [
      '목마른 처녀 여관',
      '목마른 처녀 여관(Thirsty Wench)',
      '干渴少妇',
      'accepted'
    ],
    ['default', '14553', ''] => [
      '목마른 여인 여관',
      '목마른 여인 여관(Thirsty Wench)',
      '干渴少妇',
      'accepted'
    ],
    ['default', '6916', ''] => [
      '목마른 처녀 여관(Thirsty Wench)에서 어울리는 것도 괜찮아. 베라는 꽤 웃기거든. 그 입담이면 트래블러(Traveler)가 돼도 되겠어.',
      '목마른 처녀 여관(Thirsty Wench)에서 어울리는 것도 괜찮아. 베라는 꽤 웃기거든. 그 입담이면 트래블러(Traveler)가 돼도 되겠어.',
      '我不介意去干渴少妇里呆着。贝拉还挺有意思的。她靠那张嘴就该成为旅行者。',
      'not-an-issue'
    ],
    ['default', '20469', ''] => [
      '알파르(Alfar) 손님에 트래블러(Traveler)까지, 제법 손님이 왔네. 조심하지 않으면 목마른 처녀 술집도 점잖은 곳이 되겠어.',
      '알파르(Alfar) 손님에 트래블러(Traveler)까지, 제법 손님이 왔네. 조심하지 않으면 목마른 처녀 술집(Thirsty Wench)도 점잖은 곳이 되겠어.',
      '我们确实有一些访客，比如精灵和一名旅行者。我最好小心点，不然这个干渴少妇会迷倒所有受尊敬的人。',
      'accepted'
    ],
    ['default', '58971', ''] => [
      '목마른 여인 여관에 온 걸 환영해. 주인이자 여관지기, 그리고 이 여관의 이름을 빌려준 베라 그라스타(Bera Grastar)야.',
      '목마른 여인 여관(Thirsty Wench)에 온 걸 환영해. 주인이자 여관지기, 그리고 이 여관의 이름을 빌려준 베라 그라스타(Bera Grastar)야.',
      '欢迎来到干渴少妇。我是贝拉·格拉斯塔尔，店主兼旅馆老板，人如店名。',
      'accepted'
    ]
  }.freeze
  JAPANESE = {
    ['base', '4046', '11'] => '酔いどれ娘亭',
    ['default', '14553', ''] => '酔いどれ娘亭',
    ['default', '6916', ''] =>
      '酔いどれ娘亭でたむろするのもいいわよ。ベラはとても面白い。あの口でトラベラーになれるわ',
    ['default', '20469', ''] =>
      '訪問客もアルファーとトラベラーくらいだし。でも、気をつけないと"酔いどれ娘亭"がお上品になっちゃうわね',
    ['default', '58971', ''] =>
      '酔いどれ娘亭へようこそ。この宿のオーナーで酒好きの女将、ベラ・グラスターよ'
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English explicitly names the Thirsty Wench as Bera's inn/tavern: the
    standalone base/default labels give the exact name, default:58971 welcomes
    the player there and identifies Bera as its owner and innkeep, and
    default:6916 and default:20469 use the same place in dialogue. Japanese
    酔いどれ娘亭 corroborates a named tavern and its woman/girl wordplay;
    Chinese 干渴少妇 is supplementary and is not used to override English.
    Add the exact English parenthetical to each unpaired occurrence and retain
    the already-paired default:6916 wording. The Korean lexical choices and
    venue suffixes are intentionally preserved, not canonically resolved:
    D-4404 at default:14553 and D-6331 at default:20469 remain uncertain on
    translation register/naming convention. D-1856 at default:6916 and
    D-17813 at default:58971 remain unchanged and are not recounted.
  TEXT

  def key(row)
    M.key(row)
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    prior_block = docs.fetch(M::DOCS.first)[marker]
    raise 'D-21824 checkpoint is not current' unless
      prior_block&.include?('Latest verified proper-name batch: D-21824 ')
    raise 'checkpoint documents differ' unless
      docs.values.all? { |text| text[marker] == prior_block }
    [REVIEWS, DISPOSITIONS, SNAPSHOT].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end

    inventory = M.refresh_inventory
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path).map(&:to_h)
    raise 'Thirsty Wench is already registered' if glossary.any? do |row|
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
    generated_keys = generated.map { |row| key(row) }.to_set
    raise "unexpected English source match set: #{generated_keys.inspect}" unless
      generated_keys == TARGETS.keys.to_set

    definition = {
      'entity_key' => ENTITY,
      'english_canonical' => LABEL,
      'category' => 'place',
      'korean_canonical' => '목마른 처녀 여관(Thirsty Wench)',
      'english_aliases' => '',
      'korean_variants' => '목마른 여인 여관|목마른 처녀 술집',
      'evidence_ids' =>
        'D-21825|base:4046:11|default:14553|default:6916|default:20469|default:58971',
      'status' => 'confirmed',
      'notes' => [
        'English identifies the named inn/tavern.',
        'Japanese 酔いどれ娘亭 supports the venue and woman/girl wordplay;',
        'Chinese 干渴少妇 is supplementary.',
        'This canonical is a preferred display, not a closure of the Korean',
        'lexical/register/business-suffix questions: D-4404 and D-6331 remain',
        'uncertain. Exact English pairing is reviewed for all five source keys;',
        'row-specific Korean wording is retained pending that separate review.'
      ].join(' ')
    }
    if File.exist?(DEFINITIONS)
      raise 'existing D-21825 definition differs from the reviewed entry' unless
        M.table(DEFINITIONS).map(&:to_h) == [definition]
    else
      M.write_table(DEFINITIONS, DEFINITION_HEADERS, [definition])
    end

    reviews = TARGETS.map do |source_key, (old, revised, expected_chinese, status)|
      source = inventory.fetch(source_key)
      english_texts = JSON.parse(source.fetch('en_texts_json')).compact
      japanese_texts = JSON.parse(source.fetch('ja_texts_json')).compact
      raise "stale Korean at #{source_key.inspect}" unless
        source.fetch('work_text') == old
      raise "source name missing at #{source_key.inspect}" unless
        english_texts.any? { |text| text.include?(LABEL) }
      raise "unexpected Japanese at #{source_key.inspect}" unless
        japanese_texts.include?(JAPANESE.fetch(source_key))
      raise "unexpected Chinese at #{source_key.inspect}" unless
        source.fetch('zh_text') == expected_chinese
      if status == 'accepted'
        raise "target text already changed at #{source_key.inspect}" if old == revised
        raise "expected one exact label occurrence at #{source_key.inspect}" unless
          old.scan(/(?<![A-Za-z])Thirsty Wench(?![A-Za-z])/i).empty? &&
            revised.scan(/(?<![A-Za-z])Thirsty Wench(?![A-Za-z])/i).length == 1
      else
        raise 'paired reference should remain unchanged' unless old == revised
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
        'english' => english_texts.join("\n"),
        'japanese' => japanese_texts.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    M.write_table(REVIEWS, REVIEW_HEADERS, reviews)

    dispositions = reviews.map do |review|
      prior = index.select do |row|
        key(row) == key(review)
      end.map do |row|
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
    reviewed = ShortLabelDiscovery20261018.reviewed_dispositions
    snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, glossary, index, reviewed_dispositions: reviewed
    )
    raise 'Thirsty Wench remains in the refreshed candidate snapshot' if
      snapshot.any? { |row| row.fetch('english_candidate') == LABEL }
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)

    first = snapshot.first&.fetch('english_candidate', 'none') || 'none'
    next_line =
      "Next batch: D-#{D + 1}; continue refreshed short-label snapshot " \
      "`proper-name-short-label-discovery-D#{D}.tsv` " \
      "(#{snapshot.length} bounded groups; first `#{first}`; " \
      'not exhaustive or a completion estimate).'
    current_block_replacement = lambda do |text|
      block = text[marker]
      raise 'D-21825 checkpoint block missing' unless block
      block.sub!(/^Next batch: .*$/, next_line)
      text.sub(marker, block)
    end

    M::DOCS.each do |path|
      text = current_block_replacement.call(File.read(path))
      if path.end_with?('decision-register-20261009.md')
        text << <<~TEXT

          ## D-#{D}: Thirsty Wench Name Pairing

          Registered `place:thirsty-wench` and reviewed all five exact English
          source keys across `base` and `default`. Added the English parenthetical
          to four unpaired Korean mentions; retained the already paired
          `default:6916` label. The name identifies Bera's inn/tavern; Japanese
          `酔いどれ娘亭` corroborates the venue and Chinese is supplementary.
          Preserved the existing Korean renderings rather than resolving their
          lexical/register/business-suffix differences. D-4404 at
          `default:14553` and D-6331 at `default:20469` remain uncertain;
          D-1856 and D-17813 remain unchanged and are not recounted.
        TEXT
      elsif path.end_with?('README.md')
        text << <<~TEXT

          ## D-#{D}: Thirsty Wench Name Pairing

          Registered the named tavern and paired its English name across all
          five exact source keys. Four previously unpaired Korean mentions now
          include `(Thirsty Wench)`; the existing paired label is unchanged.
          Korean lexical variants and venue suffixes were preserved because the
          separate D-4404/D-6331 wording questions remain uncertain.
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
        The exact prior uncertainties D-4404 and D-6331 remain open. D-1856 and
        D-17813 were not changed or recounted.
      TEXT
      File.write(path, text)
    end
    puts "D-#{D}: #{reviews.length} source keys reviewed; four English labels paired; D-4404/D-6331 wording holds preserved; next=#{first}; candidate groups=#{snapshot.length}."
  end
end

ReviewShortLabelThirstyWenchD21825.run if $PROGRAM_NAME == __FILE__
