#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-quartenion-D21670'

class QuartenionD21670Test < Minitest::Test
  def test_book_label_uses_existing_excerpt_form
    source = {'en_texts_json' => '["The Quartenion"]', 'ja_texts_json' => '["四元数"]', 'zh_text' => '四元'}
    assert_equal [QuartenionD21670::CANONICAL, false],
      QuartenionD21670.transform(nil, ['default', '42324', ''], '콰터니언', source)
  end

  def test_erathi_script_is_not_merged_with_the_book
    source = {'en_texts_json' => '["Quartenion hand"]', 'ja_texts_json' => '["四次元の手"]', 'zh_text' => '四元文字'}
    old = '쿠아르테니온 서체'
    assert_equal [old, true], QuartenionD21670.transform(
      nil, ['default', '45438', ''], old, source
    )
  end
end
