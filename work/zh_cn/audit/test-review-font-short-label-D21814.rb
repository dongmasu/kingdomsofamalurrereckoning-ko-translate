#!/usr/bin/env ruby

require_relative 'review-font-short-label-D21814'

module TestReviewFontShortLabelD21814
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    review = ReviewFontShortLabelD21814
    m = review::M
    before_hashes = m.hashes
    index_hash = Digest::SHA256.file(m::INDEX).hexdigest
    glossary = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_hash = Digest::SHA256.file(glossary).hexdigest
    inventory = m.refresh_inventory
    index = m.table(m::INDEX).map(&:to_h)
    candidates = m.table(review::INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    rows = review.build_reviews(inventory, index, candidates)
    assert(rows.length == 11 && rows.map { |row| m.key(row) }.uniq.length == 11,
           'all exact The Font candidate memberships must be reviewed once')
    assert(rows.group_by { |row| row['disposition'] }.transform_values(&:length) ==
             { 'accepted' => 7, 'not-an-issue' => 4 },
           'only the four already complete labels should be retained')
    assert(review::EDITS.length == 7 &&
             review::EDITS.values.all? { |old, new| old != new },
           'seven explicit non-no-op Korean cell edits are expected')
    assert(review::EDITS[['default', '9272', '']].last.include?('샘(The Font)') &&
             review::EDITS[['default', '46948', '']].last.include?('샘(The Font)'),
           'source-specific title spelling and duplicate Font wording must be corrected')
    assert(before_hashes == m.hashes &&
             index_hash == Digest::SHA256.file(m::INDEX).hexdigest &&
             glossary_hash == Digest::SHA256.file(glossary).hexdigest,
           'proposal tests must not mutate active project data')
    puts 'D-21814 Font candidate scope, evidence, and no-mutation tests: PASS'
  end
end

TestReviewFontShortLabelD21814.run if $PROGRAM_NAME == __FILE__
