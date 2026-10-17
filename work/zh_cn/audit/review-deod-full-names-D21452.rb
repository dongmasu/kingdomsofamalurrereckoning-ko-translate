#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module DeodFullNamesD21452
  extend self

  M = ReviewedNameBatches
  D = 21_452
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CANONICAL_DUNGARAS = '데오드 둥가라스(Deod Dungaras)'
  CANONICAL_TWILLT = '데오드 트윌트(Deod Twillt)'
  ENTITIES = [
    {
      entity: 'person:deod-dungaras',
      english: 'Deod Dungaras',
      korean: CANONICAL_DUNGARAS,
      variants: '데오드 둥가라스|데오드 둔가라스',
      note: 'English identifies Deod Dungaras as Ariel Perien’s hired porter, later captured and found dead with her pack. Japanese デオド・ダンガラス and Chinese 迪欧德·顿格拉斯 corroborate the full name. Use the prevailing Korean surname 둥가라스 and correct only the exact reviewed name span. This porter is not the separately named docent Deod Twillt; no surname alias or short-name disposition is inferred.',
      rows: [
        {
          id: '24970', english_anchor: 'Deod Dungaras',
          japanese_anchor: 'デオド・ダンガラス',
          chinese_anchor: '迪欧德·顿格拉斯',
          old_span: '데오드 둥가라스', new_span: CANONICAL_DUNGARAS
        },
        {
          id: '28732', english_anchor: 'Deod Dungaras',
          japanese_anchor: 'デオド・ダンガラス',
          chinese_anchor: '迪欧德·顿格拉斯',
          old_span: '데오드 둔가라스(Deod Dungaras)',
          new_span: CANONICAL_DUNGARAS
        },
        {
          id: '40060', english_anchor: 'Deod Dungaras',
          japanese_anchor: 'デオド・ダンガラス',
          chinese_anchor: '迪欧德·顿格拉斯',
          old_span: '데오드 둥가라스', new_span: CANONICAL_DUNGARAS
        },
        {
          id: '45089', english_anchor: 'Deod Dungaras',
          japanese_anchor: 'デオド・ダンガラス',
          chinese_anchor: '迪欧德·顿格拉斯',
          old_span: '데오드 둔가라스', new_span: CANONICAL_DUNGARAS
        },
        {
          id: '63401', english_anchor: 'Deod Dungaras',
          japanese_anchor: 'デオド・ダンガラス',
          chinese_anchor: '迪欧德·顿格拉斯',
          old_span: '데오드 둔가라스', new_span: CANONICAL_DUNGARAS
        }
      ]
    },
    {
      entity: 'person:deod-twillt',
      english: 'Deod Twillt',
      korean: CANONICAL_TWILLT,
      variants: '데오드 트윌트|디오드 트윌트|강사 데오드 트윌트(Docent Deod Twillt)',
      note: 'English default:15083 gives Deod Twillt; default:57055 gives the complete title Docent Deod Twillt. Japanese デオド・トウィルト and Chinese 迪欧德·忒尔特 corroborate. Normalize the unadorned name at 15083; preserve the already complete Korean/English docent title atomically at 57055. This docent is a distinct full-name scope from porter Deod Dungaras; do not merge them or infer aliases.',
      rows: [
        {
          id: '15083', english_anchor: 'Deod Twillt',
          japanese_anchor: 'デオド・トウィルト',
          chinese_anchor: '迪欧德·忒尔特',
          old_span: '디오드 트윌트', new_span: CANONICAL_TWILLT
        },
        {
          id: '57055', english_anchor: 'Docent Deod Twillt',
          japanese_anchor: '導師デオド・トウィルト',
          chinese_anchor: '迪欧德·忒尔特讲师',
          old_span: '강사 데오드 트윌트(Docent Deod Twillt)',
          new_span: '강사 데오드 트윌트(Docent Deod Twillt)'
        }
      ]
    }
  ].map { |entity| entity.freeze }.freeze

  PRESERVED_PRIOR = {
    ['default', '24970', ''] => {
      'monster:murghan' => 'accepted',
      'person:ariel-perien' => 'accepted',
      'place:bonnlach' => 'accepted',
      'place:drowned-forest' => 'accepted'
    },
    ['default', '45089', ''] => { 'place:bonnlach' => 'accepted' },
    ['default', '63401', ''] => { 'people:almain' => 'accepted' }
  }.freeze

  def expected_pairs
    ENTITIES.flat_map do |entity|
      entity.fetch(:rows).map do |row|
        [entity.fetch(:entity), 'default', row.fetch(:id), '']
      end
    end
  end

  def definitions_for(headers)
    ENTITIES.map do |entity|
      fields = {
        'entity_key' => entity.fetch(:entity),
        'english_canonical' => entity.fetch(:english),
        'category' => 'person',
        'korean_canonical' => entity.fetch(:korean),
        'english_aliases' => '',
        'korean_variants' => entity.fetch(:variants),
        'evidence_ids' => "D-#{D}",
        'status' => 'confirmed',
        'notes' => entity.fetch(:note)
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def exact_count(text, span)
    text.scan(Regexp.new(Regexp.escape(span))).length
  end

  def preserved_prior(index_rows)
    indexed = index_rows.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row]
    end
    PRESERVED_PRIOR.each_with_object({}) do |(key, expected), snapshot|
      expected.each do |entity, status|
        row_key = [entity, *key]
        row = indexed.fetch(row_key) { raise "prior Deod-row disposition missing #{row_key.inspect}" }
        raise "prior Deod-row disposition changed #{row_key.inspect}" unless row.fetch('status') == status
        snapshot[row_key] = [row.fetch('status'), row.fetch('evidence')]
      end
    end
  end

  def prior_records(index_rows)
    index_rows.each_with_object({}) do |row, records|
      key = [row.fetch('entity_key'), *M.key(row)]
      raise "duplicate occurrence key #{key.inspect}" if records.key?(key)

      records[key] = row.reject { |field, _| field == 'korean_current' }
    end
  end

  def verify_prior_records!(before, index_rows)
    after = prior_records(index_rows)
    before.each do |key, record|
      raise "prior occurrence record changed #{key.inspect}" unless after[key] == record
    end
    raise 'unexpected new Deod occurrence keys' unless
      (after.keys - before.keys).sort == expected_pairs.sort
  end

  def reviews_for(inventory, generated)
    actual_pairs = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Deod full-name source scope differs' unless actual_pairs.sort == expected_pairs.sort

    generated.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end.map do |occurrence|
      entity = ENTITIES.find { |candidate| candidate.fetch(:entity) == occurrence.fetch('entity_key') }
      key = M.key(occurrence)
      source = inventory.fetch(key)
      row_spec = entity.fetch(:rows).find { |row| row.fetch(:id) == key[1] }
      raise "unexpected Deod full-name key #{key.inspect}" unless row_spec

      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "English Deod evidence differs #{key.inspect}" unless
        exact_count(english, row_spec.fetch(:english_anchor)) == 1
      raise "Japanese Deod evidence differs #{key.inspect}" unless
        japanese.include?(row_spec.fetch(:japanese_anchor))
      raise "Chinese Deod evidence differs #{key.inspect}" unless
        chinese.include?(row_spec.fetch(:chinese_anchor))

      old = source.fetch('work_text')
      old_span = row_spec.fetch(:old_span)
      raise "Korean Deod span differs #{key.inspect}" unless exact_count(old, old_span) == 1
      new_text = old.sub(old_span, row_spec.fetch(:new_span))
      raise "unexpected Deod annotation duplication #{key.inspect}" if
        new_text.scan(/\((?:Deod Dungaras|Deod Twillt)\)/).length >
          old.scan(/\((?:Deod Dungaras|Deod Twillt)\)/).length + 1

      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity.fetch(:entity), 'status' => status, 'old' => old,
        'new' => new_text,
        'evidence' => "#{entity.fetch(:note)} Exact full-name key only. English is primary; aligned Japanese and Chinese corroborate. Preserve every other entity annotation, token, particle, line break, and surrounding phrase.",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(entity.fetch(:entity) => status)
      }
    end
  end

  def prepare
    glossary_table = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    raise 'Deod full-name entity already registered' if
      (glossary.map { |row| row.fetch('entity_key') } & ENTITIES.map { |entity| entity.fetch(:entity) }).any?

    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'discovery outputs already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    inventory = M.refresh_inventory
    definitions = definitions_for(glossary_table.headers)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    index = M.table(M::INDEX).map(&:to_h)
    prior_snapshot = preserved_prior(index)
    reviews = reviews_for(inventory, generated)
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary, index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    raise 'prior Deod-row records unexpectedly changed during preparation' unless
      preserved_prior(index) == prior_snapshot

    puts "Prepared D-#{D}: #{reviews.length} exact full-name keys; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} Korean edits."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'entity_key', 'old', 'new'))
    end
    [definitions, reviews]
  end

  def apply
    glossary_path = ReviewedProperNameDiscovery::GLOSSARY
    prior_glossary = M.table(glossary_path)
    prior_index = prior_records(M.table(M::INDEX).map(&:to_h))
    definitions, reviews = prepare
    M.write_table(DEFINITIONS, prior_glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])

    final_index = M.table(M::INDEX).map(&:to_h)
    verify_prior_records!(prior_index, final_index)
    preserved_prior(final_index)
    final_glossary = M.table(glossary_path).map(&:to_h)
    raise 'prior glossary records changed' unless
      final_glossary == prior_glossary.map(&:to_h) + definitions
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-deod-full-names-D21452.rb [prepare|apply]' if ARGV.length > 1
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then DeodFullNamesD21452.prepare
  when 'apply' then DeodFullNamesD21452.apply
  else abort 'usage: review-deod-full-names-D21452.rb [prepare|apply]'
  end
end
