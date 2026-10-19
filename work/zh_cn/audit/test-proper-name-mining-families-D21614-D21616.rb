#!/usr/bin/env ruby

require 'minitest/autorun'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

class ProperNameMiningFamiliesD21614D21616Test < Minitest::Test
  M = ReviewedNameBatches

  def manifest(d)
    M.table(File.join(__dir__, "proper-name-edits-D#{d}.tsv"))
  end

  def test_bounded_source_coverage_and_byte_safe_manifests
    inventory = M.table(M::INVENTORY).to_h { |row| [M.key(row), row] }
    [[21_614, 50, 46], [21_615, 19, 19]].each do |d, row_count, edit_count|
      rows = manifest(d)
      assert_equal row_count, rows.length
      assert_equal row_count, rows.map { |row| M.key(row) }.uniq.length
      assert_operator rows.length, :<=, 50
      assert_equal edit_count, rows.count { |row| row['old'] != row['new'] }
      rows.each do |row|
        source = inventory.fetch(M.key(row))
        assert_equal JSON.parse(source['en_texts_json']).compact.join("\n"), row['english']
        assert_equal JSON.parse(source['ja_texts_json']).compact.join("\n---\n"), row['japanese']
        assert_equal source['zh_text'], row['chinese']
        assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
        assert_equal row['old'].scan(/\$[^$]*\$|<[^>\r\n]*>|\{[^{}\r\n]*\}/),
                     row['new'].scan(/\$[^$]*\$|<[^>\r\n]*>|\{[^{}\r\n]*\}/)
      end
    end
  end

  def test_family_alias_scopes_and_skoria_ring_item_are_separate
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    expected = {
      'family:darkvari' => ['Darkvari family', '다크바리 가문(Darkvari family)'],
      'family:cynric' => ['Cynric family', '신릭 가문(Cynric family)'],
      'family:skoria' => ['Skoria family', '스코리아 가문(Skoria family)'],
      'item:skoria-family-ring' => ['Skoria Family Ring', '스코리아 가문 반지(Skoria Family Ring)']
    }
    expected.each do |entity, values|
      row = glossary.find { |entry| entry['entity_key'] == entity }
      refute_nil row
      assert_equal values, row.values_at('english_canonical', 'korean_canonical')
    end
    assert_equal 'Darkvaris|the Darkvari|and Darkvari|Cynrics, Darkvari',
                 glossary.find { |row| row['entity_key'] == 'family:darkvari' }['english_aliases']
    assert_equal 'Cynrics|the Cynric|Cynric boys',
                 glossary.find { |row| row['entity_key'] == 'family:cynric' }['english_aliases']
    ring = manifest(21_614).find { |row| M.key(row) == ['base', '1091', '11'] }
    assert_equal({
      'family:skoria' => 'not-an-issue',
      'item:skoria-family-ring' => 'accepted'
    }, JSON.parse(ring['entity_dispositions_json']))
    assert_equal '스코리아 가문 반지(Skoria Family Ring)', ring['new']
  end

  def test_prior_person_and_place_dispositions_remain_distinct
    index = M.table(M::INDEX).to_h do |row|
      [[row['entity_key'], *M.key(row)], row]
    end
    assert_equal 'excluded', index.fetch(['person:darkvari', 'default', '11271', ''])['status']
    assert_equal 'accepted', index.fetch(['family:darkvari', 'default', '11271', ''])['status']
    assert_equal 'excluded', index.fetch(['person:skoria', 'base', '1091', '11'])['status']
    assert_equal 'not-an-issue', index.fetch(['family:skoria', 'base', '1091', '11'])['status']
    assert_equal 'accepted', index.fetch(['item:skoria-family-ring', 'base', '1091', '11'])['status']
    assert_equal 'not-an-issue', index.fetch(['place:skoria-mine', 'default', '56178', ''])['status']
  end

  def test_cynric_boys_bilingual_correction_preserves_old_disposition_and_key
    correction = manifest(21_616)
    assert_equal 1, correction.length
    row = correction.first
    assert_equal ['default', '39662', ''], M.key(row)
    assert_equal 'family:cynric', row['entity_key']
    assert_equal 'accepted', row['status']
    assert_equal '신릭 가문(Cynric family)의 소년들에게',
                 row['new'].match(/신릭 가문\(Cynric family\)의 소년들에게/).to_s
    assert_equal({ 'family:cynric' => 'not-an-issue' }, JSON.parse(row['previous_status']))
    assert row['previous_evidence'].include?('D-21614:')
  end
end
