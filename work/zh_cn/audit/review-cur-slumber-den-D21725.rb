#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewCurSlumberDenD21725
  extend self
  M = ReviewedNameBatches
  D = 21_725
  SPECS = [
    {
      key: 'person:cur-of-vengeance', english: 'Cur', aliases: 'Cur of Vengeance',
      category: 'person', korean: '커(Cur)',
      variants: '커|잡종견|개자식|복수의 사냥개|복수의 사냥개(Cur of Vengeance)',
      count: 19,
      notes: 'English default:3044 names the House of Vengeance leader Cur of Vengeance and default:18073/56132 describes the same hostile Fae leader as Cur. Japanese カー and Chinese 复仇的恶狗 corroborate. Reuse 커(Cur) in short-name contexts, replacing the label mistranslations 잡종견/개자식 and the generic 개 in the identity question. Preserve the complete translated epithet 복수의 사냥개(Cur of Vengeance) where English supplies that full name; complete-label spelling does not make Cur a separate dog species. Exclude generic insults old cur at default:20962/51549 and cur Magnus at default:53096; do not conflate their referents. Preserve existing House/Bhaile/Gadflow/Fae and Magnus decisions.'
    },
    {
      key: 'lore:deep-slumber', english: 'Deep Slumber',
      category: 'lore term', korean: '깊은 잠(Deep Slumber)',
      variants: '깊은 잠', count: 18,
      notes: 'English default:223 says the Deep Slumber maintains the Cradle magic and default:49640 explicitly calls it a meditation that must not be interrupted. Japanese まどろみの儀式/ディープ・スランバー and Chinese 沉睡 corroborate this named Fae ritual state, not an organization or individual. Retain the existing 깊은 잠(Deep Slumber) pair and annotate the missing exact spans. Exclude default:10548, where lowercase deep slumber is ordinary sleep in a Barghest simile. No unrelated meaning, source conflict, speaker voice, or place name is changed.'
    },
    {
      key: 'place:den-of-night', english: 'Den of Night',
      category: 'place', korean: '밤의 소굴(Den of Night)',
      variants: '밤의 소굴|밤의 굴', count: 7,
      notes: 'English default:51028 identifies the Den of Night as the place to which the unrepentant are sent, while default:34366/48413 explicitly discusses entrance. Japanese 宵闇の洞窟 and Chinese 夜之巢穴/夜晚的巢穴 corroborate the named place. Reuse the existing complete 밤의 소굴(Den of Night), normalizing the isolated 밤의 굴 at default:51028 and pairing the four missing labels/mentions. No occupant identity, actual entrance permission or geographic link is inferred.'
    }
  ].freeze
  EXCLUDED_CUR = %w[20962 51549 53096].freeze
  FULL_CUR = %w[3044 16643 45624].freeze
  CUR_EDITS = {
    '27483' => ['잡종견', '커(Cur)'],
    '30864' => ['개자식', '커(Cur)'],
    '38823' => ['그 개는 누구지?', '커(Cur)는 누구지?'],
    '40803' => ['커를', '커(Cur)를'],
    '59167' => ['커를', '커(Cur)를'],
    '31912' => ['복수의 사냥개(Cur)', '커(Cur)'],
    '60359' => ['복수의 사냥개(Cur)', '커(Cur)']
  }.freeze

  def transform(spec, key, text, source)
    raise "non-default name scope #{key.inspect}" unless key.first == 'default'
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "source term differs at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])#{Regexp.escape(spec.fetch(:english))}(?![A-Za-z])/i)
    case spec.fetch(:key)
    when 'person:cur-of-vengeance'
      return [text, true] if EXCLUDED_CUR.include?(key[1])
      if FULL_CUR.include?(key[1])
        old = key[1] == '16643' ? '복수의 사냥개(Cur)' : '복수의 사냥개'
        new_text = '복수의 사냥개(Cur of Vengeance)'
        return [text, false] if text.include?(new_text)
      elsif CUR_EDITS.key?(key[1])
        old, new_text = CUR_EDITS.fetch(key[1])
      else
        raise "unpaired/unreviewed Cur span #{key.inspect}" unless
          text.include?('커(Cur)') || (key[1] == '18073' && text.include?('커(The Cur)'))
        return [text, false]
      end
    when 'lore:deep-slumber'
      return [text, true] if key[1] == '10548'
      return [text, false] if text.include?(spec.fetch(:korean))
      old, new_text = '깊은 잠', spec.fetch(:korean)
    when 'place:den-of-night'
      return [text, false] if text.include?(spec.fetch(:korean))
      old = key[1] == '51028' ? '밤의 굴(Den of Night)' : '밤의 소굴'
      new_text = spec.fetch(:korean)
    else
      raise "unexpected entity #{spec.inspect}"
    end
    raise "reviewed span count differs #{key.inspect}" unless text.scan(old).length == 1
    [text.sub(old, new_text), false]
  end

  def run
    ReviewedDiscoverySpecs.run(
      D, 'Cur, Deep Slumber, and Den of Night', SPECS,
      'English-led complete source review registers the named Fae leader with its explicit full epithet, the named ritual meditation, and the named confinement site. Japanese/Chinese corroborate the exact contextual distinctions. Exclude generic insults and ordinary sleep. The official Korean manual supplies Fae/world context but no direct names for these three scopes. Preserve all prior unrelated row decisions, source conflicts, token sequences, line endings, and prose.',
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, key, text, source| transform(spec, key, text, source) }
    inventory = M.refresh_inventory
    candidates = ShortLabelDiscovery20261018.build(
      inventory.values, M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h),
      M.table(M::INDEX).map(&:to_h)
    )
    filename = "proper-name-short-label-discovery-D#{D}.tsv"
    M.write_table(File.join(__dir__, filename), ShortLabelDiscovery20261018::HEADERS, candidates)
    line = "Next batch: D-#{D + 1}; continue unreviewed short-label candidates from `#{filename}` (#{candidates.length} bounded groups; not exhaustive or a completion estimate)."
    M::DOCS.each do |path|
      text = File.read(path)
      raise "checkpoint missing #{path}" unless text.sub!(/Next batch: D-#{D + 1};.*?\n/, "#{line}\n")
      File.write(path, text)
    end
  end
end

ReviewCurSlumberDenD21725.run if $PROGRAM_NAME == __FILE__
