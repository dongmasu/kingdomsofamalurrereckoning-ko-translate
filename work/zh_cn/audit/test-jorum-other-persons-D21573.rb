#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-jorum-other-persons-D21573'

class JorumOtherPersonsD21573Test < Minitest::Test
  R = ReviewJorumOtherPersonsD21573
  JORUM = R::SPECS.find { |spec| spec[:key] == R::JORUM }

  def test_full_and_short_mentions_are_paired_separately
    assert_equal '조럼 퀸티스(Jorum Quintus)가 말했다. 조럼(Jorum)에게 가자.',
                 R.transform(JORUM, ['default', '8735', ''], '조룸 퀸투스가 말했다. 조럼에게 가자.',
                             'Jorum Quintus spoke. Return to Jorum.')
  end

  def test_menu_spelling_and_existing_pair_are_not_nested
    text = '조럼 퀸티스(Jorum Quintis)'
    assert_equal text, R.transform(JORUM, ['default', '20322', ''], text, 'Jorum Quintis')
    assert_equal '숙련자 조럼 퀸티스(Jorum Quintis)',
                 R.transform(JORUM, ['default', '43300', ''], '숙련자 조럼 퀸티스', 'Adept Jorum Quintis')
  end

  def test_possessive_short_variant_keeps_its_source_form
    text = '알로렌(Aloren)과 버트런(Bertran)이 퀸티스의 보석을 훔쳤다.'
    assert_equal '알로렌(Aloren)과 버트런(Bertran)이 퀸티스(Quintis)의 보석을 훔쳤다.',
                 R.transform(JORUM, ['default', '15430', ''], text, "Quintis' gem")
  end

  def test_shared_surnames_do_not_add_unrestricted_aliases
    assert R::SPECS.reject { |spec| spec[:key] == R::JORUM }.all? { |spec| !spec.key?(:aliases) }
    spec = R::SPECS.find { |entry| entry[:english] == 'Bara Warnir' }
    assert_equal '바라 워니르(Bara Warnir)라는 바라니(Varani)',
                 R.transform(spec, ['default', '34002', ''], '바라 와르니르라는 바라니(Varani)', 'Bara Warnir')
  end
end
