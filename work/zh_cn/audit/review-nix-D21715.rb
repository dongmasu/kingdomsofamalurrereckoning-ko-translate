#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-short-label-discovery-20261018'

module ReviewNixD21715
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_715
  NEXT_D = 21_716
  ENTITY = 'monster:nix'
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  EXPECTED_KEYS = 34
  FULL_NAME_REPLACEMENTS = {
    ['default', '14854', ''] => ['트롤(Troll) 닉스', '트롤 닉스(Nix the Troll)'],
    ['default', '17675', ''] => ['트롤(Troll) 닉스(Nix)', '트롤 닉스(Nix the Troll)'],
    ['default', '24433', ''] => ['트롤(Troll) 닉스', '트롤 닉스(Nix the Troll)'],
    ['default', '24671', ''] => ['트롤(Troll) 닉스', '트롤 닉스(Nix the Troll)'],
    ['default', '38636', ''] => ['트롤(Troll) 닉스', '트롤 닉스(Nix the Troll)'],
    ['default', '38793', ''] => ['트롤(Troll) 부하 닉스', '트롤 부하 닉스(Nix the Troll)'],
    ['default', '45810', ''] => ['트롤(Troll) 닉스', '트롤 닉스(Nix the Troll)'],
    ['default', '54256', ''] => ['트롤(Troll) 닉스(Nix)', '트롤 닉스(Nix the Troll)']
  }.freeze
  SPECS = [
    {
      key: ENTITY,
      english: 'Nix',
      category: 'monster',
      korean: '닉스(Nix)',
      aliases: 'Nix the Troll|the troll named Nix',
      variants: '닉스|닉스(Nix)|트롤 닉스(Nix the Troll)',
      count: EXPECTED_KEYS,
      notes: <<~TEXT.gsub(/\s+/, ' ').strip
        English contexts identify Nix as the same named troll: the ballad
        describes his origin and transformation, and dialogue and quest
        objectives refer to the same monster at Sundur Caverns. Japanese
        ニクス and Chinese 尼克斯 corroborate the name throughout the 34
        exact source keys. Use 닉스(Nix) for short references and
        트롤 닉스(Nix the Troll) when English gives the full label. Preserve
        the independent generic monster:troll decisions and all existing
        dialogue, verse, and objective content.
      TEXT
    }
  ].freeze
  DETAIL = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Reviewed all 34 exact English source keys naming Nix across dialogue,
    the repeated ballad, standalone labels, and quest objectives. They refer
    to the same troll: the story describes Nix's wish to become human, the
    Maid's enchantment, and his confrontation with Creth and Airmer; other
    dialogue identifies him as the Maid's minion at Sundur Caverns. Japanese
    ニクス and Chinese 尼克斯 corroborate the same identity. Pair short
    references as 닉스(Nix) and full-name forms as 트롤 닉스(Nix the Troll).
    Existing monster:troll decisions are preserved and not reopened.
  TEXT

  def key(row)
    M.key(row)
  end

  def english_text(source)
    JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  end

  def source_rows(inventory)
    inventory.values.select do |source|
      english_text(source).match?(/(?<![A-Za-z])Nix(?![A-Za-z])/i)
    end.sort_by do |source|
      [M::RESOURCES.index(source.fetch('resource')),
       source.fetch('ID_Linha').to_i, source.fetch('Tipo_Variante').to_s]
    end
  end

  def validate_source!(source)
    source_key = key(source)
    english = english_text(source)
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise "English Nix match missing at #{source_key.inspect}" unless
      english.match?(/(?<![A-Za-z])Nix(?![A-Za-z])/i)
    raise "Japanese Nix evidence missing at #{source_key.inspect}" unless
      japanese.match?(/ニクス|ニックス|Nix/i)
    raise "Chinese Nix evidence missing at #{source_key.inspect}" unless
      chinese.match?(/尼克斯|尼克/)
    raise "Korean Nix span missing at #{source_key.inspect}" unless
      source.fetch('work_text').include?('닉스')
  end

  def transform(_spec, source_key, text, source)
    validate_source!(source)
    revised = text.dup
    if (change = FULL_NAME_REPLACEMENTS[source_key])
      old, replacement = change
      count = revised.scan(old).length
      raise "expected one full Nix name at #{source_key.inspect}, found #{count}" unless
        count == 1
      revised.sub!(old, replacement)
    end
    revised.gsub!(/닉스(?!\s*\()/, '닉스(Nix)')
    [revised, false]
  end

  def definitions
    headers = M.table(R::GLOSSARY).headers
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
    raise "Nix source-key count differs: #{generated.length}" unless
      generated.length == EXPECTED_KEYS

    generated.map do |occurrence|
      source_key = key(occurrence)
      source = inventory.fetch(source_key)
      old = source.fetch('work_text')
      revised, excluded = transform(nil, source_key, old, source)
      raise 'Nix scope unexpectedly excluded a source key' if excluded
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
    raise "Nix source count differs: #{sources.length}" unless
      sources.length == EXPECTED_KEYS
    sources.each { |source| validate_source!(source) }
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
         "#{counts.inspect}; #{reviews.count { |row| row['old'] != row['new'] }} Texto edits."
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
    note = <<~TEXT

      ## D-#{D}: Nix Named-Monster Review

      Reviewed all 34 exact Nix source keys and standardized the name as
      `닉스(Nix)` or, for full-name forms, `트롤 닉스(Nix the Troll)`.
      Japanese and Chinese corroboration is recorded per row. Existing
      `monster:troll` dispositions remain intact and were not reopened.
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
    definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
    review_path = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
    raise "D-#{D} output already exists" if [definition_path, review_path].any? { |path| File.exist?(path) }
    inventory = M.refresh_inventory
    reviews = build_reviews(source_rows(inventory))
    M.write_table(definition_path, M.table(R::GLOSSARY).headers, definitions)
    M.write_table(review_path, M::HEADERS, reviews)
    R.run([definition_path, review_path, D.to_s])
    candidates = refresh_snapshot
    update_checkpoint(candidates)
    puts "Nix: #{reviews.length} source keys; " \
         "next=D-#{NEXT_D}, bounded candidate groups=#{candidates.length}."
  end
end

ReviewNixD21715.run if $PROGRAM_NAME == __FILE__
