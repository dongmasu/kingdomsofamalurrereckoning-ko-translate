#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module SixPersonDiscoveryD21110
  M = ReviewedNameBatches
  DEFINITIONS_PATH = File.join(__dir__, 'proper-name-discovery-definitions-D21110.tsv')
  REVIEWS_PATH = File.join(__dir__, 'proper-name-discovery-D21110.tsv')
  INVENTORY_SHA256 = '5c9a3740a591fea4806cf516d2030fff994c235584eb702f33e72591ddf9f357'

  PEOPLE = [
    {
      'entity_key' => 'person:corialia-scathe',
      'english_canonical' => 'Corialia Scathe',
      'category' => 'person',
      'korean_canonical' => '코리알리아 스케이스(Corialia Scathe)',
      'korean_variants' => '코리알리아 스케이스|코리아리아 스케이스|코리알리아 스케이트',
      'japanese' => 'コリアリア・スケイズ',
      'chinese' => '科里亚利亚·斯卡瑟',
      'context' => 'The surgeon and owner of the Mel Senshir experiments; quest objectives and dialogue identify the same person.'
    },
    {
      'entity_key' => 'person:marus-torix',
      'english_canonical' => 'Marus Torix',
      'category' => 'person',
      'korean_canonical' => '마루스 토릭스(Marus Torix)',
      'korean_variants' => '마루스 토릭스',
      'japanese' => 'マルス・トリクス',
      'chinese' => '马鲁斯·托里克斯',
      'context' => 'The named founder represented by statues and discussed in the Scholia Arcana historical account.'
    },
    {
      'entity_key' => 'person:pepin-jamane',
      'english_canonical' => 'Pepin Jamane',
      'category' => 'person',
      'korean_canonical' => '페핀 자마네(Pepin Jamane)',
      'korean_variants' => '페핀 자마네|페핀 자메인',
      'japanese' => 'ペピン・ジャマン',
      'chinese' => '派平·亚玛尼',
      'context' => 'The gnome scholar in the Undersea Fasting expedition and the subject of the linked journal and quest updates.'
    },
    {
      'entity_key' => 'person:nuala-ignas',
      'english_canonical' => 'Nuala Ignas',
      'category' => 'person',
      'korean_canonical' => '누알라 이그나스(Nuala Ignas)',
      'korean_variants' => '누알라 이그나스',
      'japanese' => 'ヌアラ・イグナス',
      'chinese' => '努阿拉·伊格纳斯',
      'context' => 'The mage connected to the Aodh ruin, Trial oversight, and Sun Stone quest.'
    },
    {
      'entity_key' => 'person:kells-cafferty',
      'english_canonical' => 'Kells Cafferty',
      'category' => 'person',
      'korean_canonical' => '켈스 카퍼티(Kells Cafferty)',
      'korean_variants' => '켈스 카퍼티|켈스 캐퍼티',
      'japanese' => 'ケルス・カファーティ',
      'chinese' => '克尔斯·卡弗蒂',
      'context' => 'The Bloodstone seller in Tirin’s Rest and self-described servant of the sisters of destiny.'
    },
    {
      'entity_key' => 'person:bertrand-seznec',
      'english_canonical' => 'Bertrand Seznec',
      'category' => 'person',
      'korean_canonical' => '버트런드 세즈넥(Bertrand Seznec)',
      'korean_variants' => '버트런드 세즈넥|베르트랑 세즈넥',
      'japanese' => 'バートランド・セズネック',
      'chinese' => '贝尔特兰德·塞兹内克',
      'context' => 'The gnome survivor who assigns the Gallows Bloom sample task.'
    }
  ].freeze

  module_function

  def source_match?(row, name)
    JSON.parse(row.fetch('en_texts_json') || '[]').compact.join("\n")
      .match?(/(?<![A-Za-z0-9])#{Regexp.escape(name)}(?![A-Za-z0-9])/i)
  end

  def standardize(text, person)
    english = Regexp.escape(person.fetch('english_canonical'))
    canonical = person.fetch('korean_canonical')
    person.fetch('korean_variants').split('|').sort_by { |variant| -variant.length }.each do |variant|
      pattern = /#{Regexp.escape(variant)}(?:\s*\(#{english}\))?/
      text = text.gsub(pattern, canonical)
    end
    if person.fetch('entity_key') == 'person:pepin-jamane'
      particles = { '을' => '를', '이' => '가', '은' => '는', '과' => '와' }
      text = text.gsub(/(페핀 자마네\(Pepin Jamane\))(을|이|은|과)/) do
        "#{Regexp.last_match(1)}#{particles.fetch(Regexp.last_match(2))}"
      end
    end
    text
  end

  def build
    inventory_bytes = File.binread(M::INVENTORY)
    raise 'aligned source inventory hash changed' unless
      Digest::SHA256.hexdigest(inventory_bytes) == INVENTORY_SHA256
    inventory = M.table(M::INVENTORY).map(&:to_h)
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv')).map(&:to_h)
    known_entities = glossary.map { |row| row.fetch('entity_key') }
    raise 'discovery entity already registered' unless
      (known_entities & PEOPLE.map { |person| person.fetch('entity_key') }).empty?

    definitions = PEOPLE.map do |person|
      matching = inventory.select { |row| source_match?(row, person.fetch('english_canonical')) }
      raise "no aligned source hits for #{person.fetch('english_canonical')}" if matching.empty?
      person.merge(
        'english_aliases' => '',
        'status' => 'confirmed',
        'notes' => "English identifies the person; aligned Japanese #{person.fetch('japanese')} and Chinese #{person.fetch('chinese')} corroborate. #{person.fetch('context')} Normalize to #{person.fetch('korean_canonical')}; this entity-specific registration does not reopen sequential row dispositions or alter their global tally.",
        'evidence_ids' => (['D-21110-D-21111'] + matching.map do |row|
          [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante']].compact.join(':')
        end).join('|')
      )
    end

    generated = build_occurrences(inventory, PEOPLE).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    by_entity = generated.group_by { |row| row.fetch('entity_key') }
    definitions.each do |person|
      actual = by_entity.fetch(person.fetch('entity_key'), [])
      expected = inventory.select { |row| source_match?(row, person.fetch('english_canonical')) }
                          .map { |row| M.key(row) }.sort
      raise "source-hit/index mismatch for #{person.fetch('english_canonical')}" unless
        actual.map { |row| M.key(row) }.sort == expected
    end

    duplicate_keys = generated.group_by { |row| M.key(row) }.select { |_key, rows| rows.length > 1 }
    raise "multiple new people share row keys: #{duplicate_keys.keys.inspect}" unless duplicate_keys.empty?

    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.find { |row| M.key(row) == key }
      person = PEOPLE.find { |candidate| candidate.fetch('entity_key') == occurrence.fetch('entity_key') }
      old_text = source.fetch('work_text')
      new_text = standardize(old_text, person)
      raise "unrecognized Korean name form at #{key.inspect}" unless
        new_text.include?(person.fetch('korean_canonical'))
      status = old_text == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key.fetch(0),
        'ID_Linha' => key.fetch(1),
        'Tipo_Variante' => key.fetch(2),
        'entity_key' => person.fetch('entity_key'),
        'status' => status,
        'old' => old_text,
        'new' => new_text,
        'evidence' => "English explicitly identifies #{person.fetch('english_canonical')}; aligned Japanese #{person.fetch('japanese')} and Chinese #{person.fetch('chinese')} corroborate the person. #{person.fetch('context')} Use #{person.fetch('korean_canonical')} consistently, including complete English pairing; do not reopen or recount prior sequential row decisions.",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(person.fetch('entity_key') => status)
      }
    end
    raise 'duplicate reviewed source key' unless reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    raise 'unexpected discovery row count' unless reviews.length == 71

    M.write_table(DEFINITIONS_PATH, definitions.first.keys, definitions)
    M.write_table(REVIEWS_PATH, reviews.first.keys, reviews)
    puts "Prepared #{definitions.length} people / #{reviews.length} distinct source rows; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} approved Texto edits."
    PEOPLE.each do |person|
      rows = reviews.select { |row| row.fetch('entity_key') == person.fetch('entity_key') }
      puts "#{person.fetch('english_canonical')}: #{rows.length} rows, " \
           "#{rows.count { |row| row['old'] != row['new'] }} edits."
    end
  end
end

SixPersonDiscoveryD21110.build if $PROGRAM_NAME == __FILE__
