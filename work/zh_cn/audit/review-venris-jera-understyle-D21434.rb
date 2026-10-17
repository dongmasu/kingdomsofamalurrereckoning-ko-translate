#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module VenrisJeraUnderstyleD21434
  extend self

  M = ReviewedNameBatches
  D = 21_434
  CONFIG = [
    {
      entity: 'person:venris', english: 'Venris', korean: '벤리스',
      category: 'person', aliases: '', ja: /ヴェンリス/, zh: /文利斯|温里斯/,
      pattern: /(?:벤리스|베니스)(?:\(Venris\))?/,
      ids: %w[2888 7417 10265 14002 20647 21430 28068 28772 30056 34594
              34836 37113 41493 41701 45506 48447 49701 50554 51333 51423
              52904 57144 57966 58177],
      base: [],
      note: 'English default:58177 explicitly identifies Venris as Zanvil Whit\'s deceased Ljosalfar scout; repeated wolf/reconnaissance context establishes one person. Japanese ヴェンリス and Chinese 文利斯/温里斯 corroborate. Reuse 벤리스 and correct the isolated 베니스 typo. Repeated Korean mentions in the same reviewed cell receive the same annotation; no new translation of the existing wolf-ownership prose is inferred.'
    },
    {
      entity: 'person:jera-soren', english: 'Jera Soren', korean: '제라 소렌',
      category: 'person', aliases: 'Jera Dace', ja: /ジェラ・(?:ソレン|デイス)/,
      zh: /杰拉·(?:索伦|戴斯)/,
      pattern: /제라 (?:소렌|데이스)(?:\(Jera (?:Soren|Dace)\))?/,
      ids: %w[3405 7723 8528 11022 19854 20410 24985 50011 51351 59162],
      base: %w[3219],
      note: 'English uses Jera Soren for the rose-carved headstone and grave objective (8528/19854/50011/51351) and Jera Dace for the same Rose of Kandrian retrieval (3405/7723/11022/20410/59162). The wife is explicit at 20410. Japanese even uses ジェラ・デイス at English Soren keys 19854/50011/51351, corroborating the source-name variant; Chinese preserves both full spellings. Register both full forms under one entity, retain each row\'s English-local surname in Korean, and do not add global Jera, Soren or Dace aliases. Do not infer a maiden/married-name biography.'
    },
    {
      entity: 'person:lyra-turrelm', english: 'Lyra Turrelm', korean: '라이라 터렐름',
      category: 'person', aliases: '', ja: /ライラ・ターレム/, zh: /里拉·图瑞姆/,
      pattern: /라이라 터렐름(?:\(Lyra Turrelm\))?/,
      ids: %w[18712 24209 53626], base: [],
      note: 'English full-name labels identify Lyra Turrelm, corroborated by Japanese ライラ・ターレム and Chinese 里拉·图瑞姆. Preserve the established 라이라 터렐름. Lyra Vogard and the refugee quest are not merged; no global Lyra or Turrelm alias is inferred.'
    },
    {
      entity: 'place:theater-of-fate', english: 'Theater of Fate', korean: '운명의 극장',
      category: 'place', aliases: 'Theatre of Fate|Theater of Fates',
      ja: /運命の祭壇/, zh: /命运剧场/,
      pattern: /운명의 극장(?:\(Theat(?:er|re) of Fates?\))?/,
      ids: %w[5514 5751 29584 31045 31506 38077 38087 39827 45804
              48429 53080 54811 64593], base: %w[1722 3080],
      note: 'English identifies the ancient Fateweaver site in Dellach with the Destiny Stone. The British Theatre spelling at base:1722 and source-local plural Theater of Fates at default:54811 share the same Japanese 運命の祭壇 and Chinese 命运剧场 and explicit Dellach/stone context. Normalize Korean bilingual labels to 운명의 극장(Theater of Fate); do not merge the distinct Theater of Andronikos or generic theater references.'
    },
    {
      entity: 'place:the-understyle', english: 'The Understyle', korean: '언더스타일',
      category: 'place', aliases: 'Understyle', ja: /アンダースタイル/, zh: /下界花园/,
      pattern: /(?:언더스타일|하층 정원)(?:\((?:The )?Understyle\))?/,
      ids: %w[395 640 1734 2078 4727 5319 6746 9601 11964 13416 19211
              23978 25255 29007 29500 33762 34302 34789 38715 48280
              50284 51511 52392 53525 58711 59318 59993], base: [],
      note: 'English describes the same Fae garden district of Ysa beneath the Font (19211/34302), also labeled The Understyle. Japanese アンダースタイル and Chinese 下界花园 corroborate. Reuse 언더스타일 and the complete title The Understyle consistently, replacing the isolated literal 하층 정원 label. The Trellis, Hall of Appointments and Lyceum Grove remain separate registered locations.'
    }
  ].freeze

  def keys(item)
    item.fetch(:base).map { |id| ['base', id, '11'] } +
      item.fetch(:ids).map { |id| ['default', id, ''] }
  end

  def definitions_for(headers)
    CONFIG.map do |item|
      fields = {
        'entity_key' => item.fetch(:entity), 'english_canonical' => item.fetch(:english),
        'category' => item.fetch(:category),
        'korean_canonical' => "#{item.fetch(:korean)}(#{item.fetch(:english)})",
        'english_aliases' => item.fetch(:aliases), 'korean_variants' => item.fetch(:korean),
        'status' => 'confirmed', 'evidence_ids' => "D-#{D}-D-#{D + 1}",
        'notes' => item.fetch(:note)
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def transform(item, old, english)
    raise "missing Korean span for #{item.fetch(:entity)}" unless old.match?(item.fetch(:pattern))
    local_dace = item.fetch(:entity) == 'person:jera-soren' && english.include?('Jera Dace')
    label = local_dace ? '제라 데이스(Jera Dace)' :
      "#{item.fetch(:korean)}(#{item.fetch(:english)})"
    old.gsub(item.fetch(:pattern), label)
  end

  def reviews_for(inventory, generated)
    expected = CONFIG.flat_map { |item| keys(item).map { |key| [item.fetch(:entity), *key] } }
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise "source coverage differs: #{(expected - actual).inspect} / #{(actual - expected).inspect}" unless
      actual.sort == expected.sort
    raise 'overlapping row scopes' unless actual.map { |row| row.drop(1) }.uniq.length == actual.length

    generated.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }.map do |occurrence|
      item = CONFIG.find { |config| config.fetch(:entity) == occurrence.fetch('entity_key') }
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "Japanese anchor missing #{key.inspect}" unless japanese.match?(item.fetch(:ja))
      raise "Chinese anchor missing #{key.inspect}" unless chinese.match?(item.fetch(:zh))
      old = source.fetch('work_text')
      new_text = transform(item, old, english)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => item.fetch(:entity), 'status' => status, 'old' => old, 'new' => new_text,
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(item.fetch(:entity) => status),
        'evidence' => "#{item.fetch(:note)} English anchors identity and meaning; aligned Japanese and Chinese corroborate. All affix/base/default source rows were searched. The official Korean manual provides setting/people background but does not specify these names. Existing unrelated entity decisions and historical translation totals remain unchanged."
      }
    end
  end

  def prepare
    [D, D + 1].each { |d| ReviewedProperNameDiscovery.ensure_unused_batch!(d) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    definitions = definitions_for(glossary.headers)
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    reviews = reviews_for(inventory, generated)
    ReviewedProperNameDiscovery.validate!(definitions, reviews, generated,
      glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h))
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.reject { |row| row['old'] == row['new'] }.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
    end
    puts JSON.generate(
      entities: definitions.length, rows: reviews.length,
      statuses: reviews.group_by { |row| row['status'] }.transform_values(&:length)
    )
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'entity_key', 'status', 'new')) }
    [definitions, reviews]
  end

  def apply
    definitions, reviews = prepare
    definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
    review_path = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
    raise 'prepared output exists' if [definition_path, review_path].any? { |path| File.exist?(path) }
    M.write_table(definition_path, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, definitions)
    M.write_table(review_path, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([definition_path, review_path, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then VenrisJeraUnderstyleD21434.prepare
  when 'apply' then VenrisJeraUnderstyleD21434.apply
  else abort 'usage: review-venris-jera-understyle-D21434.rb [prepare|apply]'
  end
end
