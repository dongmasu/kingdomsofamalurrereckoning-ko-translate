#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module ChildOfDustD21041
  M = ReviewedNameBatches
  ENTITY = 'title:child-of-the-dust'
  ENGLISH = 'Child of the Dust'
  KOREAN = '먼지의 아이'
  DEFINITION_PATH = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21041.tsv')
  REVIEW_PATH = '/private/tmp/proper-name-reviewed-D21041.tsv'
  FORMS = %w[먼지의 자녀 먼지의 자식 먼지의 아이 먼지의 자손].freeze
  PATTERN = /(?<name>먼지의 (?:자녀|자식|아이|자손))(?<label>\(Child of the Dust\))?(?<ending>이여|여|이|가|아|야)?/

  module_function

  def texts(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json") || '[]').compact
  end

  def normalize(text)
    matches = text.to_enum(:scan, PATTERN).map do
      match = Regexp.last_match
      [match.begin(0), match.end(0), match[:ending].to_s]
    end
    raise 'source hit has no bounded Korean title form' if matches.empty?
    updated = text.dup
    matches.reverse_each do |start_at, finish, ending|
      ending = { '이여' => '여', '이' => '가', '아' => '야' }.fetch(ending, ending)
      updated[start_at...finish] = "#{KOREAN}(#{ENGLISH})#{ending}"
    end
    updated
  end

  def run
    [DEFINITION_PATH, REVIEW_PATH].each do |path|
      raise "output already exists: #{path}" if File.exist?(path)
    end
    inventory = M.refresh_inventory.values
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    raise 'title already registered' if glossary.any? do |row|
      row['entity_key'] == ENTITY ||
        ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
          .any? { |term| term.casecmp?(ENGLISH) }
    end

    sources = inventory.select do |source|
      texts(source, 'en').any? do |text|
        text.match?(/(?<![A-Za-z])#{Regexp.escape(ENGLISH)}(?![A-Za-z])/i)
      end
    end.sort_by { |source| [M::RESOURCES.index(source['resource']), source['ID_Linha'].to_i] }
    raise "expected 10 source rows, found #{sources.length}" unless sources.length == 10

    definition = {
      'entity_key' => ENTITY, 'english_canonical' => ENGLISH,
      'category' => 'title', 'korean_canonical' => "#{KOREAN}(#{ENGLISH})",
      'english_aliases' => '', 'korean_variants' => '먼지의 자녀|먼지의 자식|먼지의 자손',
      'evidence_ids' => 'D-21041|default:2426|default:51806',
      'status' => 'confirmed',
      'notes' => 'Recurring formal address for the mortal protagonist, not a literal child or a generic reference to dust. English capitalization and the repeated vocative use identify the title; Japanese 塵より生まれし者 and Chinese 尘埃之子 corroborate the same epithet. Standardize Korean forms to 먼지의 아이(Child of the Dust), adjusting only the attached vocative/subject marker required by that form. The separate lore:the-telling disposition at default:5311 remains untouched.'
    }
    M.write_table(DEFINITION_PATH, glossary.headers, [definition])

    reviews = sources.map do |source|
      old = source.fetch('work_text')
      new_text = normalize(old)
      raise "no text change at #{source['ID_Linha']}" if old == new_text &&
        source['ID_Linha'] != '55738'
      {
        'resource' => source.fetch('resource'), 'ID_Linha' => source.fetch('ID_Linha'),
        'Tipo_Variante' => source['Tipo_Variante'].to_s, 'entity_key' => ENTITY,
        'status' => old == new_text ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => new_text,
        'evidence' => 'English uses Child of the Dust as a recurring formal epithet/address for the protagonist; aligned Japanese and Chinese corroborate the same referent. Standardize only this title to 먼지의 아이(Child of the Dust), correcting its vocative or subject allomorph where needed. Preserve the distinct, previously excluded lore:the-telling disposition at default:5311.',
        'english' => texts(source, 'en').join("\n"),
        'japanese' => texts(source, 'ja').join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => (old == new_text ? 'not-an-issue' : 'accepted')),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    raise 'duplicate title source key' unless reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    M.write_table(REVIEW_PATH, M::HEADERS, reviews)
    puts "Prepared #{reviews.length} rows: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

ChildOfDustD21041.run if $PROGRAM_NAME == __FILE__
