#!/usr/bin/env ruby

require_relative 'review-temperance-D21808'

module TestReviewTemperanceD21808
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def verify_proposal(review, inventory)
    definition, rows = review.build_rows(
      inventory, review::M.table(review::M::INDEX).map(&:to_h)
    )
    assert(definition.fetch('entity_key') == 'title:temperance',
           'the bestowed epithet must be registered as a title')
    assert(definition.fetch('korean_canonical') == '절제(Temperance)',
           'expected the canonical bilingual epithet')
    assert(rows.length == 5 &&
           rows.map { |row| review::M.key(row) }.to_set == review::KEYS.to_set,
           'all source-wide exact and homonym uses must be covered')
    assert(rows.group_by { |row| row['status'] }.transform_values(&:length) ==
           { 'accepted' => 1, 'not-an-issue' => 3, 'excluded' => 1 },
           'expected one label edit, three retained names, and one generic exclusion')
    proper = rows.reject { |row| row['ID_Linha'] == '59722' }
    assert(proper.all? { |row| row['japanese'].include?('節義ある者') &&
                              row['chinese'].match?(/节制|谨慎节制/) },
           'aligned Japanese and Chinese name evidence must be reviewed')
    generic = rows.find { |row| row['ID_Linha'] == '59722' }
    assert(generic['status'] == 'excluded' && generic['old'] == generic['new'],
           'the lowercase generic-drinking use must remain unchanged and excluded')
    assert(rows.find { |row| row['ID_Linha'] == '10493' }['new'] ==
           '절제(Temperance)', 'standalone label should receive a bilingual pair')
    assert(rows.find { |row| row['ID_Linha'] == '37564' }['old']
             .include?('신중한 절제(Prudent Temperance)'),
           'the qualified source alias must retain its complete English pair')
  end

  def verify_applied(review, inventory)
    definition = review::M.table(review::DEFINITIONS).first
    rows = review::M.table(
      File.join(review::AUDIT, 'proper-name-edits-D21808.tsv')
    ).map(&:to_h)
    short_rows = review::M.table(review::SHORT_DISPOSITIONS).map(&:to_h)
    index = review::M.table(review::M::INDEX).map(&:to_h)
    glossary = review::M.table(review::GLOSSARY).map(&:to_h)
    assert(definition.fetch('entity_key') == 'title:temperance',
           'the bestowed epithet must be registered as a title')
    assert(definition.fetch('korean_canonical') == '절제(Temperance)',
           'expected the canonical bilingual epithet')
    assert(rows.length == 5 &&
           rows.map { |row| review::M.key(row) }.to_set == review::KEYS.to_set,
           'all source-wide exact and homonym uses must be covered')
    assert(rows.group_by { |row| row['status'] }.transform_values(&:length) ==
           { 'accepted' => 1, 'not-an-issue' => 3, 'excluded' => 1 },
           'unexpected recorded dispositions')
    assert(rows.all? do |row|
             inventory.fetch(review::M.key(row)).fetch('work_text') == row.fetch('new')
           end, 'active Korean cells must match the reviewed manifest')
    generic = rows.find { |row| row['ID_Linha'] == '59722' }
    assert(generic['status'] == 'excluded' && generic['old'] == generic['new'],
           'the generic-drinking use must be excluded without editing')
    assert(rows.find { |row| row['ID_Linha'] == '37564' }['new']
             .include?('신중한 절제(Prudent Temperance)'),
           'the qualified source alias must remain fully paired')
    assert(glossary.any? { |row| row['entity_key'] == review::ENTITY },
           'the title must be registered in the glossary')
    indexed = index.select do |row|
      row['entity_key'] == review::ENTITY &&
        review::KEYS.include?(review::M.key(row))
    end
    assert(indexed.length == 5, 'the occurrence index must cover all five keys')
    previous = short_rows.to_h { |row| [review::M.key(row), row] }
    short_rows.each do |row|
      key = review::M.key(row)
      expected = JSON.parse(row.fetch('prior_index_dispositions_json'))
      actual = index.select do |entry|
        review::M.key(entry) == key &&
          expected.any? { |entity, _status, _evidence| entity == entry['entity_key'] }
      end.map do |entry|
        [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')]
      end
      assert(actual.sort == expected.sort,
             "prior dispositions changed at #{key.join(':')}")
    end
    snapshot = review::M.table(review::SHORT_SNAPSHOT).map(&:to_h)
    assert(snapshot.none? { |row| row['english_candidate'] == review::ENGLISH },
           'registered Temperance must leave the bounded candidate queue')
  end

  def run
    review = ReviewTemperanceD21808
    inventory = review::M.refresh_inventory
    hashes = review::M.hashes
    protected_paths = [
      review::M::INDEX, review::GLOSSARY,
      File.join(review::AUDIT, 'proper-name-short-label-discovery-D21807.tsv'),
      review::SHORT_SNAPSHOT
    ]
    protected_hashes = protected_paths.to_h do |path|
      [path, Digest::SHA256.file(path).hexdigest]
    end
    if File.exist?(File.join(review::AUDIT, 'proper-name-edits-D21808.tsv'))
      verify_applied(review, inventory)
    else
      verify_proposal(review, inventory)
    end
    assert(hashes == review::M.hashes &&
           protected_hashes.all? { |path, hash| Digest::SHA256.file(path).hexdigest == hash },
           'proposal verification must not mutate active CSV or audit data')
    puts 'D-21808 exact coverage, bestowed-alias classification, and no-mutation tests: PASS'
  end
end

TestReviewTemperanceD21808.run if $PROGRAM_NAME == __FILE__
