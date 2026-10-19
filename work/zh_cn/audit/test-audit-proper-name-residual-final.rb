#!/usr/bin/env ruby

require 'minitest/autorun'
require 'open3'
require 'rbconfig'

class ProperNameResidualAuditTest < Minitest::Test
  def test_documented_local_king_ysa_translation_is_covered
    audit = File.join(__dir__, 'audit-proper-name-residual-final.rb')
    stdout, stderr, status = Open3.capture3(RbConfig.ruby, audit)

    assert status.success?, "#{stdout}\n#{stderr}"
    assert_match 'Terminal matches without a covering bilingual English label: 0', stdout
    assert_match 'undocumented extras=0', stdout
    assert_match 'Documented source-local rank translations: 1', stdout
    assert_match 'Documented row-scoped Syl place labels: 5', stdout
    assert_match 'Documented source-local Walls labels: 7', stdout
    refute_match(/default.*12727/, stdout)
    refute_match(/"entity_key":"person:michaela-vogel"/, stdout)
    refute_match(/UNDOCUMENTED EXTRA/, stdout)
  end
end
