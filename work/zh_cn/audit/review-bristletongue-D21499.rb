#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module BristletongueD21499
  extend self

  M = ReviewedNameBatches
  D = 21_499
  ENTITY = 'resource:bristletongue'
  ENGLISH = 'Bristletongue'
  KOREAN = '브리슬텅(Bristletongue)'
  CRAFT_ENTITY = 'place:craft-hall'
  CRAFT_IDS = [
    ['affix', '159'], %w[base 1735], %w[base 231], %w[base 2973],
    %w[base 3784], %w[base 4026], %w[default 1390], %w[default 1602],
    %w[default 17362], %w[default 19344], %w[default 2405],
    %w[default 25484], %w[default 26333], %w[default 32526],
    %w[default 32957], %w[default 38], %w[default 38457],
    %w[default 39055], %w[default 3932], %w[default 40771],
    %w[default 4899], %w[default 5078], %w[default 54036],
    %w[default 55631], %w[default 56331], %w[default 57604],
    %w[default 57955], %w[default 59329], %w[default 61269],
    %w[default 62506], %w[default 6753]
  ].freeze
  EXPECTED_KEYS = [
    ['base', '1709', '11'], ['base', '2350', '11'],
    *%w[
      10974 12765 19119 19677 24693 25058 25639 27751 32839 39314
      45462 47256 47258 47571 51399 51597 53176 54119 57060 57872
      5828 59318 64097
    ].map { |id| ['default', id, ''] }
  ].freeze
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CRAFT_SCREEN = File.join(__dir__, "proper-name-candidate-screen-D#{D}.tsv")
  CRAFT_HEADERS = %w[
    resource ID_Linha Tipo_Variante candidate disposition entity_key
    english japanese chinese korean evidence
  ].freeze
  SHARED = 'English is the identity and meaning anchor. Default:32839 describes the rare Bristletongue bloom; default:53176 identifies Bristletongue as a spice and its seeds as harvestable; default:54119 and default:64097 explain the seeds and their relation to the Font. Default:57872 places it in a special garden. Japanese ブリッスルタング and Chinese 鬃舌草 corroborate. Treat the plant, spice, flower, and seeds as contextual references to the same resource; preserve complete seed/weed labels as atomic bilingual compounds. No PAK-derived evidence or historical tally recount.'

  NORMALIZATIONS = {
    ['base', '1709'] => [['강모혀풀', '브리슬텅 풀(Bristletongue Weed)']],
    ['base', '2350'] => [
      ['브리슬텅(Bristletongue) 씨앗', '브리슬텅 씨앗(Bristletongue Seeds)']
    ],
    ['default', '10974'] => [['브리슬텅?', '브리슬텅(Bristletongue)?']],
    ['default', '19119'] => [['브리슬텅 식물', "#{KOREAN} 식물"]],
    ['default', '19677'] => [
      ['브리슬텅의 씨앗', "#{KOREAN}의 씨앗"],
      ['샘의 브리슬텅', "샘의 #{KOREAN}"]
    ],
    ['default', '24693'] => [
      ['브리슬텅 씨앗', '브리슬텅 씨앗(Bristletongue Seeds)']
    ],
    ['default', '25058'] => [
      ['브리슬텅의 사용', "#{KOREAN}의 사용"]
    ],
    ['default', '25639'] => [
      ['브리슬텅이 자란다는', "#{KOREAN}이 자란다는"]
    ],
    ['default', '32839'] => [['브리슬텅 꽃', "#{KOREAN} 꽃"]],
    ['default', '39314'] => [['브리슬텅은', "#{KOREAN}은"]],
    ['default', '47256'] => [['브리슬텅은', "#{KOREAN}은"]],
    ['default', '47258'] => [['브리슬텅', KOREAN]],
    ['default', '47571'] => [['브리슬텅이', "#{KOREAN}이"]],
    ['default', '53176'] => [
      ['브리슬텅 씨앗', '브리슬텅 씨앗(Bristletongue Seeds)']
    ],
    ['default', '54119'] => [
      ['브리슬텅(Bristletongue) 씨앗', '브리슬텅 씨앗(Bristletongue Seeds)']
    ],
    ['default', '57060'] => [['브리슬텅 꽃', "#{KOREAN} 꽃"]],
    ['default', '57872'] => [
      ['뻣뻣혀초는', "#{KOREAN}은"]
    ],
    ['default', '59318'] => [['브리슬텅이라는', "#{KOREAN}이라는"]],
    ['default', '64097'] => [
      ['브리슬텅(Bristletongue) 씨앗', '브리슬텅 씨앗(Bristletongue Seeds)'],
      ['브리슬텅이 으뜸이지', "#{KOREAN}이 으뜸이지"]
    ]
  }.freeze

  def definition(headers)
    values = {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'category' => 'resource',
      'korean_canonical' => KOREAN,
      'english_aliases' => 'Bristletongue Weed|Bristletongue Seeds',
      'korean_variants' => '브리슬텅|브리슬텅|브리슬텅 식물|강모혀풀|뻣뻣혀초',
      'evidence_ids' => "D-#{D}|base:1709:11|base:2350:11|default:32839|default:53176|default:54119|default:57872",
      'status' => 'confirmed',
      'notes' => "English identifies Bristletongue as a rare spice and flowering plant from the Font; its seeds are harvested and used as an ingredient. Reuse #{KOREAN}; render the complete item labels as 브리슬텅 풀(Bristletongue Weed) and 브리슬텅 씨앗(Bristletongue Seeds). Japanese and Chinese corroborate the plant and seed forms. #{SHARED}"
    }
    headers.to_h { |header| [header, values.fetch(header, '')] }
  end

  def normalize(key, text)
    replacements = NORMALIZATIONS[[key[0], key[1]]] || []
    replacements.each do |old, replacement|
      raise "expected Bristletongue text missing at #{key.inspect}: #{old}" unless
        text.include?(old)
      raise "duplicate canonical Bristletongue text at #{key.inspect}" if
        text.include?(replacement)
      text = text.sub(old, replacement)
    end
    text
  end

  def craft_screen(inventory, index)
    rows = CRAFT_IDS.flat_map do |resource, id|
      inventory.values.select do |source|
        source['resource'] == resource && source['ID_Linha'] == id
      end
    end
    raise 'Craft candidate source-ID coverage differs' unless
      rows.map { |row| [row['resource'], row['ID_Linha']] }.uniq.sort == CRAFT_IDS.sort
    raise 'Craft candidate no longer has 31 source IDs' unless
      rows.map { |row| [row['resource'], row['ID_Linha']] }.uniq.length == 31

    indexed = index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row]
    end
    rows.map do |source|
      key = M.key(source)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      hall = english.match?(/(?<![A-Za-z])Craft Hall(?![A-Za-z])/i)
      if hall
        raise "Craft Hall occurrence is not already indexed #{key.inspect}" unless
          indexed.key?([CRAFT_ENTITY, *key])
        disposition = 'existing-entity-covered'
        entity = CRAFT_ENTITY
        evidence = 'English names the already-registered Craft Hall venue; the exact entity occurrence remains covered by place:craft-hall.'
      else
        disposition = 'generic-crafting-term'
        entity = ''
        evidence = 'English uses craft/Craft as a generic action, skill, or affix descriptor; Japanese and Chinese align with the ordinary crafting meaning. Not a separate named entity.'
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1],
        'Tipo_Variante' => key[2], 'candidate' => 'Craft',
        'disposition' => disposition, 'entity_key' => entity,
        'english' => english, 'japanese' => japanese,
        'chinese' => chinese, 'korean' => source.fetch('work_text'),
        'evidence' => evidence
      }
    end
  end

  def reviews_for(inventory, generated)
    actual_pairs = generated.map do |row|
      [row.fetch('entity_key'), *M.key(row)]
    end
    expected = EXPECTED_KEYS.map { |resource, id, variant| [ENTITY, resource, id, variant] }
    raise 'Bristletongue exact source scope differs' unless
      actual_pairs.sort == expected.sort

    generated.sort_by do |row|
      [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante'].to_s]
    end.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      korean = source.fetch('work_text')
      raise "English Bristletongue evidence differs #{key.inspect}" unless
        english.match?(/(?<![A-Za-z])Bristletongue(?![A-Za-z])/i)
      raise "missing aligned Japanese evidence #{key.inspect}" if japanese.empty?
      raise "missing aligned Chinese evidence #{key.inspect}" if chinese.empty?

      new_text = normalize(key, korean)
      status = new_text == korean ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => korean,
        'new' => new_text,
        'evidence' => "#{SHARED} Use #{KOREAN} for the plant/spice reference, and keep the complete seed and weed labels atomic. Preserve unrelated wording, entities, punctuation, tokens, and line breaks.",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
  end

  def prepare
    glossary_table = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    raise 'Bristletongue entity already registered' if
      glossary.any? { |row| row.fetch('entity_key') == ENTITY }
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'discovery outputs already exist' if
      [DEFINITIONS, REVIEWS, CRAFT_SCREEN].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    entry = definition(glossary_table.headers)
    generated = build_occurrences(inventory.values, [entry]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    index = M.table(M::INDEX).map(&:to_h)
    reviews = reviews_for(inventory, generated)
    screen = craft_screen(inventory, index)
    ReviewedProperNameDiscovery.validate!(
      [entry], reviews, generated, glossary, index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)

    puts "Prepared D-#{D}: #{reviews.length} Bristletongue source keys; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} Korean edits; " \
         "#{screen.length} Craft candidate row variants screened."
    [entry, reviews, screen]
  end

  def append_detail(path, section)
    text = File.read(path)
    return if text.include?('### D-21499: Bristletongue')

    marker = '<!-- current-proper-name-batch:end -->'
    raise "missing current batch marker in #{path}" unless text.include?(marker)
    text.sub!(marker, "#{marker}\n\n#{section}")
    File.write(path, text)
  end

  def apply
    glossary_path = ReviewedProperNameDiscovery::GLOSSARY
    prior_glossary = M.table(glossary_path)
    prior_records = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)],
       row.reject { |field, _| field == 'korean_current' }]
    end
    entry, reviews, screen = prepare
    M.write_table(DEFINITIONS, prior_glossary.headers, [entry])
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    M.write_table(CRAFT_SCREEN, CRAFT_HEADERS, screen)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])

    final_index = M.table(M::INDEX).map(&:to_h)
    final_records = final_index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)],
       row.reject { |field, _| field == 'korean_current' }]
    end
    prior_records.each do |key, record|
      raise "prior occurrence changed #{key.inspect}" unless
        final_records[key] == record
    end
    expected = EXPECTED_KEYS.map do |resource, id, variant|
      [ENTITY, resource, id, variant]
    end
    raise 'unexpected occurrence additions' unless
      (final_records.keys - prior_records.keys).sort == expected.sort
    final_glossary = M.table(glossary_path).map(&:to_h)
    raise 'prior glossary records changed' unless
      final_glossary == prior_glossary.map(&:to_h) + [entry]

    detail = <<~TEXT.chomp
      ### D-21499: Bristletongue

      Registered `resource:bristletongue` as `#{KOREAN}`. Reviewed all
      #{EXPECTED_KEYS.length} exact source keys across `base` and `default`,
      covering its rare-spice, plant, blossom, seed, and harvest contexts.
      English default:53176 identifies the rare spice and harvestable seeds;
      default:32839 identifies the bloom, and default:57872 places it in a
      guarded garden above the Font. Japanese ブリッスルタング and Chinese
      鬃舌草 corroborate. Standardized missing or malformed labels, including
      the base `Bristletongue Weed` and `Bristletongue Seeds` compounds and
      default:57872's `뻣뻣혀초` mistranslation. Other wording and prior entity
      dispositions remain unchanged.

      The refreshed heuristic `Craft` candidate was also screened across
      31 source IDs / #{screen.length} aligned row variants: 13 `Craft Hall`
      source IDs (13 variants) are already covered by `place:craft-hall`;
      the remaining 18 source IDs (23 variants) are generic crafting actions,
      skills, or affix wording. No new entity or Korean edit was made for
      `Craft`. Per-row evidence is in
      `proper-name-candidate-screen-D#{D}.tsv`.
    TEXT
    [
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ].each do |path|
      File.open(path, 'a') { |file| file.write("\n\n#{detail}\n") }
    end
    M::DOCS.each { |path| append_detail(path, detail) }
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-bristletongue-D21499.rb [prepare|apply]' if ARGV.length > 1
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then BristletongueD21499.prepare
  when 'apply' then BristletongueD21499.apply
  else abort 'usage: review-bristletongue-D21499.rb [prepare|apply]'
  end
end
