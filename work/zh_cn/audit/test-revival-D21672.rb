#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-revival-D21672'

class RevivalD21672Test < Minitest::Test
  def source(english, japanese = 'リバイバル', chinese = '复兴营地')
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate([japanese]),
      'zh_text' => chinese
    }
  end

  def test_place_name_variants_are_normalized_without_rewriting_context
    assert_equal ['리바이벌(Revival) 사람들이 모두 왔다.', false],
      RevivalD21672.transform(nil, ['default', '1703', ''],
                              '부활촌(Revival) 사람들이 모두 왔다.',
                              source('Everyone in Revival is talking.'))
    assert_equal ['리바이벌(Revival)의 지도자는 예언자다.', false],
      RevivalD21672.transform(nil, ['default', '5296', ''],
                              '리바이벌의 지도자는 예언자다.',
                              source('The leader in Revival is Augur.'))
    assert_equal ['리바이벌(Revival)에서 편히 지내세요.', false],
      RevivalD21672.transform(nil, ['default', '8569', ''],
                              '리바이벌에서 편히 지내세요.',
                              source('Please be comfortable here in Revival.'))
    assert_equal ['리바이벌(Revival)이라 부른다.', false],
      RevivalD21672.transform(nil, ['default', '37797', ''],
                              '리바이벌이라 부른다.',
                              source('They call it Revival.'))
  end

  def test_full_compound_labels_remain_atomic
    assert_equal ['리바이벌 야영지(Camp Revival)에서 이반을 만나라.', false],
      RevivalD21672.transform(nil, ['default', '16934', ''],
                              '리바이벌 야영지에서 이반을 만나라.',
                              source('Meet Ivan in Camp Revival.'))
    old = '리바이벌 감옥(Revival Prison)'
    assert_equal [old, true],
      RevivalD21672.transform(nil, ['default', '27223', ''], old,
                              source('Revival Prison', 'リバイバル監獄', '复兴监狱'))
  end

  def test_existing_canonical_label_is_unchanged_and_invalid_scope_fails_closed
    old = '리바이벌(Revival)'
    assert_equal [old, false],
      RevivalD21672.transform(nil, ['default', '33849', ''], old,
                              source('Revival'))
    assert_raises(RuntimeError) do
      RevivalD21672.transform(nil, ['default', '1', ''], old, source('Revival'))
    end
    assert_raises(RuntimeError) do
      RevivalD21672.transform(nil, ['default', '5850', ''], '부활',
                              source('Revival', 'リバイバル', '没有关联'))
    end
  end
end
