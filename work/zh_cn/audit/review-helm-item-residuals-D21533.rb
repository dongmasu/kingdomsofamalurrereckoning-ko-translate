#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module HelmItemResidualsD21533
  extend self

  M = ReviewedNameBatches
  D = 21_533
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")

  ENTITIES = [
    {
      'entity_key' => 'unique item:corthian-helm',
      'english_canonical' => 'Corthian Helm',
      'category' => 'unique item',
      'korean_canonical' => '코르티아의 투구(Corthian Helm)',
      'english_aliases' => '',
      'korean_variants' => '코르티아(Corthia)의 투구|코르티아의 투구',
      'evidence_ids' => 'D-21533|base:357:11',
      'status' => 'confirmed',
      'notes' => 'English base:357 labels a complete Corthian Helm item. Japanese コルシアのヘルム and Chinese 科锡安头盔 corroborate the Corthia-derived modifier and helm. Render the item atomically as 코르티아의 투구(Corthian Helm); do not register Corthian as a global alias for Corthia.'
    },
    {
      'entity_key' => 'unique item:tiberian-helm',
      'english_canonical' => 'Tiberian Helm',
      'category' => 'unique item',
      'korean_canonical' => '티베리안 투구(Tiberian Helm)',
      'english_aliases' => '',
      'korean_variants' => '티베리안(Tiberian) 투구',
      'evidence_ids' => 'D-21533|base:3688:11',
      'status' => 'confirmed',
      'notes' => 'English base:3688 labels a complete Tiberian Helm item. Japanese ティベリアン・ヘルム and Chinese 泰伯伦头盔 corroborate the source name. Pair the complete item label without creating an unsupported person, faction, or place identity for Tiberian.'
    },
    {
      'entity_key' => 'unique item:nightstone-helm',
      'english_canonical' => 'Nightstone Helm',
      'category' => 'unique item',
      'korean_canonical' => '나이트스톤 투구(Nightstone Helm)',
      'english_aliases' => '',
      'korean_variants' => '나이트스톤 투구',
      'evidence_ids' => 'D-21533|base:3933:11',
      'status' => 'confirmed',
      'notes' => 'English base:3933 labels a complete Nightstone Helm item. Japanese ナイトストーンのヘルム and Chinese 夜石头盔 corroborate the named compound. Pair this exact item label without inferring additional mechanics or a separate Nightstone entity.'
    },
    {
      'entity_key' => 'unique item:infernal-helm',
      'english_canonical' => 'Infernal Helm',
      'category' => 'unique item',
      'korean_canonical' => '지옥의 투구(Infernal Helm)',
      'english_aliases' => '',
      'korean_variants' => '지옥의 투구|지옥불 투구',
      'evidence_ids' => 'D-21533|base:4670:11|default:63378',
      'status' => 'confirmed',
      'notes' => 'English base:4670 names the Infernal Helm, and default:63378 explicitly identifies the same unlockable item. Japanese インファーナル・ヘルム and Chinese 地狱头盔 corroborate. Keep the localized {*1...} display token byte-identical and append the English item label outside it; do not alter the game-title or delivery markers.'
    }
  ].freeze

  EXPECTED_KEYS = {
    'unique item:corthian-helm' => [['base', '357', '11']],
    'unique item:tiberian-helm' => [['base', '3688', '11']],
    'unique item:nightstone-helm' => [['base', '3933', '11']],
    'unique item:infernal-helm' => [
      ['base', '4670', '11'],
      ['default', '63378', '']
    ]
  }.freeze

  REPLACEMENTS = {
    ['base', '357', '11'] => [
      '코르티아(Corthia)의 투구',
      '코르티아의 투구(Corthian Helm)'
    ],
    ['base', '3688', '11'] => [
      '티베리안(Tiberian) 투구',
      '티베리안 투구(Tiberian Helm)'
    ],
    ['base', '3933', '11'] => [
      '나이트스톤 투구',
      '나이트스톤 투구(Nightstone Helm)'
    ],
    ['base', '4670', '11'] => [
      '지옥의 투구',
      '지옥의 투구(Infernal Helm)'
    ],
    ['default', '63378', ''] => [
      '{*1지옥불 투구}',
      '{*1지옥불 투구}(Infernal Helm)'
    ]
  }.freeze

  def definitions(headers)
    ENTITIES.map { |entity| headers.to_h { |header| [header, entity.fetch(header, '')] } }
  end

  def source_inventory
    M.refresh_inventory
  end

  def reviews(inventory)
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
      from, to = REPLACEMENTS.fetch(key)
      raise "expected one reviewed item span at #{key.inspect}" unless old.scan(from).length == 1

      occurrence.merge(
        'status' => 'accepted',
        'old' => old,
        'new' => old.sub(from, to),
        'evidence' => 'English names this complete item label; exact aligned Japanese and Chinese corroborate. Normalize only the item-name span, preserve all other entities, and keep any UI token and line breaks unchanged.',
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(occurrence.fetch('entity_key') => 'accepted'),
        'previous_status' => '',
        'previous_evidence' => ''
      )
    end
  end

  def write_inputs
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    inventory = source_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    rows = reviews(inventory)
    M.write_table(DEFINITIONS, glossary.headers, definitions(glossary.headers))
    M.write_table(REVIEWS, M::HEADERS, rows)
    [definitions(glossary.headers), rows]
  end

  def apply
    write_inputs
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

HelmItemResidualsD21533.apply if $PROGRAM_NAME == __FILE__
