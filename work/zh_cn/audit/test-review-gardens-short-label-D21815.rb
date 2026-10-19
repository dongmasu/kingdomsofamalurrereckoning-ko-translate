#!/usr/bin/env ruby

require_relative 'review-gardens-short-label-D21815'

module TestReviewGardensShortLabelD21815
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    review = ReviewGardensShortLabelD21815
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
    assert(rows.length == 2 && rows.map { |row| m.key(row) }.uniq.length == 2,
           'both exact Gardens candidate memberships must be reviewed once')
    assert(rows.all? { |row| row['disposition'] == 'not-an-issue' },
           'existing full bilingual labels must not be edited')
    assert(rows.all? do |row|
             row['korean'].match?(/이사의 정원/) &&
               row['evidence'].include?('D-21505')
           end,
           'each judgment must retain the exact established place form and D-21505 scope')
    assert(before_hashes == m.hashes &&
             index_hash == Digest::SHA256.file(m::INDEX).hexdigest &&
             glossary_hash == Digest::SHA256.file(glossary).hexdigest,
           'candidate tests must not mutate active project data')
    puts 'D-21815 Gardens article, prior disposition, and no-mutation tests: PASS'
  end
end

TestReviewGardensShortLabelD21815.run if $PROGRAM_NAME == __FILE__
