#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewWatcherWhisperingCavesD21722
  extend self
  M = ReviewedNameBatches
  D = 21_722
  SPECS = [
    {
      key: 'item:watcher-sentry',
      english: 'Watcher', category: 'item',
      korean: '감시자(Watcher)', variants: '감시자',
      count: 16,
      notes: 'English default:41659/43279 explicitly names the magical alarm statue on the path to the Hierophant court the Watcher, and default:10607/60618 ties its bypass to the Bag of Winds. Japanese 監視者 and Chinese 哨兵 corroborate. Register only this named sentry object, not an inferred creature species. Exclude the hood, unidentified Watcher Corpse, Maura title, generic divine watcher, and complete Ring of the Watcher place name; no identity link is inferred for those compounds. Pair the first explicit sentry-name span per source row and retain later same-row anaphora.'
    },
    {
      key: 'place:whispering-caves',
      english: 'Whispering Caves', category: 'place',
      korean: '속삭임 동굴(Whispering Caves)',
      variants: '속삭이는 동굴|속삭임 동굴',
      count: 6,
      notes: 'English default:17269 locates Anella Saff expedition in Whispering Caves southeast of the camp, and default:52465 identifies its exit in the escort objective. Japanese ささやきの洞窟 and Chinese 低语洞穴 corroborate the named place. Reuse the already paired 속삭임 동굴 at default:6179/52465, normalizing only exact source-matched place-name spans. No new geographic relationships or quest outcomes are inferred.'
    }
  ].freeze
  SENTRY_IDS = %w[10607 32385 37293 40165 41659 43279 45752 60618].freeze
  CAVE_IDS = %w[6179 6917 16314 17269 37850 52465].freeze

  def transform(spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "source mismatch at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])#{Regexp.escape(spec.fetch(:english))}(?![A-Za-z])/i)
    if spec.fetch(:key) == 'item:watcher-sentry'
      return [text, true] unless key.first == 'default' && SENTRY_IDS.include?(key[1])
      return [text, false] if text.include?(spec.fetch(:korean))
      raise "sentry span missing at #{key.inspect}" unless text.include?('감시자')
      [text.sub('감시자', spec.fetch(:korean)), false]
    else
      raise "unexpected cave key #{key.inspect}" unless
        key.first == 'default' && CAVE_IDS.include?(key[1])
      return [text, false] if text.include?(spec.fetch(:korean))
      raise "cave span count at #{key.inspect}" unless text.scan('속삭이는 동굴').length == 1
      [text.sub('속삭이는 동굴', spec.fetch(:korean)), false]
    end
  end

  def run
    ReviewedDiscoverySpecs.run(
      D, 'Watcher Sentry and Whispering Caves', SPECS,
      'English-led full-source review distinguishes the named magical sentry from generic watchers, titled people and independent compounds. Normalize the named cave to its existing bilingual form. Japanese and Chinese corroborate each identity. Preserve prior person/place/item dispositions and all unrelated text.',
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, key, text, source| transform(spec, key, text, source) }
    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    candidates = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    filename = "proper-name-short-label-discovery-D#{D}.tsv"
    M.write_table(File.join(__dir__, filename), ShortLabelDiscovery20261018::HEADERS, candidates)
    line = "Next batch: D-#{D + 1}; continue unreviewed short-label candidates from `#{filename}` (#{candidates.length} bounded groups; not exhaustive or a completion estimate)."
    M::DOCS.each do |path|
      text = File.read(path)
      raise "checkpoint missing at #{path}" unless text.sub!(/Next batch: D-#{D + 1};.*?\n/, "#{line}\n")
      File.write(path, text)
    end
  end
end

ReviewWatcherWhisperingCavesD21722.run if $PROGRAM_NAME == __FILE__
