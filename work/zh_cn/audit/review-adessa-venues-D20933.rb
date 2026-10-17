#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module AdessaVenuesD20933
  extend self

  M = ReviewedNameBatches
  SPECS = [
    ['place:arcadium', 'Arcadium', '아르카디움(Arcadium)', '아카디움',
     'base:2658:11|default:15551|default:34473',
     "English identifies Arcadium as Adessa's named trade and craft venue, not a generic arena or a region. Across the aligned corpus, Japanese アルカディウム supports the name; Chinese usually translates the venue semantically as 竞技场. Retain the established Korean 아르카디움 and correct the observed 아카디움 variant."],
    ['place:livrarium', 'Livrarium', '리브라리움(Livrarium)', '도서원',
     'base:1851:11|default:34342|default:64862',
     'English identifies the named Adessan library and scholarly institution. Across the aligned corpus, Japanese 図書院 and Chinese 图书馆 generally translate the institution semantically; Korean uses 리브라리움 and the contextual variant 도서원. Complete compounds Livrarium Vaults and Adessa Livrarium are excluded here for separate atomic review.'],
    ['place:gemstone-tavern', 'Gemstone Tavern', '젬스톤 여관(Gemstone Tavern)',
     '젬스톤 여관(Gemstone Inn)|젬스톤 선술집(Gemstone Tavern)|젬스톤 주점(Gemstone Tavern)|젬스톤(The Gemstone)|젬스톤(Gemstone)|젬스톤 여관|젬스톤 선술집|보석 술집|보석 여관',
     'default:3617|default:9395|default:15209|default:15247|default:16928|default:22192|default:29501|default:40402|default:42271|default:49829|default:54980|default:56004|default:56333|default:59371|default:61956|default:63468',
     'English identifies the Gemstone Tavern as the family establishment in Gale Crossing; aligned English contexts also call this same Mallory-associated business the Gemstone Inn or the Gemstone. Japanese and Chinese independently describe the same tavern/business across these references. Use Gemstone Tavern as the canonical full name, retain Gemstone Inn as a source alias, and keep short English Gemstone references locally short. Generic gemstone items and materials are not venue mentions.'],
  ].freeze

  PATTERNS = {
    'place:arcadium' => /(?:아르카디움|아카디움)(?:\(Arcadium\))?/,
    'place:livrarium' => /리브라리움(?:\(Livrarium\))?/
  }.freeze
  GEMSTONE_ENTITY = 'place:gemstone-tavern'
  GEMSTONE_CANONICAL = '젬스톤 여관(Gemstone Tavern)'
  GEMSTONE_SHORT = '젬스톤(Gemstone)'
  GEMSTONE_ROW_RULES = {
    ['default', '15209', ''] => ['젬스톤 여관', GEMSTONE_CANONICAL],
    ['default', '15247', ''] => ['젬스톤 여관', GEMSTONE_CANONICAL],
    ['default', '16928', ''] => ['젬스톤 선술집(Gemstone Tavern)', GEMSTONE_CANONICAL],
    ['default', '29501', ''] => ['보석 술집', GEMSTONE_CANONICAL],
    ['default', '40402', ''] => ['보석 여관', GEMSTONE_CANONICAL],
    ['default', '56333', ''] => ['젬스톤 주점(Gemstone Tavern)', GEMSTONE_CANONICAL],
    ['default', '3617', ''] => ['젬스톤(Gemstone)', GEMSTONE_SHORT],
    ['default', '9395', ''] => ['젬스톤(The Gemstone)', GEMSTONE_SHORT],
    ['default', '22192', ''] => ['젬스톤(Gemstone)', GEMSTONE_SHORT],
    ['default', '42271', ''] => ['젬스톤에서', "#{GEMSTONE_SHORT}에서"],
    ['default', '49829', ''] => ['보석 술집에서', "#{GEMSTONE_SHORT}에서"],
    ['default', '54980', ''] => ['젬스톤(Gemstone)', GEMSTONE_SHORT],
    ['default', '56004', ''] => ['젬스톤(Gemstone)', GEMSTONE_SHORT],
    ['default', '59371', ''] => ['젬스톤에', "#{GEMSTONE_SHORT}에"],
    ['default', '63468', ''] => ['젬스톤(Gemstone)', GEMSTONE_SHORT],
    ['default', '61956', ''] => ['젬스톤 여관(Gemstone Inn)', '젬스톤 여관(Gemstone Inn)']
  }.freeze
  GEMSTONE_ORDINARY_KEYS = [
    ['base', '2998', '11'],
    ['default', '16541', ''],
    ['default', '43263', ''],
    ['default', '45148', ''],
    ['default', '54994', ''],
    ['default', '56656', ''],
    ['default', '57760', '']
  ].freeze
  EXCLUDED_KEYS = {
    ['base', '3154', '11'] => 'The exact source compound Livrarium Vaults is outside the generic Livrarium entity scope; preserve the full Korean cell for separate atomic review.',
    ['default', '28432', ''] => 'The exact source compound Adessa Livrarium is outside the generic Livrarium entity scope; preserve the full Korean cell for separate atomic review.',
    ['default', '42535', ''] => 'The exact source compound Adessa Livrarium is outside the generic Livrarium entity scope; preserve the existing Korean components without adding a nested or duplicate label.',
    ['default', '50551', ''] => 'The exact source compound Adessa Livrarium is outside the generic Livrarium entity scope; preserve the full Korean cell for separate atomic review.',
    ['default', '53552', ''] => 'The exact source compound Adessa Livrarium is outside the generic Livrarium entity scope; preserve the existing complete bilingual label.',
    ['base', '2998', '11'] => 'Ruby Gemstone denotes a gem item/material, not the Gale Crossing establishment; preserve the Korean item name.',
    ['default', '16541', ''] => 'The English source means a physical bright gemstone in a necklace, not the tavern; preserve the Korean prose.',
    ['default', '43263', ''] => 'The English source means a gemstone set in a ring, not the tavern; preserve the Korean prose.',
    ['default', '45148', ''] => 'The English source means a quartz gemstone in a ring, not the tavern; preserve the Korean prose.',
    ['default', '54994', ''] => 'The English source means a craftable rare gemstone, not the tavern; preserve the Korean prose.',
    ['default', '56656', ''] => 'The English source means a craftable rare gemstone, not the tavern; preserve the Korean prose.',
    ['default', '57760', ''] => 'The English source means a physical gemstone, not the tavern; preserve the Korean prose.'
  }.freeze
  ROW_EVIDENCE = {
    ['default', '15551', ''] => 'Chapter-heading exception: EN Chapter VI and ZH 第六章 agree with the existing Korean 제6장, while JA says 第4章. Preserve 제6장 and the heading punctuation; normalize only the embedded Arcadium name.',
    ['default', '34473', ''] => 'Source-name divergence: EN Arcadium and JA アルカディウム identify the Adessa trade venue, while ZH calls it 阿卡迪亚. Follow the English identity and the existing Korean; do not import the Chinese variant.',
    ['default', '34342', ''] => 'EN explicitly names the Livrarium in a list with the Basilica; JA 図書院, ZH 图书馆, and Korean 도서원 use semantic translations. This context identifies the same institution, so normalize only 도서원.',
    ['default', '64862', ''] => 'Source spelling exception: EN identifies the Livrarium, JA uses リブラニウム rather than the usual 図書院, and ZH translates it as 图书馆. Retain the established Korean name and do not treat the Japanese spelling as a separate place.'
  }.freeze
  GEMSTONE_ROW_EVIDENCE = {
    ['default', '15209', ''] => 'English explicitly says Gemstone Tavern; Japanese ジェムストーン酒場 and Chinese 宝石酒馆 corroborate the tavern. Normalize the Korean venue label only.',
    ['default', '15247', ''] => 'English explicitly places the Gemstone Tavern in Gale Crossing; Japanese ジェムストーン酒場 and Chinese 宝石酒馆 corroborate the venue. Normalize only its Korean label.',
    ['default', '16928', ''] => 'English, Japanese, and Chinese identify the Gemstone Tavern as the venue where the player can meet the people. Standardize only the full Korean venue label.',
    ['default', '29501', ''] => 'English and Japanese explicitly identify the Gemstone Tavern; Chinese 宝石酒馆 supports the establishment. The Korean 보석 술집 is a semantic rendering of this place, not a generic tavern.',
    ['default', '40402', ''] => 'This standalone English source label is Gemstone Tavern; Japanese ジェムストーン宿屋 and Chinese 宝石酒馆 corroborate the establishment. Replace only the Korean place label.',
    ['default', '56333', ''] => 'Mallory calls the Gemstone Tavern her family place in English; Japanese ジェムストーン酒場 and Chinese 宝石酒馆 corroborate it. Normalize only the Korean full label.',
    ['default', '61956', ''] => 'This is the same Mallory-associated Gale Crossing establishment, but this source specifically says Gemstone Inn. Preserve the exact Korean source-local label 젬스톤 여관(Gemstone Inn).',
    ['default', '9395', ''] => 'English describes the Gemstone as a place for scholarly study and Chinese says 宝石酒馆. Japanese is semantically garbled here; retain the locally shortened Korean form 젬스톤(Gemstone), not a full Tavern label.',
    ['default', '49829', ''] => 'English says Blackwood drinks at the Gemstone and Chinese identifies 宝石酒馆. Korean 보석 술집 is a semantic rendering of the same establishment; normalize this short reference only.',
    ['default', '42271', ''] => 'The welcome addressed to a visitor at the Gemstone is supported by Chinese 宝石酒馆; Japanese also uses ジェムストーン. Keep the English short-name structure in Korean.',
    ['default', '59371', ''] => 'English invites the player to the Gemstone and names Mallory; Japanese and Chinese identify the same tavern. Keep this short reference locally short.',
    ['default', '3617', ''] => 'English says the speaker works a shift at the Gemstone; Japanese and Chinese identify the tavern. The Korean short bilingual label is already source-aligned.',
    ['default', '22192', ''] => 'English says to meet behind the Gemstone; Japanese and Chinese describe the same venue. Preserve the source short form and the postposition.',
    ['default', '54980', ''] => 'English welcomes the player to the Gemstone; Chinese 宝石酒馆 and Japanese quoted ジェムストーン support the establishment. The Korean short bilingual label is already aligned.',
    ['default', '56004', ''] => 'English calls Luethar a regular around the Gemstone; Japanese and Chinese identify the tavern. The Korean short bilingual label is already aligned.',
    ['default', '63468', ''] => 'The speaker says she will be at the Gemstone and ready for a drink; Japanese and Chinese identify the tavern. Preserve the source short form.'
  }.freeze
  MANUAL_EVIDENCE = 'The official Korean manual PDF pp. 1 and 7 provides setting and quest context only and does not name these venues; Korean spelling evidence comes from the English source and aligned corpus.'

  def transform(text, entity, canonical, key)
    if entity == GEMSTONE_ENTITY
      expected = GEMSTONE_ROW_RULES.fetch(key) do
        raise "missing reviewed Gemstone row rule #{key.inspect}"
      end
      old_span, new_span = expected
      raise "unexpected Korean Gemstone span #{key.inspect}" unless text.scan(old_span).length == 1
      return text.sub(old_span, new_span)
    end

    if entity == 'place:livrarium' && key == ['default', '34342', '']
      raise 'unexpected Korean translation at default:34342' unless text.scan('도서원').length == 1
      return text.sub('도서원', canonical)
    end

    text.gsub(PATTERNS.fetch(entity), canonical)
  end

  def run
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    existing_keys = glossary.map { |row| row['entity_key'] }
    raise 'an entity is already registered' unless (SPECS.map(&:first) & existing_keys).empty?

    index = M.table(File.join(__dir__, 'proper-name-occurrences.tsv'))
    indexed_keys = index.map { |row| row['entity_key'] }
    raise 'an entity already has indexed occurrences' unless (SPECS.map(&:first) & indexed_keys).empty?

    definitions = SPECS.map do |key, english, korean, variants, ids, notes|
      alias_note = if key == GEMSTONE_ENTITY
        'The English aliases are source-attested local forms for this same establishment.'
      else
        'No unobserved aliases are added.'
      end
      {
        'entity_key' => key, 'english_canonical' => english, 'category' => 'place',
        'korean_canonical' => korean,
        'english_aliases' => key == GEMSTONE_ENTITY ? 'Gemstone Inn|Gemstone' : '',
        'korean_variants' => variants, 'evidence_ids' => "D-20933-D-20935|#{ids}",
        'status' => 'confirmed',
        'notes' => "#{notes} English is the identity anchor. #{alias_note} #{MANUAL_EVIDENCE} No PAK-derived evidence."
      }
    end

    inventory = M.table(M::INVENTORY).map(&:to_h)
    inventory_by_key = inventory.to_h { |row| [M.key(row), row] }
    generated = build_occurrences(inventory, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected_counts = {
      'place:arcadium' => 35,
      'place:livrarium' => 44,
      GEMSTONE_ENTITY => 23
    }
    actual_counts = generated.group_by { |row| row['entity_key'] }.transform_values(&:length)
    raise "unexpected English source counts: #{actual_counts.inspect}" unless actual_counts == expected_counts

    entities = definitions.to_h { |row| [row.fetch('entity_key'), row] }
    reviews = generated.group_by { |row| M.key(row) }.map do |key, matches|
      source = inventory_by_key.fetch(key)

      old = source.fetch('work_text')
      text = old.dup
      dispositions = {}
      evidence = []

      matches.each do |match|
        entity_key = match.fetch('entity_key')
        entity = entities.fetch(entity_key)
        evidence << entity.fetch('notes')
        if (exclusion = EXCLUDED_KEYS[key])
          allowed = entity_key == 'place:livrarium' || (entity_key == GEMSTONE_ENTITY && GEMSTONE_ORDINARY_KEYS.include?(key))
          raise "unexpected exclusion #{key.inspect}" unless allowed
          dispositions[entity_key] = 'excluded'
          evidence << exclusion
          next
        end

        canonical = entity.fetch('korean_canonical')
        transformed = transform(text, entity_key, canonical, key)
        korean_hit = if entity_key == GEMSTONE_ENTITY
          transformed.include?(GEMSTONE_ROW_RULES.fetch(key).last)
        elsif entity_key == 'place:livrarium' && key == ['default', '34342', '']
          transformed.include?(canonical)
        else
          transformed.match?(Regexp.new(Regexp.escape(canonical)))
        end
        raise "unmatched Korean name span #{key.inspect}" unless korean_hit
        dispositions[entity_key] = transformed == text ? 'not-an-issue' : 'accepted'
        text = transformed
        evidence << ROW_EVIDENCE[key] if ROW_EVIDENCE.key?(key)
        evidence << GEMSTONE_ROW_EVIDENCE[key] if GEMSTONE_ROW_EVIDENCE.key?(key)
      end

      row_status = if dispositions.values.all? { |status| status == 'excluded' }
        'excluded'
      elsif dispositions.values.include?('uncertain')
        'uncertain'
      elsif text != old
        'accepted'
      else
        'not-an-issue'
      end

      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => matches.map { |row| row['entity_key'] }.join('|'),
        'status' => row_status,
        'old' => old, 'new' => text, 'evidence' => evidence.join(' '),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end.sort_by { |row| [row.fetch('resource'), row.fetch('ID_Linha').to_i, row['Tipo_Variante']] }

    raise 'duplicate proposal row key' unless reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    raise "unexpected distinct row count: #{reviews.length}" unless reviews.length == 102
    expected_exclusions = EXCLUDED_KEYS.keys
    raise 'expected exclusion key missing' unless (expected_exclusions - reviews.map { |row| M.key(row) }).empty?
    gemstone_keys = reviews.select { |row| row['entity_key'] == GEMSTONE_ENTITY }.map { |row| M.key(row) }
    raise 'Gemstone matcher row set changed' unless gemstone_keys.sort == (GEMSTONE_ROW_RULES.keys + GEMSTONE_ORDINARY_KEYS).sort

    definitions_path = File.join(__dir__, 'proper-name-discovery-definitions-D20933.tsv')
    discovery_path = File.join(__dir__, 'proper-name-discovery-D20933.tsv')
    M.write_table(definitions_path, glossary.headers, definitions)
    M.write_table(discovery_path, M::HEADERS, reviews)

    puts "#{definitions.length} definitions; #{generated.length} entity occurrences; #{reviews.length} distinct rows"
    puts reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect
    puts reviews.flat_map { |row| row['entity_key'].split('|') }
      .group_by(&:itself).transform_values(&:length).inspect
  end
end

AdessaVenuesD20933.run if $PROGRAM_NAME == __FILE__
