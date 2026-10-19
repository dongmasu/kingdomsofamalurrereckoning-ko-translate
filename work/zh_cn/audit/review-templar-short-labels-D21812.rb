#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'

module ReviewTemplarShortLabelsD21812
  extend self

  M = ReviewedNameBatches
  D = 21_812
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21811.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  DECISIONS = {
    'Templar Jorielle' => [
      8,
      'English uses Templar as a rank/title and Jorielle as the personal name. The Korean personal name is paired as Jorielle, including default:36814; where the full title-label is used, it is already paired as Templar Jorielle. Preserve the localized rank and the existing terminal person:jorielle decisions. This is a separate whole-label membership classification, not a reopening or recount of the person-name rows.'
    ],
    'Templar Montainel' => [
      3,
      'D-21811 registered and reviewed Montainel across all nine source keys. Each candidate now preserves the localized rank and uses the canonical personal-name display 몬테이넬(Montainel); base:2087 already has the complete Templar Montainel bilingual compound. Classify the title/name labels as source-faithful without adding a second title entity or changing D-21811 person dispositions.'
    ],
    'Templar Octienne' => [
      9,
      'English uses Templar as the rank/title and Octienne as the personal name. Every Korean occurrence preserves the title and the established bilingual personal name, including default:49191. Keep the existing terminal person:octienne decisions; this is a separate whole-label membership classification, not a reopening or recount of the person-name rows.'
    ]
  }.freeze

  def candidate_keys(row)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(row.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
  end

  def build_reviews(inventory, index, candidates)
    prior_by_key = index.group_by { |row| M.key(row) }
    DECISIONS.flat_map do |term, (expected_count, evidence)|
      candidate = candidates.fetch(term) { raise "missing candidate #{term}" }
      keys = candidate_keys(candidate)
      raise "#{term} candidate count differs" unless keys.length == expected_count
      keys.map do |key|
        source = inventory.fetch(key) { raise "missing aligned row #{key.inspect}" }
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
        chinese = source.fetch('zh_text')
        korean = source.fetch('work_text')
        pattern = /(?<![A-Za-z0-9])#{Regexp.escape(term)}(?![A-Za-z0-9])/i
        raise "#{term} missing from English at #{key.join(':')}" unless english.match?(pattern)
        name = term.split.last
        raise "#{name} bilingual form missing at #{key.join(':')}" unless
          korean.match?(/\((?:#{Regexp.escape(name)}|Templar #{Regexp.escape(name)})\)/)
        if term == 'Templar Montainel'
          raise "D-21811 canonical form missing at #{key.join(':')}" unless
            korean.include?('몬테이넬(Montainel)') ||
              korean.include?('(Templar Montainel)')
        end
        {
          'english_candidate' => term,
          'disposition' => 'not-an-issue',
          'resource' => key[0],
          'ID_Linha' => key[1],
          'Tipo_Variante' => key[2],
          'english' => english,
          'japanese' => japanese,
          'chinese' => chinese,
          'korean' => korean,
          'evidence' => "#{evidence} Exact source key: #{key.join(':')}.",
          'prior_index_dispositions_json' => JSON.generate(
            prior_by_key.fetch(key, []).map do |row|
              [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
            end
          )
        }
      end
    end
  end

  def run
    [OUTPUT, SNAPSHOT,
     File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
     File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")].each do |path|
      raise "refusing to overwrite existing artifact #{path}" if File.exist?(path)
    end
    before_hashes = M.hashes
    index_path_hash = Digest::SHA256.file(M::INDEX).hexdigest
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_hash = Digest::SHA256.file(glossary_path).hexdigest
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    reviews = build_reviews(inventory, index, candidates)
    raise 'expected 20 memberships over 19 distinct keys' unless
      reviews.length == 20 &&
        reviews.map { |row| M.key(row) }.uniq.length == 19 &&
        reviews.count { |row| row['english_candidate'] == 'Templar Jorielle' } == 8 &&
        reviews.count { |row| row['english_candidate'] == 'Templar Montainel' } == 3 &&
        reviews.count { |row| row['english_candidate'] == 'Templar Octienne' } == 9
    raise 'the Jorielle/Octienne shared row must be counted once per candidate' unless
      reviews.count { |row| M.key(row) == ['default', '55078', ''] } == 2

    reviewed = ShortLabelDiscovery20261018.reviewed_dispositions
    added = reviews.map do |row|
      [row.fetch('english_candidate'), row.fetch('resource'),
       row.fetch('ID_Linha'), row.fetch('Tipo_Variante').to_s]
    end
    next_snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, M.table(glossary_path).map(&:to_h), index,
      reviewed_dispositions: reviewed + added
    )
    raise 'reviewed short-label groups remain in refreshed snapshot' if
      next_snapshot.any? do |row|
        DECISIONS.key?(row.fetch('english_candidate')) &&
          (candidate_keys(row).any? || !row['unpaired_label_keys_json'].empty?)
      end
    raise 'candidate-only review changed active CSV' unless M.hashes == before_hashes
    raise 'candidate-only review changed the occurrence index' unless
      Digest::SHA256.file(M::INDEX).hexdigest == index_path_hash
    raise 'candidate-only review changed the glossary' unless
      Digest::SHA256.file(glossary_path).hexdigest == glossary_hash

    status_counts = index.group_by { |row| row.fetch('status') }
                         .transform_values(&:length)
    unresolved = index.select { |row| row['status'] == 'uncertain' }
                      .map { |row| M.key(row) }.uniq.length
    variant_candidates = M.table(File.join(
      __dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'
    )).map(&:to_h)
    variant_counts = variant_candidates.group_by { |row| row['status'] }
                                       .transform_values(&:length)
    previous_block = File.read(M::DOCS.first)[
      /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    ]
    retained = previous_block.to_s[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\n[A-Z]|\n<!--)/m, 1
    ]
    raise 'retained backup checkpoint missing' unless retained
    candidate_counts = reviews.group_by { |row| row.fetch('english_candidate') }
                              .transform_values(&:length)
    next_first = next_snapshot.first&.fetch('english_candidate', 'none')
    hashes = M.hashes
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed #{reviews.length} short-label candidate memberships in #{reviews.map { |row| M.key(row) }.uniq.length} distinct source keys: {"not-an-issue"=>#{reviews.length}}.
      Candidate groups: #{candidate_counts.sort.to_h.inspect}. Shared key default:55078 was classified once for each of its two distinct candidate phrases. Last reviewed candidate: Templar Octienne / default:7722.
      Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{next_snapshot.length} bounded groups; first `#{next_first}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')} (unchanged in this candidate-only batch).
      Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
      Reviewed unresolved indexed holds: #{status_counts.fetch('uncertain', 0)}, in #{unresolved} distinct CSV row keys.
      Candidate classifications do not alter occurrence-index statuses or cumulative indexed counts. Existing Jorielle, Montainel, and Octienne person dispositions were retained without reopening or recounting.
      These focused index states are not global translation totals.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: #{variant_candidates.length} terms; registered-reviewed=#{variant_counts.fetch('registered-reviewed', 0)}, heuristic-not-reviewed=#{variant_counts.fetch('heuristic-not-reviewed', 0)}. This list is not exhaustive and establishes no overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      No CSV edits; no new backup required. Retain last actual pre-edit backups:
      #{retained.strip}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_path_hash}`.
      Proper-name glossary: #{M.table(glossary_path).length} entries; SHA-256 `#{glossary_hash}`.
      Report: `work/zh_cn/audit/named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Candidate disposition manifest: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
    TEXT

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'residual bilingual/index validation failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0')
    raise 'project data changed during final validation' unless
      M.hashes == before_hashes &&
        Digest::SHA256.file(M::INDEX).hexdigest == index_path_hash &&
        Digest::SHA256.file(glossary_path).hexdigest == glossary_hash

    M.write_table(OUTPUT, HEADERS, reviews)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, next_snapshot)
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "checkpoint missing in #{path}" unless text.match?(marker)
      File.write(path, text.sub(marker, block))
    end

    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    details = reviews.map do |row|
      "- `#{row['english_candidate']}` / `#{M.key(row).join(':')}`: not an issue. #{row['evidence']}"
    end.join("\n")
    body = <<~TEXT
      # D-#{D}: Templar/Jorielle/Octienne Whole-Label Candidate Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Findings

      #{details}

      English determines the person identity and separates personal names
      from the generic Templar rank/title. Japanese supports localized title
      and name usage; Chinese is corroborative only. The canonical bilingual
      personal names were already present. D-21811's Montainel correction and
      all earlier person/index decisions remain intact. Candidate memberships
      are a separate discovery layer and do not reopen or recount those rows.
      No CSV, occurrence-index, or glossary bytes changed.

      ## Validation

      #{validation.strip}
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}
    TEXT
    File.write(report, body)
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      #{summary}

      No CSV edit or new backup was required. All existing occurrence-index
      dispositions, glossary entries, and previous candidate closures were
      retained without recount.

      Validation: #{validation.strip}
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}
    TEXT
    note = <<~NOTE

      ## D-#{D}: Templar Name Whole-Label Candidate Review

      Reviewed all 20 candidate memberships for `Templar Jorielle`,
      `Templar Montainel`, and `Templar Octienne` as `not-an-issue`.
      Templar is a localized rank/title; the personal names already use the
      established Korean (English) display. Existing person-index decisions
      were retained without reopening or recounting. This candidate-only
      batch made no CSV, glossary, or occurrence-index changes. See
      `named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md` and
      `proper-name-short-label-dispositions-D#{D}.tsv`.
    NOTE
    [File.join(__dir__, 'README.md'),
     File.join(__dir__, 'decision-register-20261009.md')].each do |path|
      File.open(path, 'a') { |file| file.write(note) }
    end
    puts "D-#{D}: #{reviews.length} candidate memberships / 19 distinct keys; no CSV/index/glossary edits; #{next_snapshot.length} bounded groups remain."
  end
end

ReviewTemplarShortLabelsD21812.run if $PROGRAM_NAME == __FILE__
