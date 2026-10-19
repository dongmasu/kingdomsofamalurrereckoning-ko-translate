#!/usr/bin/env ruby
require 'set'
require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module ProperNameResidualD21658
  extend self
  M = ReviewedNameBatches
  D = 21_658
  INVENTORY = M::INVENTORY
  OLD_CANDIDATES = File.join(__dir__, 'proper-name-candidates.tsv')
  NEW_CANDIDATES = '/private/tmp/proper-name-candidates-D21657.tsv'
  DISCOVERY_MANIFESTS = %w[
    proper-name-candidate-refresh-D21639.tsv
    proper-name-candidate-refresh-D21447.tsv
  ].map { |name| File.join(__dir__, name) }.freeze
  PENDING_DISCOVERIES = Dir.glob(File.join(__dir__, 'proper-name-discovery-*-pending.tsv')).sort.freeze
  PENDING_DEFINITIONS = Dir.glob(File.join(__dir__, 'proper-name-definitions-*-pending.tsv')).sort.freeze

  def table(path)
    M.table(path)
  end

  def validate_candidate_refresh!
    old = table(OLD_CANDIDATES).map { |r| r.fetch('english_candidate') }.to_set
    fresh = table(NEW_CANDIDATES).map { |r| r.fetch('english_candidate') }.to_set
    added = (fresh - old).to_a.sort
    removed = (old - fresh).to_a.sort
    reviewed = DISCOVERY_MANIFESTS.flat_map do |path|
      table(path).map { |r| r.fetch('candidate') }
    end.to_set
    raise "heuristic removed candidates: #{removed.inspect}" unless removed.empty?
    raise "new candidates lack a prior row-level screen: #{(added.to_set - reviewed).to_a.sort.inspect}" unless
      (added.to_set - reviewed).empty?
    raise 'expected D-21639/D-21447 candidate delta changed' unless
      added.length == 24 && (reviewed & added.to_set).length == 24
    [old.length, fresh.length, added]
  end

  def validate_pending_snapshots!
    glossary = table(File.join(__dir__, 'proper-name-glossary.tsv'))
      .map { |r| r.fetch('entity_key') }.to_set
    occurrence = table(M::INDEX).map do |r|
      [r.fetch('entity_key'), *M.key(r)]
    end.to_set
    entity_count = 0
    PENDING_DEFINITIONS.each do |path|
      definitions = table(path)
      missing = definitions.map { |r| r.fetch('entity_key') }.reject { |key| glossary.include?(key) }
      raise "#{File.basename(path)} has unregistered proposal entities: #{missing.inspect}" unless missing.empty?
      entity_count += definitions.length
    end
    row_count = 0
    PENDING_DISCOVERIES.each do |path|
      rows = table(path)
      missing = rows.reject do |row|
        row.fetch('entity_key').split('|').all? do |entity|
          occurrence.include?([entity, *M.key(row)])
        end
      end
      raise "#{File.basename(path)} has uncovered source keys: #{missing.map { |r| M.key(r) }.inspect}" unless missing.empty?
      row_count += rows.length
    end
    [PENDING_DISCOVERIES.length, row_count, PENDING_DEFINITIONS.length, entity_count]
  end

  def run
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    prior = docs.values.first[marker]
    raise 'expected D-21657 checkpoint' unless prior&.include?('Latest verified proper-name batch: D-21657 ')
    raise 'checkpoint copies disagree' unless docs.values.all? { |text| text[marker] == prior }
    old_hashes = M.hashes
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_hash = Digest::SHA256.file(glossary_path).hexdigest
    old_count, fresh_count, additions = validate_candidate_refresh!
    pending_counts = validate_pending_snapshots!
    data_validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    candidate_tests = M.command!('ruby', File.join(__dir__, 'test-proper-name-candidates.rb'))
    residual_tests = M.command!('ruby', File.join(__dir__, 'test-audit-proper-name-residual-final.rb'))
    raise 'candidate tests failed' unless candidate_tests.include?('0 failures') && candidate_tests.include?('0 errors')
    raise 'residual tests failed' unless residual_tests.include?('0 failures') && residual_tests.include?('0 errors')
    raise 'residual source/index audit incomplete' unless residual.include?('missing=0') &&
      residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')
    raise 'data validation failed' unless data_validation.include?('PASS')
    hashes = M.hashes
    raise 'CSV changed during read-only validation' unless hashes == old_hashes
    raise 'index changed during read-only validation' unless Digest::SHA256.file(M::INDEX).hexdigest == index_hash
    raise 'glossary changed during read-only validation' unless Digest::SHA256.file(glossary_path).hexdigest == glossary_hash

    index = table(M::INDEX)
    counts = index.group_by { |r| r['status'] }.transform_values(&:length)
    held = index.select { |r| r['status'] == 'uncertain' }
    old_backups = prior[/Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1]
    raise 'prior backup history missing' unless old_backups
    hash_lines = hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    report_name = "proper-name-residual-validation-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    addendum_name = "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"
    addition_text = additions.map { |term| "`#{term}`" }.join(', ')
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Performed a read-only all-resource residual gate; no CSV, glossary, occurrence-index, or historical tally changes.
      The English lexical heuristic contains #{fresh_count} phrases versus #{old_count} in its saved baseline: #{additions.length} newly surfaced, zero removed. All additions were already reviewed in D-21447/D-21639: #{addition_text}.
      All #{pending_counts[0]} categorized pending discovery snapshots (#{pending_counts[1]} rows) have every component entity/source key in the active occurrence index; all #{pending_counts[2]} pending definition snapshots (#{pending_counts[3]} entities) are present in the active glossary. These files are historical snapshots, not remaining queues.
      Indexed matches: #{index.length}; #{counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}.
      Remaining unreviewed indexed matches: #{index.count { |r| r['status'] == 'needs-context' }}.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |r| M.key(r) }.uniq.length} distinct CSV row keys; do not reopen without new evidence.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Candidate and occurrence indexes are bounded discovery aids, not an exhaustive universe. Full proper-name discovery remains incomplete; do not claim overall completion.
      Active CSV SHA-256 (unchanged):
      #{hash_lines}
      Last actual CSV-edit backups (retained; this validation made no edits):
      #{old_backups.rstrip}
      Aligned inventory: #{table(INVENTORY).length} rows; SHA-256 `#{Digest::SHA256.file(INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_hash}`.
      Proper-name glossary: #{table(glossary_path).length} entries; SHA-256 `#{glossary_hash}`.
      Heuristic delta: #{additions.length} additions, zero removals; all additions have prior dispositions.
      Residual audit, data validation, candidate tests, pending-snapshot reconciliation, and checkpoint integrity: PASS.
      Report: `work/zh_cn/audit/#{report_name}`.
      Addendum: `work/zh_cn/audit/#{addendum_name}`.
      Next: D-#{D + 1}; continue documented residual holds and source discovery; no overall completion claim.
    TEXT
    File.write(File.join(__dir__, report_name), <<~TEXT)
      # D-#{D}: Proper-Name Residual Validation

      ## Scope

      Rebuilt the English-led lexical candidate inventory from the active
      aligned source inventory and glossary. Compared it with the saved
      baseline and reconciled all newly surfaced terms against the earlier
      candidate-review manifests. Checked categorized pending snapshots
      against the live occurrence index and glossary, without applying any
      proposed rows or reopening terminal decisions.

      ## Results

      - Lexical heuristic: #{old_count} baseline / #{fresh_count} current; #{additions.length} added and zero removed. Every addition is covered by D-21447 or D-21639.
      - Pending discovery snapshots: #{pending_counts[0]} files, #{pending_counts[1]} rows; zero missing component entity/source keys.
      - Pending definition snapshots: #{pending_counts[2]} files, #{pending_counts[3]} entities; zero entities missing from the active glossary.
      - Current indexed unresolved holds: #{held.length} matches in #{held.map { |r| M.key(r) }.uniq.length} rows; all are already reviewed and remain closed absent new evidence.

      ## Validation

      #{data_validation.strip}

      #{residual.strip}

      #{candidate_tests.strip}

      #{residual_tests.strip}

      No CSV, glossary, occurrence index, or global tally changed. No PAK or
      PAK-derived resource was consulted. The heuristic and indexes are not
      exhaustive; full proper-name discovery remains incomplete.

      #{summary}
    TEXT
    File.write(File.join(__dir__, addendum_name), <<~TEXT)
      # D-#{D} Read-Only Validation Addendum

      No translation cells were edited, so no new CSV backup was required.
      Active CSV, glossary and occurrence-index hashes are unchanged. Existing
      terminal decisions were only checked for reconciliation and were not
      reopened or recounted.

      #{summary}
    TEXT
    docs.each do |path, text|
      block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
      text = text.sub(marker, block)
      text += "\n## D-#{D}: Proper-Name Residual Validation\n\n#{summary}\n" if path == M::DOCS[3]
      File.write(path, text)
    end
    puts data_validation, residual, candidate_tests, residual_tests
  end
end

ProperNameResidualD21658.run if $PROGRAM_NAME == __FILE__
