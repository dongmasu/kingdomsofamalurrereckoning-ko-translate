#!/usr/bin/env ruby

require 'csv'
require 'minitest/autorun'
require_relative 'continue-proper-name-reviewed-batches'

class UniversalistD21835Test < Minitest::Test
  AUDIT = __dir__

  def test_review_covers_only_the_six_affixes_and_two_default_rows
    rows = ReviewedNameBatches.table(
      File.join(AUDIT, 'proper-name-discovery-D21835.tsv')
    )
    keys = rows.map { |row| ReviewedNameBatches.key(row) }

    assert_equal(
      %w[11 12 14 21 22 24].map { |variant| ['affix', '396', variant] } +
        [['default', '3426', ''], ['default', '57747', '']],
      keys
    )
    assert_equal 8, keys.uniq.length
    assert rows.all? { |row| row['entity_key'] == 'title:universalist' }
    assert rows.all? { |row| row['status'] == 'accepted' }
  end

  def test_active_csv_uses_the_approved_bilingual_form
    expected = {
      ['affix', '396', '11'] => '보편주의자(Universalist)의',
      ['affix', '396', '12'] => '보편주의자(Universalist)의',
      ['affix', '396', '14'] => '보편주의자(Universalist)의',
      ['affix', '396', '21'] => '보편주의자(Universalist)의',
      ['affix', '396', '22'] => '보편주의자(Universalist)의',
      ['affix', '396', '24'] => '보편주의자(Universalist)의',
      ['default', '3426', ''] => '보편주의자(Universalist)는 모든 전투 방식에 정통하고 온갖 무기를 능숙하게 다룹니다. 재주와 힘, 마법(Sorcery) 모두에서 뛰어난 드문 전설적 존재입니다. 각 분야에서 당신과 맞먹는 이는 드물지만, 모든 분야를 통틀어 견줄 자는 없습니다.',
      ['default', '57747', ''] => '보편주의자(Universalist)'
    }
    actual = {}

    %w[affix default].each do |resource|
      path = File.join(
        ReviewedNameBatches::ROOT, 'work/zh_cn',
        "locatexts_zh_cn.koalocatext_#{resource}.csv"
      )
      bytes = File.binread(path).sub(/\A\xEF\xBB\xBF/n, '').force_encoding('UTF-8')
      CSV.parse(bytes, headers: true, col_sep: ';') do |row|
        key = [resource, row['ID_Linha'], row['Tipo_Variante'].to_s]
        actual[key] = row['Texto'] if expected.key?(key)
      end
    end

    assert_equal expected, actual
  end
end
