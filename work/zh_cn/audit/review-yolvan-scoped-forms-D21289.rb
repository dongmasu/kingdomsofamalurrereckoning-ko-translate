#!/usr/bin/env ruby

require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

# Explicit scopes prevent the shared source spelling from merging place identities.
module YolvanScopedFormsD21289
  M = ReviewedNameBatches
  GLOSSARY = File.join(M::AUDIT, 'proper-name-glossary.tsv')
  PROPOSAL = File.join(M::AUDIT, 'proper-name-scoped-review-D21289.tsv')
  REGIONAL_IDS = %w[
    2499 5463 11329 13430 15496 16995 21666 22432 25117 26762 27747
    28426 29218 36828 39327 39632 42851 44716 49093 51760 54493
    55656 59531 60369 61174
  ].freeze
  UNRESOLVED_IDS = %w[
    5410 7663 8239 10606 10688 12369 20486 20773 39691 40839
    46138 48840 53473 55532 57873 58164 60580 61118 62490
  ].freeze
  REGION = 'place:yolvan'
  FORM = 'source-form:yolvan'
  MANUAL = 'Official Korean manual PDF p. 1 supplies Faelands/forest setting and PDF p. 7 supplies quest/faction context, not this toponym. English is primary; Japanese ヨルヴァン and Chinese 尤凡 corroborate localized rows. Japanese and Chinese default:57873 are literal English fallback and do not independently corroborate identity. Preserve particles, unrelated names, all prose and exact verse/paragraph breaks.'
  REGION_NOTE = 'English explicitly establishes the Yolvan region in base:2999:11 and geographical prose about its meadows, forests, borders, roads and inhabitants (especially default:39632). Use 요르반(Yolvan), sharing only the already reviewed Castle Yolvan Korean spelling, not a place identity or global castle alias. This confirmed regional record is scoped to base:2999:11 and the 25 regional-prose keys listed in review-yolvan-scoped-forms-D21289.rb.'
  FORM_NOTE = 'Provisional English source-form Yolvan only: the 19 explicitly scoped standalone, castle-associated and poem/question keys in review-yolvan-scoped-forms-D21289.rb do not establish one shared physical referent. The relation to the Yolvan region and Castle Yolvan is neither established nor ruled out. Accepted occurrence decisions mean orthographic/bilingual name-only correction, not acceptance of an identity merge or distinction. Leave the entity-level English canonical blank and aliases empty because no common canonical identity is established; the exact English source form is recorded in matched_english and this evidence. This prevents generic match generation for the provisional record. Retain its explicit 19-row scope without weakening the discovery registration collision guard.'

  module_function

  def run
    raise 'proposal already exists' if File.exist?(PROPOSAL)
    raise 'D-21289 already recorded' unless
      Dir.glob(File.join(M::AUDIT, 'named-scope-*-D21289-*.md')).empty?
    inventory = M.refresh_inventory
    glossary = M.table(GLOSSARY)
    raise 'Yolvan scoped entity already registered' if
      glossary.any? { |row| [REGION, FORM].include?(row['entity_key']) }
    index = M.table(M::INDEX)
    scopes = { ['base', '2999', '11'] => REGION }
    REGIONAL_IDS.each { |id| scopes[['default', id, '']] = REGION }
    UNRESOLVED_IDS.each do |id|
      key = ['default', id, '']
      raise 'overlapping Yolvan scopes' if scopes.key?(key)
      scopes[key] = FORM
    end
    raise 'wrong regional/form scope sizes' unless
      scopes.values.count(REGION) == 26 && scopes.values.count(FORM) == 19
    sources = scopes.keys.sort_by do |key|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map { |key| inventory.fetch(key) }
    reviews = sources.map do |source|
      key = M.key(source)
      entity = scopes.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise 'source is not a bare Yolvan occurrence' unless
        english.match?(/\bYolvan\b/) && !english.include?('Castle Yolvan')
      raise 'explicit castle key must not be reviewed again' if
        index.any? { |row| M.key(row) == key && row['entity_key'] == 'place:castle-yolvan' }
      old = source.fetch('work_text')
      spans = old.scan(/(?:욜반|요르반)(?:\(Yolvan\))?/)
      raise "Korean/source Yolvan mention counts differ at #{key.inspect}" unless
        spans.length == english.scan(/\bYolvan\b/).length
      new_text = old.gsub(/(?:욜반|요르반)(?:\(Yolvan\))?/, '요르반(Yolvan)')
      status = old == new_text ? 'not-an-issue' : 'accepted'
      evidence = [entity == REGION ? REGION_NOTE : FORM_NOTE, MANUAL].join(' ')
      if source['ID_Linha'] == '20486'
        evidence += ' English says the last of Yolvan, Japanese says annihilated, and Chinese mentions last bloodline; preserve existing 마지막 후손 wording without treating it as evidence of a dynasty or a person named Yolvan.'
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => evidence, 'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    definitions = [
      {
        'entity_key' => REGION, 'english_canonical' => 'Yolvan', 'category' => 'place',
        'korean_canonical' => '요르반(Yolvan)', 'english_aliases' => '',
        'korean_variants' => '욜반|요르반', 'evidence_ids' => 'D-21289|base:2999:11|default:39632',
        'status' => 'confirmed', 'notes' => REGION_NOTE
      },
      {
        'entity_key' => FORM, 'english_canonical' => '', 'category' => 'place',
        'korean_canonical' => '요르반(Yolvan)', 'english_aliases' => '',
        'korean_variants' => '욜반|요르반', 'evidence_ids' => 'D-21289:19 explicit source-form keys only',
        'status' => 'unresolved', 'notes' => FORM_NOTE
      }
    ]
    additions = sources.map do |source|
      entity = scopes.fetch(M.key(source))
      [entity, *M.key(source), 'Yolvan',
       JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n"),
       source.fetch('work_text'), 'needs-context',
       entity == REGION ? REGION_NOTE : FORM_NOTE]
    end
    rows = index.map(&:to_h) + additions.map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    raise 'duplicate entity/row key' unless
      rows.map { |row| [row.fetch('entity_key'), *M.key(row)] }.uniq.length == rows.length
    M.write_table(PROPOSAL, M::HEADERS, reviews)
    M.write_table(File.join(M::AUDIT, 'proper-name-scoped-definitions-D21289.tsv'), glossary.headers, definitions)
    M.write_table(GLOSSARY, glossary.headers, glossary.map(&:to_h) + definitions)
    M.write_table(M::INDEX, OCCURRENCE_HEADERS, rows.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end)
    puts "Prepared #{reviews.length} scoped Yolvan keys: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

YolvanScopedFormsD21289.run if $PROGRAM_NAME == __FILE__
