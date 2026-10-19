#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'

module RecoverInterruptedD21725
  extend self
  M = ReviewedNameBatches
  D = 21_725
  BACKUP = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  REPORT = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  ADDENDUM = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")

  def run
    raise 'recovery artifacts missing' unless File.file?(MANIFEST) && File.directory?(BACKUP)
    raise 'D-21725 report already exists; do not overwrite' if File.exist?(REPORT) || File.exist?(ADDENDUM)
    rows = M.table(MANIFEST).map(&:to_h)
    raise 'unexpected D-21725 manifest size' unless rows.length == 44
    raise 'unexpected D-21725 resources' unless rows.map { |row| row.fetch('resource') }.uniq == ['default']
    backup = File.join(BACKUP, File.basename(M.csv_path('default')))
    raise 'backup not byte-identical to recorded pre-edit hash' unless
      Digest::SHA256.file(backup).hexdigest == '3c452c81290756a30e27ef25b1f6a36cff38a41c90b00914469a87344b80ec85'
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', BACKUP
    )
    checks = [{
      resource: 'default', cells: rows.count { |row| row.fetch('old') != row.fetch('new') },
      rows: 65_135,
      before_sha256: Digest::SHA256.file(backup).hexdigest,
      after_sha256: Digest::SHA256.file(M.csv_path('default')).hexdigest,
      backup: backup,
      validation: 'BOM/line-endings/rows/order/tokens/non-target bytes/inverse PASS'
    }]
    inventory = M.refresh_inventory
    rows.each do |row|
      raise "D-#{D} target mismatch at #{M.key(row).inspect}" unless
        inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('new')
    end
    M.checkpoint(D, rows, checks, verification, inventory, review_states: ['needs-context'])

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    candidates = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    snapshot = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
    raise 'D-21725 snapshot already exists' if File.exist?(snapshot)
    M.write_table(snapshot, ShortLabelDiscovery20261018::HEADERS, candidates)
    line = "Next batch: D-#{D + 1}; continue unreviewed short-label candidates from `#{File.basename(snapshot)}` (#{candidates.length} bounded groups; not exhaustive or a completion estimate)."
    M::DOCS.each do |path|
      text = File.read(path)
      raise "D-21726 checkpoint missing in #{path}" unless
        text.sub!(/Next batch: D-#{D + 1};.*?\n/, "#{line}\n")
      File.write(path, text)
    end
    puts "Recovered D-#{D} checkpoint and #{candidates.length}-group next-candidate snapshot; CSV was not modified."
  end
end

RecoverInterruptedD21725.run if $PROGRAM_NAME == __FILE__
