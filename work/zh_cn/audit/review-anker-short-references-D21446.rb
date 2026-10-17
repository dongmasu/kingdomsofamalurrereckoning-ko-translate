#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module AnkerShortReferencesD21446
  extend self

  M = ReviewedNameBatches
  D = 21_446
  ENTITY = 'person:anker-edmure'
  SHORT = 'Anker'
  KOREAN = '앵커'
  IDS = %w[6919 17204].freeze
  UNCERTAIN_IDS = %w[17204].freeze
  PATTERN = /앵커(?:\(Anker\))?/
  NOTE = "English default:11948/14834 identifies Anker Edmure as a scholar/researcher involved in Shardfall's mysteries; Japanese アンカー・エドミュア and Chinese 安科·艾德莫尔 corroborate. In default:6919, the English town-scholar context names Odwald and Anker, and Japanese オドワルドとアンカー / Chinese 奥德沃德和安科 corroborate the same named scholar. At default:17204 all locales contain only the isolated romanized label Anker, so its identity remains uncertain. Use row-scoped references only; do not add a global Anker alias."

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
    raise "exact row-scoped Anker coverage differs: #{actual.inspect}" unless
      actual.sort == expected.sort

    reviews = missing.sort_by { |row| row.fetch('ID_Linha').to_i }.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      if UNCERTAIN_IDS.include?(key[1])
        raise 'isolated Anker labels changed' unless
          english == SHORT && japanese == SHORT && chinese == SHORT && old == '앵커(Anker)'
        status = 'uncertain'
        new_text = old
        rationale = 'No surrounding identity context distinguishes this isolated Anker label; preserve its existing bilingual Korean text without linking it to Anker Edmure.'
      else
        raise 'town-scholar reference context changed' unless
          english.include?('town scholars') && english.include?('Odwald and Anker') &&
          japanese.include?('町の学者') && japanese.include?('オドワルドとアンカー') &&
          chinese.include?('城里的学者') && chinese.include?('奥德沃德和安科') &&
          old.include?('앵커(Anker)')
        status = 'not-an-issue'
        new_text = old
        rationale = 'The current Korean row already pairs the name, and its English town-scholar context aligns with the full-name scholar references; retain the cell unchanged.'
      end
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => "#{NOTE} #{rationale} All three active resources were searched. Existing terminal decisions on other entities and historical totals are preserved.",
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: #{reviews.length} row-scoped Anker references; no Texto edits; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
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
  when 'prepare' then AnkerShortReferencesD21446.prepare
  when 'apply' then AnkerShortReferencesD21446.apply
  else abort 'usage: review-anker-short-references-D21446.rb [prepare|apply]'
  end
end
