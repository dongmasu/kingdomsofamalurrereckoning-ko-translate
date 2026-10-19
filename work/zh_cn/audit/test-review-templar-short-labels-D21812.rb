#!/usr/bin/env ruby

require_relative 'review-templar-short-labels-D21812'

module TestReviewTemplarShortLabelsD21812
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    review = ReviewTemplarShortLabelsD21812
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
    assert(rows.length == 20, 'expected 20 distinct short-label memberships')
    assert(rows.map { |row| m.key(row) }.uniq.length == 19,
           'one English sentence contains both separately reviewed titles')
    assert(rows.group_by { |row| row.fetch('english_candidate') }
             .transform_values(&:length) ==
             { 'Templar Jorielle' => 8,
               'Templar Montainel' => 3,
               'Templar Octienne' => 9 },
           'all candidate keys must be reviewed once per candidate phrase')
    assert(rows.all? { |row| row.fetch('disposition') == 'not-an-issue' },
           'all three personal-name/title labels are already source-faithful')
    assert(rows.any? { |row| row.fetch('ID_Linha') == '36814' &&
                             row.fetch('korean').include?('조리엘(Jorielle)') },
           'the separately paired Jorielle personal name must be retained')
    assert(rows.any? { |row| row.fetch('ID_Linha') == '14087' &&
                             row.fetch('korean').include?('몬테이넬(Montainel)') },
           'D-21811 Montainel normalization must be recognized')
    assert(rows.any? { |row| row.fetch('ID_Linha') == '49191' &&
                             row.fetch('korean').include?('옥티엔(Octienne)') },
           'the canonical Octienne personal name must be retained')
    assert(before_hashes == m.hashes &&
             protected.all? { |path, hash| Digest::SHA256.file(path).hexdigest == hash },
           'candidate proposal must not mutate CSV, index, or glossary')
    puts 'D-21812 whole-label memberships, prior person dispositions, and no-mutation tests: PASS'
  end
end

TestReviewTemplarShortLabelsD21812.run if $PROGRAM_NAME == __FILE__
