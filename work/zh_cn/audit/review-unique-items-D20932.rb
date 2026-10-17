#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module UniqueItemsD20932
  M = ReviewedNameBatches
  DEFINITIONS_OUT = File.join(M::AUDIT, 'proper-name-discovery-definitions-D20932.tsv')
  REVIEWS_OUT = File.join(M::AUDIT, 'proper-name-discovery-D20932.tsv')
  MANUAL_CONTEXT_NOTE =
    'The official Korean manual PDF p. 7 (printed pp. 13-14) provides weapon-class background (Daggers: 대거; Longswords: 롱소드) and equipment-slot context only; it does not directly name these unique items and is not direct transliteration evidence.'
  OPAQUE = /\$[^$]*\$|<[^>\r\n]*>|\{[^{}\r\n]*\}/

  ITEM_SPECS = [
    {
      'entity_key' => 'unique_item:buru-boots',
      'english_canonical' => "Buru's Boots",
      'category' => 'unique item',
      'korean_canonical' => "부루의 장화(Buru's Boots)",
      'english_aliases' => 'boots of Buru',
      'korean_variants' => "부루(Buru)의 장화|부루의 장화|부루의 장화(boots of Buru)|부루의 장화(Buru's Boots)",
      'expected_keys' => [['base', '775', '11']] +
        %w[12375 1275 11431 19324 19834 23126 31391 31794 34661 41711 42732 43774
           44075 44948 45470 47595 47602 53067 53510 53518 55939 56974 62288]
          .map { |id| ['default', id, ''] },
      'notes' => 'A named pair of magical boots; English identifies the item and its association with hunter Ametair, while Japanese ブルのブーツ and Chinese 布鲁之靴 corroborate. Buru is retained only as part of this full item name; no person entity is inferred.'
    },
    {
      'entity_key' => 'unique_item:belnes-daggers-of-ire',
      'english_canonical' => "Belne's Daggers of Ire",
      'category' => 'unique item',
      'korean_canonical' => "벨른의 분노 단검(Belne's Daggers of Ire)",
      'english_aliases' => '',
      'korean_variants' => '벨른(Belne)의 분노의 단검|벨네(Belne)의 분노의 단검',
      'expected_keys' => [
        ['base', '3278', '11'],
        ['default', '62056', '']
      ],
      'notes' => 'The standalone base/default labels name a specific dagger item. English and Chinese 贝尔尼的愤怒匕首 anchor the complete item name; the named Japanese ベルンの憤怒のダガー in base:3278:11 corroborates. Belne is not registered separately as a person in this scope.'
    },
    {
      'entity_key' => 'unique_item:belnes-sword-of-ire',
      'english_canonical' => "Belne's Sword of Ire",
      'category' => 'unique item',
      'korean_canonical' => "벨른의 분노 검(Belne's Sword of Ire)",
      'english_aliases' => '',
      'korean_variants' => '벨른(Belne)의 분노의 검|벨네의 분노의 검',
      'expected_keys' => [
        ['base', '1595', '11'],
        ['default', '19647', '']
      ],
      'notes' => 'The standalone base/default labels name a specific sword item. English and Chinese 贝尔尼的愤怒之剑 anchor the complete item name; the named Japanese ベルンの憤怒の剣 in base:1595:11 corroborates. Belne is not registered separately as a person in this scope.'
    }
  ].freeze

  module_function

  def matcher_for(spec)
    case spec.fetch('entity_key')
    when 'unique_item:buru-boots'
      /부루(?:\s*\(Buru\))?의\s*장화(?:\s*\(Buru's Boots\))*/i
    when 'unique_item:belnes-daggers-of-ire'
      /벨(?:른|네)(?:\s*\(Belne\))?의\s*분노(?:의)?\s*단검(?:\s*\(Belne's Daggers of Ire\))*/i
    when 'unique_item:belnes-sword-of-ire'
      /벨(?:른|네)(?:\s*\(Belne\))?의\s*분노(?:의)?\s*검(?:\s*\(Belne's Sword of Ire\))*/i
    else
      raise "missing Korean name matcher for #{spec.fetch('entity_key')}"
    end
  end

  def expected_source_keys
    ITEM_SPECS.flat_map do |spec|
      spec.fetch('expected_keys').map { |key| [spec.fetch('entity_key'), *key] }
    end
  end

  def active_text_index(target_keys)
    keys_by_resource = target_keys.map { |entry| entry.drop(1) }
      .group_by(&:first)
    M::RESOURCES.to_h do |resource|
      expected = keys_by_resource.fetch(resource, [])
      if expected.empty?
        next [resource, {}]
      end
      rows = CSV.read(M.csv_path(resource), headers: true, col_sep: ';',
                      encoding: 'bom|utf-8')
      expected_set = expected.to_h { |key| [key, true] }
      indexed = {}
      rows.each do |row|
        key = [resource, row.fetch('ID_Linha'),
               resource == 'base' ? row.fetch('Tipo_Variante').to_s : '']
        next unless expected_set.key?(key)
        raise "duplicate active CSV target key in #{resource}: #{key.inspect}" if indexed.key?(key)
        indexed[key] = row.fetch('Texto')
      end
      raise "active target keys missing in #{resource}" unless
        indexed.keys.sort == expected_set.keys.sort
      [resource, indexed]
    end
  end

  def definition_rows(glossary_headers)
    ITEM_SPECS.map do |spec|
      source_ids = spec.fetch('expected_keys').map do |resource, id, variant|
        resource == 'base' ? "#{resource}:#{id}:#{variant}" : "#{resource}:#{id}"
      end
      values = {
        'entity_key' => spec.fetch('entity_key'),
        'english_canonical' => spec.fetch('english_canonical'),
        'category' => spec.fetch('category'),
        'korean_canonical' => spec.fetch('korean_canonical'),
        'english_aliases' => spec.fetch('english_aliases'),
        'korean_variants' => spec.fetch('korean_variants'),
        'evidence_ids' => (["D-20932"] + source_ids).join('|'),
        'status' => 'confirmed',
        'notes' => "#{spec.fetch('notes')} #{MANUAL_CONTEXT_NOTE}"
      }
      glossary_headers.to_h { |header| [header, values.fetch(header)] }
    end
  end

  def source_evidence_note(spec, key)
    case [spec.fetch('entity_key'), key]
    when ['unique_item:belnes-daggers-of-ire', ['default', '62056', '']]
      'For this row, Japanese 強力なダガー is generic and does not name the item; English and Chinese identify it, while named Japanese corroboration is from base:3278:11 (ベルンの憤怒のダガー).'
    when ['unique_item:belnes-sword-of-ire', ['default', '19647', '']]
      'For this row, Japanese 強力な剣 is generic and does not name the item; English and Chinese identify it, while named Japanese corroboration is from base:1595:11 (ベルンの憤怒の剣).'
    else
      ''
    end
  end

  def run
    raise 'unexpected command-line arguments' unless ARGV.empty?

    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    definitions = definition_rows(glossary.headers)
    existing_entities = glossary.map { |row| row['entity_key'] }
    raise 'discovery entity already exists in glossary' unless
      (definitions.map { |row| row['entity_key'] } & existing_entities).empty?

    existing_terms = glossary.flat_map do |row|
      ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
        .reject(&:empty?).map(&:downcase)
    end
    raise 'discovery English term collides with glossary' if
      definitions.any? do |row|
        ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
          .any? { |term| existing_terms.include?(term.downcase) }
      end

    inventory = M.table(M::INVENTORY).map(&:to_h)
    sources = inventory.to_h { |row| [M.key(row), row] }
    raise 'duplicate source keys in inventory' unless sources.length == inventory.length
    active = active_text_index(expected_source_keys)

    generated = build_occurrences(inventory, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    actual_keys = generated.map do |row|
      [row.fetch('entity_key'), *M.key(row)]
    end
    raise 'source occurrence scope differs from reviewed keys' unless
      actual_keys.sort == expected_source_keys.sort
    raise 'duplicate generated source occurrence' unless actual_keys.uniq.length == actual_keys.length

    specs = ITEM_SPECS.to_h { |spec| [spec.fetch('entity_key'), spec] }
    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = sources.fetch(key)
      raise "active source key missing: #{key.inspect}" unless active.fetch(key[0]).key?(key)
      raise "inventory differs from active Korean cell: #{key.inspect}" unless
        active.fetch(key[0]).fetch(key) == source.fetch('work_text')
      spec = specs.fetch(occurrence.fetch('entity_key'))
      old = source.fetch('work_text')
      matcher = matcher_for(spec)
      replacement_count = old.scan(matcher).length
      new_text = old.gsub(matcher) { spec.fetch('korean_canonical') }
      raise "missing Korean item label for #{key.inspect}" if replacement_count.zero?
      raise "opaque token changed for #{key.inspect}" unless
        old.scan(OPAQUE) == new_text.scan(OPAQUE)
      raise "line break changed for #{key.inspect}" unless
        old.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)
      raise "duplicate full English label for #{key.inspect}" if
        new_text.match?(/\(#{Regexp.escape(spec.fetch('english_canonical'))}\)\s*\(#{Regexp.escape(spec.fetch('english_canonical'))}\)/i)

      status = old == new_text ? 'not-an-issue' : 'accepted'
      row_evidence = source_evidence_note(spec, key)
      evidence = [spec.fetch('notes'), row_evidence, MANUAL_CONTEXT_NOTE,
                  'Normalize only the bounded item-name span(s) to the complete Korean-English label; preserve surrounding wording, particles, placeholders, and line breaks.']
        .reject(&:empty?).join(' ')
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => spec.fetch('entity_key'),
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => evidence,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(spec.fetch('entity_key') => status),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row.fetch('Tipo_Variante'), row.fetch('entity_key')]
    end

    raise 'review rows do not use ReviewedNameBatches headers' unless
      (M::HEADERS - reviews.flat_map(&:keys)).empty?
    raise 'review row count changed' unless reviews.length == 28
    raise 'unexpected output paths' unless [
      DEFINITIONS_OUT,
      REVIEWS_OUT
    ] == [
      File.join(M::AUDIT, 'proper-name-discovery-definitions-D20932.tsv'),
      File.join(M::AUDIT, 'proper-name-discovery-D20932.tsv')
    ]

    M.write_table(DEFINITIONS_OUT, glossary.headers, definitions)
    M.write_table(REVIEWS_OUT, M::HEADERS, reviews)
    puts "D-20932 prepared #{definitions.length} definitions and #{reviews.length} source-aligned review rows."
    reviews.group_by { |row| row.fetch('entity_key') }.each do |entity, rows|
      counts = rows.group_by { |row| row.fetch('status') }.transform_values(&:length)
      puts "#{entity}: #{rows.length} rows; #{counts.inspect}"
    end
  end
end

UniqueItemsD20932.run if $PROGRAM_NAME == __FILE__
