#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module EngardDiscoveryD21374
  M = ReviewedNameBatches
  REGISTRATION = ReviewedProperNameDiscovery
  PERSON = 'person:engard'
  FACTION = 'faction:circle-of-engard'
  PERSON_NAME = '엔가드(Engard)'
  FACTION_NAME = '엔가드 교단(Circle of Engard)'
  START_D = 21_374
  REVIEW = File.join(M::AUDIT, "proper-name-discovery-D#{START_D}.tsv")
  DEFINITION = File.join(M::AUDIT, "proper-name-discovery-definitions-D#{START_D}.tsv")
  EVIDENCE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:5605 and default:27731 describe Engard as the Fae
    embodiment of contention and a champion; default:280 identifies the
    defeated Fae Champion of Valor, and default:62013 distinguishes the Fae
    Engard from the mortal pretender. Japanese エンガード and Chinese 恩加德
    corroborate the name. The English source separately identifies the Circle
    of Engard as a Fae group whose brethren seek to restore lost rites, bear
    arms, and serve Engard; Japanese サークル・オブ・エンガード and Chinese
    恩加德教派 support the named group and its collective role. Use
    엔가드(Engard) for the person and 엔가드 교단(Circle of Engard) for the
    faction. The official Korean manual contains no direct entry for either
    name. Keep the named Fae champion and the faction distinct.
  TEXT
  ORG_PATTERN = /(?:엔가드|엥가드)(?:\(Engard\))?(?:\s*의)?\s*(?:교단|결사단|결사|서클|원|모임)(?:\(Circle of Engard\))?|서클\s*오브\s*엔가드/
  PERSON_PATTERN = /(?<![A-Za-z가-힣])(?:엔가드|엥가드)(?:\(Engard\))?(?![A-Za-z])/
  ORG_PLACEHOLDER = "\uE000ENGARD_FACTION\uE001"

  DEFINITIONS = [
    {
      'entity_key' => PERSON,
      'english_canonical' => 'Engard',
      'category' => 'person',
      'korean_canonical' => PERSON_NAME,
      'english_aliases' => '',
      'korean_variants' => '엔가드|엥가드|엔가드(Engard)|엥가드(Engard)',
      'evidence_ids' => "D-#{START_D}",
      'status' => 'confirmed',
      'notes' => EVIDENCE
    },
    {
      'entity_key' => FACTION,
      'english_canonical' => 'Circle of Engard',
      'category' => 'faction',
      'korean_canonical' => FACTION_NAME,
      'english_aliases' => '',
      'korean_variants' => [
        '엥가드 교단', '엔가드(Engard) 교단', '엥가드의 결사',
        '엔가드의 결사', '엥가드 결사단', '엔가드 결사단',
        '엔가드 서클', '엔가드의 서클', '엔가드의 원',
        '엔가드의 모임', '서클 오브 엔가드'
      ].join('|'),
      'evidence_ids' => "D-#{START_D}",
      'status' => 'confirmed',
      'notes' => EVIDENCE
    }
  ].freeze

  module_function

  def transform(source, generated_entities)
    old = source.fetch('work_text')
    text = old.dup
    source_english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")

    if source_english.match?(/(?<![A-Za-z])Circle of Engard(?![A-Za-z])/i)
      raise 'Circle of Engard is missing a Korean faction reference' unless text.match?(ORG_PATTERN)

      text.gsub!(ORG_PATTERN, FACTION_NAME)
      text.gsub!("#{FACTION_NAME}는", "#{FACTION_NAME}은")
      text.gsub!("#{FACTION_NAME}가", "#{FACTION_NAME}이")
      text.gsub!("#{FACTION_NAME}를", "#{FACTION_NAME}을")
      text.gsub!("#{FACTION_NAME}로", "#{FACTION_NAME}으로")
      text.gsub!("#{FACTION_NAME}다", "#{FACTION_NAME}이다")
    end

    if source.fetch('ID_Linha') == '62013'
      before = '나는 엔가드(Engard)의 책무를 수행하는 엔가드 교단(Circle of Engard)을 이끌어.'
      after = '나는 엔가드 교단(Circle of Engard)을 지휘해.'
      raise 'unexpected Circle of Engard:62013 wording' unless text.include?(before)
      text.sub!(before, after)
    end

    protected = text.gsub(FACTION_NAME, ORG_PLACEHOLDER)
    protected.gsub!(PERSON_PATTERN, PERSON_NAME) if generated_entities.include?(PERSON)
    text = protected.gsub(ORG_PLACEHOLDER, FACTION_NAME)

    if generated_entities.include?(PERSON)
      raise 'Engard person reference is missing from the Korean cell' unless
        text.include?(PERSON_NAME) || text.include?(FACTION_NAME)
    end
    if generated_entities.include?(FACTION)
      raise 'Circle of Engard reference is missing from the canonical Korean cell' unless
        text.include?(FACTION_NAME)
    end
    raise 'opaque tokens or line breaks changed' unless
      old.scan(ReviewedProperNameDiscovery::OPAQUE) == text.scan(ReviewedProperNameDiscovery::OPAQUE) &&
      old.scan(/\r\n|\r|\n/) == text.scan(/\r\n|\r|\n/)

    text
  end

  def build_reviews(definitions, generated, inventory)
    grouped = generated.group_by { |row| M.key(row) }
    grouped.map do |key, matches|
      source = inventory.fetch(key)
      entities = matches.map { |row| row.fetch('entity_key') }.uniq.sort
      text = transform(source, entities)
      status = text == source.fetch('work_text') ? 'not-an-issue' : 'accepted'
      dispositions = entities.to_h { |entity| [entity, status] }
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entities.join('|'), 'status' => status,
        'old' => source.fetch('work_text'), 'new' => text,
        'evidence' => EVIDENCE,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row.fetch('Tipo_Variante')]
    end
  end

  def run
    raise 'usage: prepare-engard-discovery-D21374.rb' unless ARGV.empty?
    REGISTRATION.ensure_unused_batch!(START_D)

    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    generated = build_occurrences(inventory.values, DEFINITIONS).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "expected 42 source row keys, found #{generated.map { |row| M.key(row) }.uniq.length}" unless
      generated.map { |row| M.key(row) }.uniq.length == 42
    raise 'unexpected Engard person coverage' unless
      generated.count { |row| row['entity_key'] == PERSON } == 42
    raise 'unexpected Circle of Engard faction coverage' unless
      generated.count { |row| row['entity_key'] == FACTION } == 27

    reviews = build_reviews(DEFINITIONS, generated, inventory)
    REGISTRATION.validate!(DEFINITIONS, reviews, generated,
                           M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv')).map(&:to_h),
                           index)
    REGISTRATION.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row.fetch('resource') }.each do |resource, rows|
      edits = rows.select { |row| row.fetch('old') != row.fetch('new') }
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits) unless edits.empty?
    end
    M.write_table(REVIEW, M::HEADERS, reviews)
    M.write_table(DEFINITION, M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv')).headers,
                  DEFINITIONS)
    puts "Prepared #{reviews.length} source rows (#{generated.length} entity occurrences): " \
         "#{reviews.count { |row| row['status'] == 'accepted' }} edited, " \
         "#{reviews.count { |row| row['status'] == 'not-an-issue' }} unchanged."
  end
end

EngardDiscoveryD21374.run if $PROGRAM_NAME == __FILE__
