#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'

module ReviewGardensShortLabelD21815
  extend self

  M = ReviewedNameBatches
  D = 21_815
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21814.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  TARGETS = {
    ['default', '9150', ''] => 'not-an-issue',
    ['base', '3049', '11'] => 'not-an-issue'
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    The exact Korean cell already carries the complete established bilingual
    place display for Ysa's Gardens. English uses the article-bearing label
    The Gardens of Ysa, while Japanese イーサの庭園 and Chinese 伊萨花园 identify
    the same named city/gardens. Korean does not need to reproduce the
    ordinary English article `The`. D-21505 screened all 76 exact Gardens of
    Ysa keys under the existing place:ysa entry, explicitly retained these
    ambiguous standalone labels and their historical decisions, and rejected
    a duplicate Gardens entity. Preserve both cells and the distinct prior
    index states; infer no book identity from the standalone labels.
  TEXT

  def candidate_keys(row)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(row.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
  end

  def build_reviews(inventory, index, candidates)
    keys = candidate_keys(candidates.fetch('The Gardens of Ysa'))
    raise "The Gardens of Ysa candidate keys differ: #{keys.inspect}" unless
      keys.to_set == TARGETS.keys.to_set && keys.length == TARGETS.length
    prior_by_key = index.group_by { |row| M.key(row) }

    keys.map do |key|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      korean = source.fetch('work_text')
      raise "English Gardens source changed at #{key.join(':')}" unless
        english.match?(/The Gardens of Ysa/)
      raise "Japanese Gardens evidence missing at #{key.join(':')}" unless
        japanese.include?('イーサの庭園')
      raise "Chinese Gardens evidence missing at #{key.join(':')}" unless
        chinese.include?('伊萨花园')
      raise "complete Korean bilingual name missing at #{key.join(':')}" unless
        korean.include?('이사의 정원') &&
          korean.match?(/\((?:The )?Gardens of Ysa\)/)

      owners = prior_by_key.fetch(key, [])
      raise "expected exactly one existing place:ysa disposition at #{key.join(':')}" unless
        owners.length == 1 && owners.first.fetch('entity_key') == 'place:ysa'
      expected_status = key[0] == 'base' ? 'not-an-issue' : 'accepted'
      raise "historical place:ysa disposition changed at #{key.join(':')}" unless
        owners.first.fetch('status') == expected_status

      {
        'english_candidate' => 'The Gardens of Ysa',
        'disposition' => TARGETS.fetch(key),
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'korean' => korean,
        'evidence' => "#{EVIDENCE} Exact source key: #{key.join(':')}.",
        'prior_index_dispositions_json' => JSON.generate(
          owners.map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        )
      }
    end
  end

  def retained_backup_lines
    block = File.read(M::DOCS.first)[
      /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    ].to_s
    latest = block[/Latest actual CSV-edit backup:\n(.*?)(?=\nEarlier retained CSV-edit backups:)/m, 1]
    earlier = block[/Earlier retained CSV-edit backups:\n(.*?)(?=\nAligned inventory:)/m, 1]
    raise 'latest/retained backup checkpoint missing' unless latest && earlier
    ([latest, earlier].join("\n")).lines.map(&:strip).reject(&:empty?).join("\n")
  end

  def run
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [OUTPUT, SNAPSHOT, report, addendum].each do |path|
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
    raise 'expected two exact Gardens candidate memberships' unless
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
    raise 'The Gardens of Ysa remains in refreshed candidate snapshot' if
      next_snapshot.any? { |row| row['english_candidate'] == 'The Gardens of Ysa' }
    raise 'no-edit candidate review changed CSV/index/glossary' unless
      M.hashes == before_hashes &&
        Digest::SHA256.file(M::INDEX).hexdigest == index_hash &&
        Digest::SHA256.file(glossary_path).hexdigest == glossary_hash

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'residual bilingual/index validation failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0')
    raise 'final validation changed project data' unless
      M.hashes == before_hashes &&
        Digest::SHA256.file(M::INDEX).hexdigest == index_hash &&
        Digest::SHA256.file(glossary_path).hexdigest == glossary_hash

    counts = reviews.group_by { |row| row.fetch('disposition') }
                    .transform_values(&:length)
    status_counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    unresolved = index.select { |row| row['status'] == 'uncertain' }
                      .map { |row| M.key(row) }.uniq.length
    variant_candidates = M.table(File.join(
      __dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'
    )).map(&:to_h)
    variant_counts = variant_candidates.group_by { |row| row['status'] }
                                       .transform_values(&:length)
    next_first = next_snapshot.first&.fetch('english_candidate', 'none')
    retained = retained_backup_lines
    inventory_hash = Digest::SHA256.file(M::INVENTORY).hexdigest
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed 2 `The Gardens of Ysa` short-label memberships in 2 distinct source keys: #{counts.inspect}.
      Candidate group: {"The Gardens of Ysa"=>2}. Last reviewed candidate: The Gardens of Ysa / base:3049:11.
      Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{next_snapshot.length} bounded groups; first `#{next_first}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')} (unchanged in this no-edit batch).
      Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
      Reviewed unresolved indexed holds: #{status_counts.fetch('uncertain', 0)}, in #{unresolved} distinct CSV row keys.
      Candidate classifications do not change occurrence-index dispositions or cumulative counts. Existing place:ysa decisions remain unchanged; D-21505's bounded 76-key review is not repeated or recounted.
      These focused index states are not global translation totals.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: #{variant_candidates.length} terms; registered-reviewed=#{variant_counts.fetch('registered-reviewed', 0)}, heuristic-not-reviewed=#{variant_counts.fetch('heuristic-not-reviewed', 0)}. This list is not exhaustive and establishes no overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
      Active CSV SHA-256:
      - affix: `#{before_hashes.fetch('affix')}`.
      - base: `#{before_hashes.fetch('base')}`.
      - default: `#{before_hashes.fetch('default')}`.
      No CSV edit or new backup; retain last actual CSV-edit backups:
      #{retained}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{inventory_hash}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_hash}`.
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{glossary_hash}`.
      Report: `work/zh_cn/audit/named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
    TEXT

    M.write_table(OUTPUT, HEADERS, reviews)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, next_snapshot)
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "checkpoint missing in #{path}" unless text.match?(marker)
      File.write(path, text.sub(marker, block))
    end

    details = reviews.map do |row|
      "- `#{M.key(row).join(':')}`: #{row['disposition']}. #{row['evidence']}"
    end.join("\n")
    File.write(report, <<~TEXT)
      # D-#{D}: The Gardens of Ysa Short-Label Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Findings

      #{details}

      D-21505 already screened all 76 exact Gardens of Ysa row keys under
      `place:ysa`, explicitly retaining the historical decisions for the two
      ambiguous standalone labels. Both current Korean cells contain the
      complete bilingual place name. The source article `The` is not a
      separate entity component, so neither label needs an edit or a duplicate
      Gardens entity.

      ## Validation

      #{validation.strip}
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}
    TEXT
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      #{summary}

      No CSV, occurrence-index, or glossary bytes changed; no new backup was
      required. Both dispositions preserve existing `place:ysa` histories.

      Validation: #{validation.strip}
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}
    TEXT
    note = <<~NOTE

      ## D-#{D}: The Gardens of Ysa Short-Label Review

      Reviewed both bounded candidate memberships. Their complete Korean
      place names already pair `이사의 정원` with `Gardens of Ysa`; omission
      of the English article `The` is correct. D-21505's 76-key review
      explicitly retained the historical decisions at these exact labels.
      No edit, duplicate entity, index change, or recount. See
      `named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
    NOTE
    [File.join(__dir__, 'README.md'),
     File.join(__dir__, 'decision-register-20261009.md')].each do |path|
      File.open(path, 'a') { |file| file.write(note) }
    end
    puts "D-#{D}: 2 Gardens short-label memberships reviewed; no edits; #{next_snapshot.length} bounded groups remain."
  end
end

ReviewGardensShortLabelD21815.run if $PROGRAM_NAME == __FILE__
