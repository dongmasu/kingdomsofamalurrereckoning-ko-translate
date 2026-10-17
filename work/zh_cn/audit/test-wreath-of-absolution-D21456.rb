#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-wreath-of-absolution-D21456'

class WreathOfAbsolutionD21456Test < Minitest::Test
  M = WreathOfAbsolutionD21456
  HEADERS = %w[entity_key english_canonical korean_canonical category english_aliases
               korean_variants evidence_ids status notes].freeze

  def test_scoped_replacements_are_exact_and_idempotent
    M::ROWS.each do |key, (_english_count, spans, whole_cell)|
      if whole_cell
        old, new, = spans.fetch(0)
        assert_equal new, M.normalize(old, key)
        assert_equal new, M.normalize(new, key)
      else
        source = spans.flat_map do |old_span, _new_span, count|
          Array.new(count, old_span)
        end.join(' / ')
        expected = spans.flat_map do |_old_span, new_span, count|
          Array.new(count, new_span)
        end.join(' / ')
        assert_equal expected, M.normalize(source, key)
        assert_equal expected, M.normalize(expected, key)
      end
    end
  end

  def test_short_name_annotation_is_guarded_to_default_1111
    key = ['default', '1111', '']
    source = '면죄의 화관(Wreath of Absolution)에 쓸 깃털. 하지만 화관을 완성하려면 더 필요하다.'
    expected = '면죄의 화관(Wreath of Absolution)에 쓸 깃털. 하지만 화관(Wreath)을 완성하려면 더 필요하다.'
    assert_equal expected, M.normalize(source, key)
    assert_equal expected, M.normalize(expected, key)
    assert_equal source.sub('화관을 완성하려면', '화관(Wreath)을 완성하려면'),
                 M.normalize(source, key)
    assert_raises(RuntimeError) do
      M.normalize('화관을 완성하려면; 화관을 완성하려면', key)
    end
  end

  def test_repeated_full_mentions_change_without_touching_bare_references
    {
      ['default', '18921', ''] => ['면죄의 화관', 2],
      ['default', '25146', ''] => ['사면의 화관', 2]
    }.each do |key, (old, count)|
      source = "#{old}, #{old}; 두 번째 문단의 화관은 그대로."
      expected = "#{M::CANONICAL}, #{M::CANONICAL}; 두 번째 문단의 화관은 그대로."
      assert_equal count, source.scan(old).length
      assert_equal expected, M.normalize(source, key)
      assert_includes M.normalize(source, key), '문단의 화관은 그대로'
    end
  end

  def test_25540_preserves_the_english_article_in_the_whole_title
    key = ['default', '25540', '']
    expected = '면죄의 화관(The Wreath of Absolution)'
    assert_equal expected, M.normalize('사면의 화관', key)
    assert_equal expected, M.normalize(expected, key)
    refute_match(/\([^)]*\(/, expected)
  end

  def test_tokens_and_line_breaks_are_unchanged
    key = ['default', '18921', '']
    # The two full references in this source require two exact old spans.
    source = "$X$\r\n면죄의 화관, 면죄의 화관; generic 화관\r\n{*1보호}"
    expected = "$X$\r\n#{M::CANONICAL}, #{M::CANONICAL}; generic 화관\r\n{*1보호}"
    actual = M.normalize(source, key)
    assert_equal expected, actual
    assert_equal source.scan(/\r\n|\r|\n/), actual.scan(/\r\n|\r|\n/)
    assert_equal source.scan(ReviewedProperNameDiscovery::OPAQUE),
                 actual.scan(ReviewedProperNameDiscovery::OPAQUE)
  end

  def test_source_scope_definitions_and_dispositions
    definitions = M.definitions_for(HEADERS)
    expected = M::SOURCE_KEYS.map { |key| [M::ENTITY, *key] }.sort
    assert_equal 20, M::ROWS.length
    transformation_count = M::ROWS.values.sum do |_n, spans, _whole|
      spans.sum { |_old, _new, count| count }
    end
    assert_equal 23, transformation_count
    assert_equal 22, transformation_count - 1 # Excludes default:1111's guarded short-name mention.
    assert_equal ['unique item'], definitions.map { |row| row.fetch('category') }
    assert_equal '', definitions.first.fetch('english_aliases')
    assert_equal M::CANONICAL, definitions.first.fetch('korean_canonical')
    refute_includes definitions.first.fetch('korean_variants'), '화관(Wreath)'
    refute_includes definitions.first.fetch('korean_variants'), '화관을 완성하려면'
    assert_includes definitions.first.fetch('notes'), 'D-18001'
    assert_includes definitions.first.fetch('notes'), 'do not revise prior decisions or totals'
    assert_equal expected.length, expected.uniq.length
    refute_includes M::SOURCE_KEYS, ['default', '7265', '']
    refute_includes M::SOURCE_KEYS, ['default', '18964', '']
    assert_raises(RuntimeError) { M.normalize('화관을 완성하려면', ['default', '7265', '']) }
    assert_raises(RuntimeError) { M.assert_scope!([]) }
  end

  def test_opaque_short_title_and_count_drift_fail_closed
    assert_raises(RuntimeError) do
      M.normalize('{*1면죄의 화관} 화관을 완성하려면', ['default', '1111', ''])
    end
    assert_raises(RuntimeError) do
      M.normalize('면죄의 화관', ['default', '18921', ''])
    end
    assert_raises(RuntimeError) do
      M.normalize('다른 제목', ['default', '25540', ''])
    end
  end
end
