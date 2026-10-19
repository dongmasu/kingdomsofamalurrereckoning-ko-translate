#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module ReviewFateshiftD21746
  extend self

  M = ReviewedNameBatches
  D = 21_746
  TERM = 'Fateshift'
  CANONICAL = '운명 전환(Fateshift)'
  INFLECTIONS = %w[Fateshifts Fateshifting Fateshifted].freeze
  CONTEXT = <<~TEXT.strip.freeze
    Review all exact Fateshift action/mechanic references and the source
    inflections Fateshifts, Fateshifting, and Fateshifted across affix/base/
    default. Reckoning tutorial and combat-stat contexts establish a named
    gameplay action, not an unlockable skill. Japanese フェイトシフト and
    Chinese 改命 corroborate the mechanic; standardize its Korean name as
    운명 전환(Fateshift), preserving each Korean grammatical form. At
    default:35098, translate the awkward verb phrase as 적에게
    운명 전환(Fateshift)을 사용하기 before the enemy defeat instruction,
    matching Japanese フェイトシフトを行う and Chinese 改命一击.
    Fateshifter's at six affix variants is a distinct derivative/agent term
    and is excluded for separate review; no person or faction identity is
    inferred. Preserve D-5455, D-18393, D-11378, and D-11769 as historical
    row findings; this narrow term pass does not resolve or recount them.
    Preserve markup, particles, opaque tokens, numbers, and line breaks.
    The official Korean manual has no direct Fateshift entry.
  TEXT

  SPANS = {
    ['affix', '297', '11'] => ['운명 전환', CANONICAL],
    ['affix', '297', '12'] => ['운명 전환', CANONICAL],
    ['affix', '297', '14'] => ['운명 전환', CANONICAL],
    ['affix', '297', '21'] => ['운명 전환', CANONICAL],
    ['affix', '297', '22'] => ['운명 전환', CANONICAL],
    ['affix', '297', '24'] => ['운명 전환', CANONICAL],
    ['default', '14623', ''] => ['운명 바꾸기', CANONICAL],
    ['default', '17275', ''] => ['운명 전환 실행 횟수', "#{CANONICAL} 실행 횟수"],
    ['default', '21733', ''] => ['운명 전환', CANONICAL],
    ['default', '22183', ''] => ['구형 운명 전환 무기 강화', "구형 #{CANONICAL} 무기 강화"],
    ['default', '35098', ''] => ['적을 페이트시프트하기', "적에게 #{CANONICAL}을 사용하기"],
    ['default', '36553', ''] => ['운명 전환 무기 강화', "#{CANONICAL} 무기 강화"],
    ['default', '36991', ''] => ['운명 전환', CANONICAL],
    ['default', '49232', ''] => ['운명 전환된 적 수', "#{CANONICAL}된 적 수"]
  }.freeze
  EXTRA_SPANS = {
    ['default', '35098', ''] => [
      ['페이트시프트를 사용하면', "#{CANONICAL}을 사용하면"]
    ]
  }.freeze
  COMPLETE_KEYS = [
    ['default', '51403', ''], ['default', '61593', '']
  ].freeze

  SPECS = [{
    key: 'lore:fateshift',
    english: TERM,
    category: 'lore term',
    korean: CANONICAL,
    aliases: INFLECTIONS.join('|'),
    variants: '운명 전환|운명 바꾸기|페이트시프트',
    count: 16,
    notes: CONTEXT
  }].freeze

  def source_has_term?(source)
    texts = JSON.parse(source.fetch('en_texts_json')).compact
    terms = [TERM, *INFLECTIONS]
    texts.any? do |text|
      terms.any? do |term|
        text.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
      end
    end
  end

  def transform(_spec, key, text, source)
    raise "English Fateshift source missing at #{key.inspect}" unless
      source_has_term?(source)

    if COMPLETE_KEYS.include?(key)
      raise "canonical Fateshift pair missing at #{key.inspect}" unless
        text.include?(CANONICAL)
      return [text, false]
    end

    steps = [SPANS.fetch(key) do
      raise "unmapped Fateshift source key #{key.inspect}"
    end, *EXTRA_SPANS.fetch(key, [])]
    updated = text.dup
    steps.each do |old, replacement|
      next if updated.include?(replacement)
      raise "expected one reviewed Korean span at #{key.inspect}" unless
        updated.scan(Regexp.new(Regexp.escape(old))).length == 1
      updated.sub!(old, replacement)
    end

    [updated, false]
  end

  def preflight
    inventory = M.refresh_inventory
    generated = build_occurrences(
      inventory.values,
      [{
        'entity_key' => 'lore:fateshift',
        'english_canonical' => TERM,
        'english_aliases' => INFLECTIONS.join('|')
      }]
    )
    keys = generated.map { |row| [row[1], row[2], row[3]] }.sort
    expected = (SPANS.keys + COMPLETE_KEYS).sort
    raise "Fateshift source coverage changed: #{keys.inspect}" unless
      keys == expected
    raise 'Fateshifter derivative was merged into Fateshift scope' if
      keys.any? { |_, id, _| id == '470' }

    edited = keys.count do |key|
      source = inventory.fetch(key)
      text, = transform(SPECS.first, key, source.fetch('work_text'), source)
      text != source.fetch('work_text')
    end
    raise "unexpected planned edit count #{edited}; expected 0 or 14" unless
      [0, 14].include?(edited)
    puts "D-#{D}: read-only; #{keys.length} exact source keys; " \
         "#{edited} cell edits; #{keys.length - edited} already canonical."
    keys
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['--check']
    ReviewFateshiftD21746.preflight
  when ['--apply']
    ReviewFateshiftD21746.preflight
    ReviewedDiscoverySpecs.run(
      ReviewFateshiftD21746::D,
      'Fateshift Gameplay Mechanic',
      ReviewFateshiftD21746::SPECS,
      ReviewFateshiftD21746::CONTEXT,
      '<!-- current-proper-name-batch:start -->'
    ) do |spec, key, text, source|
      ReviewFateshiftD21746.transform(spec, key, text, source)
    end
  else
    abort 'Usage: review-fateshift-D21746.rb [--check|--apply]'
  end
end
