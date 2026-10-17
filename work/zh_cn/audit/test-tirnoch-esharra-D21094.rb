#!/usr/bin/env ruby

require_relative 'prepare-tirnoch-esharra-D21094'
require_relative 'proper-name-test-replay'

module TestTirnochEsharraD21094
  M = ReviewedNameBatches
  F = TirnochEsharraD21094
  module_function

  def assert(condition, message)
    raise message unless condition
  end

  inventory = ProperNameTestReplay.inventory_at(21_098)
  recorded = (21_094..21_098).flat_map do |d|
    path = File.join(M::AUDIT, "proper-name-edits-D#{d}.tsv")
    File.file?(path) ? M.table(path).map(&:to_h) : []
  end
  recorded.each do |row|
    source = inventory.fetch(M.key(row))
    assert(source['work_text'] == row['new'], 'active Tirnoch/Esharra inventory mismatch')
    source['work_text'] = row['old']
  end
  reviews = F.reviews(inventory)
  assert(reviews.length == 224 && reviews.map { |row| M.key(row) }.uniq.length == 224,
         'expected 224 distinct Tirnoch/Esharra rows')
  assert(build_occurrences(inventory.values, F.definitions).length == 239,
         'expected 239 entity/source keys')
  statuses = reviews.group_by { |row| row['status'] }.transform_values(&:length)
  assert(statuses == { 'not-an-issue' => 90, 'accepted' => 130, 'excluded' => 4 },
         "unexpected Tirnoch/Esharra dispositions #{statuses.inspect}")
  reviews.each do |row|
    dispositions = JSON.parse(row['entity_dispositions_json'])
    if dispositions.key?('deity:tirnoch')
      assert(row['japanese'].match?(/ティアノック|Tirnoch/) ||
        (row['ID_Linha'] == '21802' && row['japanese'] == 'なぜ秘密にする必要がある？'),
        "Japanese Tirnoch evidence: #{row['ID_Linha']}")
      assert(row['chinese'].match?(/提尔诺克|Tirnoch/),
             "Chinese Tirnoch evidence: #{row['ID_Linha']}")
    end
    if dispositions.key?('place:esharra')
      assert(row['japanese'].match?(/イーシャラー|エシャッラ|Esharra/),
             "Japanese Esharra evidence: #{row['ID_Linha']}")
      assert(row['chinese'].match?(/艾[莎沙萨]拉|Esharra/),
             "Chinese Esharra evidence: #{row['ID_Linha']}")
    end
    assert(row['old'].scan(/\r\n|\r|\n/) == row['new'].scan(/\r\n|\r|\n/),
           'line breaks changed')
    assert(row['old'].scan(ReviewedProperNameDiscovery::OPAQUE) ==
      row['new'].scan(ReviewedProperNameDiscovery::OPAQUE), 'opaque markers changed')
    expected = row['old']
    dispositions.each do |entity, status|
      expected = F.edit(expected, entity, row['english']) unless status == 'excluded'
    end
    assert(expected == row['new'], 'unreviewed change outside accepted family spans')
    assert(row['old'] == row['new'], 'non-accepted row edited') unless row['status'] == 'accepted'
    assert(!row['new'].match?(/\)\(/), 'nested/repeated English label')
  end
  by_key = reviews.to_h { |row| [M.key(row), row] }
  (F::CHANTS + F::LOCALIZED_MARKERS).each do |id|
    row = by_key.fetch(['default', id, ''])
    assert(row['status'] == 'excluded' && row['old'] == row['new'],
           'chant or localized style marker changed')
  end
  assert(by_key.fetch(['base', '1653', '11'])['new'] ==
    '티르노크의 눈(Eye of Tirnoch)', 'singular Eye label lost')
  assert(by_key.fetch(['base', '3147', '11'])['new'] ==
    '"티르노크의 눈(Eyes of Tirnoch)"', 'plural Eyes label or quotes lost')
  assert(!by_key.fetch(['default', '2317', ''])['new'].include?('Eyes of Tirnoch'),
         'ordinary gaze was conflated with the mirror artifact')
  assert(by_key.fetch(['default', '10312', ''])['new'].include?('티르노크(Tirnoch)님'),
         'honorific 님 was lost')
  assert(by_key.fetch(['base', '184', '11'])['new'] ==
    "에샤라의 노래(Esharra's Song)", 'complete Song label missing')
  recorded.each do |expected|
    actual = by_key.fetch(M.key(expected))
    assert(%w[entity_key status old new entity_dispositions_json].all? do |field|
      actual[field] == expected[field]
    end, 'Tirnoch/Esharra generation differs from recorded manifest')
  end
  puts 'PASS D-21094 Tirnoch/Esharra identity, mirror/title separation, chants, and exact source-supported edits'
end
