#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'prepare-four-persons-D21105'

class FourPersonsD21105Test < Minitest::Test
  N = FourPersonsD21105

  def test_definition_alias_boundaries
    definitions = N::DEFINITIONS.to_h { |row| [row['entity_key'], row] }
    assert_equal 'Stellan', definitions['person:stellan-reitan']['english_aliases']
    assert_equal 'Telemachus', definitions['person:telemachus-rasp']['english_aliases']
    assert_equal 'Calder|Lord Vonn', definitions['person:calder-vonn']['english_aliases']
    assert_equal 'Sigra', definitions['person:sigra-thorin']['english_aliases']
    refute_includes definitions['person:calder-vonn']['english_aliases'].split('|'), 'Vonn'
    refute_includes definitions['person:sigra-thorin']['english_aliases'].split('|'), 'Thorin'
  end

  def test_full_name_normalization_and_atomic_titles
    assert_equal '스텔란 레이탄(Stellan Reitan)이 왔다.',
      N.transform('스텔란 라이탄(Stellan Reitan)이 왔다.', 'person:stellan-reitan', ['default', '18313', ''])
    assert_equal '스텔란 레이탄의 일지(The Journal of Stellan Reitan)',
      N.transform('스텔란 라이탄의 일지', 'person:stellan-reitan', ['default', '9346', ''])
    assert_equal '스텔란 레이탄의 일지 (The Journal of Stellan Reitan)',
      N.transform('스텔란 레이탄의 일지 (The Journal of Stellan Reitan)', 'person:stellan-reitan', ['base', '2872', '11'])
    assert_equal '텔레마코스 라스프(Master Telemachus Rasp) 선생은 엄격하지만 공정해.',
      N.transform('텔레마코스 라스프(Master Telemachus Rasp) 선생은 엄격하지만 공정해.', 'person:telemachus-rasp', ['default', '1280', ''])
  end

  def test_short_and_repeated_mentions
    assert_equal '데스페로(Despero)의 시신에서 스텔란(Stellan)의 일지를 찾았다. 스텔란(Stellan)에게 돌아가야 한다.',
      N.transform('데스페로(Despero)의 시신에서 스텔란(Stellan)의 일지를 찾았다. 스텔란에게 돌아가야 한다.', 'person:stellan-reitan', ['default', '865', ''])
    text = '텔레마쿠스 랩(Telemachus Rasp)이 아카사에 갔다. 텔레마코스 라스프는 돌아왔다.'
    expected = '텔레마코스 라스프(Telemachus Rasp)가 아카사에 갔다. 텔레마코스 라스프(Telemachus Rasp)는 돌아왔다.'
    assert_equal expected, N.transform(text, 'person:telemachus-rasp', ['default', '16052', ''])
    assert_equal '그는 라스프의 우려를 언급했다.',
      N.transform('그는 라스프의 우려를 언급했다.', 'person:telemachus-rasp', ['default', '19818', ''])
    refute_includes N::EXPECTED_IDS.fetch('person:telemachus-rasp'), 'default:19818:'
    assert_equal '텔레마코스 라스프(Telemachus Rasp)가 두 번 말했다. 텔레마코스 라스프(Telemachus Rasp)의 수업이었다.',
      N.transform('텔레마코스 라스프가 두 번 말했다. 텔레마코스 라스프의 수업이었다.', 'person:telemachus-rasp', ['default', '33273', ''])
  end

  def test_calder_short_names_are_row_scoped
    assert_equal '칼더 본(Calder Vonn)과 칼더(Calder).',
      N.transform('캘더 본(Calder Vonn)과 칼더.', 'person:calder-vonn', ['default', '41744', ''])
    assert_equal '본 경(Lord Vonn)이라고 불러야 해.',
      N.transform('본 경이라고 불러야 해.', 'person:calder-vonn', ['default', '31169', ''])
    assert_equal '칼더 본(Calder Vonn)이라는 귀족이다. 본(Vonn)을 처치해야 해.',
      N.transform('칼더 본(Calder Vonn)이라는 귀족이다. 본을 처치해야 해.', 'person:calder-vonn', ['default', '55034', ''])
    assert_equal '본은 조심해야 해.',
      N.transform('본은 조심해야 해.', 'person:calder-vonn', ['default', '14524', ''])
  end

  def test_sigra_family_spelling_and_idempotence
    once = N.transform('시그라 토린(Sigra Thorin)을 도왔다. 시그라에게 돌아갔다.',
                       'person:sigra-thorin', ['default', '812', ''])
    assert_equal '시그라 소린(Sigra Thorin)을 도왔다. 시그라(Sigra)에게 돌아갔다.', once
    assert_equal once, N.transform(once, 'person:sigra-thorin', ['default', '812', ''])
  end

  def test_source_complete_matcher_scope_and_registered_gate
    inventory = N::M.table(N::M::INVENTORY).map(&:to_h)
                      .to_h { |row| [N::M.key(row), row] }
    glossary = N::M.table(File.join(N::M::AUDIT, 'proper-name-glossary.tsv')).map(&:to_h)
    index = N::M.table(N::M::INDEX).map(&:to_h)
    definitions_path = File.join(N::M::AUDIT, 'proper-name-discovery-definitions-D21105.tsv')
    reviews_path = File.join(N::M::AUDIT, 'proper-name-discovery-D21105.tsv')
    entities = N::DEFINITIONS.map { |row| row['entity_key'] }.to_set
    registered_entities = glossary.map { |row| row['entity_key'] }.to_set & entities
    definitions_exists = File.file?(definitions_path)
    reviews_exist = File.file?(reviews_path)
    if definitions_exists && reviews_exist
      definitions = N::M.table(definitions_path).map(&:to_h)
      reviews = N::M.table(reviews_path).map(&:to_h)
      hits = build_occurrences(inventory.values, definitions).map do |values|
        OCCURRENCE_HEADERS.zip(values).to_h
      end
    elsif definitions_exists || reviews_exist || registered_entities.any?
      flunk 'complete prepared D21105 manifest required; refusing to rebuild after registration'
    else
      definitions, reviews, hits = N.build_artifacts(inventory, glossary, index)
    end
    counts = hits.group_by { |row| row['entity_key'] }.transform_values(&:length)
    assert_equal({
      'person:stellan-reitan' => 14,
      'person:telemachus-rasp' => 12,
      'person:calder-vonn' => 11,
      'person:sigra-thorin' => 8
    }, counts)
    assert_equal 45, reviews.length
    assert_equal reviews.length, reviews.map { |row| N::M.key(row) }.uniq.length
    assert_equal 25, reviews.count { |row| row['old'] != row['new'] }
    expected_matches = hits.map { |row| [row['entity_key'], *N::M.key(row)] }.sort
    reviewed_matches = reviews.flat_map do |row|
      row['entity_key'].split('|').map do |entity|
        [entity, *N::M.key(row)]
      end
    end.sort
    assert_equal expected_matches, reviewed_matches
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    assert_equal %w[base default], reviews.map { |row| row['resource'] }.uniq.sort
    refute hits.any? { |row| %w[19818 14524 56743 22447 41621 51766].include?(row['ID_Linha']) }

    if registered_entities.any?
      assert_equal entities, registered_entities
      registered = index.select do |row|
        expected_matches.include?([row['entity_key'], *N::M.key(row)])
      end
      assert_equal expected_matches,
        registered.map { |row| [row['entity_key'], *N::M.key(row)] }.sort
      reviews.each do |row|
        source = inventory.fetch(N::M.key(row))
        assert_equal row['new'], source['work_text']
        row['entity_key'].split('|').each do |entity|
          entry = registered.find do |candidate|
            candidate['entity_key'] == entity && N::M.key(candidate) == N::M.key(row)
          end
          refute_nil entry
          assert_equal row['status'], entry['status']
        end
      end
    else
      ReviewedProperNameDiscovery.validate!(definitions, reviews, hits, glossary, index)
      reviews.each do |row|
        assert_equal row['old'], inventory.fetch(N::M.key(row))['work_text']
      end
    end
  end
end
