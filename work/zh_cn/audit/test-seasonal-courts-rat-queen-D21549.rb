#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-seasonal-courts-rat-queen-D21549'

class SeasonalCourtsRatQueenD21549Test < Minitest::Test
  R = SeasonalCourtsRatQueenD21549
  M = ReviewedNameBatches

  def self.data
    @data ||= if File.file?(R::REVIEWS)
                [M.table(R::DEFINITIONS).map(&:to_h), M.table(R::REVIEWS).map(&:to_h)]
              else
                _headers, definitions, rows = R.prepare
                [definitions, rows]
              end
  end

  def data
    self.class.data
  end

  def test_exact_scope_and_source_evidence
    definitions, rows = data
    assert_equal [R::SUMMER, R::WINTER, R::NECKLACE, R::RAT].sort,
                 definitions.map { |row| row['entity_key'] }.sort
    assert_equal 241, rows.length
    pairs = rows.flat_map { |row| JSON.parse(row['entity_dispositions_json']).keys.map { |entity| [entity, *M.key(row)] } }
    assert_equal 250, pairs.length
    assert_equal R.expected_pairs.sort, pairs.sort
    assert_equal [50, 50, 50, 50, 41], rows.each_slice(50).map(&:length)
    inventory = M.table(M::INVENTORY).to_h { |row| [M.key(row), row] }
    rows.each do |row|
      source = inventory.fetch(M.key(row))
      assert_equal JSON.parse(source['en_texts_json']).compact.join("\n"), row['english']
      assert_equal JSON.parse(source['ja_texts_json']).compact.join("\n---\n"), row['japanese']
      assert_equal source['zh_text'], row['chinese']
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE), row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
    end
  end

  def test_atomic_item_and_false_positive_exclusions
    rows = data.last.to_h { |row| [M.key(row), row] }
    imperial = rows.fetch(['base', '2353', '11'])
    assert_equal 'excluded', JSON.parse(imperial['entity_dispositions_json']).fetch(R::SUMMER)
    assert_equal imperial['old'], imperial['new']
    necklace = rows.fetch(['base', '3876', '11'])
    assert_equal '겨울 궁정 목걸이(Winter Court Necklace)', necklace['new']
    assert_equal 'excluded', JSON.parse(necklace['entity_dispositions_json']).fetch(R::WINTER)
    assert_equal 'accepted', JSON.parse(necklace['entity_dispositions_json']).fetch(R::NECKLACE)
    false_positive = rows.fetch(['default', '55140', ''])
    assert_equal 'excluded', false_positive['status']
    assert_equal false_positive['old'], false_positive['new']
    assert_includes false_positive['evidence'], 'not endorsed'
    qualified = rows.fetch(['default', '7155', ''])
    assert_equal 'excluded', qualified['status']
    assert_equal qualified['old'], qualified['new']
    winter = data.first.find { |row| row['entity_key'] == R::WINTER }
    refute_includes winter['english_aliases'], 'High Court'
  end

  def test_source_local_orders_repeated_names_and_hyphens
    rows = data.last.to_h { |row| [M.key(row), row] }
    assert_includes rows.fetch(['default', '1640', ''])['new'], '(The Court of Winter)'
    assert_includes rows.fetch(['default', '21609', ''])['new'], '겨울 궁정(Court-of-Winter)식'
    assert_includes rows.fetch(['default', '28841', ''])['new'], '겨울 궁정(Court-of-Winter)'
    assert_includes rows.fetch(['default', '7155', ''])['new'], '겨울 궁정(High Court of Winter)'
    assert_equal 3, rows.fetch(['default', '31067', ''])['new'].scan('여름 궁정(Court of Summer)').length
    assert_equal 3, rows.fetch(['default', '31067', ''])['new'].scan('겨울 궁정(Court of Winter)').length
    %w[8598 44656].each do |id|
      refute_includes rows.fetch(['default', id, ''])['new'], '윈터 코트'
    end
    refute_includes rows.fetch(['default', '53873', ''])['new'], '겨울의 궁정'
    assert_includes rows.fetch(['default', '1313', ''])['new'], '쥐 여왕(The Rat Queen)'
    assert_equal 2, rows.fetch(['default', '54505', ''])['new'].scan('쥐 여왕(Rat Queen)').length
  end

  def test_only_approved_name_spans_change
    data.last.each do |row|
      next if R::EXCLUDED_KEYS.include?(M.key(row))
      if row['entity_key'] == R::RAT
        assert_equal row['old'].gsub(R::RAT_SPAN, ''), row['new'].gsub(R::RAT_SPAN, '')
      else
        assert_equal row['old'].gsub(R::KOREAN_COURTS, ''), row['new'].gsub(R::KOREAN_COURTS, '')
      end
    end
  end
end
