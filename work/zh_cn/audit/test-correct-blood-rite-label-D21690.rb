#!/usr/bin/env ruby

require 'json'
require 'minitest/autorun'
require_relative 'correct-blood-rite-label-D21690'

class CorrectBloodRiteLabelD21690Test < Minitest::Test
  M = CorrectBloodRiteLabelD21690

  def test_only_the_english_label_is_added
    assert_equal '피의 의식(Blood Rite)을 위하여!', M::NEW
    assert_equal M::ENGLISH, 'For the Blood rite!'
    assert_equal M::OLD.sub('의식을 ', '의식(Blood Rite)을 '), M::NEW
  end

  def test_original_terminal_decision_is_not_reclassified
    row = {
      'entity_key' => M::ENTITY,
      'resource' => M::KEY[0], 'ID_Linha' => M::KEY[1],
      'Tipo_Variante' => M::KEY[2], 'status' => 'not-an-issue',
      'evidence' => 'D-21689: prior terminal decision'
    }
    assert_equal 'not-an-issue', row.fetch('status')
    assert row.fetch('evidence').start_with?('D-21689:')
  end
end
