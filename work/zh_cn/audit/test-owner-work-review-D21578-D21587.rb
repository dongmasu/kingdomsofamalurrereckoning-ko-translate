#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-owner-independent-titles-D21578'
require_relative 'review-mel-aglir-ayten-compounds-D21579'
require_relative 'review-confirmed-owner-works-D21580'
require_relative 'review-author-work-compounds-D21581'
require_relative 'review-memoir-and-diary-labels-D21582'
require_relative 'review-final-owner-title-fragments-D21583'
require_relative 'review-abyss-artifact-equipment-D21584'
require_relative 'separate-sigbert-work-labels-D21585'
require_relative 'review-residual-full-person-names-D21586'
require_relative 'correct-work-artifact-attributions-D21587'

class OwnerWorkReviewTest < Minitest::Test
  def test_bede_title_is_uniform_without_identifying_the_owner
    rows = ReviewOwnerIndependentTitlesD21578::CHANGES.values.select do |row|
      row[0] == 'named work:bedes-journal'
    end
    assert_equal 4, rows.length
    rows.each do |row|
      assert_includes row[2], "비드의 일지(Bede's Journal)"
      refute_match(/Pengaras|Edithing/, row[2])
    end
  end

  def test_odi_date_and_owner_independence
    changes = ReviewOwnerIndependentTitlesD21578::CHANGES
    old, updated = changes.fetch(['default', '5215', '']).last(2)
    assert_equal old.scan(/\d+/), updated.scan(/\d+/)
    assert_equal '오디의 이야기(Odi Speaks)(1480)', updated
    changes.each_value do |row|
      next unless row[0].include?('odi')
      refute_match(/Erion|Edar/, row[2])
    end
  end

  def test_full_name_split_pair_and_source_local_fell
    reviewer = ReviewMelAglirAytenCompoundsD21579
    assert_equal ['레르카라 펠(Lerkara Fel)과 대화하기', 'accepted'],
      reviewer.transform('person:lerkara-fel', ['default', '20161', ''],
                         '레르카라(Lerkara) 펠(Fel)과 대화하기', 'Speak to Lerkara Fel')
    assert_equal ['레르카라 펠(Lerkara Fell)과 대화', 'accepted'],
      reviewer.transform('person:lerkara-fel', ['default', '37428', ''],
                         '레르카라(Lerkara) 펠과 대화', 'Speak to Lerkara Fell')
  end

  def test_complete_rank_annotation_and_separate_title_are_not_rewritten
    reviewer = ReviewMelAglirAytenCompoundsD21579
    ranked = '숙련자 레르카라 펠(Adept Lerkara Fel)이 보낸 편지.'
    assert_equal [ranked, 'not-an-issue'],
      reviewer.transform('person:lerkara-fel', ['default', '760', ''],
                         ranked, 'A letter from Adept Lerkara Fel.')
    title = '레르카라(Lerkara) 펠(Fel)의 일지'
    assert_equal [title, 'excluded'],
      reviewer.transform('person:lerkara-fel', ['default', '41777', ''],
                         title, 'The Journal of Lerkara Fel')
  end

  def test_patrick_correction_does_not_change_other_names_or_line_breaks
    old = "툴란(Tulan)\r\n패트릭 모르칸(Morkan)은 알고 있다."
    updated, status = ReviewMelAglirAytenCompoundsD21579.transform(
      'person:patrick-morkan', ['default', '39080', ''], old, 'Patrick Morkan knows.')
    assert_equal 'accepted', status
    assert_equal "툴란(Tulan)\r\n패트릭 모르칸(Patrick Morkan)은 알고 있다.", updated
  end

  def test_lowercase_descriptions_are_not_automatically_treated_as_titles
    reviewer = ReviewConfirmedOwnerWorksD21580
    text = '하수도 석공 파구스(Pagus)의 일지.'
    assert_equal [text, 'excluded'],
      reviewer.transform(['default', '33302', ''], text,
                         'The journal of Pagus, sewer mason.', {})
  end

  def test_source_short_sigbert_work_stays_short
    result = ReviewConfirmedOwnerWorksD21580.transform(
      ['base', '3322', '11'], '시그버트(Sigbert)의 일지', "Sigbert's Journal",
      {'english_canonical' => 'Journal of Sigbert Sawerth',
       'english_aliases' => "Sigbert's Journal"})
    assert_equal ["시그버트의 일지(Sigbert's Journal)", 'accepted'], result
    refute_includes result[0], 'Sawerth'
  end

  def test_courden_work_names_are_distinct_but_owner_spelling_is_shared
    titles = ReviewAuthorWorkCompoundsD21581::WORKS.select do |row|
      row[0].start_with?('courden-')
    end
    assert_equal 2, titles.length
    assert_equal 2, titles.map { |row| row[1] }.uniq.length
    titles.each { |row| assert row[2].start_with?('쿠어든의 ') }
    assert_equal ['쿠어든의 끔찍한 논고', '쿠어든의 위대한 논고'],
      titles.map { |row| row[2] }
  end

  def test_memoir_numbers_and_literal_source_apostrophes
    data = ReviewMemoirAndDiaryLabelsD21582::DATA
    numbered = data.select { |row| row[1].match?(/Part I[VIX]*\z/) }
    assert_equal 8, numbered.length
    numbers = {'I' => '1', 'II' => '2', 'III' => '3', 'IV' => '4'}
    numbered.each do |row|
      number = numbers.fetch(row[1][/Part (I[VIX]*)\z/, 1])
      assert_includes row[2], "제#{number}부"
    end
    assert_includes data.map { |row| row[1] }, 'McLeod‘s Notes'
    assert_includes data.map { |row| row[1] }, 'Wulf‘s Diary'
    refute_includes data.map { |row| row[1] }, 'Memoirs Prologue'
  end

  def test_stellan_objectives_keep_actions_and_object_particle
    changes = ReviewFinalOwnerTitleFragmentsD21583::CHANGES
    assert_equal "스텔란의 일지(Stellan's Journal)를 찾아라",
      changes.fetch(['default', '11594', ''])[2]
    assert_equal "스텔란의 일지(Stellan's Journal) 찾기",
      changes.fetch(['default', '32243', ''])[2]
  end

  def test_airor_title_keeps_source_punctuation_and_complete_names
    updated = ReviewFinalOwnerTitleFragmentsD21583::CHANGES
                .fetch(['default', '998', ''])[2]
    assert_equal '반발가의 아들 에어로르의 일지(Journal of Airor. son of Banvalga)', updated
    refute_includes updated, 'Sir Airor'
    refute_includes updated, '에어로어'
  end

  def test_god_storm_title_preserves_the_question
    old, updated = ReviewFinalOwnerTitleFragmentsD21583::CHANGES
                     .fetch(['default', '3411', '']).last(2)
    assert_equal old.count('?') + 1, updated.count('?')
    assert_includes updated, "'신의 폭풍'? 덜스턴의 사색"
    assert_includes updated, '(God Storm? The Musings of Dulstan)'
  end

  def test_abyss_ordinary_noun_is_not_the_named_cloak
    reviewer = ReviewAbyssArtifactEquipmentD21584
    text = '그녀가 갇혀 있던 마법의 심연으로 내던져졌다.'
    assert_equal [text, 'excluded'],
      reviewer.transform('unique item:abyss-cloak', ['default', '55986', ''], text)
  end

  def test_abyss_repeated_name_is_paired_without_duplicate_annotations
    reviewer = ReviewAbyssArtifactEquipmentD21584
    text = "어비스(Abyss)의 조각\r\n어비스가 드러나게 하지 마라."
    result, status = reviewer.transform('unique item:abyss-cloak',
                                       ['default', '11476', ''], text)
    assert_equal 'accepted', status
    assert_equal "어비스(Abyss)의 조각\r\n어비스(Abyss)가 드러나게 하지 마라.", result
    assert_equal text.scan(/\r\n/), result.scan(/\r\n/)
  end

  def test_abyss_equipment_stays_independent_of_cloak_identity
    reviewer = ReviewAbyssArtifactEquipmentD21584
    key = ['base', '1498', '11']
    assert_equal ['심연의 신발', 'excluded'],
      reviewer.transform('unique item:abyss-cloak', key, '심연의 신발')
    assert_equal ['심연의 신발(Abyss Shoes)', 'accepted'],
      reviewer.transform('item:abyss-shoes', key, '심연의 신발')
  end

  def test_historical_abyss_experiment_pair_kept_its_quote_and_description
    assert_equal ["'어비스(Abyss)' 실험에 관한 기록.", 'accepted'],
      ReviewAbyssArtifactEquipmentD21584.transform(
        'unique item:abyss-cloak', ['default', '58825', ''], "'심연' 실험에 관한 기록.")
  end

  def test_metadata_only_sigbert_split_preserves_status_counts_and_csv_hashes
    before = File.read(File.join(__dir__, 'named-scope-review-D21584-20261017.md'))
    after = File.read(File.join(__dir__, 'named-scope-review-D21585-20261017.md'))
    assert_equal before[/^Indexed matches:.*$/], after[/^Indexed matches:.*$/]
    assert_equal before.lines.grep(/^- (?:affix|base|default): `\h{64}`\./),
      after.lines.grep(/^- (?:affix|base|default): `\h{64}`\./)
    manifest = ReviewedNameBatches.table(File.join(__dir__, 'proper-name-edits-D21585.tsv'))
    assert_equal 1, manifest.length
    row = manifest.first
    assert_equal row['old'], row['new']
    assert_equal 'accepted', row['status']
    assert_equal({'named work:journal-of-sigbert-sawerth' => 'accepted'},
                 JSON.parse(row['previous_status']))
  end

  def test_sigbert_labels_no_longer_share_an_unsupported_alias
    glossary = ReviewedNameBatches.table(ReviewedProperNameDiscovery::GLOSSARY)
    long = glossary.find { |row| row['entity_key'] == SeparateSigbertWorkLabelsD21585::LONG }
    short = glossary.find { |row| row['entity_key'] == SeparateSigbertWorkLabelsD21585::SHORT }
    assert_equal '', long['english_aliases']
    assert_equal "Sigbert's Journal", short['english_canonical']
    assert_equal '', short['english_aliases']
    index = ReviewedNameBatches.table(ReviewedNameBatches::INDEX)
    row = index.find do |entry|
      entry['entity_key'] == SeparateSigbertWorkLabelsD21585::SHORT &&
        ReviewedNameBatches.key(entry) == ['base', '3322', '11']
    end
    assert_equal 'accepted', row['status']
    refute index.any? { |entry|
      entry['entity_key'] == SeparateSigbertWorkLabelsD21585::LONG &&
        ReviewedNameBatches.key(entry) == ['base', '3322', '11']
    }
  end

  def test_residual_full_names_are_paired_without_component_aliases
    data = ReviewResidualFullPersonNamesD21586::DATA
    reviews = ReviewedNameBatches.table(File.join(__dir__, 'proper-name-edits-D21586.tsv'))
    assert_equal 18, reviews.length
    assert_equal 18, reviews.map { |row| ReviewedNameBatches.key(row) }.uniq.length
    reviews.each do |row|
      name = data.find { |entry| "person:#{entry[0]}" == row['entity_key'] }
      assert_equal 'accepted', row['status']
      assert_includes row['new'], "#{name[2]}(#{name[1]})"
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
    end
    assert_equal '동전만 있으면 나릿 와일(Narit Wyle)이 누구에게든 자물쇠 따는 법을 가르쳐 줘.',
      reviews.find { |row| row['ID_Linha'] == '32386' }['new']
    assert_equal '펜 애트워터(Fenn Attwater)와 대화해 다시 경주하기',
      reviews.find { |row| row['ID_Linha'] == '56862' }['new']
    definitions = ReviewedNameBatches.table(ReviewResidualFullPersonNamesD21586::DEFINITIONS)
    assert definitions.all? { |row| row['english_aliases'].to_s.empty? }
  end

  def test_current_experiment_and_cloak_have_separate_attributions
    index = ReviewedNameBatches.table(ReviewedNameBatches::INDEX)
    matches = index.select do |row|
      ReviewedNameBatches.key(row) == CorrectWorkArtifactAttributionsD21587::KEY &&
        [CorrectWorkArtifactAttributionsD21587::EXPERIMENT,
         CorrectWorkArtifactAttributionsD21587::CLOAK].include?(row['entity_key'])
    end
    assert_equal 2, matches.length
    assert_equal({'lore term:abyss-experiment' => 'accepted',
                  'unique item:abyss-cloak' => 'excluded'},
                 matches.to_h { |row| [row['entity_key'], row['status']] })
    matches.each do |row|
      assert_equal "'어비스' 실험(\"Abyss\" experiment)에 관한 기록.", row['korean_current']
    end
    manifest = ReviewedNameBatches.table(File.join(__dir__, 'proper-name-edits-D21587.tsv')).first
    assert_equal 'accepted', JSON.parse(manifest['previous_status'])['unique item:abyss-cloak']
    assert_equal 'needs-context', JSON.parse(manifest['previous_status'])['lore term:abyss-experiment']
  end

  def test_historical_sigbert_work_claim_is_marked_superseded_in_active_evidence
    rows = ReviewedNameBatches.table(ReviewedNameBatches::INDEX).select do |row|
      row['evidence'].match?(SeparateSigbertWorkLabelsD21585::OLD_ASSERTION)
    end
    assert_equal 26, rows.length
    assert rows.all? { |row| row['evidence'].include?('D-21587 current-evidence notice:') }
    assert rows.all? { |row| row['evidence'].include?('superseded by D-21585') }
  end
end
