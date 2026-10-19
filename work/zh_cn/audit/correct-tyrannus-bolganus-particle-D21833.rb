#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module CorrectTyrannusBolganusParticleD21833
  extend self

  M = ReviewedNameBatches
  KEY = ['default', '57657', ''].freeze
  ENTITY = 'title:tyrannus-bolganus'
  MAIN_REVIEW = File.join(__dir__, 'proper-name-discovery-D21833.tsv')
  MAIN_MANIFEST = File.join(__dir__, 'proper-name-edits-D21833.tsv')
  CORRECTION = File.join(__dir__, 'proper-name-correction-edits-D21833.tsv')
  CORRECTION_NOTE = 'D-21833 corrective pass: restore the accusative particle 를 after the bilingual title before 소개합니다.'

  def update_review_file(path)
    table = M.table(path)
    row = table.find { |candidate| M.key(candidate) == KEY }
    raise "missing target #{KEY.inspect} in #{path}" unless row
    raise "unexpected title entity in #{path}" unless row['entity_key'].split('|').include?(ENTITY)
    row['new'] = @corrected
    row['evidence'] = "#{row['evidence']} #{CORRECTION_NOTE}"
    M.write_table(path, table.headers, table.map(&:to_h))
  end

  def run
    [CORRECTION, File.join(__dir__, 'proper-name-correction-D21833-20261019.md')].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end
    inventory = M.refresh_inventory
    source = inventory.fetch(KEY)
    @original = source.fetch('work_text')
    expected = '볼간(Bolgan)을 막아 내는 자(Tyrannus Bolganus) 소개합니다!'
    raise "stale correction target: #{@original}" unless @original.end_with?(expected)
    @corrected = @original.sub(expected, '볼간(Bolgan)을 막아 내는 자(Tyrannus Bolganus)를 소개합니다!')
    raise 'correction did not change exactly one particle' unless @corrected != @original &&
      @original.scan(expected).length == 1

    main = M.table(MAIN_MANIFEST)
    prior = main.find { |candidate| M.key(candidate) == KEY }
    raise 'missing original D-21833 manifest row' unless prior && prior['new'] == @original
    correction_row = prior.to_h.merge(
      'old' => @original,
      'new' => @corrected,
      'evidence' => "#{prior['evidence']} #{CORRECTION_NOTE}",
      'previous_status' => JSON.generate(ENTITY => 'accepted'),
      'previous_evidence' => JSON.generate(ENTITY => 'D-21833 accepted title-label review.')
    )
    M.write_table(CORRECTION, M::HEADERS, [correction_row])
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D21833-correction"
    checks = ProperNameCellEditor.apply(M::ROOT, CORRECTION, backup_dir, M.hashes)
    verify_output = M.command!(
      'ruby', File.join(M::AUDIT, 'verify-proper-name-edits.rb'),
      '--review', CORRECTION, '--backup-dir', backup_dir
    )

    update_review_file(MAIN_REVIEW)
    update_review_file(MAIN_MANIFEST)
    manifest_verify = M.command!(
      'ruby', File.join(M::AUDIT, 'verify-proper-name-edits.rb'),
      '--review', MAIN_MANIFEST,
      '--backup-dir', "/private/tmp/ko-translate-backups/20261018/before-proper-name-D21833"
    )
    post = M.refresh_inventory.fetch(KEY).fetch('work_text')
    raise 'corrected title cell mismatch' unless post == @corrected
    puts "D-21833 particle correction PASS: #{checks.inspect}"
    puts verify_output
    puts manifest_verify
  end
end

CorrectTyrannusBolganusParticleD21833.run if $PROGRAM_NAME == __FILE__
