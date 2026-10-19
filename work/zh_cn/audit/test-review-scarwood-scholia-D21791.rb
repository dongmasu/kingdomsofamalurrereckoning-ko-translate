#!/usr/bin/env ruby

require_relative 'review-scarwood-scholia-D21791'

module TestReviewScarwoodScholiaD21791
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    m = ReviewedNameBatches
    inventory = m.table(m::INVENTORY).map(&:to_h).to_h do |row|
      [m.key(row), row]
    end
    generated = build_occurrences(inventory.values, ReviewScarwoodScholiaD21791::SPECS.map do |spec|
      {
        'entity_key' => spec.fetch(:key),
        'english_canonical' => spec.fetch(:english),
        'category' => spec.fetch(:category),
        'korean_canonical' => spec.fetch(:korean),
        'english_aliases' => spec.fetch(:aliases, ''),
        'status' => 'confirmed'
      }
    end)
    expected = {
      'resource:scarwood-tree' => 2,
      'place:scholia-arcana-grounds' => 6
    }
    actual = generated.group_by { |row| row[0] }.transform_values(&:length)
    assert(actual == expected, "source coverage mismatch: #{actual.inspect}")

    rows = generated.map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    reviews = m.table(File.join(__dir__, 'proper-name-edits-D21791.tsv')).map(&:to_h)
    reviews_by_key = reviews.to_h { |row| [m.key(row), row] }
    changed = []
    excluded = []
    rows.each do |row|
      key = m.key(row)
      review = reviews_by_key.fetch(key)
      spec = ReviewScarwoodScholiaD21791::SPECS.find do |candidate|
        candidate.fetch(:key) == row.fetch('entity_key')
      end
      source = inventory.fetch(key)
      assert(source.fetch('work_text') == review.fetch('new'),
             "active Korean cell differs from the verified manifest at #{key.inspect}")
      old = review.fetch('old')
      source = source.merge('work_text' => old)
      new_text, is_excluded = ReviewScarwoodScholiaD21791.transform(
        spec, key, old, source
      )
      assert(new_text == review.fetch('new'),
             "transformation differs from the reviewed manifest at #{key.inspect}")
      if is_excluded
        excluded << [row.fetch('entity_key'), *key]
        assert(new_text == old, 'excluded scene label must remain unchanged')
      elsif new_text != old
        changed << [row.fetch('entity_key'), *key]
      end
    end
    assert(changed.length == 6, "expected six targeted Korean edits, got #{changed.length}")
    assert(excluded == [['place:scholia-arcana-grounds', 'default', '47028', '']],
           "expected only the Dreamworld scene exclusion, got #{excluded.inspect}")
    puts 'D-21791 full-source coverage and targeted-span tests: PASS'
  end
end

TestReviewScarwoodScholiaD21791.run if $PROGRAM_NAME == __FILE__
