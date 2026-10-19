#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'build-shrines-discovery-D21777'

class TestShrinesDiscoveryD21777 < Minitest::Test
  def test_air_names_and_particle
    m = ShrinesDiscoveryD21777
    %w[공기의\ 성소 바람의\ 성소 바람의\ 사당].each do |old|
      assert_equal '대기의 성소(Shrine of Air)', m.proposed('place:shrine-of-air', old)
    end
    assert_equal '대기의 성소(Shrine of Air)로 가기',
                 m.proposed('place:shrine-of-air', '바람의 성소으로 가기')
  end

  def test_existing_pairs_remain_unchanged
    ShrinesDiscoveryD21777::ENTITIES.each do |entity, (_english, korean, _ids)|
      assert_equal korean, ShrinesDiscoveryD21777.proposed(entity, korean)
    end
  end

  def test_distinct_source_scopes
    assert_equal [6, 6], ShrinesDiscoveryD21777::ENTITIES.values.map { |parts| parts.last.length }
    assert_equal 12, ShrinesDiscoveryD21777::ENTITIES.values.flat_map(&:last).uniq.length
  end
end
