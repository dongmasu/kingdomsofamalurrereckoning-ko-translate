#!/usr/bin/env ruby

require_relative 'review-named-residuals-D21771'

module TestReviewNamedResidualsD21771
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    m = ReviewNamedResidualsD21771
    cases = [
      [['default', '41774', ''], 'Master Mystic', '신비의 대가', '신비술의 대가(Master Mystic)'],
      [['default', '5300', ''], 'Master Mystic', '신비학의 대가', '신비술의 대가(Master Mystic)'],
      [['default', '61515', ''], 'Master Mystic', '신비술의 대가', '신비술의 대가(Master Mystic)'],
      [['default', '18829', ''], 'Masterful Construction', '뛰어난 건축', '숙련된 창조(Masterful Construction)']
    ]
    cases.each do |key, english, old_text, expected|
      spec = m::SPECS.find { |entry| entry.fetch(:english) == english }
      source = { 'en_texts_json' => JSON.generate([english]) }
      actual, excluded = m.transform(spec, key, old_text, source)
      assert(!excluded && actual == expected, "unexpected transform at #{key.inspect}")
    end
    excluded_spec = m::SPECS.first
    m::EXCLUDED_TITLE_KEYS.each do |key|
      source = { 'en_texts_json' => JSON.generate(['Master Mystic Rivets']), 'work_text' => '장인급 신비 리벳' }
      actual, excluded = m.transform(excluded_spec, key, source.fetch('work_text'), source)
      assert(excluded && actual == source.fetch('work_text'), "item modifier was not excluded at #{key.inspect}")
    end
    assert(m::SPECS.map { |spec| spec.fetch(:count) }.sum == 9,
           'expected nine full-source matches across both named entries')
    puts 'D-21771 title/ability span tests: PASS'
  end
end

TestReviewNamedResidualsD21771.run if $PROGRAM_NAME == __FILE__
