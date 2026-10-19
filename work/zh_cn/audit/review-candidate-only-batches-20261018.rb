#!/usr/bin/env ruby

require_relative 'build-short-label-discovery-20261018'

# Record explicit, source-key-bounded reviews without changing a prior entity
# disposition or registering a speculative new entity.
module CandidateOnlyBatches20261018
  extend self
  M = ReviewedNameBatches
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante english
    japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  MARKER = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m

  def prepare(groups, inventory, index, candidates)
    by_key = index.group_by { |r| M.key(r) }
    groups.flat_map do |term, decision|
      candidate = candidates.fetch(term)
      keys = %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
        JSON.parse(candidate.fetch(field))
      end.uniq
      raise "explicit candidate scope differs: #{term}" unless keys.sort == decision.fetch(:keys).sort
      keys.map do |key|
        source = inventory.fetch(key)
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        raise "candidate not in source: #{term}/#{key}" unless
          english.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
        status = decision.fetch(:dispositions, {}).fetch(key.join(':'), decision.fetch(:disposition))
        raise "invalid candidate-only decision #{status}" unless %w[not-an-issue excluded uncertain].include?(status)
        evidence = decision.fetch(:evidence)
        raise 'missing reviewed candidate evidence' if evidence.strip.empty?
        {
          'english_candidate' => term, 'disposition' => status,
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'english' => english,
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'), 'korean' => source.fetch('work_text'),
          'evidence' => evidence,
          'prior_index_dispositions_json' => JSON.generate(by_key.fetch(key, []).map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end)
        }
      end
    end
  end

  def checkpoint(d, rows, inventory, snapshot, title)
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    index = M.table(M::INDEX)
    old_block = File.read(M::DOCS.first)[MARKER]
    raise 'current checkpoint missing' unless old_block
    retained = old_block[
      /Last actual CSV-edit backups[^\n]*:\n(.*?)(?=\nAligned inventory:)/m, 1
    ]
    raise 'last actual backups missing' unless retained
    counts = rows.group_by { |row| row.fetch('disposition') }.transform_values(&:length)
    index_counts = index.group_by { |r| r.fetch('status') }.transform_values(&:length)
    unreviewed = index.select { |r| r['status'] == 'needs-context' }
    held = index.select { |r| r['status'] == 'uncertain' }
    snapshot_name = "proper-name-short-label-discovery-D#{d}.tsv"
    report_name = "named-scope-review-D#{d}-#{M::RUN_DATE_COMPACT}.md"
    addendum_name = "named-scope-edit-addendum-D#{d}-#{M::RUN_DATE_COMPACT}.md"
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{d} (#{M::RUN_DATE_ISO}).
      Reviewed #{rows.length} candidate memberships in #{rows.map { |r| M.key(r) }.uniq.length} distinct source keys: #{counts.inspect}.
      Candidate groups: #{rows.group_by { |r| r['english_candidate'] }.transform_values(&:length).inspect}.
      Last reviewed candidate: #{rows.last['english_candidate']} / #{M.key(rows.last).join(':')}.
      Next batch: D-#{d + 1}; continue from `#{snapshot_name}` (#{snapshot.length} bounded groups; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{index_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')} (unchanged in this candidate-only batch).
      Remaining unreviewed indexed matches: #{unreviewed.length}, in #{unreviewed.map { |r| M.key(r) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |r| M.key(r) }.uniq.length} distinct CSV row keys.
      Candidate-only uncertainties are separate from indexed holds. Do not reopen historical decisions or recount global totals.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{M.hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")}
      CSV edits in this candidate-only batch: none; no new backup required.
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{Digest::SHA256.file(glossary_path).hexdigest}`.
      Report: `work/zh_cn/audit/#{report_name}`.
      Addendum: `work/zh_cn/audit/#{addendum_name}`.
      Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{d}.tsv`.
    TEXT
    evidence = rows.map do |row|
      "- #{row['english_candidate']} / #{M.key(row).join(':')}: #{row['disposition']}. #{row['evidence']}"
    end.uniq.join("\n")
    File.write(File.join(__dir__, report_name), "# D-#{d}: #{title}\n\n#{summary}\n## Evidence\n\n#{evidence}\n")
    File.write(File.join(__dir__, addendum_name), "# D-#{d}: No-Edit Addendum\n\n#{summary}\nActive CSVs, glossary and occurrence index are byte-identical to their pre-batch state. No prior entity/row disposition or global tally changed. Full aligned source evidence is retained in the candidate manifest.\n")
    M::DOCS.each do |path|
      text = File.read(path)
      raise "checkpoint missing: #{path}" unless text.match?(MARKER)
      block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->"
      File.write(path, text.sub(MARKER, block))
    end
  end

  def run(start_d, groups, title, candidate_path:)
    before = M.hashes
    protected_paths = [M::INDEX, File.join(__dir__, 'proper-name-glossary.tsv')]
    protected_hashes = protected_paths.to_h { |path| [path, Digest::SHA256.file(path).hexdigest] }
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    candidates = M.table(candidate_path).map(&:to_h).to_h { |row| [row.fetch('english_candidate'), row] }
    reviews = prepare(groups, inventory, index, candidates)
    raise 'duplicate candidate membership' unless
      reviews.map { |r| [r['english_candidate'], *M.key(r)] }.uniq.length == reviews.length
    reviews.each_slice(50).with_index do |rows, ordinal|
      d = start_d + ordinal
      output = File.join(__dir__, "proper-name-short-label-dispositions-D#{d}.tsv")
      snapshot_path = File.join(__dir__, "proper-name-short-label-discovery-D#{d}.tsv")
      raise "D-#{d} artifacts already exist" if
        [output, snapshot_path, *Dir.glob(File.join(__dir__, "named-scope-*-D#{d}-*.md"))].any? { |p| File.exist?(p) }
      M.write_table(output, HEADERS, rows)
      snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
      M.write_table(snapshot_path, ShortLabelDiscovery20261018::HEADERS, snapshot)
      raise 'candidate review modified an active CSV' unless M.hashes == before
      raise 'candidate review modified protected name data' unless
        protected_hashes.all? { |path, hash| Digest::SHA256.file(path).hexdigest == hash }
      checkpoint(d, rows, inventory, snapshot, title)
      puts "D-#{d}: #{rows.length} candidate memberships; #{snapshot.length} bounded groups remain; no CSV/index/glossary edits."
    end
    start_d + (reviews.length / 50.0).ceil
  end
end
