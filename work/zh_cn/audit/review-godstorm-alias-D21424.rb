#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module GodstormAliasD21424
  extend self

  M = ReviewedNameBatches
  D = 21_424
  ENTITY = 'event:god-storm'
  GLOSSARY = File.join(__dir__, 'proper-name-glossary.tsv')
  REVIEW = File.join(__dir__, "proper-name-alias-review-D#{D}.tsv")
  DEFINITION = File.join(__dir__, "proper-name-alias-definition-D#{D}.tsv")
  PROOF = File.join(__dir__, "proper-name-alias-registration-D#{D}.json")
  IDS = %w[6347 16113 17816 18527 30725 37830 50060 57678 63879 63892].freeze
  CANONICAL = '신의 폭풍(Godstorm)'
  NOTE = 'D-21424: Godstorm is the closed compound spelling of the existing God Storm event, not a second entity. English default:50060 calls Godstorm the Fae battle called Withering War; default:61425 explicitly says God Storm, or Withering War. Japanese 神の嵐/ゴッドストーム and Chinese 神之风暴 corroborate the same event. These remain separate English title entries, not distinct historical events; this corrects only the misleading distinct wording in the D-21197 glossary notes. Retain existing 신의 폭풍, annotate the source-local spelling Godstorm, and do not reopen any prior God Storm or Withering War occurrence.'

  def normalize(text)
    text.gsub(/(?:신들의 폭풍|신의 폭풍|고드스톰)(?:\(Godstorm\))?/i, CANONICAL)
  end

  def restore_return_subject(text, english)
    from = "#{CANONICAL}이 돌아오길 기다리고 있어."
    to = "#{CANONICAL}이 내가 돌아오길 기다리고 있어."
    raise 'return-direction clause differs' unless text.scan(from).length == 1 &&
      english.include?('The Godstorm awaits my return.')

    text.sub(from, to)
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'alias output already exists' if [REVIEW, DEFINITION, PROOF].any? { |path| File.exist?(path) }
    glossary = M.table(GLOSSARY)
    original = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'existing event definition changed' unless original &&
      original['english_canonical'] == 'God Storm' &&
      original['korean_canonical'] == '신의 폭풍(God Storm)' &&
      original['english_aliases'] == 'The God Storm'
    raise 'Godstorm owned elsewhere' if glossary.any? do |row|
      [row['english_canonical'], *row['english_aliases'].to_s.split('|')].any? { |term| term.casecmp?('Godstorm') }
    end
    entity = original.to_h.merge(
      'english_aliases' => 'The God Storm|Godstorm',
      'korean_variants' => (original['korean_variants'].to_s.split('|') +
        ['신들의 폭풍', '고드스톰']).uniq.join('|'),
      'evidence_ids' => original['evidence_ids'] + '|D-21424|default:50060',
      'notes' => original['notes'].sub('the distinct and separately registered Withering War',
                                      'the separately registered Withering War title') + ' ' + NOTE
    )
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    existing = index.to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    generated = build_occurrences(inventory.values, [entity]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    missing = generated.reject { |row| existing.key?([ENTITY, *M.key(row)]) }
    raise 'alias source scope differs' unless missing.length == IDS.length &&
      missing.map { |row| row['ID_Linha'] }.sort == IDS.sort &&
      missing.all? { |row| row['resource'] == 'default' && row['Tipo_Variante'].to_s.empty? }
    reviews = missing.sort_by { |row| row['ID_Linha'].to_i }.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "missing source evidence #{key.inspect}" if [english, japanese, chinese].any?(&:empty?)
      raise "source spelling differs #{key.inspect}" unless english.match?(/\bGodstorm\b/)
      proposed = normalize(old)
      evidence = NOTE
      if key[1] == '63892'
        proposed = restore_return_subject(proposed, english)
        evidence += ' At default:63892 also restore the explicit English my in awaits my return, corroborated by Japanese 私の帰り and Chinese 我归返; the event awaits the speaker, not vice versa. Preserve its personification without inventing a person or creature.'
      end
      raise "Korean span absent #{key.inspect}" unless proposed.include?(CANONICAL)
      status = old == proposed ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => evidence, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese, 'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)),
                                  rows.select { |row| row['old'] != row['new'] })
    end
    puts "Prepared D-#{D}: #{reviews.length} new alias keys; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} Texto edits; no new entity."
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'old', 'new')) }
    [glossary, index, original.to_h, entity, missing, reviews]
  end

  def apply
    glossary, index, original, entity, missing, reviews = prepare
    initial_hashes = M.hashes
    initial_index = File.binread(M::INDEX)
    initial_glossary = File.binread(GLOSSARY)
    M.write_table(REVIEW, M::HEADERS, reviews)
    M.write_table(DEFINITION, glossary.headers, [entity])
    raise 'active CSV changed during preflight' unless initial_hashes == M.hashes
    M.write_table(GLOSSARY, glossary.headers,
                  glossary.map { |row| row['entity_key'] == ENTITY ? entity : row.to_h })
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + missing)
    M.run(REVIEW, D, nil)
    final = M.table(M::INDEX).to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    projection = ->(row) { row.to_h.reject { |field, _| field == 'korean_current' } }
    index.each do |row|
      raise 'prior entity disposition/evidence changed' unless
        projection.call(row) == projection.call(final.fetch([row['entity_key'], *M.key(row)]))
    end
    raise 'duplicate/missing new alias key' unless final.length == index.length + missing.length
    raise 'unrelated glossary change' unless M.table(GLOSSARY).map(&:to_h) ==
      glossary.map { |row| row['entity_key'] == ENTITY ? entity : row.to_h }
    M.write_table(PROOF.sub(/\.json\z/, '.tsv'), glossary.headers, [original])
    File.write(PROOF, JSON.pretty_generate(
      'batch' => D, 'new_entities' => 0, 'new_occurrences' => missing.length,
      'original_entity' => original, 'updated_entity' => entity,
      'initial_index_sha256' => Digest::SHA256.hexdigest(initial_index),
      'initial_glossary_sha256' => Digest::SHA256.hexdigest(initial_glossary),
      'verified' => 'Every prior occurrence disposition and evidence preserved; exactly ten new alias keys.'
    ) + "\n")
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then GodstormAliasD21424.prepare
  when 'apply' then GodstormAliasD21424.apply
  else abort 'usage: review-godstorm-alias-D21424.rb [prepare|apply]'
  end
end
