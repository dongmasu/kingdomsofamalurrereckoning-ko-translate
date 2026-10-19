#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewAwesomeHouseD21714
  extend self

  M = ReviewedNameBatches
  D = 21_714
  NEXT_D = 21_715
  ENTITY = 'place:awesome-house'
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  EXPECTED_KEYS = [
    ['base', '1566', '11'],
    ['base', '2769', '11']
  ].freeze
  TRANSFORMS = {
    ['base', '1566', '11'] => ['어썸 하우스(Awesome House)', '멋진 집(Awesome House)'],
    ['base', '2769', '11'] => ['멋진 집', '멋진 집(Awesome House)']
  }.freeze
  SPECS = [
    {
      key: ENTITY,
      english: 'Awesome House',
      category: 'place',
      korean: '멋진 집(Awesome House)',
      variants: '멋진 집|어썸 하우스|멋진 집(Awesome House)',
      count: EXPECTED_KEYS.length,
      notes: <<~TEXT.gsub(/\s+/, ' ').strip
        English identifies Awesome House as the named residence referenced
        by its matching key label. Japanese 素晴らしい家 and
        素晴らしい家への鍵 and Chinese 惊奇房屋/惊奇的家的钥匙 support
        the literal Korean 멋진 집. Standardize the place and its key label
        as 멋진 집(Awesome House); preserve the key relationship.
      TEXT
    }
  ].freeze
  DETAIL = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Reviewed both exact English Awesome House keys in base: the residence
    label and its key. Japanese 素晴らしい家/素晴らしい家への鍵 and
    Chinese 惊奇房屋/惊奇的家的钥匙 corroborate the meaning. Use the
    natural Korean name 멋진 집(Awesome House) consistently, preserving the
    possessive key relationship and source item structure.
  TEXT

  def key(row)
    M.key(row)
  end

  def english_text(source)
    JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  end

  def source_rows(inventory)
    inventory.values.select do |source|
      english_text(source).match?(/(?<![A-Za-z])Awesome House(?![A-Za-z])/i)
    end.sort_by { |source| source.fetch('ID_Linha').to_i }
  end

  def transform(_spec, source_key, text, source)
    raise "English Awesome House match missing at #{source_key.inspect}" unless
      english_text(source).match?(/(?<![A-Za-z])Awesome House(?![A-Za-z])/i)
    old, replacement = TRANSFORMS.fetch(source_key)
    count = text.scan(old).length
    raise "expected one Korean Awesome House span at #{source_key.inspect}, found #{count}" unless
      count == 1
    [text.sub(old, replacement), false]
  end

  def dry_run
    inventory = M.refresh_inventory
    sources = source_rows(inventory)
    raise "Awesome House source count differs: #{sources.length}" unless
      sources.map { |source| key(source) }.sort == EXPECTED_KEYS.sort
    reviews = sources.map do |source|
      source_key = key(source)
      old = source.fetch('work_text')
      revised, = transform(nil, source_key, old, source)
      {
        'resource' => source_key[0], 'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2], 'entity_key' => ENTITY,
        'status' => old == revised ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => revised,
        'evidence' => "D-#{D}: #{DETAIL}",
        'english' => english_text(source),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
      }
    end
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    definitions = ReviewAwesomeHouseD21714.definitions
    generated = build_occurrences(sources, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    ReviewedProperNameDiscovery.validate!(definitions, reviews, generated,
                                           glossary, index)
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.select { |row| row.fetch('old') != row.fetch('new') }
      .group_by { |row| row.fetch('resource') }.each do |resource, rows|
        ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
      end
    puts "D-#{D} read-only dry run: #{reviews.length} keys; " \
         "#{reviews.count { |row| row.fetch('old') != row.fetch('new') }} Texto edits."
  end

  def definitions
    headers = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers
    SPECS.map do |spec|
      headers.zip([
        spec.fetch(:key), spec.fetch(:english), spec.fetch(:category),
        spec.fetch(:korean), '', spec.fetch(:variants), "D-#{D}",
        'confirmed', spec.fetch(:notes)
      ]).to_h
    end
  end

  def refresh_snapshot
    raise "D-#{D} candidate snapshot already exists" if File.exist?(SNAPSHOT)
    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
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
    ReviewedDiscoverySpecs.run(
      D, 'Awesome House Place-Name Consistency', SPECS, DETAIL,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, source_key, text, source| transform(spec, source_key, text, source) }
    candidates = refresh_snapshot
    update_checkpoint(candidates)
    puts "Awesome House: #{EXPECTED_KEYS.length} source keys; " \
         "next=D-#{NEXT_D}, bounded candidate groups=#{candidates.length}."
  end
end

ReviewAwesomeHouseD21714.run if $PROGRAM_NAME == __FILE__
