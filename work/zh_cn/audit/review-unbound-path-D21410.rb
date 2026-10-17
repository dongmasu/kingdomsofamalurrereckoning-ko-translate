#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module UnboundPathD21410
  module_function

  IDS = %w[
    3867 10655 10807 11399 12248 16832 17306 20373 21777 22623 26909
    30920 33957 35815 39678 44487 48676 48909 50932 57875
  ].freeze

  KOREAN_PATH = /
    (?<name>
      언바운드의\ 길|
      속박\s*없는\ 길|
      속박받지\ 않는\ 길|
      속박되지\ 않는\ 길|
      속박되지\ 않은\ 길
    )
    (?:\((?:The\s+)?Unbound\s+Path\))?
    (?<particle>이란|에는|에서|에게|으로|로|은|는|이|가|을|를|의|에|와|과|만|도)?
  /ix.freeze

  def transform(text, id)
    raise "outside Unbound Path scope: #{id}" unless IDS.include?(id)
    matches = text.to_enum(:scan, KOREAN_PATH).count
    raise "expected one path reference at #{id}, found #{matches}" unless matches == 1

    text.gsub(KOREAN_PATH) do
      "언바운드의 길(Unbound Path)#{$~[:particle]}"
    end
  end

  def run
    context = <<~TEXT.gsub(/\s+/, ' ').strip
      English repeatedly treats Unbound Path as a named lore concept and
      journey: default:16832 calls it a phrase on Mithrolith runes,
      33957 gives its location, and 48909 explicitly says it is a phrase
      Ivan has heard before. Japanese 縛られざる道 and Chinese 自由之路
      corroborate the same distinct path concept. Use the canonical
      언바운드의 길(Unbound Path), not the separate faction
      언바운드(The Unbound) registered in D-21407. The case variation in
      source prose/inscriptions does not establish a different entity.
      Reviewed all 20 exact default occurrences; no global Unbound alias
      is added, and no affix/base occurrence of this exact concept exists.
      This resolves the scoped name-form questions in D-3321/default:11399
      and D-14964/default:48909 only; historical translation dispositions,
      unrelated Order-of-Mitharu questions, and global tallies remain
      unchanged. The official Korean manual does not enumerate this DLC
      lore phrase.
    TEXT
    spec = {
      key: 'lore term:unbound-path', english: 'Unbound Path',
      category: 'lore term', korean: '언바운드의 길(Unbound Path)',
      variants: '속박 없는 길|속박받지 않는 길|속박되지 않는 길|' \
                '속박되지 않은 길|언바운드의 길|언바운드의 길(Unbound path)',
      count: 20,
      notes: 'Named lore path/journey, distinct from faction The Unbound; no global Unbound alias.'
    }
    ReviewedDiscoverySpecs.run(
      21_410, 'Unbound Path Lore Concept', [spec], context,
      '## D-21409: Row-Scoped Short Unbound References'
    ) do |_spec, key, text, _source|
      raise "unexpected Unbound Path resource #{key.inspect}" unless
        key[0] == 'default' && key[2].empty? && IDS.include?(key[1])
      [transform(text, key[1]), false]
    end
  end
end

UnboundPathD21410.run if $PROGRAM_NAME == __FILE__
