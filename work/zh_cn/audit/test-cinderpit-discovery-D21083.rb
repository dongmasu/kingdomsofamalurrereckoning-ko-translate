#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-cinderpit-discovery-D21083'

class CinderpitDiscoveryD21083Test < Minitest::Test
  def test_bare_and_already_paired_spelling_variants
    %w[신더핏 시더핏 시너더핏].each do |name|
      [name, "#{name}(Cinderpit)"].each do |old|
        assert_equal '신더핏(Cinderpit)에 들어가기',
                     CinderpitDiscoveryD21083.edit_name("#{old}에 들어가기")
      end
    end
  end

  def test_other_names_and_multiline_lore_are_unchanged
    value = "스칼드(Skald)의 시너더핏(Cinderpit).\r\n{LINE_SPACE}크로우 피크(Crow Peak)"
    assert_equal "스칼드(Skald)의 신더핏(Cinderpit).\r\n{LINE_SPACE}크로우 피크(Crow Peak)",
                 CinderpitDiscoveryD21083.edit_name(value)
  end
end
