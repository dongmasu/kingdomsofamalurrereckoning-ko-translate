#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewFullNameResidualsD21606
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_606
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONTEXT = <<~TEXT.chomp
    English-led review of three exact personal-name entities and all 21
    distinct default/base source rows. Aligned Japanese and Chinese support
    the identities and pronunciations. Standardize partial or split
    parentheses to one complete Korean (English full-name) annotation:
    Jokull Fangard, Erion Rheidarn, and Hautren Kalt. Reuse the already
    established full-name spellings elsewhere in the same scopes. In the
    long arena ledger and dialogue, preserve later short-name references
    rather than repeating full-name annotations. Hautren's epitaph
    spelling is normalized to 호트렌, matching the complete-name labels
    and Japanese ホートレン. Existing component-entity dispositions remain
    untouched and are not recounted. The official Korean manual
    extraction/reference has no direct entry for these names. No role,
    relationship or biography is inferred beyond explicit English context.
    Full proper-name discovery/residual validation remains incomplete.
  TEXT
  SPECS = [
    {
      english: 'Jokull Fangard', korean: '조컬 팽가드',
      ids: { 'default' => %w[18198 40130 41633 43298 52807 54894 56779 62117] },
      edits: %w[41633 43298],
      variants: ['조컬(Jokull) 팽가드', '조컬 팽가드(Jokull Fangard)']
    },
    {
      english: 'Erion Rheidarn', korean: '에리온 레이다른',
      ids: { 'default' => %w[1518 3982 5358 9785 9834 47847 49830 54366 55434] },
      edits: %w[9785 47847 49830],
      variants: [
        '에리온 레이다른(Erion Rheidarn)', '에리온(Erion) 레이다른'
      ]
    },
    {
      english: 'Hautren Kalt', korean: '호트렌 칼트',
      ids: {
        'base' => [['4548', '11']],
        'default' => %w[7805 42969 50141]
      },
      edits: %w[42969 50141],
      variants: [
        '호트렌 칼트(Hautren Kalt)', '호트렌 칼트(Kalt)',
        '하우트렌 칼트(Kalt)'
      ]
    }
  ].freeze

  def entity_key(english)
    "person:#{english.downcase.tr(' ', '-')}"
  end

  def expected_keys(spec)
    spec.fetch(:ids).flat_map do |resource, ids|
      ids.map do |item|
        id, variant = item.is_a?(Array) ? item : [item, '']
        [resource, id, variant.to_s]
      end
    end.sort
  end

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    definitions = []
    reviews = []
    generated_all = []

    SPECS.each do |spec|
      english = spec.fetch(:english)
      korean = spec.fetch(:korean)
      entity = entity_key(english)
      definition_values = {
        'entity_key' => entity,
        'english_canonical' => english,
        'category' => 'person',
        'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '',
        'korean_variants' => spec.fetch(:variants).join('|'),
        'evidence_ids' => (["D-#{D}"] + expected_keys(spec).map do |resource, id, variant|
          [resource, id, variant].reject(&:empty?).join(':')
        end).join('|'),
        'status' => 'confirmed',
        'notes' => CONTEXT
      }
      definition = glossary.headers.to_h do |header|
        [header, definition_values.fetch(header, '')]
      end
      entity_rows = build_occurrences(inventory.values, [definition]).map do |values|
        OCCURRENCE_HEADERS.zip(values).to_h
      end
      actual_keys = entity_rows.map { |row| M.key(row) }.sort
      raise "unexpected exact-name source coverage for #{english}: #{actual_keys.inspect}" unless
        actual_keys == expected_keys(spec)

      definitions << definition
      generated_all.concat(entity_rows)
      entity_rows.each do |match|
        key = M.key(match)
        source = inventory.fetch(key)
        en_text = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        ja_text = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
        zh_text = source.fetch('zh_text')
        name_pattern = Regexp.new(
          "(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])",
          Regexp::IGNORECASE
        )
        raise "missing exact English name at #{key.inspect}" unless
          en_text.match?(name_pattern)
        raise "missing aligned JA/ZH evidence at #{key.inspect}" if
          ja_text.strip.empty? || zh_text.to_s.strip.empty?

        old = source.fetch('work_text')
        id = key[1]
        new_text = old
        if spec.fetch(:edits).include?(id)
          alternatives = spec.fetch(:variants)
            .sort_by { |value| -value.length }
            .map { |value| Regexp.escape(value) }
            .join('|')
          pattern = Regexp.new("(?:#{alternatives})")
          matches = old.scan(pattern)
          raise "expected one full-name Korean span at #{key.inspect}" unless
            matches.length == 1
          new_text = old.sub(pattern, "#{korean}(#{english})")
        else
          raise "established complete pair missing at #{key.inspect}" unless
            old.include?("#{korean}(#{english})")
        end
        status = new_text == old ? 'not-an-issue' : 'accepted'
        reviews << {
          'resource' => key[0],
          'ID_Linha' => key[1],
          'Tipo_Variante' => key[2],
          'entity_key' => entity,
          'status' => status,
          'old' => old,
          'new' => new_text,
          'evidence' => CONTEXT,
          'english' => en_text,
          'japanese' => ja_text,
          'chinese' => zh_text,
          'entity_dispositions_json' => JSON.generate(entity => status)
        }
      end
    end

    raise "expected 21 distinct rows, got #{reviews.map { |row| M.key(row) }.uniq.length}" unless
      reviews.map { |row| M.key(row) }.uniq.length == 21
    R.validate!(definitions, reviews, generated_all, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(
      File.binread(M.csv_path('default')),
      reviews.select { |row| row['resource'] == 'default' && row['old'] != row['new'] }
    )
    reviews.sort_by! do |row|
      [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i]
    end
    puts "D-#{D}: #{definitions.length} full names, 21 distinct rows, " \
         "#{reviews.count { |row| row['old'] != row['new'] }} edits; prepare only."
    reviews.each do |row|
      next if row['old'] == row['new']
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'old', 'new'))
    end
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Three Further Full Personal Names

      #{CONTEXT}
      Registered three complete-name entities and reviewed 21 distinct
      source row keys: one base and 20 default. Seven partial/split
      full-name annotations were standardized; 14 already-canonical rows
      remain unchanged. Later short-name references in the ledger/dialogue
      were preserved. Existing component-entity findings and previous
      terminal decisions were not reopened or recounted.
    TEXT
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [*M::DOCS, report, addendum].each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      if text.include?(marker)
        text.sub!(marker, "#{marker}\n\n#{detail}")
      else
        text << "\n\n#{detail}\n"
      end
      File.write(path, text)
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewFullNameResidualsD21606.prepare
  when ['apply'] then ReviewFullNameResidualsD21606.apply
  else abort 'usage: review-full-name-residuals-D21606.rb [prepare|apply]'
  end
end
