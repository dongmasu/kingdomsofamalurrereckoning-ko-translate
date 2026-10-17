#!/usr/bin/env ruby

require_relative 'prepare-local-person-short-forms-D21104'

module TestLocalPersonShortFormsD21104
  module_function

  def assert(condition, message)
    raise message unless condition
  end

  def source(id, english, japanese, chinese, korean)
    {
      'resource' => 'default',
      'ID_Linha' => id,
      'Tipo_Variante' => '',
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate([japanese]),
      'zh_text' => chinese,
      'work_text' => korean
    }
  end

  fixture_rows = [
    source('3566', "I've settled the dispute between Calum and Elwa.",
           'カルムとエルワの不和を解決した。', '我解决了卡勒姆和艾尔瓦之间的纠纷。',
           '칼룸(Calum)과 엘와(Elwa)의 분쟁을 해결했다.'),
    source('6398', 'Elwa has potions if you need them.',
           'エルワがポーションを持ってる', '如果你需要的话，艾尔瓦有药水。',
           '필요하면 엘와(Elwa)에게 물약이 있어.'),
    source('7208', 'Maybe me and Elwa can get on again like nothing happened.',
           '何事もなかったようにエルワと仲直りするかも',
           '也许我和艾尔瓦能够和好如初。',
           '누가 알겠어? 엘와(Elwa)와 다시 예전처럼 잘 지낼 수 있을지도 모르지.'),
    source('26358', 'I talked to Elwa.', 'エルワと話した', '我跟艾尔瓦谈过。',
           '엘와와 이야기했다.'),
    source('20129', "If you were hoping I'd mend something, you want Fiona, over there.",
           '修理したいものがあるなら、向こうにいるフィオナに頼め',
           '如果你希望我修点什么，那你还是找那边的菲奥娜吧。',
           '수리할 게 있으면... 저쪽에 있는 피오나에게 가.'),
    source('20864', 'If you are too lazy to do it yourself, talk to Fiona there.',
           '面倒なら、あっちにいるフィオナに相談しろ',
           '要是你自己懒得去做，就去找那边的菲奥娜吧。',
           '직접 하기 귀찮으면 저기 피오나에게 말해.'),
    source('32134', "Things to repair? You'll want Fiona for that.",
           '修理？ フィオナに頼むといい',
           '有什么要维修的吗？你让菲奥娜来处理吧。',
           '수리할 물건이 있어? 피오나에게 맡기면 돼.'),
    source('43324', "That's Fiona, our blacksmith. She forged these, every one, true enough.",
           'うちの鍛冶職人のフィオナだ。彼女がこれを全部作った',
           '那是菲奥娜，我们的铁匠。她锻造了每一件装备。',
           '저 사람은 우리 대장장이 피오나야. 이 물건들은 전부 정말 그녀가 만들었어.'),
    source('33910',
           'Calum Toomey has requested that I settle a dispute with Elwa Brond. I should find Elwa.',
           'エルワ・ブロンドとの問題を解決するよう頼まれた。エルワは南の村にいるはずだ。',
           '卡勒姆请求我解决他和艾尔瓦·布朗德之间的纠纷。我应该去找艾尔瓦。',
           '엘와 브론드와 금전 분쟁을 해결해 달라고 했다. 남쪽 마을에서 엘와를 찾을 수 있을 것이다.'),
    source('17688', 'Their owner, Princess Fiona, was ambushed.',
           '持ち主だったフィオナ姫は待ち伏せを受けた。',
           '他们的主人菲奥娜公主被伏击。',
           '주인인 피오나(Fiona) 공주가 기습을 당했다.'),
    source('36761', 'The Ljosalfar enchanter, Fiona Caid, fought in the war.',
           'ロサルファーの付呪師、フィオナ・ケイドは戦った。',
           '光精灵巫师菲奥娜·凯德参加了战争。',
           '료스알브 마법부여사 피오나 케이드는 전쟁에서 싸웠다.')
  ]
  fixture = fixture_rows.to_h { |row| [ReviewedNameBatches.key(row), row] }
  reviews = LocalPersonShortFormsD21104.build_reviews(fixture)
  actual_keys = reviews.map { |row| ReviewedNameBatches.key(row) }
  expected_keys = LocalPersonShortFormsD21104::APPROVED_KEYS
  assert(actual_keys.sort == expected_keys.sort, 'fixture review scope differs from eight approved keys')

  statuses = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
  assert(statuses == { 'accepted' => 5, 'not-an-issue' => 3 },
         "unexpected fixture dispositions: #{statuses.inspect}")

  expected_new = {
    '26358' => '엘와(Elwa)와 이야기했다.',
    '20129' => '수리할 게 있으면... 저쪽에 있는 피오나(Fiona)에게 가.',
    '20864' => '직접 하기 귀찮으면 저기 피오나(Fiona)에게 말해.',
    '32134' => '수리할 물건이 있어? 피오나(Fiona)에게 맡기면 돼.',
    '43324' => '저 사람은 우리 대장장이 피오나(Fiona)야. 이 물건들은 전부 정말 그녀가 만들었어.'
  }
  expected_new.each do |id, expected|
    row = reviews.find { |review| review.fetch('ID_Linha') == id }
    assert(row.fetch('new') == expected, "wrong row-local transform at default:#{id}")
  end

  %w[3566 6398 7208].each do |id|
    row = reviews.find { |review| review.fetch('ID_Linha') == id }
    assert(row.fetch('status') == 'not-an-issue' && row.fetch('old') == row.fetch('new'),
           "existing Elwa bilingual form changed at default:#{id}")
  end
  reviews.each do |row|
    source_row = fixture.fetch(ReviewedNameBatches.key(row))
    assert(row.fetch('english') == JSON.parse(source_row.fetch('en_texts_json')).join("\n"),
           "English source evidence incomplete at #{ReviewedNameBatches.key(row).inspect}")
    assert(row.fetch('japanese') == JSON.parse(source_row.fetch('ja_texts_json')).join("\n---\n"),
           "Japanese source evidence incomplete at #{ReviewedNameBatches.key(row).inspect}")
    assert(row.fetch('chinese') == source_row.fetch('zh_text'),
           "Chinese source evidence incomplete at #{ReviewedNameBatches.key(row).inspect}")
  end

  occurrences = LocalPersonShortFormsD21104.occurrence_rows(reviews, fixture)
  occurrence_keys = occurrences.map { |row| ReviewedNameBatches.key(row) }
  assert(occurrence_keys.sort == expected_keys.sort, 'registration rows differ from approved scope')
  assert(occurrences.all? { |row| row.fetch('status') == 'needs-context' },
         'new exact occurrences must enter the index as needs-context')
  assert((occurrence_keys & LocalPersonShortFormsD21104::EXCLUDED_CONTROLS).empty?,
         'D-21102 repeated mention or Fiona homonym was registered')

  puts 'PASS D-21104 exact row scope, transforms, aligned evidence, and homonym exclusions'
end
