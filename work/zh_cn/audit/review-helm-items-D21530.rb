#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module HelmItemsD21530
  extend self

  M = ReviewedNameBatches
  D = 21_530
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")

  ENTITIES = [
    {
      'entity_key' => 'item:helm-of-the-faehunter',
      'english_canonical' => 'Helm of the Faehunter',
      'category' => 'item',
      'korean_canonical' => '페이 사냥꾼의 투구(Helm of the Faehunter)',
      'english_aliases' => '',
      'korean_variants' => '페이 사냥꾼의 투구|페이헌터의 투구',
      'evidence_ids' => 'D-21530|base:4502:11|default:35159|default:6441',
      'status' => 'confirmed',
      'notes' => 'English base:4502 names the complete Helm of the Faehunter item; default:35159 and default:6441 repeat that exact item name in two poems. Japanese フェイハンターのヘルム/フェイハンターの兜 and Chinese 猎灵人头盔 corroborate the same item. Use 페이 사냥꾼의 투구(Helm of the Faehunter) in all three exact source rows, normalizing the isolated 페이헌터 spelling only in default:6441. Preserve every poem line break and all unrelated imagery. This registers an item label only; it does not infer rarity, mechanics, or the identity of the Faehunter.'
    },
    {
      'entity_key' => 'item:the-guardian-helm',
      'english_canonical' => 'The Guardian Helm',
      'category' => 'item',
      'korean_canonical' => '수호자의 투구 (The Guardian Helm)',
      'english_aliases' => '',
      'korean_variants' => '수호자의 투구',
      'evidence_ids' => 'D-21530|base:1860:11',
      'status' => 'confirmed',
      'notes' => 'English base:1860 is the complete item label The Guardian Helm. Japanese ガーディアンヘルム and Chinese 守卫者头盔 corroborate the named helm. The other Guardian armor-piece labels are a separate scout candidate and must be reviewed once without duplicating this exact key. Retain the existing fully bilingual Korean label. This registers an item label only; it does not infer rarity or mechanics.'
    },
    {
      'entity_key' => 'item:the-goliath-helm',
      'english_canonical' => 'The Goliath Helm',
      'category' => 'item',
      'korean_canonical' => '골리앗의 투구 (The Goliath Helm)',
      'english_aliases' => '',
      'korean_variants' => '골리앗의 투구',
      'evidence_ids' => 'D-21530|base:3722:11',
      'status' => 'confirmed',
      'notes' => 'English base:3722 is the complete item label The Goliath Helm. Japanese ゴライアスのヘルム and Chinese 巨无霸头盔 corroborate the named helm. Related Goliath armor-piece labels are separate exact items and must not be merged into this helmet or recounted here. Retain the existing fully bilingual Korean label. This registers an item label only; it does not infer rarity or mechanics.'
    },
    {
      'entity_key' => 'item:khas-tis-helm',
      'english_canonical' => "Khas-ti's Helm",
      'category' => 'item',
      'korean_canonical' => "카스티의 투구(Khas-ti's Helm)",
      'english_aliases' => '',
      'korean_variants' => '카스티(Khas-ti)의 투구',
      'evidence_ids' => 'D-21530|base:2009:11',
      'status' => 'confirmed',
      'notes' => "English base:2009 is the complete source item label Khas-ti's Helm; Japanese カスティのヘルム and Chinese 哈斯提的头盔 corroborate the possessive label. Use 카스티의 투구(Khas-ti's Helm), preserving the source name's hyphen. The corpus does not establish who Khas-ti is, so this item registration does not create or imply a person identity, rarity, or mechanics."
    },
    {
      'entity_key' => 'item:kerrods-helm',
      'english_canonical' => "Kerrod's Helm",
      'category' => 'item',
      'korean_canonical' => "케로드의 투구(Kerrod's Helm)",
      'english_aliases' => '',
      'korean_variants' => '케로드(Kerrod)의 투구',
      'evidence_ids' => 'D-21530|base:2854:11|default:11165|default:37132',
      'status' => 'confirmed',
      'notes' => "English base:2854 is the complete source item label Kerrod's Helm; aligned Japanese ケロッドのヘルム and Chinese 克罗德的头盔 corroborate the item name. Other Kerrod armor-part labels and Captain Kerrod references are context, not extra occurrences of this exact item. Use 케로드의 투구(Kerrod's Helm). Do not infer that Captain Kerrod and Kerrod Graine are the same person, or infer item rarity or mechanics."
    },
    {
      'entity_key' => 'item:shepards-helm',
      'english_canonical' => "Shepard's Helm",
      'category' => 'item',
      'korean_canonical' => "셰퍼드의 투구(Shepard's Helm)",
      'english_aliases' => '',
      'korean_variants' => '셰퍼드(Shepard)의 투구',
      'evidence_ids' => 'D-21530|base:4516:11|default:64004',
      'status' => 'confirmed',
      'notes' => "English base:4516 is the complete source item label Shepard's Helm; Japanese シェパードのヘルム and Chinese 谢巴德的头盔 corroborate. Default:64004 independently describes the fabled armor of the legendary Shepard, Warsworn commander after Ballegar. Use 셰퍼드의 투구(Shepard's Helm). This item label does not resolve any separate Shepard person-name scope and does not infer rarity or mechanics."
    }
  ].freeze

  EXPECTED_KEYS = {
    'item:helm-of-the-faehunter' => [
      ['base', '4502', '11'],
      ['default', '35159', ''],
      ['default', '6441', '']
    ],
    'item:the-guardian-helm' => [['base', '1860', '11']],
    'item:the-goliath-helm' => [['base', '3722', '11']],
    'item:khas-tis-helm' => [['base', '2009', '11']],
    'item:kerrods-helm' => [['base', '2854', '11']],
    'item:shepards-helm' => [['base', '4516', '11']]
  }.freeze

  REPLACEMENTS = {
    ['base', '4502', '11'] => [
      '페이 사냥꾼의 투구',
      '페이 사냥꾼의 투구(Helm of the Faehunter)'
    ],
    ['default', '35159', ''] => [
      '페이 사냥꾼의 투구',
      '페이 사냥꾼의 투구(Helm of the Faehunter)'
    ],
    ['default', '6441', ''] => [
      '페이헌터의 투구',
      '페이 사냥꾼의 투구(Helm of the Faehunter)'
    ],
    ['base', '2009', '11'] => [
      '카스티(Khas-ti)의 투구',
      "카스티의 투구(Khas-ti's Helm)"
    ],
    ['base', '2854', '11'] => [
      '케로드(Kerrod)의 투구',
      "케로드의 투구(Kerrod's Helm)"
    ],
    ['base', '4516', '11'] => [
      '셰퍼드(Shepard)의 투구',
      "셰퍼드의 투구(Shepard's Helm)"
    ]
  }.freeze

  EVIDENCE = 'English is the item-identity anchor; aligned Japanese and Chinese corroborate the complete source labels. Register only the six evidenced helm item labels and preserve the source-specific spelling and title. Do not infer rarity, mechanics, additional item aliases, or identity relationships between similarly named people. Existing terminal decisions and open question holds are not reopened or recounted.'

  def definitions(headers)
    ENTITIES.map { |entity| headers.to_h { |header| [header, entity.fetch(header, '')] } }
  end

  def source_inventory
    M.refresh_inventory
  end

  def reviews(inventory, glossary_headers)
    generated = build_occurrences(inventory.values, ENTITIES).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated_keys = generated.group_by { |row| row.fetch('entity_key') }
      .transform_values { |rows| rows.map { |row| M.key(row) }.sort }
    raise "helm item source coverage differs: #{generated_keys.inspect}" unless
      generated_keys == EXPECTED_KEYS.transform_values(&:sort)

    generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      proposed = old.dup
      if (replacement = REPLACEMENTS[key])
        from, to = replacement
        from_count = proposed.scan(from).length
        to_count = proposed.scan(to).length
        residual_from_count = proposed.sub(to, '').scan(from).length
        if to_count == 1 && residual_from_count.zero?
          # Planning remains safe to repeat after this exact edit is applied.
        elsif from_count == 1 && to_count.zero?
          proposed.sub!(from, to)
        else
          raise "expected one source-local Korean item label at #{key.inspect}"
        end
      end
      status = proposed == old ? 'not-an-issue' : 'accepted'
      occurrence.merge(
        'status' => status,
        'old' => old,
        'new' => proposed,
        'evidence' => EVIDENCE,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(occurrence.fetch('entity_key') => status),
        'previous_status' => '',
        'previous_evidence' => ''
      )
    end
  end

  def write_inputs
    inventory = source_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    generated_definitions = definitions(glossary.headers)
    rows = reviews(inventory, glossary.headers)
    M.write_table(DEFINITIONS, glossary.headers, generated_definitions)
    M.write_table(REVIEWS, M::HEADERS, rows)
    [generated_definitions, rows]
  end

  def apply
    write_inputs
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

HelmItemsD21530.apply if $PROGRAM_NAME == __FILE__
