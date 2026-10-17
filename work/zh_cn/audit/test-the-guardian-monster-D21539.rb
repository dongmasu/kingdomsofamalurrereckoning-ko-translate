#!/usr/bin/env ruby

require 'digest'
require 'minitest/autorun'
require_relative 'review-the-guardian-monster-D21539'

class TheGuardianMonsterD21539Test < Minitest::Test
  R = TheGuardianMonsterD21539
  M = ReviewedNameBatches

  def self.inventory
    @inventory ||= R.source_inventory
  end

  def self.historical_reviews
    @historical_reviews ||= begin
      present = [R::DEFINITIONS, R::REVIEWS].map { |path| File.file?(path) }
      raise 'partial D21539 discovery artifacts' unless present.uniq.length == 1

      present.first ? M.table(R::REVIEWS).map(&:to_h) : R.reviews_for(inventory)
    end
  end

  def inventory
    self.class.inventory
  end

  def reviews
    self.class.historical_reviews
  end

  def row(id)
    reviews.find { |review| M.key(review) == ['default', id, ''] } ||
      raise("missing Guardian test row #{id}")
  end

  def definitions
    R.definitions_for(M.table(ReviewedProperNameDiscovery::GLOSSARY).headers)
  end

  def test_exact_full_phrase_scope_and_no_bare_alias
    generated = R.generated_for(inventory)
    assert_equal 34, generated.length
    assert_equal R.expected_keys.sort, generated.map { |review| M.key(review) }.sort
    assert_equal 34, generated.map { |review| M.key(review) }.uniq.length
    assert_equal({ 'base' => 5, 'default' => 29 },
                 generated.group_by { |review| review.fetch('resource') }.transform_values(&:length))
    assert_equal (R::POSITIVE_IDS + R::HOLD_IDS + R::EXCLUDED_IDS).sort, R::CONTEXTS.keys.sort
    refute generated.any? { |review| review['ID_Linha'] == '55245' }
    assert_equal 'The Guardian', R::ENTITY.fetch('english_canonical')
    assert_equal '수호자(The Guardian)', R::ENTITY.fetch('korean_canonical')
    assert_equal 'monster', R::ENTITY.fetch('category')
    assert_equal '', R::ENTITY.fetch('english_aliases')
    matchers = build_matchers(definitions)
    ['Guardian', "Guardian's", 'Temple Guardian', 'Guardian Spider', 'The Guardians'].each do |text|
      assert_empty candidate_matches([text], matchers)
    end
    assert_equal [R::ENTITY_KEY], candidate_matches(['The Guardian'], matchers).keys
    assert_equal [R::ENTITY_KEY], candidate_matches(['the guardian of Arms'], matchers).keys
  end

  def test_historical_counts_and_discovery_gates
    assert_equal 34, reviews.length
    assert_equal({ 'excluded' => 21, 'accepted' => 9, 'uncertain' => 4 },
                 reviews.group_by { |review| review.fetch('status') }.transform_values(&:length))
    assert_equal 9, reviews.count { |review| review.fetch('old') != review.fetch('new') }
    assert_equal R::POSITIVE_IDS.sort,
                 reviews.select { |review| review['status'] == 'accepted' }.map { |review| review['ID_Linha'] }.sort
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    R.validate_equipment!(glossary, index)
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, R.generated_for(inventory, definitions),
      glossary.reject { |entry| entry['entity_key'] == R::ENTITY_KEY },
      index.reject { |entry| entry['entity_key'] == R::ENTITY_KEY }
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
  end

  def test_source_evidence_is_complete_and_independent_of_mutable_korean
    reviews.each do |review|
      key = M.key(review)
      assert_equal R.source_texts(inventory.fetch(key)),
                   review.values_at('english', 'japanese', 'chinese')
      assert_equal R.source_texts(inventory.fetch(key)), R.validate_source!(inventory.fetch(key))
      assert_equal({ R::ENTITY_KEY => review.fetch('status') },
                   JSON.parse(review.fetch('entity_dispositions_json')))
    end
    assert_includes row('4449')['english'], "Niskaru that can't be killed"
    assert_includes row('6544')['english'], "demon that can't be killed"
    assert_includes row('6729')['english'], 'incapacitating the Niskaru'
    assert_includes row('13271')['english'], 'Glass of Ambient'
    assert_includes row('17289')['chinese'], '方圆之镜'
    assert_includes R::NOTE, 'neutral category'
    assert_includes R::NOTE, 'not every use of guardian'
  end

  def test_only_the_reviewed_spans_change_and_all_particles_survive
    reviews.each do |review|
      key = M.key(review)
      old = review.fetch('old')
      proposed = review.fetch('new')
      assert_equal proposed, R.normalize(key, old)
      assert_equal proposed, R.normalize(key, proposed)
      assert_equal old.scan(ReviewedProperNameDiscovery::OPAQUE),
                   proposed.scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_equal old.scan(/\r\n|\r|\n/), proposed.scan(/\r\n|\r|\n/)
      assert_equal old.scan(/\d+/), proposed.scan(/\d+/)
      next unless review.fetch('status') == 'accepted'

      assert_equal old.gsub(R::KO_PATTERN, '<NAME>'), proposed.gsub(R::KOREAN, '<NAME>')
      R::PARTICLES.fetch(key[1]).each do |ending|
        assert_includes proposed, "#{R::KOREAN}#{ending}"
      end
    end
    assert_equal 2, row('13271')['new'].scan(R::KOREAN).length
    assert_equal 10, reviews.select { |review| review['status'] == 'accepted' }
                            .sum { |review| review.fetch('new').scan(R::KOREAN).length }
    assert_equal "#{R::KOREAN}에게 부적 사용", row('24019')['new']
    assert_equal "#{R::KOREAN} 감금", row('30448')['new']
    assert_includes row('4449')['new'], '니스카루(Niskaru)'
    assert_includes row('13271')['new'], '미사루의 눈물(Tear of Mitharu)'
  end

  def test_existing_pairs_are_idempotent_without_nested_annotations
    key = ['default', '4449', '']
    expected = "마지막은 #{R::KOREAN}야."
    ['수호자', '수호자(Guardian)', R::KOREAN].each do |name|
      assert_equal expected, R.normalize(key, "마지막은 #{name}야.")
    end
    ['수호자(Other)야.', '수호자(The Guardian)(Other)야.',
     '수호자(The Guardian)야. 수호자야.', '수호자에게.', '(수호자)야.'].each do |bad|
      assert_raises(RuntimeError) { R.normalize(key, bad) }
    end
  end

  def test_opaque_tokens_and_unrelated_annotations_are_protected
    key = ['default', '4449', '']
    old = "7\r\n{수호자} $수호자$ <b>수호자야.</b>\n인물(Other)와 (수호자)"
    expected = "7\r\n{수호자} $수호자$ <b>#{R::KOREAN}야.</b>\n인물(Other)와 (수호자)"
    assert_equal expected, R.normalize(key, old)
    assert_equal expected, R.normalize(key, expected)
    assert_equal expected + ' 동료(Companion)', R.normalize(key, expected + ' 동료(Companion)')
    assert_raises(RuntimeError) { R.normalize(['default', '55245', ''], '수호자') }
  end

  def test_identity_holds_and_exclusions_stay_byte_identical
    R::HOLD_IDS.each do |id|
      assert_equal 'uncertain', row(id)['status']
      assert_equal row(id)['old'], row(id)['new']
    end
    reviews.select { |review| review['status'] == 'excluded' }.each do |review|
      assert_equal review.fetch('old'), review.fetch('new')
      assert_equal review.fetch('old'), R.normalize(M.key(review), review.fetch('old'))
    end
    %w[17011 25534 30259 40677 58545].each do |id|
      assert_equal 'excluded', row(id)['status']
    end
    equipment = reviews.select { |review| review['resource'] == 'base' }
    assert_equal 5, equipment.length
    equipment.each do |review|
      assert_equal 'excluded', review.fetch('status')
      assert_includes review.fetch('new'), "(#{R::ITEMS.fetch(review.fetch('ID_Linha'))[1]})"
    end
  end

  def test_source_scope_and_language_drift_fail_closed
    generated = R.generated_for(inventory)
    assert_raises(RuntimeError) { R.reviews_for(inventory, generated.drop(1)) }
    assert_raises(RuntimeError) { R.reviews_for(inventory, generated + [generated.first]) }
    key = ['default', '4449', '']
    source = inventory.fetch(key)
    [
      { 'en_texts_json' => '["The Guardian"]' },
      { 'en_texts_json' => JSON.generate([R.source_texts(source).first + ' The Guardian']) },
      { 'ja_texts_json' => '["別の魔物"]' },
      { 'zh_text' => '别的怪物' }
    ].each do |changes|
      modified = inventory.merge(key => source.merge(changes))
      assert_raises(RuntimeError) { R.reviews_for(modified, generated) }
    end
    assert_raises(RuntimeError) do
      R.validate_source!(source.merge('ID_Linha' => '55245'))
    end
  end

  def test_prior_terminal_dispositions_and_evidence_are_never_recounted
    prior = [
      ['monster:niskaru', 'default', '4449', '', 'accepted'],
      ['item:the-guardian-helm', 'base', '1860', '11', 'not-an-issue'],
      ['title:earlier-guardian', 'default', '55245', '', 'not-an-issue']
    ].map do |entity, resource, id, variant, status|
      {
        'entity_key' => entity, 'resource' => resource, 'ID_Linha' => id,
        'Tipo_Variante' => variant, 'status' => status,
        'evidence' => 'earlier terminal evidence', 'korean_current' => 'earlier snapshot'
      }
    end
    before = R.prior_records(prior)
    additions = reviews.map do |review|
      review.slice('entity_key', 'resource', 'ID_Linha', 'Tipo_Variante', 'status', 'evidence')
    end
    current = prior.map { |entry| entry.merge('korean_current' => 'updated snapshot') } + additions
    assert R.verify_prior_records!(before, current)
    assert_raises(RuntimeError) do
      R.verify_prior_records!(before, current.map.with_index do |entry, i|
        i.zero? ? entry.merge('evidence' => 'recounted') : entry
      end)
    end
    assert_raises(RuntimeError) do
      R.verify_prior_records!(before, current.map.with_index do |entry, i|
        i.zero? ? entry.merge('status' => 'excluded') : entry
      end)
    end
    assert_raises(RuntimeError) { R.verify_prior_records!(before, current + [additions.first]) }
  end

  def test_preparation_and_test_inventory_are_read_only
    paths = M::RESOURCES.flat_map do |resource|
      %w[en_us ja_jp zh_cn work].map { |locale| inventory_paths(M::ROOT, locale, resource) }
    end + [
      M::INVENTORY, M::INDEX, ReviewedProperNameDiscovery::GLOSSARY,
      ReviewedProperNameDiscovery::DISCOVERY_CANDIDATES, R::DEFINITIONS, R::REVIEWS, R::EDITS,
      *M::DOCS
    ]
    snapshot = lambda do
      paths.to_h { |path| [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil] }
    end
    before = snapshot.call
    reject_write = ->(*) { raise 'read-only test called a writer, refresher or apply' }
    M.stub(:refresh_inventory, reject_write) do
      M.stub(:write_table, reject_write) do
        ProperNameCellEditor.stub(:apply, reject_write) do
          ReviewedProperNameDiscovery.stub(:run, reject_write) do
            if File.file?(R::DEFINITIONS)
              R.reviews_for(R.source_inventory)
            else
              R.prepare
            end
          end
        end
      end
    end
    assert_equal before, snapshot.call
  end
end
