#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-gamian-D21676'

class GamianD21676Test < Minitest::Test
  def source(english, japanese = 'ブラザー・ギャミアン', chinese = '加米安修士')
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate([japanese]),
      'zh_text' => chinese
    }
  end

  def test_titled_forms_and_minimal_contextual_particle_preservation
    assert_equal ['가미안 수사(Brother Gamian)', false],
      GamianD21676.transform(nil, ['default', '22114', ''], '가미안 형제',
                             source('Brother Gamian'))
    assert_equal ["서문\r\n가미안 수사(Brother Gamian)의 기록\n끝", false],
      GamianD21676.transform(
        nil, ['default', '32556', ''],
        "서문\r\n감미안 수사의 기록\n끝",
        source("By Brother Gamian of St. Hadwyn's Undying Mission\n\nA teaching.")
      )
    assert_equal ['가미안 수사(Brother Gamian)가 잘 설명해.', false],
      GamianD21676.transform(
        nil, ['default', '44310', ''], '가미안 수사가 잘 설명해.',
        source('Brother Gamian says it best.')
      )
  end

  def test_short_and_already_bilingual_forms
    assert_equal ['가미안(Gamian)이나 우도', false],
      GamianD21676.transform(
        nil, ['default', '45117', ''], '가미안이나 우도',
        source('Speak with Gamian or Udo.', 'ギャミアンかウドに聞いて', '伽米安或者乌多')
      )
    assert_equal ['가미안(Gamian)', false],
      GamianD21676.transform(
        nil, ['default', '61726', ''], '가미안(Gamian)',
        source('Gamian', 'ギャミアン', '加米安')
      )
    assert_equal ['가미안 수사(Brother Gamian)', false],
      GamianD21676.transform(
        nil, ['default', '61978', ''],
        '가미안 수사(Brother Gamian)',
        source('Have you seen our shards and gems? Brother Gamian keeps them.')
      )
    assert_equal ['가미안(Gamian)', false],
      GamianD21676.transform(
        nil, ['default', '64721', ''], '가미안(Gamian)',
        source('Gamian', 'Gamian', 'Gamian')
      )
  end

  def test_unknown_key_and_unreviewed_span_fail_closed
    assert_raises(RuntimeError) do
      GamianD21676.transform(nil, ['default', '1', ''], '가미안',
                             source('Brother Gamian'))
    end
    assert_raises(RuntimeError) do
      GamianD21676.transform(nil, ['default', '22114', ''], '다른 수사',
                             source('Brother Gamian'))
    end
  end
end
