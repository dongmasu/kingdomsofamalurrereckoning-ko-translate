#!/usr/bin/env ruby

require_relative 'review-short-label-candidates-D21769'

module TestReviewShortLabelCandidatesD21769
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    m = ReviewShortLabelCandidatesD21769
    candidates = m::GROUPS.transform_values do |group|
      {
        'unpaired_label_keys_json' => JSON.generate(group.fetch(:keys)),
        'paired_evidence_keys_json' => JSON.generate([])
      }
    end
    inventory = {}
    m::GROUPS.each do |term, group|
      group.fetch(:keys).each do |key|
        english = term == 'Master' && key[1] == '60551' ? "I am a student of the Master's." : term
        inventory[key] = {
          'en_texts_json' => JSON.generate([english]),
          'ja_texts_json' => JSON.generate(['日本語']),
          'zh_text' => '中文',
          'work_text' => '한국어'
        }
      end
    end
    reviews = m.build_reviews(inventory, [], candidates)
    assert(reviews.length == 25, 'expected 25 candidate memberships')
    assert(reviews.map { |row| [row['resource'], row['ID_Linha'], row['Tipo_Variante']] }.uniq.length == 25,
           'expected 25 distinct source keys')
    assert(reviews.all? { |row| row['disposition'] == 'not-an-issue' },
           'all bounded generic/duplicate candidates must be excluded from new entity scope')
    assert(reviews.count { |row| row['english_candidate'] == 'Mayor Eswin' } == 16,
           'existing-person title coverage must be complete')
    puts 'D-21769 generic/existing-person candidate tests: PASS'
  end
end

TestReviewShortLabelCandidatesD21769.run if $PROGRAM_NAME == __FILE__
