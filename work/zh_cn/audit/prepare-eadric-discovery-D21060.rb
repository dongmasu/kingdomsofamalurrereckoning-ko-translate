#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module EadricDiscoveryD21060
  M = ReviewedNameBatches
  ENTITY = 'person:st-eadric'
  DEFINITIONS = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21060.tsv')
  REVIEWS = File.join(M::AUDIT, 'proper-name-discovery-D21060.tsv')
  NAME = /(?<title>성자 |세인트 |성 )?(?<name>에이드릭|에드릭|이드릭)(?<label>\([^()\r\n]*Eadric[^()\r\n]*\))?/
  COMPOUND = /\A(?:의)? (?:영구 |상설 )?(?:관 덮개|수의|선교원|선교회|선교소|우물|기도)(\([^()\r\n]*Eadric[^()\r\n]*\))/

  module_function

  def definition
    {
      'entity_key' => ENTITY, 'english_canonical' => 'Eadric',
      'category' => 'person', 'korean_canonical' => '이드릭(Eadric)',
      'english_aliases' => 'St. Eadric|Saint Eadric',
      'korean_variants' => '에드릭|에이드릭|이드릭|세인트 에드릭|세인트 에이드릭',
      'evidence_ids' => 'D-21060-D-21061|base:1825|default:6845|default:42205|default:62500',
      'status' => 'confirmed',
      'notes' => 'English identifies the holy man whose remains, teachings, burial pall and named mission are described. Japanese consistently uses イードリック for the same saint (occasionally エアドリック in the mission list); Chinese 艾德里克 corroborates identity. Reuse the existing 이드릭 spelling, including base:1825 and many saint/mission rows, rather than asserting an official pronunciation. St. and Saint are title aliases; bare Eadric stays bare. This scope normalizes the eponymic personal-name component in mission, object and book titles, without conflating the institutions or objects with a person. Existing complete English compound labels and all surrounding institutional/item wording are preserved for their own future terminology scopes.'
    }
  end

  def edit_name(text, english)
    text.gsub(NAME) do
      match = Regexp.last_match
      korean = match[:title] ? '성 이드릭' : '이드릭'
      if match[:label]
        korean + match[:label]
      elsif match.post_match.match?(COMPOUND)
        korean
      else
        local_english = if match[:title] && english.include?('Saint Eadric')
                          'Saint Eadric'
                        elsif match[:title] && english.include?('St. Eadric')
                          'St. Eadric'
                        else
                          'Eadric'
                        end
        "#{korean}(#{local_english})"
      end
    end
  end

  def run
    defs = [definition]
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, defs).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = generated.sort_by do |row|
      [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
    end.map do |row|
      source = inventory.fetch(M.key(row))
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      raise "unrecognized Eadric Korean #{M.key(row).inspect}" unless old.match?(NAME)
      new_text = edit_name(old, english)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => row['resource'], 'ID_Linha' => row['ID_Linha'],
        'Tipo_Variante' => row['Tipo_Variante'], 'entity_key' => ENTITY,
        'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => "D-21060-D-21061 English-led eponymic personal-name review. #{definition.fetch('notes')} Exact aligned Japanese and Chinese are recorded for this row. Official manual PDF pages 1-2 supply Almain and Mitharu setting context but no saint-name roster. The Tine hold at default:10279 is a different entity scope and is not reopened; only Eadric is normalized.",
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    ReviewedProperNameDiscovery.validate!(defs, reviews, generated, glossary.map(&:to_h), index.map(&:to_h))
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    M.write_table(DEFINITIONS, glossary.headers, defs)
    M.write_table(REVIEWS, M::HEADERS, reviews)
    puts "Prepared #{reviews.length} Eadric rows: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

EadricDiscoveryD21060.run if $PROGRAM_NAME == __FILE__
