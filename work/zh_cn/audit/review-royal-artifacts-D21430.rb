#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module RoyalArtifactsD21430
  extend self

  M = ReviewedNameBatches
  D = 21_430
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")

  ITEMS = [
    {
      entity: 'unique_item:statue-of-king-ysa',
      english: 'Statue of King Ysa',
      korean: '이사 왕의 조각상',
      japanese: 'イーサ王の像',
      chinese: '伊萨王雕像',
      whole_cell: true,
      rows: [
        ['base', '1823', '11', '이사(Ysa) 왕의 석상'],
        ['default', '3873', '', '이사(Ysa) 왕의 동상']
      ],
      note: 'Use the neutral 조각상 wording supported by the generic source word for statue; do not infer stone, bronze, or another material.'
    },
    {
      entity: 'unique_item:king-ysas-muffin',
      english: "King Ysa's Muffin",
      korean: '이사 왕의 머핀',
      japanese: 'イーサ王のマフィン',
      chinese: '伊萨王的松饼',
      whole_cell: true,
      rows: [
        ['base', '2234', '11', '이사(Ysa) 왕의 머핀']
      ],
      note: 'Keep the complete named object label source-local; do not infer runtime inventory role, rarity, or a new King Ysa person disposition.'
    },
    {
      entity: 'unique_item:armor-of-ohn',
      english: 'Armor of Ohn',
      korean: '오운의 갑옷',
      japanese: 'オーンの鎧',
      chinese: '欧恩的护甲',
      whole_cell: false,
      rows: [
        ['default', '13403', '', '오운(Ohn)의 갑옷'],
        ['default', '31207', '', '오운의 갑옷'],
        ['default', '57863', '', '오언의 갑옷']
      ],
      note: "Keep this complete named object separate from person:lord-ohn; do not include bare Ohn references, Ohn Strength, Children of Ohn, or Ohn's Last Stand."
    }
  ].map(&:freeze).freeze

  PRESERVED_EXCLUSIONS = {
    'place:ysa' => [['base', '1823', '11'], ['base', '2234', '11'], ['default', '3873', '']],
    'person:king-ysa' => [['base', '1823', '11'], ['base', '2234', '11'], ['default', '3873', '']],
    'person:lord-ohn' => [['default', '13403', ''], ['default', '31207', ''], ['default', '57863', '']]
  }.freeze

  def expected_pairs
    ITEMS.flat_map do |item|
      item.fetch(:rows).map do |resource, id, variant, _old|
        [item.fetch(:entity), resource, id, variant]
      end
    end
  end

  def definitions_for(headers)
    ITEMS.map do |item|
      variants = (item.fetch(:rows).map(&:last) + [item.fetch(:korean)]).uniq
      fields = {
        'entity_key' => item.fetch(:entity),
        'english_canonical' => item.fetch(:english),
        'category' => 'unique item',
        'korean_canonical' => "#{item.fetch(:korean)}(#{item.fetch(:english)})",
        'english_aliases' => '',
        'korean_variants' => variants.join('|'),
        'evidence_ids' => "D-#{D}",
        'status' => 'confirmed',
        'notes' => "Source-local complete named object label, corroborated by aligned Japanese and Chinese. #{item.fetch(:note)} No runtime inventory role or rarity is claimed. Existing person/place scopes and their dispositions remain separate and unchanged."
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def exact_count(text, term)
    text.scan(Regexp.new(Regexp.escape(term))).length
  end

  def reviews_for(inventory, generated)
    actual_pairs = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'royal artifact source scope differs' unless actual_pairs.sort == expected_pairs.sort

    generated.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end.map do |occurrence|
      item = ITEMS.find { |candidate| candidate.fetch(:entity) == occurrence.fetch('entity_key') }
      key = M.key(occurrence)
      source = inventory.fetch(key)
      row_spec = item.fetch(:rows).find do |resource, id, variant, _old|
        [resource, id, variant] == key
      end
      raise "unexpected royal artifact key #{key.inspect}" unless row_spec

      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      if item.fetch(:whole_cell)
        raise "royal artifact evidence changed #{key.inspect}" unless
          english == item.fetch(:english) &&
          japanese == item.fetch(:japanese) &&
          chinese == item.fetch(:chinese) &&
          old == row_spec.fetch(3)
        new_text = "#{item.fetch(:korean)}(#{item.fetch(:english)})"
      else
        raise "royal artifact source alignment changed #{key.inspect}" unless
          exact_count(english, item.fetch(:english)) == 1 &&
          exact_count(japanese, item.fetch(:japanese)) == 1 &&
          exact_count(chinese, item.fetch(:chinese)) == 1
        old_span = row_spec.fetch(3)
        raise "royal artifact Korean span differs #{key.inspect}" unless exact_count(old, old_span) == 1
        new_text = old.sub(old_span, "#{item.fetch(:korean)}(#{item.fetch(:english)})")
      end

      entity = item.fetch(:entity)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => 'accepted', 'old' => old,
        'new' => new_text,
        'evidence' => "English gives the complete named object label #{item.fetch(:english)}; Japanese #{item.fetch(:japanese)} and Chinese #{item.fetch(:chinese)} corroborate it. Replace only the reviewed Korean label span with a neutral atomic Korean/English title, preserving surrounding dialogue and line breaks. #{item.fetch(:note)} No runtime inventory role or rarity is inferred; this source-local unique-item scope does not merge or change any prior person/place disposition.",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(entity => 'accepted')
      }
    end
  end

  def preserved_exclusions(index_rows)
    indexed = index_rows.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row]
    end
    PRESERVED_EXCLUSIONS.flat_map do |entity, keys|
      keys.map do |resource, id, variant|
        key = [entity, resource, id, variant]
        row = indexed.fetch(key) { raise "prior exclusion missing #{key.inspect}" }
        raise "prior exclusion changed #{key.inspect}" unless row.fetch('status') == 'excluded'

        [key, [row.fetch('status'), row.fetch('evidence')]]
      end
    end.to_h
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'prepared outputs already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    definitions = definitions_for(glossary.headers)
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    index = M.table(M::INDEX).map(&:to_h)
    preserved_exclusions(index)
    reviews = reviews_for(inventory, generated)

    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row.fetch('resource') }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
    end
    puts "Prepared D-#{D}: three complete named object labels, six keys across base/default."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'old', 'new'))
    end
    [definitions, reviews]
  end

  def apply
    index_path = M::INDEX
    prior_exclusions = preserved_exclusions(M.table(index_path).map(&:to_h))
    definitions, reviews = prepare
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    raise 'prior King Ysa/Ohn exclusions changed' unless
      preserved_exclusions(M.table(index_path).map(&:to_h)) == prior_exclusions
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then RoyalArtifactsD21430.prepare
  when 'apply' then RoyalArtifactsD21430.apply
  else abort 'usage: review-royal-artifacts-D21430.rb [prepare|apply]'
  end
end
