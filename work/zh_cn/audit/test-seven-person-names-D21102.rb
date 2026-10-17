#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-seven-person-names-D21102'

class SevenPersonNamesD21102Test < Minitest::Test
  M = ReviewedNameBatches
  N = SevenPersonNamesD21102

  def test_full_names_are_paired_once
    N::SPECS.each do |slug, english, korean, _aliases, _variants, _note|
      entity = "person:#{slug}"
      expected = "#{korean}(#{english})"
      assert_equal expected, N.transform(korean, entity)
      assert_equal expected, N.transform(expected, entity)
    end
  end

  def test_title_and_short_form_boundaries
    assert_equal '서약방패병 리비아 페난(Pledgeshield Livia Fenan)',
      N.transform('서약방패병 리비아 페넌(Pledgeshield Livia Fenan)', 'person:livia-fenan')
    assert_equal '서약방패병 페난(Pledgeshield Fenan)',
      N.transform('서약방패병 페넌(Pledgeshield Fenan)', 'person:livia-fenan')
    assert_equal '홀든(Holden)의 팀과 라파예트(LaFayette)',
      N.transform('홀든의 팀과 라파예트', 'person:holden-lafayette')
    assert_equal '캡스턴(Capstan)이 보냈다.',
      N.transform('캐프스턴(Capstan)이 보냈다.', 'person:capstan-odvar')
    assert_equal '오드바르 대사', N.transform('오드바르 대사', 'person:capstan-odvar')
    assert_equal '피오나 케이드', N.transform('피오나 케이드', 'person:fiona-terane')
    assert_equal '스베리 브론드', N.transform('스베리 브론드', 'person:elwa-brond')
  end

  def test_manifest_coverage_sources_and_registration
    defs = M.table(File.join(__dir__, 'proper-name-discovery-definitions-D21102.tsv')).map(&:to_h)
    reviews = M.table(File.join(__dir__, 'proper-name-discovery-D21102.tsv')).map(&:to_h)
    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    hits = build_occurrences(inventory.values, defs).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    assert_equal 92, reviews.length
    assert_equal 54, reviews.count { |r| r['old'] != r['new'] }
    assert_equal reviews.length, reviews.map { |r| M.key(r) }.uniq.length
    assert_equal 7, defs.length
    expected = hits.map { |r| [r['entity_key'], *M.key(r)] }.sort
    assert_equal expected, reviews.map { |r| [r['entity_key'], *M.key(r)] }.sort
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    assert_nil defs.find { |d| d['english_aliases'].split('|').any? { |a| %w[Fiona Odvar Brond Elwa].include?(a) } }
    if (defs.map { |d| d['entity_key'] } & glossary.map { |g| g['entity_key'] }).empty?
      ReviewedProperNameDiscovery.validate!(defs, reviews, hits, glossary, index)
      reviews.each { |r| assert_equal r['old'], inventory.fetch(M.key(r))['work_text'] }
    else
      registered = index.select { |r| expected.include?([r['entity_key'], *M.key(r)]) }
      assert_equal expected, registered.map { |r| [r['entity_key'], *M.key(r)] }.sort
      reviews.each do |r|
        assert_equal r['new'], inventory.fetch(M.key(r))['work_text']
        entry = registered.find { |i| i['entity_key'] == r['entity_key'] && M.key(i) == M.key(r) }
        assert_equal r['status'], entry['status']
      end
    end
  end
end
