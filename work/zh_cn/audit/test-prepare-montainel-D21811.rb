#!/usr/bin/env ruby

require_relative 'prepare-montainel-D21811'

module TestPrepareMontainelD21811
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    m = PrepareMontainelD21811::M
    before_hashes = m.hashes
    protected = [m::INDEX, ReviewedProperNameDiscovery::GLOSSARY].to_h do |path|
      [path, Digest::SHA256.file(path).hexdigest]
    end
    inventory = m.refresh_inventory
    index = m.table(m::INDEX).map(&:to_h)
    glossary = m.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    if glossary.any? { |row| row['entity_key'] == PrepareMontainelD21811::ENTITY }
      manifest = File.join(__dir__, 'proper-name-edits-D21811.tsv')
      rows = m.table(manifest).map(&:to_h)
      expected = PrepareMontainelD21811::EXPECTED
      assert(rows.length == expected.length &&
               rows.map { |row| m.key(row) }.uniq.length == expected.length,
             'applied manifest must contain all nine exact source keys')
      assert(rows.group_by { |row| row.fetch('status') }.transform_values(&:length) ==
               { 'accepted' => 6, 'not-an-issue' => 3 },
             'applied manifest must retain six edits and three unchanged labels')
      assert(rows.all? do |row|
               old, new_text = expected.fetch(m.key(row))
               row.fetch('old') == old && row.fetch('new') == new_text &&
                 inventory.fetch(m.key(row)).fetch('work_text') == new_text
             end, 'active Korean cells must match the exact reviewed manifest')
      owned = index.select do |row|
        row.fetch('entity_key') == PrepareMontainelD21811::ENTITY
      end
      assert(owned.length == expected.length &&
               owned.all? { |row| row.fetch('status') != 'needs-context' },
             'all nine Montainel occurrences must have terminal dispositions')
      assert(glossary.count do |row|
               row.fetch('entity_key') == PrepareMontainelD21811::ENTITY &&
                 row.fetch('korean_canonical') == '몬테이넬(Montainel)'
             end == 1, 'the confirmed Montainel person must be registered once')
      assert(before_hashes == m.hashes &&
               protected.all? { |path, hash| Digest::SHA256.file(path).hexdigest == hash },
             'post-edit verification must not mutate any project data')
      puts 'D-21811 applied Montainel manifest, active cells, index registration, and no-mutation tests: PASS'
      return
    end

    definition, rows = PrepareMontainelD21811.build_rows(inventory, index)
    assert(definition.fetch('korean_canonical') == '몬테이넬(Montainel)',
           'canonical person form must be bilingual and consistent')
    assert(rows.length == 9 && rows.map { |row| m.key(row) }.uniq.length == 9,
           'all nine exact Montainel source keys must be reviewed once')
    assert(rows.group_by { |row| row.fetch('status') }.transform_values(&:length) ==
             { 'accepted' => 6, 'not-an-issue' => 3 },
           'expected six normalization/pairing edits and three canonical labels')
    assert(rows.all? do |row|
             row.fetch('english').match?(/(?<![A-Za-z])Montainel(?![A-Za-z])/i) &&
             row.fetch('japanese').match?(/モンタイネル|Montainel/i) &&
               row.fetch('chinese').match?(/蒙泰纳尔|莫泰奈尔|Montainel/i)
           end, 'each reviewed row must have aligned English/Japanese/Chinese evidence')
    assert(rows.find { |row| row['ID_Linha'] == '2087' }['new'] ==
             '보관소 - 템플러 몬테이넬(Templar Montainel)',
           'preserve the existing complete compound label without nesting')
    assert(rows.find { |row| row['ID_Linha'] == '11202' }['new'] ==
             '몬테이넬(Montainel)',
           'retain the existing standalone bilingual label')
    assert(rows.find { |row| row['ID_Linha'] == '33182' }['new'].include?('관리자 몬테이넬(Montainel)') &&
             rows.find { |row| row['ID_Linha'] == '39845' }['new'].include?('성전 기사 몬테이넬(Montainel)'),
           'pair the person only while preserving localized rank/office wording')
    assert(before_hashes == m.hashes &&
             protected.all? { |path, hash| Digest::SHA256.file(path).hexdigest == hash },
           'proposal generation must not mutate active CSV, index, or glossary')
    puts 'D-21811 Montainel source coverage, cross-locale evidence, text preservation, and no-mutation tests: PASS'
  end
end

TestPrepareMontainelD21811.run if $PROGRAM_NAME == __FILE__
