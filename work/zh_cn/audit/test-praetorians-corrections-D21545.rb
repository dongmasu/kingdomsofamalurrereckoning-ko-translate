#!/usr/bin/env ruby

require 'digest'
require 'minitest/autorun'
require_relative 'review-praetorians-corrections-D21545'

class PraetoriansCorrectionsD21545Test < Minitest::Test
  R = PraetoriansCorrectionsD21545
  M = ReviewedNameBatches

  def self.saved_or_planned
    @saved_or_planned ||= if File.file?(File.join(__dir__, 'proper-name-edits-D21545.tsv'))
      [M.table(File.join(__dir__, 'proper-name-edits-D21545.tsv')).map(&:to_h), true]
    else
      [
        R.prepare,
        false
      ]
    end
  end

  def rows
    self.class.saved_or_planned.fetch(0)
  end

  def applied?
    self.class.saved_or_planned.fetch(1)
  end

  def inventory
    @inventory ||= R.source_inventory
  end

  def test_exact_existing_scope_and_dispositions
    assert_equal %w[20249 5766 32211], rows.map { |row| row.fetch('ID_Linha') }
    assert_equal [R::ENTITY], rows.map { |row| row.fetch('entity_key') }.uniq
    assert rows.all? { |row| row.fetch('status') == 'accepted' }
    previous = rows.to_h do |row|
      [row.fetch('ID_Linha'), R::PATCHES.fetch(row.fetch('ID_Linha')).fetch('previous_status')]
    end
    assert_equal({ '20249' => 'uncertain', '5766' => 'accepted', '32211' => 'accepted' }, previous)
    assert_equal 3, rows.count { |row| row.fetch('old') != row.fetch('new') }
  end

  def test_aligned_sources_and_exact_korean_changes
    rows.each do |row|
      key = M.key(row)
      source = inventory.fetch(key)
      assert_equal JSON.parse(source.fetch('en_texts_json')).compact.join("\n"), row.fetch('english')
      assert_equal JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"), row.fetch('japanese')
      assert_equal source.fetch('zh_text'), row.fetch('chinese')
      expected = applied? ? row.fetch('new') : source.fetch('work_text')
      assert_equal expected, source.fetch('work_text')
      assert_equal row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE),
                   row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE)
      assert_equal row.fetch('old').scan(/\r\n|\r|\n/),
                   row.fetch('new').scan(/\r\n|\r|\n/)
    end
    assert_includes rows.find { |row| row.fetch('ID_Linha') == '20249' }.fetch('new'),
                    '프레토리안 근위대(Praetorians)의 주의를 끌지 않고'
    %w[5766 32211].each do |id|
      corrected = rows.find { |row| row.fetch('ID_Linha') == id }.fetch('new')
      assert_includes corrected, '프레토리안 근위대(Praetorians)가'
      refute_includes corrected, 'Praetorians)이'
    end
  end

  def test_previous_decisions_are_captured_without_duplicate_registration
    index = M.table(M::INDEX).map(&:to_h)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    assert_equal 1, glossary.count { |row| row.fetch('entity_key') == R::ENTITY }
    rows.each do |row|
      prior = index.find do |entry|
        entry.fetch('entity_key') == R::ENTITY && M.key(entry) == M.key(row)
      end
      refute_nil prior
      if applied?
        assert_equal R::PATCHES.fetch(row.fetch('ID_Linha')).fetch('previous_status'),
                     JSON.parse(row.fetch('previous_status')).fetch(R::ENTITY)
        assert_match(/D-21541/, JSON.parse(row.fetch('previous_evidence')).fetch(R::ENTITY))
      else
        assert_equal R::PATCHES.fetch(row.fetch('ID_Linha')).fetch('previous_status'),
                     prior.fetch('status')
      end
    end
  end

  def test_prepare_is_read_only
    skip 'correction already applied' if applied?

    paths = [
      R::PROPOSAL, M::INDEX, ReviewedProperNameDiscovery::GLOSSARY,
      *M::RESOURCES.map { |resource| M.csv_path(resource) }
    ]
    before = paths.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end
    reject_write = ->(*) { flunk 'read-only correction preparation attempted a write' }
    M.stub(:write_table, reject_write) do
      M.stub(:refresh_inventory, reject_write) do
        capture_io { R.prepare }
      end
    end
    after = paths.to_h do |path|
      [path, File.file?(path) ? Digest::SHA256.file(path).hexdigest : nil]
    end
    assert_equal before, after
  end
end
