#!/usr/bin/env ruby

require_relative 'review-templars-D21809'

module TestReviewTemplarsD21809
  extend self

  def assert(condition, message)
    raise message unless condition
  end

  def run
    review = ReviewTemplarsD21809
    inventory = review::M.refresh_inventory
    index = review::M.table(review::M::INDEX).map(&:to_h)
    before_hashes = review::M.hashes
    protected = [review::M::INDEX, review::GLOSSARY].to_h do |path|
      [path, Digest::SHA256.file(path).hexdigest]
    end
    applied_manifests = %w[21809 21810].map do |number|
      File.join(review::AUDIT, "proper-name-edits-D#{number}.tsv")
    end
    if applied_manifests.all? { |path| File.file?(path) }
      rows = applied_manifests.flat_map do |path|
        review::M.table(path).map(&:to_h)
      end
      indexed = index.select { |row| row.fetch('entity_key') == review::ENTITY }
      glossary = review::M.table(review::GLOSSARY).map(&:to_h)
      assert(rows.length == 51 &&
               rows.group_by { |row| row.fetch('status') }.transform_values(&:length) ==
                 { 'accepted' => 50, 'not-an-issue' => 1 },
             'the two applied 50/1-key batches must cover the exact source set')
      assert(indexed.length == 51 &&
               indexed.map { |row| review::M.key(row) }.uniq.length == 51 &&
               indexed.none? { |row| row.fetch('status') == 'needs-context' },
             'all faction occurrence keys must have one terminal entity disposition')
      assert(glossary.count { |row| row.fetch('entity_key') == review::ENTITY } == 1,
             'the faction must have exactly one glossary registration')
      assert(rows.all? do |row|
               inventory.fetch(review::M.key(row)).fetch('work_text') == row.fetch('new')
             end, 'active cells must match both applied manifests')
      assert(review::M.hashes == before_hashes &&
               protected.all? { |path, hash| Digest::SHA256.file(path).hexdigest == hash },
             'applied verification must not mutate CSV or indexed audit data')
      puts 'D-21809/D-21810 applied Templars coverage and no-mutation tests: PASS'
      return
    end

    definition, rows = review.build_rows(inventory, index)

    assert(definition.fetch('entity_key') == 'faction:gnome-templars',
           'Templars must be registered as the Gnomish faction/caste')
    assert(definition.fetch('korean_canonical') == '템플러(Templars)',
           'the canonical name must use the bilingual display')
    assert(rows.length == 51 && rows.map { |row| review::M.key(row) }.uniq.length == 51,
           'all 51 English plural source keys must be reviewed once')
    assert(rows.group_by { |row| row.fetch('status') }.transform_values(&:length) ==
             { 'accepted' => 50, 'not-an-issue' => 1 },
           'expected 50 standardized rows and one already-paired row')
    assert(rows.all? do |row|
             row.fetch('english').match?(/(?<![A-Za-z])Templars(?![A-Za-z])/i) &&
               row.fetch('japanese').include?('聖堂騎士') &&
               row.fetch('chinese').include?('圣殿骑士')
           end, 'each exact source row must have aligned English/Japanese/Chinese evidence')
    already_paired = rows.find { |row| row.fetch('ID_Linha') == '11' }
    assert(already_paired.fetch('old') == already_paired.fetch('new') &&
             already_paired.fetch('status') == 'not-an-issue',
           'the already canonical bilingual row must remain unchanged')
    lowercase = rows.find { |row| row.fetch('ID_Linha') == '24378' }
    assert(lowercase.fetch('english').match?(/(?<![A-Za-z])templars(?![A-Za-z])/i) &&
             lowercase.fetch('new').include?('템플러(Templars)'),
           'the lowercase source usage must be covered as the same Gnomish group')
    assert(rows.reject { |row| row.fetch('ID_Linha') == '11' }.all? do |row|
             row.fetch('new').scan('템플러(Templars)').length == 1 &&
               row.fetch('new').scan(/\r\n|\r|\n/) ==
                 row.fetch('old').scan(/\r\n|\r|\n/)
           end, 'each edited row must receive one canonical pair and preserve line breaks')
    assert(review.canonicalize('성전기사단은 규약을 지킨다.', ['default', 'x', '']) ==
             '템플러(Templars)는 규약을 지킨다.',
           'normalize the particle after a vowel-ending canonical label')
    assert(review.canonicalize('성전 기사단과 일한다.', ['default', 'x', '']) ==
             '템플러(Templars)와 일한다.',
           'normalize the connective particle after the canonical label')
    assert(review.canonicalize('템플러들은 결정했다.', ['default', 'x', '']) ==
             '템플러(Templars)들은 결정했다.',
           'preserve an existing Korean plural marker')
    assert(before_hashes == review::M.hashes &&
             protected.all? { |path, hash| Digest::SHA256.file(path).hexdigest == hash },
           'proposal verification must not mutate CSV or indexed audit data')
    puts 'D-21809 source coverage, faction classification, Korean form, and no-mutation tests: PASS'
  end
end

TestReviewTemplarsD21809.run if $PROGRAM_NAME == __FILE__
