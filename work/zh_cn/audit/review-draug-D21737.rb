#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module ReviewDraugD21737
  extend self

  M = ReviewedNameBatches
  D = 21_737
  CANONICAL = '드라우그(Draug)'
  CONTEXT = <<~TEXT.strip.freeze
    Review all 32 exact English Draug source keys across base/default. English
    identifies a singular legendary creature in independent contexts, but the
    sources disagree whether Draug is a troll, a Jottun warmaster, or a beast.
    Register only the broad creature identity; do not resolve species, sex,
    biography, or chronology. Japanese ドラウグ and Chinese 德拉格 corroborate
    the name in aligned lore rows; the standalone label is untranslated across
    those locales. Reuse Korean 드라우그 and pair the name where independently
    referenced. Exclude all 21 atomic Draug's Toothpicks item-title contexts,
    and preserve its separate unique-item registration. Keep Draug-bane as the
    source's epithet while pairing only its referent Draug. The official Korean
    manual has no direct creature-roster entry; omission is not contrary
    evidence. Preserve every prior entity/key disposition and translation
    finding, exact line breaks, and unrelated text.
  TEXT

  SPANS = {
    ['default', '8680', ''] => [['드라우그', CANONICAL]],
    ['default', '19783', ''] => [['공포의 드라우그가', "공포의 #{CANONICAL}가"]],
    ['default', '29447', ''] => [['드라우그와 그 여파', "#{CANONICAL}와 그 여파"]],
    ['default', '31502', ''] => [
      ['괴물 드라우그가', "괴물 #{CANONICAL}가"],
      ['드라우그 이후에', "#{CANONICAL} 이후에"]
    ],
    ['default', '36882', ''] => [['전쟁대장 드라우그가', "전쟁대장 #{CANONICAL}가"]],
    ['default', '51692', ''] => [['드라우그를 사냥한 자', "#{CANONICAL}를 사냥한 자"]],
    ['default', '52096', ''] => [['드라그를 멸하고', "#{CANONICAL}를 멸하고"]],
    ['default', '58403', ''] => [['짐승 드라우그를', "짐승 #{CANONICAL}를"]]
  }.freeze
  COMPLETE_KEYS = [
    ['default', '6032', ''], ['default', '17768', ''],
    ['default', '54048', '']
  ].freeze
  ITEM_KEYS = [
    ['base', '4192', '11'],
    ['default', '81', ''], ['default', '2268', ''],
    ['default', '5672', ''], ['default', '5764', ''],
    ['default', '6990', ''], ['default', '14835', ''],
    ['default', '16689', ''], ['default', '16797', ''],
    ['default', '17679', ''], ['default', '23369', ''],
    ['default', '23511', ''], ['default', '24244', ''],
    ['default', '28223', ''], ['default', '32842', ''],
    ['default', '34317', ''], ['default', '36616', ''],
    ['default', '38083', ''], ['default', '40322', ''],
    ['default', '55124', ''], ['default', '56463', '']
  ].freeze

  SPECS = [{
    key: 'creature:draug',
    english: 'Draug',
    category: 'creature',
    korean: CANONICAL,
    variants: '드라우그|드라그',
    count: 32,
    notes: CONTEXT
  }].freeze

  def transform(_spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "English Draug source missing at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])Draug(?![A-Za-z])/i)

    return [text, true] if ITEM_KEYS.include?(key)
    if COMPLETE_KEYS.include?(key)
      raise "canonical Draug pair missing at #{key.inspect}" unless
        text.include?(CANONICAL)
      return [text, false]
    end

    spans = SPANS.fetch(key) { raise "unmapped Draug source key #{key.inspect}" }
    changed = text.dup
    spans.each do |old, replacement|
      next if changed.include?(replacement)
      count = changed.scan(Regexp.new(Regexp.escape(old))).length
      raise "expected one reviewed Korean span at #{key.inspect}; got #{count}" unless count == 1
      changed.sub!(old, replacement)
    end
    [changed, false]
  end

  def preflight
    inventory = M.refresh_inventory
    generated = build_occurrences(
      inventory.values,
      [{
        'entity_key' => 'creature:draug',
        'english_canonical' => 'Draug',
        'english_aliases' => ''
      }]
    )
    keys = generated.map { |row| [row[1], row[2], row[3]] }.sort
    expected = (SPANS.keys + COMPLETE_KEYS + ITEM_KEYS).sort
    raise "Draug source coverage changed: #{keys.inspect}" unless keys == expected
    puts "D-#{D}: read-only; #{keys.length} exact source keys; " \
         "#{SPANS.length} independent edits; #{ITEM_KEYS.length} item contexts excluded."
    keys
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['--check']
    ReviewDraugD21737.preflight
  when ['--apply']
    ReviewDraugD21737.preflight
    ReviewedDiscoverySpecs.run(
      ReviewDraugD21737::D,
      'Draug Named Creature',
      ReviewDraugD21737::SPECS,
      ReviewDraugD21737::CONTEXT,
      '<!-- current-proper-name-batch:start -->'
    ) do |spec, key, text, source|
      ReviewDraugD21737.transform(spec, key, text, source)
    end
  else
    abort 'Usage: review-draug-D21737.rb [--check|--apply]'
  end
end
