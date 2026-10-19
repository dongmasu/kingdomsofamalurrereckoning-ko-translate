#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-lyriat-dunehead-minn-D21694'

class LyriatDuneheadMinnD21694Test < Minitest::Test
  M = LyriatDuneheadMinnD21694

  def test_registered_source_coverage_is_bounded_and_complete
    assert_equal 11, M::DEFINITIONS.find { |row| row[:key] == 'place:dunehead' }[:count]
    assert_equal 2, M::DEFINITIONS.find { |row| row[:key] == 'people:lyriat' }[:count]
    assert_equal 4, M::DEFINITIONS.find { |row| row[:key] == 'person:minn-the-grinner' }[:count]
    assert_equal 17, M::TRANSFORMS.length
  end

  def test_only_reviewed_name_spans_are_changed
    assert_equal '듄헤드 광산(Dunehead Mine)',
      M.transform(M::DEFINITIONS[0], ['default', '36419', ''],
        '듄헤드 광산', source('Dunehead Mine', 'デューンヘッド鉱山', '沙丘头矿场')).first
    assert_equal '웃음꾼 민(Minn the Grinner)',
      M.transform(M::DEFINITIONS[2], ['default', '43540', ''],
        '웃는 민', source('Minn the Grinner', 'にやにや笑いのミン', '微笑者米恩')).first
  end

  def test_lyriat_accepts_the_two_aligned_source_forms
    assert M.corroborated?('people:lyriat',
      source('Welcome', 'ようこそ', '莉里亚信徒'))
    assert M.corroborated?('people:lyriat',
      source('Lyriat', 'Lyriat', 'Lyriat'))
  end

  def test_dunehead_accepts_the_chinese_source_variant
    assert M.corroborated?('place:dunehead',
      source('Dunehead Mine', 'デューンヘッド鉱山', '沙丘顶矿场'))
  end

  def test_corthis_and_llosgiad_remain_unregistered_holds
    assert_equal %w[uncertain uncertain],
      M.dispositions.values.map { |row| row.fetch(:status) }
    assert_equal 8, M.dispositions.values.sum { |row| row.fetch(:keys).length }
    assert_includes M.dispositions.fetch('Llosgiad').fetch(:evidence), 'Event versus place'
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
