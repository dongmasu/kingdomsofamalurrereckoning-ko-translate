#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module TheCrossingD21663
  extend self

  D = 21_663
  CANONICAL = '크로싱(The Crossing)'
  IDS = %w[
    46 1675 2455 3023 4181 5411 7030 7264 7269 7379 7382 8219 9628
    9660 9959 10109 10547 11072 11304 11415 11674 14509 14652 15450
    16092 16101 18556 19536 20472 20952 20986 23858 24003 25969 26010
    26306 26422 27923 29729 30236 30333 30852 31336 31853 32816 33938
    34296 38417 39013 40475 45173 45739 46271 46279 47572 47600 47779
    47818 48313 48605 49045 50093 51297 52232 52302 54080 55393 56904
    61109 63854 64948
  ].freeze
  EXCLUDED = %w[
    2455 7379 14652 27923 30852 47572 51297 52232 54080 56904 61109 63854
  ].freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:45739 explicitly defines the Crossing as a protected
    source of magical energy; 30333 locates it amidst a subterranean lake,
    46271/47600 below/in the depths of Caer Elatha, and 11304/64948 link it
    to the land's magic. This cross-corpus evidence establishes a named
    magical site rather than an ordinary road intersection. Japanese uses
    力の交差点 and クロッシング for the same Maxen/Halcyor/Pura story.
    Chinese varies 关口, 十字祭坛 and 十字路口; at 25969 it instead
    says 狂风路口. English and Japanese agree at that row; do not merge
    this site with the independently registered Gale Crossing settlement.
    Reuse the already prevalent paired 크로싱(The Crossing), normalizing
    교차로/교차점/교차의 장 only in independent site references. Preserve
    the existing Crossing Keepers organization and Font of the Crossing
    compound labels as excluded component matches without nested annotations
    or a new identity judgment. At 48605 pair the two independent site
    references but retain the complete organization label. At 26306 restore
    the explicitly source-named destination instead of the generic 통로;
    preserve the previously accepted 감시관의 의식 and all other wording.
    Earlier lexical/lore holds are not retroactively marked resolved or
    recounted; this records only the new site-name scope. The manual gives
    world/Fae background, not a direct Crossing spelling. All exact article
    forms across affix/base/default were checked; there are 71 default keys.
    Bare Crossing forms in other compounds are not registered as aliases.
  TEXT

  def transform(_spec, key, text, source)
    raise 'unexpected Crossing key' unless
      key[0] == 'default' && key[2].empty? && IDS.include?(key[1])
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    raise 'English Crossing evidence missing' unless english.match?(/\bthe Crossing\b/i)
    raise 'Japanese Crossing evidence missing' unless japanese.match?(/力の交差点|クロッシング/)
    raise 'Chinese Crossing evidence missing' unless
      source.fetch('zh_text').match?(/关口|十字祭坛|十字路口|交汇|狂风路口|十字圣壶|祭坛守卫/)
    return [text, true] if EXCLUDED.include?(key[1])

    if key[1] == '26306'
      old = '페이(Fae)의 공허인 케어 엘라사(Caer Elatha)의 통로를 지나려면'
      replacement = '페이(Fae)의 공허인 케어 엘라사(Caer Elatha)에 있는 크로싱(The Crossing)에 들어가려면'
      raise 'Crossing destination clause changed' unless text.include?(old) || text.include?(replacement)
      return [text.sub(old, replacement), false]
    end

    # The organization's already-reviewed full label is an atomic span.
    pattern = /(?:크로싱|교차로|교차점|교차의 장)(?:\((?:The Crossing|Crossing)\))?(?!의 수호자들)/
    expected = %w[11674 16101 48605].include?(key[1]) ? 2 : 1
    raise "Crossing Korean span coverage differs at #{key.inspect}" unless text.scan(pattern).length == expected
    [text.gsub(pattern, CANONICAL), false]
  end

  def apply
    specs = [{
      key: 'place:the-crossing', english: 'The Crossing', category: 'place',
      korean: CANONICAL, variants: '크로싱|교차로|교차점|교차의 장',
      count: IDS.length, notes: NOTE
    }]
    ReviewedDiscoverySpecs.run(
      D, 'The Crossing Magical Site', specs, NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

TheCrossingD21663.apply if $PROGRAM_NAME == __FILE__
