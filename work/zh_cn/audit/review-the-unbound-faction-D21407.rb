#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module TheUnboundFactionD21407
  module_function

  POSITIVE_IDS = %w[
    70 762 6813 9550 10227 10850 11386 11635 12671 12749 12809 14365
    15544 19253 20886 21031 22105 26317 26708 28012 31557 31744 34279
    35616 36887 40058 40865 40957 41879 43931 46766 46900 55778 56677
    57881 59508 62933 62976 63538 65093
  ].freeze

  EXCLUDED_IDS = %w[
    3867 5657 10655 10807 11399 12248 17306 20373 21777 23649 26909
    30920 33957 35815 39678 48676 57875
  ].freeze

  KOREAN_REFERENCE = /
    (?<name>
      결박을\ 벗어난\ 자들|
      결박되지\ 않은\ 자들|
      속박받지\ 않는\ 자들|
      속박에서\ 벗어난\ 자들|
      속박에서\ 풀려난\ 자들|
      속박\ 없는\ 자들|
      속박되지\ 않은\ 자들|
      결속되지\ 않은\ 자들|
      해방된\ 자들|
      언바운드
    )
    (?:\((?:The\ )?Unbound\))?
    (?<particle>에게서는|에게서|에게는|들에게|에게|라고|으로|로|은|는|이|가|을|를|의|와|과|에|만|도|에서|에선)?
  /x.freeze

  def transform(text, id)
    raise "outside faction-reference scope: #{id}" unless POSITIVE_IDS.include?(id)
    matches = text.to_enum(:scan, KOREAN_REFERENCE).count
    raise "expected one Korean faction reference at #{id}, found #{matches}" unless matches == 1

    text.gsub(KOREAN_REFERENCE) do
      particle = $~[:particle]
      particle = { '은' => '는', '이' => '가', '을' => '를',
                   '과' => '와', '으로' => '로' }.fetch(particle, particle)
      "언바운드(The Unbound)#{particle}"
    end
  end

  def run
    raise 'overlapping or incomplete D-21407 scope' unless
      (POSITIVE_IDS & EXCLUDED_IDS).empty? &&
      POSITIVE_IDS.length == 40 && EXCLUDED_IDS.length == 17

    context = <<~TEXT.gsub(/\s+/, ' ').strip
      English identifies The Unbound as Lyenna's named sect and its
      collective membership (for example, default:6813 calls it her new
      sect, 56677 calls it a cult, and 62933 calls it a group). Japanese
      縛られざる者 and Chinese 自由者 support the collective reading.
      Use the bilingual faction form 언바운드(The Unbound), with no global
      English alias for the shorter Unbound. Reviewed 57 exact source hits:
      normalize only the 40 row-local faction references enumerated in the
      review script. Exclude 15 Unbound Path/lore references and the two
      already atomic Church of the Unbound labels at 5657 and 23649; do not
      nest a faction annotation inside those complete labels. The separate
      Unbound Path entity is not merged with the sect. Prior translation
      findings about faction identity/spelling are superseded only for this
      named-entity form; historical row dispositions, unrelated questions,
      and global tallies are not rewritten or recounted. All active
      affix/base/default resources were searched. The official Korean
      manual does not enumerate this DLC sect.
    TEXT
    spec = {
      key: 'faction:the-unbound', english: 'The Unbound',
      category: 'faction', korean: '언바운드(The Unbound)',
      variants: '결박을 벗어난 자들|결박되지 않은 자들|속박받지 않는 자들|' \
                '속박에서 벗어난 자들|속박에서 풀려난 자들|속박 없는 자들|' \
                '해방된 자들|결속되지 않은 자들|언바운드(Unbound)|언바운드',
      count: 57,
      notes: 'Named sect and collective; Unbound Path and Church of the Unbound are separate scopes. No global Unbound alias.'
    }
    ReviewedDiscoverySpecs.run(
      21_407, 'The Unbound Faction Display', [spec], context,
      '## D-21406: Fieros Lighthouse Complete Display Label'
    ) do |_spec, key, text, _source|
      raise "unexpected Unbound resource #{key.inspect}" unless key[0] == 'default' && key[2].empty?
      id = key[1]
      if EXCLUDED_IDS.include?(id)
        [text, true]
      else
        [transform(text, id), false]
      end
    end
  end
end

TheUnboundFactionD21407.run if $PROGRAM_NAME == __FILE__
