#!/usr/bin/env ruby

require 'minitest/autorun'
require 'rbconfig'
require_relative 'review-laz-prime-circle-D21516'

class LazPrimeCircleD21516Test < Minitest::Test
  W = LazPrimeCircleD21516
  M = ReviewedNameBatches
  ENTITY_COUNTS = {
    'creature:laz' => 35,
    'creature:sons-of-laz' => 12,
    'item:laz-remains' => 3,
    'title:lazs-kiss' => 1,
    'organization:prime-circle' => 2
  }.freeze

  def self.prepared
    @prepared ||= begin
      paths = M::RESOURCES.map { |resource| M.csv_path(resource) } +
        M::DOCS + [M::INDEX, ReviewedProperNameDiscovery::GLOSSARY,
                   File.join(__dir__, 'proper-name-source-inventory.tsv')]
      before = paths.to_h do |path|
        [path, File.exist?(path) ? Digest::SHA256.file(path).hexdigest : :missing]
      end
      reject_write = ->(*) { raise 'prepare attempted a write, refresh, or apply' }
      result = M.stub(:refresh_inventory, reject_write) do
        M.stub(:write_table, reject_write) do
          M.stub(:run, reject_write) do
            ReviewedProperNameDiscovery.stub(:run, reject_write) do
              W.prepare
            end
          end
        end
      end
      after = paths.to_h do |path|
        [path, File.exist?(path) ? Digest::SHA256.file(path).hexdigest : :missing]
      end
      raise 'prepare changed protected files' unless before == after
      result
    end
  end

  def headers
    self.class.prepared.fetch(0)
  end

  def definitions
    self.class.prepared.fetch(1)
  end

  def reviews
    self.class.prepared.fetch(2)
  end

  def generated
    self.class.prepared.fetch(3)
  end

  def by_key
    reviews.to_h { |row| [M.key(row), row] }
  end

  def test_exact_distinct_rows_and_entity_scope
    assert_equal 37, W.all_source_keys.length
    assert_equal 37, reviews.length
    assert_equal 53, generated.length
    assert_equal W.expected_pairs.sort,
                 generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    assert_equal ENTITY_COUNTS,
                 generated.group_by { |row| row.fetch('entity_key') }
                          .transform_values(&:length)
    assert_equal W::LAZ_SOURCE_KEYS.sort,
                 W.rows_for_entity(W.active_inventory.values, definitions.find do |row|
                   row.fetch('entity_key') == 'creature:laz'
                 end).map { |row| M.key(row) }.sort
    assert_equal 19, W::LAZ_SOURCE_KEYS.length -
                     W::LAZ_NESTED_EXCLUSIONS.length -
                     W::POEM_EXCLUSIONS.length
    W::LAZ_NESTED_EXCLUSIONS.each do |source_key|
      disposition = JSON.parse(by_key.fetch(source_key).fetch('entity_dispositions_json'))
      assert_equal 'excluded', disposition.fetch('creature:laz'), source_key.inspect
      assert_equal by_key.fetch(source_key).fetch('old'),
                   W.transform_entity('creature:laz', source_key,
                                      by_key.fetch(source_key).fetch('old')).first,
                   source_key.inspect
    end
    assert_equal by_key.fetch(['default', '5017', '']).fetch('old'),
                 by_key.fetch(['default', '5017', '']).fetch('new')
    assert_equal W.expected_edit_keys.sort,
                 reviews.select { |row| row.fetch('old') != row.fetch('new') }
                        .map { |row| M.key(row) }.sort
    assert_equal 26, reviews.count { |row| row.fetch('old') != row.fetch('new') }
    assert_equal 9, reviews.count { |row| row.fetch('status') == 'not-an-issue' }
    assert_equal 1, reviews.count { |row| row.fetch('status') == 'uncertain' }
    assert_equal 1, reviews.count { |row| row.fetch('status') == 'excluded' }
    assert_equal [37], reviews.each_slice(50).map(&:length)
  end

  def test_canonicals_alias_and_complete_item_labels
    by_entity = definitions.to_h { |row| [row.fetch('entity_key'), row] }
    assert_equal ['Laz', 'creature', '라즈(Laz)', ''],
                 by_entity.fetch('creature:laz').values_at(
                   'english_canonical', 'category', 'korean_canonical', 'english_aliases'
                 )
    sons = by_entity.fetch('creature:sons-of-laz')
    assert_equal '라즈의 자손(Sons of Laz)', sons.fetch('korean_canonical')
    assert_equal 'Son of Laz', sons.fetch('english_aliases')
    assert_equal ['Laz Remains', 'item', '라즈의 유해(Laz Remains)'],
                 by_entity.fetch('item:laz-remains').values_at(
                   'english_canonical', 'category', 'korean_canonical'
                 )
    kiss = by_entity.fetch('title:lazs-kiss')
    assert_equal ['Laz\'s Kiss', 'title', '라즈의 입맞춤(Laz\'s Kiss)'],
                 kiss.values_at('english_canonical', 'category', 'korean_canonical')
    assert_includes kiss.fetch('notes'), 'identity and medium are unknown'
    assert_equal ['Prime Circle', 'organization', '프라임 서클(Prime Circle)'],
                 by_entity.fetch('organization:prime-circle').values_at(
                   'english_canonical', 'category', 'korean_canonical'
                 )
    assert_equal '', by_entity.fetch('organization:prime-circle').fetch('english_aliases')

    remains = reviews.select do |row|
      JSON.parse(row.fetch('entity_dispositions_json')).key?('item:laz-remains')
    end
    assert_equal 3, remains.length
    remains.each do |row|
      assert_includes row.fetch('new'), '라즈의 유해(Laz Remains)'
      refute_includes row.fetch('new'), '라즈(Laz)의 유해(Laz Remains)'
    end
    assert_includes by_key.fetch(['default', '62160', '']).fetch('new'),
                    '라즈의 자손(Son of Laz)'
    assert_includes by_key.fetch(['default', '10066', '']).fetch('new'),
                    "라즈의 입맞춤(Laz's Kiss)"
  end

  def test_poem_and_prior_holds_are_preserved_as_new_scope_dispositions
    poem = by_key.fetch(['default', '35979', ''])
    assert_equal poem.fetch('old'), poem.fetch('new')
    assert_equal 'uncertain', poem.fetch('status')
    assert_equal(
      { 'creature:laz' => 'excluded', 'creature:sons-of-laz' => 'uncertain' },
      JSON.parse(poem.fetch('entity_dispositions_json'))
    )

    brothers = by_key.fetch(['default', '63456', ''])
    assert_equal brothers.fetch('old'), brothers.fetch('new')
    assert_equal 'excluded', brothers.fetch('status')
    assert_equal({ 'creature:laz' => 'excluded' },
                 JSON.parse(brothers.fetch('entity_dispositions_json')))
    assert_includes poem.fetch('english'), 'Laz and Raz'
    assert_includes brothers.fetch('english'), 'Laz and Raz'

    both = by_key.fetch(['default', '62424', ''])
    assert_equal(
      { 'creature:laz' => 'accepted', 'creature:sons-of-laz' => 'accepted' },
      JSON.parse(both.fetch('entity_dispositions_json'))
    )
    assert_includes both.fetch('new'), '라즈(Laz)가'
    assert_includes both.fetch('new'), '라즈의 자손(Sons of Laz)'

    assert_includes by_key.fetch(['default', '180', '']).fetch('evidence'), 'D-19571'
    assert_includes by_key.fetch(['default', '35430', '']).fetch('evidence'), 'D-19829'
    assert_includes by_key.fetch(['default', '10066', '']).fetch('evidence'), 'D-2889'
    assert_includes by_key.fetch(['default', '45901', '']).fetch('evidence'), 'existing narrative hold'
    assert_includes by_key.fetch(['default', '46617', '']).fetch('evidence'), 'faction-identity hold'
  end

  def test_every_review_carries_aligned_locale_evidence
    inventory = W.active_inventory
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.each do |row|
      assert_equal inventory.fetch(M.key(row)).fetch('zh_text'), row.fetch('chinese')
      assert_includes row.fetch('english'), row.fetch('entity_key').include?('prime-circle') ?
        'Prime Circle' : 'Laz'
      refute_empty row.fetch('japanese')
      refute_empty row.fetch('chinese')
    end
    assert_includes by_key.fetch(['default', '31593', '']).fetch('japanese'), 'プライム・サークル'
    assert_includes by_key.fetch(['default', '31593', '']).fetch('chinese'), '起始之环'
    assert_includes by_key.fetch(['default', '45901', '']).fetch('japanese'), 'ラズ・ソルジャー'
    assert_includes by_key.fetch(['default', '45901', '']).fetch('chinese'), '拉兹之子'
  end

  def test_particles_name_only_changes_and_idempotency
    assert_equal '라즈(Laz)가', W.transform_entity(
      'creature:laz', ['default', '62424', ''], '라즈가'
    ).first
    assert_equal '라즈의 자손(Sons of Laz)을', W.transform_entity(
      'creature:sons-of-laz', ['default', '35430', ''], '라즈의 아들들을'
    ).first
    assert_equal '라즈의 자손(Sons of Laz)이란', W.transform_entity(
      'creature:sons-of-laz', ['default', '44124', ''], '라즈의 자손이란'
    ).first

    reviews.each do |row|
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/),
                   row.fetch('new').scan(/\r\n|\r|\n/)
      assert_equal row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE)
      entities = row.fetch('entity_key').split('|')
      assert_equal W.skeleton(row.fetch('old'), M.key(row), entities),
                   W.skeleton(row.fetch('new'), M.key(row), entities)
      normalized = entities.reduce(row.fetch('new')) do |text, entity|
        W.transform_entity(entity, M.key(row), text).first
      end
      assert_equal row.fetch('new'), normalized
      refute_match(/\([^()]*\(/, row.fetch('new'))
    end
  end

  def test_scope_and_language_guards_fail_closed
    W.validate_scope!(generated)
    assert_raises(RuntimeError) { W.validate_scope!(generated.drop(1)) }
    assert_raises(RuntimeError) { W.validate_scope!(generated + [generated.first]) }

    inventory = W.active_inventory
    poisoned = inventory.dup
    key = ['default', '31593', '']
    poisoned[key] = poisoned.fetch(key).merge(
      'ja_texts_json' => JSON.generate(['別の組織'])
    )
    assert_raises(RuntimeError) { W.reviews_for(poisoned, generated) }
  end

  def test_prior_records_survive_simulated_post_apply_snapshot
    prior = [
      ['monster:faer-gorta', ['default', '180', ''], 'accepted'],
      ['monster:faer-gorta', ['default', '60198', ''], 'not-an-issue'],
      ['construct:well-of-souls', ['default', '62424', ''], 'accepted']
    ].map do |entity, source_key, status|
      {
        'entity_key' => entity, 'resource' => source_key[0],
        'ID_Linha' => source_key[1], 'Tipo_Variante' => source_key[2],
        'status' => status, 'evidence' => 'prior decision', 'korean_current' => 'old'
      }
    end
    before = W.prior_records(prior)
    additions = generated.map do |occurrence|
      {
        'entity_key' => occurrence.fetch('entity_key'),
        'resource' => occurrence.fetch('resource'),
        'ID_Linha' => occurrence.fetch('ID_Linha'),
        'Tipo_Variante' => occurrence.fetch('Tipo_Variante'),
        'status' => 'needs-context', 'evidence' => 'new scope',
        'korean_current' => occurrence.fetch('korean_current')
      }
    end
    W.verify_prior_records!(before, prior + additions)
    altered = Marshal.load(Marshal.dump(prior + additions))
    altered.first['status'] = 'uncertain'
    assert_raises(RuntimeError) { W.verify_prior_records!(before, altered) }
    assert_raises(RuntimeError) { W.verify_prior_records!(before, prior + additions.drop(1)) }
  end

  def test_definitions_and_prepare_cli_are_available_without_apply
    assert_equal 5, definitions.length
    assert W.respond_to?(:apply)
    assert_equal 37, reviews.map { |row| M.key(row) }.uniq.length
    path = File.join(__dir__, 'review-laz-prime-circle-D21516.rb')
    _stdout, stderr, status = Open3.capture3(RbConfig.ruby, path, 'invalid-mode')
    refute status.success?
    assert_includes stderr, 'usage:'
  end
end
