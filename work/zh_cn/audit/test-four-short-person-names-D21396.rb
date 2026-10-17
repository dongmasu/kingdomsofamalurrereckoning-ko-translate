require 'minitest/autorun'
require_relative 'review-four-short-person-names-D21396'

class FourShortPersonNamesD21396Test < Minitest::Test
  def test_alder_repeated_mentions_and_existing_pairs
    assert_equal '앨더(Alder)가 앨더(Alder)를 불렀다.',
      FourShortPersonNamesD21396.transform('person:alder-malloi', '알더(Alder)가 올더를 불렀다.')
  end

  def test_bridgette_repeated_mentions
    assert_equal '브리짓(Bridgette)에게. 브리짓(Bridgette)은 준비 중.',
      FourShortPersonNamesD21396.transform('person:bridgette-malloi', '브리짓에게. 브리짓(Bridgette)은 준비 중.')
  end

  def test_angharad_signature_preserves_line_breaks
    assert_equal "사랑을 담아,\r\n앙가라드(Angharad)",
      FourShortPersonNamesD21396.transform('person:angharad-glyndowr', "사랑을 담아,\r\n앵거라드")
  end

  def test_pepin_role_stays_outside_the_name
    assert_equal '학자 페핀(Pepin)은 찾았나?',
      FourShortPersonNamesD21396.transform('person:pepin-jamane', '학자 페핀은 찾았나?')
  end

  def test_complete_new_scope_and_row_deduplication
    m = ReviewedNameBatches
    paths = (21396..21398).map { |d| File.join(__dir__, "proper-name-edits-D#{d}.tsv") }
    rows = if paths.all? { |path| File.file?(path) }
             paths.flat_map { |path| m.table(path).map(&:to_h) }
           else
             FourShortPersonNamesD21396.plan.fetch(:reviews)
           end
    assert_equal 104, rows.length
    assert_equal 104, rows.map { |row| m.key(row) }.uniq.length
    assert_equal 106, rows.sum { |row| JSON.parse(row['entity_dispositions_json']).length }
    FourShortPersonNamesD21396::CONFIG.each do |entity, config|
      actual = rows.select { |row| row['entity_key'].split('|').include?(entity) }
      assert_equal FourShortPersonNamesD21396.target_keys(config).sort,
        actual.map { |row| m.key(row) }.sort
      assert_equal config.fetch(:changes), actual.count { |row| JSON.parse(row['entity_dispositions_json'])[entity] == 'accepted' }
    end
  end
end
