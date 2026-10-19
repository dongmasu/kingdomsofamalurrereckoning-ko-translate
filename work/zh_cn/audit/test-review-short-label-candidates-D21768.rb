#!/usr/bin/env ruby

require_relative 'review-short-label-candidates-D21768'

module TestReviewShortLabelCandidatesD21768
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    m = ReviewShortLabelCandidatesD21768
    candidates = m::GROUPS.transform_values do |group|
      {
        'unpaired_label_keys_json' => JSON.generate(group.fetch(:keys).reject { |key| key[1] == '29062' }),
        'paired_evidence_keys_json' => JSON.generate(group.fetch(:keys).select { |key| key[1] == '29062' })
      }
    end
    inventory = {}
    m::GROUPS.each_value do |group|
      group.fetch(:keys).each do |key|
        text = key[1] == '29062' ? '+1 to the first 2 tiers of unlocked Might Abilities.' : key[1] == '1753' ? 'MIGHT' : 'Might'
        inventory[key] = {
          'en_texts_json' => JSON.generate([text]),
          'ja_texts_json' => JSON.generate(['マイト']),
          'zh_text' => '力量',
          'work_text' => key[1] == '29062' ? '+1 효과가 습득한 힘(Might) 능력의 처음 2단계에 적용됩니다.' : '힘'
        }
      end
    end
    reviews = m.build_reviews(inventory, [], candidates)
    assert(reviews.length == 5, 'expected five candidate memberships')
    assert(reviews.map { |row| [row['resource'], row['ID_Linha'], row['Tipo_Variante']] }.uniq.length == 4,
           'overlapping paired evidence must count as one distinct key')
    assert(reviews.all? { |row| row['disposition'] == 'not-an-issue' }, 'all candidates must be excluded from entity scope')
    assert(reviews.count { |row| row['ID_Linha'] == '29062' } == 2, 'shared evidence must appear in both case groups')
    puts 'D-21768 Might overlap/classification tests: PASS'
  end
end

TestReviewShortLabelCandidatesD21768.run if $PROGRAM_NAME == __FILE__
