#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'

module PrepareProperNameScopedAliasesD21841
  extend self

  M = ReviewedNameBatches
  AUDIT = M::AUDIT
  TARGETS = [
    ['person:lord-ansilla', '17538', '안실라의 사람들이', '안실라(Ansilla)의 사람들이'],
    ['person:lord-ansilla', '33958', '안실라의 왕좌', '안실라(Ansilla)의 왕좌'],
    ['person:lord-ansilla', '39388', '상인 안실라의', '상인 안실라(Ansilla)의'],
    ['place:castle-ansilla', '50445', '안실라의 성문', '안실라(Ansilla)의 성문'],
    ['place:castle-ansilla', '59408', '안실라가 늘', '안실라(Ansilla)가 늘'],
    ['place:castle-ansilla', '63008', '안실라엔', '안실라(Ansilla)엔']
  ].freeze
  REVIEW = File.join(AUDIT, 'proper-name-discovery-D21841.tsv')
  SCOPED_ALIASES = File.join(AUDIT, 'proper-name-scoped-aliases-D21841.tsv')

  def run
    [REVIEW, SCOPED_ALIASES,
     File.join(AUDIT, 'proper-name-edits-D21841.tsv'),
     File.join(AUDIT, 'named-scope-review-D21841-20261019.md'),
     File.join(AUDIT, 'named-scope-edit-addendum-D21841-20261019.md')].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end

    inventory = M.refresh_inventory
    glossary_table = M.table(File.join(AUDIT, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    owners = %w[person:lord-ansilla place:castle-ansilla]
    definitions = owners.to_h do |entity|
      entry = glossary.find { |row| row['entity_key'] == entity }
      raise "missing registered entity #{entity}" unless entry
      [entity, entry]
    end
    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    existing = index.map do |row|
      [row['entity_key'], row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s]
    end.to_set
    review_rows = []
    occurrence_rows = []
    scoped_rows = []

    TARGETS.each do |entity, id, old_span, new_span|
      key = ['default', id, '']
      raise "already indexed contextual alias #{entity} at #{key.inspect}" if
        existing.include?([entity, *key])
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      raise "expected one Korean span at #{key.inspect}" unless old.scan(old_span).length == 1
      new_text = old.sub(old_span, new_span)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "source lacks exact Ansilla reference at #{key.inspect}" unless
        english.match?(/\bAnsilla\b/)

      rationale =
        if entity == 'person:lord-ansilla'
          'English uses bare Ansilla for a male ruler, named merchant, or the king without a kingdom; the pronouns, title, and House Ansilla setting identify the already registered Lord Ansilla in these exact contexts. This is a source-scoped match only, not a glossary-wide English alias.'
        else
          'English uses Ansilla as a destination/stronghold: the gates and direct entry route, an explicitly described stronghold fit for kings, and a visitor arriving there support the already registered Castle Ansilla in these exact contexts. This is a source-scoped match only, not a glossary-wide English alias.'
        end
      evidence = "#{rationale} Japanese and Chinese corroborate the same source referent. Add only the exact Korean (English) name pairing; keep all other text unchanged."
      review_rows << {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => entity,
        'status' => 'accepted',
        'old' => old,
        'new' => new_text,
        'evidence' => evidence,
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => 'accepted'),
        'previous_status' => '',
        'previous_evidence' => ''
      }
      occurrence_rows << {
        'entity_key' => entity,
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'matched_english' => 'Ansilla',
        'english_source' => english,
        'korean_current' => old,
        'status' => 'needs-context',
        'evidence' => 'Source-scoped English alias candidate; review exact context under D-21841.'
      }
      scoped_rows << {
        'entity_key' => entity,
        'english_alias' => 'Ansilla',
        'source_key' => key.join(':'),
        'scope' => 'This exact source key only; do not apply as a global glossary alias.',
        'evidence' => evidence
      }
      existing << [entity, *key]
    end

    definitions.each do |entity, entry|
      ids = TARGETS.select { |target| target[0] == entity }
        .map { |_owner, id, _old, _new| "default:#{id}" }
      entry['evidence_ids'] = ([entry['evidence_ids'], 'D-21841', *ids]
        .reject(&:empty?).join('|').split('|').uniq.join('|'))
      entry['notes'] = "#{entry['notes']} D-21841 adds only source-scoped bare Ansilla matches at #{ids.join(', ')}; no global Ansilla alias is registered."
    end

    M.write_table(File.join(AUDIT, 'proper-name-glossary.tsv'),
                  glossary_table.headers, glossary)
    M.write_table(M::INDEX, index_table.headers, index + occurrence_rows)
    M.write_table(REVIEW, M::HEADERS, review_rows)
    M.write_table(SCOPED_ALIASES,
      %w[entity_key english_alias source_key scope evidence], scoped_rows)
    puts "D-21841 prepared: #{review_rows.length} contextual matches " \
         "(#{review_rows.group_by { |row| row['entity_key'] }.transform_values(&:length).inspect}); " \
         'no global Ansilla alias.'
  end
end

PrepareProperNameScopedAliasesD21841.run
