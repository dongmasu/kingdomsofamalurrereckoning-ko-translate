#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-proper-name-inventory'

module LlyfarstairD21685
  extend self

  D = 21_685
  ENTITY = 'named work:llyfarstair'
  ENGLISH = 'Llyfarstair'
  CANONICAL = '리파르스테어(Llyfarstair)'
  KEYS = [
    ['base', '308', '11'],
    ['base', '3298', '11'],
    ['base', '4215', '11'],
    ['base', '4484', '11'],
    ['default', '33628', '']
  ].freeze
  TITLES = {
    ['base', '308', '11'] => {
      english: 'Llyfarstair III', japanese: 'ルリファーステアIII',
      chinese: '莉法斯塔尔III', old: '릴리퍼스테어(Llyfarstair) III',
      new: '리파르스테어 III(Llyfarstair III)'
    },
    ['base', '3298', '11'] => {
      english: 'Llyfarstair I', japanese: 'ルリファーステアI',
      chinese: '莉法斯塔尔I', old: '리파스테어(Llyfarstair) I',
      new: '리파르스테어 I(Llyfarstair I)'
    },
    ['base', '4215', '11'] => {
      english: 'Llyfarstair II', japanese: 'ルリファーステアII',
      chinese: '莉法斯塔尔II', old: '리파스테어(Llyfarstair) II',
      new: '리파르스테어 II(Llyfarstair II)'
    },
    ['base', '4484', '11'] => {
      english: 'Llyfarstair IV', japanese: 'ルリファーステアIV',
      chinese: '莉法斯塔尔IV', old: '리파스테어(Llyfarstair) IV',
      new: '리파르스테어 IV(Llyfarstair IV)'
    }
  }.freeze
  DEFAULT_KEY = ['default', '33628', ''].freeze
  DEFAULT_ENGLISH = 'For a more complete history of the Dokkalfar, read the Llyfarstair by Ormend of Rathir.'
  DEFAULT_OLD = '『리파르스테어』'
  DEFAULT_NEW = '『리파르스테어(Llyfarstair)』'

  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:33628 explicitly identifies the Llyfarstair as a
    named book written by Ormend of Rathir. The four exact base labels
    Llyfarstair I-IV are its numbered volume titles. Japanese
    ルリファーステアI-IV and Chinese 莉法斯塔尔I-IV corroborate the
    title stem; the default narrative's aligned Japanese ルリファーステア
    and Chinese 《利法斯泰尔》 identify the same work. Reuse the established
    Korean narrative form 리파르스테어 and standardize the four volume
    labels to atomic full-title pairs such as 리파르스테어 III
    (Llyfarstair III). Do not infer further authorship, publication history,
    or relationships beyond the explicit sentence. Preserve all chapter
    text, roman numerals, quotes, names, placeholders, line breaks, and
    unrelated dispositions. Exact coverage is four base keys and one
    default key; affix has no hit. The official Korean manual
    extraction/reference has no direct Llyfarstair entry.
  TEXT

  SPEC = {
    key: ENTITY, english: ENGLISH, category: 'named work',
    korean: CANONICAL, variants: '릴리퍼스테어|리파스테어|리파르스테어',
    count: KEYS.length, notes: NOTE
  }.freeze
  ENGLISH_PATTERN = /(?<![A-Za-z0-9])Llyfarstair(?![A-Za-z0-9])/i

  def validate_source!(key, source)
    raise "unreviewed Llyfarstair key #{key.inspect}" unless KEYS.include?(key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')

    if TITLES.key?(key)
      expected = TITLES.fetch(key)
      raise "English volume title differs at #{key.inspect}" unless
        english == expected.fetch(:english)
      raise "Japanese volume title differs at #{key.inspect}" unless
        japanese == expected.fetch(:japanese)
      raise "Chinese volume title differs at #{key.inspect}" unless
        chinese == expected.fetch(:chinese)
    else
      raise 'English book reference differs' unless english.include?(DEFAULT_ENGLISH)
      raise 'Japanese book title evidence differs' unless japanese.include?('ルリファーステア')
      raise 'Chinese book title evidence differs' unless chinese.include?('《利法斯泰尔》')
    end
    true
  end

  def transform(_spec, key, text, source)
    raise "unreviewed Llyfarstair key #{key.inspect}" unless KEYS.include?(key)
    validate_source!(key, source)

    if TITLES.key?(key)
      expected = TITLES.fetch(key)
      old = expected.fetch(:old)
      revised = expected.fetch(:new)
    else
      old = DEFAULT_OLD
      revised = DEFAULT_NEW
    end
    raise "Korean Llyfarstair span differs at #{key.inspect}" unless
      text.scan(old).length == 1
    [text.sub(old, revised), false]
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
    raise "Llyfarstair source scope differs: #{generated_keys.inspect}" unless
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
    puts "D-#{D} read-only dry run: #{generated.length} exact Llyfarstair keys, " \
         "#{edits.length} Texto edits; byte-preserving validation passed; no files changed."
    reviews.each do |row|
      key = [row['resource'], row['ID_Linha'], row['Tipo_Variante']]
      puts "#{key.join(':')} #{row['old'].scan(/리파[가-힣]+(?:\(Llyfarstair[^)]*\))?/).join(' | ')}"
    end
  end

  def apply
    ReviewedDiscoverySpecs.run(
      D, 'Llyfarstair Named Book And Numbered Volumes', [SPEC], NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['dry-run'] then LlyfarstairD21685.dry_run
  when ['apply'] then LlyfarstairD21685.apply
  else abort 'usage: review-llyfarstair-D21685.rb dry-run|apply'
  end
end
