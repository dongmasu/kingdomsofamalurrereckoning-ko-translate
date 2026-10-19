#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module BloodstoneD21680
  extend self

  D = 21_680
  ENTITY = 'unique_item:bloodstone'
  CANONICAL = '블러드스톤(Bloodstone)'

  SOURCES = {
    ['base', '1115', '11'] => {
      english: 'Bloodstone', japanese: 'ブラッドストーン', chinese: '血石',
      old_span: '혈석'
    },
    ['default', '2', ''] => {
      english: "The Bloodstone is with Kells Cafferty in Tirin's Rest. I've given you the gold to purchase it from him.",
      japanese: 'ブラッドストーンは"ティリンの宿場町"にいるケルス・カファーティが持っている。彼から買うためのゴールドは渡してある',
      chinese: '克尔斯·卡弗蒂带着血石在提林栖所中。你可以用我给你的黄金从他那里买下血石。',
      korean: "블러드스톤(Bloodstone)은 티린의 안식처(Tirin's Rest)에 있는 켈스 카퍼티(Kells Cafferty)가 가지고 있어. 그에게서 사라고 금화를 네게 줬어."
    },
    ['default', '43', ''] => {
      english: 'About that Bloodstone....', japanese: 'そのブラッドストーンについて...',
      chinese: '关于那块鸡血石……',
      korean: '그 블러드스톤(Bloodstone) 말인데...'
    },
    ['default', '2401', ''] => {
      english: 'About that Bloodstone....', japanese: 'そのブラッドストーンについて...',
      chinese: '关于那块鸡血石……',
      korean: '그 블러드스톤(Bloodstone) 말인데...'
    },
    ['default', '5438', ''] => {
      english: 'Long ago, he cheated me in a game of cards, winning a gem known as the Bloodstone. I want you to get it back.',
      japanese: '昔、彼はカード遊びで不正をして、ブラッドストーンと呼ばれる宝石を勝ち取った。それを取り返してほしい',
      chinese: '很久以前，他在打牌中作弊，从我这赢走了一块被称为血石的宝石。我想要你把它找回来。',
      korean: '오래전 그자는 카드놀이에서 속임수를 써서 블러드스톤(Bloodstone)이라는 보석을 따 갔어. 그걸 되찾아 줘.'
    },
    ['default', '5482', ''] => {
      english: 'Bloodstone', japanese: 'ブラッドストーン', chinese: '血石',
      old_span: '블러드스톤'
    },
    ['default', '7723', ''] => {
      english: 'Derfel has now asked that I retrieve three items for him: A circlet that once belonged to him, the Bloodstone, and the Rose of Kandrian. He said the circlet can be found in the Scholia Arcana library in Rathir, the Bloodstone must be bought from Kells Cafferty in Tirin\'s Rest, and the Rose must by plucked from the grave of Jera Dace in Kandrian.',
      japanese: '今度はデルフェルに3個のアイテムを手に入れるよう頼まれた。かつて彼のものだったサークレット、ブラッドストーン、そしてカンドリアンのバラだ。サークレットはラシーアのアルカナ大学の図書館にあるという。ブラッドストーンはティリンの宿場町でケルス・カファーティから買い、バラはカンドリアンのジェラ・デイスの墓で摘めという。',
      chinese: '德尔菲尔请求我帮他获得三件物品：一件曾属于他的金环，血石，以及坎德利安玫瑰。他说戒指可以在拉瑟里的奥术学院图书馆找到，血石可以从提林栖所的克尔斯·卡弗蒂处购买，玫瑰只能在坎德利安中杰拉·戴斯的墓地中摘得。',
      korean: '더펠(Derfel)이 이제 물건 세 개를 가져와 달라고 했어. 자기 소유였던 서클릿, 블러드스톤(Bloodstone), 칸드리안의 장미(Rose of Kandrian)야. 서클릿은 라시르(Rathir)에 있는 스콜리아 아르카나(Scholia Arcana) 도서관에서 찾을 수 있고, 블러드스톤은 티린의 안식처(Tirin\'s Rest)에서 켈스 카퍼티(Kells Cafferty)에게 사야 해. 장미는 칸드리안(Kandrian)에 있는 제라 데이스(Jera Dace)의 무덤에서 꺾어야 한다고 했어.'
    },
    ['default', '20046', ''] => {
      english: 'I have acquired the three items Derfel asked me to gather: the circlet, the Bloodstone, and the Rose of Kandrian. I should return to Derfel with the items.',
      japanese: 'デルフェルに集めるよう頼まれた3個のアイテムを手に入れた。サークレット、ブラッドストーン、そしてカンドリアンのバラだ。デルフェルの元へ届けよう。',
      chinese: '我获得了德尔菲尔请求我收集的三样东西：金环、血石和坎德利安玫瑰。我应该带着这些物品回去找德尔菲尔。',
      korean: '더펠(Derfel)이 모아 달라고 한 물건 세 가지, 서클릿과 블러드스톤, 칸드리안의 장미를 모두 찾았다. 더펠(Derfel)에게 가져다주자.'
    },
    ['default', '28656', ''] => {
      english: 'You have acquired Hellbane, excellent! Now, for your next labors, I need you to collect some items ‒ the Bloodstone, a circlet, and the Rose of Kandrian.',
      japanese: 'ヘルベインを入手したか、すばらしい！ では次の仕事だ。集めてほしい物がある... ブラッドストーン、サークレット、そしてカンドリアンのバラだ',
      chinese: '你已经获得了地狱灾祸，太好了！接下来，我需要你收集一些物品——血石、金环和坎德利安的玫瑰。',
      old_span: '핏빛돌'
    },
    ['default', '29053', ''] => {
      english: 'Obtaining the Bloodstone', japanese: 'ブラッドストーンの入手',
      chinese: '获得鸡血石', korean: '블러드스톤(Bloodstone) 획득하기'
    },
    ['default', '32689', ''] => {
      english: 'The Bloodstone in particular must be bought. Here is some gold to do so.',
      japanese: 'ブラッドストーンについては、買い取る必要がある。このゴールドを使え',
      chinese: '特别是必须要买下血石。你可以用这些黄金去买。',
      old_span: '블러드스톤'
    },
    ['default', '37396', ''] => {
      english: "I'm here to buy the Bloodstone.",
      japanese: 'ブラッドストーンを買いに来た',
      chinese: '我来买鸡血石。',
      old_span: '블러드스톤'
    },
    ['default', '39869', ''] => {
      english: 'Bloodstone Deep', japanese: 'ブラッドストーン・ディープ',
      chinese: '血石深渊', korean: '블러드스톤 심연'
    },
    ['default', '58632', ''] => {
      english: 'The circlet is in a chest in the Scholia Arcana library in Rathir, the Bloodstone is with Kells Cafferty in Tirin\'s Rest, and the Rose just south of here in Kandrian.',
      japanese: 'サークレットはラシーアにあるアルカナ大学図書館の宝箱の中だ。ブラッドストーンは"ティリンの宿場町"にいるケルス・カファーティが持っている。バラはカンドリアンの、ここからすぐ南にある',
      chinese: '金环在拉瑟里奥术学院图书馆的宝箱中，克尔斯·卡弗蒂带着血石在提林栖所中，玫瑰在坎德利安，就在这南边。',
      old_span: '혈석'
    },
    ['default', '59162', ''] => {
      english: 'The circlet from the Scholia Arcana library in Rathir, the Bloodstone from Kells Cafferty, and the Rose of Kandrian from the Grave of Jera Dace.',
      japanese: 'ラシーアのアルカナ大学図書館にあるサークレット、ケルス・カファーティの持つブラッドストーン、そしてジェラ・デイスの墓にあるカンドリアンのバラだ',
      chinese: '拉瑟里奥术学院图书馆的金环，克尔斯·卡弗蒂的血石和杰拉·戴斯坟墓的坎德利安玫瑰。',
      old_span: '블러드스톤'
    }
  }.freeze

  EDITS = SOURCES.select { |_key, row| row.key?(:old_span) }.freeze
  EXCLUDED = ['default', '39869', ''].freeze
  PAIRED = SOURCES.select do |key, row|
    key != EXCLUDED && row.key?(:korean) && !row.key?(:old_span)
  end.freeze
  MATCH_KEYS = SOURCES.keys.sort.freeze
  TARGET_KEYS = (EDITS.keys + PAIRED.keys).sort.freeze

  D9093_ROW =
    '| D-9093 | `default` 29053 | `핏빛돌 획득하기` | `블러드스톤(Bloodstone) 획득하기` | accepted | English capitalizes the named item, and ID 2 already renders the same Bloodstone as `블러드스톤(Bloodstone)`; align the established item name. |'
  D19740_CIRCLET_ROW =
    '| 58632 | `관` | `서클릿` | English `circlet` and Japanese `サークレット` identify the equipment type. Reuse the accepted `서클릿` term at D-022/D-19720; the three locations and other items remain unchanged. |'
  SUMMARY_MARKER = '<!-- current-proper-name-batch:start -->'

  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English base:1115 gives the standalone Bloodstone label; default:5438
    explicitly calls it a gem known as the Bloodstone. The 14 exact requested
    source rows refer to that same named quest item. Japanese ブラッドストーン
    corroborates its established transliteration; Chinese 血石/鸡血石 supports
    the mineral meaning. Normalize only the seven unpaired Korean item spans
    to 블러드스톤(Bloodstone), preserving all other wording and paired
    occurrences. Keep default:29053's accepted D-9093 pairing unchanged.
    Exclude default:39869 Bloodstone Deep as a separate atomic label and
    preserve 블러드스톤 심연. At default:58632, change only 혈석; retain
    D-19740's independent 관→서클릿 circlet correction and the surrounding
    locations, people, and Rose reference. Search covered affix/base/default;
    these are the complete 15 exact Bloodstone phrase hits, including the
    one excluded compound. No historical row judgment or global tally is
    reopened or recounted.
  TEXT

  def transform(spec, key, text, source)
    raise "unreviewed Bloodstone source key #{key.inspect}" unless MATCH_KEYS.include?(key)
    raise 'wrong Bloodstone entity' unless spec.fetch(:key) == ENTITY

    expected = SOURCES.fetch(key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise "English source changed at #{key.inspect}" unless english == expected.fetch(:english)
    raise "Japanese source changed at #{key.inspect}" unless japanese == expected.fetch(:japanese)
    raise "Chinese source changed at #{key.inspect}" unless chinese == expected.fetch(:chinese)

    if key == EXCLUDED
      raise 'Bloodstone Deep Korean label changed' unless text == expected.fetch(:korean)
      return [text, true]
    end

    if PAIRED.key?(key)
      raise "existing Bloodstone pair changed at #{key.inspect}" unless
        text == expected.fetch(:korean)
      return [text, false]
    end

    old_span = expected.fetch(:old_span)
    raise "Bloodstone Korean span count differs at #{key.inspect}" unless
      text.scan(old_span).length == 1
    if key == ['default', '58632', '']
      raise 'D-19740 circlet form missing at default:58632' unless text.include?('서클릿')
    end
    [text.sub(old_span, CANONICAL), false]
  end

  def verify_history!
    register = File.read(File.join(__dir__, 'decision-register-20261009.md'))
    raise 'D-9093 accepted Bloodstone pairing changed or missing' unless register.include?(D9093_ROW)
    readme = File.read(File.join(__dir__, 'README.md'))
    unless register.include?(SUMMARY_MARKER) && readme.include?(SUMMARY_MARKER)
      raise 'current proper-name summary marker missing from README or decision register'
    end

    circlet_history = File.read(
      File.join(__dir__, 'consolidated-context-review-default-legacy-85-D19740-20261012.md')
    )
    raise 'D-19740 default:58632 circlet decision changed or missing' unless
      circlet_history.include?(D19740_CIRCLET_ROW)
  end

  def spec
    {
      key: ENTITY,
      english: 'Bloodstone',
      category: 'unique item',
      korean: CANONICAL,
      variants: '혈석|핏빛돌|블러드스톤',
      count: MATCH_KEYS.length,
      notes: NOTE
    }
  end

  def plan
    verify_history!
    m = ReviewedNameBatches
    inventory = m.refresh_inventory
    candidate = {
      'entity_key' => ENTITY,
      'english_canonical' => 'Bloodstone',
      'english_aliases' => ''
    }
    generated = build_occurrences(inventory.values, [candidate]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    keys = generated.map { |row| m.key(row) }.sort
    raise "Bloodstone source scope changed: #{keys.inspect}" unless keys == MATCH_KEYS
    raise 'Bloodstone matches outside base/default' unless
      generated.all? { |row| %w[base default].include?(row['resource']) }

    glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    terms = glossary.flat_map do |row|
      [row.fetch('english_canonical'), *row['english_aliases'].to_s.split('|')]
    end
    if glossary.any? { |row| row['entity_key'] == ENTITY } ||
       terms.any? { |term| term.casecmp('Bloodstone').zero? }
      raise 'Bloodstone already has a glossary owner; reconcile before applying'
    end
    existing = m.table(m::INDEX).map(&:to_h)
    raise 'Bloodstone occurrence owner already exists' if
      existing.any? { |row| row['entity_key'] == ENTITY }

    generated.map do |row|
      key = m.key(row)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text, excluded = transform(spec, key, old, source)
      {key: key, old: old, new: new_text, excluded: excluded}
    end
  end

  def run
    plan
    ReviewedDiscoverySpecs.run(
      D, 'Bloodstone Named Quest Item', [spec], NOTE,
      SUMMARY_MARKER
    ) { |entity, key, text, source| transform(entity, key, text, source) }
  end
end

BloodstoneD21680.run if $PROGRAM_NAME == __FILE__
