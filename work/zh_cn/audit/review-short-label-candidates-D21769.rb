#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21769
  extend self

  M = ReviewedNameBatches
  D = 21_769
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21768.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  GROUPS = {
    'Marauders' => {
      keys: [
        ['default', '25318', ''], ['default', '37031', ''],
        ['default', '63037', ''], ['default', '8801', ''],
        ['default', '18622', ''], ['default', '54512', '']
      ],
      evidence: 'The standalone labels and the aligned prose use marauders as a generic class or plural description of hostile raiders, including groups associated with different locations and leaders. Japanese マローダー and Chinese 劫掠者 support the common enemy-type reading. These bounded candidate rows do not establish one uniquely named faction; preserve the existing Korean wording and all prior row decisions.'
    },
    'Master' => {
      keys: [['default', '11411', ''], ['default', '38377', ''], ['default', '60551', '']],
      evidence: 'The two standalone labels use Master as a generic rank or proficiency label; the paired prose uses the possessive “the Master’s” for an unnamed teacher or school authority. Japanese 達人/マスター and Chinese 大师/院长 support role or rank senses, not one identifiable named person or unique entity. Preserve the existing Korean labels and prior row decisions.'
    },
    'Mayor Eswin' => {
      keys: [
        ['default', '13168', ''], ['default', '18160', ''],
        ['default', '20355', ''], ['default', '24709', ''],
        ['default', '29536', ''], ['default', '31459', ''],
        ['default', '4571', ''], ['base', '4240', '11'],
        ['default', '23520', ''], ['default', '23639', ''],
        ['default', '27186', ''], ['default', '52944', ''],
        ['default', '53220', ''], ['default', '5991', ''],
        ['default', '6933', ''], ['default', '7013', '']
      ],
      evidence: 'English names the already registered person Eswin with his generic civic office, Mayor. Japanese エズウィン市長 and Chinese 艾斯文镇长 corroborate the same person and role. The Korean rows already pair Eswin where present; do not create a duplicate titled-person entity or alter the established person:eswin decisions. Preserve the exact source-local role wording.'
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
        raise "#{term} is absent from #{row_key.inspect}" unless
          english.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
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
    raise 'unexpected D-21769 candidate membership count' unless reviews.length == 25
    reviews
  end

  def checkpoint_text(snapshot, retained_backups, inventory)
    index = M.table(M::INDEX)
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    hashes = M.hashes
    counts = index.group_by { |row| row['status'] }.transform_values(&:length)
    unresolved = index.select { |row| row['status'] == 'uncertain' }.map { |row| key(row) }.uniq.length
    next_term = snapshot.first&.fetch('english_candidate', 'none')
    <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed 25 short-label candidate memberships in 25 distinct source keys: {"not-an-issue"=>25}.
      Candidate groups: {"Marauders"=>6, "Master"=>3, "Mayor Eswin"=>16}. Last reviewed candidate: Mayor Eswin / default:7013.
      Next batch: D-#{D + 1}; continue short-label review from `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; begins `#{next_term}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')} (unchanged in this candidate-only batch).
      Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
      Reviewed unresolved indexed holds: #{counts.fetch('uncertain', 0)}, in #{unresolved} distinct CSV row keys.
      Candidate classifications do not alter occurrence-index statuses or counts. Existing person:eswin decisions and all prior row-level findings remain unchanged.
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
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{Digest::SHA256.file(glossary_path).hexdigest}`.
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
    existing = [File.exist?(OUTPUT), File.exist?(SNAPSHOT)]
    raise 'only one paired D-21769 output exists' if existing.uniq.length > 1
    before = M.hashes
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    candidates = M.table(INPUT).map(&:to_h).to_h { |row| [row.fetch('english_candidate'), row] }
    reviews = build_reviews(inventory, index, candidates)
    raise 'no-edit candidate review changed active CSV' unless M.hashes == before
    if existing.all?
      raise 'existing D-21769 dispositions differ from rebuilt evidence' unless M.table(OUTPUT).map(&:to_h) == reviews
    else
      M.write_table(OUTPUT, HEADERS, reviews)
    end

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    next_snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    if existing.all?
      raise 'existing D-21769 snapshot differs from rebuilt discovery' unless
        M.table(SNAPSHOT).map(&:to_h) == next_snapshot
    else
      M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, next_snapshot)
    end

    retained = File.read(M::DOCS.first)[
      /Last actual CSV-edit backups(?: \(retained across this no-edit batch\))?:\n(.*?)(?=\nAligned inventory:)/m, 1
    ]
    raise 'retained backup checkpoint missing' unless retained
    summary = checkpoint_text(next_snapshot, retained, inventory)
    evidence = GROUPS.map do |term, decision|
      "- #{term} (#{decision.fetch(:keys).length} candidate memberships): not-an-issue. #{decision.fetch(:evidence)}"
    end.join("\n")
    note = <<~TEXT

      ## D-#{D}: Generic Labels And Existing Person Name

      Reviewed 25 candidate memberships in 25 distinct source rows:
      `Marauders` (6), `Master` (3), and `Mayor Eswin` (16). These are
      generic raider/rank labels or the already registered person Eswin
      with a civic office, not additional named entities. Existing Korean
      text, person:eswin registration, prior row decisions, CSVs, glossary,
      occurrence index, and cumulative counts are unchanged.
      Exact locale and prior-index evidence is in
      `proper-name-short-label-dispositions-D#{D}.tsv`.
      Remaining bounded candidates: #{next_snapshot.length}, beginning
      `#{next_snapshot.first&.fetch('english_candidate', 'none')}`; this is
      not an exhaustive completion estimate. Full discovery remains incomplete.
    TEXT
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    File.write(report, "# D-#{D}: Generic Labels And Existing Person Name\n\nDate: #{M::RUN_DATE_ISO}\n\n#{summary}\n\n## Evidence\n\n#{evidence}\n#{note}")
    File.write(addendum, "# D-#{D} Edit Addendum\n\n#{summary}\n\nNo CSV edit was made; prior person:eswin entity rows were preserved and not recounted.\n#{note}")
    M::DOCS.each { |path| checkpoint(path, summary + note) }
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      text = File.read(path)
      marker = '## D-21768: Might Ability-Tree Category Exclusions'
      raise "previous batch marker missing in #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, note + "\n" + marker))
    end
    [report, addendum].each do |path|
      validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
      residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
      raise 'candidate validation failed' unless validation.include?('PASS') &&
        residual.include?('missing=0') && residual.include?('undocumented extras=0')
      lines = residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip)
      File.write(path, File.read(path) + "\nValidation (no-edit batch): #{validation.strip}\nResidual bilingual/index audit: PASS; #{lines.join('; ')}\n")
    end
    puts "D-#{D}: reviewed 25 generic/existing-person candidate memberships across 25 source rows; no CSV or occurrence-index changes; #{next_snapshot.length} candidate groups remain."
  end
end

ReviewShortLabelCandidatesD21769.run if $PROGRAM_NAME == __FILE__
