require 'minitest/autorun'
require_relative 'review-holnstead-source-label-D21657'

class HolnsteadSourceLabelD21657Test < Minitest::Test
  M = HolnsteadSourceLabelD21657

  def test_exact_label_requires_same_locales_and_consistent_base_anchors
    rows = {
      M::TARGET => {
        'en_texts_json' => JSON.generate(['Holnstead']),
        'ja_texts_json' => JSON.generate(['ホルンステッド']),
        'zh_text' => '霍恩斯泰德', 'work_text' => M::OLD
      },
      ['base', '4299', '11'] => {
        'en_texts_json' => JSON.generate(['Holnstead']),
        'ja_texts_json' => JSON.generate(['ホルンステッド']),
        'zh_text' => '霍恩家园', 'work_text' => '홀른스테드(Holnstead)'
      },
      ['base', '1957', '11'] => {
        'en_texts_json' => JSON.generate(['The Holnstead']),
        'ja_texts_json' => JSON.generate(['ホルンステッド']),
        'zh_text' => '霍恩家园', 'work_text' => '홀른스테드 (The Holnstead)'
      }
    }
    assert M.review(rows)
  end

  def test_extra_exact_english_occurrence_fails_closed
    rows = {
      M::TARGET => {
        'en_texts_json' => JSON.generate(['Holnstead']),
        'ja_texts_json' => JSON.generate(['ホルンステッド']),
        'zh_text' => '霍恩斯泰德', 'work_text' => M::OLD
      },
      ['base', '4299', '11'] => {
        'en_texts_json' => JSON.generate(['Holnstead']),
        'ja_texts_json' => JSON.generate(['ホルンステッド']),
        'zh_text' => '霍恩家园', 'work_text' => '홀른스테드(Holnstead)'
      },
      ['base', '1957', '11'] => {
        'en_texts_json' => JSON.generate(['The Holnstead']),
        'ja_texts_json' => JSON.generate(['ホルンステッド']),
        'zh_text' => '霍恩家园', 'work_text' => '홀른스테드 (The Holnstead)'
      },
      ['default', '1', ''] => {
        'en_texts_json' => JSON.generate(['Holnstead']),
        'ja_texts_json' => JSON.generate(['ホルンステッド']),
        'zh_text' => '霍恩斯泰德', 'work_text' => M::OLD
      }
    }
    assert_raises(RuntimeError) { M.review(rows) }
  end
end
