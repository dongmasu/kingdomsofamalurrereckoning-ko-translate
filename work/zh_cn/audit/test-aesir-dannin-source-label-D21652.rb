#!/usr/bin/env ruby

require 'json'
require 'minitest/autorun'
require_relative 'review-aesir-dannin-source-label-D21652'

class AesirDanninSourceLabelD21652Test < Minitest::Test
  M = AesirDanninSourceLabelD21652

  def inventory
    M::TARGET.then do |target|
      parallel = M::PARALLEL
      [target, parallel].to_h do |key|
        source = {
          'en_texts_json' => JSON.generate([M::ENGLISH]),
          'ja_texts_json' => JSON.generate([M::JAPANESE]),
          'zh_text' => M::CHINESE,
          'work_text' => key == target ? M::OLD : M::PARALLEL_KOREAN
        }
        [key, source]
      end
    end
  end

  def test_reviews_only_the_missing_source_local_annotation
    row = M.review(inventory)

    assert_equal ['default', '15109', ''], [row['resource'], row['ID_Linha'], row['Tipo_Variante']]
    assert_equal 'accepted', row['status']
    assert_includes row['new'], '아이시르 다닌(Aesir Dannin)'
    assert_equal '{}', row['entity_dispositions_json']
    assert_includes row['evidence'], 'Preserve D-4598 translation uncertainty'
  end

  def test_changed_parallel_evidence_fails_closed
    changed = inventory
    changed.fetch(M::PARALLEL)['zh_text'] = 'different'

    assert_raises(RuntimeError) { M.review(changed) }
  end

  def test_unexpected_exact_source_occurrence_fails_closed
    changed = inventory
    extra = changed.fetch(M::TARGET).dup
    changed[['default', '15110', '']] = extra

    assert_raises(RuntimeError) { M.validate_scope!(changed) }
  end
end
