#!/usr/bin/env ruby

require_relative 'prepare-eamonn-nyralim-D21090'
require_relative 'proper-name-test-replay'

module TestEamonnNyralimD21090
  M = ReviewedNameBatches
  F = EamonnNyralimD21090
  module_function

  def assert(condition, message)
    raise message unless condition
  end

  inventory = ProperNameTestReplay.inventory_at(21_092)
  recorded = (21_090..21_092).flat_map do |d|
    path = File.join(M::AUDIT, "proper-name-edits-D#{d}.tsv")
    File.file?(path) ? M.table(path).map(&:to_h) : []
  end
  recorded.each do |row|
    source = inventory.fetch(M.key(row))
    assert(source['work_text'] == row['new'], 'active Eamonn/Nyralim inventory mismatch')
    source['work_text'] = row['old']
  end
  reviews = F.reviews(inventory)
  assert(reviews.length == 145 && reviews.map { |row| M.key(row) }.uniq.length == 145,
         'expected 145 distinct Eamonn/Nyralim source keys')
  generated = build_occurrences(inventory.values, F.definitions)
  assert(generated.length == 181, 'expected 181 entity/source keys')
  assert(reviews.group_by { |row| row['status'] }.transform_values(&:length) ==
    { 'accepted' => 98, 'not-an-issue' => 43, 'excluded' => 4 },
    'unexpected Eamonn/Nyralim dispositions')
  reviews.each do |row|
    dispositions = JSON.parse(row.fetch('entity_dispositions_json'))
    if row['english'].match?(/\bEamonn\b/i)
      assert(row['japanese'].match?(/イーモン|Eamonn/), "Japanese Eamonn evidence: #{row['ID_Linha']}")
      assert(row['chinese'].match?(/埃蒙|Eamonn/), "Chinese Eamonn evidence: #{row['ID_Linha']}")
    end
    if row['english'].match?(/\bNyralim\b/i)
      japanese_corroborates = row['japanese'].match?(/ニラリム|Nyralim/) ||
        (row['ID_Linha'] == '58604' &&
          row['japanese'].include?('最も長く生きている定命の者'))
      assert(japanese_corroborates, "Japanese Nyralim evidence: #{row['ID_Linha']}")
      assert(row['chinese'].match?(/[尼奈]拉利|Nyralim/), "Chinese Nyralim evidence: #{row['ID_Linha']}")
    end
    assert(row['old'].scan(/\r\n|\r|\n/) == row['new'].scan(/\r\n|\r|\n/),
           'line-break sequence changed')
    assert(row['old'].scan(ReviewedProperNameDiscovery::OPAQUE) ==
      row['new'].scan(ReviewedProperNameDiscovery::OPAQUE), 'runtime tokens changed')
    assert(row['old'].scan(/이곤\(Eagonn\)/) == row['new'].scan(/이곤\(Eagonn\)/),
           'Eagonn was conflated with his father')
    assert(row['old'].scan('케어 니랄림(Caer Nyralim)') ==
      row['new'].scan('케어 니랄림(Caer Nyralim)'), 'previously reviewed Caer place was changed')
    expected = row['old']
    dispositions.each do |entity, status|
      expected = F.edit(expected, entity, row['english']) unless status == 'excluded'
    end
    assert(expected == row['new'], 'unreviewed edit outside approved family spans')
    assert(!row['new'].match?(/\)\(/), 'nested/repeated parenthetical labels')
    assert(row['old'] == row['new'], 'non-accepted row edited') unless row['status'] == 'accepted'
  end
  by_key = reviews.to_h { |row| [M.key(row), row] }
  assert(by_key.fetch(['default', '46058', ''])['new'] == '이먼(Eamonn)과 이곤(Eagonn)',
         'father/son standalone label lost')
  assert(by_key.fetch(['default', '28854', ''])['old'] ==
    by_key.fetch(['default', '28854', ''])['new'], 'mixed person/place row was not preserved')
  assert(by_key.fetch(['default', '63929', ''])['new'].include?("이먼의 섬(Eamonn's Isle)"),
         'island misspelling 이모넌 not normalized')
  assert(by_key.fetch(['default', '45359', ''])['new'].include?('니랄림(Nyralim)'),
         'tree misspelling 나이라림 not normalized')
  assert(by_key.fetch(['base', '856', '11'])['new'] ==
    "니랄림의 은총(Nyralim's Grace)", 'complete Grace item label missing')
  assert(by_key.fetch(['base', '1932', '11'])['new'] ==
    '니랄림의 조각(A Shard of Nyralim)', 'complete Shard item label missing')
  recorded.each do |expected|
    actual = by_key.fetch(M.key(expected))
    assert(%w[entity_key status old new entity_dispositions_json].all? do |field|
      actual[field] == expected[field]
    end, 'generated Eamonn/Nyralim review differs from recorded manifest')
  end
  puts 'PASS D-21090 Eamonn/Nyralim source identity, family/place/item separation, and exact reviewed spans'
end
