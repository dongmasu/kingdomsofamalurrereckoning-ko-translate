#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21761
  extend self

  M = ReviewedNameBatches
  D = 21_761
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21760.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze

  GROUPS = {
    'Judgment' => {
      count: 2,
      status: 'uncertain',
      evidence: 'The standalone base label “Judgment” could be a named item, but English capitalization alone does not establish that identity. Its aligned Japanese 審判 and Chinese 审判 translate the ordinary judgment concept; the Korean base 심판 does too. The related English default:40125 description has a pre-existing D-12712 uncertainty about the item/crystal/life-force relation and already pairs 심판(Judgment). Preserve both Korean cells and that prior hold; do not create an item entity without resolving the old source ambiguity.'
    },
    'King Wencen' => {
      count: 19,
      status: 'not-an-issue',
      evidence: 'This is a title-inclusive label for the already registered person:wencen, not a second person. English King Wencen, Japanese ウェンセン王, and Chinese 文森王 align with the existing canonical name Wencen. The candidate rows already use established 웬센(Wencen) 왕 or 웬센 왕(King Wencen) forms; existing person:wencen dispositions are retained exactly and not reopened.'
    },
    'Knave of Pride' => {
      count: 5,
      status: 'uncertain',
      evidence: 'The exact role/name remains unresolved in prior decisions D-420, D-1912, D-2093, D-2591, D-7217, and related records: English and Chinese are title-like while Japanese identifies a House of Pride retainer, and Korean variants differ. Preserve those row-level dispositions, including the prior House-of-Pride exclusions; do not infer a person, card, rank, or faction alias.'
    },
    'Kollossae Litany' => {
      count: 3,
      status: 'uncertain',
      evidence: 'The Kollossae ethnonym is already normalized under people:kollossae (D-20493), but the named work/item identity and exact item type remain unresolved under D-2365 at default:8451. Japanese カロシーの連祷書 and Chinese 克勒塞祷文 support a litany/prayer text but do not resolve that prior item-type hold. Preserve all three Korean cells and existing people:kollossae dispositions; do not register a duplicate entity or reopen prior rows.'
    }
  }.freeze

  def row_key(row)
    M.key(row)
  end

  def candidate_keys(candidate)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field)).map { |key| key.map(&:to_s) }
    end.uniq.sort
  end

  def build_reviews(inventory, index, candidates)
    prior_by_key = index.group_by { |row| row_key(row) }
    reviews = GROUPS.flat_map do |term, decision|
      candidate = candidates.fetch(term) { raise "candidate missing: #{term}" }
      keys = candidate_keys(candidate)
      raise "#{term} key count differs: #{keys.length}" unless keys.length == decision.fetch(:count)
      keys.map do |key|
        source = inventory.fetch(key)
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        pattern = /(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i
        raise "English candidate missing at #{key.inspect}" unless english.match?(pattern)
        {
          'english_candidate' => term,
          'disposition' => decision.fetch(:status),
          'resource' => key[0],
          'ID_Linha' => key[1],
          'Tipo_Variante' => key[2],
          'english' => english,
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
          'chinese' => source.fetch('zh_text'),
          'korean' => source.fetch('work_text'),
          'evidence' => decision.fetch(:evidence),
          'prior_index_dispositions_json' => JSON.generate(
            prior_by_key.fetch(key, []).map do |row|
              [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
            end
          )
        }
      end
    end
    keys = reviews.map { |row| row_key(row) }
    raise "D-#{D} exceeds 50 distinct source keys: #{keys.uniq.length}" if keys.uniq.length > 50
    raise 'duplicate candidate/key disposition' unless
      reviews.map { |row| [row.fetch('english_candidate'), *row_key(row)] }.uniq.length == reviews.length
    raise 'candidate source-key overlap' unless keys.uniq.length == keys.length
    reviews
  end

  def summary(reviews, candidates)
    index = M.table(M::INDEX)
    states = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    csv_hashes = M.hashes
    active_block = File.read(M::DOCS.first)[
      /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    ]
    retained_backups = active_block[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\n<!--)/m, 1
    ]
    raise 'missing retained CSV backup checkpoint' unless retained_backups
    candidate_counts = reviews.group_by { |row| row.fetch('disposition') }
                              .transform_values(&:length)
    group_counts = reviews.group_by { |row| row.fetch('english_candidate') }
                          .transform_values(&:length)
    next_term = candidates.first&.fetch('english_candidate', 'none')
    <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed #{reviews.length} distinct short-label candidate keys: #{candidate_counts.inspect}.
      Candidate groups: #{group_counts.inspect}. Last reviewed candidate: Kollossae Litany / default:8451.
      Next batch: D-#{D + 1}; continue from `proper-name-short-label-discovery-D#{D}.tsv` (#{candidates.length} bounded groups; begins `#{next_term}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{states.sort.map { |status, count| "#{status}=#{count}" }.join(', ')} (unchanged in this candidate-only batch).
      Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
      Reviewed unresolved indexed holds: #{states.fetch('uncertain', 0)}, in #{index.select { |row| row['status'] == 'uncertain' }.map { |row| M.key(row) }.uniq.length} distinct CSV row keys.
      Candidate-only uncertain classifications above do not alter the occurrence-index hold totals.
      These focused index states are not global translation totals.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive and establishes no overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{csv_hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")}
      CSV edits in this candidate-only batch: none; no CSV backup was required.
      Last actual CSV-edit backups (retained across no-edit batches):
      #{retained_backups}
      Aligned inventory: #{M.table(M::INVENTORY).length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{M.table(File.join(__dir__, 'proper-name-glossary.tsv')).length} entries; SHA-256 `#{Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest}`.
      Candidate disposition manifest: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
    TEXT
  end

  def replace_checkpoint(text, block)
    text.sub(
      /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m,
      "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{block}<!-- current-proper-name-batch:end -->"
    )
  end

  def append_batch_note(reviews)
    counts = reviews.group_by { |row| row.fetch('disposition') }.transform_values(&:length)
    note = <<~TEXT

      ## D-#{D}: Short-Label Candidate Review

      Reviewed 29 candidate keys across Judgment (2), King Wencen (19),
      Knave of Pride (5), and Kollossae Litany (3). King Wencen is already
      owned by person:wencen and its terminal row dispositions were preserved.
      Judgment, Knave of Pride, and Kollossae Litany retain their prior
      uncertainties; no new entity or alias was inferred. No CSV, glossary,
      or occurrence-index changes were made. Candidate disposition counts:
      #{counts.inspect}. Exact aligned English/Japanese/Chinese/Korean and
      prior index evidence are in
      `proper-name-short-label-dispositions-D#{D}.tsv`.
      Full proper-name discovery/residual validation remains incomplete.
    TEXT
    report_note = note.sub(/\A\n## D-#{D}: Short-Label Candidate Review\n/,
                           "# D-#{D}: Short-Label Candidate Review\n")
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |filename|
      File.write(File.join(__dir__, filename), report_note + "\n")
    end
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + note)
    end
  end

  def run
    raise "D-#{D} outputs already exist" if [OUTPUT, SNAPSHOT].any? { |path| File.exist?(path) }
    before = M.hashes
    inventory = M.table(M::INVENTORY).map(&:to_h).to_h { |row| [row_key(row), row] }
    M::RESOURCES.each do |resource|
      CSV.foreach(M.csv_path(resource), headers: true, col_sep: ';', encoding: 'bom|utf-8') do |row|
        key = [resource, row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
        inventory.fetch(key)['work_text'] = row.fetch('Texto')
      end
    end
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    reviews = build_reviews(inventory, M.table(M::INDEX).map(&:to_h), candidates)
    raise 'active CSV changed during candidate review' unless M.hashes == before
    M.write_table(OUTPUT, HEADERS, reviews)

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    next_snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, next_snapshot)
    checkpoint = summary(reviews, next_snapshot)
    M::DOCS.each do |path|
      text = replace_checkpoint(File.read(path), checkpoint)
      raise "missing current checkpoint marker in #{path}" unless text != File.read(path)
      File.write(path, text)
    end
    append_batch_note(reviews)

    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [report, addendum].each do |path|
      File.write(path, File.read(path) + "\n## Evidence\n\n" +
        "English is the identity/meaning anchor. Exact aligned English, Japanese, Chinese, Korean, and prior indexed dispositions are preserved in `proper-name-short-label-dispositions-D#{D}.tsv`. Existing terminal row decisions were not reopened or recounted. No PAK or PAK-derived resource was consulted.\n")
    end
    puts "D-#{D}: reviewed=#{reviews.length}; dispositions=#{reviews.group_by { |row| row.fetch('disposition') }.transform_values(&:length).inspect}; " \
         "remaining bounded groups=#{next_snapshot.length}; next=#{D + 1}."
  end
end

if $PROGRAM_NAME == __FILE__
  ReviewShortLabelCandidatesD21761.run
end
