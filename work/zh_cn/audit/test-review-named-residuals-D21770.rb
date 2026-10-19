#!/usr/bin/env ruby

require_relative 'review-named-residuals-D21770'

module TestReviewNamedResidualsD21770
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    m = ReviewNamedResidualsD21770
    tests = {
      ['default', '10036', ''] => ['Memory Walk', '두 추억의 길을 걸었다.', '두 기억의 길(Memory Walk)을 걸었다.'],
      ['default', '22438', ''] => ['Mountain Barghest', '산 바게스트(Barghest)', '산악 바게스트(Mountain Barghest)'],
      ['default', '46413', ''] => ['Mountain Barghests', '산악 바게스트(Barghest)', '산악 바게스트(Mountain Barghest)'],
      ['default', '60745', ''] => ['Mel Senshir Jail', '멜 센시르(Mel Senshir) 감옥(Mel Senshir Jail)', '멜 센시르 감옥(Mel Senshir Jail)']
    }
    tests.each do |key, (english, old_text, expected)|
      source = { 'en_texts_json' => JSON.generate([english]) }
      spec = m::SPECS.find do |entry|
        entry.fetch(:english) == english || entry.fetch(:aliases, '').split('|').include?(english)
      end
      result, excluded = m.transform(spec, key, old_text, source)
      assert(!excluded, "unexpected exclusion at #{key.inspect}")
      assert(result == expected, "unexpected transformed Korean at #{key.inspect}")
    end
    assert(m::EDITS.length == 14, 'expected 14 exact source-cell transformations')
    assert(m::SPECS.map { |spec| spec.fetch(:count) }.sum == 16,
           'expected 16 unique English source rows across all three entities')
    puts 'D-21770 entity/span tests: PASS'
  end
end

TestReviewNamedResidualsD21770.run if $PROGRAM_NAME == __FILE__
