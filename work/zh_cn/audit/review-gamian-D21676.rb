#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module GamianD21676
  extend self

  D = 21_676
  IDS = %w[22114 32556 44310 45117 61726 61978 64721].freeze
  CANONICAL = '가미안(Gamian)'
  TITLED = '가미안 수사(Brother Gamian)'
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:22114 names Brother Gamian; 61978 explicitly says he
    keeps the local shards and gems, 44310 identifies him as the person best
    able to explain gem-working, and 45117 directs other questions to Gamian
    or Udo. Default:32556 is his signed teaching text from St. Hadwyn's
    Undying Mission. Standalone default:61726 has aligned Japanese ギャミアン
    and Chinese 加米安, while default:64721 repeats the already bilingual
    Gamian label with English retained in all source locales. These linked
    exact names and contexts support one person, not a generic religious
    title. Japanese ブラザー・ギャミアン and Chinese 加米安修士/伽米安修士
    corroborate the titled form; use the established Korean religious title
    수사, not literal 형제. Normalize the given name to 가미안(Gamian), and
    use 가미안 수사(Brother Gamian) for titled references. Keep the two
    already bilingual standalone labels and the already paired 61978
    reference unchanged. Do not annotate unrelated Udo or infer biography
    beyond these source statements. The official Korean manual contains no
    exact Gamian entry. All seven exact English source keys across
    affix/base/default were checked; they are all default. No historical
    entity disposition or global tally is reopened or recounted.
  TEXT

  def transform(_spec, key, text, source)
    raise 'unreviewed Gamian key' unless
      key[0] == 'default' && key[2].empty? && IDS.include?(key[1])
    en = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    ja = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    zh = source.fetch('zh_text')
    raise 'Gamian English evidence missing' unless en.match?(/Gamian/)
    case key[1]
    when '22114', '32556', '44310', '61978'
      raise 'titled Gamian locale evidence missing' unless
        ja.include?('ブラザー・ギャミアン') && zh.match?(/加米安修士|伽米安修士/)
    when '45117'
      raise 'short-name Gamian locale evidence missing' unless
        ja.include?('ギャミアン') && zh.include?('伽米安')
    when '61726'
      raise 'standalone Gamian locale evidence missing' unless
        ja == 'ギャミアン' && zh == '加米安'
    when '64721'
      raise 'literal standalone source labels changed' unless
        en == 'Gamian' && ja == 'Gamian' && zh == 'Gamian'
    end

    old, revised = case key[1]
                   when '22114' then ['가미안 형제', TITLED]
                   when '32556' then ['감미안 수사', TITLED]
                   when '44310' then ['가미안 수사', TITLED]
                   when '45117' then ['가미안', CANONICAL]
                   when '61726', '64721', '61978' then [nil, nil]
                   end
    if old.nil?
      expected = key[1] == '61978' ? TITLED : CANONICAL
      raise "existing bilingual Gamian form changed at #{key.inspect}" unless
        text.scan(expected).length == 1
      return [text, false]
    end
    raise "Gamian Korean span count differs at #{key.inspect}" unless
      text.scan(old).length == 1
    [text.sub(old, revised), false]
  end

  def apply
    specs = [{
      key: 'person:gamian', english: 'Gamian', category: 'person',
      korean: CANONICAL, aliases: 'Brother Gamian',
      variants: '가미안 형제|감미안 수사|가미안 수사',
      count: IDS.length, notes: NOTE
    }]
    ReviewedDiscoverySpecs.run(
      D, 'Gamian Name And Monk Title', specs, NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

GamianD21676.apply if $PROGRAM_NAME == __FILE__
