#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-lords-of-valor-D21423'

class LordsOfValorD21423Test < Minitest::Test
  M = LordsOfValorD21423

  def test_spelling_and_plural_forms
    ['용맹의 군주들', '용맹의 군주단', '발러의 군주들',
     '용맹의 군주(Lords of Valor)'].each do |text|
      assert_equal M::CANONICAL, M.normalize(text)
    end
  end

  def test_existing_annotation_is_idempotent
    assert_equal M::CANONICAL, M.normalize(M::CANONICAL)
  end

  def test_repeated_mentions_and_particles
    assert_equal "#{M::CANONICAL}에게, #{M::CANONICAL}은",
                 M.normalize('용맹의 군주들에게, 용맹의 군주들은')
  end

  def test_unrelated_names_unchanged
    text = '발러의 집(House of Valor), 크로우즈(The Crows), 챔피언'
    assert_equal text, M.normalize(text)
  end

  def test_singular_variant_particle_becomes_plural_particle
    assert_equal "#{M::CANONICAL}은 아니야.",
                 M.normalize('용맹의 군주(Lords of Valor)는 아니야.')
  end
end
