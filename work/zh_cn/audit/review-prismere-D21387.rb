#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module PrismereD21387
  module_function

  ROOT_PATTERN = /(프리즘미어|프리즈미어|프리스미어|프리즘어)(\s*\((?:Prismere)\))?/i

  def complete_label_covers?(text, english, match_end)
    suffix = text[match_end, 48].to_s
    boundary = suffix.index(/[\r\n.!?]/)
    suffix = suffix[0...boundary] if boundary

    suffix.to_enum(:scan, /\(([^()\r\n]+)\)/).any? do
      label = Regexp.last_match(1)
      label.match?(/(?<![A-Za-z])Prismere(?![A-Za-z])/i) &&
        english.match?(/(?<![A-Za-z])#{Regexp.escape(label)}(?![A-Za-z])/i)
    end
  end

  def transform(text, english)
    edits = []
    text.to_enum(:scan, ROOT_PATTERN).each do
      match = Regexp.last_match
      exact_pair = match[2]
      covered_by_complete_label =
        !exact_pair && complete_label_covers?(text, english, match.end(0))
      replacement = if exact_pair
                      '프리즘미어(Prismere)'
                    elsif covered_by_complete_label
                      '프리즘미어'
                    else
                      '프리즘미어(Prismere)'
                    end
      edits << [match.begin(0), match.end(0), replacement]
    end
    result = text.dup
    edits.reverse_each { |start_at, end_at, value| result[start_at...end_at] = value }
    [result, false]
  end

  CONTEXT = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:12074 defines Prismere as a powerful crystal that amplifies
    magic, and default:12372 says it was named Prismere and describes its
    origin beneath Amethyn. Japanese プリスミア/プリズマー and Chinese 赤晶
    corroborate the same magical crystal. Reuse the established Korean
    프리즘미어 stem from the already reviewed Prismere Dust reagent, while
    registering Prismere itself as a separate resource. Preserve complete
    bilingual compounds such as Prismere Dust and other source-supported item
    labels without adding nested component parentheses; pair the resource
    component where no complete English label already covers it. The official
    Korean manual PDF p. 8 gives reagent and recipe context but no direct
    Prismere spelling. All three resources were searched. The Dust entity and
    its prior row decisions are not reopened or recounted.
  TEXT

  SPECS = [{
    key: 'resource:prismere',
    english: 'Prismere',
    category: 'resource',
    korean: '프리즘미어(Prismere)',
    variants: '프리즈미어|프리스미어|프리즘어',
    count: 199,
    notes: CONTEXT
  }].freeze
end

if $PROGRAM_NAME == __FILE__
  ReviewedDiscoverySpecs.run(
    21_387,
    'Prismere Resource',
    PrismereD21387::SPECS,
    PrismereD21387::CONTEXT,
    '## D-21386: Rhyderk Weapon, Component And Ballad'
  ) do |_spec, _key, text, source|
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    PrismereD21387.transform(text, english)
  end
end
