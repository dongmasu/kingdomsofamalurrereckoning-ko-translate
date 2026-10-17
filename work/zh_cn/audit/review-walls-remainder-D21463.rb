#!/usr/bin/env ruby

require_relative 'review-walls-D21460'

module WallsRemainderD21463
  extend self

  M = ReviewedNameBatches
  D = 21_463
  ENTITY = WallsD21460::ENTITY
  SOURCE_REVIEWS = WallsD21460::REVIEWS
  PENDING_IDS = WallsD21460::PENDING_IDS

  def source_remainder(reviews)
    raise 'D-21460 source proposal scope differs' unless
      reviews.map { |row| M.key(row) }.sort ==
        WallsD21460::EXPECTED_IDS.map { |id| ['default', id, ''] }.sort
    expected_keys = PENDING_IDS.map { |id| ['default', id, ''] }.sort
    selected = reviews.select { |row| row.fetch('entity_key') == ENTITY && expected_keys.include?(M.key(row)) }
    raise 'D-21463 proposal keys differ' unless selected.map { |row| M.key(row) }.sort == expected_keys
    selected.each do |row|
      raise 'deferred Walls classification changed' unless
        row.fetch('status') == 'excluded' && row.fetch('old') == row.fetch('new')
    end
    selected
  end

  def pending_reviews(index_rows, reviews)
    wall_rows = index_rows.select { |row| row.fetch('entity_key') == ENTITY }
    raise 'registered Walls scope differs' unless
      wall_rows.map { |row| M.key(row) }.sort ==
        WallsD21460::EXPECTED_IDS.map { |id| ['default', id, ''] }.sort
    pending = wall_rows.select { |row| row.fetch('status') == 'needs-context' }
    raise 'pending Walls IDs differ' unless pending.map { |row| row.fetch('ID_Linha') }.sort == PENDING_IDS.sort

    selected = source_remainder(reviews)
    selected
  end

  def apply
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    index_before = M.table(M::INDEX).map(&:to_h)
    proposal = M.table(SOURCE_REVIEWS).map(&:to_h)
    selected = pending_reviews(index_before, proposal)
    target_keys = selected.map { |row| [ENTITY, *M.key(row)] }.to_set
    prior = WallsD21460.prior_records(index_before).reject { |key, _| target_keys.include?(key) }

    # M.run filters the source manifest against the live needs-context keys.
    M.run(SOURCE_REVIEWS, D, 1)

    index_after = M.table(M::INDEX).map(&:to_h)
    final = WallsD21460.prior_records(index_after)
    prior.each do |key, record|
      raise "prior occurrence changed #{key.inspect}" unless final[key] == record
    end
    selected.each do |review|
      key = [ENTITY, *M.key(review)]
      row = final.fetch(key)
      current_row = index_after.find do |candidate|
        candidate.fetch('entity_key') == ENTITY && M.key(candidate) == M.key(review)
      end
      raise "Walls remainder disposition differs #{key.inspect}" unless
        row.fetch('status') == 'excluded' &&
        row.fetch('evidence').start_with?("D-#{D}: ") &&
        current_row && current_row.fetch('korean_current') == review.fetch('new')
    end
    raise 'unreviewed Walls keys remain' if
      index_after.any? { |row| row['entity_key'] == ENTITY && row['status'] == 'needs-context' }
    puts "D-#{D}: closed #{selected.length} deferred Walls exclusions; no CSV edits."
  end

  def verify
    manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    raise 'D-21463 edit manifest missing' unless File.file?(manifest)
    reviews = M.table(manifest).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    selected = source_remainder(M.table(SOURCE_REVIEWS).map(&:to_h))
    raise 'D-21463 manifest scope differs' unless
      reviews.map { |row| M.key(row) }.sort == selected.map { |row| M.key(row) }.sort
    reviews.each do |review|
      row = index.find do |candidate|
        candidate.fetch('entity_key') == ENTITY && M.key(candidate) == M.key(review)
      end
      raise "D-21463 disposition differs #{M.key(review).inspect}" unless
        row && row.fetch('status') == 'excluded' &&
        row.fetch('evidence').start_with?("D-#{D}: ") &&
        row.fetch('korean_current') == review.fetch('new') &&
        review.fetch('old') == review.fetch('new')
    end
    raise 'unreviewed Walls keys remain' if
      index.any? { |row| row['entity_key'] == ENTITY && row['status'] == 'needs-context' }
    puts "D-#{D}: verified all three deferred Walls exclusions; no CSV edits."
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['apply'] then WallsRemainderD21463.apply
  when ['verify'] then WallsRemainderD21463.verify
  else abort 'usage: review-walls-remainder-D21463.rb [apply|verify]'
  end
end
