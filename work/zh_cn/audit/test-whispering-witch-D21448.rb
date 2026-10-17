#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'review-whispering-witch-D21448'

class WhisperingWitchD21448Test < Minitest::Test
  M = WhisperingWitchD21448

  def test_short_names_and_particles
    %w[가 는 의 로 와 라는 ?].each do |suffix|
      assert_equal "#{M::CANONICAL}#{suffix}", M.normalize("속삭이는 마녀#{suffix}")
    end
    assert_equal "추적 대상: #{M::CANONICAL}", M.normalize('추적 대상: 속삭이는 마녀')
  end

  def test_transliteration_with_and_without_existing_pair
    %w[위스퍼링\ 위치 위스퍼링\ 위치(Whispering\ Witch)].each do |name|
      expected = "#{M::CANONICAL}라는 해적이다."
      assert_equal expected, M.normalize("#{name}라는 해적이다.")
      assert_equal expected, M.normalize(expected)
    end
  end

  def test_existing_pair_is_idempotent
    text = "#{M::CANONICAL}의 소문과 #{M::CANONICAL} 처치하기"
    assert_equal text, M.normalize(text)
    assert_equal text, M.normalize(M.normalize(text))
    refute_includes M.normalize(text), '(Whispering Witch)(Whispering Witch)'
  end

  def test_unrelated_annotations_and_opaque_tokens_are_protected
    text = '속삭이는 마녀(Other Witch), (속삭이는 마녀), ' \
           '$속삭이는 마녀$ <속삭이는 마녀> {위스퍼링 위치} ' \
           '데드 켈(Dead Kel), 드롤드 바리(Drold Barri), 마녀'
    assert_equal text, M.normalize(text)
  end

  def test_repeated_names_and_line_breaks
    old = "#{M::CANONICAL}라 불리는 여자\r\n\r\n" \
          "보고서 477, 5분, 12명. 속삭이는 마녀로 불렸다.\n" \
          '속삭이는 마녀가 싸운다. 마녀의 정체; 드롤드 바리(Drold Barri).'
    expected = "#{M::CANONICAL}라 불리는 여자\r\n\r\n" \
               "보고서 477, 5분, 12명. #{M::CANONICAL}로 불렸다.\n" \
               "#{M::CANONICAL}가 싸운다. 마녀의 정체; 드롤드 바리(Drold Barri)."
    assert_equal expected, M.normalize(old)
    assert_equal expected, M.normalize(expected)
    assert_equal old.scan(/\r\n|\r|\n/), expected.scan(/\r\n|\r|\n/)
  end

  def test_full_live_prepare_is_read_only_and_covers_exact_scope
    # Fail if prepare attempts the shared-inventory refresh or any helper write.
    no_write = ->(*) { flunk 'prepare attempted a helper write/refresh/apply' }
    files = [M::DEFINITIONS, M::REVIEWS]
    before = files.map { |path| File.exist?(path) }
    result = nil
    M::M.stub(:refresh_inventory, no_write) do
      M::M.stub(:write_table, no_write) do
        M::M.stub(:run, no_write) do
          ReviewedProperNameDiscovery.stub(:run, no_write) do
            capture_io { result = M.prepare }
          end
        end
      end
    end
    definitions, reviews = result
    assert_equal before, files.map { |path| File.exist?(path) }
    assert_equal 1, definitions.length
    assert_equal '', definitions.first.fetch('english_aliases')
    assert_equal 'person', definitions.first.fetch('category')
    assert_equal M::CANONICAL, definitions.first.fetch('korean_canonical')
    assert_equal M::DEFAULT_IDS.sort, reviews.map { |row| row.fetch('ID_Linha') }.sort
    assert reviews.all? { |row| row['resource'] == 'default' && row['Tipo_Variante'] == '' }
    assert_equal M::EDIT_IDS.sort,
                 reviews.select { |row| row['old'] != row['new'] }.map { |row| row['ID_Linha'] }.sort
    assert_equal 8, reviews.count { |row| row['status'] == 'not-an-issue' }
    assert_equal 22, reviews.sum { |row| row.fetch('new').scan(M::CANONICAL).length }
    reviews.each do |row|
      assert_equal row['new'], M.normalize(row['new'])
      assert_equal row['old'].scan(/\r\n|\r|\n/), row['new'].scan(/\r\n|\r|\n/)
      assert_equal row['old'].scan(ReviewedProperNameDiscovery::OPAQUE),
                   row['new'].scan(ReviewedProperNameDiscovery::OPAQUE)
    end
  end
end
