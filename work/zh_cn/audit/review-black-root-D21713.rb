#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-short-label-discovery-20261018'

module ReviewBlackRootD21713
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_713
  NEXT_D = 21_714
  ENTITY = 'resource:black-root'
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  GENERIC_ROW = ['default', '40988', ''].freeze
  EXPECTED_KEYS = [
    ['base', '134', '11'],
    ['default', '40988', ''],
    ['default', '60748', '']
  ].freeze
  DEFINITION = {
    'entity_key' => ENTITY,
    'english_canonical' => 'Black Root',
    'category' => 'resource',
    'korean_canonical' => '검은 뿌리(Black Root)',
    'english_aliases' => '',
    'korean_variants' => '검은 뿌리|블랙 루트|검은 뿌리(Black Root)',
    'evidence_ids' => 'D-21713',
    'status' => 'confirmed',
    'notes' => 'The English-aligned base entry is the named alchemy resource Black Root; default:60748 is the same standalone label. Japanese 黒い根っこ and Chinese 黑根/黑色的根 support the literal Korean 검은 뿌리. Standardize the two named labels as 검은 뿌리(Black Root). Keep default:40988, “A mysterious black root,” outside the named-resource scope: its lower-case indefinite description does not establish that it is the titled Black Root item. The official Korean manual has alchemy terminology but no direct Black Root entry.'
  }.freeze
  DETAIL = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Reviewed all three English source matches for Black Root. The base item
    label and capitalized default label refer to the named resource and are
    standardized as 검은 뿌리(Black Root), supported by Japanese 黒い根っこ
    and Chinese 黑根/黑色的根. Exclude default:40988, “A mysterious black
    root,” from the named-resource span because the lower-case indefinite
    phrase does not establish the item title; its Korean sentence remains
    unchanged. The official Korean manual has alchemy terminology but no
    direct Black Root entry.
  TEXT

  TRANSFORMS = {
    ['base', '134', '11'] => ['검은 뿌리', '검은 뿌리(Black Root)'],
    ['default', '60748', ''] => ['블랙 루트(Black Root)', '검은 뿌리(Black Root)']
  }.freeze

  def key(row)
    M.key(row)
  end

  def english_text(source)
    JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  end

  def source_rows(inventory)
    inventory.values.select do |source|
      english_text(source).match?(/(?<![A-Za-z])Black Root(?![A-Za-z])/i)
    end.sort_by do |source|
      [M::RESOURCES.index(source.fetch('resource')),
       source.fetch('ID_Linha').to_i, source.fetch('Tipo_Variante').to_s]
    end
  end

  def definitions(headers = M.table(R::GLOSSARY).headers)
    [DEFINITION.slice(*headers)]
  end

  def transform(_spec, source_key, text, source)
    raise "English Black Root match missing at #{source_key.inspect}" unless
      english_text(source).match?(/(?<![A-Za-z])Black Root(?![A-Za-z])/i)
    return [text, true] if source_key == GENERIC_ROW

    old, replacement = TRANSFORMS.fetch(source_key)
    raise "unexpected Korean Black Root value at #{source_key.inspect}" unless
      text == old
    [replacement, false]
  end

  def build_reviews(sources)
    inventory = sources.to_h { |source| [key(source), source] }
    generated = build_occurrences(sources, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'Black Root source-key coverage differs' unless
      generated.map { |row| key(row) }.sort == EXPECTED_KEYS.sort

    generated.map do |occurrence|
      source_key = key(occurrence)
      source = inventory.fetch(source_key)
      old = source.fetch('work_text')
      revised, excluded = transform(nil, source_key, old, source)
      status = if excluded
                 'excluded'
               elsif old == revised
                 'not-an-issue'
               else
                 'accepted'
               end
      {
        'resource' => source_key[0], 'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2], 'entity_key' => ENTITY,
        'status' => status, 'old' => old, 'new' => revised,
        'evidence' => "D-#{D}: #{DETAIL}",
        'english' => english_text(source),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
  end

  def dry_run
    inventory = M.refresh_inventory
    sources = source_rows(inventory)
    raise "Black Root source count differs: #{sources.length}" unless
      sources.length == EXPECTED_KEYS.length
    reviews = build_reviews(sources)
    glossary = M.table(R::GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    generated = build_occurrences(sources, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    R.validate!(definitions, reviews, generated, glossary, index)
    R.validate_sources!(reviews, inventory)
    reviews.select { |row| row.fetch('old') != row.fetch('new') }
      .group_by { |row| row.fetch('resource') }.each do |resource, rows|
        ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
      end
    counts = reviews.group_by { |row| row.fetch('status') }
      .transform_values(&:length)
    puts "D-#{D} read-only dry run: #{reviews.length} keys; " \
         "#{counts.inspect}; #{TRANSFORMS.length} Texto edits."
  end

  def refresh_snapshot
    raise "D-#{D} candidate snapshot already exists" if File.exist?(SNAPSHOT)
    inventory = M.refresh_inventory
    glossary = M.table(R::GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    candidates = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, candidates)
    candidates
  end

  def update_checkpoint(candidates)
    M::DOCS.each do |path|
      text = File.read(path)
      text.sub!(
        /Next batch: D-#{NEXT_D};.*?\n/,
        "Next batch: D-#{NEXT_D}; continue unreviewed short-label candidates from `proper-name-short-label-discovery-D#{D}.tsv` (#{candidates.length} bounded groups; not exhaustive or a completion estimate).\n"
      )
      File.write(path, text)
    end
  end

  def run
    dry_run
    inventory = M.refresh_inventory
    sources = source_rows(inventory)
    reviews = build_reviews(sources)
    definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
    review_path = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
    raise 'D-21713 output already exists' if [definition_path, review_path].any? { |path| File.exist?(path) }
    M.write_table(definition_path, M.table(R::GLOSSARY).headers, definitions)
    M.write_table(review_path, M::HEADERS, reviews)
    R.run([definition_path, review_path, D.to_s])
    candidates = refresh_snapshot
    update_checkpoint(candidates)
    puts "Black Root: #{reviews.length} keys; " \
         "next=D-#{NEXT_D}, bounded candidate groups=#{candidates.length}."
  end
end

ReviewBlackRootD21713.run if $PROGRAM_NAME == __FILE__
