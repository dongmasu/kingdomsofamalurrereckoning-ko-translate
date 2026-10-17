#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-summers-end-gorhart-inn-D21518'

class SummersEndGorhartInnD21518Test < Minitest::Test
  W = SummersEndGorhartInnD21518
  M = ReviewedNameBatches

  def self.plan
    @plan ||= if File.file?(W::DEFINITIONS) || File.file?(W::REVIEWS)
                raise 'incomplete saved Summer/Inn plan' unless File.file?(W::DEFINITIONS) && File.file?(W::REVIEWS)
                [M.table(W::DEFINITIONS).headers, M.table(W::DEFINITIONS).map(&:to_h),
                 M.table(W::REVIEWS).map(&:to_h)]
              else
                paths = M::RESOURCES.flat_map do |resource|
                  %w[en_us ja_jp zh_cn work].map { |locale| inventory_paths(M::ROOT, locale, resource) }
                end + M::DOCS + [
                  M::INVENTORY, M::INDEX, ReviewedProperNameDiscovery::GLOSSARY,
                  ReviewedProperNameDiscovery::DISCOVERY_CANDIDATES, W::DEFINITIONS, W::REVIEWS
                ]
                snapshot = lambda do
                  paths.to_h { |path| [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil] }
                end
                before = snapshot.call
                no_write = ->(*) { raise 'prepare attempted shared write, refresh or apply' }
                result = M.stub(:refresh_inventory, no_write) do
                  M.stub(:write_table, no_write) do
                    ReviewedProperNameDiscovery.stub(:run, no_write) do
                      ProperNameCellEditor.stub(:apply, no_write) do
                        File.stub(:write, no_write) do
                          File.stub(:binwrite, no_write) { W.prepare }
                        end
                      end
                    end
                  end
                end
                raise 'prepare changed protected files' unless before == snapshot.call
                result
              end
  end

  def rows
    self.class.plan.fetch(2)
  end

  def row(id)
    rows.find { |review| review.fetch('ID_Linha') == id } || raise("missing review #{id}")
  end

  def aligned(review, text = review.fetch('old'))
    {
      'resource' => review['resource'], 'ID_Linha' => review['ID_Linha'],
      'Tipo_Variante' => review['Tipo_Variante'], 'work_text' => text,
      'en_texts_json' => JSON.generate([review.fetch('english')]),
      'ja_texts_json' => JSON.generate([review.fetch('japanese')]), 'zh_text' => review.fetch('chinese')
    }
  end

  def test_complete_exact_scope_categories_and_dispositions
    _, definitions, reviews = self.class.plan
    assert_equal 5, definitions.length
    assert definitions.all? { |definition| definition.fetch('english_aliases').empty? }
    assert_equal W::NAMES.keys.sort, definitions.map { |definition| definition.fetch('entity_key') }.sort
    definitions.each do |definition|
      name = W::NAMES.fetch(definition.fetch('entity_key'))
      assert_equal name.fetch(1), definition.fetch('korean_canonical')
      assert_equal name.fetch(2), definition.fetch('category')
    end
    pairs = reviews.flat_map do |review|
      JSON.parse(review.fetch('entity_dispositions_json')).keys.map { |entity| [entity, *M.key(review)] }
    end
    assert_equal 22, reviews.length
    assert_equal 22, reviews.map { |review| M.key(review) }.uniq.length
    assert_equal 25, pairs.length
    assert_equal W.expected_pairs.sort, pairs.sort
    assert_equal({ 'base' => 3, 'default' => 19 }, reviews.group_by { |r| r['resource'] }.transform_values(&:length))
    assert_equal 17, reviews.count { |review| review['old'] != review['new'] }
    assert_equal 5, reviews.count { |review| review['status'] == 'not-an-issue' }
    assert_equal 3, reviews.sum { |review| JSON.parse(review['entity_dispositions_json']).values.count('excluded') }
  end

  def test_source_evidence_active_csv_and_idempotency
    inventory = W.load_inventory
    ReviewedProperNameDiscovery.validate_sources!(rows, inventory)
    applied = File.file?(File.join(__dir__, "proper-name-edits-D#{W::D}.tsv"))
    rows.each do |review|
      assert_equal review.fetch(applied ? 'new' : 'old'), inventory.fetch(M.key(review)).fetch('work_text')
      entities = review.fetch('entity_key').split('|')
      assert_equal review.fetch('new'), W.review_source(aligned(review), entities).fetch('new')
      repeated = W.review_source(aligned(review, review.fetch('new')), entities)
      assert_equal review.fetch('new'), repeated.fetch('new')
      assert_equal 'not-an-issue', repeated.fetch('status')
      assert_equal review['old'].scan(/\r\n|\r|\n/), review['new'].scan(/\r\n|\r|\n/)
      assert_equal review['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                   review['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
      refute_match(/\([^)]*\(/, review.fetch('new'))
    end
  end

  def test_all_changes_are_only_exact_reviewed_name_spans
    rows.each do |review|
      key = M.key(review)
      if (entity = W::COMPOUNDS[key])
        assert_equal W::NAMES.fetch(entity).fetch(1), review.fetch('new')
        assert_equal({ W::SUMMER => 'excluded', entity => 'accepted' },
                     JSON.parse(review.fetch('entity_dispositions_json')))
      elsif review['entity_key'] == W::INN
        assert_equal review['old'].sub('고어하트(Gorhart) 여관', '고어하트 여관(Gorhart Inn)'), review['new']
      elsif review['ID_Linha'] == '64294'
        assert_equal review['old'].sub('여름의 끝을', "서머스 엔드(Summer's End)를"), review['new']
      elsif review['old'].include?("서머스 엔드(Summer's End)")
        assert_equal review['old'], review['new']
      else
        from = review['old'].include?('여름의 끝') ? '여름의 끝' : '서머스 엔드'
        assert_equal review['old'].sub(from, "서머스 엔드(Summer's End)"), review['new']
      end
    end
  end

  def test_poems_remain_separate_and_particle_is_correct
    assert_equal 'not-an-issue', row('63500').fetch('status')
    assert_equal row('63500').fetch('old'), row('63500').fetch('new')
    assert_includes row('63500').fetch('new'), "서머스 엔드(Summer's End)를 몰래 지나\r\n"
    assert_includes row('64294').fetch('new'), "서머스 엔드(Summer's End)를 몰래 지나갔네.\r\n"
    refute_equal row('63500').fetch('new'), row('64294').fetch('new')
    refute_includes row('64294').fetch('new'), "서머스 엔드(Summer's End)을"
    assert_equal row('63500').fetch('english'), row('64294').fetch('english')
  end

  def test_atomic_titles_and_unchanged_surrounding_particles
    assert_equal "서머스 엔드의 돌(Summer's End Stone)", row('3837').fetch('new')
    assert_equal "서머스 엔드 - 종탑(Summer's End - Bell Tower)", row('32924').fetch('new')
    assert_equal "서머스 엔드 - 성소(Summer's End - Chantry)", row('43647').fetch('new')
    assert_includes row('30469').fetch('new'), "서머스 엔드(Summer's End)에 있는"
    assert_includes row('49413').fetch('new'), "서머스 엔드(Summer's End)의 야생"
    assert_includes row('21764').fetch('new'), '고어하트 여관(Gorhart Inn)이오.'
    assert_includes row('29968').fetch('new'), '고어하트 여관(Gorhart Inn)에 오신'
    assert_includes row('32598').fetch('new'), '고어하트 여관(Gorhart Inn)에 묵을'
    assert_includes row('54948').fetch('chinese'), '夏天的结束'
  end

  def test_in_memory_csv_pre_and_post_validation
    rows.select { |review| review['old'] != review['new'] }.group_by { |review| review['resource'] }.each do |resource, edits|
      bytes = File.binread(M.csv_path(resource))
      if File.file?(File.join(__dir__, "proper-name-edits-D#{W::D}.tsv"))
        edits = edits.map { |review| review.merge('old' => review.fetch('new'), 'new' => review.fetch('old')) }
      end
      updated, count = ProperNameCellEditor.prepare(bytes, edits)
      assert_equal ProperNameCellEditor.parse(bytes).length, count
      inverse = edits.map { |review| review.merge('old' => review.fetch('new'), 'new' => review.fetch('old')) }
      restored, = ProperNameCellEditor.prepare(updated, inverse)
      assert_equal ProperNameCellEditor.parse(bytes).map(&:to_h), ProperNameCellEditor.parse(restored).map(&:to_h)
      before_rows = ProperNameCellEditor.parse(bytes)
      after_rows = ProperNameCellEditor.parse(updated)
      target_keys = edits.map { |review| [review['ID_Linha'], review['Tipo_Variante']] }
      before_rows.each_with_index do |before, index|
        next if target_keys.include?(ProperNameCellEditor.key(before))
        assert_equal before.to_h, after_rows[index].to_h
      end
    end
  end

  def test_prior_gorhart_dispositions_are_not_reopened
    snapshot = W.occurrence_snapshot
    keys = [['base', '2122', '11']] + W::INN_IDS.map { |id| ['default', id, ''] }
    keys.each do |key|
      previous = snapshot.fetch(['place:gorhart', *key])
      assert_includes %w[accepted not-an-issue], previous.fetch('status')
      assert_match(/\AD-204/, previous.fetch('evidence'))
      refute JSON.parse(rows.find { |review| M.key(review) == key }.fetch('entity_dispositions_json')).key?('place:gorhart')
    end
  end

  def test_fail_closed_on_wrong_sources_missing_duplicate_and_nested_names
    review = row('49413')
    [
      { 'ID_Linha' => '40748' }, { 'en_texts_json' => '["Summer"]' },
      { 'ja_texts_json' => '["別の場所"]' }, { 'zh_text' => '另一个地方' },
      { 'work_text' => '여름 끝' }, { 'work_text' => '서머스 엔드와 서머스 엔드' },
      { 'work_text' => "서머스 엔드(Summer's End)(Other)" },
      { 'work_text' => '서머스 엔드(Other)' }
    ].each do |bad|
      assert_raises(RuntimeError) { W.review_source(aligned(review).merge(bad), [W::SUMMER]) }
    end
    assert_raises(RuntimeError) { W.review_source(aligned(row('3837')), [W::SUMMER]) }
    assert_raises(RuntimeError) { W.validate_scope!([]) }
    inn = row('24805')
    assert_raises(RuntimeError) do
      W.review_source(aligned(inn, '고어하트(Gorhart) 여관(Other)'), [W::INN])
    end
  end
end
