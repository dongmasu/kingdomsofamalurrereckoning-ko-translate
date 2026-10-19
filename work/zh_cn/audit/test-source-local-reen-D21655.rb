require 'minitest/autorun'
require_relative 'review-source-local-reen-D21655'

class SourceLocalReenD21655Test < Minitest::Test
  R = SourceLocalReenD21655

  def inventory
    [R::TARGET, *R::ANCHORS].to_h do |key|
      [key, {
        'en_texts_json' => JSON.generate([R::ENGLISH]),
        'ja_texts_json' => JSON.generate([R::JAPANESE]),
        'zh_text' => R::CHINESE,
        'work_text' => key == R::TARGET ? R::OLD : R::NEW
      }]
    end
  end

  def test_only_missing_annotation_is_reviewed
    row = R.review(inventory)
    assert_equal R::TARGET, ReviewedNameBatches.key(row)
    assert_equal R::NEW, row['new']
    assert_equal '{}', row['entity_dispositions_json']
    assert_includes row['evidence'], 'Preserve all D-19507/D-19510'
  end

  def test_changed_anchor_fails_closed
    rows = inventory
    rows.fetch(R::ANCHORS.first)['work_text'] = 'changed'
    assert_raises(RuntimeError) { R.review(rows) }
  end

  def test_extra_label_fails_closed
    rows = inventory
    rows[['default', '1', '']] = rows.fetch(R::TARGET).dup
    assert_raises(RuntimeError) { R.review(rows) }
  end
end
