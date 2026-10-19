#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module RahnilD21660
  extend self

  D = 21_660
  CANONICAL = '라닐(Rahnil)'
  KEYS = [
    ['base', '551', '11'], ['base', '3295', '11'],
    *%w[4362 7882 9668 26539 36130 41526 50605 54639 56783].map do |id|
      ['default', id, '']
    end
  ].freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:26539 explicitly names Alleia's hollow Rahnil, and
    default:41526/56783 independently identify a hollow on the southern edge
    of the Keening. Default:36130 and 54639 describe entering that location;
    the altar and map labels corroborate it. Japanese consistently uses
    ラーニル and Chinese 拉尼尔. Reuse the already paired 라닐(Rahnil)
    from the base map/altar labels and multiple default rows, normalizing
    the isolated 라흐닐 variant and adding missing English annotations.
    Pair each actual mention, including both mentions in default:36130,
    without expanding pronouns or changing the altar's generic descriptor.
    Do not register Rahnil Altar as a separate unique item or infer a new
    personal identity. The official Korean manual files have no direct
    Rahnil entry. D-2171's completed-action/return sequence and D-17113's
    route judgment remain historical findings; this narrowly evidenced name
    standardization does not resolve or recount their other uncertainties.
    All affix/base/default matches were checked; no affix match exists.
  TEXT

  def transform(_spec, key, text, source)
    raise "unreviewed Rahnil key #{key.inspect}" unless KEYS.include?(key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    raise 'English Rahnil evidence missing' unless english.match?(/\bRahnil\b/)
    raise 'Japanese Rahnil evidence missing' unless japanese.include?('ラーニル')
    raise 'Chinese Rahnil evidence missing' unless source.fetch('zh_text').include?('拉尼尔')

    pattern = /라흐닐(?:\(Rahnil\))?|라닐(?:\(Rahnil\))?/
    raise 'Rahnil mention coverage differs' unless
      text.scan(pattern).length == english.scan(/\bRahnil\b/).length
    [text.gsub(pattern, CANONICAL), false]
  end

  def apply
    specs = [{
      key: 'place:rahnil', english: 'Rahnil', category: 'place',
      korean: CANONICAL, variants: '라닐|라흐닐',
      count: KEYS.length, notes: NOTE
    }]
    ReviewedDiscoverySpecs.run(
      D, 'Rahnil Hollow Name', specs, NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

RahnilD21660.apply if $PROGRAM_NAME == __FILE__
