#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module ReviewDispellingD21735
  extend self

  M = ReviewedNameBatches
  D = 21_735
  CANONICAL = '디스펠(Dispelling)'
  CONTEXT = <<~TEXT.strip.freeze
    Review every exact English Dispelling hit across affix/base/default.
    English establishes the gameplay skill in labels, skill-book/trainer
    names, training, upgrades, and explicit skill descriptions. The official
    Korean manual extraction/reference gives 디스펠(Dispelling), PDF p. 4.
    Aligned Japanese 解呪 and Chinese 驱散 corroborate the mechanic.
    Annotate only direct references to the named gameplay skill. Exclude
    ordinary dispelling actions and the separate Hall of Dispelling place;
    do not generalize to lower-case verbs or standalone Dispel. Preserve all
    prior entity and translation decisions, exact tokens, and line breaks.
  TEXT

  ACCEPTED = {
    ['base', '914', '11'] => ['하급 해제 증폭', '하급 디스펠(Dispelling) 증폭'],
    ['base', '1412', '11'] => ['해제 교관', '디스펠(Dispelling) 교관'],
    ['base', '2154', '11'] => ['상급 해제 증폭', '상급 디스펠(Dispelling) 증폭'],
    ['base', '3347', '11'] => ['장인급 해제 증폭', '장인급 디스펠(Dispelling) 증폭'],
    ['base', '4525', '11'] => ['기술서(해제)', '디스펠(Dispelling) 기술서'],
    ['default', '2168', ''] => ['마법 해제', CANONICAL],
    ['default', '5793', ''] => ['마법 해제 기술', "#{CANONICAL} 기술"],
    ['default', '10500', ''] => ['저주 해제', CANONICAL],
    ['default', '10644', ''] => ['해제 +2', "#{CANONICAL} +2"],
    ['default', '10942', ''] => ['마법 해제는', "#{CANONICAL}은"],
    ['default', '14637', ''] => ['디스펠 스킬', "#{CANONICAL} 스킬"],
    ['default', '17295', ''] => ['디스펠 능력', "#{CANONICAL} 능력"],
    ['default', '17849', ''] => ['마법 해제', CANONICAL],
    ['default', '18736', ''] => ['디스펠은', "#{CANONICAL}은"],
    ['default', '19239', ''] => ['디스펠 기술', "#{CANONICAL} 기술"],
    ['default', '20676', ''] => ['마법 해제 기술', "#{CANONICAL} 기술"],
    ['default', '26737', ''] => ['해제 기술', "#{CANONICAL} 기술"],
    ['default', '27110', ''] => ['마법 해제', CANONICAL],
    ['default', '31362', ''] => ['디스펠 기술', "#{CANONICAL} 기술"],
    ['default', '35105', ''] => ['디스펠 교관', "#{CANONICAL} 교관"],
    ['default', '36442', ''] => ['마법 해제를 배우고', "#{CANONICAL}을 배우고"],
    ['default', '37323', ''] => ['디스펠 기술:', "#{CANONICAL} 기술:"],
    ['default', '38617', ''] => ['디스펠 기술', "#{CANONICAL} 기술"],
    ['default', '39801', ''] => ['디스펠 훈련', "#{CANONICAL} 훈련"],
    ['default', '40335', ''] => ['디스펠을 배우러', "#{CANONICAL}을 배우러"],
    ['default', '44019', ''] => ['디스펠 기술:', "#{CANONICAL} 기술:"],
    ['default', '45722', ''] => ['해제 기술이', "#{CANONICAL} 기술이"],
    ['default', '47244', ''] => ['디스펠 기술:', "#{CANONICAL} 기술:"],
    ['default', '49954', ''] => ['해제 기술 상승', "#{CANONICAL} 기술 상승"],
    ['default', '51303', ''] => ['해제 기술이', "#{CANONICAL} 기술이"],
    ['default', '52048', ''] => nil,
    ['default', '53582', ''] => ['해제 기술에 따라', "#{CANONICAL} 기술에 따라"],
    ['default', '56026', ''] => nil,
    ['default', '64440', ''] => ['디스펠 기술을 익히고', "#{CANONICAL} 기술을 익히고"]
  }.freeze

  EXCLUDED = [
    ['base', '3648', '11'],
    ['default', '3299', ''], ['default', '15430', ''],
    ['default', '18798', ''], ['default', '30153', ''],
    ['default', '33273', ''], ['default', '38176', ''],
    ['default', '38974', ''], ['default', '44543', ''],
    ['default', '46102', ''], ['default', '47133', ''],
    ['default', '56278', ''], ['default', '56325', ''],
    ['default', '56980', '']
  ].freeze

  SPECS = [{
    key: 'skill:dispelling',
    english: 'Dispelling',
    category: 'skill',
    korean: CANONICAL,
    variants: '마법 해제|해제|저주 해제|디스펠|디스펠 스킬|해제 스킬',
    count: 48,
    notes: CONTEXT
  }].freeze

  def transform(_spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "English Dispelling source missing at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])Dispelling(?![A-Za-z])/i)

    return [text, true] if EXCLUDED.include?(key)
    raise "unmapped Dispelling source key #{key.inspect}" unless ACCEPTED.key?(key)

    span = ACCEPTED.fetch(key)
    return [text, false] unless span
    old, replacement = span
    return [text, false] if text.include?(replacement)

    raise "expected one reviewed Korean span at #{key.inspect}" unless
      text.scan(Regexp.new(Regexp.escape(old))).length == 1

    [text.sub(old, replacement), false]
  end

  def preflight
    inventory = M.refresh_inventory
    definition = {
      'entity_key' => 'skill:dispelling',
      'english_canonical' => 'Dispelling',
      'english_aliases' => ''
    }
    generated = build_occurrences(inventory.values, [definition])
    keys = generated.map { |row| [row[1], row[2], row[3]] }.sort
    expected = (ACCEPTED.keys + EXCLUDED).sort
    raise "Dispelling source coverage changed: #{keys.inspect}" unless keys == expected
    puts "D-#{D}: read-only; #{keys.length} exact source keys; " \
         "#{ACCEPTED.length} skill references; #{EXCLUDED.length} excluded contexts."
    keys
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['--check']
    ReviewDispellingD21735.preflight
  when ['--apply']
    ReviewDispellingD21735.preflight
    ReviewedDiscoverySpecs.run(
      ReviewDispellingD21735::D,
      'Dispelling Named Gameplay Skill',
      ReviewDispellingD21735::SPECS,
      ReviewDispellingD21735::CONTEXT,
      '<!-- current-proper-name-batch:start -->'
    ) do |spec, key, text, source|
      ReviewDispellingD21735.transform(spec, key, text, source)
    end
  else
    abort 'Usage: review-dispelling-D21735.rb [--check|--apply]'
  end
end
