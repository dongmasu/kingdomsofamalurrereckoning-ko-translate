#!/usr/bin/env ruby

require_relative 'review-chantry-short-label-D21813'

module TestReviewChantryShortLabelD21813
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    review = ReviewChantryShortLabelD21813
    m = review::M
    before_hashes = m.hashes
    protected = [m::INDEX, File.join(__dir__, 'proper-name-glossary.tsv')].to_h do |path|
      [path, Digest::SHA256.file(path).hexdigest]
    end
    inventory = m.refresh_inventory
    index = m.table(m::INDEX).map(&:to_h)
    candidates = m.table(review::INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    rows = review.build_reviews(inventory, index, candidates)
    assert(rows.length == 2 && rows.map { |row| m.key(row) }.uniq.length == 2,
           'both exact The Chantry memberships must be reviewed once')
    assert(rows.map { |row| [m.key(row), row['disposition']] }.to_h ==
             {
               ['default', '7675', ''] => 'excluded',
               ['base', '711', '11'] => 'not-an-issue'
             },
           'generic standalone chapel is excluded; existing bilingual base label is retained')
    generic = rows.find { |row| row['ID_Linha'] == '7675' }
    assert(generic['japanese'].include?('礼拝堂') &&
             generic['chinese'].include?('礼拜堂') &&
             generic['korean'] == '예배당',
           'aligned locales must support the generic chapel classification')
    assert(generic['evidence'].include?('default:20663') &&
             generic['evidence'].include?('default:59429'),
           'decision must cite contextual building uses')
    assert(before_hashes == m.hashes &&
             protected.all? { |path, hash| Digest::SHA256.file(path).hexdigest == hash },
           'candidate proposal must not mutate CSV, index, or glossary')
    puts 'D-21813 Chantry contextual classification and no-mutation tests: PASS'
  end
end

TestReviewChantryShortLabelD21813.run if $PROGRAM_NAME == __FILE__
