#!/usr/bin/env ruby

require_relative 'build-proper-name-discovery-D21774'

module TestProperNameDiscoveryD21774
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    m = ProperNameDiscoveryD21774
    assert(m::EXPECTED_IDS.length == 48, 'expected 48 exact Oathblade keys')
    assert(m::EDITS.length == 31, 'expected 31 explicit canonicalization spans')
    m::EDITS.each do |id, (old, replacement)|
      result = m.replace_once("prefix #{old} suffix", old, replacement, ['default', id, ''])
      assert(result == "prefix #{replacement} suffix", "incorrect span transformation at #{id}")
    end
    assert(m::DEFINITION_PATH.end_with?('proper-name-discovery-definitions-D21774.tsv'),
           'unexpected definition output path')
    puts 'D-21774 exact-source coverage and reviewed span transformations: PASS'
  end
end

TestProperNameDiscoveryD21774.run if $PROGRAM_NAME == __FILE__
