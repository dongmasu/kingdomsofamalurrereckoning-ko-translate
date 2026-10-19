#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-ancient-vault-D21691'

class AncientVaultD21691Test < Minitest::Test
  M = AncientVaultD21691

  def test_scope_covers_only_the_26_reviewed_singular_site_rows
    assert_equal 26, M::KEYS.length
    assert_equal M::KEYS.length, M::KEYS.uniq.length
    refute_includes M::KEYS, ['default', '25861', '']
    refute_includes M::KEYS, ['default', '3481', '']
  end

  def test_korean_label_variants_normalize_to_one_bilingual_place_name
    assert_equal '고대 금고(Ancient Vault) 방문하기',
      M.transform(M::SPEC, ['default', '15426', ''],
        '고대 저장고 방문하기',
        source('Visit the Ancient Vault', '古代の宝物庫を訪ねる', '拜访远古金库'))
        .first
    assert_equal '고대 금고(Ancient Vault)에서 약탈했다',
      M.transform(M::SPEC, ['default', '30644', ''],
        '고대 보물창고에서 약탈했다',
        source('The ancient vault was pillaged.', '古代の宝物庫が略奪された。', '远古金库遭到了洗劫。'))
        .first
  end

  def test_existing_bilingual_label_is_preserved
    text = '고대 금고(Ancient Vault)에서 유물을 되찾았다.'
    assert_equal [text, false],
      M.transform(M::SPEC, ['default', '7589', ''], text,
        source('I recovered it from the Ancient Vault.', '古代の宝物庫から回収した。', '从远古金库中找回。'))
  end

  def test_unreviewed_or_plural_scope_is_rejected
    assert_raises(RuntimeError) do
      M.transform(M::SPEC, ['default', '25861', ''], '고대 금고로 들어가라',
        source('Enter their Ancient Vaults.', '古代の宝物庫に入れ。', '进入远古金库。'))
    end
  end

  private

  def source(english, japanese, chinese)
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate([japanese]),
      'zh_text' => chinese
    }
  end
end
