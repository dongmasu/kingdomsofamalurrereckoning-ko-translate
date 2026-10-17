#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module RelatedTitlesDiscoveryD21069
  M = ReviewedNameBatches
  DEFINITIONS = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21069.tsv')
  REVIEWS = File.join(M::AUDIT, 'proper-name-discovery-D21069.tsv')
  SPECS = [
    ['work:orella-notes', 'Orella‘s Notes', 'named work',
     '오렐라의 기록(Orella‘s Notes)', "Orella's Notes|Orella’s Notes",
     [['base', '1328', '11']],
     'Japanese オレラのメモ and Chinese 奥雷拉的笔记 identify this standalone scroll title. Preserve the unusual left-curly apostrophe used in its English source label. The lowercase descriptive occurrence at default:31251 is not an exact title label.'],
    ['work:diary-of-myfa-rhonwen', 'Diary of Myfa Rhonwen', 'named work',
     '마이파 론웬의 일기(Diary of Myfa Rhonwen)', '',
     [['base', '2227', '11'], ['default', '53222', '']],
     'Japanese ミファ・ロンウェンの日記 / マイファ・ロンウェンの日記 and Chinese 米法·罗文的日记 identify the same diary. Reuse the approved person spelling 마이파 론웬 while pairing the complete book title, not just its author name.'],
    ['place:skald-house', "Skald's House", 'place',
     "스칼드의 집(Skald's House)", 'Skald‘s House|Skald’s House',
     [['default', '23359', '']],
     'Japanese スカルドの家 and Chinese 斯卡尔德的房子 corroborate the complete standalone place label. It is already paired and remains unchanged.'],
    ['place:skald-forge', "Skald's Forge", 'place',
     "스칼드의 대장간(Skald's Forge)", 'Skald‘s Forge|Skald’s Forge',
     [['default', '62878', '']],
     'Japanese スカルドの鍛冶場 and Chinese 斯卡尔德的熔炉 corroborate the complete standalone place label. Add its missing full-title English label. Lowercase descriptive possessives in narrative rows remain in the separately reviewed person scope; this does not establish every forge mention as the identical map-title object.']
  ].freeze

  module_function

  def definitions
    SPECS.map do |entity, english, category, korean, aliases, keys, evidence|
      {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => category, 'korean_canonical' => korean,
        'english_aliases' => aliases, 'korean_variants' => korean.sub(/\(.*/, ''),
        'evidence_ids' => (['D-21069'] + keys.map { |key| key.join(':') }).join('|'),
        'status' => 'confirmed',
        'notes' => "#{evidence} English is the title/identity anchor; the official manual provides crafting and quest context, not an exhaustive DLC title list. Existing person and historical sequential dispositions are not reopened or recounted."
      }
    end
  end

  def title_key?(entity, key)
    SPECS.find { |spec| spec[0] == entity }.fetch(5).include?(key)
  end

  def reviewed_text(source, matches, defs)
    key = M.key(source)
    title = matches.find { |match| title_key?(match['entity_key'], key) }
    title ? defs.find { |definition| definition['entity_key'] == title['entity_key'] }.fetch('korean_canonical') :
      source.fetch('work_text')
  end

  def run
    inventory = M.refresh_inventory
    defs = definitions
    generated = build_occurrences(inventory.values, defs).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    SPECS.each do |entity, _, _, _, _, keys, _|
      keys.each do |key|
        raise "missing exact title key #{entity} #{key.inspect}" unless
          generated.any? { |match| match['entity_key'] == entity && M.key(match) == key }
      end
    end
    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = reviewed_text(source, matches, defs)
      dispositions = matches.to_h do |match|
        status = if title_key?(match['entity_key'], key)
                   old == new_text ? 'not-an-issue' : 'accepted'
                 else
                   'excluded'
                 end
        [match.fetch('entity_key'), status]
      end
      status = if old != new_text
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      evidence = matches.map do |match|
        definition = defs.find { |row| row['entity_key'] == match['entity_key'] }
        "#{definition.fetch('notes')} Exact-key title-label disposition: #{dispositions.fetch(match['entity_key'])}."
      end.join(' ')
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.join('|'), 'status' => status,
        'old' => old, 'new' => new_text, 'evidence' => evidence,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    ReviewedProperNameDiscovery.validate!(
      defs, reviews, generated, glossary.map(&:to_h), index.map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    M.write_table(DEFINITIONS, glossary.headers, defs)
    M.write_table(REVIEWS, M::HEADERS, reviews)
    puts "Prepared related titles: #{reviews.length} rows, #{generated.length} entity matches: " \
         "#{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

RelatedTitlesDiscoveryD21069.run if $PROGRAM_NAME == __FILE__
