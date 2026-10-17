#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module DeodShortReferencesD21455
  extend self
  M = ReviewedNameBatches
  D = 21_455
  ENTITY = 'person:deod-dungaras'
  IDS = %w[4754 6694 13401 15428 27976 28962].freeze
  HELD = %w[6694 13401 15428].freeze
  NOTE = 'D-21452 English full-name rows 24970/45089 identify Deod Dungaras as Ariel Perien\'s porter, taken by murghan while carrying her pack and later found dead with it. The separate docent is Deod Twillt (15083/57055). Compare only these source-local bare Deod references; do not add a global Deod alias. English is primary, with Japanese デオド and Chinese 迪欧德 corroboration. Preserve the independent carried-object antecedent hold at 28962 and all other entity/translation decisions.'

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    entry = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'porter full-name entry missing' unless entry
    temporary = entry.to_h.merge('english_aliases' => 'Deod')
    generated = build_occurrences(inventory.values, [temporary]).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    existing = index.to_h { |row| [[row['entity_key'], *M.key(row)], row] }
    missing = generated.reject { |row| existing.key?([row['entity_key'], *M.key(row)]) }
    other_person = missing.select do |row|
      JSON.parse(inventory.fetch(M.key(row)).fetch('en_texts_json')).compact.any? { |text| text.include?('Deod Twillt') }
    end
    raise 'docent exclusion scope differs' unless other_person.map { |row| M.key(row) }.sort ==
      [['default', '15083', ''], ['default', '57055', '']].sort
    missing -= other_person
    raise 'bare Deod source scope differs' unless missing.map { |row| M.key(row) }.sort ==
      IDS.map { |id| ['default', id, ''] }.sort
    reviews = missing.sort_by { |row| row['ID_Linha'].to_i }.map do |row|
      key = M.key(row)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      raise 'bare Deod cross-locale evidence differs' unless
        english.include?('Deod') && japanese.include?('デオド') && chinese.include?('迪欧德')
      if HELD.include?(key[1])
        status = 'uncertain'
        reason = 'The worker/pack reference is plausible but lacks an explicit speaker, quest or surname anchor. It does not conclusively distinguish the porter from another Deod. Preserve the existing Korean spelling and annotation, including 디오드 at 13401; do not guess an identity or edit.'
      else
        status = 'not-an-issue'
        raise 'porter short annotation differs' unless old.include?('데오드(Deod)')
        raise 'porter event context differs' unless english.match?(/(?:murghan grabbed him|snatched Deod|carrying it when he was captured)/)
        reason = 'The murghan snatching/capture event and carried object directly match the full-name porter narrative. This existing Korean short label is already paired and unchanged.'
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => old,
        'evidence' => "#{NOTE} #{reason}",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: six row-scoped candidates; three not-an-issue, three uncertain; no CSV edits"
    [glossary, index, missing, reviews]
  end

  def apply
    glossary, index, missing, reviews = prepare
    proposal = File.join(__dir__, "proper-name-short-references-D#{D}.tsv")
    original = File.join(__dir__, "proper-name-short-reference-original-definitions-D#{D}.tsv")
    raise 'prepared outputs exist' if [proposal, original].any? { |path| File.exist?(path) }
    M.write_table(original, glossary.headers, glossary.select { |row| row['entity_key'] == ENTITY }.map(&:to_h))
    M.write_table(proposal, M::HEADERS.take(12), reviews)
    updated = glossary.map(&:to_h).map do |row|
      next row unless row['entity_key'] == ENTITY
      row.merge('notes' => "#{row['notes']} D-#{D}: #{NOTE} Worker/pack-only rows 6694/13401/15428 remain identity holds, not confirmed aliases.",
                'evidence_ids' => "#{row['evidence_ids']}|D-#{D}")
    end
    M.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers, updated)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + missing)
    M.run(proposal, D, 1)
    final = M.table(M::INDEX).to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    index.each do |row|
      raise 'previous disposition/evidence changed' unless
        row.to_h.reject { |field, _| field == 'korean_current' } ==
          final.fetch([row['entity_key'], *M.key(row)]).reject { |field, _| field == 'korean_current' }
    end
    raise 'scoped Deod key count differs' unless final.length == index.length + 6
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then DeodShortReferencesD21455.prepare
  when 'apply' then DeodShortReferencesD21455.apply
  else abort 'usage: review-deod-short-references-D21455.rb [prepare|apply]'
  end
end
