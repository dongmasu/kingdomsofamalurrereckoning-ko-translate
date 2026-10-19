#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module ReviewDestinyStoneD21736
  extend self

  M = ReviewedNameBatches
  D = 21_736
  CANONICAL = '운명의 돌(Destiny Stone)'
  CONTEXT = <<~TEXT.strip.freeze
    Review all 13 exact Destiny Stone source keys across base/default. English
    describes one singular artifact created by the first Fateweavers, kept at
    the Theater of Fate, and touched or shattered in the aligned story rows.
    Japanese 宿命の石 and Chinese 命运之石/天命之石 corroborate the same
    artifact. Reuse the established Korean 운명의 돌 and pair the complete
    English name. The official Korean manual extraction/reference has no
    direct Destiny Stone entry; its omission is not contrary evidence.
    Keep the separate Codex of Destiny identity and all prior row decisions.
    Preserve unrelated names, particles, tokens, markup, and line breaks.
  TEXT

  SPANS = {
    ['base', '4647', '11'] => ['운명의 돌', CANONICAL],
    ['default', '2005', ''] => ['운명의 돌에', "#{CANONICAL}에"],
    ['default', '25281', ''] => ['운명의 돌을', "#{CANONICAL}을"],
    ['default', '38299', ''] => ['운명의 돌', CANONICAL],
    ['default', '40631', ''] => ['운명의 돌', CANONICAL],
    ['default', '47834', ''] => ['운명의 돌은', "#{CANONICAL}은"],
    ['default', '48035', ''] => ['운명의 돌에 손대기', "#{CANONICAL}에 손대기"],
    ['default', '48719', ''] => ['운명의 돌이 있지', "#{CANONICAL}이 있지"],
    ['default', '48917', ''] => ['운명의 돌은', "#{CANONICAL}은"]
  }.freeze
  COMPLETE_KEYS = [
    ['default', '54811', ''], ['default', '5514', ''],
    ['default', '60407', ''], ['default', '7042', '']
  ].freeze

  SPECS = [{
    key: 'unique_item:destiny-stone',
    english: 'Destiny Stone',
    category: 'unique item',
    korean: CANONICAL,
    variants: '운명의 돌',
    count: 13,
    notes: CONTEXT
  }].freeze

  def transform(_spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "English Destiny Stone source missing at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])Destiny Stone(?![A-Za-z])/i)

    if COMPLETE_KEYS.include?(key)
      raise "canonical Destiny Stone pair missing at #{key.inspect}" unless
        text.include?(CANONICAL)
      return [text, false]
    end

    old, replacement = SPANS.fetch(key) do
      raise "unmapped Destiny Stone source key #{key.inspect}"
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
        'entity_key' => 'unique_item:destiny-stone',
        'english_canonical' => 'Destiny Stone',
        'english_aliases' => ''
      }]
    )
    keys = generated.map { |row| [row[1], row[2], row[3]] }.sort
    expected = (SPANS.keys + COMPLETE_KEYS).sort
    raise "Destiny Stone source coverage changed: #{keys.inspect}" unless
      keys == expected
    puts "D-#{D}: read-only; #{keys.length} exact source keys; " \
         "#{SPANS.length} cell edits; #{COMPLETE_KEYS.length} already canonical."
    keys
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['--check']
    ReviewDestinyStoneD21736.preflight
  when ['--apply']
    ReviewDestinyStoneD21736.preflight
    ReviewedDiscoverySpecs.run(
      ReviewDestinyStoneD21736::D,
      'Destiny Stone Named Artifact',
      ReviewDestinyStoneD21736::SPECS,
      ReviewDestinyStoneD21736::CONTEXT,
      '<!-- current-proper-name-batch:start -->'
    ) do |spec, key, text, source|
      ReviewDestinyStoneD21736.transform(spec, key, text, source)
    end
  else
    abort 'Usage: review-destiny-stone-D21736.rb [--check|--apply]'
  end
end
