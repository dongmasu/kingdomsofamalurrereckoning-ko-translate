#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'review-windstone-urul-tusk-D21612-D21613'

class ProperNameFamilyWindstoneD21611D21613Test < Minitest::Test
  M = ReviewedNameBatches
  W = ReviewWindstoneUrulTuskD21612D21613

  def manifest(d)
    M.table(File.join(__dir__, "proper-name-edits-D#{d}.tsv"))
  end

  def test_batch_bounds_and_exact_source_evidence
    inventory = M.table(M::INVENTORY).to_h { |row| [M.key(row), row] }
    [[21_611, 39, 39], [21_612, 37, 32], [21_613, 22, 11]].each do |d, rows, edits|
      reviewed = manifest(d)
      assert_equal rows, reviewed.length
      assert_equal rows, reviewed.map { |row| M.key(row) }.uniq.length
      assert_operator rows, :<=, 50
      assert_equal edits, reviewed.count { |row| row['old'] != row['new'] }
      reviewed.each do |row|
        source = inventory.fetch(M.key(row))
        assert_equal JSON.parse(source['en_texts_json']).compact.join("\n"), row['english']
        assert_equal JSON.parse(source['ja_texts_json']).compact.join("\n---\n"), row['japanese']
        assert_equal source['zh_text'], row['chinese']
        assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
        assert_equal row['old'].scan(/\$[^$]*\$|<[^>]*>|\{[^{}]*\}/),
                     row['new'].scan(/\$[^$]*\$|<[^>]*>|\{[^{}]*\}/)
        assert_equal row['old'].scan(/[0-9]+(?:\.[0-9]+)?%?/),
                     row['new'].scan(/[0-9]+(?:\.[0-9]+)?%?/)
      end
    end
  end

  def test_family_collective_does_not_reclassify_previous_person_findings
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    family = glossary.find { |row| row['entity_key'] == 'family:zungar' }
    assert_equal '중가르 가문(Zungar family)', family['korean_canonical']
    assert_equal 'Zungars', family['english_aliases']
    index = M.table(M::INDEX)
    prior_keys = index.select { |row| row['entity_key'] == 'person:zungar' }
      .to_h { |row| [M.key(row), row] }
    assert_equal 33, prior_keys.length
    %w[11267 11896 16039 18874 57200 57219 59922 64741].each do |id|
      prior = prior_keys.fetch(['default', id, ''])
      assert_equal 'excluded', prior['status']
      assert_match(/\AD-205\d\d:/, prior['evidence'])
    end
    reviewed = manifest(21_611).to_h { |row| [M.key(row), row] }
    family_rows = reviewed.values.select { |row| row['entity_key'] == 'family:zungar' }
    assert_equal 36, family_rows.length
    family_rows.each do |row|
      assert_includes row['new'], '중가르 가문('
      refute_match(/준가르|즈웅가르|중가르족/, row['new'])
    end
    assert_includes reviewed.fetch(['default', '52757', ''])['new'], '펠드 중가르(Feld Zungar)'
    assert_equal '중가르 갱도(Zungar Shaft)', reviewed.fetch(['base', '1230', '11'])['new']
    assert_equal '윈드스톤 계곡(Windstone Vale)', reviewed.fetch(['default', '19931', ''])['new']
  end

  def test_named_places_are_not_generic_windstone_objects
    reviewed = manifest(21_612).to_h { |row| [M.key(row), row] }
    vale = reviewed.fetch(['default', '19931', ''])
    assert_equal 'excluded', vale['status']
    assert_equal vale['old'], vale['new']
    circle = reviewed.fetch(['default', '17460', ''])
    assert_equal '바람돌 원형진(Windstone Circle)', circle['new']
    assert_equal({
      'resource:windstone' => 'excluded', 'place:windstone-circle' => 'accepted'
    }, JSON.parse(circle['entity_dispositions_json']))
    assert_equal '고대 바람돌(Windstone)', reviewed.fetch(['base', '3546', '11'])['new']
    manifest(21_612).each do |row|
      next if %w[17460 19931].include?(row['ID_Linha']) && row['resource'] == 'default'
      refute_match(/풍음석|풍석|윈드스톤/, row['new'])
      assert_equal 1, row['new'].scan(/\(Windstones?\)/).length
    end
    text = reviewed.fetch(['default', '55632', ''])['new']
    assert_equal 2, text.scan('바람돌').length
    assert_includes text, '우룰 터스크(Urul-Tusk)'
  end

  def test_urul_tusk_local_alias_and_other_entity_preservation
    reviewed = manifest(21_613).to_h { |row| [M.key(row), row] }
    assert_equal '우룰 터스크(Urul Tusk)', reviewed.fetch(['base', '4330', '11'])['new']
    assert_includes reviewed.fetch(['default', '35462', ''])['new'], '우룰 터스크(Urul Tusk)'
    assert_includes reviewed.fetch(['default', '35462', ''])['new'], '바람돌(Windstones)'
    assert_equal '우룰 터스크(Urul-Tusk)', reviewed.fetch(['default', '58121', ''])['new']
    reviewed.values.each do |row|
      refute_match(/우룰터스크|우룰투스크|우룰\(Urul\)의 엄니/, row['new'])
      assert_equal 1, row['new'].scan(/\(Urul(?:-| )Tusk\)/).length
    end
    text = reviewed.fetch(['default', '64661', ''])['new']
    assert_includes text, '틸레라 장군(General Tilera)'
    assert_includes text, '관통의 빛(Piercing Light)'
  end
end
