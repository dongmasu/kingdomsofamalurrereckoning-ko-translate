#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module OchdranSunerD21440
  extend self

  M = ReviewedNameBatches
  D = 21_440
  ITEMS = [
    {
      entity: 'person:ochdran-fall', english: 'Ochdran Fall', korean: '오크드란 폴',
      ids: %w[17579 44254], ja: 'オクドラン・フォール', zh: '欧克德兰·法勒',
      note: 'English default:44254 explicitly identifies Ochdran Fall as the keep\'s quartermaster, distinguished from blacksmith Fiona Terane in the same sentence. Japanese オクドラン・フォール and Chinese 欧克德兰·法勒 corroborate. Reuse the already bilingual label at 17579 and annotate only the missing full name at 44254; preserve Fiona\'s existing accepted disposition and annotation. Do not add global Ochdran or Fall aliases.'
    },
    {
      entity: 'person:suner-pome', english: 'Suner Pome', korean: '수너 폼',
      ids: %w[10464 10866 18448 38642 49479 53346 55407 59452],
      ja: 'サナー・ポウム', zh: '斯诺尔·波姆',
      note: 'English 10464/10866/49479 identifies Suner Pome as the Sandstone Villa upgrade contractor; 38642/55407/59452 direct Bursar business to the same complete name. Japanese サナー・ポウム and Chinese 斯诺尔·波姆 corroborate. Every complete Korean label is already 수너 폼(Suner Pome), including both mentions at 10464, and stays unchanged. No global Suner or Pome alias is added; short 40773 has relevant Bursar context but is outside this full-name batch, and isolated 37596 is not inferred from romanized labels alone.'
    }
  ].freeze

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    definitions = ITEMS.map do |item|
      fields = {
        'entity_key' => item.fetch(:entity), 'english_canonical' => item.fetch(:english),
        'category' => 'person', 'english_aliases' => '',
        'korean_canonical' => "#{item.fetch(:korean)}(#{item.fetch(:english)})",
        'korean_variants' => item.fetch(:korean), 'status' => 'confirmed',
        'evidence_ids' => "D-#{D}", 'notes' => item.fetch(:note)
      }
      glossary.headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    expected = ITEMS.flat_map { |item| item.fetch(:ids).map { |id| [item.fetch(:entity), 'default', id, ''] } }
    raise 'exact full-name source scope differs' unless
      generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort == expected.sort
    reviews = generated.sort_by { |row| row.fetch('ID_Linha').to_i }.map do |occurrence|
      item = ITEMS.find { |config| config.fetch(:entity) == occurrence.fetch('entity_key') }
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "aligned name differs #{key.inspect}" unless
        japanese.include?(item.fetch(:ja)) && chinese.include?(item.fetch(:zh))
      old = source.fetch('work_text')
      paired = "#{item.fetch(:korean)}(#{item.fetch(:english)})"
      pattern = /#{Regexp.escape(item.fetch(:korean))}(?:\(#{Regexp.escape(item.fetch(:english))}\))?/
      raise "Korean name missing #{key.inspect}" unless old.match?(pattern)
      new_text = old.gsub(pattern, paired)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => item.fetch(:entity), 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => "#{item.fetch(:note)} English anchors identity, with aligned Japanese/Chinese corroboration. All three resources searched. Official-manual quest/dialogue context is background, not direct name spelling evidence. Preserve unrelated labels, tokens, line breaks and historical translation counts.",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(item.fetch(:entity) => status)
      }
    end
    ReviewedProperNameDiscovery.validate!(definitions, reviews, generated,
      glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h))
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    targets = reviews.reject { |row| row['old'] == row['new'] }
    raise 'unexpected edit scope' unless targets.map { |row| M.key(row) } == [['default', '44254', '']]
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), targets)
    puts "D-#{D}: two full names; ten keys; one missing-name annotation"
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'entity_key', 'status', 'new')) }
    [definitions, reviews]
  end

  def apply
    definitions, reviews = prepare
    definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
    review_path = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
    raise 'prepared outputs exist' if [definition_path, review_path].any? { |path| File.exist?(path) }
    M.write_table(definition_path, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, definitions)
    M.write_table(review_path, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([definition_path, review_path, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then OchdranSunerD21440.prepare
  when 'apply' then OchdranSunerD21440.apply
  else abort 'usage: review-ochdran-suner-D21440.rb [prepare|apply]'
  end
end
