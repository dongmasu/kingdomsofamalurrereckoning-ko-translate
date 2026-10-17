#!/usr/bin/env ruby

require 'digest'
require 'minitest/autorun'
require_relative 'review-chaos-realm-portal-D21519'

class ChaosRealmPortalD21519Test < Minitest::Test
  C = ChaosRealmPortalD21519
  M = ReviewedNameBatches
  SHARED_KEYS = %w[12596 16239 25426 52731].map do |id|
    ['default', id, ''].freeze
  end.freeze

  def self.applied_checkpoint?
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    glossary.any? { |row| [C::REALM, C::PORTAL].include?(row['entity_key']) } ||
      index.any? { |row| [C::REALM, C::PORTAL].include?(row['entity_key']) }
  end

  def self.prepared
    @prepared ||= if applied_checkpoint?
      raise 'partial Chaos manifest/checkpoint' unless
        File.file?(C::DEFINITIONS) && File.file?(C::REVIEWS)

      glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
      [glossary.headers, M.table(C::DEFINITIONS).map(&:to_h),
       M.table(C::REVIEWS).map(&:to_h)]
    else
      protected_paths = M::RESOURCES.map { |resource| M.csv_path(resource) } +
        M::DOCS + [M::INDEX, M::INVENTORY, ReviewedProperNameDiscovery::GLOSSARY]
      before = protected_paths.to_h do |path|
        [path, Digest::SHA256.file(path).hexdigest]
      end
      reject_write = ->(*) { raise 'prepare attempted a shared write/apply/refresh' }
      result = M.stub(:refresh_inventory, reject_write) do
        M.stub(:write_table, reject_write) do
          ReviewedProperNameDiscovery.stub(:run, reject_write) do
            File.stub(:write, reject_write) do
              File.stub(:binwrite, reject_write) { C.prepare }
            end
          end
        end
      end
      after = protected_paths.to_h do |path|
        [path, Digest::SHA256.file(path).hexdigest]
      end
      raise 'prepare changed protected files' unless before == after
      result
    end
  end

  def definitions
    self.class.prepared.fetch(1)
  end

  def reviews
    self.class.prepared.fetch(2)
  end

  def by_key
    reviews.to_h { |row| [M.key(row), row] }
  end

  def row(resource, id, variant = '')
    by_key.fetch([resource, id, variant])
  end

  def test_exact_scope_canonicals_and_two_review_batches
    assert_equal 2, definitions.length
    realm, portal = definitions
    assert_equal C::REALM, realm.fetch('entity_key')
    assert_equal 'place', realm.fetch('category')
    assert_equal C::REALM_EN, realm.fetch('english_canonical')
    assert_equal C::REALM_KO, realm.fetch('korean_canonical')
    assert_equal '', realm.fetch('english_aliases')

    assert_equal C::PORTAL, portal.fetch('entity_key')
    assert_equal 'place', portal.fetch('category')
    assert_equal C::PORTAL_EN, portal.fetch('english_canonical')
    assert_equal C::PORTAL_KO, portal.fetch('korean_canonical')
    assert_equal 'Chaos Portals', portal.fetch('english_aliases')

    assert_equal 71, reviews.length
    assert_equal 75, C.expected_pairs.length
    assert_equal [50, 21], C.batches(reviews).map(&:length)
    assert_equal 69, reviews.count { |review| review.fetch('old') != review.fetch('new') }
    assert_equal 2, reviews.count { |review| review.fetch('old') == review.fetch('new') }
    actual_pairs = reviews.flat_map do |review|
                   review.fetch('entity_key').split('|').map do |entity|
                     [entity, *M.key(review)]
                   end
                 end
    assert_equal C.expected_pairs.sort, actual_pairs.sort
    assert_equal SHARED_KEYS.sort,
                 reviews.select { |review| review.fetch('entity_key').include?('|') }
                        .map { |review| M.key(review) }.sort
    assert_equal 71, by_key.length
  end

  def test_every_scoped_row_has_aligned_english_japanese_and_chinese_support
    reviews.each do |review|
      entities = JSON.parse(review.fetch('entity_dispositions_json')).keys.sort
      assert_equal review.fetch('entity_key').split('|').sort, entities,
                   M.key(review).inspect

      if entities.include?(C::REALM)
        assert_match C::REALM_SOURCE, review.fetch('english'), M.key(review).inspect
        assert_match(/混沌の領域|混沌領域/, review.fetch('japanese'))
        assert_match(/混乱世界|混乱领域|混乱区域|混乱王国|Chaos Realm/i,
                     review.fetch('chinese'))
      end
      if entities.include?(C::PORTAL)
        assert_match C::PORTAL_SOURCE, review.fetch('english'), M.key(review).inspect
        assert_match(/混沌のポータル|混沌ポータル/, review.fetch('japanese'))
        assert_match(/混乱传送门|混乱门户|Chaos Portals?/i,
                     review.fetch('chinese'))
      end
    end
  end

  def test_per_entity_dispositions_handle_shared_and_tagged_rows
    SHARED_KEYS.each do |key|
      dispositions = JSON.parse(by_key.fetch(key).fetch('entity_dispositions_json'))
      assert_equal [C::PORTAL, C::REALM].sort, dispositions.keys.sort, key.inspect
      assert dispositions.values.all? { |value| %w[accepted not-an-issue].include?(value) }
    end

    tagged_realm = by_key.fetch(['default', '56572', ''])
    assert_equal({ C::REALM => 'accepted' },
                 JSON.parse(tagged_realm.fetch('entity_dispositions_json')))
    assert_equal 'accepted', tagged_realm.fetch('status')

    linked_opaque = by_key.fetch(['default', '63316', ''])
    assert_equal({ C::PORTAL => 'accepted' },
                 JSON.parse(linked_opaque.fetch('entity_dispositions_json')))
    assert_includes linked_opaque.fetch('new'), '{*1혼돈 차원문}'
    assert_includes linked_opaque.fetch('new'), '차원문(Portal)을 열려면'
  end

  def test_exact_opaque_labels_are_paired_outside_unchanged_tokens
    expected = {
      ['default', '12596', ''] => '{*1혼돈의 영역}(Chaos Realm)',
      ['default', '56572', ''] => '{*1혼돈 영역 던전}(Chaos realm dungeons)',
      ['default', '63316', ''] => '{*1혼돈 차원문}(Chaos Portal)'
    }
    assert_equal expected.keys.sort, C::OPAQUE_LABELS.keys.sort

    expected.each do |key, annotated_token|
      review = by_key.fetch(key)
      assert_includes review.fetch('new'), annotated_token, key.inspect
      assert_equal review.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   review.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE),
                   key.inspect
      assert_includes review.fetch('evidence'), 'outside its closing delimiter'
    end

    realm_heading = by_key.fetch(['default', '12596', ''])
    assert_includes realm_heading.fetch('english'), '{*1Chaos Realm}'
    assert_includes realm_heading.fetch('japanese'), '{*1混沌の領域}'
    assert_includes realm_heading.fetch('chinese'), '{*1混乱世界}'

    dungeon_label = by_key.fetch(['default', '56572', ''])
    assert_includes dungeon_label.fetch('english'), '{*1Chaos realm dungeons}'
    assert_includes dungeon_label.fetch('japanese'), '{*1混沌の領域ダンジョン}'
    assert_includes dungeon_label.fetch('chinese'), '{*1混乱世界地牢}'

    portal_label = by_key.fetch(['default', '63316', ''])
    assert_includes portal_label.fetch('english'), '{*1Chaos Portal}'
    assert_includes portal_label.fetch('japanese'), '{*1混沌のポータル}'
    assert_includes portal_label.fetch('chinese'), '{*1Chaos Portal}'
  end

  def test_normalization_preserves_opaque_tokens_line_breaks_and_unrelated_rifts
    reviews.each do |review|
      assert_equal review.fetch('old').scan(/\r\n|\r|\n/),
                   review.fetch('new').scan(/\r\n|\r|\n/), M.key(review).inspect
      assert_equal review.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   review.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE),
                   M.key(review).inspect
      assert_equal review.fetch('old').scan(/혼돈(?:의)? 균열/),
                   review.fetch('new').scan(/혼돈(?:의)? 균열/), M.key(review).inspect
    end

    tutorial = row('default', '12596')
    assert_includes tutorial.fetch('new'), '{*1혼돈의 영역}(Chaos Realm)'
    assert_includes tutorial.fetch('new'), C::REALM_KO
    assert_includes tutorial.fetch('new'), C::PORTAL_KO

    rifts_and_portal = row('default', '16239')
    assert_includes rifts_and_portal.fetch('english'), 'Chaos Rifts'
    assert_includes rifts_and_portal.fetch('new'), '혼돈 균열'
    refute_includes rifts_and_portal.fetch('new'), '혼돈 균열(Chaos Portal)'

    refute_match(/\([^)]*\(/, reviews.map { |review| review.fetch('new') }.join("\n"))
  end

  def test_open_closed_and_plural_labels_keep_their_attributes
    open = row('default', '12176')
    assert_equal '혼돈의 차원문(열림)',
                 open.fetch('old')
    assert_equal '혼돈 차원문(Chaos Portal)(열림)',
                 open.fetch('new')
    assert_includes open.fetch('english'), 'Chaos Portal (Open)'

    closed = row('default', '40015')
    assert_equal '혼돈 차원문(Chaos Portal) (닫힘)',
                 closed.fetch('new')
    assert_includes closed.fetch('english'), 'Chaos Portal (Closed)'

    plural_closed = row('default', '48089')
    assert_equal '혼돈 차원문(Chaos Portals) 폐쇄',
                 plural_closed.fetch('new')
    assert_includes plural_closed.fetch('english'), 'Chaos Portals Closed'
  end

  def test_same_row_short_portal_references_are_local_and_scoped
    assert_equal %w[16239 52731 59489 63316 64450],
                 C::SHORT_PORTAL_REFERENCES.keys.map { |key| key[1] }.sort
    assert_includes row('default', '16239').fetch('new'),
                    '차원문(Portals)을 닫아 둡니다'
    assert_includes row('default', '52731').fetch('new'),
                    '열린 차원문(Portal)으로 들어가'
    assert_includes row('default', '59489').fetch('new'),
                    '차원문(Portal)에 들어가'
    assert_includes row('default', '64450').fetch('new'),
                    '차원문(Portals)을 보거나'

    full_name_only = row('default', '3102')
    assert_includes full_name_only.fetch('english'), 'Chaos Portal'
    refute_includes full_name_only.fetch('new'), '차원문(Portal)'
  end

  def test_source_local_short_reference_fixture_requires_english_context
    source = {
      'resource' => 'default', 'ID_Linha' => '59489', 'Tipo_Variante' => '',
      'en_texts_json' => JSON.generate(['The Chaos Portal is shut. Enter the Portal.']),
      'ja_texts_json' => JSON.generate(['混沌のポータルは閉じている。ポータルに入れ。']),
      'zh_text' => '混乱传送门关闭了。进入传送门。',
      'work_text' => '혼돈의 차원문이 닫혀 있다. 차원문에 들어가.'
    }
    match = [{ 'entity_key' => C::PORTAL, 'matched_english' => C::PORTAL_EN }]
    result = C.review_source(source, match)
    assert_equal '혼돈 차원문(Chaos Portal)이 닫혀 있다. 차원문(Portal)에 들어가.',
                 result.fetch('new')

    source['en_texts_json'] = JSON.generate(['The Chaos Portal is shut.'])
    assert_raises(RuntimeError) { C.review_source(source, match) }
  end

  def test_matcher_does_not_create_realm_portal_or_rift_short_aliases
    matcher = build_matchers(definitions)
    assert_equal [C::REALM], candidate_matches(['Chaos Realm'], matcher).keys
    assert_equal [C::PORTAL], candidate_matches(['Chaos Portals'], matcher).keys
    assert_equal [C::PORTAL], candidate_matches(['Chaos Portal'], matcher).keys
    assert_empty candidate_matches(['Realm', 'Portal', 'Portals', 'Chaos Rift'], matcher)
  end

  def test_new_entities_are_absent_before_apply_and_exact_after_registration
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    definitions_present = glossary.select do |entry|
      [C::REALM, C::PORTAL].include?(entry.fetch('entity_key'))
    end
    occurrences = index.select do |entry|
      [C::REALM, C::PORTAL].include?(entry.fetch('entity_key'))
    end

    if self.class.applied_checkpoint?
      assert_equal [C::REALM, C::PORTAL].sort,
                   definitions_present.map { |entry| entry.fetch('entity_key') }.sort
      assert_equal C.expected_pairs.sort,
                   occurrences.map { |entry| [entry.fetch('entity_key'), *M.key(entry)] }.sort
    else
      assert_empty definitions_present
      assert_empty occurrences
    end
  end
end
