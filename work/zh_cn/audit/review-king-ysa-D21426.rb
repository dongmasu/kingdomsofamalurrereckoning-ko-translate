#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module KingYsaD21426
  extend self

  M = ReviewedNameBatches
  D = 21_426
  ENTITY = 'person:king-ysa'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  PERSON_IDS = %w[6347 8814 11236 11427 12727 18032 18471 19105 25425 26156 32256 37187 37830 54436 56873 57472 58722 61425].freeze
  EXCLUDED_KEYS = [['base', '1823', '11'], ['base', '2234', '11'],
                   ['default', '3873', '']].freeze
  NOTE = 'English identifies the historical Summer/Seelie ruler King Ysa, also called Lord Ysa, distinguished from the city Ysa. Withering War history and the repeated King Ysa ballad establish the person; Japanese イーサ王/イーサ卿 and Chinese 伊萨王/伊萨国王/伊萨领主 corroborate. Register only explicit King Ysa/Lord Ysa matches globally; same-row short personal references are annotated locally. Preserve source-local ranks as 이사 왕(King Ysa), 이사 경(Lord Ysa), and 이사(Ysa); do not alias bare Ysa globally or reopen the city dispositions.'

  def normalize(text)
    text.gsub(/이사(?:\(Ysa\))?\s*왕(?:\(King Ysa\))?/, '이사 왕(King Ysa)')
        .gsub(/이사(?:\(Ysa\))?\s*경(?:\(Lord Ysa\))?/, '이사 경(Lord Ysa)')
        .gsub(/(?<![가-힣])이사(?!\(|\s*(?:왕|경)|의 정원)/, '이사(Ysa)')
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'prepared artifacts exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    raise 'missing separate city definition' unless glossary.any? { |row| row['entity_key'] == 'place:ysa' }
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => 'King Ysa', 'category' => 'person',
      'korean_canonical' => '이사 왕(King Ysa)', 'english_aliases' => 'Lord Ysa',
      'korean_variants' => '이사 왕|이사 경|이사(Ysa) 왕|이사(Ysa) 경',
      'evidence_ids' => 'D-21426|default:6347|default:12727|default:57472|default:61425',
      'status' => 'confirmed', 'notes' => NOTE
    }
    definitions = [glossary.headers.to_h { |header| [header, fields.fetch(header, '')] }]
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = PERSON_IDS.map { |id| ['default', id, ''] } + EXCLUDED_KEYS
    raise 'historical Ysa scope differs' unless generated.map { |row| M.key(row) }.sort == expected.sort
    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "Ysa source evidence missing #{key.inspect}" if [english, japanese, chinese].any?(&:empty?)
      raise "Ysa title evidence differs #{key.inspect}" unless
        english.match?(/\b(?:King|Lord) Ysa\b/i) &&
        japanese.match?(/イーサ(?:王|卿|はダレンタースの王)/) && chinese.include?('伊萨')
      old = source.fetch('work_text')
      excluded = EXCLUDED_KEYS.include?(key)
      proposed = excluded ? old : normalize(old)
      raise 'Ysa transformation not idempotent' unless excluded || normalize(proposed) == proposed
      raise 'Gardens of Ysa annotation changed' unless
        old.scan(/이사의 정원\(Gardens of Ysa\)/) == proposed.scan(/이사의 정원\(Gardens of Ysa\)/)
      status = excluded ? 'excluded' : old == proposed ? 'not-an-issue' : 'accepted'
      evidence = NOTE
      evidence += if excluded
                    ' Exclude the complete statue/muffin source label from this person-label pass and preserve its existing text. Do not infer an item/person equivalence or nested annotation.'
                  else
                    ' This is a new person/entity occurrence scope, not a rejudgment of prior city/faction/war/translation decisions at this row. Only the personal-name annotations change; preserve all previously approved wording and counts.'
                  end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => evidence, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese, 'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "Prepared D-#{D}: #{reviews.length} keys; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} edits; three item-label exclusions."
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new')) }
    [definitions, reviews]
  end

  def apply
    definitions, reviews = prepare
    M.write_table(DEFINITIONS, M.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers,
                  definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then KingYsaD21426.prepare
  when 'apply' then KingYsaD21426.apply
  else abort 'usage: review-king-ysa-D21426.rb [prepare|apply]'
  end
end
