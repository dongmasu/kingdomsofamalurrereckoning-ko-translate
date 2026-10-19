#!/usr/bin/env ruby

require_relative 'build-short-label-discovery-20261018'

# Records explicit no-edit review evidence; never infers a disposition.
module ShortLabelProposals20261018
  extend self
  M = ReviewedNameBatches
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  MARKER = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m

  def prepare(proposals, candidates, inventory, index, prior_dispositions)
    by_key = index.group_by { |row| M.key(row) }
    raise 'duplicate proposal terms' unless
      proposals.map { |row| row.fetch('english_candidate') }.uniq.length == proposals.length
    rows = proposals.flat_map do |decision|
      term = decision.fetch('english_candidate')
      status = decision.fetch('disposition')
      raise "invalid no-edit disposition: #{status}" unless %w[not-an-issue excluded uncertain].include?(status)
      evidence = decision.fetch('evidence')
      raise "empty review evidence for #{term}" if evidence.strip.empty?
      candidate = candidates.fetch(term)
      keys = %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
        JSON.parse(candidate.fetch(field))
      end.uniq.sort
      raise "candidate key count changed: #{term}" unless keys.length == Integer(decision.fetch('expected_keys'))
      keys.map do |key|
        raise "already reviewed candidate/key: #{term} #{key.inspect}" if prior_dispositions.include?([term, *key])
        source = inventory.fetch(key)
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        raise "source term missing: #{term} #{key.inspect}" unless
          english.match?(/(?<![A-Za-z0-9])#{Regexp.escape(term)}(?![A-Za-z0-9])/i)
        {
          'english_candidate' => term, 'disposition' => status,
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'english' => english,
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
          'chinese' => source.fetch('zh_text'), 'korean' => source.fetch('work_text'),
          'evidence' => evidence,
          'prior_index_dispositions_json' => JSON.generate(
            by_key.fetch(key, []).map { |row| [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')] }
          )
        }
      end
    end
    raise 'empty or oversized no-edit scope' unless rows.any? && rows.map { |row| M.key(row) }.uniq.length <= 50
    rows
  end

  def run(path, d, apply: false)
    proposals = M.table(path).map(&:to_h)
    proposals.select! { |row| row.fetch('batch', d.to_s).delete_prefix('D-').to_i == d }
    raise "no proposals for D-#{d}" if proposals.empty?
    files = {
      manifest: File.join(__dir__, "proper-name-short-label-dispositions-D#{d}.tsv"),
      snapshot: File.join(__dir__, "proper-name-short-label-discovery-D#{d}.tsv"),
      report: File.join(__dir__, "named-scope-review-D#{d}-#{M::RUN_DATE_COMPACT}.md"),
      addendum: File.join(__dir__, "named-scope-edit-addendum-D#{d}-#{M::RUN_DATE_COMPACT}.md")
    }
    raise "D-#{d} outputs already exist" if files.values.any? { |file| File.exist?(file) }
    docs = M::DOCS.to_h { |file| [file, File.read(file)] }
    prior = docs.values.first[MARKER]
    raise "D-#{d - 1} must be current" unless prior&.include?("Latest verified proper-name batch: D-#{d - 1} ")
    raise 'checkpoint documents differ' unless docs.values.all? { |text| text[MARKER] == prior }
    before = M.hashes
    index_bytes = File.binread(M::INDEX)
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_bytes = File.binread(glossary_path)
    inventory = M.refresh_inventory
    glossary = M.table(glossary_path).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    prior_dispositions = ShortLabelDiscovery20261018.reviewed_dispositions
    candidates = ShortLabelDiscovery20261018.build(
      inventory.values, glossary, index, reviewed_dispositions: prior_dispositions
    ).to_h { |row| [row.fetch('english_candidate'), row] }
    rows = prepare(proposals, candidates, inventory, index, prior_dispositions)
    raise 'CSV/index/glossary changed during review' unless
      M.hashes == before && File.binread(M::INDEX) == index_bytes &&
      File.binread(glossary_path) == glossary_bytes
    counts = rows.group_by { |row| row.fetch('disposition') }.transform_values(&:length)
    puts "D-#{d}: #{proposals.length} groups/#{rows.map { |row| M.key(row) }.uniq.length} distinct keys; #{counts.inspect}; CSV/index/glossary unchanged."
    return rows unless apply

    M.write_table(files.fetch(:manifest), HEADERS, rows)
    candidates_after = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(files.fetch(:snapshot), ShortLabelDiscovery20261018::HEADERS, candidates_after)
    block = prior.dup
    block.sub!(/Latest verified proper-name batch:.*?\n/, "Latest verified proper-name batch: D-#{d} (#{M::RUN_DATE_ISO}).\n")
    start = block.index("\nReviewed ")
    finish = block.index("\nIndexed matches:")
    raise 'prior checkpoint shape differs' unless start && finish
    last = rows.last
    block[start...finish] = <<~TEXT.chomp.prepend("\n")
      Reviewed #{rows.map { |row| M.key(row) }.uniq.length} distinct candidate row keys across #{proposals.length} groups: #{counts.inspect}. No new entity-index matches or global tally changes.
      Last reviewed candidate key: #{M.key(last).join(':')} / #{last.fetch('english_candidate')}.
      Next batch: D-#{d + 1}; continue unreviewed short-label candidates from `#{File.basename(files.fetch(:snapshot))}` (#{candidates_after.length} bounded groups; not exhaustive or a completion estimate).
    TEXT
    block.sub!(/Last batch pre-edit backups and byte validation:\n.*?(?=Last actual CSV-edit backups)/m,
               "Last batch pre-edit backups and byte validation:\nNo CSV edits; all active bytes, BOM, mixed line endings, keys, and row order unchanged. No new backup required.\n")
    block.sub!(/Aligned inventory:.*?\n/, "Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.\n")
    block.sub!(/^Report:.*$/, "Report: `work/zh_cn/audit/#{File.basename(files.fetch(:report))}`.")
    block.sub!(/^Addendum:.*$/, "Addendum: `work/zh_cn/audit/#{File.basename(files.fetch(:addendum))}`.")
    block.sub!(/^Exact source comparison manifest:.*$/, "Exact source comparison manifest: `work/zh_cn/audit/#{File.basename(files.fetch(:manifest))}`.")
    evidence = proposals.map do |row|
      "- #{row.fetch('english_candidate')} (#{row.fetch('expected_keys')} keys): #{row.fetch('disposition')}. #{row.fetch('evidence')}"
    end.join("\n")
    body = block.sub(/\A<!--.*?-->\n/m, '').sub(/<!-- current-proper-name-batch:end -->\z/, '')
    summary = "\n## D-#{d}: No-Edit Short-Label Review\n\n#{evidence}\n\nExact aligned English/Japanese/Chinese/Korean and prior entity decisions are preserved in `#{File.basename(files.fetch(:manifest))}`. Prior terminal keys and historical global totals were not reopened or recounted. No CSV, glossary, or occurrence-index bytes changed; full discovery remains incomplete.\n"
    File.write(files.fetch(:report), "# D-#{d}: Short-Label Candidate Review\n\n#{body}\n#{summary}")
    File.write(files.fetch(:addendum), "# D-#{d} Edit Addendum\n\n#{body}\nNo CSV edits or new backups. Prior last-edit backup paths are retained above.\n#{summary}")
    docs.each do |file, text|
      text.sub!(MARKER, block)
      text << summary if %w[README.md decision-register-20261009.md].include?(File.basename(file))
      File.write(file, text)
    end
    raise 'no-edit invariants failed' unless M.hashes == before &&
      File.binread(M::INDEX) == index_bytes && File.binread(glossary_path) == glossary_bytes
    rows
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: run-short-label-proposals-20261018.rb PROPOSALS.tsv D_NUMBER [--apply]' unless (2..3).cover?(ARGV.length)
  ShortLabelProposals20261018.run(ARGV[0], Integer(ARGV[1]), apply: ARGV[2] == '--apply')
end
