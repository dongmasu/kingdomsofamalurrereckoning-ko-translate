#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module GwynAnwyD20941
  extend self

  M = ReviewedNameBatches
  ENTITY = 'person:gwyn-anwy'
  DEFINITION = {
    'entity_key' => ENTITY,
    'english_canonical' => 'Gwyn Anwy',
    'category' => 'person',
    'korean_canonical' => '그윈 안웨이(Gwyn Anwy)',
    'english_aliases' => 'Oathblade Gwyn Anwy',
    'korean_variants' => '맹세의 칼날 그윈 안웨이(Gwyn Anwy)|서약검 그윈 안웨이(Gwyn Anwy)|맹세의 검 그윈 안웨이(Gwyn Anwy)',
    'evidence_ids' => 'D-20941-D-20942|default:1752|default:1850|default:4983|default:6150|default:7755|default:8982|default:13031|default:15148|default:19116|default:19510|default:20251|default:21022|default:22441|default:26250|default:32212|default:32891|default:33650|default:34361|default:34396|default:36405|default:36735|default:37167|default:38745|default:39124|default:39823|default:40384|default:41108|default:41739|default:42204|default:42252|default:42794|default:43344|default:43920|default:44358|default:46094|default:47738|default:48293|default:48698|default:51861|default:52226|default:53781|default:54076|default:54309|default:55488|default:55758|default:55938|default:56049|default:58290|default:59022|default:61804|default:62048|default:65127',
    'status' => 'confirmed',
    'notes' => 'English identifies the full personal name Gwyn Anwy; Japanese グウィン・アンウェイ and Chinese 格文·安维 corroborate, with 格温·安维 at one aligned row. Use the distinct full-name entity person:gwyn-anwy and do not add Gwyn as a global alias. Existing person:anwy is a separate component entry and is not re-opened. Oathblade is a source-supported title attached to this person; retain the translated Korean title and pair the complete English title where it is explicitly present. The official Korean manual reference and extraction have no direct entry for Gwyn Anwy. No PAK-derived evidence.'
  }.freeze

  IDS = %w[
    1752 1850 4983 6150 7755 8982 13031 15148 19116 19510 20251 21022
    22441 26250 32212 32891 33650 34361 34396 36405 36735 37167 38745
    39124 39823 40384 41108 41739 42204 42252 42794 43344 43920 44358
    46094 47738 48293 48698 51861 52226 53781 54076 54309 55488 55758
    55938 56049 58290 59022 61804 62048 65127
  ].freeze
  EXPECTED_KEYS = IDS.map { |id| ['default', id, ''] }.freeze

  SPANS = {
    ['default', '13031', ''] => [
      ['맹세의 칼날 그윈 안웨이(Gwyn Anwy)', '맹세의 칼날 그윈 안웨이(Oathblade Gwyn Anwy)']
    ],
    ['default', '21022', ''] => [
      ['서약검 그윈 안웨이(Gwyn Anwy)', '서약검 그윈 안웨이(Oathblade Gwyn Anwy)']
    ],
    ['default', '59022', ''] => [
      ['맹세의 검 그윈 안웨이(Gwyn Anwy)', '맹세의 검 그윈 안웨이(Oathblade Gwyn Anwy)']
    ],
    ['default', '65127', ''] => [
      ['맹세의 칼날 그윈 안웨이(Gwyn Anwy)', '맹세의 칼날 그윈 안웨이(Oathblade Gwyn Anwy)']
    ]
  }.freeze

  def run
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    raise 'Gwyn Anwy already registered' if glossary.any? { |row| row['entity_key'] == ENTITY }
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [DEFINITION]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "unexpected exact source match count #{generated.length}" unless generated.length == 52
    keys = generated.map { |row| M.key(row) }
    raise 'Gwyn Anwy source-key coverage changed' unless keys.uniq.sort == EXPECTED_KEYS.sort

    reviews = generated.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      text = old.dup
      SPANS.fetch(key, []).each do |before, after|
        raise "unexpected Korean span at #{key.inspect}" unless text.scan(before).length == 1
        text = text.sub(before, after)
      end
      status = text == old ? 'not-an-issue' : 'accepted'
      evidence = 'English identifies Gwyn Anwy as the same person; aligned Japanese and Chinese support the identity. Keep this full name distinct from person:anwy, and do not infer Gwyn as an alias. Where EN explicitly says Oathblade Gwyn Anwy, retain the Korean title and use that complete English label; otherwise preserve the established bilingual personal name.'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => text,
        'evidence' => evidence,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end.sort_by { |row| row.fetch('ID_Linha').to_i }

    raise 'Gwyn Anwy review row count changed' unless reviews.length == 52
    raise 'unexpected Gwyn Anwy edit count' unless reviews.count { |row| row['status'] == 'accepted' } == 4
    M.write_table(
      File.join(__dir__, 'proper-name-discovery-definitions-D20941.tsv'),
      glossary.headers,
      [DEFINITION]
    )
    M.write_table(
      File.join(__dir__, 'proper-name-discovery-D20941.tsv'),
      M::HEADERS,
      reviews
    )
    puts "#{reviews.length} exact source keys; 4 complete-title edits; 48 not-an-issue"
  end
end

GwynAnwyD20941.run if $PROGRAM_NAME == __FILE__
