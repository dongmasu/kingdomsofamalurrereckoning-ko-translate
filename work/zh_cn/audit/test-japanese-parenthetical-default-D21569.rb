#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-japanese-parenthetical-default-D21569'

class JapaneseParentheticalDefaultD21569Test < Minitest::Test
  R = ReviewJapaneseParentheticalDefaultD21569

  def test_time_qualifiers_use_compact_japanese_style
    assert_equal '(야간)', R.proposed_text('13409', 'condition-fragment', '밤에', 'at Night')
    assert_equal '(주간)', R.proposed_text('57928', 'condition-fragment', '낮 동안', 'during Daytime')
  end

  def test_familiar_levels_preserve_upgrade_and_mastery_distinctions
    assert_equal '(사역마 레벨 7)', R.proposed_text('5282', 'condition-fragment', '레벨 7 사역마와 함께', 'with Level 7 Familiar')
    assert_equal '(사역마 강화 레벨 6)', R.proposed_text('820', 'condition-fragment', '레벨 6 사역마 강화', 'with Level 6 Familiar Upgrade')
    assert_equal '(사역마 숙련도 레벨 6)', R.proposed_text('8971', 'condition-fragment', '친숙 숙련도 6레벨 보유', 'with Level 6 Familiar Mastery')
  end

  def test_explanations_and_runtime_tokens_remain_unchanged
    ['(그녀를 무시한다.)', '({1}%)', '(자동 저장)'].each do |text|
      assert_equal text, R.proposed_text('test', 'explanatory-parenthetical', text, text)
    end
    assert_equal 'explanatory-parenthetical', R.classification('48906', '({1}%)', '({1}%)')
    assert_raises(RuntimeError) { R.classification('test', 'A complete unrelated sentence.', '문장') }
  end

  def test_source_conflicts_do_not_silently_follow_japanese_meaning
    assert_equal '(적을 기절시키기 위해)', R.proposed_text('26982', 'purpose-fragment', '적을 기절시키기 위해', 'to stun enemies')
    assert_equal '(장화를 신지 않았을 때)', R.proposed_text('58894', 'condition-fragment', '장화를 신지 않았을 때', 'when boots have not been worn')
    assert_includes R.evidence_for('58894', 'condition-fragment'), 'Source conflict retained'
  end

  def test_weapon_name_uses_official_manual_and_spawn_is_translated
    assert_equal '(셉터 사용 시)', R.proposed_text('2124', 'condition-fragment', '홀을 들고', 'with Sceptres')
    assert_equal '(손재주 생성)', R.proposed_text('10487', 'spawn-action-fragment', 'to spawn "Sleight of Hand"', 'to spawn "Sleight of Hand"')
    assert_equal "('사냥꾼-채집가' 생성)", R.proposed_text('17772', 'spawn-action-fragment', '""사냥꾼-채집가"" 생성', 'to spawn "Hunter-Gatherer"')
  end
end
