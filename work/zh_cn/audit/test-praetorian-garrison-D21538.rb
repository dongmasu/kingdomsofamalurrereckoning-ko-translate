#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-praetorian-garrison-D21538'

class PraetorianGarrisonD21538Test < Minitest::Test
  W = PraetorianGarrisonD21538
  M = ReviewedNameBatches

  def self.prepared
    @prepared ||= begin
      paths = M::RESOURCES.map { |resource| M.csv_path(resource) } +
        M::DOCS + [
          M::INDEX, M::INVENTORY, ReviewedProperNameDiscovery::GLOSSARY,
          W::DEFINITIONS, W::REVIEWS
        ]
      before = paths.to_h do |path|
        [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : :absent]
      end
      reject_write = ->(*) { raise 'prepare called a shared writer or inventory refresher' }
      result = M.stub(:refresh_inventory, reject_write) do
        M.stub(:write_table, reject_write) do
          ReviewedProperNameDiscovery.stub(:run, reject_write) { W.prepare }
        end
      end
      after = paths.to_h do |path|
        [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : :absent]
      end
      raise 'prepare changed protected files' unless before == after
      result
    end
  end

  def reviews
    self.class.prepared[2]
  end

  def by_key
    reviews.to_h { |row| [M.key(row).join(':'), row] }
  end

  def test_exact_scope_counts_and_new_identity_key_preserves_prior_verdict
    _, definitions, rows = self.class.prepared
    assert_equal W.expected_pairs.sort,
                 rows.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    assert_equal 10, rows.length
    assert_equal 9, rows.count { |row| row.fetch('old') != row.fetch('new') }
    assert_equal 1, rows.count { |row| row.fetch('status') == 'not-an-issue' }
    assert_equal 9, rows.count { |row| row.fetch('status') == 'accepted' }
    assert_equal ['base', '948', '11'], M.key(rows.first)

    definition = definitions.fetch(0)
    assert_equal 'place:praetorian-garrison', definition.fetch('entity_key')
    assert_equal 'Praetorian Garrison', definition.fetch('english_canonical')
    assert_equal 'place', definition.fetch('category')
    assert_equal W::CANONICAL, definition.fetch('korean_canonical')
    assert_equal '', definition.fetch('english_aliases')
    assert_includes definition.fetch('notes'), 'Crownhold Garrison is a distinct location.'
    assert_includes definition.fetch('notes'), 'D-17526 translation verdict'

    new_identity = by_key.fetch('default:58091:')
    assert_equal 'accepted', new_identity.fetch('status')
    assert_equal '근위대 주둔지', new_identity.fetch('old')
    assert_equal W::CANONICAL, new_identity.fetch('new')
    assert_includes new_identity.fetch('evidence'), 'preserve the prior D-17526 translation verdict and tally unchanged'
    assert W.respond_to?(:apply)
  end

  def test_full_name_replacements_are_row_specific
    reviews.each do |row|
      tag = M.key(row).join(':')
      expected = row.fetch('old')
      full_old, full_new = W::FULL_KOREAN_SPANS.fetch(tag)
      assert_equal 1, expected.scan(Regexp.new(Regexp.escape(full_old))).length, tag
      expected = expected.sub(full_old, full_new)
      W::SHORT_REFERENCE_SPANS.fetch(tag, []).each do |short_old, short_new|
        assert_equal 1, expected.scan(Regexp.new(Regexp.escape(short_old))).length, tag
        expected = expected.sub(short_old, short_new)
      end
      assert_equal expected, row.fetch('new'), tag
      assert_equal 1, row.fetch('english').scan(W::SOURCE_NAME).length, tag
      assert_equal({ W::ENTITY => row.fetch('status') },
                   JSON.parse(row.fetch('entity_dispositions_json')))
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/),
                   row.fetch('new').scan(/\r\n|\r|\n/), tag
      assert_equal row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE), tag
    end
  end

  def test_same_row_short_references_and_generic_terms_stay_bounded
    row = by_key.fetch('default:4814:')
    assert_equal 3, row.fetch('english').scan(/(?<![A-Za-z])Garrison(?![A-Za-z])/i).length
    assert_includes row.fetch('new'), '주둔군(Garrison)은'
    assert_includes row.fetch('new'), '주둔지(Garrison) 작업을 마친 뒤'

    matcher = build_matchers(self.class.prepared[1])
    ['Praetorian', 'Praetorians', 'Garrison', 'the Garrison',
     'Praetorian Guard', 'Crownhold Garrison'].each do |english|
      assert_empty candidate_matches([english], matcher), english
    end
    assert_equal [W::ENTITY],
                 candidate_matches(['Praetorian Garrison'], matcher).keys
    refute_includes W.expected_pairs, [W::ENTITY, 'default', '54067', '']
    refute_includes W.expected_pairs, [W::ENTITY, 'default', '62281', '']
  end

  def test_every_row_has_aligned_english_japanese_chinese_support
    reviews.each do |row|
      tag = M.key(row).join(':')
      assert_equal 1, row.fetch('english').scan(W::SOURCE_NAME).length, tag
      assert_includes row.fetch('japanese'), W::JA_SUPPORT.fetch(tag), tag
      assert_includes row.fetch('chinese'), W::ZH_SUPPORT.fetch(tag), tag
    end
  end

  def test_unrelated_indexed_entities_are_not_reopened
    index = M.table(M::INDEX).map(&:to_h)
    prior = index.select do |row|
      W.expected_pairs.any? { |_entity, *key| M.key(row) == key }
    end
    assert prior.any? { |row| row.fetch('entity_key') == 'place:adessa' }
    assert prior.all? { |row| row.fetch('entity_key') != W::ENTITY }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    refute glossary.any? { |row| row.fetch('entity_key') == W::ENTITY }
  end
end
