#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21766
  extend self

  M = ReviewedNameBatches
  D = 21_766
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21765.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze

  GROUPS = {
    'Lorestone' => {
      count: 5,
      evidence: 'English uses Lorestone as the common collectible/object category, not as the identity of one named stone. In default:3788 and 54698, Fae Cairns are explicitly described as a kind of Lorestone; that category remains distinct from the registered named item Fae Cairn. Japanese ロアストーン and Chinese 智慧石 corroborate the generic object reading. The prior term decision D-133 establishes 로어스톤; the candidate cells include 전승석/지식석 variants, which are translation-consistency follow-up rather than proper-name identity findings. Do not register a duplicate entity or reopen the separate prior row decisions.'
    },
    'Lorestones' => {
      count: 4,
      evidence: 'English uses Lorestones as the plural of the common collectible/object category, not as a named faction or unique item. Japanese ロアストーン and Chinese 智慧石 corroborate the generic reading; the plural does not establish a separate entity. D-133 establishes 로어스톤 as the project term. Candidate cells include 로어스톤/지식석 variants, a terminology-consistency follow-up rather than a proper-name identity finding. Preserve existing Fae Cairn and other row dispositions; do not register a plural alias or recount prior decisions.'
    }
  }.freeze

  def key(row)
    M.key(row)
  end

  def candidate_keys(candidate)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field)).map { |value| value.map(&:to_s) }
    end.uniq.sort
  end

  def build_reviews(inventory, index, candidates)
    prior_by_key = index.group_by { |row| key(row) }
    reviews = GROUPS.flat_map do |term, decision|
      candidate = candidates.fetch(term) { raise "missing candidate #{term}" }
      keys = candidate_keys(candidate)
      raise "#{term} key count differs: #{keys.length}" unless keys.length == decision.fetch(:count)
      keys.map do |row_key|
        source = inventory.fetch(row_key)
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
        pattern = /(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i
        raise "candidate absent at #{row_key.inspect}" unless english.match?(pattern)
        {
          'english_candidate' => term,
          'disposition' => 'not-an-issue',
          'resource' => row_key[0],
          'ID_Linha' => row_key[1],
          'Tipo_Variante' => row_key[2],
          'english' => english,
          'japanese' => japanese,
          'chinese' => source.fetch('zh_text'),
          'korean' => source.fetch('work_text'),
          'evidence' => decision.fetch(:evidence),
          'prior_index_dispositions_json' => JSON.generate(
            prior_by_key.fetch(row_key, []).map do |row|
              [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
            end
          )
        }
      end
    end
    keys = reviews.map { |row| key(row) }
    raise 'candidate review exceeds 50 distinct source keys' if keys.uniq.length > 50
    raise 'overlapping candidate/source keys' unless keys.uniq.length == keys.length
    reviews
  end

  def checkpoint(text, summary)
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    text.sub(marker, "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->") ||
      raise('active checkpoint marker missing')
  end

  def run
    raise "D-#{D} outputs already exist" if [OUTPUT, SNAPSHOT].any? { |path| File.exist?(path) }
    prior_hashes = M.hashes
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    reviews = build_reviews(inventory, index, candidates)
    M.write_table(OUTPUT, HEADERS, reviews)

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    next_snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, next_snapshot)
    raise 'CSV changed during candidate-only review' unless M.hashes == prior_hashes

    states = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    unresolved = index.select { |row| row['status'] == 'uncertain' }
                      .map { |row| key(row) }.uniq.length
    next_term = next_snapshot.first&.fetch('english_candidate', 'none')
    candidate_counts = reviews.group_by { |row| row.fetch('disposition') }
                              .transform_values(&:length)
    group_counts = reviews.group_by { |row| row.fetch('english_candidate') }
                          .transform_values(&:length)
    retained = File.read(M::DOCS.first)[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\n<!--)/m, 1
    ]
    raise 'retained backup checkpoint missing' unless retained
    hash_text = M.hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed #{reviews.length} short-label candidate keys: #{candidate_counts.inspect}.
      Candidate groups: #{group_counts.inspect}. Last reviewed candidate: Lorestones / default:62718.
      Next batch: D-#{D + 1}; continue short-label review from `proper-name-short-label-discovery-D#{D}.tsv` (#{next_snapshot.length} bounded groups; begins `#{next_term}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{states.sort.map { |status, count| "#{status}=#{count}" }.join(', ')} (unchanged in this candidate-only batch).
      Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
      Reviewed unresolved indexed holds: #{states.fetch('uncertain', 0)}, in #{unresolved} distinct CSV row keys.
      Candidate dispositions do not alter occurrence-index statuses or counts. Lorestone terminology variants remain outside proper-name classification; D-133 canonical 로어스톤 is recorded for later terminology consistency review.
      These focused index states are not global translation totals.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive and establishes no overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hash_text}
      CSV edits in this candidate-only batch: none; no CSV backup was required.
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest}`.
      Candidate disposition manifest: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
    TEXT

    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    File.write(report, "# D-#{D}: Generic Lorestone Label Exclusions\n\nDate: #{M::RUN_DATE_ISO}\n\n#{summary}\n\n## Evidence\n\n#{reviews.map { |row| "- #{row.fetch('english_candidate')} / #{row.fetch('resource')}:#{row.fetch('ID_Linha')}: #{row.fetch('evidence')}" }.join("\n")}\n")
    File.write(addendum, "# D-#{D} Edit Addendum\n\n#{summary}\n\nNo CSV edit was made. Existing translation variants are recorded as a separate terminology-consistency follow-up, not as proper-name dispositions.\n")

    note = <<~TEXT

      ## D-#{D}: Generic Lorestone Label Exclusions

      Reviewed nine candidate keys across `Lorestone` (5) and `Lorestones`
      (4). Both are common collectible/object-category terms rather than
      named entities; the Fae Cairn artifact remains separately registered.
      No proper-name entity, alias, CSV edit, occurrence-index disposition,
      or cumulative total was added. D-133's established Korean term
      `로어스톤` remains the terminology authority; variant Korean renderings
      found in these candidate cells are deferred to a separate term
      consistency pass. Exact aligned evidence is in
      `proper-name-short-label-dispositions-D#{D}.tsv`.
      Full proper-name discovery/residual validation remains incomplete.
    TEXT
    M::DOCS.each do |path|
      text = checkpoint(File.read(path), summary)
      File.write(path, text + note)
    end
    [report, addendum].each { |path| File.write(path, File.read(path) + note) }
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + note)
    end
    puts "D-#{D}: reviewed #{reviews.length} generic-term candidate keys; no new proper-name entity/count; #{next_snapshot.length} bounded groups remain."
  end
end

ReviewShortLabelCandidatesD21766.run if $PROGRAM_NAME == __FILE__
