#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module ReviewFatelessOneD21743
  extend self

  M = ReviewedNameBatches
  D = 21_743
  CANONICAL = '운명 없는 자(Fateless One)'
  TERM = 'Fateless One'
  CONTEXT = <<~TEXT.strip.freeze
    Review every exact English Fateless One occurrence across the active
    affix/base/default inventory. Prior English-led context review D-19397
    establishes 운명 없는 자 as the active-corpus player epithet; aligned
    Japanese 運命なき者 and Chinese 无常之人 corroborate the same referent.
    Normalize the isolated 무명자 and 페이트리스 원 variants, and pair each
    Korean mention with the exact English epithet. This is a bounded title
    and annotation pass, not a reopening or recount of D-19397 or other
    historical sentence findings. Preserve particles, punctuation, markup,
    opaque tokens, and line breaks. The official Korean manual has no direct
    entry for this game-specific epithet.
  TEXT

  SPECS = [{
    key: 'title:fateless-one',
    english: TERM,
    category: 'title',
    korean: CANONICAL,
    variants: '운명 없는 자|무명자|페이트리스 원',
    count: 125,
    notes: CONTEXT
  }].freeze

  def transform(_spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "English Fateless One source missing at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])Fateless One(?![A-Za-z])/i)

    updated = text.dup
    updated.gsub!(/페이트리스 원이여/, "#{CANONICAL}여")
    updated.gsub!(/무명자(?:\s*\(Fateless One\))?/, CANONICAL)
    updated.gsub!(/페이트리스 원(?:\s*\(Fateless One\))?/, CANONICAL)
    updated.gsub!(/운명 없는 자(?!\s*\(Fateless One\))/, CANONICAL)

    raise "no recognized Korean epithet at #{key.inspect}" if updated == text &&
      !text.include?(CANONICAL)
    raise "canonical epithet missing at #{key.inspect}" unless
      updated.include?(CANONICAL)
    [updated, false]
  end

  def preflight
    inventory = M.refresh_inventory
    generated = build_occurrences(
      inventory.values,
      [{
        'entity_key' => 'title:fateless-one',
        'english_canonical' => TERM,
        'english_aliases' => ''
      }]
    )
    keys = generated.map { |row| [row[1], row[2], row[3]] }.sort
    raise "Fateless One source coverage changed: #{keys.length} keys" unless
      keys.length == 125 && keys.uniq.length == 125 &&
      keys.all? { |resource, _, _| resource == 'default' }

    edited = keys.count do |key|
      source = inventory.fetch(key)
      text, = transform(SPECS.first, key, source.fetch('work_text'), source)
      text != source.fetch('work_text')
    end
    raise "unexpected planned edit count #{edited}; expected 0 or 103" unless
      [0, 103].include?(edited)
    puts "D-#{D}: read-only; #{keys.length} exact source keys; " \
         "#{edited} cell edits; #{keys.length - edited} already canonical."
    keys
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['--check']
    ReviewFatelessOneD21743.preflight
  when ['--apply']
    ReviewFatelessOneD21743.preflight
    ReviewedDiscoverySpecs.run(
      ReviewFatelessOneD21743::D,
      'Fateless One Player Epithet',
      ReviewFatelessOneD21743::SPECS,
      ReviewFatelessOneD21743::CONTEXT,
      '<!-- current-proper-name-batch:start -->'
    ) do |spec, key, text, source|
      ReviewFatelessOneD21743.transform(spec, key, text, source)
    end
  else
    abort 'Usage: review-fateless-one-D21743.rb [--check|--apply]'
  end
end
