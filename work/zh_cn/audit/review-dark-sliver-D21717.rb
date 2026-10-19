#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewDarkSliverD21717
  extend self

  M = ReviewedNameBatches
  D = 21_717
  NEXT_D = 21_718
  ENTITY = 'item:dark-sliver'
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  EXPECTED_KEYS = [
    ['base', '1641', '11'],
    ['base', '4493', '11'],
    ['default', '16447', ''],
    ['default', '59908', '']
  ].freeze
  TRANSFORMS = {
    ['base', '1641', '11'] => ['어두운 파편', '어둠의 파편(Dark Sliver)'],
    ['base', '4493', '11'] => ['어둠의 파편', '어둠의 파편(Dark Sliver)'],
    ['default', '16447', ''] => ['다크 슬리버(Dark Sliver)', '어둠의 파편(Dark Sliver)'],
    ['default', '59908', ''] => ['어둠의 조각', '어둠의 파편(Dark Sliver)']
  }.freeze
  SPECS = [
    {
      key: ENTITY,
      english: 'Dark Sliver',
      category: 'item',
      korean: '어둠의 파편(Dark Sliver)',
      variants: '어두운 파편|어둠의 조각|어둠의 파편|다크 슬리버|어둠의 파편(Dark Sliver)',
      count: EXPECTED_KEYS.length,
      notes: <<~TEXT.gsub(/\s+/, ' ').strip
        English identifies Dark Sliver as the proper name of a staff
        (default:16447) and as its standalone item label. Korean 어둠의 파편
        is supported by the established base variant. Japanese
        ダークシルバー and Chinese 暗银/深银 render the phrase closer to
        “Dark Silver”; English is authoritative for Sliver. Standardize all
        four keys as 어둠의 파편(Dark Sliver), preserving the staff context.
      TEXT
    }
  ].freeze
  DETAIL = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Reviewed all four exact English Dark Sliver keys. The aligned context
    identifies it as a named staff; the other keys are its standalone item
    label. Korean 어둠의 파편 is the consistent literal form. Japanese
    ダークシルバー and Chinese 暗银/深银 suggest “Dark Silver,” but English
    explicitly says Sliver and controls the name. Use
    어둠의 파편(Dark Sliver) throughout.
  TEXT

  def key(row)
    M.key(row)
  end

  def english_text(source)
    JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  end

  def source_rows(inventory)
    inventory.values.select do |source|
      english_text(source).match?(/(?<![A-Za-z])Dark Sliver(?![A-Za-z])/i)
    end.sort_by do |source|
      [M::RESOURCES.index(source.fetch('resource')),
       source.fetch('ID_Linha').to_i, source.fetch('Tipo_Variante').to_s]
    end
  end

  def transform(_spec, source_key, text, source)
    raise "English Dark Sliver match missing at #{source_key.inspect}" unless
      english_text(source).match?(/(?<![A-Za-z])Dark Sliver(?![A-Za-z])/i)
    old, replacement = TRANSFORMS.fetch(source_key)
    count = text.scan(old).length
    raise "expected one Dark Sliver label at #{source_key.inspect}, found #{count}" unless
      count == 1
    [text.sub(old, replacement), false]
  end

  def dry_run
    inventory = M.refresh_inventory
    sources = source_rows(inventory)
    raise "Dark Sliver source keys differ: #{sources.map { |row| key(row) }.inspect}" unless
      sources.map { |row| key(row) }.sort == EXPECTED_KEYS.sort
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
    definitions = ReviewDarkSliverD21717.definitions
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
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
         "#{reviews.count { |row| row['old'] != row['new'] }} Texto edits."
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
      D, 'Dark Sliver Staff-Name Consistency', SPECS, DETAIL,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, source_key, text, source| transform(spec, source_key, text, source) }
    candidates = refresh_snapshot
    update_checkpoint(candidates)
    puts "Dark Sliver: #{EXPECTED_KEYS.length} source keys; " \
         "next=D-#{NEXT_D}, bounded candidate groups=#{candidates.length}."
  end
end

ReviewDarkSliverD21717.run if $PROGRAM_NAME == __FILE__
