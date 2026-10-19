#!/usr/bin/env ruby

require_relative 'build-proper-name-occurrences'
require_relative 'short-label-candidate-groups-poison-reverie'

# Preparation only: caller supplies the saved inventory/index and assigns batches.
module PoisonReveriePreparation
  extend self

  SPECS = [
    {
      key: 'organization:pride-of-pryderi', english: 'Pride of Pryderi',
      category: 'organization', korean: '프라이데리의 자랑(Pride of Pryderi)',
      variants: '프리데리(Pryderi)의 자부심|프라이데리의 자랑',
      keys: %w[base:1838:11 default:16298: default:55733: default:59645:],
      notes: 'English default:55733 describes the named merchant business selling weapons and armor; the other three keys are its name labels. Japanese プライデリ商会 and お店 corroborate the business; Chinese 普瑞德利的骄傲 supports the complete name. Register the business, not a Pryderi person, faction, or House of Pride alias. Preserve all existing faction:house-of-pride exclusions.'
    },
    {
      key: 'lore_term:prismere-chantries', english: 'Prismere Chantries',
      category: 'lore term', korean: '프리즘미어 예배당(Prismere Chantries)',
      variants: '프리즘미어(Prismere) 예배당|프리즘미어(Prismere) 성소',
      keys: %w[
        default:314: default:4780: default:15833: default:21138:
        default:26175: default:30105: default:35117: default:35692:
        default:35756: default:36647: default:37610: default:39267:
        default:42371: default:47577: default:48092: default:48629:
        default:57345:
      ],
      notes: 'English default:314/26175 explicitly describes multiple Tuatha-built structures across Klurikon; default:47577 explains their communication/religious function. Japanese プリスミア礼拝堂 and Chinese 赤晶教堂 corroborate. Register the complete named structure-type label as a lore term, NOT one invented geographic site or single complex. Pair the whole compound without nested Prismere parentheses; preserve existing resource:prismere dispositions. At default:30105 repair the particle only within the explicitly mapped name span.'
    },
    {
      key: 'people:quarterlings', english: 'Quarterlings', category: 'people',
      korean: '쿼털링(Quarterlings)', variants: '쿼털링|쿼터링',
      aliases: 'Quarterling',
      keys: %w[default:17030: default:59295: default:60487: default:62763:],
      notes: 'English default:17030 identifies one of us Quarterlings as a named local community contrasted with the gnomes; two exact labels corroborate. Default:62763 explicitly defines a Quarterling as someone living in the Hospitalis Quarters, establishing the singular alias without inferring a biological race or a formal faction. Use the existing place:hospitalis-quarters canonical 병원 구역(Hospitalis Quarters) only as a locative/context anchor, not as an identity merger. Japanese 貧民 and Chinese 四分之一/小民 are supplementary community renderings. Reuse 쿼털링 with each source-local Quarterling/Quarterlings pairing. Hospitalis Quarter possessive-singular default:40601/default:62156 and bare Hospitalis default:7670 are outside this entity scope.'
    },
    {
      key: 'item:ravenswing', english: 'Ravenswing', category: 'item',
      korean: '레이븐스윙호(Ravenswing)',
      variants: '레이븐스윙(Ravenswing)호|까마귀날개호(Ravenswing)|레이븐스윙호|레이븐스윙(Ravenswing)',
      keys: %w[
        default:2384: default:3532: default:7568: default:20576:
        default:27645: default:33926: default:37346: default:38487:
        default:50560: default:56203: default:61271:
      ],
      notes: 'English default:2384 explicitly calls Ravenswing a ship, and default:27645 distinguishes it from Walen’s intended Maid of Fortune: reporting Ravenswing sends him to Klurikon. Japanese レイブンスウィング号 and Chinese 渡鸦旋风号 corroborate. Register the named vessel as an item, not a person/place/faction, and do not claim Walen owns it or originally sails aboard it. Reuse 레이븐스윙호(Ravenswing); preserve all unrelated names and quest outcomes.'
    },
    {
      key: 'person:renerit-vale', english: 'Renerit Vale', category: 'person',
      korean: '레네릿 베일(Renerit Vale)', variants: '레네릿 계곡|레네릿 베일',
      keys: %w[default:3429: default:16230: default:36842:],
      notes: 'English default:16230 says Talk to Renerit Vale, identifying a person; the other two keys are complete personal-name labels. Japanese レネリット・ベイル corroborates; Chinese 瑞纳瑞特谷 must not override the English identity. Reuse 레네릿 베일(Renerit Vale), correcting only default:36842’s mistaken 계곡 place reading.'
    },
    {
      key: 'lore_term:reverie', english: 'Reverie', category: 'lore term',
      korean: '몽상(Reverie)', variants: '몽상|몽환|레버리|몽환계|몽상계|명상|백일몽|사색',
      keys: %w[
        default:928: default:2563: default:3465: default:5032:
        default:6014: default:6036: default:8571: default:11033:
        default:11617: default:13512: default:14267: default:14511:
        default:14571: default:17374: default:19783: default:21818:
        default:29395: default:32095: default:32775: default:34378:
        default:34614: default:36240: default:36974: default:37313:
        default:37340: default:39273: default:40107: default:40115:
        default:42484: default:43907: default:45897: default:46686:
        default:54048: default:54173: default:56501: default:58956:
        default:59151: default:59514: default:62680: default:64388:
      ],
      notes: 'English default:39273 explicitly contrasts mortal sleep with the Fae state Reverie; default:13512 identifies a stronger form of Fae reverie. Japanese 瞑想/リベリー and Chinese 白日梦 corroborate the dreaming/meditative state, not a separate physical realm. All 40 case-insensitive source matches are covered: 38 contextual state uses and two excluded ordinary poetic uses at default:19783/default:54048 (a screaming reverie in the Draug poem). Canonicalize only explicit spans as 몽상(Reverie). Do not invent a Reverie location, alias Deep Slumber, or close unrelated sentence-level holds. Existing adjacent syntax is not a full-sentence retranslation.'
    }
  ].freeze

  EXCLUDED_KEYS = %w[default:19783: default:54048:].freeze
  OUT_OF_SCOPE_KEYS = %w[default:40601: default:62156: default:7670:].freeze

  SPANS = {
    'base:1838:11' => ['프리데리(Pryderi)의 자부심', '프라이데리의 자랑(Pride of Pryderi)'],
    'default:16298:' => ['프라이데리의 자랑', '프라이데리의 자랑(Pride of Pryderi)'],
    'default:59645:' => ['프라이데리의 자랑', '프라이데리의 자랑(Pride of Pryderi)'],
    'default:314:' => ['프리즘미어(Prismere) 예배당', '프리즘미어 예배당(Prismere Chantries)'],
    'default:15833:' => ['프리즘미어(Prismere) 예배당', '프리즘미어 예배당(Prismere Chantries)'],
    'default:21138:' => ['프리즘미어(Prismere) 예배당', '프리즘미어 예배당(Prismere Chantries)'],
    'default:26175:' => ['프리즘미어(Prismere) 성소', '프리즘미어 예배당(Prismere Chantries)'],
    'default:30105:' => ['프리즘미어(Prismere) 예배당를', '프리즘미어 예배당(Prismere Chantries)을'],
    'default:35117:' => ['프리즘미어(Prismere) 예배당', '프리즘미어 예배당(Prismere Chantries)'],
    'default:35692:' => ['프리즘미어(Prismere) 예배당', '프리즘미어 예배당(Prismere Chantries)'],
    'default:35756:' => ['프리즘미어(Prismere) 예배당', '프리즘미어 예배당(Prismere Chantries)'],
    'default:36647:' => ['프리즘미어(Prismere) 예배당', '프리즘미어 예배당(Prismere Chantries)'],
    'default:37610:' => ['프리즘미어(Prismere) 예배당', '프리즘미어 예배당(Prismere Chantries)'],
    'default:39267:' => ['프리즘미어(Prismere) 예배당', '프리즘미어 예배당(Prismere Chantries)'],
    'default:42371:' => ['프리즘미어(Prismere) 예배당', '프리즘미어 예배당(Prismere Chantries)'],
    'default:47577:' => ['프리즘미어(Prismere) 예배당', '프리즘미어 예배당(Prismere Chantries)'],
    'default:48092:' => ['프리즘미어(Prismere) 예배당', '프리즘미어 예배당(Prismere Chantries)'],
    'default:48629:' => ['프리즘미어(Prismere) 예배당', '프리즘미어 예배당(Prismere Chantries)'],
    'default:57345:' => ['프리즘미어(Prismere) 예배당', '프리즘미어 예배당(Prismere Chantries)'],
    'default:59295:' => ['쿼털링', '쿼털링(Quarterlings)'],
    'default:62763:' => ['쿼터링', '쿼털링(Quarterling)'],
    'default:2384:' => ['레이븐스윙(Ravenswing)호', '레이븐스윙호(Ravenswing)'],
    'default:3532:' => ['레이븐스윙(Ravenswing)호', '레이븐스윙호(Ravenswing)'],
    'default:7568:' => ['레이븐스윙(Ravenswing)', '레이븐스윙호(Ravenswing)'],
    'default:20576:' => ['레이븐스윙호', '레이븐스윙호(Ravenswing)'],
    'default:27645:' => ['까마귀날개호(Ravenswing)', '레이븐스윙호(Ravenswing)'],
    'default:33926:' => ['레이븐스윙호', '레이븐스윙호(Ravenswing)'],
    'default:37346:' => ['레이븐스윙호', '레이븐스윙호(Ravenswing)'],
    'default:38487:' => ['레이븐스윙호', '레이븐스윙호(Ravenswing)'],
    'default:61271:' => ['레이븐스윙(Ravenswing)', '레이븐스윙호(Ravenswing)'],
    'default:36842:' => ['레네릿 계곡', '레네릿 베일(Renerit Vale)'],
    'default:928:' => ['몽상', '몽상(Reverie)'],
    'default:2563:' => ['레버리(Reverie)로', '몽상(Reverie)으로'],
    'default:3465:' => ['몽상', '몽상(Reverie)'],
    'default:5032:' => ['몽상', '몽상(Reverie)'],
    'default:6014:' => ['몽상', '몽상(Reverie)'],
    'default:6036:' => ['몽상', '몽상(Reverie)'],
    'default:8571:' => ['몽환계', '몽상(Reverie)'],
    'default:11033:' => ['명상', '몽상(Reverie)'],
    'default:13512:' => ['몽상', '몽상(Reverie)'],
    'default:14511:' => ['몽상', '몽상(Reverie)'],
    'default:14571:' => ['몽상', '몽상(Reverie)'],
    'default:17374:' => ['몽상', '몽상(Reverie)'],
    'default:21818:' => ['몽상', '몽상(Reverie)'],
    'default:29395:' => ['레버리(Reverie)', '몽상(Reverie)'],
    'default:32095:' => ['몽상', '몽상(Reverie)'],
    'default:32775:' => ['몽상', '몽상(Reverie)'],
    'default:34378:' => ['몽상', '몽상(Reverie)'],
    'default:34614:' => ['몽상', '몽상(Reverie)'],
    'default:36240:' => ['레버리로', '몽상(Reverie)으로'],
    'default:36974:' => ['몽상', '몽상(Reverie)'],
    'default:37313:' => ['몽상', '몽상(Reverie)'],
    'default:37340:' => ['몽상', '몽상(Reverie)'],
    'default:39273:' => ['몽환(Reverie)', '몽상(Reverie)'],
    'default:40107:' => ['몽환(Reverie)', '몽상(Reverie)'],
    'default:40115:' => ['명상', '몽상(Reverie)'],
    'default:42484:' => ['몽상', '몽상(Reverie)'],
    'default:43907:' => ['몽상계로', '몽상(Reverie)으로'],
    'default:45897:' => ['사색', '몽상(Reverie)'],
    'default:46686:' => ['몽상', '몽상(Reverie)'],
    'default:56501:' => ['몽환(Reverie)', '몽상(Reverie)'],
    'default:58956:' => ['몽상', '몽상(Reverie)'],
    'default:59151:' => ['백일몽', '몽상(Reverie)'],
    'default:59514:' => ['명상', '몽상(Reverie)'],
    'default:62680:' => ['몽상', '몽상(Reverie)'],
    'default:64388:' => ['몽상', '몽상(Reverie)']
  }.freeze

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def definitions
    SPECS.map do |spec|
      {
        'entity_key' => spec.fetch(:key),
        'english_canonical' => spec.fetch(:english),
        'category' => spec.fetch(:category),
        'korean_canonical' => spec.fetch(:korean),
        'english_aliases' => spec.fetch(:aliases, ''),
        'korean_variants' => spec.fetch(:variants),
        'evidence_ids' => spec.fetch(:keys).join('|'),
        'status' => 'confirmed',
        'notes' => spec.fetch(:notes)
      }
    end
  end

  def reviews(inventory, index = [])
    scoped_keys = SPECS.flat_map { |spec| spec.fetch(:keys) }
    raise 'unrelated Hospitalis key entered this spec' unless
      (scoped_keys & OUT_OF_SCOPE_KEYS).empty? &&
      (SPANS.keys & OUT_OF_SCOPE_KEYS).empty?
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = SPECS.to_h { |spec| [spec.fetch(:key), spec.fetch(:keys).sort] }
    actual = generated.group_by { |row| row.fetch('entity_key') }.transform_values do |rows|
      rows.map { |row| key(row).join(':') }.sort
    end
    raise "full-source scope drift: #{actual.inspect}" unless expected == actual
    prior = index.group_by { |row| key(row) }
    used = []
    result = generated.map do |hit|
      parts = key(hit)
      source_key = parts.join(':')
      spec = SPECS.find { |item| item.fetch(:key) == hit.fetch('entity_key') }
      source = inventory.fetch(parts)
      old = source.fetch('work_text')
      span = SPANS[source_key]
      excluded = EXCLUDED_KEYS.include?(source_key)
      raise "edit in excluded scope: #{source_key}" if excluded && span
      new_text = old
      if span
        from, to = span
        count = old.scan(Regexp.new(Regexp.escape(from))).length
        raise "reviewed Korean span drift: #{source_key} (#{count})" unless
          count == 1 && !old.include?(to)
        new_text = old.sub(from, to)
        used << source_key
      elsif !excluded && !old.include?(spec.fetch(:korean))
        raise "unmapped unpaired name: #{source_key}"
      end
      raise "line break drift: #{source_key}" unless
        old.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)
      status = excluded ? 'excluded' : (old == new_text ? 'not-an-issue' : 'accepted')
      {
        'resource' => parts[0], 'ID_Linha' => parts[1], 'Tipo_Variante' => parts[2],
        'entity_key' => spec.fetch(:key), 'status' => status,
        'old' => old, 'new' => new_text,
        'evidence' => "#{spec.fetch(:notes)} Exact source key: #{source_key}. Official Korean manual provides general setting context but no direct entry for this name. Existing prior entity/row decisions are retained, not superseded.",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(spec.fetch(:key) => status),
        'prior_index_dispositions_json' => JSON.generate(
          prior.fetch(parts, []).map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        )
      }
    end
    raise 'unused or duplicate explicit Korean edit span' unless used.sort == SPANS.keys.sort
    raise 'duplicate reviewed source key' unless result.map { |row| key(row) }.uniq.length == result.length
    result
  end

  def stages(inventory, index = [])
    all_definitions = definitions
    all_reviews = reviews(inventory, index)
    [
      ['named-business-structures-community-ship-person', SPECS.take(5)],
      ['reverie-state-and-generic-poem-exclusions', SPECS.drop(5)]
    ].map do |name, specs|
      entities = specs.map { |spec| spec.fetch(:key) }
      selected = all_reviews.select { |row| entities.include?(row.fetch('entity_key')) }
      raise 'stage exceeds 50 distinct source keys' if selected.map { |row| key(row) }.uniq.length > 50
      {
        name: name,
        definitions: all_definitions.select { |row| entities.include?(row.fetch('entity_key')) },
        reviews: selected
      }
    end
  end

  def candidate_groups
    PoisonReverieCandidateEvidence.candidate_groups
  end
end
