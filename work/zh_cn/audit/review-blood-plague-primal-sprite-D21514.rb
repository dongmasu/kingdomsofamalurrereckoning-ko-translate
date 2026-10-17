#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module BloodPlaguePrimalSpriteD21514
  extend self

  M = ReviewedNameBatches
  D = 21_514
  BLOOD = 'lore_term:blood-plague'
  SPRITE = 'monster:primal-sprite'
  BLOOD_KOREAN = '혈역병(Blood Plague)'
  SPRITE_KOREAN = '원초 스프라이트(Primal Sprite)'
  INITIAL_CANDIDATE_EVIDENCE =
    'Candidate hit from the English source; verify this occurrence in context.'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  EDITS = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  BLOOD_IDS = %w[
    34 131 3060 6166 9390 10354 11305 11494 11835 12628 13348 17125
    17879 19513 19955 20228 20909 21083 21556 22310 23744 24447 24945
    26992 31626 35645 38007 39880 41920 44205 45116 45123 53442 53513
    55171 55459 58104 59187
  ].freeze
  SPRITE_IDS = %w[354 18626 60650 62308].freeze
  BLOOD_NOTE = 'English identifies Blood Plague as the contagious disease affecting ' \
               'Didenhil and nearby communities: default:11494 says Boggarts carry it, ' \
               'default:17125 discusses its treatment, and default:6166/44205 place its ' \
               'outbreak in Didenhil. Japanese ブラッドプラーグ and Chinese 血疫 corroborate. ' \
               'Classify as a lore term/disease, not a resource. Normalize only the disease ' \
               'name to 혈역병(Blood Plague); preserve the sentence, particles, markup, ' \
               'other entities, and prior dispositions.'
  SPRITE_NOTE = 'English quest contexts identify Primal Sprite(s) as hostile creatures ' \
                'nesting in Idylla sewers, with thralls and leaders: default:354 orders ' \
                'the nest cleared, default:18626 confirms its removal, default:60650 ' \
                'describes a singular encounter, and default:62308 identifies the leaders. ' \
                'Japanese プライマル・スプライト and Chinese 原初妖精 corroborate. ' \
                'Classify as a monster creature, not a person or faction. Use ' \
                '원초 스프라이트 and preserve the English source singular/plural form in ' \
                'each parenthetical annotation. At default:60650 only, correct the attached ' \
                'particle 이->가 for the vowel-final Korean stem; preserve unrelated particles. ' \
                'Do not alter Idylla or other prior decisions.'

  SPECS = {
    BLOOD => {
      english: 'Blood Plague', aliases: '',
      category: 'lore term', korean: BLOOD_KOREAN,
      variants: '피의 역병|혈역병|혈액 역병',
      japanese: 'ブラッドプラーグ', chinese: '血疫',
      korean_pattern: /(?:피의 역병|혈역병|혈액 역병)(?:\(Blood Plague\))?/,
      note: BLOOD_NOTE
    },
    SPRITE => {
      english: 'Primal Sprite', aliases: 'Primal Sprites',
      category: 'monster', korean: SPRITE_KOREAN,
      variants: '원초의 정령|원시 정령|원초 스프라이트',
      japanese: 'プライマル・スプライト', chinese: '原初妖精',
      korean_pattern: /(?:원초의 정령|원시 정령|원초 스프라이트)(?:\(Primal Sprites?\))?/,
      note: SPRITE_NOTE
    }
  }.freeze

  def expected_pairs
    BLOOD_IDS.map { |id| [BLOOD, 'default', id, ''] } +
      SPRITE_IDS.map { |id| [SPRITE, 'default', id, ''] }
  end

  def definitions_for(headers)
    SPECS.map do |entity, spec|
      values = {
        'entity_key' => entity,
        'english_canonical' => spec.fetch(:english),
        'category' => spec.fetch(:category),
        'korean_canonical' => spec.fetch(:korean),
        'english_aliases' => spec.fetch(:aliases),
        'korean_variants' => spec.fetch(:variants),
        'evidence_ids' => "D-#{D}",
        'status' => 'confirmed',
        'notes' => spec.fetch(:note)
      }
      headers.to_h { |header| [header, values.fetch(header, '')] }
    end
  end

  # Build aligned rows directly from source CSVs; never refresh the shared inventory.
  def source_inventory
    M::RESOURCES.flat_map do |resource|
      rows = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *rows).map do |values|
        OUTPUT_HEADERS.zip(values).to_h
      end
    end.each_with_object({}) do |row, inventory|
      key = M.key(row)
      raise "duplicate source key #{key.inspect}" if inventory.key?(key)

      inventory[key] = row
    end
  end

  def generated_for(inventory, definitions)
    build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
  end

  def normalize_korean(entity, text, english)
    spec = SPECS.fetch(entity)
    replacement = if entity == SPRITE
                    plural = english.match?(/\bPrimal Sprites\b/i)
                    "원초 스프라이트(Primal Sprite#{'s' if plural})"
                  else
                    spec.fetch(:korean)
                  end
    normalized = text.gsub(spec.fetch(:korean_pattern), replacement)
    if entity == SPRITE && !english.match?(/\bPrimal Sprites\b/i)
      normalized = normalized.gsub(
        '원초 스프라이트(Primal Sprite)이',
        '원초 스프라이트(Primal Sprite)가'
      )
    end
    normalized
  end

  def source_term(entity, english)
    pattern = if entity == BLOOD
                /\bBlood Plague\b/i
              else
                /\bPrimal Sprites?\b/i
              end
    english.scan(pattern).fetch(0)
  end

  def reviews_for(inventory, generated)
    pairs = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Blood Plague/Primal Sprite source scope differs from the exact 42 keys' unless
      pairs.sort == expected_pairs.sort && pairs.uniq == pairs

    generated.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row.fetch('Tipo_Variante').to_s]
    end.map do |occurrence|
      key = M.key(occurrence)
      entity = occurrence.fetch('entity_key')
      spec = SPECS.fetch(entity)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      term = source_term(entity, english)
      expected_term = entity == BLOOD ? 'Blood Plague' : term
      raise "English source term differs #{key.inspect}" unless
        english.scan(entity == BLOOD ? /\bBlood Plague\b/i : /\bPrimal Sprites?\b/i).length == 1
      raise "Japanese supporting term differs #{key.inspect}" unless
        japanese.include?(spec.fetch(:japanese))
      raise "Chinese supporting term differs #{key.inspect}" unless
        chinese.include?(spec.fetch(:chinese))

      old = source.fetch('work_text')
      raise "Korean name span differs #{key.inspect}" unless
        old.scan(spec.fetch(:korean_pattern)).length == 1
      new_text = normalize_korean(entity, old, english)
      raise "Korean source-name count differs #{key.inspect}" unless
        new_text.scan(Regexp.new(Regexp.escape(entity == BLOOD ? BLOOD_KOREAN : '원초 스프라이트'))).length ==
          old.scan(spec.fetch(:korean_pattern)).length
      raise "Korean normalization is not idempotent #{key.inspect}" unless
        normalize_korean(entity, new_text, english) == new_text

      status = old == new_text ? 'not-an-issue' : 'accepted'
      context = entity == BLOOD ?
        'Named disease context; do not merge with the separate Plagueshield reagent.' :
        'Quest text identifies a sewer-nesting creature; preserve source singular/plural.'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => "#{key.join(':')}: #{context} English source=#{expected_term.inspect}; " \
                      "JA anchor=#{spec.fetch(:japanese).inspect}; " \
                      "ZH anchor=#{spec.fetch(:chinese).inspect}. #{spec.fetch(:note)} " \
                      'Only the exact reviewed Korean disease/creature span and, at default:60650 ' \
                      'only, its attached 이->가 particle correction may change; preserve unrelated ' \
                      'sentence text and particles, markup, line breaks, other entities and prior decisions.',
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
  end

  def prior_records(rows)
    rows.each_with_object({}) do |row, records|
      key = [row.fetch('entity_key'), *M.key(row)]
      raise "duplicate occurrence key #{key.inspect}" if records.key?(key)

      records[key] = row.reject { |field, _| field == 'korean_current' }
    end
  end

  def verify_prior_snapshot!(row)
    entity = row.fetch('entity_key')
    prior_status = JSON.parse(row.fetch('previous_status'))
    prior_evidence = JSON.parse(row.fetch('previous_evidence'))
    raise "prior disposition snapshot keys differ #{M.key(row).inspect}" unless
      prior_status.keys.sort == prior_evidence.keys.sort
    raise "reviewed entity missing from prior snapshot #{M.key(row).inspect}" unless
      prior_status[entity] == 'needs-context' &&
      prior_evidence[entity] == INITIAL_CANDIDATE_EVIDENCE

    true
  end

  def verify_prior_records!(before, rows)
    after = prior_records(rows)
    before.each do |key, record|
      raise "prior occurrence record changed #{key.inspect}" unless after[key] == record
    end
    raise 'unexpected Blood Plague/Primal Sprite occurrence keys' unless
      (after.keys - before.keys).sort == expected_pairs.sort
  end

  def verify_live_name_cell!(entity, source)
    current = source.fetch('work_text')
    raise "live scoped name is not normalized #{M.key(source).inspect}" unless
      normalize_korean(
        entity, current, JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      ) == current
    true
  end

  def verify_applied_index!(index_rows, reviews, generated)
    actual = index_rows.select { |row| SPECS.key?(row.fetch('entity_key')) }
                       .to_h { |row| [[row.fetch('entity_key'), *M.key(row)], row] }
    raise 'applied entity-key coverage differs' unless
      actual.keys.sort == expected_pairs.sort
    generated_by_key = generated.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row]
    end
    reviews.each do |review|
      key = [review.fetch('entity_key'), *M.key(review)]
      expected = generated_by_key.fetch(key).merge(
        'korean_current' => review.fetch('new'),
        'status' => review.fetch('status'),
        'evidence' => "D-#{D}: #{review.fetch('evidence')}"
      )
      raise "applied index row differs #{key.inspect}" unless actual.fetch(key) == expected
    end
  end

  def validate_saved_manifest!
    definitions_table = M.table(DEFINITIONS)
    definitions = definitions_table.map(&:to_h)
    reviews = M.table(REVIEWS).map(&:to_h)
    inventory = source_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    generated = generated_for(inventory, definitions)
    raise 'saved definitions differ from D21514 scope' unless
      definitions == definitions_for(definitions_table.headers)
    raise 'saved manifest source-key coverage differs' unless
      reviews.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort == expected_pairs.sort
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.each do |row|
      source = inventory.fetch(M.key(row))
      entity = row.fetch('entity_key')
      verify_live_name_cell!(entity, source)
      raise "saved transformation differs #{M.key(row).inspect}" unless
        normalize_korean(row.fetch('entity_key'), row.fetch('old'), row.fetch('english')) == row.fetch('new')
      expected_status = row.fetch('old') == row.fetch('new') ? 'not-an-issue' : 'accepted'
      raise "saved disposition differs #{M.key(row).inspect}" unless row.fetch('status') == expected_status
    end
    raise 'saved edit count differs' unless
      reviews.count { |row| row.fetch('old') != row.fetch('new') } == 38
    raise 'saved glossary entities differ' unless
      SPECS.keys.all? { |entity| glossary.count { |row| row.fetch('entity_key') == entity } == 1 }
    SPECS.each do |entity, spec|
      definition = glossary.find { |row| row.fetch('entity_key') == entity }
      raise "saved glossary definition differs #{entity}" unless
        definition['english_canonical'] == spec.fetch(:english) &&
        definition['category'] == spec.fetch(:category) &&
        definition['korean_canonical'] == spec.fetch(:korean) &&
        definition['english_aliases'] == spec.fetch(:aliases)
    end
    candidate_pairs = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'saved source matcher scope differs' unless candidate_pairs.sort == expected_pairs.sort
    indexed = index.select { |row| SPECS.key?(row.fetch('entity_key')) }
                   .to_h { |row| [[row.fetch('entity_key'), *M.key(row)], row] }
    raise 'saved occurrence-index coverage differs' unless indexed.keys.sort == expected_pairs.sort
    reviews.each do |review|
      key = [review.fetch('entity_key'), *M.key(review)]
      row = indexed.fetch(key)
      live = inventory.fetch(M.key(review)).fetch('work_text')
      raise "saved index disposition differs #{key.inspect}" unless
        row.fetch('status') == review.fetch('status') &&
        row.fetch('evidence') == "D-#{D}: #{review.fetch('evidence')}" &&
        row.fetch('korean_current') == live
    end
    if File.file?(EDITS)
      edits = M.table(EDITS).map(&:to_h)
      raise 'saved edit-manifest coverage differs' unless
        edits.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort == expected_pairs.sort
      edits.each do |row|
        verify_prior_snapshot!(row)
      end
    end
    true
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'D21514 discovery outputs already exist' if
      [DEFINITIONS, REVIEWS, EDITS].any? { |path| File.exist?(path) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX).map(&:to_h)
    inventory = source_inventory
    definitions = definitions_for(glossary.headers)
    generated = generated_for(inventory, definitions)
    reviews = reviews_for(inventory, generated)
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    raise 'combined D21514 scope exceeds one batch' if reviews.length > 50
    reviews.select { |row| row.fetch('old') != row.fetch('new') }
           .group_by { |row| row.fetch('resource') }.each do |resource, targets|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), targets)
    end
    puts "Prepared D-#{D}: #{reviews.length} keys; " \
         "#{reviews.count { |row| row.fetch('old') != row.fetch('new') }} edits; " \
         "#{reviews.count { |row| row.fetch('status') == 'not-an-issue' }} retained."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'entity_key', 'status', 'old', 'new'))
    end
    [definitions, reviews, generated]
  end

  def apply
    glossary_path = ReviewedProperNameDiscovery::GLOSSARY
    glossary = M.table(glossary_path)
    index = M.table(M::INDEX)
    before = prior_records(index.map(&:to_h))
    definitions, reviews, generated = prepare
    raise 'glossary changed during D21514 preparation' unless
      M.table(glossary_path).map(&:to_h) == glossary.map(&:to_h)
    raise 'index changed during D21514 preparation' unless
      M.table(M::INDEX).map(&:to_h) == index.map(&:to_h)

    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])

    final_index = M.table(M::INDEX).map(&:to_h)
    verify_prior_records!(before, final_index)
    verify_applied_index!(final_index, reviews, generated)
    raise 'prior glossary records changed' unless
      M.table(glossary_path).map(&:to_h) == glossary.map(&:to_h) + definitions
    raise 'post-apply source/manifest verification failed' unless validate_saved_manifest!
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-blood-plague-primal-sprite-D21514.rb [prepare|apply]' if ARGV.length > 1
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then BloodPlaguePrimalSpriteD21514.prepare
  when 'apply' then BloodPlaguePrimalSpriteD21514.apply
  else abort 'usage: review-blood-plague-primal-sprite-D21514.rb [prepare|apply]'
  end
end
