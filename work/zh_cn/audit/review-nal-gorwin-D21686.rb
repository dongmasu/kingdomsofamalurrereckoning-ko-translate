#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-proper-name-inventory'

module NalGorwinD21686
  extend self

  D = 21_686
  ENTITY = 'person:nal-gorwin'
  ENGLISH = 'Nal Gorwin'
  CANONICAL = '날 고윈(Nal Gorwin)'
  KEYS = [
    ['base', '173', '11'],
    ['default', '56341', '']
  ].freeze
  SOURCES = {
    ['base', '173', '11'] => {
      english: 'Grave of Nal Gorwin',
      japanese: 'ナル・ゴーウィンの墓',
      chinese: '纳尔·戈文之墓'
    },
    ['default', '56341', ''] => {
      english: 'Grave of Nal Gorwin',
      japanese: 'ナル・ゴーウィンの墓',
      chinese: '纳尔·葛文之墓'
    }
  }.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English base:173 and default:56341 both identify the named individual
    whose grave is labeled Grave of Nal Gorwin. Japanese ナル・ゴーウィンの墓
    and Chinese 纳尔·戈文之墓/纳尔·葛文之墓 corroborate the name; English
    remains the identity anchor. Register person:nal-gorwin as
    날 고윈(Nal Gorwin), preserving the already consistent Korean name.
    Infer no title, occupation, species, biography, or relationship beyond
    the grave labels. The two exact source keys are already fully paired,
    so no Texto edit is warranted. No affix hit exists. The official Korean
    manual extraction/reference has no direct Nal Gorwin entry.
  TEXT
  SPEC = {
    key: ENTITY, english: ENGLISH, category: 'person', korean: CANONICAL,
    variants: '날 고윈', count: KEYS.length, notes: NOTE
  }.freeze

  def validate_source!(key, source)
    raise "unreviewed Nal Gorwin key #{key.inspect}" unless KEYS.include?(key)
    expected = SOURCES.fetch(key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise "English grave label differs at #{key.inspect}" unless
      english == expected.fetch(:english)
    raise "Japanese grave label differs at #{key.inspect}" unless
      japanese == expected.fetch(:japanese)
    raise "Chinese grave label differs at #{key.inspect}" unless
      chinese == expected.fetch(:chinese)
    true
  end

  def transform(_spec, key, text, source)
    raise "unreviewed Nal Gorwin key #{key.inspect}" unless KEYS.include?(key)
    validate_source!(key, source)
    raise "Korean Nal Gorwin pair differs at #{key.inspect}" unless
      text.scan(CANONICAL).length == 1
    [text, false]
  end

  def definition
    headers = ReviewedNameBatches.table(ReviewedProperNameDiscovery::GLOSSARY).headers
    headers.zip([
      SPEC[:key], SPEC[:english], SPEC[:category], SPEC[:korean], '',
      SPEC[:variants], "D-#{D}", 'confirmed', SPEC[:notes]
    ]).to_h
  end

  def current_inventory
    m = ReviewedNameBatches
    m::RESOURCES.flat_map do |resource|
      aligned = (LOCALES + ['work']).map do |locale|
        read_rows(inventory_paths(m::ROOT, locale, resource))
      end
      build_inventory(resource, *aligned).map do |values|
        OUTPUT_HEADERS.zip(values).to_h
      end
    end.to_h { |row| [ReviewedNameBatches.key(row), row] }
  end

  def dry_run
    m = ReviewedNameBatches
    r = ReviewedProperNameDiscovery
    r.ensure_unused_batch!(D)
    inventory = current_inventory
    raise 'incomplete aligned inventory' unless inventory.length == 73_430
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated_keys = generated.map { |row| m.key(row) }.sort
    raise "Nal Gorwin source scope differs: #{generated_keys.inspect}" unless
      generated_keys == KEYS.sort

    reviews = generated.map do |occurrence|
      key = m.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      revised, excluded = transform(SPEC, key, old, source)
      status = excluded ? 'excluded' : (old == revised ? 'not-an-issue' : 'accepted')
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => revised,
        'evidence' => NOTE,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    glossary = m.table(r::GLOSSARY)
    index = m.table(m::INDEX)
    r.validate!([definition], reviews, generated, glossary.map(&:to_h), index.map(&:to_h))
    r.validate_sources!(reviews, inventory)
    puts "D-#{D} read-only dry run: #{generated.length} exact grave labels, " \
         '0 Texto edits; English/Japanese/Chinese evidence and current pairs passed.'
    reviews.each do |row|
      key = [row['resource'], row['ID_Linha'], row['Tipo_Variante']]
      puts "#{key.join(':')} #{CANONICAL} (already canonical)"
    end
  end

  def apply
    ReviewedDiscoverySpecs.run(
      D, 'Nal Gorwin Named Person', [SPEC], NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['dry-run'] then NalGorwinD21686.dry_run
  when ['apply'] then NalGorwinD21686.apply
  else abort 'usage: review-nal-gorwin-D21686.rb dry-run|apply'
  end
end
