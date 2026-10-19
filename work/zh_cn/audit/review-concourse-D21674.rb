#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module ConcourseD21674
  extend self

  D = 21_674
  CANONICAL = '콩코스(Concourse)'
  SPANS = {
    '4736' => ['이디라(Idylla) 중앙 광장', '이디라 콩코스(Idylla Concourse)'],
    '5126' => ['중앙 광장', CANONICAL],
    '5450' => ['중앙 광장(Concourse)', CANONICAL],
    '7789' => ['중앙 홀(Main Concourse)', '중앙 콩코스(Main Concourse)'],
    '11132' => ['콩코스 시장(Concourse market)', "#{CANONICAL} 시장"],
    '17174' => ['로딩 구역 2!', "#{CANONICAL} 2 로딩 중!"],
    '17378' => ['중앙 홀', CANONICAL],
    '22274' => ['콘코스(Concourse)', CANONICAL],
    '30111' => ['대회랑(Concourse)', CANONICAL],
    '31578' => ['이디라(Idylla) 중앙 광장', '이디라 콩코스(Idylla Concourse)'],
    '34620' => ['회랑', CANONICAL],
    '35335' => ['회랑 시장', "#{CANONICAL} 시장"],
    '36380' => ['콘코스', CANONICAL],
    '40077' => ['콘코스 시장', "#{CANONICAL} 시장"],
    '40964' => ['회랑', CANONICAL],
    '43466' => ['콘코스', CANONICAL],
    '45552' => ['콩코스', CANONICAL],
    '45849' => ['콩코스', CANONICAL],
    '46865' => ['대회랑', CANONICAL],
    '48081' => ['콩코스', CANONICAL],
    '49050' => ['콘코스', CANONICAL],
    '51012' => ['컨코스(Concourse)', CANONICAL],
    '52406' => [CANONICAL, CANONICAL],
    '58487' => ['이디라(Idylla) 회랑', '이디라 콩코스(Idylla Concourse)'],
    '58830' => ['중앙 회랑', "중앙 #{CANONICAL}"],
    '59369' => ['콘코스', CANONICAL]
  }.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:43466 defines the Concourse as the city's main hub,
    gathering and prayer place. Default:46865 explicitly says the masons
    call Idylla's heart the Concourse, 31578 names Idylla Concourse, and
    22274/30111/45849 link the same place to the Hyperian. Japanese
    コンコース and Chinese 菱形广场 corroborate the site across these
    contexts. Reuse the already paired 콩코스(Concourse) at 52406 and
    normalize 콘코스/컨코스/회랑/대회랑/중앙 홀/중앙 광장 only in the
    named site spans. Keep complete source-local Idylla Concourse and Main
    Concourse labels atomic, preserving Idylla's established Korean spelling.
    Market remains a generic descriptor outside the place annotation.
    Numbered loading/debug labels retain their numbers and loading role;
    17174 restores the explicitly named Concourse rather than generic 구역.
    The lowercase city concourse in the planning prose at 7190 is excluded
    as a generic description, without inferring it names the same site.
    Do not alter the unrelated final city/artifact antecedent in the long
    journal, any Hyperian judgment, or historical D-18412/D-14642/D-15918
    findings. This is a new place-entity scope, not a tally recount or
    physical-shape claim. No direct manual name entry exists. All 27 exact
    case-insensitive affix/base/default source keys are covered, all default.
  TEXT

  def transform(_spec, key, text, source)
    raise 'unexpected Concourse key' unless key[0] == 'default' && key[2].empty? &&
      (SPANS.key?(key[1]) || key[1] == '7190')
    en = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    ja = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    zh = source.fetch('zh_text')
    if key[1] == '7190'
      raise 'generic planning prose changed' unless en.include?('city concourse')
      return [text, true]
    end
    raise 'Concourse source evidence changed' unless en.include?('Concourse') &&
      ja.include?('コンコース') && zh.include?('菱形广场')
    old, revised = SPANS.fetch(key[1])
    return [text, false] if text.include?(revised)
    raise 'Concourse Korean span changed' unless text.scan(old).length == 1
    changed = text.sub(old, revised)
    changed = changed.gsub("#{CANONICAL}은", "#{CANONICAL}는")
      .gsub("#{CANONICAL}을", "#{CANONICAL}를")
      .sub("#{CANONICAL}\u2019이라", "#{CANONICAL}\u2019라")
    [changed, false]
  end

  def apply
    specs = [{
      key: 'place:concourse', english: 'Concourse', category: 'place',
      korean: CANONICAL, aliases: 'Idylla Concourse|Main Concourse',
      variants: '콩코스|콘코스|컨코스|회랑|대회랑|중앙 홀|중앙 광장',
      count: 27, notes: NOTE
    }]
    ReviewedDiscoverySpecs.run(
      D, 'Idylla Concourse Named Hub', specs, NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

ConcourseD21674.apply if $PROGRAM_NAME == __FILE__
