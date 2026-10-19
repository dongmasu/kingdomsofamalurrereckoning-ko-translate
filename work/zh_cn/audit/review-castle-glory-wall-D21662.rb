#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module CastleGloryWallD21662
  extend self

  D = 21_662
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English base:322 labels Castle Glory; default:48605 explicitly locates
    the Wall of Whispers beneath Castle Glory, where the letter writer and
    companion were meditating. Japanese 栄光の城/ささやきの壁 and Chinese
    光荣城堡/私语墙壁 independently corroborate the two named sites.
    Retain the base label's 영광의 성, replacing 성 글로리 in the letter;
    preserve the letter's 속삭임의 장벽 for Wall of Whispers. Add complete
    English annotations to these exact location spans only. Register no
    biography, relationship, new Crossing alias, or unseen geography.
    The single source letter is sufficient for its explicitly named wall
    but not a claim about the wall's engine resource type. The official
    Korean manual has no direct entries for either site. Affix/base/default
    source matches and prior glossary ownership were checked. Preserve all
    other words, entities, clauses and historical translation dispositions.
  TEXT

  def transform(spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    case spec.fetch(:key)
    when 'place:castle-glory'
      raise 'unexpected Castle Glory key' unless
        [['base', '322', '11'], ['default', '48605', '']].include?(key)
      raise 'Castle Glory evidence changed' unless
        english.include?('Castle Glory') && japanese.include?('栄光の城') &&
        chinese.include?('光荣城堡')
      pattern = /영광의 성(?:\(Castle Glory\))?|성 글로리/
      raise 'Castle Glory Korean span changed' unless text.scan(pattern).length == 1
      [text.sub(pattern, '영광의 성(Castle Glory)'), false]
    when 'place:wall-of-whispers'
      raise 'unexpected Wall of Whispers key' unless key == ['default', '48605', '']
      raise 'Wall of Whispers evidence changed' unless
        english.include?('Wall of Whispers') && japanese.include?('ささやきの壁') &&
        chinese.include?('私语墙壁')
      pattern = /속삭임의 장벽(?:\(Wall of Whispers\))?/
      raise 'Wall of Whispers Korean span changed' unless text.scan(pattern).length == 1
      [text.sub(pattern, '속삭임의 장벽(Wall of Whispers)'), false]
    else
      raise 'unknown named site'
    end
  end

  def apply
    specs = [
      {
        key: 'place:castle-glory', english: 'Castle Glory', category: 'place',
        korean: '영광의 성(Castle Glory)', variants: '성 글로리|영광의 성',
        count: 2, notes: NOTE
      },
      {
        key: 'place:wall-of-whispers', english: 'Wall of Whispers', category: 'place',
        korean: '속삭임의 장벽(Wall of Whispers)', variants: '속삭임의 장벽',
        count: 1, notes: NOTE
      }
    ]
    ReviewedDiscoverySpecs.run(
      D, 'Castle Glory And Wall Of Whispers', specs, NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

CastleGloryWallD21662.apply if $PROGRAM_NAME == __FILE__
