#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module KingFangDiscoveryD21642
  extend self
  M = ReviewedNameBatches
  D = 21_642
  ENTITY = 'creature:king-fang'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONTEXT = 'D-21627 explicitly preserves King Fang while identifying Blackshriek separately. English default:50987 identifies King Fang as the leader of the Tala-Rane kobolds; default:64223 independently says he is the closest thing the kobolds have to a leader. Japanese キングファング and Chinese 毒牙国王 corroborate the same named creature. Reuse the established Korean 킹 팽 and pair its exact English source form. Keep King Fang distinct from Blackshriek, Rotclaw, and the kobold species; do not infer additional biography, rarity, or a broader faction relationship.'
  TARGETS = {
    ['default', '38884', ''] => {
      english: 'King Fang', japanese: 'キングファング', chinese: '毒牙国王',
      old: '킹 팽', new: '킹 팽(King Fang)'
    },
    ['default', '48826', ''] => {
      english: 'King Fang', japanese: 'キングファング', chinese: '毒牙国王',
      old: '송곳니 왕', new: '킹 팽(King Fang)'
    },
    ['default', '50987', ''] => {
      english: 'Niahm, a member of the Warsworn, has asked for my help clearing out the monsters that lurk in Tala-Rane. He wants me to assist him in killing Rotclaw, a minor kobold warrior, Blackshriek, a deadly kobold Nightblade, and King Fang, the leader of the kobolds in Tala-Rane.',
      japanese: 'ウォースウォーンの一員のニアムに、タラ＝レインをうろつく怪物、コボルドの始末に協力して欲しいと頼まれた。戦士ロトクロー、恐ろしいナイトブレードのブラックシュリーク、そしてタラ＝レインのコボルドのリーダー、キングファングだ。',
      chinese: '尼亚姆是一名誓战盟成员，请求我帮助他消灭蛰伏在塔拉莱恩中的怪物。他希望我帮助他消灭腐爪，一个体型较小的狗头人战士；黑色尖啸，一个强大的狗头人夜刃；以及毒牙国王，塔拉莱恩狗头人的头目。',
      old: '워스원(Warsworn) 소속 니암(Niahm)이 탈라레인(Tala-Rane)에 도사린 괴물들을 소탕하도록 도와달라고 했다. 하급 코볼트(Kobold) 전사 로트클로(Rotclaw), 치명적인 코볼트(Kobold) 나이트블레이드 블랙슈리크(Blackshriek), 그리고 탈라레인(Tala-Rane)의 코볼트(Kobold) 지도자 킹 팽(King Fang)을 처치해야 한다.',
      new: '워스원(Warsworn) 소속 니암(Niahm)이 탈라레인(Tala-Rane)에 도사린 괴물들을 소탕하도록 도와달라고 했다. 하급 코볼트(Kobold) 전사 로트클로(Rotclaw), 치명적인 코볼트(Kobold) 나이트블레이드 블랙슈리크(Blackshriek), 그리고 탈라레인(Tala-Rane)의 코볼트(Kobold) 지도자 킹 팽(King Fang)을 처치해야 한다.'
    },
    ['default', '63022', ''] => {
      english: 'I have killed the kobolds: Rotclaw, Blackshriek, and King Fang. I should speak with Niahm to see if he needs any more of my help.',
      japanese: 'ロトクロー、ブラックシュリーク、キング・ファングを殺した。さらに協力が必要か、ニアムに尋ねよう。',
      chinese: '我已经杀死了这些狗头人：腐爪、黑色尖啸和毒牙国王。我得与尼亚姆谈谈，看看他是否需要其他帮助。',
      old: '코볼트(Kobold) 로트클로, 블랙슈리크(Blackshriek), 킹 팽을 처치했어. 니암(Niahm)에게 가서 더 도울 일이 있는지 물어봐야겠어.',
      new: '코볼트(Kobold) 로트클로(Rotclaw), 블랙슈리크(Blackshriek), 킹 팽(King Fang)을 처치했어. 니암(Niahm)에게 가서 더 도울 일이 있는지 물어봐야겠어.'
    },
    ['default', '64223', ''] => {
      english: 'Rotclaw is a warrior, Blackshriek is among the deadly Nightblade, and King Fang ‒ he is the closest thing the kobolds have to a leader.',
      japanese: 'ロトクローは戦士だ。ブラックシュリークは恐るべきナイトブレードの一員、そしてキングファングは... コボルドにとってリーダーに最も近い存在だ',
      chinese: '腐爪是一名战士，黑色尖啸是致命的夜刃，而毒牙国王——他是最接近狗头人领袖的生物。',
      old: '로트클로(Rotclaw)는 전사고, 블랙슈리크(Blackshriek)는 치명적인 나이트블레이드의 일원이야. 킹 팽(King Fang)은... 코볼트(Kobold)에게 지도자라 할 만한 가장 가까운 존재지.',
      new: '로트클로(Rotclaw)는 전사고, 블랙슈리크(Blackshriek)는 치명적인 나이트블레이드의 일원이야. 킹 팽(King Fang)은... 코볼트(Kobold)에게 지도자라 할 만한 가장 가까운 존재지.'
    }
  }.freeze

  def source_matches(inventory)
    pattern = /(?<![A-Za-z0-9])King Fang(?![A-Za-z0-9])/i
    inventory.values.select do |source|
      JSON.parse(source.fetch('en_texts_json')).compact.any? { |text| text.match?(pattern) }
    end.map { |source| M.key(source) }.uniq.sort
  end

  def reviews(inventory)
    TARGETS.map do |key, spec|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      current = source.fetch('work_text')
      raise "English source changed at #{key.inspect}" unless english == spec.fetch(:english)
      raise "Japanese source changed at #{key.inspect}" unless japanese == spec.fetch(:japanese)
      raise "Chinese source changed at #{key.inspect}" unless source.fetch('zh_text') == spec.fetch(:chinese)
      raise "Korean source changed at #{key.inspect}" unless current == spec.fetch(:old)
      status = spec.fetch(:old) == spec.fetch(:new) ? 'not-an-issue' : 'accepted'

      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status,
        'old' => spec.fetch(:old), 'new' => spec.fetch(:new),
        'evidence' => CONTEXT, 'english' => english, 'japanese' => japanese,
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
  end

  def definition
    {
      'entity_key' => ENTITY, 'english_canonical' => 'King Fang',
      'category' => 'creature', 'korean_canonical' => '킹 팽(King Fang)',
      'english_aliases' => '', 'korean_variants' => '킹 팽|송곳니 왕',
      'evidence_ids' => 'D-21627|D-21642|default:38884|default:48826|default:50987|default:63022|default:64223',
      'status' => 'confirmed',
      'notes' => "#{CONTEXT} Canonical Korean follows the already paired occurrences; the isolated `송곳니 왕` is normalized. No relation to the distinct Blackshriek or Rotclaw entities is inferred."
    }
  end

  def run
    raise 'D-21642 discovery files already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    inventory = M.refresh_inventory
    expected = TARGETS.keys.sort
    raise "unexpected exact King Fang source scope: #{source_matches(inventory).inspect}" unless
      source_matches(inventory) == expected
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    raise 'King Fang already registered' if glossary.any? { |row| row['entity_key'] == ENTITY }
    rows = reviews(inventory)
    raise 'unexpected review scope' unless rows.length == 5
    M.write_table(DEFINITIONS, glossary.headers, [definition])
    M.write_table(REVIEWS, M::HEADERS.take(12), rows)
    puts "Prepared #{rows.length} King Fang source rows; no CSV or registration state changed."
  end
end

KingFangDiscoveryD21642.run if $PROGRAM_NAME == __FILE__
