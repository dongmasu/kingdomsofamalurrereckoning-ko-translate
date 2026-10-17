#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-godstorm-alias-D21424'

class GodstormAliasD21424Test < Minitest::Test
  M = GodstormAliasD21424

  def test_spelling_variants
    %w[신들의\ 폭풍 신의\ 폭풍 고드스톰].each do |text|
      assert_equal M::CANONICAL, M.normalize(text)
    end
  end

  def test_existing_alias_annotation
    assert_equal M::CANONICAL, M.normalize('신들의 폭풍(Godstorm)')
    assert_equal M::CANONICAL, M.normalize(M::CANONICAL)
  end

  def test_other_event_unchanged
    text = '쇠락 전쟁(Withering War)'
    assert_equal text, M.normalize(text)
  end

  def test_line_breaks_and_particles
    text = "신들의 폭풍은\r\n고드스톰이\n신의 폭풍의"
    expected = "#{M::CANONICAL}은\r\n#{M::CANONICAL}이\n#{M::CANONICAL}의"
    assert_equal expected, M.normalize(text)
  end

  def test_return_subject
    text = "#{M::CANONICAL}이 돌아오길 기다리고 있어."
    english = 'The Godstorm awaits my return.'
    assert_equal "#{M::CANONICAL}이 내가 돌아오길 기다리고 있어.",
                 M.restore_return_subject(text, english)
    assert_raises(RuntimeError) { M.restore_return_subject(text, 'I await the Godstorm.') }
    assert_raises(RuntimeError) { M.restore_return_subject('different clause', english) }
  end

  def test_exact_reviewed_source_keys
    assert_equal %w[6347 16113 17816 18527 30725 37830 50060 57678 63879 63892], M::IDS
    reviews = M::M.table(File.join(__dir__, 'proper-name-edits-D21424.tsv'))
    assert_equal M::IDS.sort, reviews.map { |row| row['ID_Linha'] }.sort
    assert reviews.all? { |row| row['resource'] == 'default' && row['Tipo_Variante'].to_s.empty? }
  end
end
