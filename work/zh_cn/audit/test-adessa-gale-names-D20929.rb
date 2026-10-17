#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-adessa-gale-names-D20929'

class AdessaGaleNamesD20929Test < Minitest::Test
  M = AdessaGaleNamesD20929
  BASILICA = '바실리카 그노스트라(Basilica Gnostra)'
  DOMUS = '도무스 폴리티카(Domus Politica)'
  GALE = '게일 크로싱(Gale Crossing)'

  def test_basilica_variants_and_particles
    assert_equal "#{BASILICA}가 검증", M.transform('노스트라 대성당(Basilica Gnostra)이 검증', 'place:basilica-gnostra', BASILICA)
    assert_equal "#{BASILICA}로 보낸다.", M.transform('노스트라 대성당(Basilica Gnostra)으로 보낸다.', 'place:basilica-gnostra', BASILICA)
    assert_equal BASILICA, M.transform('노스트라(Nostra) 대성당', 'place:basilica-gnostra', BASILICA)
  end

  def test_domus_variants_and_repeated_mentions
    old = "도무스 폴리티카(Domus Politica)로\r\n도무스 폴리티카"
    assert_equal "#{DOMUS}로\r\n#{DOMUS}", M.transform(old, 'place:domus-politica', DOMUS)
    assert_equal "#{DOMUS}는 정책", M.transform('정치회관은 정책', 'place:domus-politica', DOMUS)
  end

  def test_gale_consonant_particles
    assert_equal "#{GALE}은 안전해.", M.transform('게일 교차로는 안전해.', 'place:gale-crossing', GALE)
    assert_equal "#{GALE}으로 와", M.transform('게일 교차로로 와', 'place:gale-crossing', GALE)
  end

  def test_chapter_heading_and_surrounding_names_are_preserved
    assert_equal "제7장: #{BASILICA}", M.transform('제7장: 바실리카 노스트라', 'place:basilica-gnostra', BASILICA)
    assert_equal '그노스트라와 다른 대성당', M.transform('그노스트라와 다른 대성당', 'place:basilica-gnostra', BASILICA)
  end

  def test_canonical_idempotence_and_copula
    M::SPECS.each do |entity, _english, canonical, *_rest|
      text = "#{canonical}이라는 명칭"
      assert_equal text, M.transform(text, entity, canonical)
    end
  end
end
