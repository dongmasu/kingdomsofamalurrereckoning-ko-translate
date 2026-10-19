#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'set'
require_relative 'review-proper-name-candidate-refresh-D21639'

module ProperNameCandidateRefreshD21836
  extend self

  M = ReviewedNameBatches
  PRIOR = ProperNameCandidateRefreshD21639
  D = 21_836
  REPORT = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  ADDENDUM = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  EVIDENCE = File.join(__dir__, "proper-name-candidate-refresh-D#{D}.tsv")
  HEADERS = %w[
    candidate reason source_context_keys terminal_occurrences_json
    locale_evidence_json
  ].freeze
  EXPECTED_NEW = [
    'Hospitalis Quarter', 'Quarterling', 'the troll named Nix'
  ].freeze
  ALREADY_REVIEWED = ['Ever Glen', 'Theater of Fates'].freeze

  def run
    [REPORT, ADDENDUM, EVIDENCE].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end

    csv_hashes = M.hashes
    inventory = M.refresh_inventory
    glossary_path = PRIOR::GLOSSARY
    glossary = M.table(glossary_path).map(&:to_h)
    index_path = PRIOR::INDEX
    index = M.table(index_path).map(&:to_h)
    baseline = M.table(PRIOR::BASELINE).map(&:to_h)
    baseline_keys = baseline.map { |row| row.fetch('candidate_key') }.to_set
    refreshed = ProperNameCandidates.build(inventory.values, glossary)
      .map { |values| ProperNameCandidates::HEADERS.zip(values).to_h }
    delta = refreshed.reject { |row| baseline_keys.include?(row.fetch('candidate_key')) }
    prior_terms = M.table(PRIOR::TSV).map { |row| row.fetch('candidate') }.to_set
    prior_terms.merge(ALREADY_REVIEWED)
    pending = delta.reject { |row| prior_terms.include?(row.fetch('english_candidate')) }
    actual_new = pending.map { |row| row.fetch('english_candidate') }
    raise "unexpected new candidate terms: #{actual_new.inspect}" unless
      actual_new.sort == EXPECTED_NEW.sort
    raise "unexpected full candidate delta: #{delta.length}" unless delta.length == 27

    index_by_key = index.group_by { |row| M.key(row) }
    manifest_events = PRIOR.load_manifest_events
    context_observations = []
    occurrence_links = []
    result = pending.map do |candidate|
      contexts = candidate.fetch('source_context_keys').split('|').uniq
      locale_evidence = []
      links = []
      contexts.each do |context|
        source, matches = PRIOR.covered_matches(
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
      {
        'candidate' => candidate.fetch('english_candidate'),
        'reason' => candidate.fetch('reason'),
        'source_context_keys' => contexts.join('|'),
        'terminal_occurrences_json' => JSON.generate(links.uniq),
        'locale_evidence_json' => JSON.generate(locale_evidence)
      }
    end

    coverage = PRIOR.coverage_summary(context_observations, occurrence_links)
    raise "source-context coverage differs: #{coverage.inspect}" unless
      coverage[:candidate_context_associations] == 9 &&
      coverage[:unique_source_contexts] == 9 &&
      coverage[:candidate_occurrence_links] == 9 &&
      coverage[:unique_terminal_occurrences] == 9 &&
      coverage[:unique_terminal_status_counts] == {
        'accepted' => 8, 'not-an-issue' => 1
      }
    raise 'active CSV changed during read-only candidate review' unless
      M.hashes == csv_hashes

    validation = M.command!(
      'ruby', File.join(__dir__, 'validate-proper-name-data.rb')
    )
    residual = M.command!(
      'ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb')
    )
    raise 'candidate residual audit failed' unless
      residual.include?('missing=0') &&
      residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')

    M.write_table(EVIDENCE, HEADERS, result)
    counts = index.group_by { |row| row.fetch('status') }
      .transform_values(&:length)
    held = index.select { |row| row['status'] == 'uncertain' }
    candidate_shortlist = M.table(File.join(
      __dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'
    )).map(&:to_h)
    prior_block = File.read(M::DOCS.first)[
      /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    ].to_s
    retained = prior_block[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1
    ]
    raise 'retained backup checkpoint missing' unless retained
    hash_lines = csv_hashes.map do |resource, hash|
      "- #{resource}: `#{hash}`."
    end.join("\n")
    counts_text = counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    residual_lines = residual.lines.grep(
      /\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches)/
    ).map(&:strip)
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reconciled 3 newly surfaced English-heuristic phrases across 9 distinct source keys; all 9 candidate-occurrence links are covered by exact manifest-backed terminal decisions (accepted=8, not-an-issue=1). No CSV, glossary, occurrence-index status, or cumulative decision changed.
      Full heuristic scan: #{refreshed.length} phrases versus the preserved #{baseline.length}-phrase baseline; 27 appeared and 0 disappeared. Twenty-four were already reviewed by D-21447/D-21639; this batch reconciles the remaining three. The heuristic is not an exhaustive inventory or backlog count.
      Next batch: D-#{D + 1}; continue source discovery/residual checks; no unreviewed indexed keys.
      Indexed matches: #{index.length}; #{counts_text}.
      Remaining unreviewed indexed matches: #{index.count { |row| row['status'] == 'needs-context' }}.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      These are focused index states, not global translation totals.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: #{candidate_shortlist.length} terms; registered-reviewed=#{candidate_shortlist.count { |row| row['status'] == 'registered-reviewed' }}, heuristic-not-reviewed=#{candidate_shortlist.count { |row| row['status'] == 'heuristic-not-reviewed' }}. This list is not exhaustive and establishes no overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hash_lines}
      CSV edits in this batch: none; no new backup required.
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained.strip}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(index_path).hexdigest}`.
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{Digest::SHA256.file(glossary_path).hexdigest}`.
      Data validation: #{validation.strip}
      Residual bilingual/index audit: PASS; #{residual_lines.join('; ')}
      Report: `work/zh_cn/audit/#{File.basename(REPORT)}`.
      Addendum: `work/zh_cn/audit/#{File.basename(ADDENDUM)}`.
      Candidate/context evidence: `work/zh_cn/audit/#{File.basename(EVIDENCE)}`.
    TEXT
    details = result.map do |row|
      links = JSON.parse(row.fetch('terminal_occurrences_json'))
      "- `#{row['candidate']}`: #{row['source_context_keys'].split('|').length} source keys; #{links.group_by { |link| link.fetch('status') }.sort.map { |status, matches| "#{status}=#{matches.length}" }.join(', ')}. All exact source rows and locale evidence are in `#{File.basename(EVIDENCE)}`."
    end.join("\n")
    File.write(REPORT, <<~TEXT)
      # D-#{D}: English-Heuristic Candidate Refresh

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Candidate Findings

      #{details}

      The English-led source text controls identity and meaning; Japanese
      supplies pronunciation/register context and Chinese is supplementary.
      No PAK or PAK-derived resource was inspected.
    TEXT
    File.write(ADDENDUM, <<~TEXT)
      # D-#{D} No-Edit Addendum

      #{summary}

      Each new candidate/context was checked against the aligned English,
      Japanese, Chinese, and active Korean rows. Every terminal occurrence
      matched an exact prior edit-manifest event. No active CSV or decision
      index was edited; no backup was required.
    TEXT

    heading = "## D-#{D}: Heuristic Candidate Refresh"
    register_path = M::DOCS[3]
    register = File.read(register_path)
    raise 'decision-register entry already exists' if register.include?(heading)
    register << <<~TEXT

      #{heading}

      A fresh scan of all aligned English rows found #{refreshed.length}
      heuristic phrases against the preserved #{baseline.length}-phrase
      baseline: 27 appeared and none disappeared. Twenty-four additions
      were already reviewed by D-21447/D-21639; this scope reconciles the
      remaining three: `Hospitalis Quarter`, `Quarterling`, and
      `the troll named Nix`. Their nine exact source contexts map to
      manifest-backed terminal records under `place:hospitalis-quarters`,
      `people:quarterlings`, and `monster:nix` (eight accepted, one
      not-an-issue). No entity, alias, CSV text, index status, or count was
      added. This bounded heuristic is not an exhaustive proper-name
      inventory or completion estimate. Evidence:
      `proper-name-candidate-refresh-D#{D}.tsv`.
    TEXT
    File.write(register_path, register)

    M::DOCS.each do |path|
      text = File.read(path)
      marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
      raise "current checkpoint missing in #{path}" unless text.match?(marker)
      block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->"
      File.write(path, text.sub(marker, block))
    end
    puts "D-#{D}: #{EXPECTED_NEW.length} new heuristic phrases; " \
         "#{coverage[:unique_source_contexts]} manifest-backed contexts; no edits."
  end
end

ProperNameCandidateRefreshD21836.run if $PROGRAM_NAME == __FILE__
