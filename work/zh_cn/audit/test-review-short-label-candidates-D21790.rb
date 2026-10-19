#!/usr/bin/env ruby

require_relative 'review-short-label-candidates-D21790'

module TestReviewShortLabelCandidatesD21790
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    module_under_test = ReviewShortLabelCandidatesD21790
    rows = []
    inventory = {}
    module_under_test::GROUPS.each do |term, decisions|
      candidate_keys = []
      paired_keys = []
      decisions.each do |key_text, (status, evidence)|
        key = key_text.split(':', -1)
        text = case key_text
               when 'default:3621:'
                 'Here you can read the in-game manual for an overview of all major systems in Reckoning.'
               when 'default:39728:'
                 'This unusual concoction grants you enough power to enter Reckoning.'
               when 'default:63328:'
                 'Reckoning'
               when 'default:1029:'
                 'We are the Ring.'
               else
                 'Ring'
               end
        inventory[key] = {
          'en_texts_json' => JSON.generate([text]),
          'ja_texts_json' => JSON.generate(['localized label']),
          'zh_text' => 'localized label',
          'work_text' => '한국어'
        }
        (key_text == 'default:39728:' || key_text == 'default:1029:' ?
          paired_keys : candidate_keys) << key
      end
      rows << {
        'english_candidate' => term,
        'unpaired_label_keys_json' => JSON.generate(candidate_keys),
        'paired_evidence_keys_json' => JSON.generate(paired_keys)
      }
    end
    candidates = rows.to_h { |row| [row.fetch('english_candidate'), row] }
    reviews = module_under_test.build_reviews(inventory, [], candidates)
    assert(reviews.length == 7, 'expected seven candidate memberships')
    assert(reviews.map { |row| [row['resource'], row['ID_Linha'], row['Tipo_Variante']] }.uniq.length == 7,
           'candidate keys must be distinct in this scope')
    assert(reviews.count { |row| row['disposition'] == 'uncertain' } == 2,
           'both unresolved Reckoning labels must remain uncertain')
    assert(reviews.count { |row| row['disposition'] == 'not-an-issue' } == 5,
           'explicit gameplay and Ring classifications must be preserved')
    puts 'D-21790 short-label classification tests: PASS'
  end
end

TestReviewShortLabelCandidatesD21790.run if $PROGRAM_NAME == __FILE__
