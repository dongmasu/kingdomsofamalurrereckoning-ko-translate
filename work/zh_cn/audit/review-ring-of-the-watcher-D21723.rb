#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module ReviewRingOfTheWatcherD21723
  extend self
  SPEC = {
    key: 'place:ring-of-the-watcher',
    english: 'Ring of the Watcher', category: 'place',
    korean: '감시자의 고리(Ring of the Watcher)',
    variants: '감시자의 고리',
    count: 4,
    notes: 'English default:45621 explicitly describes the Ring of the Watcher as a monolithic circle of standing stones on northern Gallows End, and default:57117 calls it an ancient ruin. Japanese 監視者の遺跡 and Chinese 哨兵之环/守望者之环 corroborate the site. default:62099 describes the Scion entering it, and default:63025 quotes its name on a treasure-map fragment. Reuse the existing complete Korean pair at default:45621/62099. It is not the Hierophant court Watcher sentry; those earlier component exclusions remain intact. No equipment-ring, deity identity, or link between the two Watchers is inferred. Official manual setting context does not give this place a direct name entry.'
  }.freeze
  IDS = %w[45621 57117 62099 63025].freeze

  def transform(spec, key, text, source)
    raise "unexpected place key #{key.inspect}" unless key.first == 'default' && IDS.include?(key[1])
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    raise "place source differs at #{key.inspect}" unless
      english.include?('Ring of the Watcher') && japanese.include?('監視者の遺跡')
    return [text, false] if text.include?(spec.fetch(:korean))
    raise "place span count differs at #{key.inspect}" unless text.scan('감시자의 고리').length == 1
    [text.sub('감시자의 고리', spec.fetch(:korean)), false]
  end

  def run
    ReviewedDiscoverySpecs.run(
      21_723, 'Ring of the Watcher Place Name', [SPEC],
      'Register the complete English-named ruin independently of the Watcher sentry. Preserve all previous component exclusions, existing Scion/Akara/Gallows End/Erathi decisions, source quantities, markup, and unrelated prose. Pair only the two missing complete place-name spans.',
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, key, text, source| transform(spec, key, text, source) }
  end
end

ReviewRingOfTheWatcherD21723.run if $PROGRAM_NAME == __FILE__
