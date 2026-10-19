#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-candidates'

module ProperNameCandidateRefreshD21639
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_639
  BASELINE = File.join(__dir__, 'proper-name-candidates.tsv')
  PRIOR_SCREEN = File.join(__dir__, 'proper-name-candidate-refresh-D21447.tsv')
  GLOSSARY = R::GLOSSARY
  INDEX = M::INDEX
  CANDIDATES = R::DISCOVERY_CANDIDATES
  TSV = File.join(__dir__, "proper-name-candidate-refresh-D#{D}.tsv")
  REPORT = File.join(__dir__, "proper-name-candidate-refresh-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  ADDENDUM = File.join(__dir__, "proper-name-candidate-refresh-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  TSV_HEADERS = %w[
    candidate reason source_context_keys terminal_occurrences_json locale_evidence_json
  ].freeze

  def source_key(context)
    parts = context.split(':', -1)
    raise "invalid source context #{context.inspect}" unless (2..3).cover?(parts.length)
    [parts[0], parts[1], parts[2].to_s]
  end

  def load_manifest_events
    events = Hash.new { |hash, key| hash[key] = [] }
    Dir.glob(File.join(__dir__, 'proper-name-edits-D*.tsv')).sort_by do |path|
      path[/D(\d+)/, 1].to_i
    end.each do |path|
      batch = Integer(File.basename(path)[/D(\d+)\.tsv\z/, 1])
      M.table(path).each do |review|
        dispositions = review['entity_dispositions_json'].to_s.empty? ? {} :
          JSON.parse(review['entity_dispositions_json'])
        review.fetch('entity_key').split('|').each do |entity|
          events[[entity, *M.key(review)]] << [
            batch, dispositions.fetch(entity, review.fetch('status')),
            review.fetch('evidence')
          ]
        end
      end
    end
    events
  end

  def covered_matches(candidate, context, inventory, index_by_key, manifest_events)
    key = source_key(context)
    source = inventory.fetch(key)
    english = JSON.parse(source.fetch('en_texts_json')).compact
    pattern = /(?<![A-Za-z0-9])#{Regexp.escape(candidate)}(?![A-Za-z0-9])/i
    raise "candidate absent from English source #{candidate.inspect} at #{context}" unless
      english.any? { |text| text.match?(pattern) }

    matches = index_by_key.fetch(key, []).select do |row|
      row['matched_english'].to_s.split('|').any? { |term| term.casecmp?(candidate) }
    end
    raise "candidate lacks exact indexed match #{candidate.inspect} at #{context}" if matches.empty?
    matches.each do |row|
      raise "candidate index match is not terminal #{candidate.inspect} #{key.inspect}" unless
        %w[accepted not-an-issue excluded uncertain].include?(row['status'])
      event = manifest_events[[row['entity_key'], *key]].find do |batch, status, evidence|
        row['status'] == status && row['evidence'] == "D-#{batch}: #{evidence}"
      end
      raise "candidate match lacks exact manifest provenance #{candidate.inspect} #{key.inspect}" unless event
    end
    [source, matches]
  end

  def coverage_summary(context_observations, occurrence_links)
    unique_links = occurrence_links.uniq
    {
      candidate_context_associations: context_observations.length,
      unique_source_contexts: context_observations.uniq.length,
      candidate_occurrence_links: occurrence_links.length,
      unique_terminal_occurrences: unique_links.length,
      unique_terminal_status_counts: unique_links.group_by { |row| row.fetch('status') }
        .transform_values(&:length)
    }
  end

  def run
    raise 'D-21639 outputs already exist' if [TSV, REPORT, ADDENDUM].any? { |path| File.exist?(path) }
    inventory = M.refresh_inventory
    glossary = M.table(GLOSSARY).map(&:to_h)
    old_candidates = M.table(BASELINE).map(&:to_h)
    old_by_key = old_candidates.to_h { |row| [row.fetch('candidate_key'), row] }
    refreshed = ProperNameCandidates.build(inventory.values, glossary)
      .map { |values| ProperNameCandidates::HEADERS.zip(values).to_h }
    current_by_key = refreshed.to_h { |row| [row.fetch('candidate_key'), row] }
    added = (current_by_key.keys - old_by_key.keys).sort.map { |key| current_by_key.fetch(key) }
    removed = old_by_key.keys - current_by_key.keys
    raise "unexpected heuristic delta: added=#{added.length}, removed=#{removed.length}" unless
      added.length == 24 && removed.empty?
    raise 'new candidates are not glossary-derived phrases' unless
      added.all? { |row| row.fetch('reason').split('|') == ['known-glossary-key'] }

    prior_rows = M.table(PRIOR_SCREEN).map(&:to_h)
    prior_terms = prior_rows.map { |row| row.fetch('candidate') }.to_set
    repeated = added.select { |row| prior_terms.include?(row.fetch('english_candidate')) }
    pending = added.reject { |row| prior_terms.include?(row.fetch('english_candidate')) }
    raise 'candidate refresh replay scope differs' unless
      repeated.map { |row| row.fetch('english_candidate') }.sort ==
        %w[Ever\ Glen Theater\ of\ Fates].sort &&
      pending.length == 22

    index_rows = M.table(INDEX).map(&:to_h)
    index_by_key = index_rows.group_by { |row| M.key(row) }
    manifest_events = load_manifest_events
    result_rows = []
    context_observations = []
    occurrence_links = []
    pending.each do |candidate|
      contexts = candidate.fetch('source_context_keys').split('|').uniq
      links = []
      locale_evidence = []
      contexts.each do |context|
          source, matches = covered_matches(
            candidate.fetch('english_candidate'), context, inventory,
            index_by_key, manifest_events
          )
          links.concat(matches.map do |row|
            row.slice(
              'entity_key', 'resource', 'ID_Linha', 'Tipo_Variante',
              'matched_english', 'status', 'evidence'
            )
          end)
        locale_evidence << {
          'source_key' => context,
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'),
          'korean' => source.fetch('work_text')
          }
        end
      context_observations.concat(contexts)
      occurrence_links.concat(links.uniq)
      result_rows << {
        'candidate' => candidate.fetch('english_candidate'),
        'reason' => candidate.fetch('reason'),
        'source_context_keys' => contexts.join('|'),
        'terminal_occurrences_json' => JSON.generate(links.uniq),
        'locale_evidence_json' => JSON.generate(locale_evidence)
      }
    end
    coverage = coverage_summary(context_observations, occurrence_links)
    raise "D-21639 candidate-context association count differs: #{coverage[:candidate_context_associations]}" unless
      coverage[:candidate_context_associations] == 34
    raise "D-21639 unique source context count differs: #{coverage[:unique_source_contexts]}" unless
      coverage[:unique_source_contexts] == 33
    raise "D-21639 candidate-occurrence association count differs: #{coverage[:candidate_occurrence_links]}" unless
      coverage[:candidate_occurrence_links] == 34
    raise "D-21639 unique terminal occurrence count differs: #{coverage[:unique_terminal_occurrences]}" unless
      coverage[:unique_terminal_occurrences] == 33
    expected_unique_statuses = {
      'accepted' => 25, 'excluded' => 4, 'not-an-issue' => 4
    }
    raise "D-21639 unique terminal status counts differ: #{coverage[:unique_terminal_status_counts]}" unless
      coverage[:unique_terminal_status_counts] == expected_unique_statuses

    csv_hashes = M.hashes
    glossary_sha = Digest::SHA256.file(GLOSSARY).hexdigest
    index_sha = Digest::SHA256.file(INDEX).hexdigest
    baseline_sha = Digest::SHA256.file(BASELINE).hexdigest
    variant_rows = M.table(CANDIDATES)
    variant_counts = variant_rows.group_by { |row| row['status'] }.transform_values(&:length)
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'residual index audit did not pass' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')
    data_validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    raise 'proper-name data validation did not pass' unless data_validation.include?('PASS')
    raise 'candidate refresh changed protected state' unless
      M.hashes == csv_hashes &&
      Digest::SHA256.file(GLOSSARY).hexdigest == glossary_sha &&
      Digest::SHA256.file(INDEX).hexdigest == index_sha &&
      Digest::SHA256.file(BASELINE).hexdigest == baseline_sha

    M.write_table(TSV, TSV_HEADERS, result_rows)
    prior_block = File.read(M::DOCS.first)[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\n[A-Z]|\n<!--)/m, 1
    ].to_s
    index_counts = index_rows.group_by { |row| row['status'] }.transform_values(&:length)
    hashes = csv_hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    status_text = coverage[:unique_terminal_status_counts].sort
      .map { |status, count| "#{status}=#{count}" }.join(', ')
    residual_summary = residual.lines.grep(
      /\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without|Documented row-scoped Syl)/
    ).map(&:strip)
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Refreshed the all-resource English lexical heuristic: #{refreshed.length} phrases versus #{old_candidates.length} in the saved baseline; 24 new, 0 removed. Two (Ever Glen, Theater of Fates) were already screened under D-21447. The remaining 22 create 34 candidate-context associations across 33 unique source contexts and 34 candidate-occurrence associations pointing to 33 unique terminal records (#{status_text}); no disposition or CSV edit was added.
      The separate 305-row variant-consistency shortlist remains registered-reviewed in all 305 rows. Neither candidate set is exhaustive or a completion percentage.
      Indexed matches: #{index_rows.length}; #{index_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}.
      Remaining unreviewed indexed matches: #{index_rows.count { |row| row['status'] == 'needs-context' }}, in #{index_rows.select { |row| row['status'] == 'needs-context' }.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{index_rows.count { |row| row['status'] == 'uncertain' }}, in #{index_rows.select { |row| row['status'] == 'uncertain' }.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hashes}
      No CSV edits in D-#{D}; last actual CSV-edit backups are retained:
      #{prior_block.lines.map(&:strip).join("\n")}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index_rows.length} rows; SHA-256 `#{index_sha}`.
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{glossary_sha}`.
      Saved heuristic baseline: #{old_candidates.length} phrases; SHA-256 `#{baseline_sha}` (retained to preserve refresh history).
      Fresh heuristic scan: #{refreshed.length} phrases; SHA-256 `#{Digest::SHA256.hexdigest(refreshed.map { |row| ProperNameCandidates::HEADERS.map { |header| row.fetch(header) }.join("\t") }.join("\n"))}`.
      Residual bilingual/index audit: PASS; #{residual_summary.join('; ')}.
      Data validation: #{data_validation.strip}
      Candidate refresh report: `work/zh_cn/audit/#{File.basename(REPORT)}`.
      Candidate refresh addendum: `work/zh_cn/audit/#{File.basename(ADDENDUM)}`.
      Candidate/context evidence: `work/zh_cn/audit/#{File.basename(TSV)}`.
      Next: D-21640, continue source-local residual discovery on unclassified name-shaped labels and verify old open candidates without inferring identity from spelling alone.
    TEXT

    rows_markdown = result_rows.map do |row|
      links = JSON.parse(row.fetch('terminal_occurrences_json'))
      "| `#{row['candidate']}` | #{row['source_context_keys'].split('|').length} | #{links.length} | #{links.group_by { |link| link['status'] }.sort.map { |status, matches| "#{status}=#{matches.length}" }.join(', ')} |"
    end.join("\n")
    register = File.read(M::DOCS[3])
    heading = "## D-#{D}: Heuristic Candidate Refresh"
    raise 'D-21639 decision-register section already exists' if register.include?(heading)
    register << <<~TEXT

      #{heading}

      A fresh all-resource English scan of the 73,430-row aligned inventory
      found 29,628 heuristic phrases versus the saved 29,604-phrase baseline:
      24 added and none removed. Two phrases (`Ever Glen`, `Theater of Fates`)
      were already screened by D-21447 and were not recounted. The remaining
      22 phrases create 34 candidate-context associations across 33 unique
      source contexts. Those associations map to 34 candidate-occurrence links
      and 33 unique terminal occurrence records, all manifest-backed. The
      `Chaos Core` and `Chaos cores` candidates share `default:9945` and its
      single `resource:chaos-core` terminal record; this alias overlap is not
      a second disposition.
      This is candidate-refresh reconciliation, not a fresh translation or
      entity decision. The 305-row variant shortlist is a separate dataset.

      | Candidate | Contexts | Terminal links | Existing dispositions |
      | --- | ---: | ---: | --- |
      #{rows_markdown}

      The raw heuristic baseline remains unchanged to preserve dated refresh
      comparisons. Neither list establishes exhaustive proper-name discovery.
      Full discovery/residual validation remains open.
    TEXT
    File.write(M::DOCS[3], register)

    File.write(REPORT, <<~TEXT)
      # D-#{D}: All-Resource Proper-Name Candidate Refresh

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      Rebuilt the English-led lexical heuristic over all #{inventory.length}
      aligned affix/base/default rows with the active #{glossary.length}-entry
      glossary. The fresh scan found #{refreshed.length} phrases against the
      saved #{old_candidates.length}-phrase baseline: 24 appeared and none
      disappeared. Two phrases, `Ever Glen` and `Theater of Fates`, were
      already captured in the D-21447 screen and were not re-reviewed.

      The remaining 22 phrases create 34 candidate-context associations
      across 33 unique source contexts. These map to 34 candidate-occurrence
      links and 33 unique terminal occurrence records, all with exact English
      matches and manifest-backed dispositions. `Chaos Core` and `Chaos cores`
      share `default:9945` and one `resource:chaos-core` record. Japanese and
      Chinese texts are retained as supporting cross-checks; the existing
      Korean labels are recorded. No entity, alias, disposition, translation,
      or historical tally was changed.

      | Candidate | Contexts | Terminal links | Existing dispositions |
      | --- | ---: | ---: | --- |
      #{rows_markdown}

      ## Validation

      - #{residual_summary.join("\n- ")}
      - #{data_validation.strip}
      - Active CSV hashes, glossary bytes, occurrence-index bytes, and the
        saved baseline were unchanged.

      The lexical heuristic and the separate 305-row variant shortlist are
      bounded discovery aids, not exhaustive inventories or completion
      percentages. Full proper-name discovery remains incomplete.
      No PAK or PAK-derived data was consulted.
    TEXT
    File.write(ADDENDUM, <<~TEXT)
      # D-#{D} Candidate Refresh Addendum

      Reconciled 22 newly surfaced phrases as 34 candidate-context
      associations across 33 unique contexts. The associations point to 34
      candidate-occurrence links and 33 unique terminal index records, each
      backed by the corresponding reviewed manifest. `Chaos Core` and
      `Chaos cores` share the same `default:9945` record. D-21447's two
      previously screened candidates were explicitly excluded from recounting.

      No CSV, glossary, occurrence index, saved baseline, translation tally,
      or backup was changed. Residual source/index and bilingual-label audits
      and proper-name data validation passed.
    TEXT

    M::DOCS.each do |path|
      text = File.read(path)
      marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
      raise "current checkpoint marker missing in #{path}" unless text.match?(marker)
      block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
      text.sub!(marker, block)
      File.write(path, text)
    end
    puts "D-#{D}: 22 new candidates; 34 candidate-context associations, 33 unique contexts/terminal records; 2 prior D-21447 screens preserved; no CSV/index/glossary change."
  end
end

ProperNameCandidateRefreshD21639.run if $PROGRAM_NAME == __FILE__
