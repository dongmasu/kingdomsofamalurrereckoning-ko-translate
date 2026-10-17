#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-four-persons-discovery-D21070'

class FourPersonsDiscoveryD21070Test < Minitest::Test
  D = FourPersonsDiscoveryD21070
  # Independently reviewed edit decisions; do not derive these from the preparer.
  ACCEPTED = {
    'person:anker-edmure' => %w[11948 14834 20942 24490 25885 29718 30152 32306
                               33908 37566 39351 44822 44982 45401 47107],
    'person:luca-soren' => %w[10212 10781 14921 25890 35838 37705 40287 44918
                             46910 58173 62865],
    'person:phasmer-humm' => %w[8706 10702 24498 32402 34607 36399 42521 57865],
    'person:ferrin-shaw' => %w[8946 15491 25118 30875 32060 35119 36179 36968
                              41482 45230 48448]
  }.freeze
  UNCHANGED = {
    'person:anker-edmure' => %w[937 16363 23334 55297 63508],
    'person:luca-soren' => %w[22434 28536 28795 51777 60584 64804],
    'person:phasmer-humm' => %w[864 5649 8466 13755 30297 32728 40098 50551 52074 56410],
    'person:ferrin-shaw' => %w[525 2072 11955 14500 56022]
  }.freeze
  OLD_VARIANTS = {
    '11948' => '앵커 에드무어', '25885' => '앤커 에드뮤어',
    '29718' => '앵커 에드무어', '30152' => '앵커 에드무어',
    '45401' => '앵커 에드머', '42521' => '패스머 험'
  }.freeze

  def self.inventory
    @inventory ||= D.current_inventory
  end

  def inventory
    self.class.inventory
  end

  def reviews_and_matches
    @reviews_and_matches ||= D.build_reviews(inventory)
  end

  def test_all_74_exact_keys_and_independent_statuses
    reviews, generated = reviews_and_matches
    assert_equal 74, generated.length
    assert_equal 74, reviews.length
    assert_equal({ 'accepted' => 45, 'not-an-issue' => 26, 'excluded' => 3 },
                 reviews.group_by { |row| row['status'] }.transform_values(&:length))
    expected = {}
    { 'accepted' => ACCEPTED, 'not-an-issue' => UNCHANGED }.each do |status, groups|
      groups.each do |entity, ids|
        ids.each { |id| expected[[entity, 'default', id, '']] = status }
      end
    end
    expected[['person:anker-edmure', 'default', '31080', '']] = 'excluded'
    expected[['person:luca-soren', 'default', '46892', '']] = 'excluded'
    expected[['person:luca-soren', 'base', '3301', '11']] = 'excluded'
    actual = reviews.to_h { |row| [[row['entity_key'], *D::M.key(row)], row['status']] }
    assert_equal expected, actual
  end

  def test_every_exact_old_new_and_all_source_evidence
    reviews, = reviews_and_matches
    reviews.each do |row|
      key = D::M.key(row)
      source = inventory.fetch(key)
      assert_equal source['work_text'], row['old'], key.inspect
      assert_equal JSON.parse(source['en_texts_json']).compact.join("\n"), row['english'], key.inspect
      assert_equal JSON.parse(source['ja_texts_json']).compact.join("\n---\n"), row['japanese'], key.inspect
      assert_equal source['zh_text'], row['chinese'], key.inspect
      if row['status'] == 'excluded'
        assert_equal row['old'], row['new'], key.inspect
        next
      end
      english, korean = {
        'person:anker-edmure' => ['Anker Edmure', '앵커 에드뮤어'],
        'person:luca-soren' => ['Luca Soren', '루카 소렌'],
        'person:phasmer-humm' => ['Phasmer Humm', '파스머 험'],
        'person:ferrin-shaw' => ['Ferrin Shaw', '페린 쇼']
      }.fetch(row['entity_key'])
      old_name = OLD_VARIANTS.fetch(row['ID_Linha'], korean)
      pair = "#{korean}(#{english})"
      # Independent literal-span expectation preserves every surrounding byte.
      spans = Regexp.union("#{old_name}(#{english})", old_name)
      expected = row['old'].gsub(spans, pair)
      assert_equal expected, row['new'], key.inspect
      assert_equal 1, row['new'].scan(pair).length, key.inspect
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                   row['new'].scan(ReviewedProperNameDiscovery::OPAQUE), key.inspect
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/), key.inspect
    end
  end

  def test_majority_anker_spelling_unifies_every_attested_variant
    %w[앵커\ 에드뮤어 앵커\ 에드무어 앤커\ 에드뮤어 앵커\ 에드머].each do |variant|
      [variant, "#{variant}(Anker Edmure)"].each do |old|
        assert_equal '앵커 에드뮤어(Anker Edmure)에게',
                     D.edit_name("#{old}에게", 'person:anker-edmure')
      end
    end
    counts = D.expected_keys('person:anker-edmure').map do |key|
      inventory.fetch(key)['work_text'][/(?:앵커|앤커) (?:에드뮤어|에드무어|에드머)/]
    end.group_by(&:itself).transform_values(&:length)
    assert_equal({ '앵커 에드뮤어' => 16, '앵커 에드무어' => 3,
                   '앤커 에드뮤어' => 1, '앵커 에드머' => 1 }, counts)
  end

  def test_repeated_paired_unpaired_names_and_particles_are_idempotent
    D::NAMES.each do |entity, spec|
      canonical = "#{spec[:ko]}(#{spec[:en]})"
      spec[:variants].each do |variant|
        old = "#{variant}는 #{variant}(#{spec[:en]})에게 #{variant}의 일을 맡겼다.\r\n끝."
        expected = "#{canonical}는 #{canonical}에게 #{canonical}의 일을 맡겼다.\r\n끝."
        assert_equal expected, D.edit_name(old, entity)
        assert_equal expected, D.edit_name(expected, entity)
      end
    end
  end

  def test_short_names_surnames_and_unrelated_text_are_untouched
    text = '앵커(Anker)와 에드뮤어, 루카는 제라 소렌(Jera Soren)에게 갔다. ' \
           '패스머와 파스머(Phasmer), 흠. 케이든 쇼(Cayden Shaw). ' \
           'The Journal, 시드헤, 리든, 대사제는 그대로.'
    D::NAMES.each_key { |entity| assert_equal text, D.edit_name(text, entity) }
    assert_equal '가짜페린 쇼 / 페린 쇼Suffix',
                 D.edit_name('가짜페린 쇼 / 페린 쇼Suffix', 'person:ferrin-shaw')
  end

  def test_opaque_tokens_are_not_edited
    text = '$페린 쇼$ <페린 쇼> {페린 쇼} 페린 쇼의 물건'
    assert_equal '$페린 쇼$ <페린 쇼> {페린 쇼} 페린 쇼(Ferrin Shaw)의 물건',
                 D.edit_name(text, 'person:ferrin-shaw')
  end

  def test_full_titles_are_separate_exclusions_not_person_edits
    D::TITLES.each_key do |resource, id, variant|
      assert D.excluded?('resource' => resource, 'ID_Linha' => id, 'Tipo_Variante' => variant)
    end
    refute D.excluded?('resource' => 'base', 'ID_Linha' => '3301', 'Tipo_Variante' => '')
    rows = reviews_and_matches.first.select { |row| row['status'] == 'excluded' }
    assert_equal 3, rows.length
    rows.each { |row| assert_equal row['old'], row['new'] }
  end

  def test_no_component_aliases_are_registered_and_counts_are_separate
    assert D.definitions.all? { |definition| definition['english_aliases'] == '' }
    report = D.alias_report(inventory)
    expected = {
      'person:anker-edmure' => { 'Anker' => [2, 0], 'Edmure' => [5, 1] },
      'person:luca-soren' => { 'Luca' => [2, 1], 'Soren' => [6, 0] },
      'person:phasmer-humm' => { 'Phasmer' => [53, 3], 'Humm' => [1, 0] },
      'person:ferrin-shaw' => { 'Ferrin' => [0, 0], 'Shaw' => [2, 0] }
    }
    counts = report.transform_values do |terms|
      terms.transform_values { |groups| [groups[:short_only].length, groups[:same_row].length] }
    end
    assert_equal expected, counts
    assert_includes report['person:phasmer-humm']['Humm'][:short_only], ['default', '12209', '']
    assert_includes report['person:luca-soren']['Soren'][:short_only], ['default', '27145', '']
    assert_includes report['person:ferrin-shaw']['Shaw'][:short_only], ['default', '15928', '']
  end

  def test_missing_new_or_wrong_variant_source_keys_fail_closed
    _, generated = reviews_and_matches
    assert_raises(RuntimeError) { D.validate_scope!(generated.drop(1)) }
    assert_raises(RuntimeError) { D.validate_scope!(generated + [generated.first.merge('ID_Linha' => '999999')]) }
    changed = generated.map(&:dup)
    changed.first['Tipo_Variante'] = 'wrong'
    assert_raises(RuntimeError) { D.validate_scope!(changed) }
  end

  def test_missing_cross_locale_identity_or_unrecognized_korean_fails_closed
    key = ['default', '42521', '']
    %w[ja_texts_json zh_text work_text].each do |field|
      changed = inventory.dup
      changed[key] = changed.fetch(key).merge(field => (field == 'ja_texts_json' ? '["別人"]' : 'unknown'))
      assert_raises(RuntimeError) { D.build_reviews(changed) }
    end
  end

  def test_stale_inventory_is_rejected_without_refreshing_it
    changed = inventory.dup
    key = ['default', '42521', '']
    changed[key] = changed.fetch(key).merge('work_text' => 'stale')
    assert_raises(RuntimeError) { D.validate_fresh!(changed, inventory) }
  end

  def test_stale_alias_scope_or_swapped_source_evidence_is_rejected
    changed = inventory.dup
    key = ['default', '48762', '']
    changed[key] = changed.fetch(key).merge('en_texts_json' => '["No alias here"]')
    assert_raises(RuntimeError) { D.validate_fresh!(changed, inventory) }
    reviews = reviews_and_matches.first.map(&:dup)
    reviews.first['japanese'] = 'swapped'
    assert_raises(RuntimeError) { ReviewedProperNameDiscovery.validate_sources!(reviews, inventory) }
  end

  def test_registration_gate_and_source_gate_accept_exact_review
    reviews, generated = reviews_and_matches
    glossary = D::M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    index = D::M.table(D::M::INDEX).map(&:to_h)
    D.validate_components!(glossary)
    ReviewedProperNameDiscovery.validate!(D.definitions, reviews, generated, glossary, index)
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
  end

  def test_registration_gate_rejects_existing_entities_terms_keys_and_given_names
    reviews, generated = reviews_and_matches
    assert_raises(RuntimeError) do
      ReviewedProperNameDiscovery.validate!(D.definitions, reviews, generated, D.definitions, [])
    end
    collision = D.definitions.first.merge('entity_key' => 'person:another')
    assert_raises(RuntimeError) do
      ReviewedProperNameDiscovery.validate!(D.definitions, reviews, generated, [collision], [])
    end
    assert_raises(RuntimeError) do
      ReviewedProperNameDiscovery.validate!(D.definitions, reviews, generated, [], [generated.first])
    end
    %w[Anker Luca Phasmer Ferrin].each do |given|
      assert_raises(RuntimeError) do
        D.validate_components!([{ 'entity_key' => "person:#{given.downcase}", 'english_canonical' => given }])
      end
    end
  end

  def test_existing_shared_surnames_and_separate_titles_do_not_merge_people
    D.validate_components!([
      { 'entity_key' => 'person:jera-soren', 'english_canonical' => 'Jera Soren' },
      { 'entity_key' => 'person:cayden-shaw', 'english_canonical' => 'Cayden Shaw' },
      { 'entity_key' => 'work:luca-journal', 'english_canonical' => "Luca Soren's Journal",
        'category' => 'named work' }
    ])
  end
end
