#!/usr/bin/env ruby

require 'minitest/autorun'
require 'rbconfig'
require_relative 'review-well-of-souls-D21510'

class WellOfSoulsD21510Test < Minitest::Test
  W = WellOfSoulsD21510
  M = ReviewedNameBatches

  def self.applied_checkpoint?
    report = File.join(__dir__, "named-scope-review-D#{W::START + 1}-#{M::RUN_DATE_COMPACT}.md")
    File.file?(W::DEFINITIONS) && File.file?(W::REVIEWS) && File.file?(report)
  end

  def self.prepared
    @prepared ||= begin
      if applied_checkpoint?
        glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
        definitions = M.table(W::DEFINITIONS).map(&:to_h)
        reviews = M.table(W::REVIEWS).map(&:to_h)
        [glossary.headers, definitions, reviews]
      else
        paths = M::RESOURCES.map { |resource| M.csv_path(resource) } +
          M::DOCS + [M::INDEX, M::INVENTORY, ReviewedProperNameDiscovery::GLOSSARY]
        before = paths.to_h { |path| [path, Digest::SHA256.file(path).hexdigest] }
        reject_write = ->(*) { raise 'prepare called a shared writer or inventory refresher' }
        result = M.stub(:refresh_inventory, reject_write) do
          M.stub(:write_table, reject_write) do
            ReviewedProperNameDiscovery.stub(:run, reject_write) { W.prepare }
          end
        end
        after = paths.to_h { |path| [path, Digest::SHA256.file(path).hexdigest] }
        raise 'prepare changed protected files' unless before == after
        result
      end
    end
  end

  def source(ko, en = W::ENGLISH, id = '52770')
    {
      'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
      'en_texts_json' => JSON.generate([en]),
      'ja_texts_json' => JSON.generate(['魂の泉']), 'zh_text' => '灵魂之井',
      'work_text' => ko
    }
  end

  def reviews
    self.class.prepared[2]
  end

  def by_id
    reviews.to_h { |row| [row.fetch('ID_Linha'), row] }
  end

  def test_exact_scope_counts_batches_and_classification
    _, definitions, rows = self.class.prepared
    assert_equal 61, rows.length
    assert_equal W.expected_pairs.sort,
                 rows.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    assert_equal 42, rows.count { |row| row.fetch('old') != row.fetch('new') }
    assert_equal 19, rows.count { |row| row.fetch('status') == 'not-an-issue' }
    assert_equal [50, 11], W.batches(rows).map(&:length)
    assert_equal ['base', '1478', '11'], M.key(rows.first)
    assert_equal ['default', '54620', ''], M.key(W.batches(rows).last.first)
    definition = definitions.fetch(0)
    assert_equal 'construct:well-of-souls', definition.fetch('entity_key')
    assert_equal 'lore term', definition.fetch('category')
    assert_includes definition.fetch('notes'), 'Named construct/research project'
    assert_equal '', definition.fetch('english_aliases')
    assert_equal '영혼의 샘|영혼의 우물', definition.fetch('korean_variants')
    assert W.respond_to?(:apply)
  end

  def test_target_entity_has_no_existing_registration
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    registered = glossary.select { |row| row.fetch('entity_key') == W::ENTITY }
    indexed = index.select { |row| row.fetch('entity_key') == W::ENTITY }
    if self.class.applied_checkpoint?
      assert_equal 1, registered.length
      assert_equal W::CANONICAL, registered.fetch(0).fetch('korean_canonical')
      assert_equal W.expected_pairs.sort, indexed.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
      assert_equal 61, indexed.length
      assert_equal 42, indexed.count { |row| row.fetch('status') == 'accepted' }
      assert_equal 19, indexed.count { |row| row.fetch('status') == 'not-an-issue' }
    else
      assert_empty registered
      assert_empty indexed
    end
  end

  def test_all_edits_are_exact_name_only
    reviews.each do |row|
      expected = row.fetch('old').sub(W::KOREAN_NAME, W::CANONICAL)
      if (short_reference = W::SHORT_REFERENCES[M.key(row)])
        expected = expected.sub(*short_reference)
      end
      assert_equal expected, row.fetch('new')
      assert_equal 1, row.fetch('new').scan(W::CANONICAL).length
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/), row.fetch('new').scan(/\r\n|\r|\n/)
      assert_equal row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_equal({ W::ENTITY => row.fetch('status') },
                   JSON.parse(row.fetch('entity_dispositions_json')))
    end
  end

  def test_two_paired_well_variants_are_normalized
    %w[52770 53057].each do |id|
      row = by_id.fetch(id)
      assert_includes row.fetch('old'), '영혼의 우물(Well of Souls)'
      assert_equal row.fetch('old').sub('영혼의 우물(Well of Souls)', W::CANONICAL),
                   row.fetch('new')
      assert_equal 'accepted', row.fetch('status')
    end
  end

  def test_two_short_mentions_are_annotated_only_in_their_full_name_rows
    assert_includes by_id.fetch('54620').fetch('new'), '우물을 찾아 동굴로 내려가.'
    assert_includes by_id.fetch('57375').fetch('new'), '알레스타(Allestar)의 샘(Well)을 되살릴'
    assert_includes by_id.fetch('61903').fetch('new'), '그는 샘(Well) 꼭대기에 갇힌'
    assert_includes by_id.fetch('57375').fetch('new'), W::CANONICAL
    assert_includes by_id.fetch('61903').fetch('new'), W::CANONICAL
    assert_equal 61, reviews.length
    assert_equal 61, reviews.map { |row| [row.fetch('entity_key'), *M.key(row)] }.uniq.length
    assert_includes by_id.fetch('57786').fetch('evidence'), 'portable-revivifier comparison'
    %w[5790 6055 6195 51893].each { |id| refute by_id.key?(id) }
  end

  def test_idempotent_pairing_particles_tokens_and_line_breaks
    old = "$TOKEN$\r\n<color>영혼의 샘이</color>\n{1} 우물은 그대로다."
    row = W.review_source(source(old))
    assert_equal "$TOKEN$\r\n<color>#{W::CANONICAL}이</color>\n{1} 우물은 그대로다.", row.fetch('new')
    paired = W.review_source(source(row.fetch('new')))
    assert_equal row.fetch('new'), paired.fetch('new')
    assert_equal 'not-an-issue', paired.fetch('status')
  end

  def test_missing_multiple_and_malformed_korean_fail_closed
    ['우물', '영혼의 샘과 영혼의 샘', '영혼의 샘(Other)',
     '영혼의 샘(Well of Souls)(Other)'].each do |ko|
      assert_raises(RuntimeError) { W.review_source(source(ko)) }
    end
  end

  def test_source_support_fails_closed
    assert_raises(RuntimeError) { W.review_source(source('영혼의 샘', 'the Well')) }
    assert_raises(RuntimeError) { W.review_source(source('영혼의 샘', 'Well of Souls and Well of Souls')) }
    assert_raises(RuntimeError) do
      W.review_source(source('영혼의 샘').merge('ja_texts_json' => '["井戸"]'))
    end
    assert_raises(RuntimeError) { W.review_source(source('영혼의 샘').merge('zh_text' => '井')) }
    base = source('영혼의 샘').merge(
      'resource' => 'base', 'ID_Linha' => '1478', 'Tipo_Variante' => '11',
      'ja_texts_json' => JSON.generate([W::ENGLISH])
    )
    assert_equal W::CANONICAL, W.review_source(base).fetch('new')
  end

  def test_matcher_has_no_global_well_alias
    headers = %w[entity_key english_canonical english_aliases]
    definition = W.definition(headers)
    matcher = build_matchers([definition])
    ['the Well', 'Soul Well', 'ordinary well', 'Well of Soulsmith'].each do |en|
      assert_empty candidate_matches([en], matcher)
    end
    ["Ventrinio's Well of Souls", 'A Well of Souls for battle'].each do |en|
      assert_equal [W::ENTITY], candidate_matches([en], matcher).keys
    end
  end

  def test_scope_rejects_missing_duplicate_and_extra_keys
    generated = reviews.map { |row| row.slice('entity_key', 'resource', 'ID_Linha', 'Tipo_Variante') }
    assert_nil W.validate_scope!(generated)
    assert_raises(RuntimeError) { W.validate_scope!(generated.drop(1)) }
    assert_raises(RuntimeError) { W.validate_scope!(generated + [generated.first]) }
    extra = generated.first.merge('ID_Linha' => '999999')
    assert_raises(RuntimeError) { W.validate_scope!(generated.drop(1) + [extra]) }
  end

  def test_existing_entity_keys_and_alias_collisions_fail_closed
    _, definitions, rows = self.class.prepared
    generated = rows.map { |row| row.slice('entity_key', 'resource', 'ID_Linha', 'Tipo_Variante') }
    other = { 'entity_key' => 'person:other', 'english_canonical' => 'Other', 'english_aliases' => '' }
    unrelated = rows.first.merge('entity_key' => other.fetch('entity_key'))
    assert_nil ReviewedProperNameDiscovery.validate!(definitions, rows, generated, [other], [unrelated])
    assert_raises(RuntimeError) do
      ReviewedProperNameDiscovery.validate!(definitions, rows, generated, [], [rows.first])
    end
    collision = other.merge('english_aliases' => W::ENGLISH)
    assert_raises(RuntimeError) do
      ReviewedProperNameDiscovery.validate!(definitions, rows, generated, [collision], [])
    end
  end

end
