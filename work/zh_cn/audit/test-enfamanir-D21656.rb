require 'minitest/autorun'
require_relative 'review-enfamanir-D21656'

class EnfamanirD21656Test < Minitest::Test
  def source
    {
      'en_texts_json' => JSON.generate(['Enfamanir']),
      'ja_texts_json' => JSON.generate(['エンファマニア']),
      'zh_text' => '恩法玛尼尔'
    }
  end

  def test_preserves_complete_work_title_and_pairs_two_creature_mentions
    text = '엔파마니르에게서, 《엔파마니르의 그림자(Shadow of Enfamanir)》. 엔파마니르의 소굴.'
    changed, excluded = EnfamanirD21656.transform(['default', '26329', ''], text, source)
    refute excluded
    assert_equal 2, changed.scan('엔파마니르(Enfamanir)').length
    assert_includes changed, '《엔파마니르의 그림자(Shadow of Enfamanir)》'
    assert_includes changed, '엔파마니르(Enfamanir)의 소굴'
  end

  def test_excludes_title_only_rows_without_editing
    text = '엔파마니르의 그림자(Shadow of Enfamanir)'
    assert_equal [text, true], EnfamanirD21656.transform(['base', '2218', '11'], text, source)
  end

  def test_preserves_existing_pair
    text = '엔파마니르(Enfamanir) 처치'
    assert_equal [text, false], EnfamanirD21656.transform(['default', '61125', ''], text, source)
  end

  def test_unexpected_scope_fails_closed
    assert_raises(RuntimeError) do
      EnfamanirD21656.transform(['affix', '0', '11'], '엔파마니르', source)
    end
  end
end
