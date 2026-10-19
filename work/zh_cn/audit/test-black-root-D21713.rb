#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-black-root-D21713'

class ReviewBlackRootD21713Test < Minitest::Test
  M = ReviewBlackRootD21713

  def source(english)
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate(['黒い根っこ']),
      'zh_text' => '黑根'
    }
  end

  def test_named_labels_use_one_literal_bilingual_form
    assert_equal ['검은 뿌리(Black Root)', false],
      M.transform(nil, ['base', '134', '11'], '검은 뿌리', source('Black Root'))
    assert_equal ['검은 뿌리(Black Root)', false],
      M.transform(nil, ['default', '60748', ''],
                  '블랙 루트(Black Root)', source('Black Root'))
  end

  def test_lowercase_indefinite_description_is_preserved_outside_item_scope
    text = '수수께끼의 검은 뿌리.'
    assert_equal [text, true],
      M.transform(nil, ['default', '40988', ''],
                  text, source('A mysterious black root.'))
  end

  def test_unreviewed_korean_form_is_rejected
    assert_raises(RuntimeError) do
      M.transform(nil, ['base', '134', '11'], '검은 뿌리(BLACKROOT)',
                  source('Black Root'))
    end
  end
end
