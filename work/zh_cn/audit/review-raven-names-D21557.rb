#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module RavenNamesD21557
  extend self
  M = ReviewedNameBatches
  D = 21_557
  INN = 'place:the-raven-inn'
  GUARD = 'organization:raven-guard'
  TEAM = 'faction:the-ravens-arena-team'
  AEGIS = 'title:ravens-aegis'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  INN_IDS = %w[4526 15520 31149 39521 52850 53908].freeze
  BIRD_IDS = %w[42882 61222].freeze
  INN_SPAN = /(?:큰까마귀 여관|까마귀 여관|레이븐 여관|레이븐)(?: ?\((?:The )?Raven\))?/
  TEAM_SPAN = /까마귀들(?:\(The Ravens\))?/
  NOTE = 'English default:39521 explicitly identifies The Raven as an inn near Rathir, while default:31149/52850/53908 identify it as the meeting/stay/recuperation venue. Japanese 大がらす亭 and Chinese 渡鸦旅馆 corroborate. Reuse the already paired base:4644 큰까마귀 여관(The Raven), removing its extra space and normalizing only the same inn’s 까마귀 여관/레이븐 여관/레이븐 variants. Keep The Raven as the complete name; no global Raven alias, animal-name translation or identity with the team/unit/equipment label is inferred.'
  OTHER_NOTE = 'English default:3974 explicitly names Rathir’s Raven Guard, corroborated by Japanese レイヴン・ガード and Chinese 乌鸦守卫; retain 까마귀 경비대(Raven Guard). Default:18198 is an arena wagering roster explicitly opposing The Vipers and The Ravens; Japanese レイヴンズ and Chinese 渡鸦 corroborate the team, not inn or animals. Retain 까마귀들(The Ravens) and pair its second explicit team mention without changing any wagers or roster names. Default:1811 is the complete Raven’s Aegis label, already paired as 까마귀의 아이기스(Raven’s Aegis); Japanese レイヴンの盾 and Chinese 乌鸦的庇护 corroborate the label, but an isolated title does not establish a helmet, item slot or ability type. Register it as a title without inventing mechanics.'
  COMMON = 'English is the identity and meaning anchor; Japanese and Chinese are supporting aligned references. The official Korean manual has no direct entry for these names. Preserve every unrelated entity disposition, token, number and line break. No PAK/PAK-derived inspection, source edit or historical global tally recount.'
  DETAIL = <<~TEXT.chomp
    ### D-21557: The Raven And Distinct Raven Names

    Reviewed 12 distinct row/entity keys across base/default, with no affix
    matches. The seven inn references are normalized to the existing
    base spelling `큰까마귀 여관(The Raven)`, supported by English's inn
    description and Japanese 大がらす亭 / Chinese 渡鸦旅馆.
    No global Raven alias is introduced.

    Registered `Raven Guard`, the `The Ravens` arena team and the isolated
    complete `Raven's Aegis` title independently, without merging their
    identities or inferring equipment mechanics. The already paired guard
    and Aegis cells are unchanged. In the wagering roster, paired the
    second explicit `The Ravens` mention while retaining every number,
    roster name and prior entity decision. The two poems containing
    lowercase `the ravens` are lexical matches but explicitly excluded
    from the arena-team identity; ordinary bird imagery remains unchanged.
    Full proper-name discovery remains incomplete.
  TEXT

  def definitions(headers)
    [
      [INN, 'The Raven', '큰까마귀 여관(The Raven)', 'place', '큰까마귀 여관|까마귀 여관|레이븐 여관|레이븐', NOTE],
      [GUARD, 'Raven Guard', '까마귀 경비대(Raven Guard)', 'organization', '까마귀 경비대', OTHER_NOTE],
      [TEAM, 'The Ravens', '까마귀들(The Ravens)', 'faction', '까마귀들', OTHER_NOTE],
      [AEGIS, "Raven's Aegis", "까마귀의 아이기스(Raven's Aegis)", 'title', '까마귀의 아이기스', OTHER_NOTE]
    ].map do |entity, english, korean, category, variants, note|
      values = {
        'entity_key' => entity, 'english_canonical' => english,
        'korean_canonical' => korean, 'category' => category,
        'english_aliases' => '', 'korean_variants' => variants,
        'evidence_ids' => "D-#{D}", 'status' => 'confirmed',
        'notes' => "#{note} #{COMMON}"
      }
      headers.to_h { |header| [header, values.fetch(header, '')] }
    end
  end

  def expected_pairs
    [
      [INN, 'base', '4644', '11'],
      *INN_IDS.map { |id| [INN, 'default', id, ''] },
      [GUARD, 'default', '3974', ''],
      [TEAM, 'default', '18198', ''],
      *BIRD_IDS.map { |id| [TEAM, 'default', id, ''] },
      [AEGIS, 'default', '1811', '']
    ]
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    definitions = definitions(glossary.headers)
    inventory = M.table(M::INVENTORY).map(&:to_h).to_h { |row| [M.key(row), row] }
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'Raven full-name source scope differs' unless
      generated.map { |row| [row['entity_key'], *M.key(row)] }.sort == expected_pairs.sort
    rows = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      entity = occurrence['entity_key']
      old = source.fetch('work_text')
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      new_text = case entity
                 when INN
                   raise "Raven inn Korean span differs #{key.inspect}" unless old.scan(INN_SPAN).length == 1
                   old.sub(INN_SPAN, '큰까마귀 여관(The Raven)')
                 when TEAM
                   if BIRD_IDS.include?(key[1])
                     raise 'Ravens generic poem context differs' unless english.include?('Food the ravens meant to eat?')
                     old
                   else
                     raise 'Ravens roster name counts differ' unless old.scan(TEAM_SPAN).length == 2 &&
                       english.scan('The Ravens').length == 2
                     old.gsub(TEAM_SPAN, '까마귀들(The Ravens)')
                   end
                 else
                   pair = definitions.find { |row| row['entity_key'] == entity }.fetch('korean_canonical')
                   raise 'existing Raven full label differs' unless old.include?(pair)
                   old
                 end
      status = entity == TEAM && BIRD_IDS.include?(key[1]) ? 'excluded' :
        old == new_text ? 'not-an-issue' : 'accepted'
      note = entity == INN ? NOTE : OTHER_NOTE
      note += ' Exact poem exception: lowercase Food the ravens meant to eat describes ordinary carrion birds, corroborated by Japanese カラス and Chinese 乌鸦. Exclude it from the arena-team identity and retain the entire poem.' if entity == TEAM && BIRD_IDS.include?(key[1])
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => "#{note} #{COMMON}",
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
    ReviewedProperNameDiscovery.validate!(
      definitions, rows, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(rows, inventory)
    puts "D-#{D}: #{rows.length} keys; #{rows.count { |row| row['old'] != row['new'] }} edits; prepare only."
    [glossary.headers, definitions, rows]
  end

  def apply
    headers, definitions, rows = prepare
    prior = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row['entity_key'], *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), rows)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row['entity_key'], *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    prior.each { |key, value| raise "prior Raven-row decision changed #{key.inspect}" unless current[key] == value }
    raise 'unexpected Raven index additions' unless (current.keys - prior.keys).sort == expected_pairs.sort
    paths = M::DOCS + %w[review edit-addendum].map do |kind|
      File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    end
    paths.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      if text.include?(marker)
        File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
      else
        File.open(path, 'a') { |file| file.write("\n\n#{DETAIL}\n") }
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then RavenNamesD21557.prepare
  when ['apply'] then RavenNamesD21557.apply
  else abort 'usage: review-raven-names-D21557.rb [prepare|apply]'
  end
end
