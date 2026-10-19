#!/usr/bin/env ruby

require_relative 'review-short-label-candidates-D21772'

module TestReviewShortLabelCandidatesD21772
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    m = ReviewShortLabelCandidatesD21772
    candidates = m::GROUPS.transform_values do |group|
      { 'unpaired_label_keys_json' => JSON.generate(group.fetch(:keys)),
        'paired_evidence_keys_json' => JSON.generate([]) }
    end
    inventory = {}
    m::GROUPS.each do |term, group|
      group.fetch(:keys).each do |key|
        english = term == 'Moondown' && key[1] == '42542' ? 'Moondown' : term
        inventory[key] = {
          'en_texts_json' => JSON.generate([english]),
          'ja_texts_json' => JSON.generate(['日本語']),
          'zh_text' => '中文',
          'work_text' => '한국어'
        }
      end
    end
    reviews = m.build_reviews(inventory, [], candidates)
    assert(reviews.length == 30, 'expected 30 candidate memberships')
    assert(reviews.group_by { |row| row['disposition'] }.transform_values(&:length) ==
           { 'uncertain' => 15, 'not-an-issue' => 15 }, 'unexpected dispositions')
    assert(reviews.find { |row| row['english_candidate'] == 'Moondown' && row['ID_Linha'] == '42542' }['disposition'] == 'uncertain',
           'existing Moondown hold must remain uncertain')
    puts 'D-21772 generic/ambiguous candidate tests: PASS'
  end
end

TestReviewShortLabelCandidatesD21772.run if $PROGRAM_NAME == __FILE__
