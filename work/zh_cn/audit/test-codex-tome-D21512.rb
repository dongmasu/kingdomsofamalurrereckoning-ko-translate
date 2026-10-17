#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-codex-tome-D21512'

class CodexTomeD21512Test < Minitest::Test
  W = CodexTomeD21512
  M = ReviewedNameBatches

  def self.prepared
    @prepared ||= begin
      paths = M::RESOURCES.flat_map do |resource|
        %w[en_us ja_jp zh_cn work].map { |locale| inventory_paths(M::ROOT, locale, resource) }
      end + M::DOCS + [
        M::INDEX, M::INVENTORY, ReviewedProperNameDiscovery::GLOSSARY,
        ReviewedProperNameDiscovery::DISCOVERY_CANDIDATES, W::DEFINITIONS, W::REVIEWS,
        File.join(__dir__, "proper-name-edits-D#{W::D}.tsv")
      ]
      snapshot = lambda do
        paths.to_h { |path| [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil] }
      end
      before = snapshot.call
      definitions_exist = File.file?(W::DEFINITIONS)
      reviews_exist = File.file?(W::REVIEWS)
      raise 'only one saved D21512 discovery artifact exists' unless definitions_exist == reviews_exist
      result = if definitions_exist
                 definition_table = M.table(W::DEFINITIONS)
                 [
                   definition_table.headers, definition_table.map(&:to_h),
                   M.table(W::REVIEWS).map(&:to_h)
                 ]
               else
                 reject_write = ->(*) { raise 'read-only preparation called a writer/apply/refresher' }
                 M.stub(:refresh_inventory, reject_write) do
                   M.stub(:write_table, reject_write) do
                     ProperNameCellEditor.stub(:apply, reject_write) do
                       ReviewedProperNameDiscovery.stub(:run, reject_write) { W.prepare }
                     end
                   end
                 end
               end
      raise 'D21512 test setup changed protected files' unless before == snapshot.call
      result
    end
  end

  def reviews
    self.class.prepared.fetch(2)
  end

  def row(id)
    reviews.find { |review| review.fetch('ID_Linha') == id } || raise("missing review #{id}")
  end

  def source(ko, entity = W::CODEX, id = '5343')
    name = W::NAMES.fetch(entity)
    {
      'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
      'en_texts_json' => JSON.generate([name.fetch(:en)]),
      'ja_texts_json' => JSON.generate([name.fetch(:ja)]),
      'zh_text' => entity == W::CODEX ? '命运法典' : '合成之书', 'work_text' => ko
    }
  end

  def test_exact_scope_counts_categories_and_aliases
    _, definitions, rows = self.class.prepared
    assert_equal 33, rows.length
    assert_equal 33, rows.map { |review| M.key(review) }.uniq.length
    assert_equal W.expected_pairs.sort,
                 rows.map { |review| [review.fetch('entity_key'), *M.key(review)] }.sort
    assert_equal({ 'base' => 3, 'default' => 30 }, rows.group_by { |r| r['resource'] }.transform_values(&:length))
    assert_equal({ W::CODEX => 18, W::TOME => 15 }, rows.group_by { |r| r['entity_key'] }.transform_values(&:length))
    assert_equal 22, rows.count { |review| review['old'] != review['new'] }
    assert_equal 11, rows.count { |review| review['status'] == 'not-an-issue' }
    assert_equal({ W::CODEX => 11, W::TOME => 11 },
                 rows.select { |r| r['old'] != r['new'] }.group_by { |r| r['entity_key'] }.transform_values(&:length))
    assert_equal ['unique item', 'named work'], definitions.map { |d| d.fetch('category') }
    assert_equal ['', ''], definitions.map { |d| d.fetch('english_aliases') }
    assert_equal W::NAMES.values.map { |n| n.fetch(:ko) }, definitions.map { |d| d.fetch('korean_canonical') }
    assert W.respond_to?(:apply)
  end

  def test_every_review_retains_source_evidence_and_active_target_spans
    inventory = W.load_inventory
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.each do |review|
      aligned = inventory.fetch(M.key(review))
      english_texts = JSON.parse(aligned.fetch('en_texts_json')).compact
      japanese_texts = JSON.parse(aligned.fetch('ja_texts_json')).compact
      assert_includes [english_texts.join("\n"), english_texts.join("\n---\n")], review.fetch('english')
      assert_includes [japanese_texts.join("\n"), japanese_texts.join("\n---\n")], review.fetch('japanese')
      assert_equal aligned.fetch('zh_text'), review.fetch('chinese')
      name = W::NAMES.fetch(review.fetch('entity_key'))
      mentions = review['ID_Linha'] == '33025' ? 2 : 1
      assert_equal mentions, review.fetch('english').scan(name.fetch(:en)).length
      assert_equal mentions, review.fetch('japanese').scan(name.fetch(:ja)).length
      assert_equal mentions, review.fetch('chinese').scan(name.fetch(:zh)).length
      assert_equal mentions,
                   aligned.fetch('work_text').scan(Regexp.new(Regexp.escape(name.fetch(:ko)))).length,
                   "active target-name spans differ #{M.key(review).inspect}"
    end
    assert_includes inventory.fetch(['default', '13845', '']).fetch('work_text'), '그 서(Codex)에는'
    assert_includes inventory.fetch(['default', '12526', '']).fetch('work_text'),
                    '운명의 서(Codex of Destiny)는'
  end

  def test_every_change_is_only_a_name_and_the_one_scoped_particle
    reviews.each do |review|
      name = W::NAMES.fetch(review.fetch('entity_key'))
      expected = review.fetch('old')
      if review['ID_Linha'] == '12526'
        assert_includes expected, '운명의 법전(Codex of Destiny)은'
        expected = expected.sub('운명의 법전(Codex of Destiny)은', "#{name.fetch(:ko)}는")
      end
      expected = expected.gsub(name.fetch(:pattern), name.fetch(:ko))
      if W::SHORT_REFERENCES.key?([review['entity_key'], *M.key(review)])
        short = W::SHORT_REFERENCES.fetch([review['entity_key'], *M.key(review)])
        expected = expected.sub(short.fetch(:korean_old), short.fetch(:korean_new))
      end
      assert_equal expected, review.fetch('new')
      assert_equal review['old'].scan(/\r\n|\r|\n/), review['new'].scan(/\r\n|\r|\n/)
      assert_equal review['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                   review['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_equal review['old'].scan(/\d+/), review['new'].scan(/\d+/)
      assert_equal({ review.fetch('entity_key') => review.fetch('status') },
                   JSON.parse(review.fetch('entity_dispositions_json')))
    end
  end

  def test_idempotency_for_every_actual_row
    reviews.each do |review|
      aligned = {
        'resource' => review['resource'], 'ID_Linha' => review['ID_Linha'],
        'Tipo_Variante' => review['Tipo_Variante'],
        'en_texts_json' => JSON.generate([review['english']]),
        'ja_texts_json' => JSON.generate([review['japanese']]),
        'zh_text' => review['chinese'], 'work_text' => review['new']
      }
      repeated = W.review_source(aligned, review.fetch('entity_key'))
      assert_equal review['new'], repeated['new']
      assert_equal 'not-an-issue', repeated['status']
    end
  end

  def test_all_variants_and_existing_pairs_are_atomic
    W::NAMES.each do |entity, name|
      id = entity == W::CODEX ? '5343' : '502'
      name.fetch(:variants).split('|').each do |variant|
        old = "<b>#{variant}</b>\r\n{1} $TOKEN$"
        expected = "<b>#{name.fetch(:ko)}</b>\r\n{1} $TOKEN$"
        assert_equal expected, W.review_source(source(old, entity, id), entity)['new']
      end
      paired = W.review_source(source(name.fetch(:ko), entity, id), entity)
      assert_equal name.fetch(:ko), paired['new']
      assert_equal 'not-an-issue', paired['status']
    end
  end

  def test_particles_copula_and_forgery_distinction
    assert_includes row('12526')['new'], '운명의 서(Codex of Destiny)는'
    assert_includes row('12526')['old'], '운명의 법전(Codex of Destiny)은'
    assert_includes row('13845')['old'], '그 서에는'
    assert_includes row('13845')['new'], '그 서(Codex)에는'
    assert_equal 1, row('13845')['new'].scan('그 서(Codex)에는').length
    assert_includes row('19649')['new'], '전설의 운명의 서(Codex of Destiny)지.'
    assert_includes row('5343')['new'], '대단한 위조품을 가져오긴 했지만'
    assert_includes row('5343')['new'], '진짜 운명의 서(Codex of Destiny)일 리는 없어.'
    assert_includes row('48609')['new'], '대단히 정교한 위작일 뿐일 겁니다.'
    assert_includes row('60407')['new'], '운명의 돌(Destiny Stone)'
    assert_equal '운명의 서(Codex of Destiny)', row('2750')['new']
    assert_equal '운명의 서(Codex of Destiny)', row('4625')['new']
    assert_equal '합성의 서(Tome of Synthesis)', row('2949')['new']
  end

  def test_tome_repeated_mentions_puzzle_tutorial_and_quotations
    tome = W::NAMES.fetch(W::TOME).fetch(:ko)
    assert_equal 1, row('33025')['old'].scan(tome).length
    assert_equal 2, row('33025')['new'].scan(tome).length
    before = row('33025')['old'].gsub(W::NAMES.fetch(W::TOME).fetch(:pattern), '<NAME>')
    after = row('33025')['new'].gsub(tome, '<NAME>')
    assert_equal before, after
    assert_includes after, '서가 네 개, 자물쇠 네 개. 우연일 리 없다!'
    tutorial = row('20956')
    assert_includes tutorial['new'], '{*1혼돈 물약}'
    assert_includes tutorial['new'], '{*1혼돈 정수}'
    assert_includes tutorial['new'], '{LINE_SPACE}계속하려면 {1}을(를) 누르십시오.'
    assert_equal tutorial['old'].split("\r\n\r\n").drop(1), tutorial['new'].split("\r\n\r\n").drop(1)
    assert_includes row('27932')['new'], "'#{tome}'일 거야."
    assert_includes row('42618')['new'], "『#{tome}』를"
    assert_equal 'not-an-issue', row('52931')['status']
  end

  def test_malformed_nested_missing_and_extra_spans_fail_closed
    ['서', '운명의 서와 운명의 서', '운명의 서(Other)',
     '운명의 서(Codex of Destiny)(Other)', '운명의 코덱스(Other)'].each do |ko|
      assert_raises(RuntimeError) { W.review_source(source(ko), W::CODEX) }
    end
    ['합성의 서(Other)', '합성의 서(Tome of Synthesis)(Other)', '종합의 서(Other)'].each do |ko|
      assert_raises(RuntimeError) { W.review_source(source(ko, W::TOME, '502'), W::TOME) }
    end
  end

  def test_source_and_scoped_particle_guards_fail_closed
    aligned = source('운명의 서')
    [
      { 'en_texts_json' => '["Codex"]' },
      { 'en_texts_json' => '["Codex of Destiny and Codex of Destiny"]' },
      { 'ja_texts_json' => '["別の書"]' }, { 'zh_text' => '别的书' },
      { 'ID_Linha' => '999999' }
    ].each do |bad|
      assert_raises(RuntimeError) { W.review_source(aligned.merge(bad), W::CODEX) }
    end
    assert_raises(RuntimeError) do
      W.review_source(source('운명의 서는', W::CODEX, '12526'), W::CODEX)
    end
  end

  def test_no_broad_short_aliases_or_source_overlap
    definitions = self.class.prepared.fetch(1)
    matchers = build_matchers(definitions)
    ['Codex', 'Tome', 'Destiny Stone', 'Synthesis', 'Codex of Destinyland',
     'Tome of Synthesisers'].each { |en| assert_empty candidate_matches([en], matchers) }
    W::NAMES.each do |entity, name|
      assert_equal [entity], candidate_matches([name.fetch(:en)], matchers).keys
    end
  end

  def test_local_codex_short_reference_is_not_a_global_alias_or_occurrence
    definition = self.class.prepared.fetch(1).find { |d| d['entity_key'] == W::CODEX }
    assert_equal '', definition.fetch('english_aliases')
    assert_equal 1, W.expected_pairs.count { |pair| pair == [W::CODEX, 'default', '13845', ''] }
    assert_empty candidate_matches(['The Codex'], build_matchers([definition]))
    scoped = W::SHORT_REFERENCES.fetch([W::CODEX, 'default', '13845', ''])
    assert_equal 'The Codex', scoped.fetch(:english)
    assert_equal '그 서(Codex)에는', scoped.fetch(:korean_new)
  end

  def test_scope_registration_and_collision_gates
    _, definitions, rows = self.class.prepared
    generated = rows.map { |r| r.slice('entity_key', 'resource', 'ID_Linha', 'Tipo_Variante') }
    W.validate_scope!(generated)
    assert_raises(RuntimeError) { W.validate_scope!(generated.drop(1)) }
    assert_raises(RuntimeError) { W.validate_scope!(generated + [generated.first]) }
    other = { 'entity_key' => 'person:other', 'english_canonical' => 'Other', 'english_aliases' => '' }
    assert_nil ReviewedProperNameDiscovery.validate!(definitions, rows, generated, [other], [])
    assert_raises(RuntimeError) do
      ReviewedProperNameDiscovery.validate!(definitions, rows, generated, definitions, [])
    end
    assert_raises(RuntimeError) do
      ReviewedProperNameDiscovery.validate!(definitions, rows, generated, [], [rows.first])
    end
    assert_raises(RuntimeError) do
      ReviewedProperNameDiscovery.validate!(
        definitions, rows, generated, [other.merge('english_aliases' => 'Tome of Synthesis')], []
      )
    end
  end

  def test_preflight_rejects_changed_active_text_before_byte_editor
    changed = reviews.first
    inventory = { M.key(changed) => { 'work_text' => changed.fetch('old') + '!' } }
    ProperNameCellEditor.stub(:prepare, ->(*) { flunk 'byte editor called before active-text check' }) do
      assert_raises(RuntimeError) { W.preflight!([changed], inventory) }
    end
  end
end
