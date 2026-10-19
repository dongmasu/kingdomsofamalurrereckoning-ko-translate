#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewCorthisD21711
  extend self

  M = ReviewedNameBatches
  D = 21_711
  NEXT_D = 21_712
  ENTITY = 'place:corthis'
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  EXPECTED_KEYS = [
    ['default', '13196', ''],
    ['default', '13673', ''],
    ['default', '15476', ''],
    ['default', '30623', ''],
    ['default', '62839', '']
  ].freeze

  SPECS = [
    {
      key: ENTITY,
      english: 'Corthis',
      category: 'place',
      korean: '코르티스(Corthis)',
      variants: '코르티스|코르시스|코르티스(Corthis)',
      count: EXPECTED_KEYS.length,
      notes: <<~TEXT.gsub(/\s+/, ' ').strip
        English identifies Corthis as a named place: the Fist of Corthis is
        described as an island, and Gornak and the Butcher are identified by
        their relation to Corthis. Japanese コーディス/コルシス and Chinese
        克塞思/克塞斯 corroborate the place name while showing locale
        transcription variation. Standardize the Korean place component as
        코르티스(Corthis); retain complete source titles and all unrelated
        wording. The official Korean manual has no direct Corthis entry.
      TEXT
    }
  ].freeze

  DETAIL = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Reviewed all five exact English Corthis source keys in default. English
    contexts identify the Fist of Corthis as an island and use Corthis in
    related geographic labels. Japanese コーディス/コルシス and Chinese
    克塞思/克塞斯 were compared as corroboration, not as competing English
    authorities. Reuse 코르티스(Corthis), preserving complete bilingual
    phrases and all unrelated names. No prior terminal key or historical
    total was reopened or recounted.
  TEXT

  TRANSFORMS = {
    ['default', '13673', ''] => ['코르시스(Corthis)', '코르티스(Corthis)'],
    ['default', '15476', ''] => ['코르티스', '코르티스(Corthis)'],
    ['default', '30623', ''] => ['코르티스의 고르낙', '코르티스(Corthis)의 고르낙'],
    ['default', '62839', ''] => ['코르티스의 도살자', '코르티스(Corthis)의 도살자']
  }.freeze

  def key(row)
    M.key(row)
  end

  def english_text(source)
    JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  end

  def source_rows(inventory)
    inventory.values.select do |source|
      english_text(source).match?(/(?<![A-Za-z])Corthis(?![A-Za-z])/i)
    end.sort_by { |source| source.fetch('ID_Linha').to_i }
  end

  def transform(_spec, source_key, text, source)
    english = english_text(source)
    raise "English Corthis source missing at #{source_key.inspect}" unless
      english.match?(/(?<![A-Za-z])Corthis(?![A-Za-z])/i)

    change = TRANSFORMS[source_key]
    return [text, false] unless change

    old, replacement = change
    count = text.scan(old).length
    raise "expected one Korean Corthis span at #{source_key.inspect}, found #{count}" unless
      count == 1

    [text.sub(old, replacement), false]
  end

  def build_reviews(sources)
    inventory = sources.to_h { |source| [key(source), source] }
    generated = build_occurrences(sources, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    counts = generated.group_by { |row| row.fetch('entity_key') }
      .transform_values(&:length)
    raise "Corthis source-key coverage differs: #{counts.inspect}" unless
      counts == { ENTITY => EXPECTED_KEYS.length }
    raise 'Corthis source keys changed' unless
      generated.map { |row| key(row) }.sort == EXPECTED_KEYS.sort

    generated.map do |occurrence|
      source_key = key(occurrence)
      source = inventory.fetch(source_key)
      old = source.fetch('work_text')
      revised, excluded = transform(nil, source_key, old, source)
      raise 'Corthis scope unexpectedly excluded a source key' if excluded
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
    end.sort_by { |row| row.fetch('ID_Linha').to_i }
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

  def dry_run
    inventory = M.refresh_inventory
    sources = source_rows(inventory)
    raise "Corthis source-key count differs: #{sources.length}" unless
      sources.length == EXPECTED_KEYS.length
    sources.each do |source|
      raise "missing Japanese evidence at #{key(source).inspect}" if
        JSON.parse(source.fetch('ja_texts_json')).compact.join.strip.empty?
      raise "missing Chinese evidence at #{key(source).inspect}" if
        source.fetch('zh_text').strip.empty?
    end

    reviews = build_reviews(sources)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    generated = build_occurrences(sources, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    ReviewedProperNameDiscovery.validate!(definitions, reviews, generated,
                                           glossary, index)
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    edits = reviews.select { |row| row.fetch('old') != row.fetch('new') }
    edits.group_by { |row| row.fetch('resource') }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
    end
    counts = reviews.group_by { |row| row.fetch('status') }
      .transform_values(&:length)
    puts "D-#{D} read-only dry run: #{reviews.length} keys; " \
         "#{edits.length} Texto edits; #{counts.inspect}."
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
    note = <<~TEXT

      ## D-#{D}: Corthis Place-Name Consistency

      Reviewed all five exact English source keys and standardized four Korean
      place-name components to `코르티스(Corthis)`. The already complete
      `Fist of Corthis` label was retained. Japanese and Chinese corroboration
      was recorded per row; no prior terminal key or tally was reopened.
      Refreshed short-label snapshot: `proper-name-short-label-discovery-D#{D}.tsv`
      (#{candidates.length} bounded groups; not exhaustive or a completion estimate).
      Full proper-name discovery remains incomplete.
    TEXT
    [M::DOCS.fetch(2), M::DOCS.fetch(3)].each do |path|
      File.open(path, 'a') { |file| file.write(note) }
    end
    [D].each do |batch|
      %W[
        named-scope-review-D#{batch}-#{M::RUN_DATE_COMPACT}.md
        named-scope-edit-addendum-D#{batch}-#{M::RUN_DATE_COMPACT}.md
      ].each do |name|
        File.open(File.join(M::AUDIT, name), 'a') { |file| file.write(note) }
      end
    end
  end

  def run
    dry_run
    ReviewedDiscoverySpecs.run(
      D, 'Corthis Place-Name Consistency', SPECS, DETAIL,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, source_key, text, source| transform(spec, source_key, text, source) }
    candidates = refresh_snapshot
    update_checkpoint(candidates)
    puts "Corthis: #{EXPECTED_KEYS.length} source keys; " \
         "next=D-#{NEXT_D}, bounded candidate groups=#{candidates.length}."
  end
end

ReviewCorthisD21711.run if $PROGRAM_NAME == __FILE__
