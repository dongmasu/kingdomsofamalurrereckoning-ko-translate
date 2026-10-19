#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module LalandShiningLabyrinthD21661
  extend self

  D = 21_661
  TARGETS = {
    ['base', '4464', '11'] => [
      'Laland Post', 'ラーランド駐屯地', '拉兰德前哨',
      '랄랜드 전초기지', '랄랜드 초소(Laland Post)'
    ],
    ['default', '60500', ''] => [
      'This way to Laland Post.', 'この先、ラーランド駐屯地。', '这条路通向拉兰德前哨。',
      '이 길로 가면 랄랜드 초소(Laland Post)입니다.', '이 길로 가면 랄랜드 초소(Laland Post)입니다.'
    ],
    ['base', '4834', '11'] => [
      'Shining Labyrinth', 'シャイニング迷宮', '闪耀迷宫',
      '빛나는 미궁', '빛나는 미궁(Shining Labyrinth)'
    ],
    ['default', '2966', ''] => [
      'Shining Labyrinth', 'シャイニング迷宮', '闪烁迷宫',
      '빛나는 미궁', '빛나는 미궁(Shining Labyrinth)'
    ]
  }.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English base:4464 names Laland Post and default:60500 explicitly directs
    the reader to it. Japanese ラーランド駐屯地 and Chinese 拉兰德前哨
    corroborate a named post. Reuse the established paired 랄랜드 초소
    (Laland Post) in the directional row rather than retaining the isolated
    전초기지 variant. Base:4834 and default:2966 independently present
    Shining Labyrinth as an exact label; Japanese シャイニング迷宮 and
    Chinese 闪耀迷宫/闪烁迷宫 agree on a named labyrinth. Retain the
    existing Korean 빛나는 미궁 and add its complete English annotation.
    No location, occupants, history, relation to another labyrinth, or
    release/game validation is inferred from these labels. The official
    Korean manual files have no direct entries for either name. All exact
    all-resource source matches are covered, with no affix hits. Other
    entity findings and historical global translation tallies are unchanged.
  TEXT

  def transform(_spec, key, text, source)
    english, japanese, chinese, old, replacement = TARGETS.fetch(key)
    raise 'English label changed' unless JSON.parse(source.fetch('en_texts_json')).compact == [english]
    raise 'Japanese label changed' unless JSON.parse(source.fetch('ja_texts_json')).compact == [japanese]
    raise 'Chinese label changed' unless source.fetch('zh_text') == chinese
    raise 'Korean label changed' unless [old, replacement].include?(text)
    [replacement, false]
  end

  def apply
    specs = [
      {
        key: 'place:laland-post', english: 'Laland Post', category: 'place',
        korean: '랄랜드 초소(Laland Post)', variants: '랄랜드 전초기지|랄랜드 초소',
        count: 2, notes: NOTE
      },
      {
        key: 'place:shining-labyrinth', english: 'Shining Labyrinth', category: 'place',
        korean: '빛나는 미궁(Shining Labyrinth)', variants: '빛나는 미궁',
        count: 2, notes: NOTE
      }
    ]
    ReviewedDiscoverySpecs.run(
      D, 'Laland Post And Shining Labyrinth', specs, NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

LalandShiningLabyrinthD21661.apply if $PROGRAM_NAME == __FILE__
