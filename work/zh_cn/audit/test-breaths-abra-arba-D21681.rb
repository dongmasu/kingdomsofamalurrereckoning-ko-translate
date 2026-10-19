#!/usr/bin/env ruby

require 'json'
require 'minitest/autorun'
require_relative 'review-breaths-abra-arba-D21681'

class BreathsAbraArbaD21681Test < Minitest::Test
  M = BreathsAbraArbaD21681

  def source(key)
    entity = M::ENTITY_BY_KEY.fetch(key)
    title = entity == M::ABRA ? M::ABRA_TITLE : M::ARBA_TITLE
    english = if key == ['default', '33403', '']
                "We've reached the resting place of Arba's staff, the Breath of Arba."
              else
                "The #{title} is here."
              end
    japanese = M::JA_EVIDENCE.fetch(key)
    chinese = M::ZH_EVIDENCE.fetch(key)
    if key == ['default', '33403', '']
      japanese = "#{japanese} アーバの杖がある"
      chinese = "阿尔巴的法杖#{chinese}"
    end
    {
      'en_texts_json' => JSON.generate([english]),
      'ja_texts_json' => JSON.generate([japanese]),
      'zh_text' => chinese
    }
  end

  def spec(key)
    M::SPECS.find { |candidate| candidate.fetch(:key) == M::ENTITY_BY_KEY.fetch(key) }
  end

  def test_two_item_owners_have_disjoint_exact_source_scopes
    assert_equal 2, M::ABRA_KEYS.length
    assert_equal 10, M::ARBA_KEYS.length
    assert_empty M::ABRA_KEYS & M::ARBA_KEYS
    assert_equal M::ABRA_KEYS.length + M::ARBA_KEYS.length, M::KEYS.length
    assert_equal M::ABRA, M::ENTITY_BY_KEY.fetch(['base', '2579', '11'])
    assert_equal M::ARBA, M::ENTITY_BY_KEY.fetch(['base', '4016', '11'])
    assert_equal 2, M::SPECS.first.fetch(:count)
    assert_equal 10, M::SPECS.last.fetch(:count)
  end

  def test_item_names_are_distinct_and_not_person_owners
    assert_equal '아브라의 숨결(Breath of Abra)', M::SPECS.first.fetch(:korean)
    assert_equal '아르바의 숨결(Breath of Arba)', M::SPECS.last.fetch(:korean)
    assert_equal [M::ABRA, M::ARBA], M::SPECS.map { |item| item.fetch(:key) }
    refute_includes M::SPECS.map { |item| item.fetch(:key) }, 'person:arba'
  end

  def test_each_exact_item_span_is_normalized_without_changing_surrounding_text
    M::KEYS.each do |key|
      entity = M::ENTITY_BY_KEY.fetch(key)
      canonical = entity == M::ABRA ? M::ABRA_CANONICAL : M::ARBA_CANONICAL
      old = M::OLD_SPANS.fetch(key)
      text = "앞말\r\n{1} #{old}를 지켜. 그녀는 그것을 가져가.\n뒷말"
      expected = "앞말\r\n{1} #{canonical}를 지켜. 그녀는 그것을 가져가.\n뒷말"
      assert_equal [expected, false], M.transform(spec(key), key, text, source(key)),
                   key.inspect
    end
  end

  def test_default_33403_keeps_arbas_staff_phrase_and_only_pairs_breath
    key = ['default', '33403', '']
    text = '아르바의 지팡이, 아르바의 숨결이 있는 안식처에 도착했다.'
    expected = '아르바의 지팡이, 아르바의 숨결(Breath of Arba)이 있는 안식처에 도착했다.'
    assert_equal [expected, false], M.transform(spec(key), key, text, source(key))
  end

  def test_already_paired_item_spans_are_idempotent
    [['default', '52465', ''], ['default', '60211', '']].each do |key|
      entity = M::ENTITY_BY_KEY.fetch(key)
      canonical = entity == M::ABRA ? M::ABRA_CANONICAL : M::ARBA_CANONICAL
      text = "얻은 #{canonical}를 가지고 돌아가."
      assert_equal [text, false], M.transform(spec(key), key, text, source(key))
    end
  end

  def test_all_three_source_locales_are_required
    M::KEYS.each do |key|
      M.validate_source!(key, source(key))
      %w[en_texts_json ja_texts_json zh_text].each do |field|
        changed = source(key)
        changed[field] = field.end_with?('_json') ? JSON.generate(['Other']) : 'Other'
        assert_raises(RuntimeError, "#{key.inspect} #{field}") do
          M.validate_source!(key, changed)
        end
      end
    end
  end

  def test_unknown_keys_wrong_item_owner_and_unreviewed_spans_fail_closed
    assert_raises(RuntimeError) do
      M.transform(spec(M::ABRA_KEYS.first), ['default', '1', ''], '아브라의 숨결',
                  source(M::ABRA_KEYS.first))
    end
    key = ['default', '52465', '']
    assert_raises(RuntimeError) do
      M.transform(M::SPECS.last, key, '아브라의 숨결', source(key))
    end
    assert_raises(RuntimeError) do
      M.transform(spec(key), key, '다른 이름', source(key))
    end
    assert_raises(RuntimeError) do
      M.transform(spec(key), key, '아브라의 숨결과 아브라의 숨결',
                  source(key))
    end
  end
end
