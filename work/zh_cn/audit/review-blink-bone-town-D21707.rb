#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'run-reviewed-discovery-specs'

module ReviewBlinkBoneTownD21707
  extend self

  M = ReviewedNameBatches
  D = 21_707
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Register Blink as a named combat ability and Bone Town as a named
    settlement. English mechanics and place context establish both identities;
    aligned Japanese and Chinese corroborate. Pair only exact standalone or
    ability references, excluding ordinary "blink" expressions and complete
    Ice Blink/Poison Blink labels. Preserve the independent Bolgan Bane,
    Brownie, and other candidate scopes; no prior translation judgment or
    global tally is reopened or recounted.
  TEXT

  DEFINITIONS = [
    {
      key: 'skill:blink',
      english: 'Blink',
      aliases: '',
      category: 'skill',
      korean: '점멸(Blink)',
      variants: '점멸|점멸 능력|순간이동|블링크',
      count: 21,
      notes: 'English default:62734 defines Blink as a short-range teleport replacing Dodge; default:23171 and 28120 explicitly call it an ability. Japanese ブリンク and Chinese 闪现 corroborate the combat ability. Register the base skill only: ordinary eye-blink expressions and complete Ice Blink/Poison Blink labels are excluded without nested annotations. Reuse 점멸(Blink); add the missing bilingual name only to exact ability references.'
    },
    {
      key: 'place:bone-town',
      english: 'Bone Town',
      aliases: '',
      category: 'place',
      korean: '본 타운(Bone Town)',
      variants: '본 타운|뼈의 마을',
      count: 6,
      notes: 'English default:50 calls Bone Town a place; default:58643 explains the pale rocks and high death rate behind its name, and default:56489 describes its residents and condition. Japanese ボーン・タウン and Chinese 白骨镇 corroborate the settlement. Use the established phonetic 본 타운(Bone Town), preserving the source explanation and all other wording.'
    }
  ].freeze

  BLINK_ABILITY_KEYS = %w[
    531 7706 15368 23171 28120 32495 46983 62734
  ].map { |id| ['default', id, ''] }.to_set.freeze

  BLINK_EXCLUDED_KEYS = %w[
    435 3439 11290 19384 24952 37655 40934 41122 45055 45141 46846
    47529 50802
  ].map { |id| ['default', id, ''] }.to_set.freeze

  TRANSFORMS = {
    ['default', '531', ''] => ['점멸', '점멸(Blink)'],
    ['default', '7706', ''] => ['점멸로', '점멸(Blink)으로'],
    ['default', '15368', ''] => [
      '전투 중 순간이동하고',
      '전투 중 점멸(Blink)을 사용해 이동하고'
    ],
    ['default', '28120', ''] => ['점멸 능력에', '점멸(Blink) 능력에'],
    ['default', '32495', ''] => ['점멸로 마나', '점멸(Blink)으로 마나'],
    ['default', '46983', ''] => ['점멸을 해금', '점멸(Blink)을 해금'],
    ['default', '6479', ''] => ['본 타운', '본 타운(Bone Town)'],
    ['default', '30276', ''] => ['본 타운', '본 타운(Bone Town)'],
    ['default', '56489', ''] => ['본 타운', '본 타운(Bone Town)'],
    ['default', '58643', ''] => ['뼈의 마을', '본 타운(Bone Town)'],
    ['default', '63389', ''] => ['본 타운', '본 타운(Bone Town)']
  }.freeze

  def definitions
    DEFINITIONS.map do |spec|
      spec.slice(:key, :english, :aliases, :category, :korean, :variants, :count, :notes)
    end
  end

  def occurrence_definitions
    DEFINITIONS.map do |spec|
      {
        'entity_key' => spec.fetch(:key),
        'english_canonical' => spec.fetch(:english),
        'english_aliases' => spec.fetch(:aliases)
      }
    end
  end

  def transform(spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    phrase = Regexp.escape(spec.fetch(:english))
    raise "English source term missing at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])#{phrase}(?![A-Za-z])/i)

    if spec.fetch(:key) == 'skill:blink'
      return [text, true] if BLINK_EXCLUDED_KEYS.include?(key)
      raise "unclassified Blink key #{key.inspect}" unless BLINK_ABILITY_KEYS.include?(key)
    end

    edit = TRANSFORMS[key]
    return [text, false] unless edit

    old, revised = edit
    raise "Korean source span differs at #{key.inspect}" unless text.scan(old).length == 1

    [text.sub(old, revised), false]
  end

  def dry_run
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, occurrence_definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    counts = generated.group_by { |row| row.fetch('entity_key') }.transform_values(&:length)
    expected = DEFINITIONS.to_h { |spec| [spec.fetch(:key), spec.fetch(:count)] }
    raise "source coverage differs: #{counts.inspect}" unless counts == expected

    blink_keys = generated.select { |row| row.fetch('entity_key') == 'skill:blink' }
      .map { |row| M.key(row) }.to_set
    raise 'Blink disposition coverage differs' unless
      blink_keys == BLINK_ABILITY_KEYS | BLINK_EXCLUDED_KEYS
    raise 'Blink targets overlap exclusions' unless
      (BLINK_ABILITY_KEYS & BLINK_EXCLUDED_KEYS).empty?

    changes = generated.count do |row|
      key = M.key(row)
      source = inventory.fetch(key)
      revised, = transform(
        DEFINITIONS.find { |spec| spec.fetch(:key) == row.fetch('entity_key') },
        key, source.fetch('work_text'), source
      )
      revised != source.fetch('work_text')
    end
    raise "expected 11 Texto edits, found #{changes}" unless changes == 11
    raise "scope exceeds 50 distinct keys: #{generated.map { |row| M.key(row) }.uniq.length}" if
      generated.map { |row| M.key(row) }.uniq.length > 50

    puts "D-#{D} read-only dry run: #{generated.length} source keys; " \
         "#{counts.inspect}; #{changes} Texto edits; " \
         "#{BLINK_EXCLUDED_KEYS.length} generic/compound Blink exclusions."
  end

  def run
    dry_run
    ReviewedDiscoverySpecs.run(
      D, 'Blink Ability And Bone Town',
      definitions, NOTE, '<!-- current-proper-name-batch:start -->'
    ) { |spec, key, text, source| transform(spec, key, text, source) }
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['dry-run'] then ReviewBlinkBoneTownD21707.dry_run
  when ['apply'] then ReviewBlinkBoneTownD21707.run
  else abort 'usage: review-blink-bone-town-D21707.rb dry-run|apply'
  end
end
