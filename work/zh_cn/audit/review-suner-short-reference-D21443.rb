#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module SunerShortReferenceD21443
  extend self

  M = ReviewedNameBatches
  D = 21_443
  ENTITY = 'person:suner-pome'
  SHORT = 'Suner'
  KOREAN = '수너'
  IDS = %w[37596 40773].freeze
  PATTERN = /수너(?:\(Suner\))?/
  NOTE = 'The complete Suner Pome references at default:10464/49479 identify the same contractor across the Bursar context, and default:55407/59452 connect Suner Pome to the Bursar/Motus Mining context. English default:40773 calls Suner the gnome to speak with; Japanese サナー and Chinese 斯诺尔 align with the registered full name. Annotate only this context-supported short mention. At default:37596 English, Japanese and Chinese all contain only the isolated romanized label Suner, which is insufficient to establish that it is this person; keep its already bilingual Korean text unchanged and record an identity hold. Do not add a global Suner alias.'

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    entry = glossary.find { |row| row['entity_key'] == ENTITY }
    raise "missing full-name entity #{ENTITY}" unless entry
    companion = inventory.fetch(['default', '55407', ''])
    companion_english = JSON.parse(companion.fetch('en_texts_json')).compact.join("\n")
    companion_japanese = JSON.parse(companion.fetch('ja_texts_json')).compact.join("\n")
    raise 'registered full-name companion context changed' unless
      companion_english.include?('Suner Pome') &&
      companion_english.include?("Bursar's") &&
      companion_english.include?('Motus Mining') &&
      companion_japanese.include?('サナー・ポウム') &&
      companion.fetch('zh_text').include?('斯诺尔·波姆')
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
    raise "exact row-scoped Suner coverage differs: #{actual.inspect}" unless
      actual.sort == expected.sort
    raise 'a Suner key was already registered' unless missing.length == IDS.length

    reviews = missing.sort_by { |row| row.fetch('ID_Linha').to_i }.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      if key[1] == '37596'
        raise 'isolated romanized-only evidence changed' unless
          english == SHORT && japanese == SHORT && chinese == SHORT && old == '수너(Suner)'
        status = 'uncertain'
        new_text = old
        rationale = 'The isolated English/Japanese/Chinese name gives no context to prove identity with Suner Pome; retain the existing bilingual Korean label without inferring a person link.'
      else
        raise 'Suner gnome context changed' unless
          english.include?('Suner is the gnome') &&
          japanese.include?('サナー') &&
          chinese.include?('侏儒') && chinese.include?('斯诺尔')
        raise 'Korean short name missing' unless old.match?(PATTERN)
        new_text = old.gsub(PATTERN, "#{KOREAN}(#{SHORT})")
        status = new_text == old ? 'not-an-issue' : 'accepted'
        rationale = 'English identifies Suner as the gnome in the Bursar office; the Japanese and Chinese context agrees. Cross-row Bursar/Motus Mining dialogue links this to the already registered Suner Pome.'
      end
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => "#{NOTE} #{rationale} Scope is row-specific across all three resources; existing terminal decisions and historical global totals are preserved.",
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.reject { |row| row['old'] == row['new'] }.each do |row|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(row['resource'])), [row])
    end
    puts "D-#{D}: #{reviews.length} row-scoped short-name keys; #{reviews.count { |row| row['old'] != row['new'] }} edits; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
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
  when 'prepare' then SunerShortReferenceD21443.prepare
  when 'apply' then SunerShortReferenceD21443.apply
  else abort 'usage: review-suner-short-reference-D21443.rb [prepare|apply]'
  end
end
