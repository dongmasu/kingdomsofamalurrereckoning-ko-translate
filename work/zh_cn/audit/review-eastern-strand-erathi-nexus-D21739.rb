#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module ReviewEasternStrandErathiNexusD21739
  extend self

  M = ReviewedNameBatches
  D = 21_739
  CONTEXT = <<~TEXT.strip.freeze
    Review the exact named place terms Eastern Strand and Erathi Nexus across
    base/default. English identifies the Eastern Strand as the region where
    the druid's students live and the source of the named armor pieces;
    Japanese 東ストランド and Chinese 东部海滩 corroborate the coastal
    location. Reuse 동쪽 해안 and pair the complete English name.
    English describes the Erathi Nexus as the destination that guides the
    player through Chaos dungeons to the armor pieces; Japanese エラシ・ネクサス
    and Chinese 埃拉西节点 corroborate the named site. Reuse the established
    Korean 에라시 넥서스(Erathi Nexus), replacing only the inconsistent base
    label. The official Korean manual has no direct entry for either place;
    omission is not contrary evidence. Preserve the separate Erathi people
    entry and all existing row/translation findings, tokens, and line breaks.
  TEXT

  SPECS = [
    {
      key: 'place:eastern-strand',
      english: 'Eastern Strand',
      category: 'place',
      korean: '동쪽 해안(Eastern Strand)',
      variants: '동쪽 해안|동부 해안|동부 해변',
      count: 2,
      notes: CONTEXT
    },
    {
      key: 'place:erathi-nexus',
      english: 'Erathi Nexus',
      category: 'place',
      korean: '에라시 넥서스(Erathi Nexus)',
      variants: '에라시 결절|에라시 넥서스|에라시 노드',
      count: 4,
      notes: CONTEXT
    }
  ].freeze

  SPANS = {
    ['default', '59672', ''] => ['동쪽 해안', '동쪽 해안(Eastern Strand)'],
    ['base', '2885', '11'] => ['에라시(Erathi) 결절', '에라시 넥서스(Erathi Nexus)'],
    ['default', '25568', ''] => ['에라시(Erathi) 넥서스', '에라시 넥서스(Erathi Nexus)']
  }.freeze
  COMPLETE_KEYS = [
    ['default', '24089', ''],
    ['default', '18681', ''], ['default', '55786', '']
  ].freeze

  def transform(spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    term = spec.fetch(:english)
    raise "English #{term} source missing at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)

    if COMPLETE_KEYS.include?(key)
      raise "canonical place pair missing at #{key.inspect}" unless
        text.include?("(#{term})")
      return [text, false]
    end

    old, replacement = SPANS.fetch(key) do
      raise "unmapped place source key #{key.inspect}"
    end
    return [text, false] if text.include?(replacement)
    raise "expected one reviewed Korean span at #{key.inspect}" unless
      text.scan(Regexp.new(Regexp.escape(old))).length == 1

    [text.sub(old, replacement), false]
  end

  def preflight
    inventory = M.refresh_inventory
    generated = SPECS.flat_map do |spec|
      build_occurrences(
        inventory.values,
        [{
          'entity_key' => spec.fetch(:key),
          'english_canonical' => spec.fetch(:english),
          'english_aliases' => ''
        }]
      )
    end
    actual = generated.group_by { |row| row[0] }.transform_values do |rows|
      rows.map { |row| [row[1], row[2], row[3]] }.sort
    end
    expected = {
      'place:eastern-strand' => [
        ['default', '24089', ''], ['default', '59672', '']
      ],
      'place:erathi-nexus' => [
        ['base', '2885', '11'], ['default', '18681', ''],
        ['default', '25568', ''], ['default', '55786', '']
      ]
    }
    raise "place source coverage changed: #{actual.inspect}" unless
      actual.transform_values { |keys| keys.uniq.sort } == expected.transform_values(&:sort)
    puts "D-#{D}: read-only; #{generated.map { |row| [row[1], row[2], row[3]] }.uniq.length} " \
         "distinct source keys across #{SPECS.length} place entities; " \
         "#{SPANS.length} cell edits; #{COMPLETE_KEYS.length} already canonical."
    generated
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['--check']
    ReviewEasternStrandErathiNexusD21739.preflight
  when ['--apply']
    ReviewEasternStrandErathiNexusD21739.preflight
    ReviewedDiscoverySpecs.run(
      ReviewEasternStrandErathiNexusD21739::D,
      'Eastern Strand and Erathi Nexus Places',
      ReviewEasternStrandErathiNexusD21739::SPECS,
      ReviewEasternStrandErathiNexusD21739::CONTEXT,
      '<!-- current-proper-name-batch:start -->'
    ) do |spec, key, text, source|
      ReviewEasternStrandErathiNexusD21739.transform(spec, key, text, source)
    end
  else
    abort 'Usage: review-eastern-strand-erathi-nexus-D21739.rb [--check|--apply]'
  end
end
