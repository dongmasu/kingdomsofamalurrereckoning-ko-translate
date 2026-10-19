#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module SparrowsD21671
  extend self

  D = 21_671
  CANONICAL = '참새단(Sparrows)'
  IDS = %w[
    4499 7594 9725 10342 12151 12417 12742 16950 20919 23859 26847 28074
    29022 31232 33553 36479 37236 38312 38525 38803 39724 40715 41063
    43273 44528 44856 49154 50216 50716 53422 54594 54738 55456 56507
    59501 61558 62015
  ].freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English 39724/49154 explicitly defines the Sparrows as Rathir's
    rag-pickers led by Selni; 20919/61558 describes the orphans/rag-pickers
    living in tunnels, and the Talibor/Dunn murder story repeats this same
    collective identity. Japanese スズメ and Chinese 麻雀 consistently
    corroborate these people, not birds. Register one faction/group with
    the established D-19762/D-19764/D-19863/D-19872 Korean 참새단,
    replacing 스패로우단/스패로우들/참새들 only in the source-matched
    group spans. Exact The Sparrows topic labels retain their full article
    in English; other group annotations use Sparrows. At 31232 the source's
    final singular a Sparrow of our kind explicitly denotes a member, so
    use 참새단원(Sparrow) locally without a global Sparrow alias. Retain
    singular-label identity questions elsewhere. The group's possessive
    nest descriptions remain nest/hideout descriptions, not new map-site
    identities. Default:59501 is explicitly an ordinary bird comparison in
    a farming text, excluded unchanged. Preserve the existing sentence
    judgments and other names, including Orwin Dunn, Gelphyne, Selni, Lyria
    and Eriad Talibor. Prior terminal keys and historical tally updates
    are not repeated; only the new glossary/entity-row scope is recorded.
    Correct particles made necessary by the reviewed name span, preserving
    all other wording. No direct manual spelling exists for this group.
    All affix/base/default matches were checked: 37 default keys only.
  TEXT

  def transform(_spec, key, text, source)
    raise 'unreviewed Sparrows key' unless
      key[0] == 'default' && key[2].empty? && IDS.include?(key[1])
    en = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    ja = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    zh = source.fetch('zh_text')
    raise 'Sparrows English evidence missing' unless en.include?('Sparrows')
    if key[1] == '59501'
      raise 'ordinary bird comparison changed' unless
        en.include?('Sparrowgrass is nothing to do with Sparrows at all') &&
        ja.include?('雀とは何の関係もない') && zh.include?('麻雀没有任何关系')
      return [text, true]
    end
    raise 'Sparrows locale evidence missing' unless ja.include?('スズメ') && zh.include?('麻雀')
    if key[1] == '31232'
      raise 'member eulogy changed' unless text.include?('참새들아') && text.include?('참새였어')
      return [
        text.sub('참새들아', "#{CANONICAL}이여")
          .sub('참새였어', '참새단원(Sparrow)이었어'),
        false
      ]
    end
    pattern = /(?:스패로우단|스패로우들|참새단|참새들|참새)(?:\((?:The )?Sparrows\))?/
    count = %w[7594 12742 28074 41063].include?(key[1]) ? 2 : 1
    raise "Sparrows Korean span count differs #{key.inspect}" unless text.scan(pattern).length == count
    canonical = %w[9725 12151].include?(key[1]) ? '참새단(The Sparrows)' : CANONICAL
    changed = text.gsub(pattern, canonical)
    changed = changed.gsub("#{CANONICAL}를", "#{CANONICAL}을")
    changed = changed.gsub("#{CANONICAL}들이", "#{CANONICAL}이")
    [changed, false]
  end

  def apply
    specs = [{
      key: 'faction:sparrows', english: 'Sparrows', category: 'faction',
      korean: CANONICAL, aliases: 'The Sparrows',
      variants: '참새단|참새들|스패로우단|스패로우들|참새',
      count: IDS.length, notes: NOTE
    }]
    ReviewedDiscoverySpecs.run(
      D, 'Sparrows Rag-Picker Group', specs, NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

SparrowsD21671.apply if $PROGRAM_NAME == __FILE__
