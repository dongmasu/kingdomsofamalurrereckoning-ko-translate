#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-proper-name-inventory'

module MeathgraD21683
  extend self

  D = 21_683
  ENTITY = 'monster:meathgra'
  ENGLISH = 'Meathgra'
  CANONICAL = '미스그라(Meathgra)'
  KEYS = [
    ['base', '66', '11'],
    *%w[
      651 1039 1869 3125 4278 13321 21127 21194 21879 21967
      23477 26295 28878 40074 45882 54918 60201 60545
    ].map { |id| ['default', id, ''] }
  ].freeze
  KOREAN_NAME_COUNTS = KEYS.to_h do |key|
    [key, %w[default:28878 default:60201].include?("#{key[0]}:#{key[1]}") ? 2 : 1]
  end.freeze
  NAME_PATTERN = /미스그라(?!\(Meathgra\))/
  ENGLISH_PATTERN = /(?<![A-Za-z0-9])Meathgra(?![A-Za-z0-9])/i

  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:13321 explicitly identifies Meathgra as a leanashe,
    and default:28878 and default:45882 independently call her an ancient
    leanashe; these establish a named creature, not a human person. The
    exact English name occurs in one base key and 18 default keys. Japanese
    ミースグラ and Chinese 米斯格拉 consistently corroborate the established
    Korean 미스그라. Register only monster:meathgra as 미스그라(Meathgra).
    Add the English pair to every unpaired Korean name occurrence in the
    19 exact source keys, preserving already paired occurrences and all
    particles, possessives, pronouns, punctuation, placeholders, and other
    text. The possessive Meathgra's Den rows are occurrences of this
    creature's name, not separate item or place identities. The official
    Korean manual extraction/reference contains no direct Meathgra entry.
    Search covered affix/base/default. No unrelated entity, historical
    disposition, or global tally is reopened or recounted.
  TEXT

  SPEC = {
    key: ENTITY, english: ENGLISH, category: 'monster', korean: CANONICAL,
    variants: '미스그라', count: KEYS.length, notes: NOTE
  }.freeze

  def validate_source!(key, source)
    raise "unreviewed Meathgra key #{key.inspect}" unless KEYS.include?(key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise "English Meathgra evidence differs at #{key.inspect}" unless
      english.match?(ENGLISH_PATTERN)
    raise "Japanese Meathgra evidence differs at #{key.inspect}" unless
      japanese.include?('ミースグラ')
    raise "Chinese Meathgra evidence differs at #{key.inspect}" unless
      chinese.include?('米斯格拉')
    true
  end

  def transform(_spec, key, text, source)
    raise "unreviewed Meathgra key #{key.inspect}" unless KEYS.include?(key)
    validate_source!(key, source)
    expected_count = KOREAN_NAME_COUNTS.fetch(key)
    raise "Korean Meathgra count differs at #{key.inspect}" unless
      text.scan('미스그라').length == expected_count
    raise "unexpected Meathgra parenthetical at #{key.inspect}" if
      text.match?(/미스그라\((?!Meathgra\))/)

    revised = text.gsub(NAME_PATTERN, CANONICAL)
    raise "unpaired Korean Meathgra remains at #{key.inspect}" if
      revised.match?(NAME_PATTERN)
    raise "paired Korean Meathgra count differs at #{key.inspect}" unless
      revised.scan(CANONICAL).length == expected_count
    [revised, false]
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
    raise "Meathgra source scope differs: #{generated_keys.inspect}" unless
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
    edits = reviews.select { |row| row['old'] != row['new'] }
    edits.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(m.csv_path(resource)), rows)
    end
    puts "D-#{D} read-only dry run: #{generated.length} exact Meathgra keys, " \
         "#{edits.length} Texto edits; byte-preserving validation passed; no files changed."
    reviews.each do |row|
      key = [row['resource'], row['ID_Linha'], row['Tipo_Variante']]
      count = row['new'].scan(CANONICAL).length - row['old'].scan(CANONICAL).length
      puts "#{key.join(':')} added bilingual name occurrences=#{count}" if count.positive?
    end
  end

  def apply
    ReviewedDiscoverySpecs.run(
      D, 'Meathgra Named Leanashe', [SPEC], NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['dry-run'] then MeathgraD21683.dry_run
  when ['apply'] then MeathgraD21683.apply
  else abort 'usage: review-meathgra-D21683.rb dry-run|apply'
  end
end
