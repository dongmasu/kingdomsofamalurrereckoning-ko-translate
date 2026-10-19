#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewFervorWeaponD21729
  extend self
  M = ReviewedNameBatches
  D = 21_729
  SPEC = {
    key: 'item:fervor',
    english: 'Fervor',
    category: 'item',
    korean: '열정(Fervor)',
    variants: '열정',
    count: 7,
    notes: 'base:4094 is the standalone item-name label; default:39983 describes Fervor as a one-handed sword with exceptional balance and an edge, establishing that these two occurrences name the weapon rather than the abstract emotion. Japanese ファーバー and Chinese 激情 corroborate the name/meaning. The other five exact source hits at default:4780, 22186, 36647, 47535, and 64480 use lower-case ordinary zeal/enthusiasm in history, poetry, or generic religious fervor; explicitly exclude them from the item entity and leave their current text and all prior dispositions unchanged. Add the English pair to the existing Korean item label and retain the already paired weapon-description occurrence. No rarity, quest ownership, or gameplay statistics are inferred.'
  }.freeze
  EXCLUDED_KEYS = %w[4780 22186 36647 47535 64480].map do |id|
    ['default', id, '']
  end.freeze

  def transform(spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    if EXCLUDED_KEYS.include?(key)
      raise "English exclusion source differs at #{key.inspect}" unless
        english.match?(/(?<![A-Za-z])fervor(?![A-Za-z])/i)
      return [text, true]
    end
    raise "English item evidence differs at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])Fervor(?![A-Za-z])/)
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise "Japanese item evidence differs at #{key.inspect}" unless japanese.include?('ファーバー') || japanese.include?('熱情')
    raise "Chinese item evidence missing at #{key.inspect}" unless chinese.include?('激情')
    return [text, false] if text.include?(spec.fetch(:korean))
    raise "unexpected Fervor row #{key.inspect}" unless key == ['base', '4094', '11'] && text == '열정'
    [text.sub('열정', spec.fetch(:korean)), false]
  end

  def run
    ReviewedDiscoverySpecs.run(
      D, 'Fervor Named Weapon', [SPEC],
      'Register the source-confirmed named weapon Fervor, distinguishing its proper item use from the ordinary abstract noun. The base item label and its exact item description are reviewed against English, aligned Japanese, and Chinese. Keep the already paired description, all other entities, and unrelated generic occurrences unchanged; do not infer item rarity.',
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, key, text, source| transform(spec, key, text, source) }
    inventory = M.refresh_inventory
    candidates = ShortLabelDiscovery20261018.build(
      inventory.values, M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h),
      M.table(M::INDEX).map(&:to_h)
    )
    snapshot = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
    M.write_table(snapshot, ShortLabelDiscovery20261018::HEADERS, candidates)
    line = "Next batch: D-#{D + 1}; continue unreviewed short-label candidates from `#{File.basename(snapshot)}` (#{candidates.length} bounded groups; not exhaustive or a completion estimate)."
    M::DOCS.each do |path|
      text = File.read(path)
      raise "D-#{D + 1} checkpoint missing in #{path}" unless
        text.sub!(/Next batch: D-#{D + 1};.*?\n/, "#{line}\n")
      File.write(path, text)
    end
  end
end

ReviewFervorWeaponD21729.run if $PROGRAM_NAME == __FILE__
