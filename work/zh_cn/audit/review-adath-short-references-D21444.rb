#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module AdathShortReferencesD21444
  extend self

  M = ReviewedNameBatches
  D = 21_444
  ENTITY = 'person:adath-skoria'
  SHORT = 'Adath'
  KOREAN = '아다스'
  IDS = %w[10048 3583 3743 22304 27009 27182 50812 51111 63335 64282 64622].freeze
  UNCERTAIN_IDS = %w[10048].freeze
  PATTERN = /아다스(?:\(Adath\))?/
  NOTE = 'English names Adath, whose confirmed full identity is Adath Skoria, the Whitestone mining-family leader; the entity already has independent aligned full-name evidence for Japanese アダス・スコーリア and Chinese 阿达斯·斯考瑞亚. Reuse the established Korean stem 아다스 and scope the short form to individually reviewed source rows; do not add a global Adath alias or reopen older translation judgments.'

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
    raise "exact row-scoped Adath coverage differs: #{actual.inspect}" unless
      actual.sort == expected.sort

    reviews = missing.sort_by { |row| row.fetch('ID_Linha').to_i }.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      if UNCERTAIN_IDS.include?(key[1])
        raise 'isolated source labels changed' unless
          english == SHORT && japanese == SHORT && chinese == SHORT && old == '아다스(Adath)'
        status = 'uncertain'
        new_text = old
        rationale = 'All aligned locales provide only the isolated romanized name and no identity context. Retain the already bilingual Korean cell without inferring that this key is Adath Skoria.'
      else
        case key[1]
        when '3583'
          raise 'family-mines context differs' unless
            english.include?('Adath laid it out for you') &&
            japanese.include?('アダスに') && chinese.include?('阿达斯')
        when '3743'
          raise 'Whitestone aftermath context differs' unless
            english.include?('killed old Adath') &&
            japanese.include?('アダスを殺') && chinese.include?('老阿达斯')
        when '27009'
          raise 'ring possession context differs' unless
            english == "I have Adath's ring." &&
            japanese.include?('アダスの指輪') && chinese.include?('阿达斯的戒指')
        else
          raise "aligned Adath context missing #{key.inspect}" unless
            english.match?(/(?<![A-Za-z])Adath(?![A-Za-z])/i) &&
            japanese.include?('アダス') && chinese.include?('阿达斯')
        end
        raise "Korean name missing #{key.inspect}" unless old.match?(PATTERN)
        new_text = old.gsub(PATTERN, "#{KOREAN}(#{SHORT})")
        status = new_text == old ? 'not-an-issue' : 'accepted'
        rationale = 'The English-led surrounding quest/mining context and aligned Japanese/Chinese identify the same Adath; reuse the established short Korean form and pair only the missing source-name spans.'
      end
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => "#{NOTE} #{rationale} All three active resources were searched. Existing full-name keys and other terminal entities on shared rows are unchanged; no historic translation total is recounted.",
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
    puts "D-#{D}: #{reviews.length} row-scoped Adath references; #{reviews.count { |row| row['old'] != row['new'] }} edits; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
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
  when 'prepare' then AdathShortReferencesD21444.prepare
  when 'apply' then AdathShortReferencesD21444.apply
  else abort 'usage: review-adath-short-references-D21444.rb [prepare|apply]'
  end
end
