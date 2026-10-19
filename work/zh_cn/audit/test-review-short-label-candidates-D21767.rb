#!/usr/bin/env ruby

require_relative 'review-short-label-candidates-D21767'

module TestReviewShortLabelCandidatesD21767
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    module_ref = ReviewShortLabelCandidatesD21767
    assert(module_ref::NOTES.length == 21, 'expected 21 skill edits')
    assert(module_ref::EXCLUDED_KEYS.length == 4, 'expected four generic exclusions')
    assert(module_ref::SPEC.fetch(:count) == 25, 'expected 25 English source rows')

    examples = {
      ['base', '482', '11'] => ['기술서(상업)', '상술(Mercantile) 기술서'],
      ['default', '13010', ''] => ['상업 기술', '상술(Mercantile)'],
      ['default', '45232', ''] => ['상업', '상술(Mercantile)'],
      ['default', '54765', ''] => ['상술 기술(Mercantile)', '상술(Mercantile) 기술']
    }
    examples.each do |key, (old_span, new_span)|
      source = {
        'en_texts_json' => JSON.generate(['Mercantile']),
        'work_text' => old_span
      }
      transformed, excluded = module_ref.transform(module_ref::SPEC, key, old_span, source)
      assert(!excluded, "unexpected exclusion for #{key.inspect}")
      assert(transformed == new_span, "unexpected transformation for #{key.inspect}")
    end

    module_ref::EXCLUDED_KEYS.each do |key|
      source = {
        'en_texts_json' => JSON.generate(['mercantile dealings']),
        'work_text' => 'unchanged'
      }
      text, excluded = module_ref.transform(module_ref::SPEC, key, 'unchanged', source)
      assert(excluded && text == 'unchanged', "generic use changed at #{key.inspect}")
    end

    puts 'D-21767 Mercantile scope/transform tests: PASS'
  end
end

TestReviewShortLabelCandidatesD21767.run if $PROGRAM_NAME == __FILE__
