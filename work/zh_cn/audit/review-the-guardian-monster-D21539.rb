#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module TheGuardianMonsterD21539
  extend self

  M = ReviewedNameBatches
  D = 21_539
  ENTITY_KEY = 'monster:the-guardian'
  ENGLISH = 'The Guardian'
  KOREAN = '수호자(The Guardian)'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  EDITS = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  POSITIVE_IDS = %w[4449 4613 6544 6729 12317 13271 17289 24019 30448].freeze
  HOLD_IDS = %w[25645 35993 37759 59278].freeze
  EXCLUDED_IDS = %w[
    4480 4776 13112 14736 15086 17011 18696 25534 30259
    39700 40677 43671 45374 49045 56329 58545
  ].freeze
  ITEMS = {
    '1860' => ['helm', 'The Guardian Helm', 'ガーディアンヘルム', '守卫者头盔'],
    '2770' => ['chausses', 'The Guardian Chausses', 'ガーディアンシャッセ', '守卫者马裤'],
    '2884' => ['cuirass', 'The Guardian Cuirass', 'ガーディアンキュイラス', '守卫者胸甲'],
    '3610' => ['greaves', 'The Guardian Greaves', 'ガーディアングリーブ', '守卫者护胫'],
    '4594' => ['gauntlets', 'The Guardian Gauntlets', 'ガーディアンガントレット', '守卫者护手']
  }.freeze
  PARTICLES = {
    '4449' => ['야'], '4613' => ['를'], '6544' => ['야'], '6729' => ['를'],
    '12317' => ['에게'], '13271' => ['에게', '는'], '17289' => ['가'],
    '24019' => ['에게'], '30448' => [' ']
  }.freeze
  # Each tuple corroborates this row's context, not a global Guardian identity.
  CONTEXTS = {
    '4449' => ['Niskaru that can\'t be killed', '不死のニスカル', '无法杀死的尼斯卡鲁',
               'The invulnerable Niskaru can be cursed with the Rithen Amulet, like Phasmer.'],
    '4613' => ['Glass of Ambient', '眺望のガラス', '方圆之境',
               'The Amulet incapacitates this Guardian, allowing recovery of the Glass.'],
    '6544' => ['demon that can\'t be killed', '不死の悪魔', '无法杀死的恶魔',
               'Demon wording varies from 4449, but the same Rithen/Phasmer target is explicit.'],
    '6729' => ['incapacitating the Niskaru', 'ニスカル', '尼斯卡鲁',
               'Her rage prevents death; the Amulet curse can incapacitate this Niskaru.'],
    '12317' => ['You place the Amulet of Rithen', 'リゼンのアミュレット', '瑞森护符',
                'Local action reference to placing the named Amulet on the target.'],
    '13271' => ['Tear of Mitharu', 'ミサールの涙', '米萨鲁的眼泪',
                'Both explicit Guardian mentions refer to the Amulet/Glass target.'],
    '17289' => ['the Glass could help them see', 'ガラス', '方圆之镜',
                'Local Glass/Guardian reference in the same artifact encounter.'],
    '24019' => ['Use the Amulet on the Guardian', 'ガーディアンにアミュレットを使う', '护身符',
                'Context-bound Amulet-on-Guardian objective; no global short alias.'],
    '30448' => ['Imprison the Guardian', 'ガーディアンを無力化する', '囚禁守卫者',
                'Context-bound imprisonment/incapacitation objective for this encounter.'],
    '25645' => ['The Guardian', 'ガーディアン', '守卫者',
                'Standalone label: identity could be this monster, the Fate card, or another label.'],
    '37759' => ['The Guardian', 'ガーディアン', '守卫者',
                'Standalone label: the three source languages do not resolve the referent.'],
    '35993' => ['Find the Guardian', '守護者を探す', '找到守护者',
                'Find objective lacks an Amulet, Glass, Niskaru, or other identity anchor.'],
    '59278' => ['Find the Guardian', '守護者を探す', '找到守护者',
                'Duplicate objective wording does not establish the target identity.'],
    '4480' => ['Guardian of Ingress', 'イングレス', '入口守卫者',
               'Different Ingress/Kora Petal guardian; exclude the complete title.'],
    '4776' => ['Crown of the Sun', 'クラウン・オブ・ザ・サン', '太阳王冠',
               'Different Crown of the Sun guardian/sorceress.'],
    '13112' => ['Crown of the Sun', 'クラウン・オブ・ザ・サン', '太阳王冠',
                'Crown of the Sun guardian role overseeing Keepers.'],
    '14736' => ['Guardian of Arms', '戦いの守護者', '军队守卫者',
                'Guardian of Arms is a separate awarded title.'],
    '15086' => ['guardian key-golem', 'ハイムダリーア', '黑姆达利尔',
                'Named Heimdallyr key-golem, already a separate creature entity.'],
    '17011' => ['card of faith', 'カード', '卡牌',
                'Explicit Fate card The Guardian, not the Niskaru encounter.'],
    '18696' => ['Fellfire Pit', 'フェルファイア岩窟', '落火坑',
                'Different beast guarding the Fellfire Bloom.'],
    '25534' => ['Kora Thresh', 'コラ・スレッシュ', '科拉·希里什',
                'Both Guardian mentions concern the Kora Thresh, not this Niskaru.'],
    '30259' => ['Guardian of Pride', 'ドレン', '德伦',
                'Callis Dren/Guardian of Pride is a separately registered person.'],
    '39700' => ['guardian of Ashmoor', 'アシュムーア', '阿什穆尔',
                'Different warrior serving Ashmoor against Gask.'],
    '40677' => ['guardian spiders', '蜘蛛', '蜘蛛守卫者',
                'Ordinary plural guardian spiders summoned by the Widow.'],
    '43671' => ['Chief Protector', '最高守護者', '首席守卫者',
                'City-wide guardian responsibility in the Chief Protector title.'],
    '45374' => ['Caverns of Ingress', 'イングレス洞窟', '入口洞穴',
                'Thresh corpse associated with the Ingress guardian and petal.'],
    '49045' => ['Crown of the Sun', 'クラウン・オブ・ザ・サン', '太阳王冠',
                'Different Crown of the Sun guardian caring for new Keepers.'],
    '56329' => ['Guardian of Arms', '戦いの守護者', '军队守卫者',
                'Male presentation of the separate Guardian of Arms title.'],
    '58545' => ['Kill the Guardian Spiders', 'ガーディアン・スパイダー', '守卫者蜘蛛',
                'Guardian Spider objective, not this singular named target.']
  }.freeze
  NOTE = 'English default:4449/6544 identifies the invulnerable Guardian as a ' \
         'Niskaru/demon cursed with the Rithen Amulet, as Phasmer was; ' \
         'default:6729 explicitly identifies the target as Niskaru, and ' \
         '4613/13271 connect incapacitating her to recovering the Glass of Ambient. ' \
         'Japanese 守護者/ガーディアン and Chinese 守卫者/守护者 corroborate the ' \
         'reviewed contexts, not every use of guardian. Monster is a neutral category ' \
         'for this identified quest target, not a new species or an identity claim ' \
         'about all Guardians. Use 수호자(The Guardian); register only The Guardian, ' \
         'with no bare Guardian alias. Keep four context-poor labels/objectives ' \
         'unresolved and exclude 21 equipment, card, role and other-creature matches. ' \
         'Do not alter default:55245, which is outside this full-phrase scope. ' \
         'Preserve every prior entity/key disposition and evidence, including the ' \
         'Niskaru, Phasmer, Rithen Amulet, Glass and registered equipment decisions. ' \
         'Change only reviewed Korean name spans; retain particles, tokens, numbers, ' \
         'line breaks and all unrelated text.'
  ENTITY = {
    'entity_key' => ENTITY_KEY, 'english_canonical' => ENGLISH, 'category' => 'monster',
    'korean_canonical' => KOREAN, 'english_aliases' => '', 'korean_variants' => '수호자',
    'evidence_ids' => "D-#{D}|default:4449|default:4613|default:6729|default:13271",
    'status' => 'confirmed', 'notes' => NOTE
  }.freeze
  EN_PATTERN = /(?<![A-Za-z])The Guardian(?![A-Za-z])/i
  KO_PATTERN = /(?<![가-힣A-Za-z(])수호자(?:\((?:The )?Guardian\))?+(?!\()/
  SCAN_PATTERN = /#{ReviewedProperNameDiscovery::OPAQUE}|(?<name>#{KO_PATTERN})|\([^()\r\n]*\)/

  def expected_keys
    ITEMS.keys.map { |id| ['base', id, '11'] } +
      (POSITIVE_IDS + HOLD_IDS + EXCLUDED_IDS).map { |id| ['default', id, ''] }
  end

  def definitions_for(headers)
    [headers.to_h { |header| [header, ENTITY.fetch(header, '')] }]
  end

  def source_inventory
    M::RESOURCES.flat_map do |resource|
      locales = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *locales).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end.each_with_object({}) do |row, inventory|
      key = M.key(row)
      raise "duplicate aligned key #{key.inspect}" if inventory.key?(key)

      inventory[key] = row
    end
  end

  def generated_for(inventory, definitions = [ENTITY])
    build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
  end

  def source_texts(source)
    [
      JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
      JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
      source.fetch('zh_text')
    ]
  end

  def validate_source!(source)
    key = M.key(source)
    raise "unreviewed Guardian key #{key.inspect}" unless expected_keys.include?(key)

    texts = source_texts(source)
    raise "missing Guardian source evidence #{key.inspect}" if texts.any? { |text| text.strip.empty? }
    raise "missing full Guardian source phrase #{key.inspect}" unless texts.first.match?(EN_PATTERN)
    if key[0] == 'base'
      expected = ITEMS.fetch(key[1]).drop(1)
      raise "equipment source label changed #{key.inspect}" unless texts == expected
    else
      anchors = CONTEXTS.fetch(key[1]).take(3)
      raise "Guardian EN/JA/ZH context changed #{key.inspect}" unless
        texts.zip(anchors).all? { |text, anchor| text.include?(anchor) }
      if HOLD_IDS.include?(key[1])
        raise "Guardian hold context changed #{key.inspect}" unless texts == anchors
      elsif POSITIVE_IDS.include?(key[1])
        count = PARTICLES.fetch(key[1]).length
        raise "Guardian English multiplicity changed #{key.inspect}" unless
          texts.first.scan(EN_PATTERN).length == count
        raise "Guardian Japanese multiplicity changed #{key.inspect}" unless
          texts[1].scan(/守護者|ガーディアン/).length == count
        raise "Guardian Chinese multiplicity changed #{key.inspect}" unless
          texts[2].scan(/守卫者|守护者/).length == count
      end
    end
    texts
  end

  def normalize(key, text)
    raise "unreviewed Guardian key #{key.inspect}" unless expected_keys.include?(key)
    return text.dup unless key[0] == 'default' && POSITIVE_IDS.include?(key[1])

    endings = PARTICLES.fetch(key[1])
    count = 0
    result = text.gsub(SCAN_PATTERN) do |span|
      match = Regexp.last_match
      next span unless match[:name]

      ending = endings[count]
      raise "unexpected Guardian span/particle #{key.inspect}" unless
        ending && text[match.end(0)..-1].start_with?(ending)
      count += 1
      KOREAN
    end
    raise "Guardian Korean multiplicity changed #{key.inspect}" unless
      count == endings.length && result.scan(KOREAN).length == endings.length
    raise "Guardian normalization changed tokens, numbers or breaks #{key.inspect}" unless
      text.scan(ReviewedProperNameDiscovery::OPAQUE) == result.scan(ReviewedProperNameDiscovery::OPAQUE) &&
      text.scan(/\r\n|\r|\n/) == result.scan(/\r\n|\r|\n/) &&
      text.scan(/\d+/) == result.scan(/\d+/)
    result
  end

  def reviews_for(inventory, generated = generated_for(inventory))
    raise 'Guardian full-phrase scope differs from the reviewed 34 keys' unless
      generated.length == 34 && generated.map { |row| M.key(row) }.sort == expected_keys.sort &&
      generated.all? { |row| row.fetch('entity_key') == ENTITY_KEY }

    generated.map do |occurrence|
      key = M.key(occurrence)
      english, japanese, chinese = validate_source!(inventory.fetch(key))
      old = inventory.fetch(key).fetch('work_text')
      proposed = normalize(key, old)
      status = if key[0] == 'base' || EXCLUDED_IDS.include?(key[1])
                 'excluded'
               elsif HOLD_IDS.include?(key[1])
                 'uncertain'
               else
                 old == proposed ? 'not-an-issue' : 'accepted'
               end
      context = if key[0] == 'base'
                  'Complete registered equipment label; preserve its atomic item annotation byte-for-byte.'
                else
                  CONTEXTS.fetch(key[1]).last
                end
      occurrence.merge(
        'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => "#{key.join(':')}: #{context} #{NOTE}",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY_KEY => status),
        'previous_status' => '', 'previous_evidence' => ''
      )
    end
  end

  def validate_equipment!(glossary, index)
    ITEMS.each do |id, (suffix, english, _ja, _zh)|
      entity = "item:the-guardian-#{suffix}"
      entries = glossary.select { |row| row.fetch('entity_key') == entity }
      records = index.select { |row| row.fetch('entity_key') == entity && M.key(row) == ['base', id, '11'] }
      raise "registered Guardian equipment differs #{id}" unless
        entries.length == 1 && entries.first.fetch('english_canonical') == english &&
        entries.first.fetch('status') == 'confirmed' && records.length == 1 &&
        %w[accepted not-an-issue].include?(records.first.fetch('status'))
    end
  end

  def preflight!(reviews, inventory)
    reviews.each do |row|
      raise "active Guardian review cell changed #{M.key(row).inspect}" unless
        inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('old')
    end
    reviews.select { |row| row.fetch('old') != row.fetch('new') }
           .group_by { |row| row.fetch('resource') }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
  end

  def prior_records(rows)
    rows.each_with_object({}) do |row, records|
      key = [row.fetch('entity_key'), *M.key(row)]
      raise "duplicate prior occurrence #{key.inspect}" if records.key?(key)

      records[key] = row.reject { |field, _| field == 'korean_current' }
    end
  end

  def verify_prior_records!(before, rows)
    after = prior_records(rows)
    raise 'prior Guardian-related dispositions/evidence changed' unless
      before.all? { |key, record| after[key] == record }
    raise 'unexpected Guardian occurrence additions' unless
      (after.keys - before.keys).sort == expected_keys.map { |key| [ENTITY_KEY, *key] }.sort
    true
  end

  def ensure_unused!
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'D21539 discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS, EDITS].any? { |path| File.exist?(path) }
  end

  def prepare
    ensure_unused!
    inventory = source_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX).map(&:to_h)
    definitions = definitions_for(glossary.headers)
    generated = generated_for(inventory, definitions)
    reviews = reviews_for(inventory, generated)
    validate_equipment!(glossary.map(&:to_h), index)
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    raise 'expected 9 Guardian edits, 4 identity holds and 21 exclusions' unless
      reviews.group_by { |row| row.fetch('status') }.transform_values(&:length) ==
        { 'excluded' => 21, 'accepted' => 9, 'uncertain' => 4 }
    preflight!(reviews, inventory)
    puts 'Prepared D-21539: 34 keys; 9 edits/10 name spans; 4 identity holds; 21 exclusions; no writes.'
    [definitions, reviews, generated]
  end

  def apply
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    before = prior_records(index.map(&:to_h))
    definitions, reviews, = prepare
    live = source_inventory
    ReviewedProperNameDiscovery.validate_sources!(reviews, live)
    preflight!(reviews, live)
    raise 'shared registries changed during Guardian preparation' unless
      M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h) == glossary.map(&:to_h) &&
      M.table(M::INDEX).map(&:to_h) == index.map(&:to_h)
    ensure_unused!
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS, reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    verify_prior_records!(before, M.table(M::INDEX).map(&:to_h))
    raise 'prior glossary records changed' unless
      M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h) == glossary.map(&:to_h) + definitions
    active = source_inventory
    ReviewedProperNameDiscovery.validate_sources!(reviews, active)
    reviews.each do |row|
      raise "Guardian postflight cell differs #{M.key(row).inspect}" unless
        active.fetch(M.key(row)).fetch('work_text') == row.fetch('new')
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'], ['--prepare'] then TheGuardianMonsterD21539.prepare
  when ['apply'], ['--apply'] then TheGuardianMonsterD21539.apply
  else abort 'usage: review-the-guardian-monster-D21539.rb [prepare|--apply]'
  end
end
