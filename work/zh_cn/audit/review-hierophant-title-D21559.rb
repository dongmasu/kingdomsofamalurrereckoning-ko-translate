#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewHierophantTitleD21559
  extend self
  M = ReviewedNameBatches
  D = 21_559
  ENTITY = 'title:hierophant'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONFIG = {
    ENTITY => [
      'Hierophant', '대사제', 'title', '',
      '히에로판트|계시자|대주교|대제사장|고위 성직자'
    ]
  }.freeze
  VARIANT = /(?<![가-힣])(?:고위 성직자|대제사장|히에로판트|계시자|대주교|대사제)(?:\((?:The )?Hierophant\))?/i
  PROTECTED_ENGLISH = [
    /(?<![A-Za-z])Hierophant Shrine(?![A-Za-z])/i,
    /(?<![A-Za-z])Hierophant's Den(?![A-Za-z])/i
  ].freeze
  PROTECTED_KOREAN = [
    /대사제의 성소\(Hierophant Shrine\)/i,
    /대사제의 은신처\(Hierophant's Den\)/i
  ].freeze
  NOTES = <<~TEXT.chomp
    English uses Hierophant for the Travelers' anonymous seer/leader office;
    Japanese 導き手/祈祷師 and Chinese 大祭司 corroborate the role. Register
    the title, not Argine or another individual, and do not add identity,
    spoiler, faction, or singular/plural claims. Reuse 대사제(Hierophant).
    Preserve the separately registered complete Hierophant Shrine and
    Hierophant's Den labels; their nested English word is not a second title
    span. Do not infer that the Court, Shrine, Sanctum, retreat, or sanctum
    wording denotes one shared location. Preserve natural pronouns, epithets,
    omitted repetitions, particles, and all other names.
  TEXT
  COMMON = 'English is the meaning/identity anchor; aligned Japanese and Chinese are corroborating references. The official Korean manual has no direct entry for this title. No PAK/PAK-derived inspection, source edit, prior-entity disposition change, or historical global tally recount.'

  def definitions(headers)
    CONFIG.map do |entity, (english, korean, category, aliases, variants)|
      fields = {
        'entity_key' => entity,
        'english_canonical' => english,
        'korean_canonical' => "#{korean}(#{english})",
        'category' => category,
        'english_aliases' => aliases,
        'korean_variants' => [korean, *variants.split('|')].join('|'),
        'evidence_ids' => "D-#{D}",
        'status' => 'confirmed',
        'notes' => "#{NOTES} #{COMMON}"
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def remove_patterns(text, patterns)
    patterns.reduce(text.dup) { |value, pattern| value.gsub(pattern, ' ') }
  end

  def transform_unprotected_title(text, standalone)
    protected = []
    masked = text.gsub(Regexp.union(PROTECTED_KOREAN)) do |match|
      token = "\u0001P#{protected.length}\u0002"
      protected << match
      token
    end
    transformed = masked.gsub(VARIANT) do |matched|
      article = standalone || matched.match?(/\(The Hierophant\)/i)
      "대사제(#{article ? 'The ' : ''}Hierophant)"
    end
    protected.each_with_index do |match, index|
      transformed = transformed.sub("\u0001P#{index}\u0002", match)
    end
    transformed
  end

  def definitions_for_inventory(inventory, headers)
    entity_definitions = definitions(headers)
    generated = build_occurrences(inventory.values, entity_definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    rows = inventory.values.map do |source|
      english_texts = JSON.parse(source.fetch('en_texts_json')).compact
      english = english_texts.join("\n")
      next unless english.match?(/(?<![A-Za-z])Hierophant(?![A-Za-z])/i)

      old = source.fetch('work_text')
      english_direct = remove_patterns(english, PROTECTED_ENGLISH)
      korean_direct = remove_patterns(old, PROTECTED_KOREAN)
      standalone = english.strip.casecmp('The Hierophant').zero?
      new_text = transform_unprotected_title(old, standalone)

      source_count = english_direct.scan(/(?<![A-Za-z])Hierophant(?![A-Za-z])/i).length
      korean_count = korean_direct.scan(VARIANT).length
      status = if old != new_text
                 'accepted'
               elsif source_count.zero? && korean_count.zero?
                 'excluded'
               else
                 'not-an-issue'
               end
      dispositions = { ENTITY => status }
      evidence = [
        NOTES,
        "English title mentions outside complete registered place labels: #{source_count}; current Korean title-form mentions outside those labels: #{korean_count}.",
        COMMON
      ].join(' ')
      {
        'resource' => source.fetch('resource'),
        'ID_Linha' => source.fetch('ID_Linha'),
        'Tipo_Variante' => source.fetch('Tipo_Variante').to_s,
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => evidence,
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        '_source_count' => source_count,
        '_korean_count' => korean_count
      }
    end.compact
    rows.sort_by! do |row|
      [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
    end
    [entity_definitions, generated, rows]
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    inventory = M.refresh_inventory
    entity_definitions, generated, rows = definitions_for_inventory(inventory, glossary.headers)
    expected = generated.map do |row|
      [row.fetch('entity_key'), row.fetch('resource'), row.fetch('ID_Linha'), row.fetch('Tipo_Variante')]
    end
    actual = rows.map do |row|
      [row.fetch('entity_key'), row.fetch('resource'), row.fetch('ID_Linha'), row.fetch('Tipo_Variante')]
    end
    raise 'Hierophant exact source coverage differs' unless expected.sort == actual.sort
    raise 'Hierophant distinct row count differs' unless rows.length == 366
    raise 'duplicate Hierophant row' unless rows.map { |row| M.key(row) }.uniq.length == rows.length
    ReviewedProperNameDiscovery.validate!(
      entity_definitions, rows, generated, glossary.map(&:to_h),
      M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(rows, inventory)
    distribution = rows.group_by { |row| row.fetch('status') }.transform_values(&:length)
    mismatches = rows.select do |row|
      row.fetch('_source_count') != row.fetch('_korean_count') &&
        !(row.fetch('english').strip.casecmp('The Hierophant').zero? &&
          row.fetch('_source_count') == row.fetch('_korean_count'))
    end
    puts "D-#{D} preparation: #{rows.length} rows; #{rows.count { |row| row['old'] != row['new'] }} edits; dispositions=#{distribution.inspect}; English/Korean mention-count differences=#{mismatches.length}; no CSV writes."
    mismatches.each do |row|
      puts "#{row['resource']}:#{row['ID_Linha']}: English=#{row['_source_count']} Korean=#{row['_korean_count']} status=#{row['status']}"
    end
    [glossary.headers, entity_definitions, rows.map { |row| row.reject { |key, _| key.start_with?('_') } }]
  end

  def apply
    headers, entity_definitions, rows = prepare
    M.write_table(DEFINITIONS, headers, entity_definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), rows)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewHierophantTitleD21559.prepare
  when ['apply'] then ReviewHierophantTitleD21559.apply
  else abort 'usage: review-hierophant-title-D21559.rb [prepare|apply]'
  end
end
