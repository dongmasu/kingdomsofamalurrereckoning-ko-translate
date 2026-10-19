#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-nix-D21715'

class ReviewNixD21715Test < Minitest::Test
  M = ReviewNixD21715

  def source(english)
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate(['ニクス']),
      'zh_text' => '尼克斯',
      'resource' => 'default',
      'ID_Linha' => '1',
      'Tipo_Variante' => '',
      'work_text' => '닉스'
    }
  end

  def test_short_name_is_paired_and_particles_remain_attached
    revised, = M.transform(nil, ['default', '1', ''],
                           '닉스에게서 물건을 되찾았다.', source('Nix'))
    assert_equal '닉스(Nix)에게서 물건을 되찾았다.', revised
  end

  def test_full_name_is_paired_as_one_label
    revised, = M.transform(nil, ['default', '54256', ''],
      '트롤(Troll) 닉스(Nix)', source('Nix the Troll'))
    assert_equal '트롤 닉스(Nix the Troll)', revised
  end

  def test_second_name_mention_is_also_paired
    revised, = M.transform(nil, ['default', '38793', ''],
      '트롤(Troll) 부하 닉스. 닉스가 왔다.',
      source('Nix the troll. Nix must have the Cairn.'))
    assert_equal '트롤 부하 닉스(Nix the Troll). 닉스(Nix)가 왔다.', revised
  end

  def test_existing_bilingual_short_name_is_unchanged
    text = '닉스(Nix)는 이 근처에 있다.'
    assert_equal [text, false],
      M.transform(nil, ['default', '1', ''], text, source('Nix'))
  end

  def test_missing_cross_language_evidence_is_rejected
    evidence = source('Nix')
    evidence['zh_text'] = ''
    assert_raises(RuntimeError) do
      M.transform(nil, ['default', '1', ''], '닉스', evidence)
    end
  end
end
