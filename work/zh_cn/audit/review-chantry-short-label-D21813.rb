#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'

module ReviewChantryShortLabelD21813
  extend self

  M = ReviewedNameBatches
  D = 21_813
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21812.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  TARGETS = {
    ['default', '7675', ''] => 'excluded',
    ['base', '711', '11'] => 'not-an-issue'
  }.freeze
  EVIDENCE = {
    'excluded' => <<~TEXT.strip.freeze,
      English uses Chantry as a building-type noun, not as a unique institution
      or individually named site. In context, default:19326 and default:29617
      say to destroy the Chantry; default:20663 locates it in relation to a
      castle; default:37849 names a broken chapel; default:58879 uses bare
      Chantry; and default:59429 locates Sagrell in it. Japanese 礼拝堂 and
      Chinese 礼拜堂 at this exact key both mean a chapel. The established
      Korean 예배당 is therefore source-faithful and needs no personal/place
      name annotation. Resolve D-2120/default:7675 only for the Chantry
      meaning and Korean term; do not infer that every Chantry compound is
      generic or reopen the separately registered Summer's End - Chantry.
      Do not register a Chantry entity or add a glossary alias.
    TEXT
    'not-an-issue' => <<~TEXT.strip.freeze
      This exact `The Chantry` base label already has the complete Korean
      display `예배당 (The Chantry)`. Preserve it without editing the label
      or registering a new place entity. This occurrence does not establish
      that the ordinary building type Chantry is itself a unique name.
    TEXT
  }.freeze

  def candidate_keys(row)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(row.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
  end

  def build_reviews(inventory, index, candidates)
    candidate = candidates.fetch('The Chantry')
    keys = candidate_keys(candidate)
    raise "The Chantry candidate keys differ: #{keys.inspect}" unless
      keys.to_set == TARGETS.keys.to_set && keys.length == TARGETS.length
    prior_by_key = index.group_by { |row| M.key(row) }
    all_chantry = inventory.values.select do |source|
      JSON.parse(source.fetch('en_texts_json')).compact.any? do |text|
        text.match?(/(?<![A-Za-z])Chantry(?![A-Za-z])/i)
      end
    end
    context_keys = all_chantry.map { |row| M.key(row) }.to_set
    required_context = [
      %w[default 19326 ''],
      %w[default 20663 ''],
      %w[default 29617 ''],
      %w[default 37849 ''],
      %w[default 58879 '],
      %w[default 59429 ']
    ].map { |key| [key[0], key[1], ''] }.to_set
    raise 'supporting Chantry context is incomplete' unless
      required_context.subset?(context_keys)

    keys.map do |key|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      korean = source.fetch('work_text')
      raise "English Chantry evidence missing at #{key.join(':')}" unless
        english.match?(/(?<![A-Za-z])The Chantry(?![A-Za-z])/)
      raise "Japanese chapel evidence missing at #{key.join(':')}" unless
        japanese.include?('礼拝堂')
      raise "Chinese chapel evidence missing at #{key.join(':')}" unless
        chinese.include?('礼拜堂')
      disposition = TARGETS.fetch(key)
      if disposition == 'excluded'
        raise 'default:7675 Korean generic term changed' unless korean == '예배당'
      else
        raise 'base:711 Korean bilingual label changed' unless
          korean == '예배당 (The Chantry)'
      end
      {
        'english_candidate' => 'The Chantry',
        'disposition' => disposition,
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'korean' => korean,
        'evidence' => "#{EVIDENCE.fetch(disposition)} Exact source key: #{key.join(':')}.",
        'prior_index_dispositions_json' => JSON.generate(
          prior_by_key.fetch(key, []).map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        )
      }
    end
  end

  def run
    [OUTPUT, SNAPSHOT,
     File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
     File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")].each do |path|
      raise "refusing to overwrite existing artifact #{path}" if File.exist?(path)
    end
    before_hashes = M.hashes
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_hash = Digest::SHA256.file(glossary_path).hexdigest
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    reviews = build_reviews(inventory, index, candidates)
    raise 'expected two Chantry membership rows with distinct keys' unless
      reviews.length == 2 && reviews.map { |row| M.key(row) }.uniq.length == 2

    reviewed = ShortLabelDiscovery20261018.reviewed_dispositions
    added = reviews.map do |row|
      [row.fetch('english_candidate'), row.fetch('resource'),
       row.fetch('ID_Linha'), row.fetch('Tipo_Variante').to_s]
    end
    glossary = M.table(glossary_path).map(&:to_h)
    next_snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, glossary, index,
      reviewed_dispositions: reviewed + added
    )
    raise 'The Chantry remains in refreshed candidate snapshot' if
      next_snapshot.any? { |row| row['english_candidate'] == 'The Chantry' }
    raise 'candidate-only review changed CSV/index/glossary' unless
      M.hashes == before_hashes &&
        Digest::SHA256.file(M::INDEX).hexdigest == index_hash &&
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
      /(?:Last actual CSV-edit backups \([^)]*\)|Retain last actual pre-edit backups):\n(.*?)(?=\n[A-Z]|\n<!--)/m, 1
    ]
    raise 'retained backup checkpoint missing' unless retained
    next_first = next_snapshot.first&.fetch('english_candidate', 'none')
    hashes = M.hashes
    counts = reviews.group_by { |row| row.fetch('disposition') }
                    .transform_values(&:length)
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed 2 short-label candidate memberships in 2 distinct source keys: #{counts.inspect}.
      Candidate groups: {"The Chantry"=>2}. Last reviewed candidate: The Chantry / base:711:11.
      Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{next_snapshot.length} bounded groups; first `#{next_first}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')} (unchanged in this candidate-only batch).
      Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
      Reviewed unresolved indexed holds: #{status_counts.fetch('uncertain', 0)}, in #{unresolved} distinct CSV row keys.
      Candidate classifications do not alter occurrence-index statuses or cumulative indexed counts. D-2120/default:7675 is superseded only for the Chantry building sense and Korean term; broader location/entity classifications remain separate.
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
      Occurrence index: #{index.length} rows; SHA-256 `#{index_hash}`.
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{glossary_hash}`.
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
        Digest::SHA256.file(M::INDEX).hexdigest == index_hash &&
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
      "- `#{M.key(row).join(':')}`: #{row['disposition']}. #{row['evidence']}"
    end.join("\n")
    body = <<~TEXT
      # D-#{D}: Chantry Building-Term Candidate Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Findings

      #{details}

      The aligned English contexts use Chantry as a chapel/building type,
      while Japanese `礼拝堂` and Chinese `礼拜堂` support the same generic
      sense. Korean `예배당` is consistent across the corpus. `base:711:11`
      already has a bilingual label and remains unchanged. No Chantry person,
      organization, or place entity was registered. The existing
      `Summer's End - Chantry` compound is a separately reviewed proper place
      label and is not altered or generalized here. D-2120/default:7675's
      narrow lexical uncertainty is resolved; no global tally is recomputed.
      No CSV, occurrence-index, or glossary bytes changed.

      ## Validation

      #{validation.strip}
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}
    TEXT
    File.write(report, body)
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      #{summary}

      No CSV edit or new backup was required. D-2120/default:7675 is
      superseded only for the generic Chantry/chapel sense; historical
      sentence and broader place/institution questions remain unchanged.
      Existing occurrence-index dispositions and glossary entries were
      retained without recount.

      Validation: #{validation.strip}
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}
    TEXT
    note = <<~NOTE

      ## D-#{D}: Chantry Building-Term Candidate Review

      Reviewed both `The Chantry` short-label memberships. `default:7675`
      uses the generic building term “chapel,” consistently rendered
      `예배당` across relevant corpus contexts; it is excluded from a proper
      name entity. `base:711:11` already has `예배당 (The Chantry)` and is
      retained. This resolves D-2120/default:7675 only for its Chantry
      meaning/Korean term; the separate `Summer's End - Chantry` place entry
      and broader site/entity questions are unchanged. No CSV, glossary, or
      occurrence-index changes. See `named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
    NOTE
    [File.join(__dir__, 'README.md'),
     File.join(__dir__, 'decision-register-20261009.md')].each do |path|
      File.open(path, 'a') { |file| file.write(note) }
    end
    puts "D-#{D}: 2 Chantry memberships reviewed; no CSV/index/glossary edits; #{next_snapshot.length} bounded groups remain."
  end
end

ReviewChantryShortLabelD21813.run if $PROGRAM_NAME == __FILE__
