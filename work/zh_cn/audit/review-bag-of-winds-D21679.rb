#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-proper-name-inventory'

module BagOfWindsD21679
  extend self

  D = 21_679
  ENTITY = 'item:bag-of-winds'
  ENGLISH = 'Bag of Winds'
  CANONICAL = '바람 주머니(Bag of Winds)'
  KEYS = [
    ['base', '1465', '11'],
    *%w[
      10607 15100 32385 37293 45395 51991 52890 53584 55976
      60618 60940 61678 64509
    ].map { |id| ['default', id, ''] }
  ].freeze
  CHINESE_EVIDENCE = {
    ['base', '1465', '11'] => '风之袋',
    ['default', '10607', ''] => '风之袋',
    ['default', '15100', ''] => '风之袋',
    ['default', '32385', ''] => '风之袋',
    ['default', '37293', ''] => '风之袋',
    ['default', '45395', ''] => '风之袋',
    ['default', '51991', ''] => '风之袋',
    ['default', '52890', ''] => '一袋风石',
    ['default', '53584', ''] => '风之袋',
    ['default', '55976', ''] => '风之袋',
    ['default', '60618', ''] => '风之袋',
    ['default', '60940', ''] => '风之袋',
    ['default', '61678', ''] => '风之袋',
    ['default', '64509', ''] => '袋子里的风'
  }.freeze
  OLD_SPANS = {
    ['base', '1465', '11'] => '바람 주머니',
    ['default', '10607', ''] => '바람 주머니',
    ['default', '15100', ''] => '바람의 주머니',
    ['default', '32385', ''] => '바람주머니',
    ['default', '37293', ''] => '바람의 주머니',
    ['default', '45395', ''] => '바람의 주머니',
    ['default', '51991', ''] => '바람의 주머니(bag of winds)',
    ['default', '52890', ''] => '바람 주머니',
    ['default', '53584', ''] => '바람 주머니',
    ['default', '55976', ''] => '바람 주머니',
    ['default', '60618', ''] => '바람의 자루(Bag of Winds)',
    ['default', '60940', ''] => '바람의 자루(Bag of Winds)',
    ['default', '61678', ''] => CANONICAL,
    ['default', '64509', ''] => '바람 주머니'
  }.freeze
  ITEM_SPAN = /(?:바람 주머니|바람주머니|바람의 주머니|바람의 자루)(?:\((?:Bag of Winds|bag of winds)\))?/
  ENGLISH_SPAN = /(?<![A-Za-z])Bag of Winds(?![A-Za-z])/i
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Base:1465 is the standalone Bag of Winds item label; default:52890
    is its theft objective, and default:61678 already uses the complete
    바람 주머니(Bag of Winds) pair. The remaining exact English references
    describe the same guard-carried item used to bypass the Watcher or
    extinguish the torches. Japanese 旋風の袋 consistently corroborates
    that item; Chinese usually uses 风之袋, with source-local variants
    一袋风石 at default:52890 and 袋子里的风 at default:64509. These
    differences do not outweigh the English/Japanese match and established
    Korean pair. Register only item:bag-of-winds; infer no rarity, owner,
    additional mechanics, or relationship to other items. Normalize only
    the one attested Korean item-name span in each of the 14 exact keys.
    Preserve possessives, pronouns, particles, punctuation, line breaks,
    placeholders, all surrounding text, and every other entity's reviewed
    disposition. D-3048 at default:10607 and D-4595 at default:15100 are
    terminal not-an-issue sentence findings; D-10506 at default:32385,
    D-12097 at default:37293, D-13898 at default:45395, and D-16895 at
    default:55976 are prior uncertain sentence findings. They remain
    unchanged: this is a new item-name scope, not a reopening or recount.
    Exact source coverage is one base key and 13 default keys; affix has
    no Bag of Winds hit. No PAK or reference-data inspection is involved.
  TEXT
  SPEC = {
    key: ENTITY, english: ENGLISH, category: 'item', korean: CANONICAL,
    variants: '바람주머니|바람의 주머니|바람의 자루|바람 주머니',
    count: KEYS.length, notes: NOTE
  }.freeze

  def validate_source!(key, source)
    raise "unreviewed Bag of Winds key #{key.inspect}" unless KEYS.include?(key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise "English item label differs at #{key.inspect}" unless
      english.scan(ENGLISH_SPAN).length == 1
    raise "Japanese item label differs at #{key.inspect}" unless
      japanese.scan('旋風の袋').length == 1
    raise "Chinese source differs at #{key.inspect}" unless
      chinese.include?(CHINESE_EVIDENCE.fetch(key))
    true
  end

  def transform(_spec, key, text, source)
    raise "unreviewed Bag of Winds key #{key.inspect}" unless KEYS.include?(key)
    validate_source!(key, source)

    if text.scan(CANONICAL).length == 1
      remaining = text.sub(CANONICAL, '')
      raise "additional unpaired item span at #{key.inspect}" if remaining.match?(ITEM_SPAN)
      return [text, false]
    end

    old = OLD_SPANS.fetch(key)
    raise "expected one exact Korean item span at #{key.inspect}" unless
      text.scan(ITEM_SPAN) == [old]
    [text.sub(old, CANONICAL), false]
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
    inventory = current_inventory
    raise 'incomplete aligned inventory' unless inventory.length == 73_430
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated_keys = generated.map { |row| m.key(row) }.sort
    raise "Bag of Winds source scope differs: #{generated_keys.inspect}" unless
      generated_keys == KEYS.sort

    reviews = generated.map do |occurrence|
      key = m.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      revised, excluded = transform(nil, key, old, source)
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
    puts "D-#{D} read-only dry run: #{generated.length} exact source matches, " \
         "#{edits.length} Texto edits; byte-preserving validation passed; no files changed."
    reviews.each do |row|
      key = [row['resource'], row['ID_Linha'], row['Tipo_Variante']]
      puts "#{key.join(':')} #{OLD_SPANS.fetch(key)} => #{CANONICAL}" \
           "#{row['old'] == row['new'] ? ' (already canonical)' : ''}"
    end
  end

  def apply
    ReviewedDiscoverySpecs.run(
      D, 'Bag of Winds Named Item', [SPEC], NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['dry-run'] then BagOfWindsD21679.dry_run
  when ['apply'] then BagOfWindsD21679.apply
  else abort 'usage: review-bag-of-winds-D21679.rb dry-run|apply'
  end
end
