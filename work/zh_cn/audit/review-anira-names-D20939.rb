#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module AniraNamesD20939
  extend self

  M = ReviewedNameBatches
  ENTITY = 'person:anira'
  DEFINITION = {
    'entity_key' => ENTITY,
    'english_canonical' => 'Anira',
    'category' => 'person',
    'korean_canonical' => '아니라(Anira)',
    'english_aliases' => 'Witch Knight Anira|Witchknight Anira',
    'korean_variants' => '마녀기사 아니라|마녀 기사 아닐라|마녀 기사 아니라인|마녀 기사 아니라(Witchknight Anira)|마녀 기사 아니라(Anira)',
    'evidence_ids' => 'D-20939-D-20940|base:1809:11|default:58|default:3515|default:4422|default:4925|default:5121|default:5819|default:7014|default:7435|default:7529|default:8553|default:8872|default:9141|default:10010|default:10262|default:10978|default:11013|default:11794|default:11806|default:12983|default:13684|default:15217|default:16252|default:17632|default:17657|default:19331|default:23876|default:24950|default:24952|default:25437|default:25501|default:25506|default:26369|default:26577|default:26738|default:27240|default:30525|default:31717|default:33353|default:35210|default:41898|default:43517|default:44179|default:46182|default:49692|default:51618|default:52324|default:52351|default:53074|default:54994|default:55579|default:56656|default:58147|default:58508|default:60061|default:60392|default:62912|default:64394|default:64887',
    'status' => 'confirmed',
    'notes' => 'English identifies the same named Witch Knight across all 59 reviewed source keys. Japanese アニラ and 魔騎士 corroborate the person and title; Chinese usually uses 阿尼拉, with 阿内拉 at default:10010, 11794, 17657, and 33353. Standardize the person as 아니라(Anira), and render the translated role plus name as 마녀 기사 아니라(Anira), not as a second English title inside the parentheses. English Witch Knight/Witchknight spacing variants are one title. Scope every change to the reviewed ID and name/title span because Korean 아니라 is also an ordinary conjunction. The official Korean manual reference and extraction provide no direct entry for Anira. No PAK-derived evidence.'
  }.freeze

  EXPECTED_KEYS = [
    ['base', '1809', '11']
  ].concat(
    %w[
      58 3515 4422 4925 5121 5819 7014 7435 7529 8553 8872 9141 10010
      10262 10978 11013 11794 11806 12983 13684 15217 16252 17632 17657
      19331 23876 24950 24952 25437 25501 25506 26369 26577 26738 27240
      30525 31717 33353 35210 41898 43517 44179 46182 49692 51618 52324
      52351 53074 54994 55579 56656 58147 58508 60061 60392 62912 64394
      64887
    ].map { |id| ['default', id, ''] }
  ).freeze

  # Exact ID-scoped spans prevent the ordinary Korean conjunction 아니라
  # from being mistaken for the character's name.
  SPANS = {
    ['default', '58', ''] => [['마녀기사 아니라(Anira)', '마녀 기사 아니라(Anira)']],
    ['default', '4422', ''] => [['마녀기사 아니라(Anira)', '마녀 기사 아니라(Anira)']],
    ['default', '4925', ''] => [['아니라가 장인들을', '아니라(Anira)가 장인들을']],
    ['default', '5121', ''] => [['마녀 기사 아니라(Witchknight Anira)', '마녀 기사 아니라(Anira)']],
    ['default', '7014', ''] => [['마녀 기사 아니라(Witchknight Anira)', '마녀 기사 아니라(Anira)']],
    ['default', '7435', ''] => [['마녀 기사 아니라(Witchknight Anira)', '마녀 기사 아니라(Anira)']],
    ['default', '7529', ''] => [['마녀 기사 아니라(Witchknight Anira)', '마녀 기사 아니라(Anira)']],
    ['default', '8553', ''] => [['마녀기사 아니라', '마녀 기사 아니라(Anira)']],
    ['default', '8872', ''] => [['아니라와 맞설', '아니라(Anira)와 맞설']],
    ['default', '9141', ''] => [['마녀기사 아니라가', '마녀 기사 아니라(Anira)가']],
    ['default', '10010', ''] => [['마녀 기사 아니라를', '마녀 기사 아니라(Anira)를']],
    ['default', '10262', ''] => [['마녀 기사 아니라(Witchknight Anira)', '마녀 기사 아니라(Anira)']],
    ['default', '11806', ''] => [['마녀 기사 아니라(Witchknight Anira)의', '마녀 기사 아니라(Anira)의']],
    ['default', '12983', ''] => [['마녀기사 아니라(Witchknight Anira)', '마녀 기사 아니라(Anira)']],
    ['default', '15217', ''] => [['마녀 기사 아니라', '마녀 기사 아니라(Anira)']],
    ['default', '16252', ''] => [
      ['마녀 기사 아니라(Witchknight Anira)', '마녀 기사 아니라(Anira)'],
      ['아니라의 통치', '아니라(Anira)의 통치']
    ],
    ['default', '17632', ''] => [['마녀 기사 아니라인(Anira)을', '마녀 기사 아니라(Anira)를']],
    ['default', '17657', ''] => [['마녀 기사 아니라인(Anira)에게', '마녀 기사 아니라(Anira)에게']],
    ['default', '25437', ''] => [['마녀기사 아니라를', '마녀 기사 아니라(Anira)를']],
    ['default', '25501', ''] => [['마녀기사 아니라를', '마녀 기사 아니라(Anira)를']],
    ['default', '25506', ''] => [['아니라에 대한 분노', '아니라(Anira)에 대한 분노']],
    ['default', '26369', ''] => [['아니라를 물리치는', '아니라(Anira)를 물리치는']],
    ['default', '26577', ''] => [
      ['마녀기사 아니라가', '마녀 기사 아니라(Anira)가'],
      ['마녀기사를 지키는', '마녀 기사를 지키는']
    ],
    ['default', '26738', ''] => [['아니라가 패배하자', '아니라(Anira)가 패배하자']],
    ['default', '30525', ''] => [['아니라와 가드플로', '아니라(Anira)와 가드플로']],
    ['default', '31717', ''] => [['아니라를 물리칠', '아니라(Anira)를 물리칠']],
    ['default', '33353', ''] => [
      ['마녀기사 아니라를 죽여', '마녀 기사 아니라(Anira)를 죽여'],
      ['아니라를 지키는', '아니라(Anira)를 지키는']
    ],
    ['default', '41898', ''] => [['아니라를 처리해', '아니라(Anira)를 처리해']],
    ['default', '43517', ''] => [['아니라의 손아귀', '아니라(Anira)의 손아귀']],
    ['default', '44179', ''] => [['아니라의 뜻', '아니라(Anira)의 뜻']],
    ['default', '49692', ''] => [['마녀 기사 아닐라', '마녀 기사 아니라(Anira)']],
    ['default', '51618', ''] => [['마녀기사 아니라(Witchknight Anira)', '마녀 기사 아니라(Anira)']],
    ['default', '52324', ''] => [['아니라(Anira)이 숨어', '아니라(Anira)가 숨어']],
    ['default', '53074', ''] => [['마녀기사 아니라(Witchknight Anira)', '마녀 기사 아니라(Anira)']],
    ['default', '55579', ''] => [['마녀기사 아니라(Witchknight Anira)', '마녀 기사 아니라(Anira)']],
    ['default', '58508', ''] => [['마녀 기사 아니라(Witchknight Anira)', '마녀 기사 아니라(Anira)']],
    ['default', '60061', ''] => [['마녀기사 아니라(Witchknight Anira)', '마녀 기사 아니라(Anira)']],
    ['default', '64394', ''] => [['아니라가 어떻게 죽었는지', '아니라(Anira)가 어떻게 죽었는지']]
  }.freeze

  EXTRA_EVIDENCE = {
    ['default', '10010', ''] => 'Chinese uses 阿内拉 rather than the usual 阿尼拉; EN and JA support the same Anira identity.',
    ['default', '11794', ''] => 'Chinese uses 阿内拉 rather than the usual 阿尼拉; EN and JA support the same Anira identity.',
    ['default', '17632', ''] => 'Correct the Korean name typo 아니라인 and use the vowel-final particle 를.',
    ['default', '17657', ''] => 'Correct the Korean name typo 아니라인; the following dative particle remains 에게. Chinese uses 阿内拉 rather than the usual 阿尼拉; EN and JA support the same Anira identity.',
    ['default', '33353', ''] => 'Pair both explicit Korean references to Anira in this cell; preserve the separate Master titles. Chinese uses 阿内拉 rather than the usual 阿尼拉; EN and JA support the same Anira identity.',
    ['default', '4925', ''] => 'The second Korean name reference refers to Anira’s hold; pair it as well as the earlier title mention.',
    ['default', '16252', ''] => 'The later possessive reference to Anira is explicit in English and is paired in Korean too.',
    ['default', '49692', ''] => 'Correct the Korean transliteration 아닐라 to the established 아니라(Anira).',
    ['default', '26577', ''] => 'The later English the Witchknight is a title-only reference, not another name-token occurrence; translate it as the generic role 마녀 기사 without inserting the person’s name.',
    ['default', '52324', ''] => 'Correct the subject particle after the vowel-final name: 이 to 가.'
  }.freeze

  def apply_spans(text, spans, key)
    spans.each do |old, new|
      raise "unexpected or ambiguous Korean span at #{key.inspect}: #{old}" unless text.scan(old).length == 1
      text = text.sub(old, new)
    end
    text
  end

  def run
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    raise 'Anira already registered' if glossary.any? { |row| row['entity_key'] == ENTITY }
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [DEFINITION]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "unexpected Anira match count: #{generated.length}" unless generated.length == 59
    generated_keys = generated.map { |row| M.key(row) }
    raise 'exact English source-key coverage changed' unless generated_keys.uniq.sort == EXPECTED_KEYS.sort

    reviews = generated.group_by { |row| M.key(row) }.map do |key, matches|
      raise "unexpected entity overlap at #{key.inspect}" unless matches.length == 1
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      spans = SPANS.fetch(key, [])
      new_text = apply_spans(old, spans, key)
      status = new_text == old ? 'not-an-issue' : 'accepted'
      evidence = [
        'English identifies Anira in this exact source context. Japanese supports the name/title; Chinese is corroborating evidence only.',
        'Use the bilingual personal name 아니라(Anira); translate Witch Knight as 마녀 기사 without repeating the English title in parentheses.',
        'Only the reviewed name/title span is eligible for change; ordinary Korean 아니라 outside this exact span is not a name.'
      ]
      evidence << EXTRA_EVIDENCE[key] if EXTRA_EVIDENCE.key?(key)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => evidence.join(' '),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end.sort_by { |row| [row.fetch('resource'), row.fetch('ID_Linha').to_i, row.fetch('Tipo_Variante')] }

    raise 'reviewed source-key count changed' unless reviews.length == 59
    raise 'Anira has no unchanged rows in the candidate index' unless reviews.any? { |row| row['status'] == 'not-an-issue' }
    raise 'Anira has no proposed corrections' unless reviews.any? { |row| row['status'] == 'accepted' }
    M.write_table(
      File.join(__dir__, 'proper-name-discovery-definitions-D20939.tsv'),
      glossary.headers,
      [DEFINITION]
    )
    M.write_table(
      File.join(__dir__, 'proper-name-discovery-D20939.tsv'),
      M::HEADERS,
      reviews
    )
    puts "#{reviews.length} exact source keys; #{reviews.count { |row| row['status'] == 'accepted' }} proposed edits; #{reviews.count { |row| row['status'] == 'not-an-issue' }} retained"
  end
end

AniraNamesD20939.run if $PROGRAM_NAME == __FILE__
