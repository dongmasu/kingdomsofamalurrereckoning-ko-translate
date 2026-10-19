#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module ReviewDetectHiddenD21732
  extend self

  M = ReviewedNameBatches
  D = 21_732
  CANONICAL = '숨겨진 물건 찾기(Detect Hidden)'
  CONTEXT = <<~TEXT.strip.freeze
    Review all 22 exact Detect Hidden source keys across affix/base/default.
    English identifies the named gameplay skill; aligned Japanese and Chinese
    corroborate each source context. The official Korean manual reference
    gives 숨겨진 물건 찾기 (PDF p. 4). Reuse that spelling and pair only this
    named skill, including where it appears as a component of a skill-book
    label. Preserve unrelated entities, prior row decisions and global counts.
    Do not generalize this skill name to ordinary hidden objects or stealth.
  TEXT

  SPECS = [{
    key: 'skill:detect-hidden',
    english: 'Detect Hidden',
    category: 'skill',
    korean: CANONICAL,
    variants: '숨겨진 물건 찾기|은신 탐지|은신 감지|숨겨진 것 탐지|숨겨진 재물 감지|숨은 것 탐지',
    count: 22,
    notes: CONTEXT
  }].freeze

  SPANS = {
    ['base', '738', '11'] => [
      '기술서(은신 감지)', '숨겨진 물건 찾기(Detect Hidden) 기술서'
    ],
    ['base', '2620', '11'] => [
      '숨겨진 물건 찾기 보너스 재물',
      '숨겨진 물건 찾기(Detect Hidden) 보너스 재물'
    ],
    ['default', '5576', ''] => [
      '숨겨진 물건 찾기 기술',
      '숨겨진 물건 찾기(Detect Hidden) 기술'
    ],
    ['default', '8651', ''] => [
      '숨겨진 물건 찾기 훈련',
      '숨겨진 물건 찾기(Detect Hidden) 훈련'
    ],
    ['default', '9839', ''] => [
      '은신 탐지 기술',
      '숨겨진 물건 찾기(Detect Hidden) 기술'
    ],
    ['default', '14285', ''] => [
      '숨겨진 것 탐지 기술 보너스',
      '숨겨진 물건 찾기(Detect Hidden) 기술 보너스'
    ],
    ['default', '14744', ''] => [
      '숨겨진 물건 찾기 훈련사',
      '숨겨진 물건 찾기(Detect Hidden) 훈련사'
    ],
    ['default', '16697', ''] => [
      '숨겨진 물건 찾기 기술',
      '숨겨진 물건 찾기(Detect Hidden) 기술'
    ],
    ['default', '21040', ''] => [
      '은신 탐지 기술 강화',
      '숨겨진 물건 찾기(Detect Hidden) 기술 강화'
    ],
    ['default', '23143', ''] => [
      '숨겨진 물건 찾기 능력',
      '숨겨진 물건 찾기(Detect Hidden) 능력'
    ],
    ['default', '23679', ''] => [
      '숨겨진 물건 찾기', CANONICAL
    ],
    ['default', '25143', ''] => [
      '은신 감지 기술',
      '숨겨진 물건 찾기(Detect Hidden) 기술'
    ],
    ['default', '31775', ''] => [
      '숨겨진 재물 감지 보너스',
      '숨겨진 물건 찾기(Detect Hidden) 보너스 재물'
    ],
    ['default', '33993', ''] => [
      '숨겨진 물건 찾기 기술',
      '숨겨진 물건 찾기(Detect Hidden) 기술'
    ],
    ['default', '36542', ''] => [
      '숨겨진 물건 찾기 기술',
      '숨겨진 물건 찾기(Detect Hidden) 기술'
    ],
    ['default', '43804', ''] => [
      '숨겨진 물건 찾기 +1',
      '숨겨진 물건 찾기(Detect Hidden) +1'
    ],
    ['default', '45215', ''] => [
      '숨겨진 물건 찾기 기술',
      '숨겨진 물건 찾기(Detect Hidden) 기술'
    ],
    ['default', '48444', ''] => [
      '숨겨진 물건 찾기', CANONICAL
    ],
    ['default', '49758', ''] => [
      '숨은 것 탐지 기술',
      '숨겨진 물건 찾기(Detect Hidden) 기술'
    ],
    ['default', '54337', ''] => [
      '숨겨진 물건 찾기 스킬',
      '숨겨진 물건 찾기(Detect Hidden) 스킬'
    ],
    ['default', '58914', ''] => [
      '숨겨진 물건 찾기 기술',
      '숨겨진 물건 찾기(Detect Hidden) 기술'
    ]
  }.freeze
  COMPLETE_KEYS = [['default', '60992', '']].freeze

  def transform(_spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "English skill source missing at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z0-9])Detect Hidden(?![A-Za-z0-9])/i)

    if COMPLETE_KEYS.include?(key)
      raise "canonical skill pair missing at #{key.inspect}" unless text.include?(CANONICAL)
      return [text, false]
    end

    old, replacement = SPANS.fetch(key) do
      raise "unmapped Detect Hidden source key #{key.inspect}"
    end
    return [text, false] if text.include?(replacement)

    raise "expected one reviewed Korean span at #{key.inspect}" unless
      text.scan(Regexp.new(Regexp.escape(old))).length == 1

    [text.sub(old, replacement), false]
  end

  def preflight
    inventory = M.refresh_inventory
    sources = inventory.values.select do |source|
      JSON.parse(source.fetch('en_texts_json')).compact.any? do |text|
        text.match?(/(?<![A-Za-z0-9])Detect Hidden(?![A-Za-z0-9])/i)
      end
    end
    keys = sources.map { |source| M.key(source) }.sort
    expected = SPANS.keys + COMPLETE_KEYS
    raise "Detect Hidden source coverage changed: #{keys.inspect}" unless keys == expected.sort
    puts "D-#{D}: read-only; #{keys.length} exact source keys; " \
         "#{SPANS.length} cell edits; #{COMPLETE_KEYS.length} already canonical."
    keys
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['--check']
    ReviewDetectHiddenD21732.preflight
  when ['--apply']
    ReviewDetectHiddenD21732.preflight
    ReviewedDiscoverySpecs.run(
      ReviewDetectHiddenD21732::D,
      'Detect Hidden Named Skill',
      ReviewDetectHiddenD21732::SPECS,
      ReviewDetectHiddenD21732::CONTEXT,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, key, text, source|
      ReviewDetectHiddenD21732.transform(spec, key, text, source)
    }
  else
    abort 'Usage: review-detect-hidden-D21732.rb [--check|--apply]'
  end
end
