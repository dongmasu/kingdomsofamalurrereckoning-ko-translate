#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module PrepareProperNameDiscoveryD21837
  extend self

  M = ReviewedNameBatches
  AUDIT = M::AUDIT
  ENTITY = 'person:lord-ansilla'
  KEYS = %w[3437 5860 8904 25233 31513 34056 47073 61379].map do |id|
    ['default', id, '']
  end.freeze
  DEFINITIONS = File.join(AUDIT, 'proper-name-discovery-definitions-D21837.tsv')
  REVIEWS = File.join(AUDIT, 'proper-name-discovery-D21837.tsv')
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze

  def run
    [DEFINITIONS, REVIEWS,
     File.join(AUDIT, 'proper-name-edits-D21837.tsv'),
     File.join(AUDIT, 'named-scope-review-D21837-20261019.md'),
     File.join(AUDIT, 'named-scope-edit-addendum-D21837-20261019.md')].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end

    inventory = M.refresh_inventory
    glossary = M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).map(&:to_h)
    raise "entity already exists: #{ENTITY}" if glossary.any? { |row| row['entity_key'] == ENTITY }
    collision = glossary.find do |row|
      ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
        .any? { |term| term.casecmp('Lord Ansilla').zero? }
    end
    raise "English canonical collision: #{collision['entity_key']}" if collision

    definition = {
      'entity_key' => ENTITY,
      'english_canonical' => 'Lord Ansilla',
      'category' => 'person',
      'korean_canonical' => '안실라 경(Lord Ansilla)',
      'english_aliases' => '',
      'korean_variants' => '안실라 경|안실라(Ansilla) 경',
      'evidence_ids' => 'D-21837',
      'status' => 'confirmed',
      'notes' => 'The exact English display Lord Ansilla recurs as the castle patron, ruler, master, and household head. English dialogue and labels consistently identify one person; aligned Japanese アンシラ卿 and Chinese 安西拉领主 corroborate. Standardize the complete personal-name display as 안실라 경(Lord Ansilla). Keep House Ansilla, Castle Ansilla, Lady Ansilla, Captain Ansilla, and the Royal Seal of Ansilla as distinct entities; do not generalize the bare term Ansilla.'
    }

    generated = build_occurrences(inventory.values, [definition])
    generated_keys = generated.map { |row| [row[1], row[2], row[3].to_s] }.sort
    raise "unexpected exact occurrence keys: #{generated_keys.inspect}" unless generated_keys == KEYS.sort

    evidence = 'English consistently identifies Lord Ansilla as the same person across the castle, household, patronage, and service references; Japanese and Chinese corroborate the title and name. Pair the complete source name as 안실라 경(Lord Ansilla), retaining Korean particles outside the parenthetical. Do not merge this person with House Ansilla, Castle Ansilla, Lady Ansilla, Captain Ansilla, or the Royal Seal of Ansilla.'
    reviews = KEYS.map do |key|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      full = '안실라 경(Lord Ansilla)'
      if old.include?('안실라(Ansilla) 경')
        new_text = old.sub('안실라(Ansilla) 경', full)
      elsif old.include?(full)
        new_text = old
      elsif old.include?('안실라 경')
        new_text = old.sub('안실라 경', full)
      else
        raise "expected Korean name span missing at #{key.inspect}: #{old}"
      end
      raise "multiple name spans at #{key.inspect}" if old.scan(/안실라(?:\(Ansilla\))? 경(?:\(Lord Ansilla\))?/).length != 1

      disposition = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => disposition,
        'old' => old,
        'new' => new_text,
        'evidence' => evidence,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => disposition),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end
    raise 'expected seven text corrections and one already-canonical label' unless
      reviews.count { |row| row['status'] == 'accepted' } == 7 &&
      reviews.count { |row| row['status'] == 'not-an-issue' } == 1

    M.write_table(DEFINITIONS, DEFINITION_HEADERS, [definition])
    M.write_table(REVIEWS, M::HEADERS, reviews)
    puts "D-21837 prepared: #{reviews.length} exact source keys; " \
         "#{generated.length} occurrence matches; " \
         "#{reviews.count { |row| row['status'] == 'accepted' }} edits; " \
         "#{reviews.count { |row| row['status'] == 'not-an-issue' }} unchanged."
  end
end

PrepareProperNameDiscoveryD21837.run
