#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21768
  extend self

  M = ReviewedNameBatches
  D = 21_768
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21767.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  GROUPS = {
    'MIGHT' => {
      keys: [['default', '1753', ''], ['default', '29062', '']],
      evidence: 'English MIGHT at default:1753 is a gameplay ability-tree category; default:29062 describes unlocked Might Abilities and directly pairs 힘(Might). Japanese マイト and Chinese 力量 corroborate the category. The official Korean manual extraction/reference uses 힘(Might) for this ability tree (PDF p. 5). As with the D-21724 Finesse ability-tree labels, this is a game-system category, not a separately registered proper-name entity. Preserve the existing Korean label and all previous row-level findings.'
    },
    'Might' => {
      keys: [['default', '30042', ''], ['default', '38057', ''], ['default', '29062', '']],
      evidence: 'English default:30042 and 38057 are short labels for the Might ability-tree category; default:29062 describes unlocked Might Abilities and pairs 힘(Might). Japanese マイト and Chinese 力量 corroborate the category. The official Korean manual extraction/reference uses 힘(Might) for this ability tree (PDF p. 5). As with the D-21724 Finesse ability-tree labels, this is a game-system category, not a separately registered proper-name entity. Preserve the existing Korean labels and all previous row-level findings.'
    }
  }.freeze

  def key(row)
    M.key(row)
  end

  def candidate_keys(row)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(row.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
  end

  def build_reviews(inventory, index, candidates)
    prior_by_key = index.group_by { |row| key(row) }
    reviews = GROUPS.flat_map do |term, decision|
      candidate = candidates.fetch(term) { raise "missing candidate #{term}" }
      keys = candidate_keys(candidate)
      raise "#{term} candidate coverage differs" unless keys.sort == decision.fetch(:keys).sort
      keys.map do |row_key|
        source = inventory.fetch(row_key) { raise "missing aligned row #{row_key.inspect}" }
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
        pattern = /(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i
        raise "#{term} is absent from #{row_key.inspect}" unless english.match?(pattern)
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
    unique_keys = reviews.map { |row| key(row) }.uniq
    raise 'expected five candidate memberships across four source rows' unless
      reviews.length == 5 && unique_keys.length == 4
    raise 'overlapping evidence row does not occur in both case groups' unless
      reviews.count { |row| key(row) == ['default', '29062', ''] } == 2
    reviews
  end

  def checkpoint_text(snapshot, retained_backups, inventory)
    index = M.table(M::INDEX)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    hashes = M.hashes
    next_term = snapshot.first&.fetch('english_candidate', 'none')
    status_counts = index.group_by { |row| row['status'] }.transform_values(&:length)
    unresolved = index.select { |row| row['status'] == 'uncertain' }
                      .map { |row| key(row) }.uniq.length
    <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed 5 short-label candidate memberships in 4 distinct source keys: {"not-an-issue"=>5}.
      Candidate groups: {"MIGHT"=>2, "Might"=>3}. Last reviewed candidate: Might / default:29062.
      Next batch: D-#{D + 1}; continue short-label review from `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; begins `#{next_term}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')} (unchanged in this candidate-only batch).
      Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
      Reviewed unresolved indexed holds: #{status_counts.fetch('uncertain', 0)}, in #{unresolved} distinct CSV row keys.
      Candidate classifications do not alter occurrence-index statuses or counts. Existing default:1753 terminal disposition and the unresolved D-9652 translation question at default:30042 remain unchanged.
      These focused index states are not global translation totals.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive and establishes no overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      CSV edits in this no-edit candidate batch: none; no new backup required.
      Last actual CSV-edit backups (retained across this no-edit batch):
      #{retained_backups}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest}`.
      Report: `work/zh_cn/audit/named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Candidate disposition manifest: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
    TEXT
  end

  def checkpoint(path, summary)
    text = File.read(path)
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->"
    raise "active checkpoint missing in #{path}" unless text.match?(marker)
    File.write(path, text.sub(marker, block))
  end

  def run
    existing_outputs = [File.exist?(OUTPUT), File.exist?(SNAPSHOT)]
    raise "D-#{D} has only one of its paired outputs" if existing_outputs.uniq.length > 1
    before = M.hashes
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    reviews = build_reviews(inventory, index, candidates)
    raise 'candidate-only review changed active CSV' unless M.hashes == before
    if existing_outputs.all?
      raise "existing D-#{D} dispositions differ from reviewed evidence" unless
        M.table(OUTPUT).map(&:to_h) == reviews
    else
      M.write_table(OUTPUT, HEADERS, reviews)
    end

    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    next_snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary.map(&:to_h), index)
    if existing_outputs.all?
      raise "existing D-#{D} snapshot differs from rebuilt discovery" unless
        M.table(SNAPSHOT).map(&:to_h) == next_snapshot
    else
      M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, next_snapshot)
    end
    states = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    retained = File.read(M::DOCS.first)[
      /Last actual CSV-edit backups(?: \(retained across no-edit batches\))?:\n(.*?)(?=\nAligned inventory:)/m, 1
    ]
    raise 'retained backup checkpoint missing' unless retained
    summary = checkpoint_text(next_snapshot, retained, inventory)
    counts = reviews.group_by { |row| row.fetch('disposition') }.transform_values(&:length)
    last_candidate = reviews.last
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    evidence = GROUPS.map do |term, decision|
      keys = decision.fetch(:keys).map { |parts| "#{parts[0]}:#{parts[1]}" }.join(', ')
      "- #{term} (#{decision.fetch(:keys).length} candidate memberships; keys #{keys}): not-an-issue. #{decision.fetch(:evidence)}"
    end.join("\n")
    note = <<~TEXT

      ## D-#{D}: Might Ability-Tree Category Exclusions

      Reviewed five candidate memberships across four distinct source rows:
      `MIGHT` (2) and `Might` (3); the `default:29062` evidence row overlaps
      both case groups and is counted once as a distinct row. The English,
      Japanese, Chinese, and official Korean manual evidence identifies the
      Might ability-tree category, parallel to the D-21724 Finesse ruling,
      not a separate named skill/entity. All five memberships are
      `not-an-issue` for proper-name classification. No CSV, glossary,
      occurrence-index, or cumulative count changed.
      Preserve D-19596's terminal result at `default:1753` without recounting;
      D-9652's separate translation hold at `default:30042` remains unchanged.
      Exact evidence is in `proper-name-short-label-dispositions-D#{D}.tsv`.
      Remaining bounded candidates: #{next_snapshot.length}, beginning
      `#{next_snapshot.first&.fetch('english_candidate', 'none')}`; this is not
      an exhaustive completion estimate.
      Full proper-name discovery/residual validation remains incomplete.
    TEXT
    File.write(report, "# D-#{D}: Might Ability-Tree Category Exclusions\n\nDate: #{M::RUN_DATE_ISO}\n\n#{summary}\n\n## Evidence\n\n#{evidence}\n#{note}")
    File.write(addendum, "# D-#{D} Edit Addendum\n\n#{summary}\n\nNo CSV edit was made; the default:29062 paired evidence row is shared by both case groups and counted once as a distinct source row.\n#{note}")

    M::DOCS.each { |path| checkpoint(path, summary + note) }
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      text = File.read(path)
      marker = '## D-21767: Mercantile Named Skill'
      raise "previous batch marker missing in #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, note + "\n" + marker))
    end
    [report, addendum].each do |path|
      text = File.read(path)
      validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
      residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
      raise 'read-only candidate validation failed' unless validation.include?('PASS') &&
        residual.include?('missing=0') && residual.include?('undocumented extras=0')
      validation_note = "\nValidation (no-edit batch): #{validation.strip}\nResidual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}\n"
      File.write(path, text + validation_note)
    end
    puts "D-#{D}: reviewed five case-sensitive candidate memberships across four unique rows; no CSV or occurrence-index changes; #{next_snapshot.length} candidate groups remain."
  end
end

ReviewShortLabelCandidatesD21768.run if $PROGRAM_NAME == __FILE__
