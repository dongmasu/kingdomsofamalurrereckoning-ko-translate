#!/usr/bin/env ruby

require_relative 'build-proper-name-discovery-D21775'

module TestProperNameDiscoveryD21775
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    m = ProperNameDiscoveryD21775
    assert(m::EXPECTED_IDS.values.map(&:length) == [62, 7, 3],
           'expected 62 region, seven reagent, and three landmark keys')
    assert(m::EXPECTED_IDS.values.all? { |ids| ids == ids.sort_by(&:to_i) },
           'source-coverage expectations must use numeric ID order')
    source = '에라셀(Erathell) 평원, 에라셀(Erathell) 서부 평원'
    expected = '에라셀 평원(Plains of Erathell), 에라셀 평원(Plains of Erathell) 서부'
    assert(m.canonicalize_plains(source) == expected,
           'region and western-region transformations differ')
    assert(m.canonicalize_plains('에라셀 평원 (The Plains of Erathell)') ==
           '에라셀 평원(The Plains of Erathell)',
           'article-bearing region label spacing differs')
    assert(m.canonicalize_plains('에라셀 평원(Plains of Erathell)') ==
           '에라셀 평원(Plains of Erathell)',
           'already-canonical region form must remain unchanged')
    assert(m::SPAN_EDITS.length == 5, 'expected five explicit reagent/landmark edits')
    puts 'D-21775 exact-source coverage and bounded canonicalization tests: PASS'
  end
end

TestProperNameDiscoveryD21775.run if $PROGRAM_NAME == __FILE__
