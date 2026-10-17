#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module FourPersonNamesD21101
  M = ReviewedNameBatches
  DEFINITIONS_PATH = File.join(__dir__, 'proper-name-discovery-definitions-D21101.tsv')
  REVIEWS_PATH = File.join(__dir__, 'proper-name-discovery-D21101.tsv')

  DEFINITIONS = [
    {
      'entity_key' => 'person:eleanor-brea',
      'english_canonical' => 'Eleanor Brea',
      'category' => 'person',
      'korean_canonical' => '엘리너 브레아(Eleanor Brea)',
      'english_aliases' => '',
      'korean_variants' => '엘리너 브리아',
      'status' => 'confirmed',
      'notes' => 'English identifies the Scholia Arcana founder and sorceress; Japanese エレノア・ブレア and Chinese 埃莉诺·布雷亚 corroborate. Reuse the prevailing Korean form, correct the isolated 브리아 spelling, and pair unlabelled name references.'
    },
    {
      'entity_key' => 'person:elodan-bloodgood',
      'english_canonical' => 'Elodan Bloodgood',
      'category' => 'person',
      'korean_canonical' => '엘로단 블러드굿(Elodan Bloodgood)',
      'english_aliases' => '',
      'korean_variants' => '',
      'status' => 'confirmed',
      'notes' => 'English identifies a Scholia Arcana founder and mage; Japanese エローダン・ブラッドグッド and Chinese 厄洛丹·布拉德古德 corroborate. Preserve the established Korean form and pair unlabelled references.'
    },
    {
      'entity_key' => 'person:astrid-frisk',
      'english_canonical' => 'Astrid Frisk',
      'category' => 'person',
      'korean_canonical' => '아스트리드 프리스크(Astrid Frisk)',
      'english_aliases' => '',
      'korean_variants' => '',
      'status' => 'confirmed',
      'notes' => 'English identifies Didenhil healer Astrid Frisk in the Plagueshield quest; Japanese アストリッド・フリスク and Chinese 阿斯特丽德·弗里斯克 corroborate. Reuse the active form and pair unlabelled references.'
    },
    {
      'entity_key' => 'person:aubrey-gilcrest',
      'english_canonical' => 'Aubrey Gilcrest',
      'category' => 'person',
      'korean_canonical' => '오브리 길크레스트(Aubrey Gilcrest)',
      'english_aliases' => '',
      'korean_variants' => '',
      'status' => 'confirmed',
      'notes' => 'English identifies the castaway scholar researching Dvergan treasures; Japanese オーブリー・ギルクレスト and Chinese 奥布里·吉尔克雷斯特 corroborate. Reuse the active form and pair unlabelled references.'
    },
    {
      'entity_key' => 'person:othe-theswin',
      'english_canonical' => 'Othe Theswin',
      'category' => 'person',
      'korean_canonical' => '오테 세스윈(Othe Theswin)',
      'english_aliases' => '',
      'korean_variants' => '오스 테스윈|오테 테스윈',
      'status' => 'confirmed',
      'notes' => 'English identifies the author and scholar associated with Aubrey Gilcrest; Japanese オット・セスウィン and Chinese 奥西·瑟斯文 corroborate. Use the prevailing Korean form and normalize two alternate spellings.'
    }
  ].freeze

  EVIDENCE = {
    'person:eleanor-brea' => 'Founder and sorceress of the Scholia Arcana; English, Japanese, and Chinese align on the named person.',
    'person:elodan-bloodgood' => 'Founder and mage of the Scholia Arcana; English, Japanese, and Chinese align on the named person.',
    'person:astrid-frisk' => 'Didenhil healer associated with the Plagueshield quest; English, Japanese, and Chinese align on the named person.',
    'person:aubrey-gilcrest' => 'Castaway scholar and Dvergan-treasure researcher; English, Japanese, and Chinese align on the named person.',
    'person:othe-theswin' => 'Author and scholar associated with Aubrey Gilcrest; English, Japanese, and Chinese align on the named person.'
  }.freeze

  def self.pair_unlabelled(text, korean, english)
    text.gsub(/#{Regexp.escape(korean)}(?!\()/, "#{korean}(#{english})")
  end

  def self.apply_entity(text, entity_key)
    case entity_key
    when 'person:eleanor-brea'
      text = text.gsub('엘리너 브리아(Eleanor Brea)', '엘리너 브레아(Eleanor Brea)')
      text = pair_unlabelled(text, '엘리너 브레아', 'Eleanor Brea')
      text.gsub(/엘리너(?=에게서|만큼)(?!\()/, '엘리너(Eleanor Brea)')
    when 'person:elodan-bloodgood'
      pair_unlabelled(text, '엘로단 블러드굿', 'Elodan Bloodgood')
    when 'person:astrid-frisk'
      pair_unlabelled(text, '아스트리드 프리스크', 'Astrid Frisk')
    when 'person:aubrey-gilcrest'
      pair_unlabelled(text, '오브리 길크레스트', 'Aubrey Gilcrest')
    when 'person:othe-theswin'
      text = text.gsub('오스 테스윈(Othe Theswin)', '오테 세스윈(Othe Theswin)')
      text = text.gsub('오테 테스윈(Othe Theswin)', '오테 세스윈(Othe Theswin)')
      text = pair_unlabelled(text, '오스 테스윈', 'Othe Theswin')
      text = pair_unlabelled(text, '오테 테스윈', 'Othe Theswin')
      pair_unlabelled(text, '오테 세스윈', 'Othe Theswin')
    else
      raise "unknown discovery entity #{entity_key}"
    end
  end

  def self.build
    inventory = M.refresh_inventory
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv')).map(&:to_h)
    existing_keys = glossary.map { |row| row.fetch('entity_key') }
    raise 'discovery entity already exists' unless
      (existing_keys & DEFINITIONS.map { |row| row.fetch('entity_key') }).empty?

    occurrences = build_occurrences(inventory.values, DEFINITIONS).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    grouped = occurrences.group_by { |row| M.key(row) }
    reviews = grouped.map do |key, group|
      source = inventory.fetch(key)
      old_text = source.fetch('work_text')
      new_text = old_text.dup
      dispositions = {}
      group.map { |row| row.fetch('entity_key') }.uniq.sort.each do |entity|
        before = new_text
        new_text = apply_entity(new_text, entity)
        dispositions[entity] = before == new_text ? 'not-an-issue' : 'accepted'
      end
      status = dispositions.value?('accepted') ? 'accepted' : 'not-an-issue'
      {
        'resource' => key.fetch(0),
        'ID_Linha' => key.fetch(1),
        'Tipo_Variante' => key.fetch(2),
        'entity_key' => dispositions.keys.join('|'),
        'status' => status,
        'old' => old_text,
        'new' => new_text,
        'evidence' => dispositions.keys.map { |entity| EVIDENCE.fetch(entity) }.join(' '),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end.sort_by { |row| [ReviewedNameBatches::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

    entity_counts = occurrences.group_by { |row| row.fetch('entity_key') }
                               .transform_values(&:length)
    raise 'unexpected entity/source-key coverage' unless
      entity_counts == {
        'person:eleanor-brea' => 14,
        'person:elodan-bloodgood' => 13,
        'person:astrid-frisk' => 12,
        'person:aubrey-gilcrest' => 13,
        'person:othe-theswin' => 4
      }
    raise 'unexpected unique CSV row-key coverage' unless reviews.length == 50
    raise 'unexpected approved edit count' unless reviews.count { |row| row['old'] != row['new'] } == 25

    definitions = DEFINITIONS.map do |definition|
      keys = occurrences.select { |row| row['entity_key'] == definition['entity_key'] }
                        .map { |row| M.key(row).join(':') }
      definition.merge('evidence_ids' => (["D-21101"] + keys).join('|'))
    end
    M.write_table(DEFINITIONS_PATH, DEFINITIONS.first.keys + ['evidence_ids'], definitions)
    M.write_table(REVIEWS_PATH, reviews.first.keys, reviews)
    puts "Prepared #{entity_counts.values.sum} entity/row matches across #{reviews.length} CSV row keys; #{reviews.count { |row| row['old'] != row['new'] }} approved text edits."
  end
end

FourPersonNamesD21101.build if $PROGRAM_NAME == __FILE__
