#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'
require_relative 'apply-reviewed-proper-name-discovery'

# Prepare source-enriched manifests only. This script never registers entities,
# edits the occurrence index, or applies translations to active CSVs.
module ReviewEasternNorthernPlacesD21010
  M = ReviewedNameBatches
  DISCOVERY = ReviewedProperNameDiscovery
  OUTPUT_DEFINITIONS = '/private/tmp/proper-name-discovery-definitions-D21010-places.tsv'
  OUTPUT_REVIEWS = '/private/tmp/proper-name-discovery-proposals-D21010-places.tsv'
  EXPECTED_COUNTS = {
    'place:shadow-pass' => 27,
    'place:icebrine-coast' => 23,
    'place:splitrock-depths' => 18
  }.freeze
  DEFINITIONS = [
    {
      'entity_key' => 'place:shadow-pass',
      'english_canonical' => 'Shadow Pass',
      'category' => 'place',
      'korean_canonical' => '그림자 고개(Shadow Pass)',
      'english_aliases' => '',
      'korean_variants' => '섀도 패스',
      'evidence_ids' => '',
      'status' => 'confirmed',
      'notes' => 'Named place: English is the identity anchor; Japanese 暗闇の道 and Chinese 暗影关口 corroborate the same location. The active Korean corpus favors 그림자 고개 over 섀도 패스, so use 그림자 고개(Shadow Pass). The official Korean manual was checked for setting context but does not provide a direct spelling for this name.'
    },
    {
      'entity_key' => 'place:icebrine-coast',
      'english_canonical' => 'Icebrine Coast',
      'category' => 'place',
      'korean_canonical' => '아이스브라인 해안(Icebrine Coast)',
      'english_aliases' => 'Icebrine',
      'korean_variants' => '아이스브린 해안|얼음소금 해안|아이스브라인',
      'evidence_ids' => '',
      'status' => 'confirmed',
      'notes' => 'Named northern coastal region. Japanese アイスブリン海岸 / アイスブリン and Chinese 冰盐海岸 corroborate the region; English Coast versus standalone Icebrine distinguishes full and short references. Use 아이스브라인 해안(Icebrine Coast) for the full place and 아이스브라인(Icebrine) for the locally used short form. Preserve the source-specific semantic rendering in default:64862 only as a reviewed transformation. The official Korean manual was checked for background but supplies no direct spelling.'
    },
    {
      'entity_key' => 'place:splitrock-depths',
      'english_canonical' => 'Splitrock Depths',
      'category' => 'place',
      'korean_canonical' => '스플릿록 심층부(Splitrock Depths)',
      'english_aliases' => '',
      'korean_variants' => '스플릿록 심연|스플릿록 지하',
      'evidence_ids' => '',
      'status' => 'confirmed',
      'notes' => 'Named cave/depths location. Japanese スプリットロック洞窟 and Chinese 裂石深坑 corroborate the full location. Standardize the existing sound-backed 스플릿록 with 심층부; do not treat generic 지하/심연 as separate places. The official Korean manual was checked for setting context but does not provide a direct spelling.'
    }
  ].freeze

  KOREAN_FORMS = {
    'place:shadow-pass' => [
      '그림자\\s*고개',
      '섀도\\s*패스'
    ].freeze,
    'place:icebrine-coast' => [
      '아이스브라인\\s*해안',
      '아이스브린\\s*해안',
      '얼음소금\\s*해안',
      '아이스브라인',
      '아이스브린'
    ].freeze,
    'place:splitrock-depths' => [
      '스플릿록\\s*심층부',
      '스플릿록\\s*심연',
      '스플릿록\\s*지하'
    ].freeze
  }.freeze
  PARTICLE_FIXES = {
    ['default', '14182', ''] => ['으로', '로', 1],
    ['default', '19228', ''] => ['을', '를', 1],
    ['default', '39195', ''] => ['을', '를', 1],
    ['default', '57331', ''] => ['으로', '로', 1]
  }.freeze

  module_function

  def source_texts(row, locale)
    JSON.parse(row.fetch("#{locale}_texts_json") || '[]').compact
  end

  def order_key(row)
    [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
     row['Tipo_Variante'].to_s]
  end

  def english_name_count(texts, entity_key)
    patterns = {
      'place:shadow-pass' => /\bShadow Pass\b/i,
      'place:icebrine-coast' => /\bIcebrine(?: Coast)?\b/i,
      'place:splitrock-depths' => /\bSplitrock Depths\b/i
    }
    texts.sum { |text| text.scan(patterns.fetch(entity_key)).length }
  end

  def korean_pattern(entity_key)
    alternatives = KOREAN_FORMS.fetch(entity_key)
    Regexp.new("(?<![가-힣])(?<name>#{alternatives.join('|')})")
  end

  def transform_regular(text, source, definition)
    entity_key = definition.fetch('entity_key')
    pattern = korean_pattern(entity_key)
    matches = text.to_enum(:scan, pattern).map { Regexp.last_match.dup }
    return [text, 'uncertain',
            'English identifies this place, but no reviewed Korean place-name span was found; left unchanged.'] if matches.empty?

    patches = []
    particle_adjustments = 0
    matches.each do |match|
      korean, english = display_label(entity_key, match[:name], definition)
      tail = text[match.end(0)..].to_s
      finish = match.end(0)
      if tail.match?(/\A\s*\(/)
        label_match = tail.match(/\A\s*\(([^()]*)\)/)
        unless label_match && label_match[1].strip.casecmp?(english)
          return [text, 'uncertain',
                  'A noncanonical or structurally ambiguous parenthetical follows the place-name span; left the whole cell unchanged.']
        end
        finish += label_match[0].length
      end
      replacement = "#{korean}(#{english})"
      particle_fix = PARTICLE_FIXES[M.key(source)]
      if entity_key == 'place:splitrock-depths' &&
         match[:name].match?(/심연\z/) && particle_fix
        old_particle, new_particle, _expected_count = particle_fix
        if text[finish..].to_s.start_with?(old_particle)
          finish += old_particle.length
          replacement += new_particle
          particle_adjustments += 1
        end
      end
      patches << [match.begin(0), finish, replacement]
    end
    if (particle_fix = PARTICLE_FIXES[M.key(source)]) &&
       particle_adjustments != particle_fix[2]
      return [text, 'uncertain',
              "Expected #{particle_fix[2]} reviewed #{particle_fix[0]} particle allomorph change(s), found #{particle_adjustments}; left the whole cell unchanged."]
    end

    updated = text.dup
    patches.sort_by { |patch| -patch[0] }.each do |start, finish, replacement|
      updated[start...finish] = replacement
    end
    status = updated == text ? 'not-an-issue' : 'accepted'
    detail = status == 'accepted' ?
      'Normalized only bounded, source-aligned place-name spans; retained grammatical particles, applying only the required vowel-final allomorphs, and preserved punctuation, surrounding compounds, line breaks, and unrelated annotations.' :
      'The source-aligned place-name span already uses the reviewed bilingual canonical; left unchanged.'
    [updated, status, detail]
  end

  def display_label(entity_key, korean_name, definition)
    if entity_key == 'place:icebrine-coast' && korean_name !~ /해안/
      ['아이스브라인', 'Icebrine']
    else
      [definition.fetch('korean_canonical').sub(/\([^()]*\)\z/, ''),
       definition.fetch('english_canonical')]
    end
  end

  def transform_icebrine_exception(text, source)
    english = source_texts(source, 'en').join("\n")
    coast_count = english.scan(/\bIcebrine Coast\b/i).length
    short_count = english.scan(/\bIcebrine\b/i).length - coast_count
    forms = text.to_enum(:scan, /(?<![가-힣])얼음소금\s*해안/).map do
      Regexp.last_match.dup
    end
    unless coast_count == 1 && short_count == 1 && forms.length == 2
      return [text, 'uncertain',
              'default:64862 no longer has the reviewed one-full/one-short English-to-Korean span layout; left unchanged.']
    end

    replacements = [
      '아이스브라인 해안(Icebrine Coast)',
      '아이스브라인(Icebrine)'
    ]
    updated = text.dup
    forms.each_with_index.to_a.reverse_each do |(match, index)|
      updated[match.begin(0)...match.end(0)] = replacements.fetch(index)
    end
    [
      updated,
      'accepted',
      'default:64862 contains one full English Icebrine Coast reference in the story-location parenthetical and one later standalone Icebrine reference. Japanese アイスブリン海岸 / アイスブリン and Chinese 冰盐海岸 corroborate the location. Mapped the first Korean 얼음소금 해안 to 아이스브라인 해안(Icebrine Coast), the later prose span to 아이스브라인(Icebrine), and preserved both following particles and the complete book text.'
    ]
  end

  def transform(text, source, definition)
    if M.key(source) == ['default', '64862', ''] &&
       definition.fetch('entity_key') == 'place:icebrine-coast'
      transform_icebrine_exception(text, source)
    else
      transform_regular(text, source, definition)
    end
  end

  def make_evidence(definition, source, detail)
    english_texts = source_texts(source, 'en')
    japanese_texts = source_texts(source, 'ja')
    chinese = source.fetch('zh_text').to_s
    raise "missing aligned English/Japanese/Chinese source at #{M.key(source).inspect}" if
      english_texts.empty? || japanese_texts.empty? || chinese.empty?

    [
      "#{detail} English anchor: #{definition.fetch('english_canonical')} (short alias where explicitly defined).",
      'The complete aligned Japanese and Chinese source cells are included in the evidence columns and were checked for this exact row.',
      'Official Korean manual background was checked; it is not used to infer an unsupported spelling.'
    ].join(' ')
  end

  def run
    inventory_rows = M.table(M::INVENTORY).map(&:to_h)
    inventory = inventory_rows.to_h { |row| [M.key(row), row] }
    raise 'duplicate aligned inventory key' unless inventory.length == inventory_rows.length
    definitions = DEFINITIONS.map(&:dup)
    definitions.each do |definition|
      keys = ([definition['english_canonical']] +
              definition['english_aliases'].to_s.split('|')).reject(&:empty?)
      definition['evidence_ids'] = inventory_rows.select do |row|
        english_name_count(source_texts(row, 'en'), definition.fetch('entity_key')) > 0
      end.sort_by { |row| order_key(row) }
        .map { |row| M.key(row).join(':') }.join('|')
      actual = definition['evidence_ids'].split('|').length
      expected = EXPECTED_COUNTS.fetch(definition.fetch('entity_key'))
      raise "#{definition['entity_key']} expected #{expected} source keys, got #{actual}" unless actual == expected
      raise "empty canonical/alias set for #{definition['entity_key']}" if keys.empty?
    end

    generated = build_occurrences(inventory_rows, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    counts = generated.group_by { |row| row.fetch('entity_key') }
      .transform_values(&:length)
    raise "source-key counts differ: #{counts.inspect}" unless counts == EXPECTED_COUNTS
    keys_by_entity = generated.group_by { |row| row.fetch('entity_key') }
      .transform_values { |rows| rows.map { |row| M.key(row) }.to_set }
    raise 'place source-key groups overlap' unless
      keys_by_entity.values.combination(2).all? { |left, right| (left & right).empty? }
    generated.each do |row|
      source = inventory.fetch(M.key(row))
      raise "missing aligned locale at #{M.key(row).inspect}" if
        source_texts(source, 'en').empty? || source_texts(source, 'ja').empty? ||
        source.fetch('zh_text').to_s.empty?
    end

    glossary_table = M.table(DISCOVERY::GLOSSARY)
    index_table = M.table(M::INDEX)
    glossary = glossary_table.map(&:to_h)
    index = index_table.map(&:to_h)
    reviews = generated.map do |occurrence|
      definition = definitions.find { |row| row.fetch('entity_key') == occurrence.fetch('entity_key') }
      source = inventory.fetch(M.key(occurrence))
      old = source.fetch('work_text').to_s
      english = source_texts(source, 'en').join("\n---\n")
      japanese = source_texts(source, 'ja').join("\n---\n")
      chinese = source.fetch('zh_text').to_s
      new_text, status, detail = transform(old, source, definition)
      {
        'resource' => source.fetch('resource'),
        'ID_Linha' => source.fetch('ID_Linha'),
        'Tipo_Variante' => source['Tipo_Variante'].to_s,
        'entity_key' => definition.fetch('entity_key'),
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => make_evidence(definition, source, detail),
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(definition.fetch('entity_key') => status),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end.sort_by { |row| order_key(row) }

    DISCOVERY.validate!(definitions, reviews, generated, glossary, index)
    DISCOVERY.validate_sources!(reviews, inventory)
    raise 'duplicate reviewed place row key' unless
      reviews.map { |row| M.key(row) }.uniq.length == reviews.length

    M.write_table(OUTPUT_DEFINITIONS, glossary_table.headers, definitions)
    M.write_table(OUTPUT_REVIEWS, M::HEADERS, reviews)
    statuses = reviews.group_by { |row| row.fetch('status') }
      .transform_values(&:length)
    puts "Prepared #{reviews.length} source keys (#{counts.inspect}); row statuses=#{statuses.inspect}."
    puts "Definitions: #{OUTPUT_DEFINITIONS}"
    puts "Proposals: #{OUTPUT_REVIEWS}"
    puts 'No active CSV, glossary, index, or documentation files were written.'
  end
end

ReviewEasternNorthernPlacesD21010.run if $PROGRAM_NAME == __FILE__
