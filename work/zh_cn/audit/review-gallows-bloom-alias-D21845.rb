#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'

module ReviewGallowsBloomAliasD21845
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_845
  ENTITY = 'resource:gallows-bloom'
  ALIAS = "Gallows' Bloom"
  REVIEW = File.join(__dir__, 'proper-name-source-alias-D21845.tsv')
  TARGETS = {
    '13216' => ["교수대의 꽃(Gallows' Bloom)", "교수대 꽃(Gallows' Bloom)"],
    '15444' => ['교수대 꽃', "교수대 꽃(Gallows' bloom)"],
    '34186' => ['교수대 꽃', "교수대 꽃(Gallows' Bloom)"],
    '35715' => ['교수대의 꽃', "교수대 꽃(Gallows' Bloom)"],
    '40939' => ['교수대의 꽃', "교수대 꽃(Gallows' Bloom)"]
  }.freeze
  PRIOR = [%w[base 1027 11], %w[default 9911], %w[default 15757],
           %w[default 16894], %w[default 30159]].map do |key|
    [key[0], key[1], key[2].to_s]
  end.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English uses Gallows Bloom in the named-reagent label and the
    collection/analysis quest, and Gallows' Bloom (lowercase bloom at
    default:15444) in the corresponding obtain/query/find dialogue.
    Japanese consistently calls both forms ガローズの花; Chinese
    绞架花/绞架之花 corroborates the same flower. Register the apostrophe
    spelling as an alias of resource:gallows-bloom, not a second resource.
    Reuse the established Korean 교수대 꽃 and pair the exact local
    English spelling. The official Korean manual supports 시약(Reagent)
    as background but has no direct Gallows Bloom entry. Preserve the five
    previously indexed entity/row decisions and every unrelated entity
    disposition. This is a new alias-specific scope, not a recount of the
    sequential review or D-19777's separate wording correction.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'alias manifest already exists' if File.exist?(REVIEW)
    inventory = M.refresh_inventory
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    owner = glossary.find { |row| row['entity_key'] == ENTITY }.to_h
    raise 'canonical owner changed' unless
      owner['english_canonical'] == 'Gallows Bloom' &&
      owner['korean_canonical'] == '교수대 꽃(Gallows Bloom)' &&
      owner['status'] == 'confirmed'
    aliases = owner['english_aliases'].to_s.split('|')
    raise 'alias already registered' if aliases.any? { |term| term.casecmp?(ALIAS) }
    raise 'alias collision' if glossary.any? do |row|
      row['entity_key'] != ENTITY &&
        [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
          .any? { |term| term.casecmp?(ALIAS) }
    end
    existing = index.select { |row| row['entity_key'] == ENTITY }
    raise 'prior source scope changed' unless existing.map { |row| M.key(row) }.sort == PRIOR.sort
    raise 'prior decisions are not terminal' if existing.any? { |row| row['status'] == 'needs-context' }
    owner['english_aliases'] = (aliases + [ALIAS]).join('|')
    owner['evidence_ids'] = (
      owner['evidence_ids'].to_s.split('|') + ["D-#{D}"] +
      TARGETS.keys.map { |id| "default:#{id}" }
    ).uniq.join('|')
    owner['notes'] = [owner['notes'], NOTE].join("\n")
    generated = build_occurrences(inventory.values, [owner]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    target_keys = TARGETS.keys.map { |id| ['default', id, ''] }
    raise 'complete source scope differs' unless
      generated.map { |row| M.key(row) }.sort == (PRIOR + target_keys).sort
    fresh = generated.reject { |row| PRIOR.include?(M.key(row)) }
    raise 'alias additions differ' unless fresh.map { |row| M.key(row) }.sort == target_keys.sort
    reviews = fresh.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "English alias differs at #{key}" unless english.match?(/\bGallows' [Bb]loom\b/)
      raise "Japanese flower differs at #{key}" unless japanese.include?('ガローズの花')
      raise "Chinese flower differs at #{key}" unless chinese.match?(/绞架(?:之)?花/)
      before, after = TARGETS.fetch(key[1])
      old = source.fetch('work_text')
      raise "Korean source span differs at #{key}" unless old.scan(before).length == 1
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => 'accepted',
        'old' => old, 'new' => old.sub(before, after), 'evidence' => NOTE,
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
      }
    end
    R.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), reviews)
    [glossary, index, owner, fresh, reviews]
  end

  def run(apply: false)
    glossary, index, owner, fresh, reviews = prepare
    puts "D-#{D}: five new alias matches; five approved Texto edits; five prior matches retained."
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'old', 'new')) }
    return unless apply

    M.write_table(R::GLOSSARY, glossary.headers,
                  glossary.map { |row| row['entity_key'] == ENTITY ? owner : row.to_h })
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + fresh)
    M.write_table(REVIEW, M::HEADERS, reviews)
    M.run(REVIEW, D, 1)
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewGallowsBloomAliasD21845.run
  when ['apply'] then ReviewGallowsBloomAliasD21845.run(apply: true)
  else abort 'usage: review-gallows-bloom-alias-D21845.rb [prepare|apply]'
  end
end
