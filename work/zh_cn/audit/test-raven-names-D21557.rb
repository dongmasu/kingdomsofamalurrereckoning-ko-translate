#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-raven-names-D21557'

class RavenNamesD21557Test < Minitest::Test
  R = RavenNamesD21557
  M = ReviewedNameBatches

  def self.data
    @data ||= if File.file?(R::REVIEWS)
                [M.table(R::DEFINITIONS).map(&:to_h), M.table(R::REVIEWS).map(&:to_h)]
              else
                _headers, definitions, rows = R.prepare
                [definitions, rows]
              end
  end

  def test_exact_full_name_scope_and_source_evidence
    definitions, rows = self.class.data
    assert_equal 4, definitions.length
    assert_equal 12, rows.length
    assert_equal 8, rows.count { |row| row['old'] != row['new'] }
    assert_equal R.expected_pairs.sort, rows.map { |row| [row['entity_key'], *M.key(row)] }.sort
    assert definitions.all? { |row| row['english_aliases'] == '' }
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

  def test_inn_team_and_title_remain_independent
    _definitions, rows = self.class.data
    rows.select { |row| row['entity_key'] == R::INN }.each do |row|
      assert_includes row['new'], '큰까마귀 여관(The Raven)'
      assert_equal row['old'].gsub(R::INN_SPAN, ''), row['new'].gsub(R::INN_SPAN, '')
    end
    roster = rows.find { |row| row['entity_key'] == R::TEAM && row['ID_Linha'] == '18198' }
    assert_equal 2, roster['new'].scan('까마귀들(The Ravens)').length
    assert_equal roster['old'].gsub(R::TEAM_SPAN, ''), roster['new'].gsub(R::TEAM_SPAN, '')
    assert_equal roster['old'].scan(/\d[\d,]*/), roster['new'].scan(/\d[\d,]*/)
    rows.select { |row| R::BIRD_IDS.include?(row['ID_Linha']) }.each do |row|
      assert_equal 'excluded', row['status']
      assert_equal row['old'], row['new']
    end
    rows.select { |row| [R::AEGIS, R::GUARD].include?(row['entity_key']) }.each do |row|
      assert_equal 'not-an-issue', row['status']
      assert_equal row['old'], row['new']
    end
  end
end
