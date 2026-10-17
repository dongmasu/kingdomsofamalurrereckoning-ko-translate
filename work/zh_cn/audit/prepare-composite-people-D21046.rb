#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module CompositePeopleD21046
  M = ReviewedNameBatches
  DEFINITION_PATH = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21046.tsv')
  REVIEW_PATH = '/private/tmp/proper-name-reviewed-D21046.tsv'
  PEOPLE = [
    {
      'entity_key' => 'person:nanne-hanri',
      'english_canonical' => 'Nanne Hanri',
      'category' => 'person',
      'korean_canonical' => '난네 한리(Nanne Hanri)',
      'english_aliases' => '',
      'korean_variants' => '나네 한리|난네 한리',
      'evidence_ids' => 'D-21046|default:16423|default:30149',
      'status' => 'confirmed',
      'notes' => 'English explicitly identifies the same alchemist, including her self-introduction at default:16423; the repeated formula quest confirms the referent. Japanese ナンネ・ハンリ and Chinese 南妮·汉里 corroborate. Use the dominant Korean form 난네 한리 and normalize 나네 한리. Keep the existing person:nanne component distinct; do not infer a global Hanri alias, which could collide with Aura Hanri. The official Korean manual has no direct entry for this character. No PAK-derived evidence.'
    },
    {
      'entity_key' => 'person:ost-ordura',
      'english_canonical' => 'Ost Ordura',
      'category' => 'person',
      'korean_canonical' => '오스트 오르두라(Ost Ordura)',
      'english_aliases' => '',
      'korean_variants' => '오스트 오르두라|오스트 오두라|오스트 오둘라',
      'evidence_ids' => 'D-21046|default:362|default:13101|default:13724',
      'status' => 'confirmed',
      'notes' => 'English identifies the recurring Warsworn patrol leader and quest contact, including his death and commendation storyline. Japanese オースト・オーデュラ and Chinese 欧斯特·奥杜拉 corroborate. Standardize the observed Korean variants to the corpus-majority 오스트 오르두라. No global Ost or Ordura alias is introduced. The official Korean manual has no direct entry for this character. No PAK-derived evidence.'
    }
  ].freeze

  module_function

  def texts(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json") || '[]').compact
  end

  def korean_pattern(person)
    variants = person.fetch('korean_variants').split('|')
      .sort_by { |variant| -variant.length }
      .map { |variant| Regexp.escape(variant) }.join('|')
    english = Regexp.escape(person.fetch('english_canonical'))
    /(?<!\p{Hangul})(?:#{variants})(?:\(#{english}\))?/
  end

  def run
    [DEFINITION_PATH, REVIEW_PATH].each do |path|
      raise "output already exists: #{path}" if File.exist?(path)
    end
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    PEOPLE.each do |person|
      raise "entity already registered: #{person['entity_key']}" if
        glossary.any? { |row| row['entity_key'] == person['entity_key'] }
    end

    inventory = M.refresh_inventory
    reviews = []
    PEOPLE.each do |person|
      english_name = person.fetch('english_canonical')
      sources = inventory.values.select do |source|
        texts(source, 'en').join("\n")
          .match?(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i)
      end
      expected_rows = { 'Nanne Hanri' => 16, 'Ost Ordura' => 30 }.fetch(english_name)
      raise "#{english_name}: expected #{expected_rows} rows, found #{sources.length}" unless
        sources.length == expected_rows

      pattern = korean_pattern(person)
      sources.each do |source|
        raise "unexpected resource for #{english_name}: #{source['resource']}" unless
          source['resource'] == 'default'
        old = source.fetch('work_text')
        korean_matches = old.to_enum(:scan, pattern).count
        raise "expected one Korean full-name span for #{english_name} at #{source['ID_Linha']}" unless
          korean_matches == 1
        english = texts(source, 'en').join("\n")
        raise "English occurrence count differs for #{english_name} at #{source['ID_Linha']}" unless
          english.scan(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i).length == 1
        new_text = old.sub(pattern, person.fetch('korean_canonical'))
        reviews << {
          'resource' => source.fetch('resource'),
          'ID_Linha' => source.fetch('ID_Linha'),
          'Tipo_Variante' => source['Tipo_Variante'].to_s,
          'entity_key' => person.fetch('entity_key'),
          'status' => old == new_text ? 'not-an-issue' : 'accepted',
          'old' => old,
          'new' => new_text,
          'evidence' => person.fetch('notes'),
          'english' => english,
          'japanese' => texts(source, 'ja').join("\n---\n"),
          'chinese' => source.fetch('zh_text'),
          'entity_dispositions_json' => JSON.generate(
            person.fetch('entity_key') => (old == new_text ? 'not-an-issue' : 'accepted')
          ),
          'previous_status' => '',
          'previous_evidence' => ''
        }
      end
    end
    raise 'duplicate reviewed row key' unless reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    M.write_table(DEFINITION_PATH, glossary.headers, PEOPLE)
    M.write_table(REVIEW_PATH, M::HEADERS, reviews)
    puts "Prepared #{reviews.length} complete-name rows: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

CompositePeopleD21046.run if $PROGRAM_NAME == __FILE__
