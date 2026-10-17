#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-chaos-materials-D21521'

class ChaosMaterialsD21521Test < Minitest::Test
  W = ChaosMaterialsD21521
  M = ReviewedNameBatches

  def self.dataset
    @dataset ||= begin
      definitions_exist = File.file?(W::DEFINITIONS)
      reviews_exist = File.file?(W::REVIEWS)
      raise 'only one saved D21521 artifact exists' unless definitions_exist == reviews_exist
      if definitions_exist
        [
          M.table(W::DEFINITIONS).map(&:to_h),
          M.table(W::REVIEWS).map(&:to_h),
          true
        ]
      else
        paths = M::RESOURCES.map { |resource| M.csv_path(resource) } + M::DOCS + [
          M::INDEX, M::INVENTORY, ReviewedProperNameDiscovery::GLOSSARY,
          ReviewedProperNameDiscovery::DISCOVERY_CANDIDATES,
          W::DEFINITIONS, W::REVIEWS
        ]
        before = paths.to_h do |path|
          [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
        end
        no_write = ->(*) { raise 'read-only prepare called a writer/apply/refresh' }
        result = nil
        M.stub(:refresh_inventory, no_write) do
          M.stub(:write_table, no_write) do
            ReviewedProperNameDiscovery.stub(:run, no_write) do
              ProperNameCellEditor.stub(:apply, no_write) do
                File.stub(:write, no_write) do
                  File.stub(:binwrite, no_write) do
                    _headers, definitions, reviews = W.prepare
                    result = [definitions, reviews, false]
                  end
                end
              end
            end
          end
        end
        after = paths.to_h do |path|
          [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
        end
        raise 'D21521 test setup changed protected files' unless before == after
        result
      end
    end
  end

  def definitions
    self.class.dataset.fetch(0)
  end

  def reviews
    self.class.dataset.fetch(1)
  end

  def applied_manifest?
    self.class.dataset.fetch(2)
  end

  def inventory
    @inventory ||= W.load_inventory
  end

  def by_key
    @by_key ||= reviews.to_h { |row| [M.key(row), row] }
  end

  def test_exact_entities_scopes_overlaps_and_edit_counts
    assert_equal 8, definitions.length
    actual_pairs = reviews.flat_map do |row|
      row.fetch('entity_key').split('|').map { |entity| [entity, *M.key(row)] }
    end
    assert_equal W.expected_pairs.sort, actual_pairs.sort
    assert_equal 32, reviews.length
    assert_equal 41, reviews.sum { |row| row.fetch('entity_key').split('|').length }
    assert_equal 31, reviews.count { |row| row.fetch('old') != row.fetch('new') }
    assert_equal 1, reviews.count { |row| row.fetch('old') == row.fetch('new') }
    assert_equal [['default', '27503', '']],
                 reviews.select { |row| row.fetch('old') == row.fetch('new') }.map { |row| M.key(row) }

    counts = W.expected_pairs.group_by(&:first).transform_values(&:length)
    assert_equal 14, counts.fetch(W::MATTER)
    assert_equal 1, counts.fetch(W::DELIVERY)
    assert_equal 11, counts.fetch(W::FLAME)
    assert_equal 3, W::FLAME_ITEMS.length
    assert_equal 4, counts.fetch(W::CORE)
    assert_equal 8, counts.fetch(W::WEAPON_CORE)
    assert_equal ['resource:chaos-matter', 'title:chaos-matter-delivery'],
                 row('default', '15427').fetch('entity_key').split('|').sort
    assert_equal ['item:chaos-flame-disc', W::FLAME].sort,
                 row('base', '559', '11').fetch('entity_key').split('|').sort
    assert_equal [W::CORE, W::FLAME].sort,
                 row('default', '56572').fetch('entity_key').split('|').sort
  end

  def test_aligned_english_japanese_and_chinese_evidence
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    W.expected_pairs.each do |entity, *key|
      W.validate_source_evidence!(inventory.fetch(key), entity)
    end
    reviews.each do |review|
      source = inventory.fetch(M.key(review))
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      assert_equal english, review.fetch('english')
      assert_equal japanese, review.fetch('japanese')
      assert_equal source.fetch('zh_text'), review.fetch('chinese')
    end
    assert_includes by_key.fetch(['default', '55085', '']).fetch('english'),
                    'Chaos weapon core components'
    refute_match(/Chaos Matter/, by_key.fetch(['default', '55085', '']).fetch('english'))
    assert_includes by_key.fetch(['default', '63443', '']).fetch('english'), '{*1Chaos Matter}'
  end

  def test_only_scoped_names_change_and_markers_breaks_and_numbers_survive
    reviews.each do |review|
      key = M.key(review)
      entities = review.fetch('entity_key').split('|')
      assert_equal W.normalize(review.fetch('old'), key, entities), review.fetch('new'), key.inspect
      assert_equal review.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   review.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE), key.inspect
      assert_equal review.fetch('old').scan(/\r\n|\r|\n/),
                   review.fetch('new').scan(/\r\n|\r|\n/), key.inspect
      assert_equal review.fetch('old').scan(/\d+/), review.fetch('new').scan(/\d+/), key.inspect
      assert_equal entities.sort,
                   JSON.parse(review.fetch('entity_dispositions_json')).keys.sort, key.inspect
      refute_match(/\([^)]*\(/, review.fetch('new'), key.inspect)
      W.expected_labels(key).group_by(&:itself).each do |label, occurrences|
        assert_equal occurrences.length, review.fetch('new').scan("(#{label})").length,
                     "#{key.inspect}: #{label}"
      end
    end

    assert_equal '혼돈의 화염 원반(Chaos Flame Disc)', row('base', '559', '11').fetch('new')
    assert_equal '혼돈의 화염 막대(Chaos Flame Rod)', row('base', '1036', '11').fetch('new')
    assert_equal '혼돈의 화염 다월(Chaos Flame Dowel)', row('base', '1276', '11').fetch('new')
    assert_includes row('default', '49092').fetch('new'), '마법의 혼돈 불꽃(Chaos Flame)'
    assert_includes row('default', '15427').fetch('new'), '혼돈 물질 배달(Chaos Matter Delivery)'
    refute_includes row('default', '15427').fetch('new'), '혼돈 물질(Chaos Matter)'
    refute_includes row('base', '559', '11').fetch('new'), '혼돈의 불꽃(Chaos Flame)'
    assert_includes row('default', '63443').fetch('new'), '{*1혼돈 물질}(Chaos Matter)'
    assert_includes row('default', '63443').fetch('new'), '{*1혼돈 무기 핵}(Chaos Weapon Cores)'
  end

  def test_no_broad_aliases_and_atomic_overlap_dispositions
    matcher = build_matchers(definitions)
    ['Matter', 'Flame', 'Core', 'Weapon Core', 'Chaos', 'Chaos Realm'].each do |term|
      assert_empty candidate_matches([term], matcher)
    end
    assert_equal [W::MATTER, W::DELIVERY].sort,
                 candidate_matches(['Chaos Matter Delivery'], matcher).keys.sort
    assert_equal [W::FLAME, 'item:chaos-flame-dowel'].sort,
                 candidate_matches(['Chaos Flame Dowel'], matcher).keys.sort

    delivery = row('default', '15427')
    delivery_dispositions = JSON.parse(delivery.fetch('entity_dispositions_json'))
    assert_equal 'excluded', delivery_dispositions.fetch(W::MATTER)
    assert_equal 'accepted', delivery_dispositions.fetch(W::DELIVERY)
    W::FLAME_ITEMS.each_key do |item|
      item_row = reviews.find { |review| review.fetch('entity_key').split('|').include?(item) }
      dispositions = JSON.parse(item_row.fetch('entity_dispositions_json'))
      assert_equal 'excluded', dispositions.fetch(W::FLAME)
      assert_equal 'accepted', dispositions.fetch(item)
    end
    assert_equal 'not-an-issue', row('default', '27503').fetch('status')
  end

  def test_normalized_rows_are_idempotent
    reviews.each do |review|
      source = inventory.fetch(M.key(review)).merge('work_text' => review.fetch('new'))
      repeated = W.review_source(source, review.fetch('entity_key').split('|'))
      assert_equal review.fetch('new'), repeated.fetch('new'), M.key(review).inspect
      assert_equal 'not-an-issue', repeated.fetch('status'), M.key(review).inspect
    end
  end

  def test_saved_post_apply_checks_only_target_spans_not_historical_cells
    return unless applied_manifest?

    indexed = M.table(M::INDEX).map(&:to_h).to_h do |entry|
      [[entry.fetch('entity_key'), *M.key(entry)], entry]
    end
    current = inventory
    W.expected_pairs.each do |entity, *key|
      assert indexed.key?([entity, *key]), [entity, *key].inspect
    end
    reviews.each do |review|
      key = M.key(review)
      active_text = current.fetch(key).fetch('work_text')
      W.expected_labels(key).group_by(&:itself).each do |label, occurrences|
        assert_equal occurrences.length, active_text.scan("(#{label})").length,
                     "#{key.inspect}: #{label}"
      end
      assert_equal review.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE),
                   active_text.scan(ReviewedProperNameDiscovery::OPAQUE), key.inspect
      refute_match(/\([^)]*\(/, active_text, key.inspect)
    end
  end

  def row(resource, id, variant = '')
    reviews.find { |review| M.key(review) == [resource, id, variant] } ||
      raise("missing D21521 review row #{[resource, id, variant].inspect}")
  end
end
