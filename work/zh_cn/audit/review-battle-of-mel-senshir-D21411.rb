#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module BattleOfMelSenshirD21411
  extend self

  M = ReviewedNameBatches
  ENTITY = 'event:battle-of-mel-senshir'
  ENGLISH = 'Battle of Mel Senshir'
  KOREAN = '멜 센시르 전투(Battle of Mel Senshir)'
  BATTLE_PATTERN = /(?<![A-Za-z])Battle of Mel Senshir(?![A-Za-z])/i
  KOREAN_PATTERN = /멜 센시르(?:\s*\(Mel Senshir\))?\s+전투(?:\s*\(Battle of Mel Senshir\))?/
  RESIDUAL_CANDIDATES = '/private/tmp/proper-name-candidates-residual-D21410.tsv'

  def paths
    [
      File.join(__dir__, "proper-name-discovery-definitions-D21411.tsv"),
      File.join(__dir__, "proper-name-discovery-D21411.tsv")
    ]
  end

  def definition(glossary)
    glossary.headers.to_h do |header|
      value = case header
              when 'entity_key' then ENTITY
              when 'english_canonical' then ENGLISH
              when 'category' then 'named event'
              when 'korean_canonical' then KOREAN
              when 'english_aliases' then ''
              when 'korean_variants'
                '멜 센시르(Mel Senshir) 전투|멜 센시르(Mel Senshir) 전투(Battle of Mel Senshir)|멜 센시르 전투'
              when 'evidence_ids'
                'D-21411|default:3893|default:5031|default:7093|default:8200|default:8638|default:10305|default:12847|default:12951|default:20879|default:23879|default:42871|default:51631|default:62741'
              when 'status' then 'confirmed'
              when 'notes'
                'English identifies the named Battle of Mel Senshir, distinct from the city Mel Senshir. Japanese メル・センシアの戦い and Chinese 梅尔森溪之战 corroborate the historical event. Use the complete label 멜 센시르 전투(Battle of Mel Senshir), avoiding nested city and event annotations. The official Korean manual has no direct entry for this battle name.'
              end
      [header, value]
    end
  end

  def residual_coverage!
    abort "missing residual candidate list: #{RESIDUAL_CANDIDATES}" unless
      File.file?(RESIDUAL_CANDIDATES)

    candidate = M.table(RESIDUAL_CANDIDATES).find do |row|
      row['candidate_key'] == 'candidate:senshir'
    end
    abort 'Senshir candidate is missing' unless candidate
    candidate_keys = candidate.fetch('source_context_keys').split('|')
    abort "expected 298 Senshir candidate keys, got #{candidate_keys.length}" unless
      candidate_keys.length == 298

    indexed = M.table(M::INDEX).select { |row| row['entity_key'] == 'place:mel-senshir' }
    indexed_keys = indexed.to_h { |row| [M.key(row).reject(&:empty?).join(':'), row] }
    missing = candidate_keys.reject do |key|
      row = indexed_keys[key]
      row && %w[accepted not-an-issue excluded uncertain].include?(row['status'])
    end
    abort "Senshir residual candidate has #{missing.length} uncovered/nonterminal keys" unless
      missing.empty?

    puts "Residual candidate Senshir: #{candidate_keys.length}/#{candidate_keys.length} keys already have terminal place:mel-senshir decisions; no row was reopened."
  end

  def prepare!
    residual_coverage!
    inventory = M.refresh_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    abort 'Battle of Mel Senshir entity already exists' if
      glossary.any? { |row| row['entity_key'] == ENTITY }
    abort 'Battle of Mel Senshir canonical already belongs to an entity' if
      glossary.any? do |row|
        ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
          .compact.any? { |term| term.casecmp?(ENGLISH) }
      end

    scoped = inventory.values.select do |row|
      JSON.parse(row.fetch('en_texts_json') || '[]').compact.any? do |text|
        text.match?(BATTLE_PATTERN)
      end
    end.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s]
    end
    raise "expected 13 distinct event rows, got #{scoped.length}" unless
      scoped.length == 13 &&
      scoped.map { |row| M.key(row) }.uniq.length == 13
    raise 'event rows are not all in default' unless
      scoped.all? { |row| row['resource'] == 'default' }

    reviews = scoped.map do |source|
      key = M.key(source)
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      hits = old.to_enum(:scan, KOREAN_PATTERN).map { Regexp.last_match.dup }
      raise "expected one Korean event span at #{key.inspect}, got #{hits.length}" unless
        hits.length == 1
      raise "missing aligned locale evidence at #{key.inspect}" if
        [english, japanese, chinese].any?(&:empty?)
      raise "English event mismatch at #{key.inspect}" unless
        english.match?(BATTLE_PATTERN)

      updated = old.sub(KOREAN_PATTERN, KOREAN)
      status = updated == old ? 'not-an-issue' : 'accepted'
      evidence = if status == 'accepted'
                   'English names the historical Battle of Mel Senshir, not only its city. Japanese メル・センシアの戦い and Chinese 梅尔森溪之战 corroborate the event. Render the complete named event as 멜 센시르 전투(Battle of Mel Senshir), replacing nested or incomplete city-only annotations; preserve particles and all surrounding text.'
                 else
                   'The complete named event 멜 센시르 전투(Battle of Mel Senshir) is already present. English, Japanese メル・センシアの戦い, and Chinese 梅尔森溪之战 identify the same event.'
                 end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => updated,
        'evidence' => evidence, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end

    definition_path, review_path = paths
    raise 'D-21411 preparation already exists' if paths.any? { |path| File.exist?(path) }
    M.write_table(definition_path, glossary.headers, [definition(glossary)])
    M.write_table(review_path, M::HEADERS.take(12), reviews)
    puts "Prepared D-21411: #{reviews.length} event rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}."
    puts "Reviewed row keys: #{reviews.map { |row| M.key(row).reject(&:empty?).join(':') }.join(', ')}"
  end

  def apply!
    definition_path, review_path = paths
    abort 'run prepare first; discovery TSVs are missing' unless paths.all? { |path| File.file?(path) }
    ReviewedProperNameDiscovery.run([definition_path, review_path, '21411'])
  end
end

case ARGV.fetch(0, 'prepare')
when 'prepare'
  BattleOfMelSenshirD21411.prepare!
when 'apply'
  BattleOfMelSenshirD21411.apply!
else
  abort 'usage: review-battle-of-mel-senshir-D21411.rb [prepare|apply]'
end
