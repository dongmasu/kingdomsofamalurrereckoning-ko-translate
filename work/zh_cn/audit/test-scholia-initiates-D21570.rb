#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-scholia-initiates-D21570'

class ScholiaInitiatesD21570Test < Minitest::Test
  R = ReviewScholiaInitiatesD21570

  def test_repeated_aloren_mentions_are_paired_without_duplicates
    text, status = R.transform('person:aloren', ['default', '4461', ''],
                              "알로렌(Aloren)은 알로렌과 아로렌을 만났다.\r\n{1}")
    assert_equal "알로렌(Aloren)은 알로렌(Aloren)과 알로렌(Aloren)을 만났다.\r\n{1}", text
    assert_equal 'accepted', status
    assert_equal [text, 'not-an-issue'], R.transform('person:aloren', ['default', '4461', ''], text)
  end

  def test_bertran_lot_is_not_the_initiate
    [%w[base 2 11], ['default', '51529', '']].each do |key|
      text = '버트런 로트(Bertran Lot)의 무덤'
      assert_equal [text, 'excluded'], R.transform('person:bertran-nest', key, text)
    end
  end

  def test_full_names_are_paired_once
    assert_equal ['버트런 네스트(Bertran Nest)의 일지', 'accepted'],
                 R.transform('person:bertran-nest', ['default', '29200', ''],
                             '베르트란 네스트(Bertran Nest)의 일지')
    text = '카세라 본(Cassera Vonn)의 일지'
    assert_equal [text, 'not-an-issue'],
                 R.transform('person:cassera-vonn', ['default', '22447', ''], text)
  end

  def test_short_name_keeps_source_short_form_and_dialogue
    text = '베르트란(Bertran)은 버트란과 버트런을 찾았다.'
    assert_equal ['버트런(Bertran)은 버트런(Bertran)과 버트런(Bertran)을 찾았다.', 'accepted'],
                 R.transform('person:bertran-nest', ['default', '3494', ''], text)
    assert_equal ['카세라(Cassera)가… 카세라(Cassera)는', 'accepted'],
                 R.transform('person:cassera-vonn', ['default', '61390', ''], '카세라(Cassera)가… 카세라는')
  end
end
