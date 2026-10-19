#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-headhunter-persons-D21571'

class HeadhunterPersonsD21571Test < Minitest::Test
  R = ReviewHeadhunterPersonsD21571

  def test_complete_names_are_paired_once
    R.specs.each do |spec|
      text = spec.fetch(:korean).sub(/\([^()]*\)\z/, '')
      assert_equal spec.fetch(:korean), R.transform(spec, text)
      assert_equal spec.fetch(:korean), R.transform(spec, spec.fetch(:korean))
    end
  end

  def test_sorcha_title_stays_in_korean_not_in_the_person_name_annotation
    spec = R.specs.find { |entry| entry[:english] == 'Sorcha Donohue' }
    assert_equal '위험한 헤드헌터 소르카 도너휴(Sorcha Donohue)의 물건',
                 R.transform(spec, '위험한 헤드헌터 소르카 도너휴(Headhunter Sorcha Donohue)의 물건')
  end

  def test_names_do_not_become_unrestricted_surname_aliases
    assert R.specs.all? { |spec| spec.fetch(:aliases).split('|').all? { |name| name == 'Sorcha Donahue' } }
    spec = R.specs.find { |entry| entry[:english] == 'Nora Pepper' }
    assert_raises(RuntimeError) { R.transform(spec, '페퍼(Pepper) 쌍둥이') }
  end

  def test_explicit_surname_source_variant_preserves_its_english_spelling
    spec = R.specs.find { |entry| entry[:english] == 'Sorcha Donohue' }
    assert_equal '소르카 도너휴(Sorcha Donahue)가 자네를 찾고 다닌다더군.',
                 R.transform(spec, '소르카 도너휴가 자네를 찾고 다닌다더군.', 'Sorcha Donahue')
    assert_raises(RuntimeError) { R.transform(spec, '소르카 도너휴', 'Sorcha Unknown') }
  end
end
