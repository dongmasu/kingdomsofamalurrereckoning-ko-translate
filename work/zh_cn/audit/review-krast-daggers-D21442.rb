#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module KrastDaggersD21442
  extend self

  M = ReviewedNameBatches
  D = 21_442
  ITEMS = [
    {
      entity: 'unique_item:medgars-dagger',
      english: "Medgar's Dagger",
      korean: '메드가르의 단검',
      variants: %w[메드가의 단검],
      ids: %w[6065 48566],
      ja: /メドガーのダガー/,
      zh: /麦德加的匕首/,
      pattern: /(?:메드가르?|메드거)의 단검(?:\(Medgar's Dagger\))?/,
      note: "English labels both rows exactly Medgar's Dagger; Japanese メドガーのダガー and Chinese 麦德加的匕首 corroborate the same dagger label. Normalize the Korean spelling and pair the complete item title. Keep the already-reviewed person-name exclusions intact, and do not merge this dagger label with the separately registered base item Medgar Krast's Blade."
    },
    {
      entity: 'unique_item:osgars-dagger',
      english: "Osgar's Dagger",
      korean: '오스가르의 단검',
      variants: %w[오스가의 단검],
      ids: %w[23124 64305],
      ja: /オスガーのダガー/,
      zh: /奥斯加的匕首/,
      pattern: /오스가르?의 단검(?:\(Osgar's Dagger\))?/,
      note: "English labels both rows exactly Osgar's Dagger; Japanese オスガーのダガー and Chinese 奥斯加的匕首 corroborate the same dagger label. Normalize the Korean spelling and pair the complete item title. Keep the already-reviewed person-name exclusions intact, and do not merge this dagger label with the separately registered base item Osgar Krast's Blade."
    }
  ].freeze

  def keys(item)
    item.fetch(:ids).map { |id| ['default', id, ''] }
  end

  def definitions(headers)
    ITEMS.map do |item|
      fields = {
        'entity_key' => item.fetch(:entity),
        'english_canonical' => item.fetch(:english),
        'category' => 'unique item',
        'english_aliases' => '',
        'korean_canonical' => "#{item.fetch(:korean)}(#{item.fetch(:english)})",
        'korean_variants' => item.fetch(:variants).join('|'),
        'status' => 'confirmed',
        'evidence_ids' => "D-#{D}",
        'notes' => item.fetch(:note)
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def transform(item, text)
    raise "missing Korean item label #{item.fetch(:entity)}" unless text.match?(item.fetch(:pattern))
    text.gsub(item.fetch(:pattern), "#{item.fetch(:korean)}(#{item.fetch(:english)})")
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    definitions = definitions(glossary.headers)
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = ITEMS.flat_map do |item|
      keys(item).map { |key| [item.fetch(:entity), *key] }
    end
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise "exact item-title source scope differs: #{actual.inspect}" unless
      actual.sort == expected.sort

    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _rows|
      [M::RESOURCES.index(key[0]), key[1].to_i]
    end.map do |key, occurrences|
      item = ITEMS.find { |candidate| candidate.fetch(:entity) == occurrences.first.fetch('entity_key') }
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "English title differs #{key.inspect}" unless
        english == item.fetch(:english)
      raise "Japanese title differs #{key.inspect}" unless
        japanese.match?(item.fetch(:ja))
      raise "Chinese title differs #{key.inspect}" unless
        chinese.match?(item.fetch(:zh))
      old = source.fetch('work_text')
      new_text = transform(item, old)
      raise "item label did not change #{key.inspect}" if old == new_text
      entity_dispositions = { item.fetch(:entity) => 'accepted' }
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => item.fetch(:entity),
        'status' => 'accepted',
        'old' => old,
        'new' => new_text,
        'evidence' => "#{item.fetch(:note)} English anchors the complete item title; Japanese and Chinese corroborate it. All affix/base/default resources were searched. This item-title scope is separate from and preserves the already-terminal person-name decision on the same row. The separately registered Krast Blade title is not treated as an alias. Preserve unrelated text, tokens, line breaks and historical totals.",
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(entity_dispositions)
      }
    end
    ReviewedProperNameDiscovery.validate!(definitions, reviews, generated,
      glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h))
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: #{definitions.length} item titles; #{generated.length} exact keys; #{reviews.count { |row| row['old'] != row['new'] }} edits"
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'entity_key', 'status', 'new'))
    end
    [definitions, reviews]
  end

  def apply
    definitions, reviews = prepare
    definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
    review_path = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
    raise 'prepared outputs exist' if [definition_path, review_path].any? do |path|
      File.exist?(path)
    end
    M.write_table(definition_path, definitions.first.keys, definitions)
    M.write_table(review_path, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([definition_path, review_path, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then KrastDaggersD21442.prepare
  when 'apply' then KrastDaggersD21442.apply
  else abort 'usage: review-krast-daggers-D21442.rb [prepare|apply]'
  end
end
