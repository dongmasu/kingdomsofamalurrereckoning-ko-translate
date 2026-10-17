#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-eadric-discovery-D21060'

class EadricDiscoveryD21060Test < Minitest::Test
  def edit(text, english)
    EadricDiscoveryD21060.edit_name(text, english)
  end

  def test_existing_complete_compounds_are_not_duplicated
    assert_equal "성 이드릭 선교원(St. Eadric's Mission)",
                 edit("성 에이드릭 선교원(St. Eadric's Mission)", "St. Eadric's Mission")
    assert_equal '성 이드릭의 수의(Pall of St. Eadric)',
                 edit('성 에드릭의 수의(Pall of St. Eadric)', 'Pall of St. Eadric')
  end

  def test_person_titles_and_existing_local_labels_are_preserved
    assert_equal '성 이드릭(Saint Eadric)의 유해',
                 edit('성자 에이드릭의 유해', 'Saint Eadric')
    assert_equal "성 이드릭(St. Eadric's)에 왔어.",
                 edit("성 에이드릭(St. Eadric's)에 왔어.", "St. Eadric's")
    assert_equal '이드릭(Eadric)', edit('에이드릭(Eadric)', 'Eadric')
  end

  def test_separate_unpaired_mentions_are_paired
    assert_equal '성 이드릭(St. Eadric)의 선교회. 성 이드릭의 수의(Pall of St. Eadric)',
                 edit('성 이드릭의 선교회. 성 이드릭의 수의(Pall of St. Eadric)',
                      "St. Eadric's Mission. Pall of St. Eadric")
  end
end
