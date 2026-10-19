#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module RevivalD21672
  extend self

  D = 21_672
  IDS = %w[
    1332 1703 1906 2215 3092 5264 5296 5850 7078 7966 8569 9279 9407
    9553 9775 10614 11016 11602 11941 13175 13752 13996 16224 16934
    18081 18898 20901 26480 26684 27223 31279 31951 33849 35631 35743
    36170 36328 36456 36509 37318 37480 37658 37797 38079 39076 40230
    40316 43448 45608 45885 46042 47322 47370 47415 47498 50075 52533
    52974 53544 54088 54763 55095 55295 55747 56344 58715 59445 60540
    62614 64381 64615
  ].freeze
  CANONICAL = '리바이벌(Revival)'
  CAMP_LABEL = '리바이벌 야영지(Camp Revival)'
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:36456 explicitly explains that the refugee settlement
    began as one tent, grew into a city, and was named Revival for its
    residents' hope of a new start. Default:37797 independently says the
    settlers call the place Revival. Across the 71 exact default keys,
    English consistently identifies this named community; aligned Japanese
    リバイバル and Chinese 复兴营地 corroborate it. Normalize the settlement
    only to 리바이벌(Revival), replacing 부활/부흥/부활촌 or unpaired
    리바이벌 where needed. Preserve all sentence wording, line breaks,
    names, particles and generic camp descriptors. At default:16934 the
    source explicitly names Camp Revival, so retain that complete source
    label as 리바이벌 야영지(Camp Revival), an alias of the settlement.
    Default:27223 is already the complete bilingual Revival Prison label;
    exclude its nested Revival component and keep it byte-for-byte intact.
    Standalone place labels and all other source-local references are
    checked individually. The official Korean manual has no direct Revival
    entry. Existing terminal decisions for other entities in overlapping
    rows and historical global totals are preserved, not reopened or
    recounted. All 71 case-insensitive affix/base/default keys were checked;
    they are 71 default keys, split sequentially into 50 and 21.
  TEXT

  def transform(_spec, key, text, source)
    raise 'unreviewed Revival key' unless
      key[0] == 'default' && key[2].empty? && IDS.include?(key[1])
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise 'Revival English source evidence missing' unless
      english.match?(/\bRevival\b/i)
    raise 'Revival Japanese source evidence missing' unless
      japanese.include?('リバイバル')
    raise 'Revival Chinese source evidence missing' unless
      chinese.include?('复兴')

    if key[1] == '27223'
      raise 'complete Revival Prison label changed' unless
        english == 'Revival Prison' &&
        text == '리바이벌 감옥(Revival Prison)'
      return [text, true]
    end

    if key[1] == '16934'
      raise 'Camp Revival full-label source changed' unless
        english.include?('Camp Revival') && !english.include?('camp of Revival')
      return [text, false] if text.include?(CAMP_LABEL) &&
        text.scan(CAMP_LABEL).length == 1
      raise 'Camp Revival Korean span changed' unless
        text.scan('리바이벌 야영지').length == 1
      return [text.sub('리바이벌 야영지', CAMP_LABEL), false]
    end

    spans = text.scan(/(?:부활촌|리바이벌|부활|부흥)(?:\(Revival\))?/)
    raise "Revival Korean span count differs at #{key.inspect}" unless spans.length == 1
    return [text, false] if spans.first == CANONICAL
    [text.sub(spans.first, CANONICAL), false]
  end

  def apply
    specs = [{
      key: 'place:revival', english: 'Revival', category: 'place',
      korean: CANONICAL, aliases: 'Camp Revival',
      variants: '부활|부흥|부활촌|리바이벌',
      count: IDS.length, notes: NOTE
    }]
    ReviewedDiscoverySpecs.run(
      D, 'Revival Settlement Name', specs, NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

RevivalD21672.apply if $PROGRAM_NAME == __FILE__
