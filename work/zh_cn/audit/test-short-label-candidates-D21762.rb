#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-short-label-candidates-D21762'

class ReviewShortLabelCandidatesD21762Test < Minitest::Test
  M = ReviewShortLabelCandidatesD21762

  def inventory
    M::M.table(M::M::INVENTORY).map(&:to_h).to_h do |row|
      [M.row_key(row), row]
    end
  end

  def test_bounded_candidate_groups_fit_one_candidate_batch
    assert_equal 36, M::GROUPS.values.sum { |group| group.fetch(:count) }
    assert_operator M::GROUPS.values.sum { |group| group.fetch(:count) }, :<=, 50
  end

  def test_full_source_entity_scopes_are_split_at_fifty_keys
    inv = inventory
    counts = M::SPECS.to_h do |spec|
      [spec.fetch(:key), M.full_source_keys(inv, spec.fetch(:english)).length]
    end
    assert_equal(
      {
        'resource:lapidus-root' => 7,
        'title:lord-kandrian' => 57,
        'title:loremaster' => 9
      },
      counts
    )
    all_keys = M::SPECS.flat_map do |spec|
      M.full_source_keys(inv, spec.fetch(:english))
    end.uniq
    assert_equal 73, all_keys.length
    assert_equal [50, 23], [50, all_keys.length - 50]
  end

  def test_lord_is_a_transferable_title_and_does_not_match_the_guard
    spec = M::SPECS.fetch(1)
    source = { 'en_texts_json' => '["Lord Kandrian and the Kandrian Guard"]' }
    old = '칸드리안(Kandrian) 경과 칸드리안 경비대가 왔어.'
    new_text, = M.transform(spec, ['default', '5194', ''], old, source)
    assert_equal '칸드리안 경(Lord Kandrian)과 칸드리안 경비대가 왔어.', new_text
    assert_equal 'title', spec.fetch(:category)
    assert_includes spec.fetch(:notes), 'not one person identity'
  end

  def test_root_and_loremaster_canonical_forms
    inv = inventory
    root = M::SPECS.fetch(0)
    source = inv.fetch(['base', '2626', '11'])
    assert_equal '라피두스 뿌리(Lapidus Root)',
                 M.transform(root, M.row_key(source), source.fetch('work_text'), source).first
    loremaster = M::SPECS.fetch(2)
    source = inv.fetch(['default', '52070', ''])
    assert_equal '전승지기(Loremaster)가 자네와 그 서를 기다리고 있어.',
                 M.transform(loremaster, M.row_key(source), source.fetch('work_text'), source).first
    excluded = inv.fetch(['default', '44746', ''])
    assert_equal [excluded.fetch('work_text'), true],
                 M.transform(loremaster, M.row_key(excluded), excluded.fetch('work_text'), excluded)
  end
end
