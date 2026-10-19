#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module ReviewFateswornFactionD21747
  extend self

  M = ReviewedNameBatches
  D = 21_747
  TERM = 'Fatesworn'
  CANONICAL = '운명에 맹세한 자들(Fatesworn)'
  CONTEXT = <<~TEXT.strip.freeze
    English explicitly says the group called themselves the Fatesworn, later
    became mercenaries, and are now known as the Warsworn; other rows describe
    them receiving an Erathi device, tracking armor pieces, and being the
    subject of stories and prophecy. Japanese フェイトスウォーン and Chinese
    誓命者 corroborate the collective name. Register only faction:the-fatesworn
    and standardize the 11 source rows that refer to this group as
    운명에 맹세한 자들(Fatesworn).
    Exclude 18 Hope of the Fatesworn armor/set component matches because the
    complete atomic item is separately registered; preserve default:8089's
    existing uncertain item identity. Exclude Fatesworn DLC/story-line uses,
    the complete quest title Threat of the Fatesworn, and default:60886 where
    Fatesworn is a player epithet. Exclude default:49657's ambiguous old
    Fatesworn armor reference from the faction scope without inferring that
    it is the Hope set. These exclusions do not alter existing item/title
    decisions or create DLC/quest identities. Preserve prior row findings,
    particles, markup, tokens, punctuation, and line breaks. The official
    Korean manual does not list this DLC-era faction.
  TEXT

  SPANS = {
    ['default', '4598', ''] => ['페이트스원(Fatesworn)', CANONICAL],
    ['default', '21502', ''] => ['페이트스원(Fatesworn)', CANONICAL],
    ['default', '37184', ''] => ['페이트스원', CANONICAL],
    ['default', '39916', ''] => ['페이트스원(Fatesworn)', CANONICAL],
    ['default', '43993', ''] => ['페이트스원(Fatesworn)', CANONICAL],
    ['default', '49217', ''] => ['페이트스원(Fatesworn)', CANONICAL],
    ['default', '62264', ''] => ['페이트스원(Fatesworn)', CANONICAL]
  }.freeze
  COMPLETE_KEYS = [
    ['default', '13237', ''], ['default', '3351', ''],
    ['default', '39567', ''], ['default', '56299', '']
  ].freeze
  EXCLUDED_KEYS = (
    [
      ['base', '1338', '11'], ['base', '2088', '11'],
      ['base', '2741', '11'], ['base', '3405', '11'],
      ['base', '3564', '11'],
      ['default', '505', ''], ['default', '649', ''],
      ['default', '1288', ''], ['default', '7559', ''],
      ['default', '8089', ''], ['default', '9966', ''],
      ['default', '15634', ''], ['default', '18681', ''],
      ['default', '35769', ''], ['default', '40120', ''],
      ['default', '41974', ''], ['default', '59401', ''],
      ['default', '59909', '']
    ] +
    [
      ['default', '29630', ''], ['default', '36174', ''],
      ['default', '9945', ''], ['default', '16239', ''],
      ['default', '64450', ''], ['default', '60886', ''],
      ['default', '62915', ''], ['default', '49657', '']
    ]
  ).freeze

  SPECS = [{
    key: 'faction:the-fatesworn',
    english: TERM,
    category: 'faction',
    korean: CANONICAL,
    variants: '페이트스원|페이트스워른|운명에 맹세한 자들',
    count: 37,
    notes: CONTEXT
  }].freeze

  def transform(_spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "English Fatesworn source missing at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])Fatesworn(?![A-Za-z])/i)

    return [text, true] if EXCLUDED_KEYS.include?(key)
    if COMPLETE_KEYS.include?(key)
      raise "canonical Fatesworn faction form missing at #{key.inspect}" unless
        text.include?(CANONICAL)
      return [text, false]
    end

    old, replacement = SPANS.fetch(key) do
      raise "unmapped Fatesworn faction source key #{key.inspect}"
    end
    return [text, false] if text.include?(replacement)
    raise "expected one reviewed Korean span at #{key.inspect}" unless
      text.scan(Regexp.new(Regexp.escape(old))).length == 1

    [text.sub(old, replacement), false]
  end

  def preflight
    inventory = M.refresh_inventory
    generated = build_occurrences(
      inventory.values,
      [{
        'entity_key' => 'faction:the-fatesworn',
        'english_canonical' => TERM,
        'english_aliases' => ''
      }]
    )
    keys = generated.map { |row| [row[1], row[2], row[3]] }.sort
    expected = (SPANS.keys + COMPLETE_KEYS + EXCLUDED_KEYS).sort
    raise "Fatesworn source coverage changed: #{keys.inspect}" unless
      keys.length == 37 && keys.uniq.length == 37 && keys == expected

    edits = keys.count do |key|
      source = inventory.fetch(key)
      text, = transform(SPECS.first, key, source.fetch('work_text'), source)
      text != source.fetch('work_text')
    end
    raise "unexpected planned edit count #{edits}; expected 0 or 7" unless
      [0, 7].include?(edits)
    puts "D-#{D}: read-only; #{keys.length} exact source keys; " \
         "#{edits} cell edits; #{COMPLETE_KEYS.length} canonical; " \
         "#{EXCLUDED_KEYS.length} outside faction scope."
    keys
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['--check']
    ReviewFateswornFactionD21747.preflight
  when ['--apply']
    ReviewFateswornFactionD21747.preflight
    ReviewedDiscoverySpecs.run(
      ReviewFateswornFactionD21747::D,
      'Fatesworn Faction',
      ReviewFateswornFactionD21747::SPECS,
      ReviewFateswornFactionD21747::CONTEXT,
      '<!-- current-proper-name-batch:start -->'
    ) do |spec, key, text, source|
      ReviewFateswornFactionD21747.transform(spec, key, text, source)
    end
  else
    abort 'Usage: review-fatesworn-faction-D21747.rb [--check|--apply]'
  end
end
