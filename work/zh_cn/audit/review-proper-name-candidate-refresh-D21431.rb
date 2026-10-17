#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-candidates'

module ProperNameCandidateRefreshD21431
  extend self

  M = ReviewedNameBatches
  D = 21_431
  CANDIDATES = File.join(__dir__, 'proper-name-candidates.tsv')
  GLOSSARY = File.join(__dir__, 'proper-name-glossary.tsv')
  INDEX = M::INDEX
  TSV = File.join(__dir__, "proper-name-candidate-refresh-D#{D}.tsv")
  REPORT = File.join(__dir__, "proper-name-candidate-refresh-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  ADDENDUM = File.join(__dir__, "proper-name-candidate-refresh-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  TSV_HEADERS = %w[english_candidate reason source_context_keys covered_occurrences_json].freeze

  def source_key(context)
    parts = context.split(':', -1)
    raise "invalid source context #{context.inspect}" unless (2..3).cover?(parts.length)

    [parts[0], parts[1], parts[2].to_s]
  end

  def exact_index_matches(candidate, context, index_by_key, manifest_events)
    key = source_key(context)
    index_by_key.fetch(key, []).select do |occurrence|
      next false unless occurrence['matched_english'].to_s.split('|')
        .any? { |term| term.casecmp?(candidate) }

      raise "nonterminal candidate occurrence #{candidate.inspect} #{key.inspect}" unless
        %w[accepted not-an-issue excluded uncertain].include?(occurrence['status'])

      event = manifest_events[[occurrence['entity_key'], *key]].find do |batch, status, evidence|
        occurrence['status'] == status &&
          occurrence['evidence'] == "D-#{batch}: #{evidence}"
      end
      raise "candidate occurrence lacks exact manifest provenance #{key.inspect}" unless event

      true
    end
  end

  def run
    raise 'D-21431 outputs already exist' if [TSV, REPORT, ADDENDUM].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    glossary = M.table(GLOSSARY).map(&:to_h)
    old_candidates = M.table(CANDIDATES).map(&:to_h)
    current_candidates = ProperNameCandidates.build(inventory.values, glossary)
      .map { |values| ProperNameCandidates::HEADERS.zip(values).to_h }
    old_by_key = old_candidates.to_h { |row| [row.fetch('candidate_key'), row] }
    current_by_key = current_candidates.to_h { |row| [row.fetch('candidate_key'), row] }
    added = (current_by_key.keys - old_by_key.keys).sort.map { |key| current_by_key.fetch(key) }
    removed = old_by_key.keys - current_by_key.keys
    raise "unexpected candidate delta: added=#{added.length}, removed=#{removed.length}" unless
      added.length == 35 && removed.empty?
    raise 'candidate delta includes a non-glossary heuristic' unless
      added.all? { |row| row.fetch('reason').split('|') == ['known-glossary-key'] }

    index = M.table(INDEX).map(&:to_h)
    index_by_key = index.group_by { |row| M.key(row) }
    manifest_events = Hash.new { |hash, key| hash[key] = [] }
    Dir.glob(File.join(__dir__, 'proper-name-edits-D*.tsv')).sort_by do |path|
      path[/D(\d+)/, 1].to_i
    end.each do |path|
      batch = Integer(File.basename(path)[/D(\d+)\.tsv\z/, 1])
      M.table(path).each do |review|
        dispositions = review['entity_dispositions_json'].to_s.empty? ? {} :
          JSON.parse(review['entity_dispositions_json'])
        review.fetch('entity_key').split('|').each do |entity|
          key = [entity, *M.key(review)]
          manifest_events[key] << [
            batch, dispositions.fetch(entity, review.fetch('status')),
            review.fetch('evidence')
          ]
        end
      end
    end

    screen_rows = []
    context_count = 0
    link_count = 0
    status_counts = Hash.new(0)
    added.each do |candidate|
      contexts = candidate.fetch('source_context_keys').split('|').uniq
      raise "candidate has no source contexts: #{candidate['english_candidate']}" if contexts.empty?

      links = []
      contexts.each do |context|
        key = source_key(context)
        source = inventory.fetch(key)
        english = JSON.parse(source.fetch('en_texts_json')).compact
        pattern = /(?<![A-Za-z0-9])#{Regexp.escape(candidate.fetch('english_candidate'))}(?![A-Za-z0-9])/i
        raise "candidate absent from source #{candidate['english_candidate']} #{context}" unless
          english.any? { |text| text.match?(pattern) }

        matches = exact_index_matches(
          candidate.fetch('english_candidate'), context, index_by_key, manifest_events
        )
        raise "candidate has no exact terminal index match #{candidate['english_candidate']} #{context}" if
          matches.empty?

        matches.each do |occurrence|
          links << occurrence.slice(
            'entity_key', 'resource', 'ID_Linha', 'Tipo_Variante',
            'matched_english', 'status', 'evidence'
          )
          status_counts[occurrence.fetch('status')] += 1
        end
      end
      context_count += contexts.length
      link_count += links.length
      screen_rows << {
        'english_candidate' => candidate.fetch('english_candidate'),
        'reason' => candidate.fetch('reason'),
        'source_context_keys' => contexts.join('|'),
        'covered_occurrences_json' => JSON.generate(links.uniq)
      }
    end
    raise "unexpected source context count #{context_count}" unless context_count == 63

    csv_hashes = M.hashes
    glossary_sha = Digest::SHA256.file(GLOSSARY).hexdigest
    index_sha = Digest::SHA256.file(INDEX).hexdigest
    inventory_sha = Digest::SHA256.file(M::INVENTORY).hexdigest
    candidate_file_sha = Digest::SHA256.file(CANDIDATES).hexdigest
    variant_candidates = M.table(File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'))
    variant_counts = variant_candidates.group_by { |row| row['status'] }
      .transform_values(&:length)
    residual_output = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    residual_summary = residual_output.lines.grep(
      /\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without|Documented idiomatic|Documented invocation|Documented lowercase|Documented source-local)/
    ).map(&:strip)
    raise 'residual audit did not report a clean bilingual scan' unless
      residual_summary.any? { |line| line.include?('Terminal matches without a covering bilingual English label: 0') }
    raise 'active tables changed during candidate screen' unless
      M.hashes == csv_hashes &&
      Digest::SHA256.file(GLOSSARY).hexdigest == glossary_sha &&
      Digest::SHA256.file(INDEX).hexdigest == index_sha

    backup_block = File.read(M::DOCS.first)[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1
    ]
    raise 'prior edited-batch backup record missing' unless backup_block
    hash_lines = csv_hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    status_text = status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Candidate residual screen: #{added.length} newly surfaced heuristic phrases across #{context_count} source-context keys; all have exact terminal occurrence-index coverage (#{link_count} links; #{status_text}). No new entity, occurrence disposition, CSV edit, or historical tally was added.
      Last screened candidate: `#{added.last.fetch('english_candidate')}` at #{added.last.fetch('source_context_keys').split('|').last}.
      Next batch: D-#{D + 1}; continue full proper-name discovery and residual checks. The 35-term delta is a bounded heuristic refresh, not an exhaustive candidate backlog.
      Indexed matches: #{index.length}; #{index.group_by { |row| row['status'] }.sort.map { |status, rows| "#{status}=#{rows.length}" }.join(', ')}.
      Remaining unreviewed indexed matches: #{index.count { |row| row['status'] == 'needs-context' }}, in #{index.select { |row| row['status'] == 'needs-context' }.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{index.count { |row| row['status'] == 'uncertain' }}, in #{index.select { |row| row['status'] == 'uncertain' }.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
      These are focused entity/row index states, not global translation totals.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Registered-reviewed machine-generated variant candidates: #{variant_candidates.length} terms; registered-reviewed=#{variant_counts.fetch('registered-reviewed', 0)}, heuristic-not-reviewed=#{variant_counts.fetch('heuristic-not-reviewed', 0)}. This list is not exhaustive; it does not establish an overall completion percentage.
      Refreshed lexical heuristic: #{current_candidates.length} phrases versus #{old_candidates.length} in the prior snapshot; the #{added.length}-phrase delta was reconciled above. Heuristic phrase counts are not an entity backlog or completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hash_lines}
      No CSV edits in D-#{D}; last actual CSV-edit backups are retained from the previous edited batch:
      #{backup_block.lines.map(&:strip).join("\n")}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{inventory_sha}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_sha}`.
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{glossary_sha}`.
      Candidate refresh report: `work/zh_cn/audit/#{File.basename(REPORT)}`.
      Candidate refresh addendum: `work/zh_cn/audit/#{File.basename(ADDENDUM)}`.
      Candidate/context reconciliation TSV: `work/zh_cn/audit/#{File.basename(TSV)}`.
      Residual bilingual/index audit: PASS; #{residual_summary.join('; ')}.
    TEXT

    CSV.open(TSV, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << TSV_HEADERS
      screen_rows.each { |row| csv << TSV_HEADERS.map { |header| row[header] } }
    end
    File.write(REPORT, <<~TEXT)
      # D-#{D}: Proper-Name Candidate Refresh Screen

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      A fresh English-led heuristic scan of the active #{inventory.length}-row aligned inventory and #{glossary.length}-entry glossary generated #{current_candidates.length} candidate phrases. Compared with the prior #{old_candidates.length}-phrase snapshot, #{added.length} new phrase keys appeared and none disappeared. All new phrases were generated by known-glossary-key matching.

      The #{added.length} phrases point to #{context_count} distinct source-context observations. Every observation is already covered by an exact `matched_english` term in the active occurrence index, and every matching occurrence has a terminal disposition backed by its exact edit manifest. This screen adds no entity, alias, occurrence disposition, or translation tally. The exact phrase-to-row/entity links are in [`#{File.basename(TSV)}`](#{File.basename(TSV)}).

      ## Validation

      #{residual_summary.map { |line| "- #{line}" }.join("\n")}

      No active CSV, occurrence-index, or glossary bytes changed. Current hashes are affix `#{csv_hashes.fetch('affix')}`, base `#{csv_hashes.fetch('base')}`, default `#{csv_hashes.fetch('default')}`, occurrence index `#{index_sha}`, and glossary `#{glossary_sha}`.

      Full proper-name discovery/residual validation remains incomplete. The refreshed heuristic phrase count is not a complete proper-name inventory and must not be interpreted as an overall backlog or completion percentage.
    TEXT
    File.write(ADDENDUM, <<~TEXT)
      # D-#{D} Candidate Screen Addendum

      D-#{D} reconciled #{added.length} newly surfaced heuristic phrases across #{context_count} source-context observations. All #{context_count} observations have exact terminal occurrence-index matches with manifest-backed dispositions. Existing entity and row decisions were referenced, not reopened or duplicated.

      No CSV, glossary, occurrence-index, candidate snapshot, historical translation tally, or backup was changed by this screen. The residual bilingual/index audit passed. See [`#{File.basename(REPORT)}`](#{File.basename(REPORT)}) and [`#{File.basename(TSV)}`](#{File.basename(TSV)}) for evidence.
    TEXT

    M::DOCS.each do |path|
      text = File.read(path)
      marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
      raise "current checkpoint marker missing in #{path}" unless text.match?(marker)

      block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
      text.sub!(marker, block)
      File.write(path, text)
    end
    puts "D-#{D}: #{added.length} new candidate phrases; #{context_count} exact terminal contexts; #{link_count} indexed links; no disposition or CSV edits."
  end
end

ProperNameCandidateRefreshD21431.run if $PROGRAM_NAME == __FILE__
