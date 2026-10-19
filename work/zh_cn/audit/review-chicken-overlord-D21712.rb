#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewChickenOverlordD21712
  extend self

  M = ReviewedNameBatches
  D = 21_712
  NEXT_D = 21_713
  ENTITY = 'monster:chicken-overlord'
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  EXPECTED_KEYS = [
    ['default', '11055', ''],
    ['default', '20002', '']
  ].freeze
  TRANSFORMS = {
    ['default', '11055', ''] => ['닭 대군주(Chicken Overlord)', '치킨 오버로드(Chicken Overlord)'],
    ['default', '20002', ''] => ['치킨 오버로드', '치킨 오버로드(Chicken Overlord)']
  }.freeze
  SPECS = [
    {
      key: ENTITY,
      english: 'Chicken Overlord',
      category: 'monster',
      korean: '치킨 오버로드(Chicken Overlord)',
      variants: '닭 대군주|치킨 오버로드|치킨 오버로드(Chicken Overlord)',
      count: EXPECTED_KEYS.length,
      notes: <<~TEXT.gsub(/\s+/, ' ').strip
        English identifies the Chicken Overlord as the singular enemy named
        in its standalone label and attack objective. Japanese チキン・
        オーバーロード and Chinese 鸡领主 corroborate the same monster.
        Standardize the Korean name as 치킨 오버로드(Chicken Overlord);
        do not infer a broader species or additional lore.
      TEXT
    }
  ].freeze
  DETAIL = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Reviewed both exact English Chicken Overlord source keys: the standalone
    enemy label and its attack objective. Japanese チキン・オーバーロード
    and Chinese 鸡领主 corroborate. Normalize the inconsistent Korean
    translations to 치킨 오버로드(Chicken Overlord), preserving the attack
    objective and all surrounding text.
  TEXT

  def key(row)
    M.key(row)
  end

  def english_text(source)
    JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  end

  def source_rows(inventory)
    inventory.values.select do |source|
      english_text(source).match?(/(?<![A-Za-z])Chicken Overlord(?![A-Za-z])/i)
    end.sort_by { |source| source.fetch('ID_Linha').to_i }
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

  def transform(_spec, source_key, text, source)
    raise "English source mismatch at #{source_key.inspect}" unless
      english_text(source).match?(/(?<![A-Za-z])Chicken Overlord(?![A-Za-z])/i)
    old, replacement = TRANSFORMS.fetch(source_key)
    count = text.scan(old).length
    raise "expected one Korean Chicken Overlord span at #{source_key.inspect}, found #{count}" unless
      count == 1
    [text.sub(old, replacement), false]
  end

  def build_reviews(sources)
    inventory = sources.to_h { |source| [key(source), source] }
    generated = build_occurrences(sources, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'Chicken Overlord source-key coverage differs' unless
      generated.map { |row| key(row) }.sort == EXPECTED_KEYS.sort

    generated.map do |occurrence|
      source_key = key(occurrence)
      source = inventory.fetch(source_key)
      old = source.fetch('work_text')
      revised, excluded = transform(nil, source_key, old, source)
      raise 'unexpected Chicken Overlord exclusion' if excluded
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
  end

  def dry_run
    inventory = M.refresh_inventory
    sources = source_rows(inventory)
    raise "Chicken Overlord source count differs: #{sources.length}" unless
      sources.length == EXPECTED_KEYS.length
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
    puts "D-#{D} read-only dry run: #{reviews.length} keys; " \
         "#{edits.length} Texto edits."
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

      ## D-#{D}: Chicken Overlord Name Consistency

      Reviewed both exact source keys and standardized the standalone enemy
      label and attack objective as `치킨 오버로드(Chicken Overlord)`.
      Japanese and Chinese corroboration is recorded in the source manifest.
      Refreshed short-label snapshot: `proper-name-short-label-discovery-D#{D}.tsv`
      (#{candidates.length} bounded groups; not exhaustive or a completion estimate).
      Full proper-name discovery remains incomplete.
    TEXT
    [M::DOCS.fetch(2), M::DOCS.fetch(3)].each do |path|
      File.open(path, 'a') { |file| file.write(note) }
    end
    %W[
      named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
      named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md
    ].each do |name|
      File.open(File.join(M::AUDIT, name), 'a') { |file| file.write(note) }
    end
  end

  def run
    dry_run
    ReviewedDiscoverySpecs.run(
      D, 'Chicken Overlord Name Consistency', SPECS, DETAIL,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, source_key, text, source| transform(spec, source_key, text, source) }
    candidates = refresh_snapshot
    update_checkpoint(candidates)
    puts "Chicken Overlord: #{EXPECTED_KEYS.length} source keys; " \
         "next=D-#{NEXT_D}, bounded candidate groups=#{candidates.length}."
  end
end

ReviewChickenOverlordD21712.run if $PROGRAM_NAME == __FILE__
