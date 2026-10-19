#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module PrepareProperNameAliasExpansionD21839
  extend self

  M = ReviewedNameBatches
  AUDIT = M::AUDIT
  ENTITY = 'title:royal-seal-of-ansilla'
  ALIAS = 'Seal of Ansilla'
  TARGETS = %w[37757 43136 46678 9734].map { |id| ['default', id, ''] }.freeze
  PRIOR = [%w[base 796 11], %w[base 4816 11]].freeze
  REVIEW = File.join(AUDIT, 'proper-name-discovery-D21839.tsv')
  ALIAS_RECORD = File.join(AUDIT, 'proper-name-alias-expansion-D21839.tsv')

  def run
    [REVIEW, ALIAS_RECORD,
     File.join(AUDIT, 'proper-name-edits-D21839.tsv'),
     File.join(AUDIT, 'named-scope-review-D21839-20261019.md'),
     File.join(AUDIT, 'named-scope-edit-addendum-D21839-20261019.md')].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end

    inventory = M.refresh_inventory
    glossary_table = M.table(File.join(AUDIT, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    definition = glossary.find { |row| row['entity_key'] == ENTITY }
    raise "missing registered entity #{ENTITY}" unless definition
    aliases = definition['english_aliases'].to_s.split('|').reject(&:empty?)
    raise "alias already registered: #{ALIAS}" if aliases.any? { |term| term.casecmp(ALIAS).zero? }
    collision = glossary.find do |row|
      next false if row['entity_key'] == ENTITY
      ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
        .any? { |term| term.casecmp(ALIAS).zero? }
    end
    raise "English alias collision: #{collision['entity_key']}" if collision

    definition['english_aliases'] = (aliases + [ALIAS]).join('|')
    evidence_id = 'D-21839|default:37757|default:43136|default:46678|default:9734'
    definition['evidence_ids'] = ([definition['evidence_ids'], evidence_id]
      .reject(&:empty?).join('|').split('|').uniq.join('|'))
    definition['notes'] = "#{definition['notes']} The exact shorter alias Seal of Ansilla appears at default:37757, 43136, 46678, and 9734. Quest completion and family-lockbox contexts identify the same named artifact as the father's royal medallion already registered under the complete Royal Seal of Ansilla label; retain this exact English alias and the Korean `안실라의 인장` wording."

    generated = build_occurrences(inventory.values, [definition])
    generated_keys = generated.map { |row| [row[1], row[2], row[3].to_s] }.sort
    expected = (PRIOR + TARGETS).sort
    raise "unexpected entity source keys: #{generated_keys.inspect}" unless generated_keys == expected

    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    indexed_keys = index.map do |row|
      [row['entity_key'], row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s]
    end
    TARGETS.each do |key|
      raise "target already indexed for #{ENTITY}: #{key.inspect}" if
        indexed_keys.include?([ENTITY, *key])
    end

    target_rows = generated.select do |row|
      TARGETS.include?([row[1], row[2], row[3].to_s])
    end
    raise 'expected four exact Seal of Ansilla matches' unless target_rows.length == 4
    additions = target_rows.map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    M.write_table(File.join(AUDIT, 'proper-name-glossary.tsv'),
                  glossary_table.headers, glossary)
    M.write_table(M::INDEX, index_table.headers, index + additions)

    evidence = "English dialogue calls the father's royal medallion the Seal of Ansilla; the quest-completion and family-lockbox contexts establish the same artifact. These four source phrases identify the existing Royal Seal of Ansilla; Japanese アンシラの紋章 and Chinese 安西拉奖章 corroborate. Pair only this exact source alias; retain the existing item wording and the distinct Ansilla Key."
    reviews = TARGETS.map do |key|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      phrase = '안실라의 인장'
      raise "expected one Korean term span at #{key.inspect}" unless old.scan(phrase).length == 1
      new_text = old.sub(phrase, "#{phrase}(#{ALIAS})")
      raise "unexpected English source at #{key.inspect}" unless
        JSON.parse(source.fetch('en_texts_json')).compact.any? { |text| text.match?(/\bSeal of Ansilla\b/) }
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => 'accepted',
        'old' => old,
        'new' => new_text,
        'evidence' => evidence,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end
    M.write_table(REVIEW, M::HEADERS, reviews)
    M.write_table(ALIAS_RECORD,
      %w[entity_key english_alias scope evidence],
      [{
        'entity_key' => ENTITY,
        'english_alias' => ALIAS,
        'scope' => 'default:37757|default:43136|default:46678|default:9734',
        'evidence' => evidence
      }])
    puts 'D-21839 prepared: one exact source alias, four target cells, ' \
         'and two pre-existing canonical source keys retained.'
  end
end

PrepareProperNameAliasExpansionD21839.run
