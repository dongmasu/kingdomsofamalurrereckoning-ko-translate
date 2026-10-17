#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-last-breath-discovery-D21082'

class LastBreathDiscoveryD21082Test < Minitest::Test
  D = LastBreathDiscoveryD21082

  def self.prepared
    @prepared ||= D.prepare
  end

  def prepared
    self.class.prepared
  end

  def test_exact_scope_counts_statuses_and_independent_dispositions
    definitions, reviews, generated = prepared
    assert_equal 7, definitions.length
    assert_equal 36, reviews.length
    assert_equal 60, generated.length
    assert_equal({ 'accepted' => 27, 'not-an-issue' => 3, 'excluded' => 6 },
                 reviews.group_by { |row| row['status'] }.transform_values(&:length))
    assert_equal(
      {
        'unique_item:last-breath' => 36,
        'unique_item:last-breath-hood' => 5,
        'unique_item:last-breath-boots' => 3,
        'unique_item:last-breath-leggings' => 5,
        'unique_item:last-breath-armor' => 6,
        'unique_item:last-breath-gloves' => 4,
        'unique_item:last-breath-ring' => 1
      },
      generated.group_by { |row| row['entity_key'] }.transform_values(&:length)
    )
    assert_equal D::SCOPE_KEYS.sort, reviews.map { |row| D::M.key(row) }.sort
    generic = reviews.select { |row| D::GENERIC_IDS.include?(row['ID_Linha']) }
    assert_equal D::GENERIC_IDS.sort, generic.map { |row| row['ID_Linha'] }.sort
    assert generic.all? { |row| row['status'] == 'excluded' && row['old'] == row['new'] }
  end

  def test_full_component_labels_and_source_order_aliases
    definitions, = prepared
    by_key = definitions.to_h { |row| [row['entity_key'], row] }
    {
      'unique_item:last-breath-hood' => ['Hood of Last Breath', 'Last Breath Hood', '마지막 숨결의 두건'],
      'unique_item:last-breath-boots' => ['Boots of Last Breath', 'Last Breath Boots', '마지막 숨결의 장화'],
      'unique_item:last-breath-leggings' => ['Leggings of Last Breath', 'Last Breath Leggings', '마지막 숨결의 각반'],
      'unique_item:last-breath-armor' => ['Armor of Last Breath', 'Last Breath Armor', '마지막 숨결의 갑옷'],
      'unique_item:last-breath-gloves' => ['Gloves of Last Breath', 'Last Breath Gloves', '마지막 숨결의 장갑']
    }.each do |entity, (canonical, alias_name, korean)|
      row = by_key.fetch(entity)
      assert_equal canonical, row['english_canonical']
      assert_equal alias_name, row['english_aliases']
      assert_equal "#{korean}(#{canonical})", row['korean_canonical']
    end
    ring = by_key.fetch('unique_item:last-breath-ring')
    assert_equal '', ring['english_aliases']
    assert_match(/independently/, ring['notes'])
  end

  def test_named_set_normalization_and_atomic_component_exceptions
    _definitions, reviews, = prepared
    by_key = reviews.to_h { |row| [[row['resource'], row['ID_Linha'], row['Tipo_Variante']], row] }
    whole_set = by_key.fetch(['default', '28147', ''])
    assert_equal 'accepted', whole_set['status']
    assert_includes whole_set['new'], '마지막 숨결(Last Breath) 갑옷'
    assert_equal(
      { 'unique_item:last-breath' => 'accepted', 'unique_item:last-breath-armor' => 'excluded' },
      JSON.parse(whole_set['entity_dispositions_json'])
    )
    ring = by_key.fetch(['default', '45157', ''])
    assert_equal(
      { 'unique_item:last-breath' => 'excluded', 'unique_item:last-breath-ring' => 'accepted' },
      JSON.parse(ring['entity_dispositions_json'])
    )
    assert_equal '마지막 숨결의 반지(Last Breath Ring)', ring['new']
    assert_equal '마지막 숨결의 두건(Hood of Last Breath)은 도시 무기고의 전리품 중 하나야.',
                 by_key.fetch(['default', '53856', ''])['new']
    assert_equal '마지막 숨결의 장갑(Gloves of Last Breath)을 되찾았다. 페린 쇼(Ferrin Shaw)가 다른 귀중한 물건에 관한 정보를 알고 있지만... 대가를 치러야 한다.',
                 by_key.fetch(['default', '56022', ''])['new']
    assert_equal by_key.fetch(['default', '61534', ''])['old'],
                 by_key.fetch(['default', '61534', ''])['new']
  end

  def test_every_row_retains_aligned_source_evidence_and_only_scoped_spans_change
    _definitions, reviews, = prepared
    inventory = D::M.table(D::M::INVENTORY).map(&:to_h).to_h { |row| [D::M.key(row), row] }
    reviews.each do |row|
      source = inventory.fetch(D::M.key(row))
      assert_equal source['work_text'], row['old'], D::M.key(row).inspect
      assert_equal JSON.parse(source['en_texts_json']).compact.join("\n"), row['english']
      assert_equal JSON.parse(source['ja_texts_json']).compact.join("\n---\n"), row['japanese']
      assert_equal source['zh_text'], row['chinese']
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                   row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
      if row['status'] == 'excluded'
        assert_equal row['old'], row['new']
      elsif row['status'] == 'accepted'
        refute_equal row['old'], row['new']
      else
        assert_equal 'not-an-issue', row['status']
        assert_equal row['old'], row['new']
      end
    end
  end

  def test_edits_are_idempotent_opaque_safe_and_do_not_rewrite_generic_text
    canonical = '마지막 숨결(Last Breath)'
    %w[라스트\ 브레스 마지막\ 숨결 최후의\ 숨결 마지막\ 숨].each do |variant|
      assert_equal "#{canonical}는 그대로.\r\n$라스트 브레스$",
                   D.edit_set("#{variant}(Last Breath)는 그대로.\r\n$라스트 브레스$")
    end
    assert_equal canonical, D.edit_set(canonical)
    generic = '그녀의 마지막 숨이 다할 때까지 싸웠다.'
    assert_equal generic, D.edit_set(generic)
    component = D::COMPONENTS.fetch('unique_item:last-breath-hood')
    source = {
      'resource' => 'default', 'ID_Linha' => '53856', 'Tipo_Variante' => '',
      'en_texts_json' => JSON.generate(['The Hood of Last Breath is among the spoils.'])
    }
    text = "라스트 브레스의 두건(Hood of Last Breath)은 그대로.\r\n{KEEP}"
    expected = "마지막 숨결의 두건(Hood of Last Breath)은 그대로.\r\n{KEEP}"
    assert_equal expected, D.edit_component(text, source, 'unique_item:last-breath-hood')
    assert_equal expected, D.edit_component(expected, source, 'unique_item:last-breath-hood')
    assert_equal component.fetch(:korean), '마지막 숨결의 두건'
  end
end
