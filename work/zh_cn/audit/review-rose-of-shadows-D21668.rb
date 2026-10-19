#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module RoseOfShadowsD21668
  extend self

  D = 21_668
  CANONICAL = '그림자 장미(Rose-of-Shadows)'
  KEYS = [
    ['base', '3795', '11'],
    *%w[2894 6035 6817 8076 9308 17692 18834 35503 36774 45332 60111 61973 62822].map do |id|
      ['default', id, '']
    end
  ].freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:61973 explicitly identifies Rose-of-Shadows as a named
    poison used in Walen's plan to fake his death and escape military duty.
    Default:18834 describes its apparent-death effect; 35503/45332 describe
    applying it to the opponent's sword, and 6817/17692/36774 describe buying
    or obtaining it from Gelphyne. Japanese シャドウローズ and Chinese
    暗影玫瑰 corroborate the same named substance across all 14 source keys.
    Reuse the established paired 그림자 장미(Rose-of-Shadows) in the
    topic/objective labels. Normalize 그림자의 장미 and 장미의 그림자
    only within this exact substance-name span and add missing English
    annotations. Register an item/substance, not a botanical species,
    person, unique weapon, or new biography. Other names and the meaning
    of dueling second remain outside this name-only scope. Preserve the
    terminal sentence judgments at 36774/60111 and the separate historical
    D-552/D-11493/D-17888 questions; do not rewrite or recount them as new
    global dispositions. The official Korean manual has no direct entry.
    All affix/base/default sources were checked, with no affix matches.
  TEXT

  def transform(_spec, key, text, source)
    raise 'unexpected poison key' unless KEYS.include?(key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    raise 'English poison evidence missing' unless english.include?('Rose-of-Shadows')
    raise 'Japanese poison evidence missing' unless japanese.include?('シャドウローズ')
    raise 'Chinese poison evidence missing' unless source.fetch('zh_text').include?('暗影玫瑰')
    pattern = /(?:그림자(?:의)? 장미|장미의 그림자)(?:\(Rose-of-Shadows\))?/
    raise 'poison Korean span coverage differs' unless text.scan(pattern).length == 1
    [text.sub(pattern, CANONICAL), false]
  end

  def apply
    specs = [{
      key: 'item:rose-of-shadows', english: 'Rose-of-Shadows', category: 'item',
      korean: CANONICAL, variants: '그림자 장미|그림자의 장미|장미의 그림자',
      count: KEYS.length, notes: NOTE
    }]
    ReviewedDiscoverySpecs.run(
      D, 'Rose-of-Shadows Named Poison', specs, NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

RoseOfShadowsD21668.apply if $PROGRAM_NAME == __FILE__
