#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-four-persons-D21107'

class FourPersonsD21107Test < Minitest::Test
  M = ReviewedNameBatches
  N = FourPersonsD21107

  def test_idempotent_names_titles_and_particles
    N.definitions.each do |d|
      canonical = d['korean_canonical']
      assert_equal canonical, N.transform(canonical, d['entity_key'], 'fixture')
    end
    assert_equal '카터리 제이크(Cartery Jayck)를 처리했다.',
      N.transform('카터리 제익을 처리했다.', 'person:cartery-jayck', '19845')
    title = '총집사 번 엘가(Head Steward Byrn Elgar)와 얘기해야겠다.'
    assert_equal title, N.transform('총집사 번 엘가와 얘기해야겠다.', 'person:byrn-elgar', '9533')
    assert_equal title, N.transform(title, 'person:byrn-elgar', '9533')
    assert_equal '번 엘가(Byrn Elgar)에게 돌아가자. 번(Byrn)은 그곳에 있다.',
      N.transform('번 엘가(Byrn Elgar)에게 돌아가자. 번은 그곳에 있다.', 'person:byrn-elgar', '12286')
    assert_equal '네스타 그위네드(Nesta Gwynedd). 네스타(Nesta)의 남편.',
      N.transform('네스타 귀네드. 네스타의 남편.', 'person:nesta-gwynedd', '19979')
  end

  def test_exact_scope_source_and_active_cells
    inventory = M.refresh_inventory
    defs = M.table(File.join(__dir__, 'proper-name-discovery-definitions-D21107.tsv')).map(&:to_h)
    reviews = M.table(File.join(__dir__, 'proper-name-discovery-D21107.tsv')).map(&:to_h)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    hits = build_occurrences(inventory.values, defs).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    expected = hits.map { |h| [h['entity_key'], *M.key(h)] }.sort
    assert_equal 47, reviews.length
    assert_equal 31, reviews.count { |r| r['old'] != r['new'] }
    assert_equal 47, reviews.map { |r| M.key(r) }.uniq.length
    assert_equal expected, reviews.map { |r| [r['entity_key'], *M.key(r)] }.sort
    assert defs.all? { |d| d['english_aliases'].empty? }
    refute reviews.any? { |r| %w[51539 38080 59714].include?(r['ID_Linha']) }
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    if (defs.map { |d| d['entity_key'] } & glossary.map { |g| g['entity_key'] }).empty?
      ReviewedProperNameDiscovery.validate!(defs, reviews, hits, glossary, index)
      reviews.each { |r| assert_equal r['old'], inventory.fetch(M.key(r))['work_text'] }
    else
      registered = index.select { |r| expected.include?([r['entity_key'], *M.key(r)]) }
      assert_equal expected, registered.map { |r| [r['entity_key'], *M.key(r)] }.sort
      reviews.each do |r|
        assert_equal r['new'], inventory.fetch(M.key(r))['work_text']
        refute_match(/\([^()\r\n]*\(/, r['new'])
        actual = registered.find { |i| i['entity_key'] == r['entity_key'] && M.key(i) == M.key(r) }
        assert_equal r['status'], actual['status']
      end
    end
  end
end
