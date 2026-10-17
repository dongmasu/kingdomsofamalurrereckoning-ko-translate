#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-candidates'

module WulfGodfreyAliasD21432
  extend self

  M = ReviewedNameBatches
  D = 21_432
  ENTITY = 'person:wulf'
  TERM = 'Wulf Godfrey'
  IDS = %w[
    1564 5915 6334 13135 13306 14389 15158 18105 19244 19993
    29978 31120 33184 37656 38901 39507 40206 48778 51499 60665
  ].freeze
  GLOSSARY = File.join(__dir__, 'proper-name-glossary.tsv')
  CANDIDATES = File.join(__dir__, 'proper-name-candidates.tsv')
  PRIOR_REFRESH = File.join(__dir__, 'proper-name-candidate-refresh-D21431.tsv')
  REVIEW = File.join(__dir__, "proper-name-alias-review-D#{D}.tsv")
  DEFINITION = File.join(__dir__, "proper-name-alias-definition-D#{D}.tsv")
  PROOF = File.join(__dir__, "proper-name-alias-registration-D#{D}.json")
  CANDIDATE_REFRESH = File.join(__dir__, "proper-name-candidate-context-refresh-D#{D}.tsv")
  REPORT = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  ADDENDUM = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  CANDIDATE_HEADERS = %w[
    english_candidate reason added_source_context_keys covered_occurrences_json
  ].freeze
  REVIEW_HEADERS = %w[
    entity_key resource ID_Linha Tipo_Variante previous_status previous_evidence
    english japanese chinese korean
  ].freeze
  NOTE = 'D-21432: The complete personal name Wulf Godfrey is an explicit English full-name form of the already registered Wulf. All 20 exact default source rows were checked against Japanese ウルフ・ゴドフリー and Chinese 伍尔夫·戈弗雷; their Korean cells already contain 울프 고드프리(Wulf Godfrey). Keep the stable entity key person:wulf, register Wulf Godfrey as its canonical full name, and retain Wulf as the short-name alias. Existing occurrence decisions and evidence are unchanged.'

  def source_contexts(inventory)
    inventory.each_with_object([]) do |(key, row), matches|
      english = JSON.parse(row.fetch('en_texts_json')).compact.join("\n")
      next unless key.first == 'default' &&
                  english.match?(/(?<![A-Za-z])#{Regexp.escape(TERM)}(?![A-Za-z])/)

      matches << [key, row, english]
    end
  end

  def manifest_event!(occurrence)
    match = occurrence.fetch('evidence').match(/\AD-(\d+): (.*)\z/m)
    raise "missing prior D-number for #{M.key(occurrence).inspect}" unless match

    path = File.join(__dir__, "proper-name-edits-D#{match[1]}.tsv")
    raise "missing prior manifest #{path}" unless File.file?(path)
    review = M.table(path).find do |row|
      row['entity_key'].to_s.split('|').include?(ENTITY) &&
        M.key(row) == M.key(occurrence)
    end
    raise "prior manifest key missing for #{M.key(occurrence).inspect}" unless review
    per_entity = JSON.parse(review['entity_dispositions_json'].to_s.empty? ? '{}' :
      review['entity_dispositions_json'])
    prior_status = per_entity.fetch(ENTITY, review.fetch('status'))
    raise "prior status differs for #{M.key(occurrence).inspect}" unless
      prior_status == occurrence.fetch('status') &&
      "D-#{match[1]}: #{review.fetch('evidence')}" == occurrence.fetch('evidence')

    [match[1], review]
  end

  def source_key(context)
    parts = context.split(':', -1)
    raise "invalid source context #{context.inspect}" unless (2..3).cover?(parts.length)

    [parts[0], parts[1], parts[2].to_s]
  end

  def manifest_events
    events = Hash.new { |hash, key| hash[key] = [] }
    Dir.glob(File.join(__dir__, 'proper-name-edits-D*.tsv')).each do |path|
      batch = File.basename(path)[/D(\d+)\.tsv\z/, 1]
      M.table(path).each do |review|
        dispositions = review['entity_dispositions_json'].to_s.empty? ? {} :
          JSON.parse(review['entity_dispositions_json'])
        review.fetch('entity_key').split('|').each do |entity|
          event = [
            batch, dispositions.fetch(entity, review.fetch('status')),
            review.fetch('evidence')
          ]
          events[[entity, *M.key(review)]] << event
          events[[:any, *M.key(review)]] << event
        end
      end
    end
    events
  end

  def prepare
    outputs = [REVIEW, DEFINITION, PROOF, CANDIDATE_REFRESH, REPORT, ADDENDUM]
    raise "D-#{D} artifacts already exist" if outputs.any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    contexts = source_contexts(inventory)
    ids = contexts.map { |key, _row, _english| key.fetch(1) }.sort_by(&:to_i)
    raise "source coverage differs: #{ids.inspect}" unless ids == IDS.sort_by(&:to_i)
    candidate = M.table(CANDIDATES).find { |row| row['english_candidate'] == TERM }
    raise 'pending exact full-name candidate missing' unless candidate &&
      candidate['status'] == 'needs-context' &&
      candidate['source_context_keys'].split('|').sort ==
        IDS.map { |id| "default:#{id}" }.sort

    glossary = M.table(GLOSSARY)
    original = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'existing Wulf entry differs from expected baseline' unless original &&
      original['english_canonical'] == 'Wulf' &&
      original['korean_canonical'] == '울프(Wulf)' &&
      original['english_aliases'].to_s.empty?
    terms = glossary.reject { |row| row['entity_key'] == ENTITY }.flat_map do |row|
      [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
    end
    raise 'Wulf Godfrey term already belongs to another entity' if
      terms.any? { |term| term.casecmp?(TERM) }

    index = M.table(M::INDEX)
    occurrences = contexts.map do |key, row, english|
      ja = JSON.parse(row.fetch('ja_texts_json')).compact.join("\n---\n")
      zh = row.fetch('zh_text')
      korean = row.fetch('work_text')
      raise "missing aligned translation at #{key.inspect}" if [ja, zh].any?(&:empty?)
      raise "Japanese full name missing at #{key.inspect}" unless ja.include?('ウルフ・ゴドフリー')
      raise "Chinese full name missing at #{key.inspect}" unless zh.include?('伍尔夫·戈弗雷')
      raise "Korean bilingual full name missing at #{key.inspect}" unless
        korean.include?('울프 고드프리(Wulf Godfrey)')

      occurrence = index.find do |entry|
        entry['entity_key'] == ENTITY && M.key(entry) == key
      end
      raise "existing terminal occurrence missing at #{key.inspect}" unless occurrence &&
        %w[accepted not-an-issue].include?(occurrence['status'])
      prior_batch, = manifest_event!(occurrence)
      {
        'entity_key' => ENTITY, 'resource' => key[0], 'ID_Linha' => key[1],
        'Tipo_Variante' => key[2], 'previous_status' => occurrence.fetch('status'),
        'previous_evidence' => occurrence.fetch('evidence'),
        'english' => english, 'japanese' => ja, 'chinese' => zh, 'korean' => korean,
        'prior_batch' => "D-#{prior_batch}"
      }
    end
    raise 'duplicate existing Wulf occurrence keys' unless
      occurrences.map { |row| M.key(row) }.uniq.length == IDS.length

    updated = original.to_h.merge(
      'english_canonical' => TERM,
      'korean_canonical' => '울프 고드프리(Wulf Godfrey)',
      'english_aliases' => 'Wulf',
      'korean_variants' => (original['korean_variants'].to_s.split('|') + ['울프 고드프리']).uniq.join('|'),
      'evidence_ids' => (original['evidence_ids'].to_s.split('|') +
        ['D-21432'] + IDS.map { |id| "default:#{id}" }).uniq.join('|'),
      'notes' => "#{original['notes']} #{NOTE}"
    )
    new_glossary = glossary.map do |row|
      row['entity_key'] == ENTITY ? updated : row.to_h
    end
    rebuilt = ProperNameCandidates.build(inventory.values, new_glossary)
      .map { |values| ProperNameCandidates::HEADERS.zip(values).to_h }
    prior_candidates = M.table(CANDIDATES).map(&:to_h)
    old_by_key = prior_candidates.to_h { |row| [row.fetch('candidate_key'), row] }
    new_by_key = rebuilt.to_h { |row| [row.fetch('candidate_key'), row] }
    added = new_by_key.keys.to_set - old_by_key.keys.to_set
    removed = old_by_key.keys.to_set - new_by_key.keys.to_set
    refresh_rows = M.table(PRIOR_REFRESH).map(&:to_h)
    refreshed_terms = refresh_rows.map do |row|
      "candidate:#{row.fetch('english_candidate').downcase}"
    end.to_set
    raise 'candidate refresh differs from D-21431 reconciliation' unless
      added == refreshed_terms && removed.empty? &&
      added.length == 35 && rebuilt.length == 29_604
    candidate_context_rows = []
    candidate_context_count = 0
    context_links = []
    context_statuses = Hash.new(0)
    context_provenance = Hash.new(0)
    unverified_provenance = []
    context_index = index.map(&:to_h).group_by { |row| M.key(row) }
    prior_events = manifest_events
    old_by_key.keys.each do |key|
      old_contexts = old_by_key.fetch(key).fetch('source_context_keys').split('|').to_set
      new_contexts = new_by_key.fetch(key).fetch('source_context_keys').split('|').to_set
      removed_contexts = old_contexts - new_contexts
      raise "candidate contexts disappeared for #{key}" unless removed_contexts.empty?
      additions = (new_contexts - old_contexts).to_a.sort
      next if additions.empty?

      candidate = new_by_key.fetch(key)
      links = []
      additions.each do |context|
        source_key = source_key(context)
        source = inventory.fetch(source_key)
        english_texts = JSON.parse(source.fetch('en_texts_json')).compact
        pattern = /(?<![A-Za-z0-9])#{Regexp.escape(candidate.fetch('english_candidate'))}(?![A-Za-z0-9])/i
        raise "candidate absent from source #{key} #{context}" unless
          english_texts.any? { |text| text.match?(pattern) }
        matches = (context_index[source_key] || []).select do |occurrence|
          occurrence.fetch('matched_english').to_s.split('|')
            .any? { |term| term.casecmp?(candidate.fetch('english_candidate')) }
        end
        raise "candidate context lacks exact occurrence index coverage #{key} #{context}" if
          matches.empty?
        matches.each do |occurrence|
          status = occurrence.fetch('status')
          raise "nonterminal candidate occurrence #{key} #{context}" unless
            %w[accepted not-an-issue excluded uncertain].include?(status)
          event = prior_events[[occurrence.fetch('entity_key'), *source_key]].find do |batch, disposition, evidence|
            occurrence['status'] == disposition &&
              occurrence['evidence'] == "D-#{batch}: #{evidence}"
          end
          unless event
            derived = occurrence.fetch('evidence').match(
              /\ADerived full-name record from the same exact row already reviewed at D-\d+-D-\d+; no new CSV edit or repeated review\. (.*)\z/m
            )
            if derived
              event = prior_events[[:any, *source_key]].find do |_batch, disposition, evidence|
                occurrence['status'] == disposition && derived[1] == evidence
              end
            end
          end
          provenance = if event
                         'prior-manifest'
                       elsif occurrence.fetch('status') == 'not-an-issue' &&
                             occurrence.fetch('evidence').start_with?(
                               'Existing Korean text already pairs the English source-name span with '
                             ) &&
                             occurrence.fetch('evidence').end_with?(
                               'retained without a repeated CSV edit.'
                             )
                         labels = occurrence.fetch('korean_current')
                           .scan(/\(([^()\r\n]+)\)/).flatten
                         matched_terms = occurrence.fetch('matched_english').to_s.split('|')
                         paired = matched_terms.any? do |term|
                           occurrence.fetch('english_source').match?(
                             /(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i
                           ) && labels.any? do |label|
                             label.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
                           end
                         end
                         raise "generated no-edit evidence does not match bilingual source row #{key} #{context}" unless
                           paired && source.fetch('work_text') == occurrence.fetch('korean_current')
                         'source-verified-no-edit'
                       elsif occurrence.fetch('status') == 'excluded' &&
                             occurrence.fetch('evidence') ==
                               'English uses lowercase grim as an ordinary adjective, not the character name; excluded from the personal-name glossary.'
                         texts = JSON.parse(source.fetch('en_texts_json')).compact
                         lowercase_only = texts.any? do |text|
                           text.match?(/(?<![A-Za-z])grim(?![A-Za-z])/) &&
                             !text.match?(/(?<![A-Za-z])Grim(?![A-Za-z])/)
                         end
                         raise "generated lowercase exclusion does not match source row #{key} #{context}" unless
                           lowercase_only && source.fetch('work_text') == occurrence.fetch('korean_current')
                         'source-verified-exclusion'
                       elsif occurrence.fetch('status') == 'excluded' &&
                             occurrence.fetch('evidence') ==
                               "D-21079 prior exclusion restored during occurrence-index reconstruction: default:13525 is the complete standalone title Phasmer's Curse, not a person-name occurrence. The D-21079 review explicitly excluded this title from person:phasmer-humm. The title translation is preserved unchanged; no prior finding or global tally is reopened."
                         history = File.read(File.join(__dir__, 'named-scope-review-D21079-20261016.md'))
                         source_english = JSON.parse(source.fetch('en_texts_json')).compact
                         raise "restored exclusion provenance differs at #{key} #{context}" unless
                           source_key == ['default', '13525', ''] &&
                           source_english == ["Phasmer's Curse"] &&
                           source.fetch('work_text') == '파스머(Phasmer)의 저주' &&
                           history.include?('`default:13525`') &&
                           history.include?('explicitly excluded from the Phasmer-person')
                         'source-verified-restored-exclusion'
                       end
          unless provenance
            unverified_provenance << {
              'candidate' => candidate.fetch('english_candidate'),
              'context' => context, 'entity_key' => occurrence.fetch('entity_key'),
              'status' => occurrence.fetch('status'), 'evidence' => occurrence.fetch('evidence')
            }
            provenance = 'unverified'
          end
          link = occurrence.slice(
            'entity_key', 'resource', 'ID_Linha', 'Tipo_Variante',
            'matched_english', 'status', 'evidence'
          ).merge('provenance' => provenance)
          links << link
          context_links << link
          context_statuses[status] += 1
          context_provenance[provenance] += 1
        end
      end
      candidate_context_count += additions.length
      candidate_context_rows << {
        'english_candidate' => candidate.fetch('english_candidate'),
        'reason' => candidate.fetch('reason'),
        'added_source_context_keys' => additions.join('|'),
        'covered_occurrences_json' => JSON.generate(links.uniq)
      }
    end
    unless unverified_provenance.empty?
      groups = unverified_provenance.group_by { |row| row.fetch('evidence') }.map do |evidence, rows|
        { 'count' => rows.length, 'evidence' => evidence, 'examples' => rows.first(3) }
      end
      raise "unverified candidate provenance: #{JSON.generate(groups)}"
    end
    raise "unexpected candidate context delta #{candidate_context_rows.length}/#{candidate_context_count}/#{context_links.length}" unless
      candidate_context_rows.length == 577 && candidate_context_count == 4_460 &&
      context_links.length == 4_461 &&
      context_statuses == {
        'accepted' => 3_138, 'excluded' => 474, 'not-an-issue' => 848, 'uncertain' => 1
      }
    refresh_rows.each do |row|
      key = "candidate:#{row.fetch('english_candidate').downcase}"
      candidate = new_by_key.fetch(key)
      raise "candidate refresh source contexts differ for #{key}" unless
        candidate['source_context_keys'].split('|').sort ==
          row.fetch('source_context_keys').split('|').sort
    end
    target_candidate = new_by_key.fetch('candidate:wulf godfrey')
    raise 'glossary alias did not register the exact heuristic candidate' unless
      target_candidate['reason'].split('|').include?('known-glossary-key')
    raise 'Wulf full-name source contexts changed' unless
      old_by_key.fetch('candidate:wulf godfrey')['source_context_keys'] ==
        target_candidate['source_context_keys']

    {
      inventory: inventory, contexts: contexts, occurrences: occurrences,
      original: original.to_h, updated: updated, glossary: glossary,
      rebuilt_candidates: rebuilt, index: index, target_candidate: target_candidate,
      refreshed_terms: refreshed_terms, candidate_context_rows: candidate_context_rows,
      candidate_context_count: candidate_context_count, context_links: context_links,
      context_statuses: context_statuses, context_provenance: context_provenance
    }
  end

  def checkpoint(summary)
    block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      text = File.read(path)
      if text.include?('<!-- current-proper-name-batch:start -->')
        text.sub!(/<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m, block)
      else
        raise "missing active checkpoint markers in #{path}"
      end
      File.write(path, text)
    end
  end

  def retained_backup_block
    text = File.read(M::DOCS.first)
    text[/No CSV edits in D-\d+; last actual CSV-edit backups are retained from the previous edited batch:\n(.*?)(?=\nAligned inventory:)/m, 1] ||
      raise('prior last-CSV-backup checkpoint is missing')
  end

  def apply
    state = prepare
    csv_before = M.hashes
    index_before = Digest::SHA256.file(M::INDEX).hexdigest
    glossary_before = Digest::SHA256.file(GLOSSARY).hexdigest
    candidates_before = Digest::SHA256.file(CANDIDATES).hexdigest
    retained_backups = retained_backup_block

    M.write_table(DEFINITION, M.table(GLOSSARY).headers, [state.fetch(:updated)])
    M.write_table(REVIEW, REVIEW_HEADERS, state.fetch(:occurrences))
    glossary_rows = state.fetch(:glossary).map do |row|
      row['entity_key'] == ENTITY ? state.fetch(:updated) : row.to_h
    end
    M.write_table(GLOSSARY, state.fetch(:glossary).headers, glossary_rows)
    M.write_table(CANDIDATES, ProperNameCandidates::HEADERS, state.fetch(:rebuilt_candidates))
    M.write_table(CANDIDATE_REFRESH, CANDIDATE_HEADERS,
                  state.fetch(:candidate_context_rows))

    raise 'active translation CSV changed during glossary registration' unless
      M.hashes == csv_before
    raise 'occurrence index changed during glossary registration' unless
      Digest::SHA256.file(M::INDEX).hexdigest == index_before
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    residual_lines = residual.lines.grep(
      /\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/
    ).map(&:strip)
    raise 'residual source/index audit did not pass' unless
      residual_lines.any? { |line| line.include?('missing=0') && line.include?('undocumented extras=0') } &&
      residual_lines.any? { |line| line.include?('Terminal matches without a covering bilingual English label: 0') }

    index = M.table(M::INDEX).map(&:to_h)
    counts = index.group_by { |row| row['status'] }.transform_values(&:length)
    candidates = M.table(CANDIDATES).map(&:to_h)
    candidate_counts = candidates.group_by { |row| row['status'] }.transform_values(&:length)
    glossary = M.table(GLOSSARY)
    hashes = M.hashes
    glossary_hash = Digest::SHA256.file(GLOSSARY).hexdigest
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    candidate_hash = Digest::SHA256.file(CANDIDATES).hexdigest
    inventory_hash = Digest::SHA256.file(M::INVENTORY).hexdigest
    status_counts = state.fetch(:occurrences).group_by { |row| row['previous_status'] }
      .transform_values(&:length)
    status_text = status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    provenance_text = state.fetch(:context_provenance).sort
      .map { |kind, count| "#{kind}=#{count}" }.join(', ')
    hashes_text = hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Registered the explicit full-name form Wulf Godfrey as the canonical spelling for existing `person:wulf`, retaining Wulf as its English short-name alias. Cross-checked #{IDS.length} exact default source rows; all already have terminal dispositions (#{status_text}) and their prior evidence is unchanged. No new entity, occurrence decision, CSV edit, or historical tally was added.
      Next batch: D-#{D + 1}; continue full proper-name discovery and residual checks. The lexical candidate list is heuristic, not an exhaustive backlog.
      Full-chain byte reconstruction: PASS; 1,036 reviewed edit stages reconstructed the recorded pre-D-20390 hashes.
      Candidate refresh: 35 new phrase keys were reconciled in D-21431; this batch reconciles 577 existing phrase keys with 4,460 newly surfaced source-context observations and 4,461 exact terminal index links (#{state.fetch(:context_statuses).sort.map { |status, count| "#{status}=#{count}" }.join(', ')}; provenance #{state.fetch(:context_provenance).sort.map { |kind, count| "#{kind}=#{count}" }.join(', ')}). No indexed disposition was reopened.
      Indexed matches: #{index.length}; #{counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}.
      Remaining unreviewed indexed matches: #{index.count { |row| row['status'] == 'needs-context' }}, in #{index.select { |row| row['status'] == 'needs-context' }.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{index.count { |row| row['status'] == 'uncertain' }}, in #{index.select { |row| row['status'] == 'uncertain' }.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      These are focused entity/row index states, not global translation totals. Sequential default review through ID 65134 remains completed and is not recounted. Full proper-name discovery/residual validation remains incomplete.
      Machine-generated lexical candidates: #{candidates.length} terms; statuses #{candidate_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}. This heuristic is not exhaustive and is not a completion percentage.
      Active CSV SHA-256 (unchanged; no CSV edits):
      #{hashes_text}
      No CSV backup was created because no translation CSV was edited.
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained_backups.lines.map(&:strip).join("\n")}
      Aligned inventory: #{state.fetch(:inventory).length} rows; SHA-256 `#{inventory_hash}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_hash}` (existing dispositions/evidence preserved).
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{glossary_hash}`.
      Lexical candidate file: #{candidates.length} terms; SHA-256 `#{candidate_hash}`.
      Report: `work/zh_cn/audit/#{File.basename(REPORT)}`; addendum: `work/zh_cn/audit/#{File.basename(ADDENDUM)}`.
      Alias evidence: `work/zh_cn/audit/#{File.basename(REVIEW)}`; updated definition: `work/zh_cn/audit/#{File.basename(DEFINITION)}`.
      Candidate context reconciliation: `work/zh_cn/audit/#{File.basename(CANDIDATE_REFRESH)}`.
      Residual bilingual/index audit: PASS; #{residual_lines.join('; ')}.
    TEXT

    M.write_table(PROOF.sub(/\.json\z/, '.tsv'), M.table(GLOSSARY).headers,
                  [state.fetch(:original)])
    File.write(PROOF, JSON.pretty_generate(
      'batch' => D, 'entity_key' => ENTITY, 'new_entities' => 0,
      'new_occurrences' => 0, 'reconciled_existing_source_rows' => IDS.length,
      'candidate_refresh_terms_reconciled_from_D21431' => state.fetch(:refreshed_terms).length,
      'existing_candidate_phrases_with_added_contexts' => state.fetch(:candidate_context_rows).length,
      'added_candidate_context_observations' => state.fetch(:candidate_context_count),
      'exact_terminal_occurrence_links' => state.fetch(:context_links).length,
      'context_link_status_counts' => state.fetch(:context_statuses),
      'context_link_provenance_counts' => state.fetch(:context_provenance),
      'original_entity' => state.fetch(:original), 'updated_entity' => state.fetch(:updated),
      'initial_glossary_sha256' => glossary_before,
      'final_glossary_sha256' => glossary_hash,
      'initial_occurrence_index_sha256' => index_before,
      'final_occurrence_index_sha256' => index_hash,
      'initial_candidate_file_sha256' => candidates_before,
      'final_candidate_file_sha256' => candidate_hash,
      'csv_sha256_before' => csv_before, 'csv_sha256_after' => hashes,
      'prior_occurrence_status_counts' => status_counts,
      'residual_validation' => residual_lines,
      'verified' => 'All 20 exact source rows and existing terminal manifests agree across English, Japanese, Chinese and Korean; existing occurrence decisions/evidence and translation CSV bytes are unchanged.'
    ) + "\n")

    File.write(REPORT, <<~TEXT)
      # D-#{D}: Wulf Godfrey Full-Name Registration

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      The existing glossary entry `person:wulf` used only the short English
      canonical `Wulf`, although the exact full name `Wulf Godfrey` appears in
      20 default source rows and is already translated as
      `울프 고드프리(Wulf Godfrey)`. Register the full name as canonical and
      retain `Wulf` as a short-name alias. The entity key remains stable.

      ## Evidence And Disposition

      English, Japanese `ウルフ・ゴドフリー`, and Chinese `伍尔夫·戈弗雷`
      agree across all 20 source rows. Every active Korean cell already has the
      complete bilingual full name. Existing decisions from D-20562 through
      D-20593 were checked against their exact manifests: #{status_text}. No
      occurrence was reopened or recounted, and no translation CSV was edited.
      Exact row evidence and prior status/evidence are in
      [`#{File.basename(REVIEW)}`](#{File.basename(REVIEW)}).

      The residual bilingual/index audit passed. The 29,604-term lexical
      candidate list is heuristic and does not establish total coverage or a
      completion percentage. D-21431 reconciled the 35 new phrase keys. This
      batch found 4,460 newly surfaced source contexts across 577 existing
      phrase keys; all 4,461 exact index links have verified provenance
      (#{provenance_text}). Full proper-name discovery remains incomplete.
      See [`#{File.basename(CANDIDATE_REFRESH)}`](#{File.basename(CANDIDATE_REFRESH)}).
    TEXT
    File.write(ADDENDUM, <<~TEXT)
      # D-#{D} Registration Addendum

      #{summary}

      The glossary now represents the complete personal name as canonical and
      preserves the short form as an alias. The candidate snapshot was refreshed
      to 29,604 terms. The D-21431 35-phrase delta matches its prior
      reconciliation. This batch reconciled 4,460 newly surfaced source
      contexts across 577 existing phrases; all 4,461 exact index links have
      verified prior manifest-backed, explicitly derived, or
      source-verified no-edit provenance, including one pre-existing
      uncertain hold that was not reopened.
      `Wulf Godfrey` is now explicitly matched by the registered glossary term.
      No active CSV bytes, occurrence-index entries, prior dispositions, or
      historical translation tallies changed.
    TEXT
    checkpoint(summary)
    puts summary
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-wulf-godfrey-alias-D21432.rb apply' unless ARGV == ['apply']
  WulfGodfreyAliasD21432.apply
end
