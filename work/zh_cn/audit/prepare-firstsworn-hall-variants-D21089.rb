#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

module FirstswornHallVariantsD21089
  M = ReviewedNameBatches
  D = 21_089
  ENTITY = 'place:hall-of-the-firstsworn'
  PATH = File.join(M::AUDIT, "proper-name-discovery-D#{D}.tsv")
  CASES = {
    '40118' => [
      'Look at us. In the Halls of the Firstsworn.',
      '첫 서약자들의 전당', '첫서약자 전당(Halls of the Firstsworn)',
      'English names the Halls of the Firstsworn in the same forge/hall quest context. Japanese ファーストスウォーンの広間 and Chinese 首誓者大厅 confirm the place, not a new group. Preserve the source plural in the full English parenthetical and reuse the registered Korean place name. No global Halls alias is registered.'
    ],
    '44231' => [
      'Go to the Hall of the Firstworn',
      '첫서약자 전당', '첫서약자 전당(Hall of the Firstsworn)',
      'English Firstworn is a source typo in an exact Hall travel objective. Japanese ファーストスウォーンの祠へ向かう and Chinese 前往首誓者大厅 identify the already registered Hall of the Firstsworn. Retain the registered complete canonical English spelling in the Korean label; preserve immutable source files and do not invent a separate Firstworn place or global typo alias.'
    ]
  }.freeze

  module_function

  def reviews(inventory)
    CASES.map do |id, (expected, from, to, evidence)|
      source = inventory.fetch(['default', id, ''])
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "Hall source changed at #{id}" unless english == expected
      old = source.fetch('work_text')
      raise "Hall Korean span missing/ambiguous at #{id}" unless old.scan(from).length == 1
      {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'entity_key' => ENTITY, 'status' => 'accepted', 'old' => old,
        'new' => old.sub(from, to), 'evidence' => evidence,
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
  end

  def run
    raise 'Hall variants already prepared' if File.file?(PATH)
    inventory = M.refresh_inventory
    review_rows = reviews(inventory)
    index = M.table(M::INDEX)
    existing = index.map { |row| [row['entity_key'], *M.key(row)] }
    raise 'Hall variants already indexed' unless
      (review_rows.map { |row| [ENTITY, *M.key(row)] } & existing).empty?
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    definitions = glossary.map(&:to_h)
    entry = definitions.find { |row| row['entity_key'] == ENTITY }
    raise 'registered Hall identity missing' unless entry
    entry['evidence_ids'] = (entry.fetch('evidence_ids').split('|') +
      ["D-#{D}", 'default:40118', 'default:44231']).uniq.join('|')
    entry['notes'] += ' D-21089 extends only default:40118 (source plural Halls) and default:44231 (source Firstworn typo), confirmed by Japanese and Chinese. Prior Hall row decisions are preserved; no global plural/typo alias is added.'
    M.write_table(File.join(M::AUDIT, 'proper-name-glossary.tsv'),
                  glossary.headers, definitions)
    additions = review_rows.map do |row|
      {
        'entity_key' => ENTITY, 'resource' => 'default',
        'ID_Linha' => row['ID_Linha'], 'Tipo_Variante' => '',
        'matched_english' => CASES.fetch(row['ID_Linha'])[0],
        'english_source' => row['english'], 'korean_current' => row['old'],
        'status' => 'needs-context',
        'evidence' => "D-#{D} row-scoped place variant requiring review."
      }
    end
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + additions)
    M.write_table(PATH, M::HEADERS, review_rows)
    M.run(PATH, D, nil)
  end
end

FirstswornHallVariantsD21089.run if $PROGRAM_NAME == __FILE__
