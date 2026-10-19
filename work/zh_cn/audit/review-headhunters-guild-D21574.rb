#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module ReviewHeadhuntersGuildD21574
  extend self
  D = 21_574
  GUILD = 'organization:headhunter-guild'
  QUEST = 'quest:headhunters-hunted'
  REPLACEMENTS = {
    '7074' => ['헤드헌터 사냥', '헤드헌터단(Headhunters) 사냥'],
    '8463' => ['죽음의 사냥꾼', '악명 높은 헤드헌터단원(Headhunter)'],
    '9493' => ['헤드헌터 표식', '헤드헌터단원(Headhunter)의 표식'],
    '17827' => ['헤드헌터(Headhunter)의', '헤드헌터단원(Headhunter)의'],
    '18395' => ['다섯 헤드헌터(Headhunter)에게서', '다섯 헤드헌터단원(Headhunters)에게서'],
    '26436' => ['흉악한 현상금 사냥꾼', '흉악한 헤드헌터단원(Headhunter)'],
    '29912' => ['헤드헌터단의', '헤드헌터단(Headhunters)의'],
    '31277' => ['악명 높은 현상금 사냥꾼의', '악명 높은 헤드헌터단원(Headhunter)의'],
    '31371' => ['헤드헌터 조직원들을', '헤드헌터단(Headhunters) 단원들을'],
    '41074' => ['현상금 사냥꾼들', '헤드헌터단(Headhunters)'],
    '46318' => ['헤드헌터라 불렀지', '헤드헌터단(Headhunters)이라 불렀지'],
    '46633' => ['위험한 헤드헌터 ', '위험한 헤드헌터단원(Headhunter) '],
    '54611' => ['위험한 헤드헌터 ', '위험한 헤드헌터단원(Headhunter) '],
    '61586' => ['헤드헌터(Headhunters)가', '헤드헌터단(Headhunters)이'],
    '62748' => ['헤드헌터(Headhunter)의', '헤드헌터단원(Headhunter)의']
  }.freeze
  SPECS = [
    {
      key: GUILD, english: 'Headhunters', korean: '헤드헌터단(Headhunters)',
      aliases: 'Headhunter', category: 'organization', count: 17,
      variants: '헤드헌터단|헤드헌터|현상금 사냥꾼들|현상금 사냥꾼|죽음의 사냥꾼',
      notes: 'English default:46318 calls the Headhunters a guild of legendary Mitharan warriors; default:57407 explicitly says this guild broke up after Crownhold fell and its five leaders formed rival mercenary gangs. Default:29912 names the five wanted members. Japanese ヘッドハンター and Chinese 猎头者 corroborate this specific organization and its members. Retain the existing proper label 헤드헌터단 and pair organization references as 헤드헌터단(Headhunters). Explicit individual-member references use 헤드헌터단원(Headhunter), or (Headhunters) where the source uses plural; do not turn every bounty hunter into this guild. The only 17 lexical keys all belong to this described quest context. Exclude the nested guild hit inside the complete Headhunters Hunted title, which is paired atomically as a quest label. Preserve the historical disbanding and separate rival gangs.'
    },
    {
      key: QUEST, english: 'Headhunters Hunted', korean: '사냥당한 헤드헌터단(Headhunters Hunted)',
      category: 'quest', count: 1, variants: '사냥당한 현상금 사냥꾼들',
      notes: 'English default:52264 supplies the complete Headhunters Hunted label in the same wanted-five quest scope; Japanese 狩ったヘッドハンター and Chinese 猎头者被猎杀 corroborate. Preserve the existing Korean passive title construction 사냥당한, use the confirmed guild name, and annotate the complete title once. Do not register the separate imperative Hunt the Headhunters as another quest title.'
    }
  ].freeze
  CONTEXT = <<~TEXT.chomp
    Check all affix/base/default sources; this guild/title scope has 17
    distinct default keys and 18 entity matches, with no affix/base hits.
    Distinguish the named historical guild, its individually described
    members, the complete quest title, and the imperative objective.
    English controls identity/meaning; Japanese and Chinese corroborate.
    The official Korean manual supplies no exact guild or quest entry.
    Preserve the newly paired five personal names, the Mitharan and Crownhold
    decisions, token/head wording, rewards, title punctuation and line breaks.
    Correct subject particles only where the explicitly changed group noun
    ends in 단. Do not merge the individual rival gangs or claim the old guild
    remains unified. Existing dispositions and historical totals are untouched.
  TEXT

  def transform(entity, key, text)
    raise 'unexpected resource/variant' unless key[0] == 'default' && key[2].empty?
    id = key[1]
    if entity == QUEST
      raise 'unexpected complete quest title' unless id == '52264' && text == '사냥당한 현상금 사냥꾼들'
      return [SPECS.last.fetch(:korean), false]
    end
    raise 'unexpected entity' unless entity == GUILD
    return [text, true] if id == '52264'

    changes = if id == '57407'
                [
                  ['길드인 헤드헌터가 해체되어', '길드인 헤드헌터단(Headhunters)이 해체되어'],
                  ['헤드헌터 각각의 표식을', '헤드헌터단원(Headhunters) 각각의 표식을']
                ]
              else
                [REPLACEMENTS.fetch(id)]
              end
    updated = text.dup
    changes.each do |before, after|
      raise "source-local Korean guild span differs #{id}: #{before}" unless updated.scan(before).length == 1
      updated.sub!(before, after)
    end
    [updated, false]
  end

  def apply
    ReviewedDiscoverySpecs.run(
      D, 'Headhunters Guild, Members And Quest Title', SPECS, CONTEXT,
      '## D-21573: Jorum Source Variants And Distinct Full Names'
    ) do |spec, key, text, _source|
      transform(spec.fetch(:key), key, text)
    end
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-headhunters-guild-D21574.rb apply' unless ARGV == ['apply']
  ReviewHeadhuntersGuildD21574.apply
end
