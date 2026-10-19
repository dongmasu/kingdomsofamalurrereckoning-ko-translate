#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'build-proper-name-discovery-D21756'

class ProperNameDiscoveryD21756Test < Minitest::Test
  M = ProperNameDiscoveryD21756

  def test_registered_title_is_bilingual_and_exact
    definition = ReviewedNameBatches.table(M::DEFINITION_PATH).first
    assert_equal 'title:grand-champion', definition['entity_key']
    assert_equal '그랜드 챔피언(Grand Champion)', definition['korean_canonical']
  end

  def test_longer_valor_title_rows_remain_excluded
    assert_equal 'excluded', M::DISPOSITIONS.fetch('5070')
    assert_equal 'excluded', M::DISPOSITIONS.fetch('40966')
    refute M::EDITS.key?('5070')
    refute M::EDITS.key?('40966')
  end

  def test_existing_canonical_pair_is_not_edited_again
    refute M::EDITS.key?('52121')
    assert_equal 'not-an-issue', M::DISPOSITIONS.fetch('52121')
  end

  def test_prior_decisions_are_preserved_as_context
    assert_match(/D-591.*without reopening or recounting/, M.evidence('3069'))
    assert_match(/D-20096.*without reopening or recounting/, M.evidence('51097'))
    assert_match(/D-21719.*exclusion/, M.evidence('5070'))
  end
end
