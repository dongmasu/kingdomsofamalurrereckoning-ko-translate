#!/usr/bin/env ruby

require_relative 'review-tear-of-mitharu-D21807'

module TestReviewTearOfMitharuD21807
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    review = ReviewTearOfMitharuD21807
    inventory = review::M.refresh_inventory
    hashes = review::M.hashes
    protected_paths = [
      review::M::INDEX, review::GLOSSARY,
      File.join(review::AUDIT, 'proper-name-discovery-D21807.tsv'),
      File.join(review::AUDIT, 'proper-name-short-label-dispositions-D21807.tsv'),
      review::SHORT_SNAPSHOT
    ]
    protected_hashes = protected_paths.to_h do |path|
      [path, Digest::SHA256.file(path).hexdigest]
    end
    definitions = review::M.table(review::DEFINITIONS).map(&:to_h)
    rows = review::M.table(File.join(review::AUDIT, 'proper-name-edits-D21807.tsv')).map(&:to_h)
    short_rows = review::M.table(review::SHORT_DISPOSITIONS).map(&:to_h)
    index = review::M.table(review::M::INDEX).map(&:to_h)
    glossary = review::M.table(review::GLOSSARY).map(&:to_h)

    assert(definitions.length == 1 &&
           definitions.first.fetch('entity_key') == 'unique_item:tear-of-mitharu',
           'expected a distinct unique-item entity')
    assert(definitions.first.fetch('korean_canonical') == '미사루의 눈물(Tear of Mitharu)',
           'expected the atomic bilingual item name')
    assert(rows.length == 11, 'expected all 11 exact English source keys')
    assert(rows.map { |row| review::M.key(row) }.to_set == review::KEYS.to_set,
           'expected full affix/base/default exact-name coverage')
    assert(rows.group_by { |row| row.fetch('status') }.transform_values(&:length) ==
           { 'accepted' => 9, 'not-an-issue' => 2 },
           'unexpected edit/no-edit disposition counts')
    assert(rows.all? do |row|
             inventory.fetch(review::M.key(row)).fetch('work_text') == row.fetch('new')
           end, 'active text must match every reviewed post-edit value')
    assert(rows.select { |row| row['resource'] == 'affix' }.all? do |row|
             row['new'].include?('미사루의 눈물(Tear of Mitharu) 가져오기:')
           end, 'all six action variants must atomically annotate the item')
    assert(rows.find { |row| row['ID_Linha'] == '13271' }['status'] == 'not-an-issue',
           'the already paired dialogue occurrence must remain unchanged')
    assert(rows.find { |row| row['ID_Linha'] == '54405' }['status'] == 'not-an-issue',
           'the already paired payment-record occurrence must remain unchanged')
    assert(rows.find { |row| row['ID_Linha'] == '43776' }['chinese'].include?('撕裂'),
           'the Chinese mistranslation must remain explicit in the evidence')
    assert(rows.all? { |row| row['english'].match?(/Tear of Mitharu/i) } &&
           rows.all? { |row| row['japanese'].include?('ミサールの涙') },
           'every source key must retain aligned English and Japanese evidence')
    short_rows_by_key = short_rows.to_h { |row| [review::M.key(row), row] }
    deity_rows = index.select do |row|
      row['entity_key'] == 'deity:mitharu' &&
        review::KEYS.include?(review::M.key(row))
    end
    assert(deity_rows.length == 11, 'expected prior deity-index records for all overlapping keys')
    assert(deity_rows.all? do |row|
             prior = JSON.parse(short_rows_by_key.fetch(review::M.key(row))
                                   .fetch('prior_index_dispositions_json'))
             prior.any? do |entity, status, _evidence|
               entity == 'deity:mitharu' && status == row.fetch('status')
             end
           end, 'overlapping Mitharu deity dispositions must remain unchanged')
    assert(glossary.any? { |row| row.fetch('entity_key') == review::ENTITY },
           'the item must be registered in the glossary')
    item_rows = index.select do |row|
      row['entity_key'] == review::ENTITY &&
        review::KEYS.include?(review::M.key(row))
    end
    assert(item_rows.length == 11, 'the occurrence index must cover every exact source key')
    assert(!CSV.read(review::SHORT_SNAPSHOT, headers: true, col_sep: "\t")
                .any? { |row| row['english_candidate'] == review::ENGLISH },
           'registered item must leave the bounded short-label candidate queue')
    assert(hashes == review::M.hashes &&
           protected_hashes.all? { |path, hash| Digest::SHA256.file(path).hexdigest == hash },
           'verification must not mutate active CSV or audit artifacts')
    puts 'D-21807 exact coverage, registration, prior-decision preservation, and no-mutation tests: PASS'
  end
end

TestReviewTearOfMitharuD21807.run if $PROGRAM_NAME == __FILE__
