#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module OhnShortResidualD21428
  extend self

  M = ReviewedNameBatches
  D = 21_428
  ENTITY = 'person:lord-ohn'
  REVIEW = File.join(__dir__, "proper-name-short-residual-D#{D}.tsv")
  PERSON_IDS = %w[1833 4017 6347 11199 12219 15325 16719 19842 27627 29102 31067 33022 37830 38513 39682 39910 46334 47094 57013 61204 61844 62520 64348].freeze
  HOLD_IDS = %w[1529 29705].freeze
  ITEM_IDS = %w[32259 13403 31207 57863 46245 62670].freeze
  PLACE_IDS = %w[3488 10966 16271 20618 22517 27351 32100 33838 37633 46730 56841 57987].freeze
  BASE_IDS = %w[1923 3115 4132].freeze
  NAME = /(?<![가-힣])(?:오른|오언|오운)(?:\(Ohn\))?|(?<![가-힣])온(?:\(Ohn\)|(?=(?:은|이|을|과|의|에|으)))/.freeze
  NOTE = 'D-21428: Row-scoped short Ohn residual review under the existing person:lord-ohn. English historical Winter/Summer ruler, war, and paired Ysa/Ohn ballads identify the Winter figure; Japanese オーン and Chinese 欧恩 corroborate. Normalize only explicit personal-name spans to the established 오운(Ohn), preserving local ranks, particles, ordinary 온 in 온 대륙/적대해 온, and every unrelated approved phrase. No global Ohn alias, duplicate person, or historical translation recount is added.'

  def normalize(text, english)
    expected = english.scan(/\bOhn\b/).length
    actual = text.scan(NAME).length
    raise "Ohn source/Korean name count differs #{expected}/#{actual}" unless expected.positive? && expected == actual

    text.gsub(NAME, '오운(Ohn)')
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'prepared review already exists' if File.exist?(REVIEW)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    entity = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'existing Ohn person definition changed' unless entity &&
      entity['english_canonical'] == 'Lord Ohn' &&
      entity['korean_canonical'] == '오운 경(Lord Ohn)' &&
      entity['english_aliases'].to_s.empty?
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values,
                                  [entity.to_h.merge('english_aliases' => 'Ohn')]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    index = M.table(M::INDEX)
    existing = index.to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    raise 'duplicate existing occurrence key' unless existing.length == index.length
    old_keys = generated.select { |row| existing.key?([ENTITY, *M.key(row)]) }
    raise 'Ohn total/existing source scope differs' unless generated.length == 61 && old_keys.length == 15
    raise 'existing Ohn key not terminal' if old_keys.any? do |row|
      existing.fetch([ENTITY, *M.key(row)])['status'] == 'needs-context'
    end
    missing = generated.reject { |row| existing.key?([ENTITY, *M.key(row)]) }
    expected = (PERSON_IDS + HOLD_IDS + ITEM_IDS + PLACE_IDS).map { |id| ['default', id, ''] } +
      BASE_IDS.map { |id| ['base', id, '11'] }
    raise 'Ohn residual scope differs' unless missing.map { |row| M.key(row) }.sort == expected.sort &&
      expected.length == 46
    reviews = missing.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "missing Ohn source evidence #{key.inspect}" if [english, japanese, chinese].any?(&:empty?)
      old = source.fetch('work_text')
      person = key[0] == 'default' && PERSON_IDS.include?(key[1])
      held = key[0] == 'default' && HOLD_IDS.include?(key[1])
      proposed = person ? normalize(old, english) : old
      status = held ? 'uncertain' : !person ? 'excluded' : old == proposed ? 'not-an-issue' : 'accepted'
      evidence = NOTE
      evidence += if key[1] == '1529'
                    ' The isolated Ohn label in all three source locales does not establish this specific person. Preserve it and hold identity; do not infer a global alias.'
                  elsif key[1] == '29705'
                    " Preserve the complete event-like Ohn's Last Stand phrase in this weapon description (Japanese オーンの防衛戦, Chinese 欧恩的背水一战). Its identity is not resolved as a bare personal-name occurrence; defer the separate complete-title scope."
                  elsif !person
                    ' This is a complete item label, an item description, Ohn’s Stand or Caer Ohn place scope. Exclude from the bare-person normalization and preserve the existing complete annotations and dispositions.'
                  else
                    ' English and aligned Japanese/Chinese establish the historical personal reference in this exact row. Annotate every explicit translated personal name; never expand the rank to Lord when the English uses only Ohn.'
                  end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => evidence, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese, 'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "Prepared D-#{D}: 46 new scoped keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}."
    reviews.select { |row| row['old'] != row['new'] }.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'old', 'new'))
    end
    [index, missing, reviews]
  end

  def apply
    index, missing, reviews = prepare
    original_glossary = File.binread(File.join(__dir__, 'proper-name-glossary.tsv'))
    M.write_table(REVIEW, M::HEADERS.take(12), reviews)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + missing)
    M.run(REVIEW, D, nil)
    final = M.table(M::INDEX).to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    projection = ->(row) { row.to_h.reject { |field, _| field == 'korean_current' } }
    index.each do |row|
      raise 'prior occurrence disposition/evidence changed' unless
        projection.call(row) == projection.call(final.fetch([row['entity_key'], *M.key(row)]))
    end
    raise 'Ohn occurrence count differs' unless final.length == index.length + 46
    raise 'glossary/global alias changed' unless
      File.binread(File.join(__dir__, 'proper-name-glossary.tsv')) == original_glossary
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then OhnShortResidualD21428.prepare
  when 'apply' then OhnShortResidualD21428.apply
  else abort 'usage: review-ohn-short-residual-D21428.rb [prepare|apply]'
  end
end
