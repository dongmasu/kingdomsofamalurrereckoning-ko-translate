#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-proper-name-inventory'

module AbblierD21684
  extend self

  D = 21_684
  ENTITY = 'person:abblier'
  ENGLISH = 'Abblier'
  ALIAS = 'Abblier the Addled'
  CANONICAL = '아블리에(Abblier)'
  ALIAS_CANONICAL = '얼빠진 아블리에(Abblier the Addled)'
  KEYS = %w[
    3056 20249 22215 27210 32317 32356 32831 38329 41901
    45211 46425 49602 64630
  ].map { |id| ['default', id, ''] }.freeze
  OLD_TEXTS = {
    ['default', '3056', ''] => ['아블리에', CANONICAL],
    ['default', '20249', ''] => ['아블리에', CANONICAL],
    ['default', '22215', ''] => [CANONICAL, CANONICAL],
    ['default', '27210', ''] => ['애블리어(Abblier)', CANONICAL],
    ['default', '32317', ''] => ['아블리에', CANONICAL],
    ['default', '32356', ''] => ['애블리어', CANONICAL],
    ['default', '32831', ''] => ['아블리에', CANONICAL],
    ['default', '38329', ''] => ['애블리어(Abblier)', CANONICAL],
    ['default', '41901', ''] => ['얼빠진 아블리에', ALIAS_CANONICAL],
    ['default', '45211', ''] => ['아블리에', CANONICAL],
    ['default', '46425', ''] => ['아블리에', CANONICAL],
    ['default', '49602', ''] => ['애블리어', CANONICAL],
    ['default', '64630', ''] => ['아블리에', CANONICAL]
  }.freeze

  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:27210 explicitly identifies Abblier as a man;
    default:32831 and the aligned petition-board dialogue identify him
    as the Hospitalis Quarters board custodian, and default:64630 confirms
    his death. The exact name occurs in 13 default keys. Japanese アブリア
    and Chinese 阿比利尔 corroborate the localized name; default:22215
    retains English in both supporting locales. Standardize the established
    majority Korean form to 아블리에(Abblier), correcting 애블리어 only in
    this exact person scope. At default:41901, English Abblier the Addled
    and aligned Japanese/Chinese identify the same person's epithet; use
    얼빠진 아블리에(Abblier the Addled), not a second person. Register only
    person:abblier with the full epithet as an English alias. Preserve every
    role, title, particle, surrounding name, line break, placeholder, and
    unrelated entity disposition. The official Korean manual
    extraction/reference has no direct Abblier entry. Search covered
    affix/base/default. No historical finding or global tally is reopened
    or recounted.
  TEXT

  SPEC = {
    key: ENTITY, english: ENGLISH, category: 'person', korean: CANONICAL,
    aliases: ALIAS, variants: '애블리어|아블리에|얼빠진 아블리에',
    count: KEYS.length, notes: NOTE
  }.freeze
  ENGLISH_PATTERN = /(?<![A-Za-z0-9])Abblier(?![A-Za-z0-9])/i

  def validate_source!(key, source)
    raise "unreviewed Abblier key #{key.inspect}" unless KEYS.include?(key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise "English Abblier evidence differs at #{key.inspect}" unless
      english.match?(ENGLISH_PATTERN)

    if key == ['default', '41901', '']
      raise 'English Abblier epithet differs' unless english == ALIAS
      raise 'Japanese epithet evidence differs' unless japanese.include?('ぼんやり屋のアブリア')
      raise 'Chinese epithet evidence differs' unless chinese.include?('混乱的阿比利尔')
    elsif key == ['default', '22215', '']
      raise 'English-only aligned name label differs' unless
        japanese == ENGLISH && chinese == ENGLISH
    else
      raise "Japanese Abblier evidence differs at #{key.inspect}" unless
        japanese.include?('アブリア')
      raise "Chinese Abblier evidence differs at #{key.inspect}" unless
        chinese.include?('阿比利尔')
    end
    true
  end

  def transform(_spec, key, text, source)
    raise "unreviewed Abblier key #{key.inspect}" unless KEYS.include?(key)
    validate_source!(key, source)
    old, revised = OLD_TEXTS.fetch(key)
    raise "Korean Abblier span differs at #{key.inspect}" unless
      text.scan(old).length == 1
    raise "unexpected alternate Abblier form at #{key.inspect}" if
      text.match?(/(?:아블리에|애블리어|얼빠진 아블리에)/) && !text.include?(old)
    [text.sub(old, revised), false]
  end

  def definition
    headers = ReviewedNameBatches.table(ReviewedProperNameDiscovery::GLOSSARY).headers
    headers.zip([
      SPEC[:key], SPEC[:english], SPEC[:category], SPEC[:korean], SPEC[:aliases],
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
    raise "Abblier source scope differs: #{generated_keys.inspect}" unless
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
    puts "D-#{D} read-only dry run: #{generated.length} exact Abblier keys, " \
         "#{edits.length} Texto edits; byte-preserving validation passed; no files changed."
    reviews.each do |row|
      key = [row['resource'], row['ID_Linha'], row['Tipo_Variante']]
      puts "#{key.join(':')} #{OLD_TEXTS.fetch(key).first} => #{OLD_TEXTS.fetch(key).last}" \
           "#{row['old'] == row['new'] ? ' (already canonical)' : ''}"
    end
  end

  def apply
    ReviewedDiscoverySpecs.run(
      D, 'Abblier Named Person And Epithet', [SPEC], NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['dry-run'] then AbblierD21684.dry_run
  when ['apply'] then AbblierD21684.apply
  else abort 'usage: review-abblier-D21684.rb dry-run|apply'
  end
end
