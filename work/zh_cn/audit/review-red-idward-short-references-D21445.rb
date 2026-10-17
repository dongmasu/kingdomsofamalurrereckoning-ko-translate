#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module RedIdwardShortReferencesD21445
  extend self

  M = ReviewedNameBatches
  D = 21_445
  ENTITY = 'person:red-idward'
  SHORT = 'Idward'
  KOREAN = '이드워드'
  IDS = %w[10413 16927 22830 34250].freeze
  PATTERN = /이드워드(?:\(Idward\))?/
  NOTE = 'English default:3913/40592 and default:24027/24099 already establish Red Idward as the Red Legion bandit captain and target. Japanese レッド・イドワード and Chinese 雷德·伊德瓦尔德 corroborate. The exact short references below are row-scoped to this person; do not add a global Idward alias or conflate the person with the Red Legion faction.'

  def transform(id, text)
    case id
    when '16927'
      raise 'complete nickname annotation changed' unless
        text.include?("이드워드(Red 'the Dead' Idward)")
      text
    when '34250'
      raise 'complete nickname span changed' unless text.include?('레드 ‘데드’ 이드워드')
      text.sub('레드 ‘데드’ 이드워드', '레드 ‘데드’ 이드워드(Red "the Dead" Idward)')
    else
      raise "missing Korean short name at #{id}" unless text.match?(PATTERN)
      text.gsub(PATTERN, "#{KOREAN}(#{SHORT})")
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    entry = glossary.find { |row| row['entity_key'] == ENTITY }
    raise "missing full-name entity #{ENTITY}" unless entry
    temporary = entry.to_h.merge(
      'english_aliases' => ([entry['english_aliases'].to_s.split('|'), [SHORT]].flatten - ['']).uniq.join('|')
    )
    generated = build_occurrences(inventory.values, [temporary]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    previous = index.to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    missing = generated.reject { |row| previous.key?([row['entity_key'], *M.key(row)]) }
    expected = IDS.map { |id| [ENTITY, 'default', id, ''] }
    actual = missing.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise "exact row-scoped Idward coverage differs: #{actual.inspect}" unless
      actual.sort == expected.sort

    reviews = missing.sort_by { |row| row.fetch('ID_Linha').to_i }.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      id = key[1]
      if id == '10413'
        raise 'isolated romanized-only Idward evidence changed' unless
          english == SHORT && japanese == SHORT && chinese == SHORT && old == '이드워드(Idward)'
        status = 'uncertain'
        new_text = old
        rationale = 'All aligned locales give only the isolated romanized name and no identity context; preserve the existing bilingual Korean cell without asserting a link to Red Idward.'
      else
        raise "Idward source identity context missing at #{id}" unless
          english.match?(/(?<![A-Za-z])Idward(?![A-Za-z])/i) &&
          japanese.match?(/イドワード|イドワルド/) &&
          chinese.match?(/伊德瓦尔德|雷德/)
        new_text = transform(id, old)
        status = new_text == old ? 'not-an-issue' : 'accepted'
        rationale = case id
                    when '16927', '34250'
                      'The full Red "the Dead" Idward nickname and bandit context identify the same established person; preserve the complete title and pair its exact English form.'
                    else
                      'The speaker describes Idward as the person who knows their location and may attack; aligned Japanese/Chinese and the knife-defense context identify the established bandit.'
                    end
      end
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => "#{NOTE} #{rationale} All three active resources were searched. Preserve existing terminal decisions on other entities and historical totals.",
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.reject { |row| row['old'] == row['new'] }.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
    end
    puts "D-#{D}: #{reviews.length} row-scoped Idward references; #{reviews.count { |row| row['old'] != row['new'] }} edits; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'entity_key', 'status', 'new'))
    end
    [glossary, index, missing, reviews]
  end

  def apply
    glossary, index, missing, reviews = prepare
    proposal = File.join(__dir__, "proper-name-short-references-D#{D}.tsv")
    original = File.join(__dir__, "proper-name-short-reference-original-definitions-D#{D}.tsv")
    raise 'prepared outputs exist' if [proposal, original].any? { |path| File.exist?(path) }
    M.write_table(original, glossary.headers,
      glossary.select { |row| row['entity_key'] == ENTITY }.map(&:to_h))
    M.write_table(proposal, M::HEADERS.take(12), reviews)
    updated_glossary = glossary.map(&:to_h).map do |row|
      next row unless row['entity_key'] == ENTITY
      row.merge(
        'notes' => "#{row['notes']} D-#{D}: #{NOTE}",
        'evidence_ids' => "#{row['evidence_ids']}|D-#{D}"
      )
    end
    M.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers, updated_glossary)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + missing)
    M.run(proposal, D, nil)
    final = M.table(M::INDEX).to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    index.each do |row|
      raise 'prior terminal evidence/status changed' unless
        row.to_h.reject { |field, _| field == 'korean_current' } ==
          final.fetch([row['entity_key'], *M.key(row)]).reject { |field, _| field == 'korean_current' }
    end
    raise 'short-name occurrence count differs' unless final.length == index.length + missing.length
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then RedIdwardShortReferencesD21445.prepare
  when 'apply' then RedIdwardShortReferencesD21445.apply
  else abort 'usage: review-red-idward-short-references-D21445.rb [prepare|apply]'
  end
end
