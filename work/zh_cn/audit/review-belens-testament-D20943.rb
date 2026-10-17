#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module BelensTestamentD20943
  extend self

  M = ReviewedNameBatches
  ENTITY = 'faction:belens-testament'
  DEFINITION = {
    'entity_key' => ENTITY,
    'english_canonical' => "Belen's Testament",
    'category' => 'faction',
    'korean_canonical' => "벨렌의 성약단(Belen's Testament)",
    'english_aliases' => 'Belen’s Testament',
    'korean_variants' => "벨렌(Belen)의 테스타먼트(Testament)|벨렌의 테스타먼트(Belen's Testament)|벨렌(Belen)의 성약|벨렌의 성약(Belen's Testament)|벨렌(Belen)의 유언|벨렌(Belen) 결사|벨렌(Belen)의 성약단",
    'evidence_ids' => 'D-20943|default:1336|default:1481|default:2445|default:6553|default:8897|default:9120|default:11097|default:11332|default:12377|default:12421|default:12844|default:14607|default:20194|default:22646|default:27592|default:31387|default:31902|default:33053|default:35865|default:41770|default:44520|default:46606|default:46666|default:50309|default:51047|default:55119|default:55464|default:55470|default:57100|default:58280|default:58321|default:59156',
    'status' => 'confirmed',
    'notes' => 'English repeatedly identifies the same named death-cult organization. Japanese ベイレン結社 and Chinese 贝伦神约 corroborate the organization; the official Korean manual establishes the deity Belen as 벨렌 but does not name this organization. Standardize the full faction as 벨렌의 성약단(Belen’s Testament), including its class/member labels where present. Do not register generic The Testament as a global alias: source contexts distinguish the organization from common testament/testimony and Belen doctrine references. The full faction label retains Belen in English, so existing deity:belen occurrence decisions are not reopened or recounted. No PAK-derived evidence.'
  }.freeze

  IDS = %w[
    1336 1481 2445 6553 8897 9120 11097 11332 12377 12421 12844 14607
    20194 22646 27592 31387 31902 33053 35865 41770 44520 46606 46666
    50309 51047 55119 55464 55470 57100 58280 58321 59156
  ].freeze
  EXPECTED_KEYS = IDS.map { |id| ['default', id, ''] }.freeze

  SPANS = {
    ['default', '1336', ''] => [['벨렌(Belen)의 테스타먼트 마법사', "벨렌의 성약단(Belen's Testament) 마법사"]],
    ['default', '1481', ''] => [["벨렌의 테스타먼트(Belen's Testament)가", "벨렌의 성약단(Belen's Testament)이"]],
    ['default', '2445', ''] => [["벨렌의 테스타먼트(Belen's Testament)", "벨렌의 성약단(Belen's Testament)"]],
    ['default', '6553', ''] => [['벨렌(Belen)의 테스타먼트(Testament)', "벨렌의 성약단(Belen's Testament)"]],
    ['default', '8897', ''] => [['벨렌(Belen)의 성약', "벨렌의 성약단(Belen's Testament)"]],
    ['default', '9120', ''] => [['벨렌(Belen)의 성약', "벨렌의 성약단(Belen's Testament)"]],
    ['default', '11097', ''] => [["벨렌의 성약(Belen's Testament)", "벨렌의 성약단(Belen's Testament)"]],
    ['default', '11332', ''] => [["벨렌의 성약(Belen's Testament)", "벨렌의 성약단(Belen's Testament)"]],
    ['default', '12377', ''] => [["벨렌의 테스타먼트(Belen's Testament)는", "벨렌의 성약단(Belen's Testament)은"]],
    ['default', '12421', ''] => [["벨렌의 테스타먼트(Belen's Testament)", "벨렌의 성약단(Belen's Testament)"]],
    ['default', '12844', ''] => [["벨렌의 테스타먼트(Belen's Testament)를", "벨렌의 성약단(Belen's Testament)을"]],
    ['default', '14607', ''] => [['벨렌(Belen) 결사는', "벨렌의 성약단(Belen's Testament)은"]],
    ['default', '20194', ''] => [['벨렌(Belen)의 테스타먼트 창병', "벨렌의 성약단(Belen's Testament) 창병"]],
    ['default', '22646', ''] => [["벨렌의 유언을 받은 도적(Belen's Testament Rogue)", "벨렌의 성약단(Belen's Testament) 도적"]],
    ['default', '27592', ''] => [["벨렌의 성약(Belen's Testament)", "벨렌의 성약단(Belen's Testament)"]],
    ['default', '31387', ''] => [['벨렌(Belen)의 유언', "벨렌의 성약단(Belen's Testament)"]],
    ['default', '31902', ''] => [['벨렌(Belen)의 테스타먼트 소속 검객', "벨렌의 성약단(Belen's Testament) 검객"]],
    ['default', '33053', ''] => [['벨렌(Belen)의 성약단', "벨렌의 성약단(Belen's Testament)"]],
    ['default', '35865', ''] => [['벨렌(Belen)의 테스타먼트가', "벨렌의 성약단(Belen's Testament)이"]],
    ['default', '41770', ''] => [['벨렌(Belen)의 성약단', "벨렌의 성약단(Belen's Testament)"]],
    ['default', '44520', ''] => [['벨렌(Belen)의 성약', "벨렌의 성약단(Belen's Testament)"]],
    ['default', '46606', ''] => [['벨렌(Belen)의 테스타먼트 사제', "벨렌의 성약단(Belen's Testament) 사제"]],
    ['default', '46666', ''] => [['벨렌(Belen)의 테스타먼트는', "벨렌의 성약단(Belen's Testament)은"]],
    ['default', '50309', ''] => [['벨렌(Belen)의 유언', "벨렌의 성약단(Belen's Testament)"]],
    ['default', '51047', ''] => [["벨렌의 테스타먼트(Belen's Testament)", "벨렌의 성약단(Belen's Testament)"]],
    ['default', '55119', ''] => [["벨렌의 테스타먼트(Belen's Testament)", "벨렌의 성약단(Belen's Testament)"]],
    ['default', '55464', ''] => [["벨렌의 테스타먼트 소환사(Belen's Testament Summoner)", "벨렌의 성약단(Belen's Testament) 소환사"]],
    ['default', '55470', ''] => [["벨렌의 테스타먼트(Belen's Testament)", "벨렌의 성약단(Belen's Testament)"]],
    ['default', '57100', ''] => [['벨렌(Belen)의 테스타먼트', "벨렌의 성약단(Belen's Testament)"]],
    ['default', '58280', ''] => [['벨렌(Belen)의 테스타먼트', "벨렌의 성약단(Belen's Testament)"]],
    ['default', '58321', ''] => [['벨렌(Belen)의 테스타먼트라고', "벨렌의 성약단(Belen's Testament)이라고"]],
    ['default', '59156', ''] => [['벨렌(Belen)의 테스타먼트', "벨렌의 성약단(Belen's Testament)"]]
  }.freeze

  def run
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    raise 'Belen’s Testament already registered' if glossary.any? { |row| row['entity_key'] == ENTITY }
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [DEFINITION]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "unexpected Belen's Testament source count #{generated.length}" unless generated.length == 32
    keys = generated.map { |row| M.key(row) }
    raise 'Belen organization source-key coverage changed' unless keys.uniq.sort == EXPECTED_KEYS.sort

    reviews = generated.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      spans = SPANS.fetch(key)
      raise "unexpected Korean span count at #{key.inspect}" unless spans.length == 1
      before, after = spans.first
      raise "unexpected Korean span at #{key.inspect}: #{before}" unless old.scan(before).length == 1
      new_text = old.sub(before, after)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => new_text == old ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => new_text,
        'evidence' => 'English identifies the Belen death-cult organization in this exact context. Japanese ベイレン結社 and Chinese 贝伦神约 support the organization reading. Standardize only this faction span; preserve the surrounding sentence and related entity labels. The canonical bilingual name retains English Belen, so existing deity:belen dispositions remain intact.',
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
      }
    end.sort_by { |row| row.fetch('ID_Linha').to_i }

    raise 'Belen organization reviewed-key count changed' unless reviews.length == 32
    M.write_table(
      File.join(__dir__, 'proper-name-discovery-definitions-D20943.tsv'),
      glossary.headers,
      [DEFINITION]
    )
    M.write_table(
      File.join(__dir__, 'proper-name-discovery-D20943.tsv'),
      M::HEADERS,
      reviews
    )
    puts "#{reviews.length} exact source keys; #{reviews.count { |row| row['old'] != row['new'] }} canonicalization edits"
  end
end

BelensTestamentD20943.run if $PROGRAM_NAME == __FILE__
