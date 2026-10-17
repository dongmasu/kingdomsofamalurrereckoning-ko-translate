#!/usr/bin/env ruby

require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module GortaShortFormsD21291
  M = ReviewedNameBatches
  PROPOSAL = File.join(M::AUDIT, 'proper-name-scoped-review-D21291.tsv')
  FORM = 'source-form:gorta'
  SPECS = [
    {
      id: '10025', entity: FORM, english: 'Gorta', old: '고르타', new: '고르타(Gorta)',
      notes: 'English and both supporting locales contain only the literal label Gorta. Add its exact English annotation to the existing Korean spelling without claiming it is the Faer Gorta creature, a person, or a separate creature. Accepted means bilingual spelling only; the entity identity remains unresolved. No alias or entity-level English canonical is established for this provisional source-form record.'
    },
    {
      id: '37275', entity: 'monster:faer-gorta', english: 'gorta', old: '고타의 신음', new: '고르타(gorta)의 신음',
      notes: 'English the groan of the gorta, Japanese ゴータのうなり声 and Chinese 骷髅兵的叫声 corroborate the row-local undead creature reference. Reuse the established Faer Gorta Korean component 고르타 rather than 고타, retaining exact lowercase local source gorta instead of expanding the source annotation to Faer Gorta. No global Gorta/gorta alias is registered.'
    }
  ].freeze

  module_function

  def run
    raise 'proposal already exists' if File.exist?(PROPOSAL)
    inventory = M.refresh_inventory
    glossary_path = File.join(M::AUDIT, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    raise 'provisional Gorta form already registered' if glossary.any? { |row| row['entity_key'] == FORM }
    index = M.table(M::INDEX)
    existing = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }.to_set
    reviews = SPECS.map do |spec|
      key = ['default', spec.fetch(:id), '']
      raise 'Gorta key already indexed' if existing.include?([spec.fetch(:entity), *key])
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise 'local source form changed' unless english.include?(spec.fetch(:english))
      old = source.fetch('work_text')
      raise 'Gorta Korean span changed' unless old.scan(spec.fetch(:old)).length == 1
      {
        'resource' => 'default', 'ID_Linha' => spec.fetch(:id), 'Tipo_Variante' => '',
        'entity_key' => spec.fetch(:entity), 'status' => 'accepted',
        'old' => old, 'new' => old.sub(spec.fetch(:old), spec.fetch(:new)),
        'evidence' => spec.fetch(:notes) + ' Official Korean manual PDF p. 1 supplies magical-world and resurrection setting, not this creature name. Preserve all dialogue, all other names, exact line breaks and old holds. D-19571/default:180 already closed Fear Gorta as a one-off Faer Gorta source typo; that row and spelling are not reopened or recounted.',
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(spec.fetch(:entity) => 'accepted'),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    definition = {
      'entity_key' => FORM, 'english_canonical' => '', 'category' => 'title',
      'korean_canonical' => '고르타(Gorta)', 'english_aliases' => '',
      'korean_variants' => '고르타', 'evidence_ids' => 'D-21291|default:10025',
      'status' => 'unresolved', 'notes' => SPECS.first.fetch(:notes) + ' The schema category title is only a neutral standalone-label placeholder, not a claim that Gorta is a formal title, person, or creature. Blank canonical and empty aliases intentionally prevent generic occurrence generation; the only source form is literal Gorta at default:10025.'
    }
    additions = SPECS.zip(reviews).map do |spec, review|
      [spec.fetch(:entity), *M.key(review), spec.fetch(:english), review.fetch('english'),
       review.fetch('old'), 'needs-context', spec.fetch(:notes)]
    end
    rows = index.map(&:to_h) + additions.map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    raise 'duplicate occurrence key' unless
      rows.map { |row| [row.fetch('entity_key'), *M.key(row)] }.uniq.length == rows.length
    M.write_table(PROPOSAL, M::HEADERS, reviews)
    M.write_table(File.join(M::AUDIT, 'proper-name-scoped-definitions-D21291.tsv'), glossary.headers, [definition])
    M.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + [definition])
    M.write_table(M::INDEX, OCCURRENCE_HEADERS, rows.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end)
    puts 'Prepared two Gorta keys; standalone-label identity remains unresolved.'
  end
end

GortaShortFormsD21291.run if $PROGRAM_NAME == __FILE__
