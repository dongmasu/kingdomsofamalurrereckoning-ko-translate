#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewBrownieSpeciesD21709
  extend self

  M = ReviewedNameBatches
  D = 21_709
  ENTITY = 'monster:brownie'
  NEXT_D = 21_710
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{NEXT_D}.tsv")
  EXCLUDED = [
    ['base', '1489', '11'],
    *%w[8480 25694 36203 37398 61861].map { |id| ['default', id, ''] }
  ].to_set.freeze
  ALL_KEYS = 73
  DIRECT_SPECIES_KEYS = 67

  SPECS = [
    {
      key: ENTITY,
      english: 'Brownie',
      category: 'monster',
      korean: '브라우니(Brownie)',
      aliases: 'Brownies',
      variants: '브라우니|브라우니(Brownies)|브라우니들|브라우니 무리',
      count: ALL_KEYS,
      notes: <<~TEXT.gsub(/\s+/, ' ').strip
        English identifies Brownie/Brownies as a recurring creature species:
        it is described as ferocious in groups, having teeth, being trained
        as a pet, and explicitly as monsters. Japanese ブラウニー and Chinese
        棕矮妖 support the same creature in all 73 exact source keys. Register
        the species as monster:brownie and use 브라우니(Brownie) or
        브라우니(Brownies) according to the English number. Six exact strings
        are excluded from the species span: Door to Brownie, the previously
        uncertain Brownie sauce (D-2378), Brownie's Bite (D-8416), the
        separately registered Pestilent Brownie subtype, and the two
        separately registered The Brownie Den title rows. Those existing
        findings and all other row/entity dispositions are preserved.
        The official Korean manual has no direct Brownie entry.
      TEXT
    }
  ].freeze

  DETAIL = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    The exact corpus scan found 73 Brownie/Brownies source keys across
    base/default. Sixty-seven direct species references are registered and
    standardized as Korean (English). The 73 source keys are reviewed in
    bounded batches of 50 and 23 (D-21709 and D-21710). Six compound or
    unresolved source forms are
    explicitly excluded from the species span, preserving their independent
    histories. English controls identity and number; all 73 aligned Japanese
    and Chinese rows corroborate. No prior terminal key or historical tally
    was reopened or recounted.
  TEXT

  def key(row)
    M.key(row)
  end

  def english_text(source)
    JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  end

  def matching?(source)
    english_text(source).match?(/(?<![A-Za-z])Brownies?(?![A-Za-z])/i)
  end

  def source_rows(inventory)
    inventory.values.select { |source| matching?(source) }
      .sort_by { |source| [M::RESOURCES.index(source.fetch('resource')),
                           source.fetch('ID_Linha').to_i,
                           source.fetch('Tipo_Variante').to_s] }
  end

  def validate_source!(source)
    english = english_text(source)
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise "English Brownie match missing at #{key(source).inspect}" unless
      english.match?(/(?<![A-Za-z])Brownies?(?![A-Za-z])/i)
    raise "Japanese Brownie corroboration missing at #{key(source).inspect}" unless
      japanese.include?('ブラウニー')
    raise "Chinese Brownie corroboration missing at #{key(source).inspect}" unless
      chinese.include?('棕矮妖')
  end

  def transform(_spec, source_key, text, source)
    validate_source!(source)
    return [text, true] if EXCLUDED.include?(source_key)

    english = english_text(source)
    form = english.match?(/(?<![A-Za-z])Brownies(?![A-Za-z])/i) ?
      'Brownies' : 'Brownie'
    revised = text.gsub(/브라우니(?:\((?:Brownies?)\))?/) do
      "브라우니(#{form})"
    end
    raise "Korean Brownie span missing at #{source_key.inspect}" if revised == text &&
      !text.include?("브라우니(#{form})")
    [revised, false]
  end

  def definitions
    headers = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers
    SPECS.map do |spec|
      headers.zip([
        spec.fetch(:key), spec.fetch(:english), spec.fetch(:category),
        spec.fetch(:korean), spec.fetch(:aliases), spec.fetch(:variants),
        "D-#{D}", 'confirmed', spec.fetch(:notes)
      ]).to_h
    end
  end

  def build_reviews(sources)
    inventory = sources.to_h { |source| [key(source), source] }
    generated = build_occurrences(sources, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "generated Brownie occurrence count differs: #{generated.length}" unless
      generated.length == ALL_KEYS

    generated.group_by { |row| key(row) }.map do |source_key, occurrences|
      source = inventory.fetch(source_key)
      old = source.fetch('work_text')
      revised = old.dup
      dispositions = {}
      occurrences.each do |occurrence|
        revised, excluded = transform(nil, source_key, revised, source)
        dispositions[occurrence.fetch('entity_key')] = excluded ? 'excluded' : nil
      end
      status = if dispositions.values.all?
                 'excluded'
               elsif old == revised
                 'not-an-issue'
               else
                 'accepted'
               end
      dispositions.transform_values! { |value| value || status }
      {
        'resource' => source_key[0], 'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2],
        'entity_key' => dispositions.keys.join('|'), 'status' => status,
        'old' => old, 'new' => revised,
        'evidence' => "D-#{D}: #{DETAIL}",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row.fetch('Tipo_Variante')]
    end
  end

  def dry_run
    inventory = M.refresh_inventory
    sources = source_rows(inventory)
    raise "Brownie source-key count differs: #{sources.length}" unless
      sources.length == ALL_KEYS
    sources.each { |source| validate_source!(source) }
    raise 'expected six explicit Brownie compound/hold exclusions' unless
      EXCLUDED.length == 6 && (EXCLUDED - sources.map { |row| key(row) }.to_set).empty?

    definitions_to_add = definitions
    reviews = build_reviews(sources)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    ReviewedProperNameDiscovery.validate!(
      definitions_to_add, reviews, build_occurrences(sources, definitions_to_add).map do |values|
        OCCURRENCE_HEADERS.zip(values).to_h
      end, glossary, index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    edits = reviews.select { |row| row.fetch('old') != row.fetch('new') }
    raise 'Brownie source keys do not split into 50 and 23' unless
      reviews.each_slice(50).map(&:length) == [50, 23]
    edits.group_by { |row| row.fetch('resource') }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
    end
    status_counts = reviews.group_by { |row| row.fetch('status') }
      .transform_values(&:length)
    puts "D-#{D} read-only dry run: #{reviews.length} keys; " \
         "#{DIRECT_SPECIES_KEYS} species references; #{EXCLUDED.length} exclusions; " \
         "#{edits.length} Texto edits; #{status_counts.inspect}; split 50+23."
  end

  def refresh_candidate_snapshot
    raise "D-#{NEXT_D} short-label snapshot already exists" if File.exist?(SNAPSHOT)
    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    candidates = ShortLabelDiscovery20261018.build(
      inventory.values, glossary, index
    )
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, candidates)
    candidates
  end

  def update_checkpoint(candidates)
    note = <<~TEXT

      ## D-#{NEXT_D}: Brownie Species Follow-up And Candidate Refresh

      Completed the 23-source-key second half: 22 direct species references
      and one explicit exclusion.
      Refreshed bounded short-label snapshot:
      `proper-name-short-label-discovery-D#{NEXT_D}.tsv`
      (#{candidates.length} groups; not exhaustive and not a completion estimate).
      Continue discovery from that snapshot while preserving its explicit
      holds and existing terminal decisions.
    TEXT
    M::DOCS.each do |path|
      text = File.read(path)
      text.sub!(
        /Next batch: D-#{NEXT_D + 1};.*?\n/,
        "Next batch: D-#{NEXT_D + 1}; continue unreviewed short-label candidates from `proper-name-short-label-discovery-D#{NEXT_D}.tsv` (#{candidates.length} bounded groups; not exhaustive or a completion estimate).\n"
      )
      File.write(path, text)
    end
    [File.join(M::AUDIT, 'README.md'),
     File.join(M::AUDIT, 'decision-register-20261009.md')].each do |path|
      File.open(path, 'a') { |file| file.write(note) }
    end
    [D, NEXT_D].each do |batch|
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
    inventory = M.refresh_inventory
    sources = source_rows(inventory)
    raise "Brownie source-key count differs: #{sources.length}" unless
      sources.length == ALL_KEYS
    sources.each { |source| validate_source!(source) }
    raise 'Brownie batch boundary differs' unless
      sources.length - EXCLUDED.length == DIRECT_SPECIES_KEYS &&
      sources.first(DIRECT_SPECIES_KEYS).length == DIRECT_SPECIES_KEYS

    ReviewedDiscoverySpecs.run(
      D, 'Brownie Species And Bilingual Consistency', SPECS, DETAIL,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, source_key, text, source| transform(spec, source_key, text, source) }

    candidates = refresh_candidate_snapshot
    update_checkpoint(candidates)
    puts "Brownie species: #{DIRECT_SPECIES_KEYS} reviewed rows, " \
         "#{EXCLUDED.length} explicit exclusions; next=D-#{NEXT_D + 1}, " \
         "bounded candidate groups=#{candidates.length}."
  end
end

ReviewBrownieSpeciesD21709.run if $PROGRAM_NAME == __FILE__
