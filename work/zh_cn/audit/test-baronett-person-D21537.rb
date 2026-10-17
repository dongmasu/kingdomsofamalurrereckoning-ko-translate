#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-baronett-person-D21537'

class BaronettPersonD21537Test < Minitest::Test
  R = BaronettPersonD21537
  M = ReviewedNameBatches

  def inventory
    @inventory ||= R.source_inventory
  end

  def historical_reviews
    @historical_reviews ||= if File.file?(R::REVIEWS)
                              M.table(R::REVIEWS).map(&:to_h)
                            else
                              R.reviews_for(inventory)
                            end
  end

  def row(id)
    historical_reviews.find { |r| M.key(r) == ['default', id, ''] } ||
      raise("missing test row #{id}")
  end

  def test_full_source_coverage_across_all_three_resources
    generated = R.generated_for(inventory)
    assert_equal 21, generated.length
    assert_equal R.expected_keys.sort, generated.map { |r| M.key(r) }.sort
    assert_equal({ 'base' => 1, 'default' => 20 },
                 generated.group_by { |r| r.fetch('resource') }.transform_values(&:length))
    assert_equal R::PATCHES.keys.sort, R::CONTEXTS.keys.sort
    assert_equal R.expected_keys.map { |key| key.join(':') }.sort, R::SOURCE_DIGESTS.keys.sort
    generated.each do |r|
      key = M.key(r)
      assert_equal R::SOURCE_DIGESTS.fetch(key.join(':')),
                   Digest::SHA256.hexdigest(JSON.generate(R.source_texts(inventory.fetch(key))))
    end
  end

  def test_expected_historical_counts_and_discovery_gates
    assert_equal 21, historical_reviews.length
    assert_equal({ 'excluded' => 1, 'accepted' => 19, 'not-an-issue' => 1 },
                 historical_reviews.group_by { |r| r.fetch('status') }.transform_values(&:length))
    assert_equal 19, historical_reviews.count { |r| r.fetch('old') != r.fetch('new') }
    definitions = R.definitions_for(M.table(ReviewedProperNameDiscovery::GLOSSARY).headers)
    old_glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
                    .reject { |r| r.fetch('entity_key') == R::ENTITY_KEY }
    old_index = M.table(M::INDEX).map(&:to_h)
                 .reject { |r| r.fetch('entity_key') == R::ENTITY_KEY }
    ReviewedProperNameDiscovery.validate!(
      definitions, historical_reviews, R.generated_for(inventory, definitions),
      old_glossary, old_index
    )
    ReviewedProperNameDiscovery.validate_sources!(historical_reviews, inventory)
  end

  def test_epithet_is_not_a_claim_about_true_name_or_generic_title
    assert_equal 'person:the-baronett', R::ENTITY.fetch('entity_key')
    assert_equal 'person', R::ENTITY.fetch('category')
    assert_equal 'Baronett', R::ENTITY.fetch('english_canonical')
    assert_equal 'The Baronett', R::ENTITY.fetch('english_aliases')
    assert_equal '바로넷(Baronett)', R::ENTITY.fetch('korean_canonical')
    assert_match(/true name and origin are unknown/, R::NOTE)
    assert_match(/true name/, row('8462').fetch('english'))
    assert_match(/pirate the Baronett/, row('38334').fetch('english'))
    assert_match(/バロネット/, row('8462').fetch('japanese'))
    assert_match(/巴若内特/, row('8462').fetch('chinese'))
    %w[32516 49919 60622].each do |id|
      assert_match(/准男爵/, row(id).fetch('chinese'))
    end
  end

  def test_bare_vocative_and_full_epithet_annotations
    assert_equal "잘 가게, #{R::SHORT}.", row('8909').fetch('new')
    assert_equal R::FULL, row('44530').fetch('new')
    assert_equal "#{R::FULL}?", row('53343').fetch('new')
    assert_equal "표적: #{R::FULL}", row('64592').fetch('new')
    assert_equal row('64592').fetch('old'), row('64592').fetch('new')
    assert_equal "#{R::FULL} 처치", row('8074').fetch('new')
  end

  def test_repeated_mentions_and_name_only_changes_preserve_prose
    assert_equal 4, row('8462').fetch('new').scan(R::FULL).length
    assert_equal 2, row('24124').fetch('new').scan(R::FULL).length
    historical_reviews.each do |r|
      key = M.key(r)
      old = r.fetch('old')
      new_text = r.fetch('new')
      assert_equal new_text, R.normalize(key, old)
      assert_equal new_text, R.normalize(key, new_text)
      assert_equal old.scan(/\r\n|\r|\n/), new_text.scan(/\r\n|\r|\n/)
      assert_equal old.scan(ReviewedProperNameDiscovery::OPAQUE),
                   new_text.scan(ReviewedProperNameDiscovery::OPAQUE)
      next if key == R::ITEM_KEY

      # Removing only the reviewed name spans must leave identical narrative text.
      pattern = /(?:남작네트|바로네트|배러넷|바러넷|바론넷|바로넷|남작)(?:\((?:The )?Baronett\))?/
      assert_equal old.gsub(pattern, ''), new_text.gsub(pattern, '')
      assert_equal 0, new_text.scan(/\([^)]*바로넷/).length
    end
  end

  def test_particles_and_bounded_generic_title_replacement
    assert_equal(
      "#{R::FULL}이 널 만나고 싶어 해. 특히 네가 그 친구들에게 한 짓을 생각하면 말이지....",
      row('46528').fetch('new')
    )
    assert_includes row('21179').fetch('new'), "#{R::FULL}이 나타나"
    assert_includes row('34680').fetch('new'), "#{R::FULL}을 물리쳤다"
    assert_includes row('20921').fetch('new'), "#{R::FULL}은 이제"
    assert_includes row('39004').fetch('new'), "#{R::FULL}도 마침내"
    assert_includes row('24124').fetch('new'), "#{R::FULL}이라 불리는"
    assert_includes row('24124').fetch('new'), "#{R::FULL}의 수많은"
    fixture = "남작의 지시다. 남작이 널 만나고 싶어 해."
    assert_equal "남작의 지시다. #{R::FULL}이 널 만나고 싶어 해.",
                 R.normalize(['default', '46528', ''], fixture)
    assert_raises(RuntimeError) { R.normalize(['default', '1', ''], '남작이 말했다.') }
  end

  def test_complete_item_is_excluded_without_nested_person_label
    excluded = historical_reviews.find { |r| M.key(r) == R::ITEM_KEY }
    assert_equal 'excluded', excluded.fetch('status')
    assert_equal excluded.fetch('old'), excluded.fetch('new')
    assert_equal({ R::ENTITY_KEY => 'excluded' },
                 JSON.parse(excluded.fetch('entity_dispositions_json')))
    ["바로넷(Baronett)의 칼날", "바로넷의 칼날(Baronett's Blades)"].each do |item|
      assert_equal item, R.normalize(R::ITEM_KEY, item)
    end
  end

  def test_opaque_tokens_line_breaks_and_later_other_name_labels
    key = ['default', '8909', '']
    old = "남작의 명령\r\n{*1불투명} $TOKEN$ <b>잘 가게, 배러넷.</b>\n동료"
    expected = "남작의 명령\r\n{*1불투명} $TOKEN$ <b>잘 가게, #{R::SHORT}.</b>\n동료"
    assert_equal expected, R.normalize(key, old)
    later = expected.sub('동료', '동료(Companion)')
    assert_equal later, R.normalize(key, later)
    assert_raises(RuntimeError) { R.normalize(key, expected.sub(R::SHORT, '바로넷')) }
    assert_raises(RuntimeError) { R.normalize(key, expected + " #{R::SHORT}") }
  end

  def test_source_or_scope_drift_fails_closed
    generated = R.generated_for(inventory)
    assert_raises(RuntimeError) { R.reviews_for(inventory, generated.drop(1)) }
    modified = inventory.dup
    key = ['default', '8909', '']
    modified[key] = inventory.fetch(key).merge('zh_text' => 'changed source')
    assert_raises(RuntimeError) { R.reviews_for(modified, generated) }
  end

  def test_prior_entity_dispositions_and_evidence_are_not_overwritten
    prior = {
      'entity_key' => 'person:dead-kel', 'resource' => 'default', 'ID_Linha' => '21179',
      'Tipo_Variante' => '', 'status' => 'accepted', 'evidence' => 'old terminal evidence',
      'korean_current' => 'old Korean'
    }
    before = R.prior_records([prior])
    additions = R.expected_keys.map do |key|
      { 'entity_key' => R::ENTITY_KEY, 'resource' => key[0], 'ID_Linha' => key[1],
        'Tipo_Variante' => key[2], 'status' => key == R::ITEM_KEY ? 'excluded' : 'accepted',
        'evidence' => 'new evidence', 'korean_current' => 'current Korean' }
    end
    after = [prior.merge('korean_current' => 'updated snapshot'), *additions]
    assert R.verify_prior_records!(before, after)
    assert_raises(RuntimeError) do
      R.verify_prior_records!(before, [prior.merge('status' => 'excluded'), *additions])
    end
    assert_raises(RuntimeError) do
      R.verify_prior_records!(before, [prior.merge('evidence' => 'overwritten'), *additions])
    end
    assert_raises(RuntimeError) { R.verify_prior_records!(before, after + [additions.first]) }
  end

  def test_planning_is_read_only_including_shared_inventory
    paths = [R::DEFINITIONS, R::REVIEWS, R::EDITS, M::INVENTORY,
             ReviewedProperNameDiscovery::GLOSSARY, M::INDEX, *M::DOCS,
             *M::RESOURCES.map { |resource| M.csv_path(resource) }]
    digest = lambda do
      paths.to_h { |path| [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil] }
    end
    before = digest.call
    R.reviews_for(R.source_inventory)
    assert_equal before, digest.call
  end

  def test_saved_manifests_after_main_application
    skip 'main has not applied D21537' unless File.file?(R::EDITS)
    assert R.validate_saved_manifest!
  end
end
