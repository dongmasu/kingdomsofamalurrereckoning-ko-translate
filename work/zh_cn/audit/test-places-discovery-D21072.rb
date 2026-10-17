#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-places-discovery-D21072'

class PlacesDiscoveryD21072Test < Minitest::Test
  M = PlacesDiscoveryD21072

  def test_scope_definitions_and_explicit_row_counts
    assert_equal(
      %w[
        place:castle-gastyr place:skoria-mine
        place:hall-of-the-firstsworn place:gallows-tree
      ],
      M.definitions.map { |row| row.fetch('entity_key') }
    )
    assert_equal(
      ['Castle Gastyr', 'Skoria Mine', 'Hall of the Firstsworn', 'Gallows Tree'],
      M.definitions.map { |row| row.fetch('english_canonical') }
    )
    assert_equal [24, 28, 34, 34], M::REVIEWED_KEYS.values.map(&:length)
    assert_equal 120, M.key_set.length
    assert_equal 3, (M.key_set.length.to_f / 50).ceil
  end

  def test_castle_name_uses_registered_gastyr_spelling_and_preserves_particles
    result, count = M.normalize_name(
      'place:castle-gastyr',
      '가스티르(Gastyr) 성은 개스티어 성(Castle Gastyr) 안에 있다.'
    )
    assert_equal(
      '가스티르 성(Castle Gastyr)은 가스티르 성(Castle Gastyr) 안에 있다.',
      result
    )
    assert_equal 2, count
    assert_equal ['가스티르 성(Castle Gastyr)', 1],
                 M.normalize_name('place:castle-gastyr', '개스티어 성')
    assert_equal ['가스티르 성(Castle Gastyr)', 1],
                 M.normalize_name('place:castle-gastyr', '가스티르 성(Castle Gastyr)')
    assert_equal(
      ['가스티르(Castle Gastyr) 성문 근처에서 경비를 선다.', 1],
      M.normalize_name(
        'place:castle-gastyr',
        '개스티어 성문 근처에서 경비를 선다.'
      )
    )
  end

  def test_mine_typo_is_corrected_without_rewriting_miner_or_compound_headwords
    result, count = M.normalize_name(
      'place:skoria-mine',
      '스코리아(Scoria) 광산 소유권 증서를 훔치기'
    )
    assert_equal '스코리아 광산(Skoria Mine) 소유권 증서를 훔치기', result
    assert_equal 1, count
    assert_equal(
      '스코리아 광산(Skoria Mine)의 문',
      M.normalize_name('place:skoria-mine', '스코리아(Skoria) 광산의 문').first
    )
    assert_equal ['스코리아 광부', 0],
                 M.normalize_name('place:skoria-mine', '스코리아 광부')
  end

  def test_hall_form_uses_prevalent_semantic_korean_and_corrects_stale_label
    assert_equal(
      '첫서약자 전당(Hall of the Firstsworn)에서 만나자.',
      M.normalize_name(
        'place:hall-of-the-firstsworn',
        '첫 서약자들의 전당에서 만나자.'
      ).first
    )
    assert_equal(
      '첫서약자 전당(Hall of the Firstsworn)으로 이동',
      M.normalize_name(
        'place:hall-of-the-firstsworn',
        '퍼스트스원 전당(Firstsworn Hall)으로 이동'
      ).first
    )
    assert_equal(
      '첫서약자 전당(Hall of the Firstsworn)',
      M.normalize_name(
        'place:hall-of-the-firstsworn',
        '최초의 맹세자들의 전당(Hall of the Firstsworn)'
      ).first
    )
  end

  def test_gallows_tree_variants_normalize_but_ordinary_gallows_do_not
    assert_equal(
      '교수대 나무(Gallows Tree) - 겨울 페이(Winter Fae)에게 바치는 찬가.',
      M.normalize_name(
        'place:gallows-tree',
        '갤로우스 나무 - 겨울 페이(Winter Fae)에게 바치는 찬가.'
      ).first
    )
    assert_equal(
      '교수대 나무(Gallows Tree) 아래에서 명상했다.',
      M.normalize_name(
        'place:gallows-tree',
        '교수형 나무 아래에서 명상했다.'
      ).first
    )
    ['교수대', '교수형에 처하다', '마을에 교수대가 세워졌다'].each do |text|
      assert_equal [text, 0], M.normalize_name('place:gallows-tree', text)
    end
  end

  def test_false_positive_keys_are_explicitly_excluded_from_review_scope
    excluded = M::EXCLUDED_FALSE_POSITIVES.keys
    assert_includes excluded, ['default', '38986', '']
    assert_equal 5, excluded.length
    refute M::REVIEWED_KEYS.values.flatten(1).include?(['default', '38986', ''])
  end

  def test_all_reviewed_rows_have_aligned_evidence_and_row_specific_dispositions
    reviews = M.build_review_data
    assert_equal 120, reviews.length
    assert_equal 120, reviews.map { |row| ReviewedNameBatches.key(row) }.uniq.length
    assert_equal 120, reviews.sum { |row| JSON.parse(row.fetch('entity_dispositions_json')).length }
    reviews.each do |row|
      refute_empty row.fetch('english')
      refute_empty row.fetch('japanese')
      refute_empty row.fetch('chinese')
      refute_empty row.fetch('evidence')
      assert_includes row.fetch('evidence'), 'Exact-key review'
      assert_includes row.fetch('evidence'), 'active Korean cells'
      if row.fetch('old') != row.fetch('new')
        assert_equal 'accepted', row.fetch('status')
      else
        assert_equal 'not-an-issue', row.fetch('status')
      end
    end

    stats = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
    assert_equal 120, stats.values.sum
    assert_operator stats.fetch('accepted', 0), :>, 0
  end

  def test_compound_book_and_quest_text_remains_intact
    reviews = M.build_review_data
    mine_deed = reviews.find do |row|
      row['resource'] == 'base' && row['ID_Linha'] == '340'
    end
    assert_includes mine_deed.fetch('new'), '소유권 증서'
    assert_includes mine_deed.fetch('new'), '스코리아 광산(Skoria Mine)'

    hymn = reviews.find do |row|
      row['resource'] == 'default' && row['ID_Linha'] == '15349'
    end
    assert_includes hymn.fetch('new'), '교수대 나무(Gallows Tree) -'
    assert_includes hymn.fetch('new'), '찬가'
  end
end
