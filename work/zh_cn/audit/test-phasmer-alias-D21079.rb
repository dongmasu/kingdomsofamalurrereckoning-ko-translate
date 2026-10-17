#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-phasmer-alias-D21079'

class PhasmerAliasD21079Test < Minitest::Test
  D = PhasmerAliasD21079
  ACCEPTED_SHORT = %w[9459 11077 19336 20022 20462 20618 21200 21322 25216
                      26434 27098 30179 32727 33377 35053 36711 37708 43833
                      44427 45407 46500 47320 49708 50398 59473].freeze

  def fixture
    inventory = {}
    (D::FULL_NAME_IDS + D::SHORT_ONLY_IDS).uniq.each do |id|
      key = ['default', id, '']
      if id == '13525'
        en, ja, zh, ko = "Phasmer's Curse", 'ファズマーの呪い', '法斯玛的诅咒', '파스머(Phasmer)의 저주'
      elsif D::SAME_FULL_IDS.include?(id)
        en = 'Phasmer Humm. Phasmer joined me.'
        ja = 'ファズマー・ヒュム。ファズマーと合流した。'
        zh = '法斯玛·胡姆。法斯玛与我会合。'
        ko = '파스머 험(Phasmer Humm). 패스머를 만났어.'
        ko = '파스머 험(Phasmer Humm). 파스머와 합류했어.' if id == '8706'
        ko = '파스머 험(Phasmer Humm). 파스머는 저주받았어.' if id == '32402'
      elsif D::FULL_NAME_IDS.include?(id)
        en, ja, zh, ko = 'Phasmer Humm', 'ファズマー・ヒュム', '法斯玛·胡姆', D::FULL_KOREAN
      else
        en, ja, zh, ko = 'Phasmer joined us.', 'ファズマーが合流した。', '法斯玛加入了我们。', '파스머(Phasmer)가 합류했어.'
        ko = '패스머가 합류했어.' if ACCEPTED_SHORT.include?(id)
      end
      inventory[key] = {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'en_texts_json' => JSON.generate([en]), 'ja_texts_json' => JSON.generate([ja]),
        'zh_text' => zh, 'work_text' => ko
      }
    end
    inventory[['default', '12209', '']] = {
      'resource' => 'default', 'ID_Linha' => '12209', 'Tipo_Variante' => '',
      'en_texts_json' => '["Humm"]', 'ja_texts_json' => '["Humm"]',
      'zh_text' => 'Humm', 'work_text' => '흠.'
    }
    glossary = [{
      'entity_key' => D::ENTITY, 'english_canonical' => D::FULL_NAME,
      'category' => 'person', 'korean_canonical' => D::FULL_KOREAN,
      'english_aliases' => '', 'korean_variants' => '파스머 험|패스머 험',
      'evidence_ids' => 'D-21070|default:864', 'status' => 'confirmed',
      'notes' => 'Registered full name.'
    }]
    index = D::FULL_NAME_IDS.map do |id|
      status = id == '32402' ? 'not-an-issue' : 'accepted'
      {
        'entity_key' => D::ENTITY, 'resource' => 'default', 'ID_Linha' => id,
        'Tipo_Variante' => '', 'matched_english' => D::FULL_NAME,
        'english_source' => D::FULL_NAME,
        'korean_current' => inventory[['default', id, '']]['work_text'],
        'status' => status, 'evidence' => "D-21070: prior #{id}"
      }
    end
    [inventory, glossary, index]
  end

  def test_exact_53_short_only_and_3_same_full_rows_without_full_only_recount
    inventory, glossary, index = fixture
    reviews = D.build_reviews(inventory, glossary, index)
    assert_equal 56, reviews.length
    assert_equal 53, reviews.count { |row| row['review_scope'] == 'short-only' || row['review_scope'] == 'excluded-title' }
    assert_equal 3, reviews.count { |row| row['review_scope'] == 'same-full-followup' }
    assert_equal D::SHORT_ONLY_IDS.sort,
                 reviews.select { |row| %w[short-only excluded-title].include?(row['review_scope']) }
                         .map { |row| row['ID_Linha'] }.sort
    assert_equal D::SAME_FULL_IDS.sort,
                 reviews.select { |row| row['review_scope'] == 'same-full-followup' }
                         .map { |row| row['ID_Linha'] }.sort
    assert_equal 18, index.length
    assert_equal 28, reviews.count { |row| row['status'] == 'accepted' }
    assert_equal 27, reviews.count { |row| row['status'] == 'not-an-issue' }
    assert_equal 1, reviews.count { |row| row['status'] == 'excluded' }
  end

  def test_only_alias_spans_change_repeated_forms_and_particles_survive
    old = '늙은 패스머는 페즈머(Phasmer)를 만났고 파스머에게 물었다.'
    assert_equal '늙은 파스머(Phasmer)는 파스머(Phasmer)를 만났고 파스머(Phasmer)에게 물었다.',
                 D.canonicalize(old, 3)
    paired = '파스머(Phasmer)는 파스머(Phasmer)의 일이야.'
    assert_equal paired, D.canonicalize(paired, 2)
    assert_equal '파스머 험(Phasmer Humm)과 파스머(Phasmer)는 달라.',
                 D.canonicalize('파스머 험(Phasmer Humm)과 파스머는 달라.', 1)
  end

  def test_title_excluded_and_humm_interjection_not_an_alias
    inventory, glossary, index = fixture
    reviews = D.build_reviews(inventory, glossary, index)
    title = reviews.find { |row| row['ID_Linha'] == '13525' }
    assert_equal 'excluded', title['status']
    assert_equal title['old'], title['new']
    no_alias_inventory = inventory.dup
    assert_equal D::SHORT_ONLY_IDS.sort, D.source_keys(no_alias_inventory).first.map { |key| key[1] }.sort
  end

  def test_same_full_followups_capture_previous_status_and_evidence_explicitly
    inventory, glossary, index = fixture
    reviews = D.build_reviews(inventory, glossary, index)
    followups = reviews.select { |row| row['review_scope'] == 'same-full-followup' }
    assert_equal D::SAME_FULL_IDS.sort, followups.map { |row| row['ID_Linha'] }.sort
    followups.each do |row|
      assert_equal({ D::ENTITY => index.find { |old| old['ID_Linha'] == row['ID_Linha'] }['status'] }.to_json,
                   row['previous_status'])
      assert_equal({ D::ENTITY => "D-21070: prior #{row['ID_Linha']}" }.to_json,
                   row['previous_evidence'])
      assert_equal 'accepted', row['status']
    end
    assert_equal 18, index.length
  end

  def test_cross_locale_text_is_retained_exactly_for_each_review
    inventory, glossary, index = fixture
    D.build_reviews(inventory, glossary, index).each do |row|
      source = inventory.fetch(D.key(row))
      assert_equal JSON.parse(source['en_texts_json']).join("\n"), row['english']
      assert_equal JSON.parse(source['ja_texts_json']).join("\n---\n"), row['japanese']
      assert_equal source['zh_text'], row['chinese']
    end
  end

  def test_scope_drift_or_korean_mention_mismatch_fails_closed
    inventory, glossary, index = fixture
    extra = inventory.dup
    extra[['default', '99999', '']] = inventory.fetch(['default', '1275', ''])
      .merge('ID_Linha' => '99999')
    assert_raises(RuntimeError) { D.build_reviews(extra, glossary, index) }
    broken = inventory.dup
    key = ['default', '9459', '']
    broken[key] = broken.fetch(key).merge('work_text' => '번역에 이름 없음')
    assert_raises(RuntimeError) { D.build_reviews(broken, glossary, index) }
    locale_gap = inventory.dup
    key = ['default', '1275', '']
    locale_gap[key] = locale_gap.fetch(key).merge(
      'ja_texts_json' => '["名前なし"]', 'zh_text' => '没有名称'
    )
    assert_raises(RuntimeError) { D.build_reviews(locale_gap, glossary, index) }
  end

  def test_missing_entity_collision_and_nonterminal_full_rows_are_rejected
    inventory, glossary, index = fixture
    assert_raises(RuntimeError) { D.build_reviews(inventory, [], index) }
    collision = glossary + [{
      'entity_key' => 'person:another', 'english_canonical' => 'Another',
      'english_aliases' => 'Phasmer'
    }]
    assert_raises(RuntimeError) { D.build_reviews(inventory, collision, index) }
    unresolved = index.map(&:dup)
    unresolved.first['status'] = 'needs-context'
    assert_raises(RuntimeError) { D.build_reviews(inventory, glossary, unresolved) }
    stale = index.map(&:dup)
    stale.first['korean_current'] = 'stale'
    assert_raises(RuntimeError) { D.build_reviews(inventory, glossary, stale) }
  end

  def test_apply_script_requires_explicit_apply_and_never_refreshes_inventory
    source = D.apply_script
    assert_includes source, "ARGV == ['--apply']"
    assert_includes source, 'apply!'
    refute_includes source, 'refresh_inventory'
    apply_source = File.read(File.join(__dir__, 'prepare-phasmer-alias-D21079.rb'))
    assert_includes apply_source, 'M.run('
    refute_includes apply_source, 'File.binwrite(csv_path, csv_after)'
  end

  def test_opaque_tokens_are_preserved_verbatim
    old = '$파스머$ <파스머> {Phasmer} 파스머를 만났어.'
    assert_equal '$파스머$ <파스머> {Phasmer} 파스머(Phasmer)를 만났어.',
                 D.canonicalize(old, 1)
  end
end
