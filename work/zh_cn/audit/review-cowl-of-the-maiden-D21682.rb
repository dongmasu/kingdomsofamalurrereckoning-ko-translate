#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module CowlOfTheMaidenD21682
  extend self

  D = 21_682
  KEYS = [
    ['base', '328', '11'],
    *%w[8773 23064 24558 34233 49616 50710 58737 61462]
      .map { |id| ['default', id, ''] }
  ].freeze
  ENGLISH = 'Cowl of the Maiden'
  CANONICAL = '처녀의 두건(Cowl of the Maiden)'
  OLD_SPANS = {
    ['base', '328', '11'] => '처녀의 두건',
    ['default', '8773', ''] => '시녀의 두건',
    ['default', '23064', ''] => CANONICAL,
    ['default', '24558', ''] => '처녀의 두건',
    ['default', '34233', ''] => '시녀의 두건',
    ['default', '49616', ''] => '처녀의 두건',
    ['default', '50710', ''] => '처녀의 두건',
    ['default', '58737', ''] => '처녀의 두건',
    ['default', '61462', ''] => CANONICAL
  }.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English identifies one named item, the Cowl of the Maiden, across
    base:328 and eight default keys. Default:49616 explicitly glosses it as
    a cowl worn by Lyria's high priestess and hidden at the Temple of Lyria;
    this is the item title, not a global identity decision about every use
    of maiden or the capitalized Maid. Japanese 乙女の頭巾 and Chinese
    少女斗篷 corroborate the item and its source-local name. Use the
    established Korean 처녀의 두건(Cowl of the Maiden), replacing 시녀의
    두건 only in the two exact item spans. Do not infer virginity, ownership,
    a separate person named Maiden, or any relationship beyond the source
    description. Keep Temple of Lyria and all other names atomic and
    unchanged. Default:23064 and default:61462 already have the complete
    bilingual item label and remain unchanged. Preserve D-2459's accepted
    Traveler/commission relationship at default:8773, D-7262 and D-18542
    histories at default:23064, D-7991 and D-18953 at default:24558,
    D-17754 and its D-19740 snapshot at default:58737, and D-17951 at
    default:61462 verbatim; this item-name annotation neither reopens nor
    recounts them. The official Korean manual has no direct item entry.
    Exact English/Japanese/Chinese source coverage is one base key and
    eight default keys, with no affix hits.
  TEXT

  def transform(_spec, key, text, source)
    raise "unreviewed Cowl key #{key.inspect}" unless KEYS.include?(key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise "English Cowl source differs at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])Cowl of the Maiden(?![A-Za-z])/)
    raise "Japanese Cowl source differs at #{key.inspect}" unless
      japanese.include?('乙女の頭巾')
    raise "Chinese Cowl source differs at #{key.inspect}" unless
      chinese.include?('少女') && chinese.include?('斗篷')

    old = OLD_SPANS.fetch(key)
    if old == CANONICAL
      raise "existing bilingual Cowl changed at #{key.inspect}" unless
        text.scan(CANONICAL).length == 1
      return [text, false]
    end
    raise "Korean Cowl span differs at #{key.inspect}" unless
      text.scan(old).length == 1
    [text.sub(old, CANONICAL), false]
  end

  def apply
    specs = [{
      key: 'item:cowl-of-the-maiden',
      english: ENGLISH,
      category: 'item',
      korean: CANONICAL,
      variants: '시녀의 두건|처녀의 두건',
      count: KEYS.length,
      notes: NOTE
    }]
    ReviewedDiscoverySpecs.run(
      D, 'Cowl Of The Maiden Named Item', specs, NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

CowlOfTheMaidenD21682.apply if $PROGRAM_NAME == __FILE__
