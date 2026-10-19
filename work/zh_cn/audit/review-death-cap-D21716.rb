#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewDeathCapD21716
  extend self

  M = ReviewedNameBatches
  D = 21_716
  NEXT_D = 21_717
  ENTITY = 'resource:death-cap'
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  EXPECTED_KEYS = [
    ['base', '3066', '11'],
    ['default', '9404', '']
  ].freeze
  TRANSFORMS = {
    ['base', '3066', '11'] => ['죽음갓', '데스 캡(Death Cap)']
  }.freeze
  SPECS = [
    {
      key: ENTITY,
      english: 'Death Cap',
      category: 'resource',
      korean: '데스 캡(Death Cap)',
      variants: '죽음갓|데스 캡|데스 캡(Death Cap)',
      count: EXPECTED_KEYS.length,
      notes: <<~TEXT.gsub(/\s+/, ' ').strip
        English identifies Death Cap as a named resource label. Japanese
        デスキャップ and Chinese 死亡之帽 corroborate the same item.
        Reuse the existing Korean form 데스 캡(Death Cap) and replace the
        inconsistent base label 죽음갓. The official Korean manual has
        alchemy terminology but no direct Death Cap entry.
      TEXT
    }
  ].freeze
  DETAIL = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Reviewed both exact English Death Cap labels in base/default. Japanese
    デスキャップ and Chinese 死亡之帽 align on the named resource.
    Standardize the base label to the already paired default form
    데스 캡(Death Cap); the existing default occurrence remains unchanged.
    The official Korean manual has alchemy terminology but no direct
    Death Cap entry.
  TEXT

  def key(row)
    M.key(row)
  end

  def english_text(source)
    JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  end

  def source_rows(inventory)
    inventory.values.select do |source|
      english_text(source).match?(/(?<![A-Za-z])Death Cap(?![A-Za-z])/i)
    end.sort_by do |source|
      [M::RESOURCES.index(source.fetch('resource')),
       source.fetch('ID_Linha').to_i, source.fetch('Tipo_Variante').to_s]
    end
  end

  def transform(_spec, source_key, text, source)
    raise "English Death Cap match missing at #{source_key.inspect}" unless
      english_text(source).match?(/(?<![A-Za-z])Death Cap(?![A-Za-z])/i)
    change = TRANSFORMS[source_key]
    return [text, false] unless change
    old, replacement = change
    raise "unexpected Korean Death Cap value at #{source_key.inspect}" unless text == old
    [replacement, false]
  end

  def dry_run
    inventory = M.refresh_inventory
    sources = source_rows(inventory)
    raise "Death Cap source count differs: #{sources.length}" unless
      sources.map { |source| key(source) }.sort == EXPECTED_KEYS.sort
    reviews = sources.map do |source|
      source_key = key(source)
      old = source.fetch('work_text')
      revised, = transform(nil, source_key, old, source)
      status = old == revised ? 'not-an-issue' : 'accepted'
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
    definitions = ReviewDeathCapD21716.definitions
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
         "#{reviews.count { |row| row['old'] != row['new'] }} Texto edit."
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
      D, 'Death Cap Resource-Name Consistency', SPECS, DETAIL,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, source_key, text, source| transform(spec, source_key, text, source) }
    candidates = refresh_snapshot
    update_checkpoint(candidates)
    puts "Death Cap: #{EXPECTED_KEYS.length} source keys; " \
         "next=D-#{NEXT_D}, bounded candidate groups=#{candidates.length}."
  end
end

ReviewDeathCapD21716.run if $PROGRAM_NAME == __FILE__
