#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21790
  extend self

  M = ReviewedNameBatches
  D = 21_790
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21787.tsv')
  OUTPUT = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  GROUPS = {
    'Reckoning' => {
      'default:3621:' => [
        'uncertain',
        'Retain historical D-760. English says the in-game manual covers the major systems "in Reckoning"; Chinese renders the phrase as 《惩罚》, while Japanese omits the name. This does not decide whether the source means the original game title or the game/system generally. Existing Korean 레코닝(Reckoning) is preserved.'
      ],
      'default:39728:' => [
        'not-an-issue',
        'This is a direct gameplay-mode reference: English says "enter Reckoning", Chinese specifies 惩罚模式, and the official Korean manual defines Reckoning mode as 레코닝 모드 (PDF pp. 1, 3, 5). Existing 레코닝(Reckoning) 상태 preserves the mode meaning and English identity; no edit is needed.'
      ],
      'default:63328:' => [
        'uncertain',
        'The standalone English label has no local UI/context string to distinguish the original game title from the named Reckoning gameplay mode. Japanese 審判 and Chinese 惩罚 are localized renderings, not independent proof of which entity the label denotes. Preserve 레코닝 and defer bilingual/title styling; do not supersede D-760 by inference.'
      ]
    },
    'Ring' => {
      'base:3711:11' => [
        'not-an-issue',
        'English Ring is a generic equipment label; Japanese リング, Chinese 戒指, and the Korean 반지 agree. It is not an individually named ring.'
      ],
      'base:4365:11' => [
        'not-an-issue',
        'English Ring is a generic equipment label; Japanese リング, Chinese 戒指, and the Korean 반지 agree. It is not an individually named ring.'
      ],
      'default:53416:' => [
        'not-an-issue',
        'English Ring is the generic equipment category; Japanese 指輪, Chinese 戒指, and the Korean 반지 agree. No specific named item is identified.'
      ],
      'default:1029:' => [
        'not-an-issue',
        'This is the Ring collective associated with Vilaghru’s Twelve, not jewelry. Preserve the historical D-20388 identification and its exact Korean 고리(Ring); the candidate row already has a bilingual label. Do not reopen or recount the Ring of Keozai decision.'
      ]
    }
  }.freeze

  def candidate_keys(row)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(row.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
  end

  def build_reviews(inventory, index, candidates)
    prior_by_key = index.group_by { |row| M.key(row) }
    GROUPS.flat_map do |term, decisions|
      candidate = candidates.fetch(term) { raise "missing candidate #{term}" }
      actual = candidate_keys(candidate).map { |key| key.join(':') }.sort
      raise "#{term} candidate coverage differs" unless actual == decisions.keys.sort

      decisions.map do |key_text, (disposition, evidence)|
        key = key_text.split(':', -1)
        source = inventory.fetch(key) { raise "missing aligned row #{key.inspect}" }
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
        pattern = /(?<![A-Za-z0-9])#{Regexp.escape(term)}(?![A-Za-z0-9])/i
        raise "#{term} is absent from #{key.inspect}" unless english.match?(pattern)
        {
          'english_candidate' => term,
          'disposition' => disposition,
          'resource' => key[0],
          'ID_Linha' => key[1],
          'Tipo_Variante' => key[2],
          'english' => english,
          'japanese' => japanese,
          'chinese' => source.fetch('zh_text'),
          'korean' => source.fetch('work_text'),
          'evidence' => evidence,
          'prior_index_dispositions_json' => JSON.generate(
            prior_by_key.fetch(key, []).map do |row|
              [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
            end
          )
        }
      end
    end
  end

  def checkpoint(summary)
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    M::DOCS.each do |path|
      text = File.read(path)
      current = text.match(marker)
      raise "active checkpoint missing in #{path}" unless current
      block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->"
      text = text.sub(marker, block)
      text = text.sub("<!-- current-proper-name-batch:start -->",
                      note + "\n<!-- current-proper-name-batch:start -->")
      File.write(path, text)
    end
  end

  def run
    [OUTPUT, SNAPSHOT].each do |path|
      raise "refusing to overwrite existing artifact #{path}" if File.exist?(path)
    end
    before = M.hashes
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    reviews = build_reviews(inventory, index, candidates)
    raise 'expected seven candidate memberships / distinct source keys' unless
      reviews.length == 7 &&
      reviews.map { |row| M.key(row) }.uniq.length == 7
    raise 'candidate-only review changed active CSV' unless M.hashes == before
    M.write_table(OUTPUT, HEADERS, reviews)

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    next_snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, glossary.map(&:to_h), index
    )
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, next_snapshot)

    status_counts = index.group_by { |row| row.fetch('status') }
                         .transform_values(&:length)
    unresolved = index.select { |row| row['status'] == 'uncertain' }
                      .map { |row| M.key(row) }.uniq.length
    candidate_counts = M.table(File.join(
      __dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'
    )).group_by { |row| row['status'] }.transform_values(&:length)
    previous_block = File.read(M::DOCS.first)[
      /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    ]
    retained = previous_block.to_s[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\n[A-Z]|\n<!--)/m, 1
    ]
    raise 'retained backup checkpoint missing' unless retained
    counts = reviews.group_by { |row| row.fetch('disposition') }
                    .transform_values(&:length)
    last = reviews.last
    hashes = M.hashes
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed #{reviews.length} short-label candidate memberships in #{reviews.map { |row| M.key(row) }.uniq.length} distinct source keys: #{counts.inspect}.
      Candidate groups: {"Reckoning"=>3, "Ring"=>4}. Last reviewed candidate: Ring / default:1029.
      Next batch: D-#{D + 1}; continue the refreshed short-label candidate snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{next_snapshot.length} bounded groups; first `#{next_snapshot.first&.fetch('english_candidate', 'none')}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')} (unchanged in this candidate-only batch).
      Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
      Reviewed unresolved indexed holds: #{status_counts.fetch('uncertain', 0)}, in #{unresolved} distinct CSV row keys.
      Candidate classifications do not alter occurrence-index statuses or cumulative indexed counts. D-760 at default:3621 remains uncertain; D-20388 at default:1029 is retained without recount.
      These focused index states are not global translation totals.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: 305 terms; registered-reviewed=#{candidate_counts.fetch('registered-reviewed', 0)}, heuristic-not-reviewed=#{candidate_counts.fetch('heuristic-not-reviewed', 0)}. This list is not exhaustive and establishes no overall completion percentage.
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
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest}`.
      Report: `work/zh_cn/audit/named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Candidate disposition manifest: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
    TEXT
    self.note = <<~NOTE
      ## D-#{D}: Reckoning And Ring Short-Label Review

      Reviewed seven short-label memberships in seven distinct source keys:
      `Reckoning` (3) and `Ring` (4). Two `Reckoning` labels remain uncertain;
      the explicit mode use is already correctly paired. Generic equipment
      rings remain `반지`; `default:1029` retains the separate collective
      `고리(Ring)` disposition from D-20388. No indexed status, cumulative
      count, or CSV cell changed. Exact aligned locale text and prior index
      decisions are in `proper-name-short-label-dispositions-D#{D}.tsv`.
      D-760 at `default:3621` is not superseded. The refreshed candidate
      snapshot is bounded, not exhaustive; full proper-name discovery and
      residual validation remain incomplete.
    NOTE

    checkpoint(summary)
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    details = reviews.map do |row|
      "- `#{row['english_candidate']}` / `#{M.key(row).join(':')}`: #{row['disposition']}. #{row['evidence']}"
    end.join("\n")
    body = <<~TEXT
      # D-#{D}: Reckoning And Ring Short-Label Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Findings

      #{details}

      The English source determines meaning and identity. Japanese provides
      tone/usage evidence; Chinese is corroborative only. The official Korean
      manual identifies Reckoning mode as `레코닝 모드` (PDF pp. 1, 3, 5).
      Existing D-760 remains unresolved because it concerns whether
      `default:3621` uses the original product title or the game/system
      generally; the standalone `default:63328` has no resolving context.
      `default:39728` independently identifies the gameplay mode and already
      carries `레코닝(Reckoning)`.

      The three equipment labels use generic `반지`, while `default:1029`
      uses the collective `Ring` in the Twelve/Vilaghru passage and retains
      the earlier D-20388 `고리(Ring)` finding. These senses are not merged.
      Existing terminal decisions and historical counts were not reopened.
      No CSV, occurrence-index, or glossary bytes changed.

      #{self.note.strip}

      ## Validation

      No-edit validation and residual bilingual/index audit passed. The
      refreshed bounded short-label snapshot was rebuilt from the current
      aligned inventory after excluding prior candidate dispositions.
    TEXT
    File.write(report, body)
    File.write(addendum, "# D-#{D} Edit Addendum\n\n#{summary}\n\nNo CSV edit or new backup was required. D-760 remains a linked uncertainty; D-20388 and all prior terminal/index decisions were retained without recount.\n\n#{self.note}")

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name validation failed' unless validation.include?('PASS')
    raise 'residual bilingual/index audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0')
    [report, addendum].each do |path|
      File.open(path, 'a') do |file|
        file.write("\nValidation: #{validation.strip}\n")
        file.write("Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}\n")
        file.write("No-edit CSV check: all three active SHA-256 values match the pre-review values.\n")
      end
    end
    puts "D-#{D}: 7 short-label memberships / 7 unique keys reviewed; no CSV/index/glossary changes; #{next_snapshot.length} bounded candidate groups remain."
  end

  attr_accessor :note
end

ReviewShortLabelCandidatesD21790.run if $PROGRAM_NAME == __FILE__
