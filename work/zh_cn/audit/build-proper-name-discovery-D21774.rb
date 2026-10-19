#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-short-label-discovery-20261018'

module ProperNameDiscoveryD21774
  extend self

  M = ReviewedNameBatches
  D = 21_774
  DEFINITION_PATH = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  OUTPUT_PATH = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  DISPOSITION_PATH = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT_PATH = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  REVIEW_HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese entity_dispositions_json
  ].freeze
  DISPOSITION_HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante english
    japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  ENTITY = 'title:oathblade'
  EXPECTED_IDS = %w[
    1726 1850 2976 4086 4103 6422 7371 7875 8920 9041 11421 11683
    12991 13031 14134 16575 17847 19219 19560 20512 21022 22634 22744
    28176 29923 30913 31403 32279 34329 34501 40352 40993 43094 44646
    45043 48866 49901 51063 53904 58742 59022 60924 62542 63147 63182
    64258 65066 65127
  ].freeze
  EDITS = {
    '1726' => ['맹세검(Oathblade)', '맹세의 칼날(Oathblade)'],
    '1850' => ['맹세검 그윈 안웨이(Oathblade Gwyn Anwy)',
               '맹세의 칼날 그윈 안웨이(Oathblade Gwyn Anwy)'],
    '4103' => ['맹세의 칼날(Oathblade) 커비(Kirby)',
               '맹세의 칼날 커비(Oathblade Kirby)'],
    '8920' => ['맹세의 칼날 오두라',
               '맹세의 칼날 오르두라(Oathblade Ordura)'],
    '9041' => ['전직 서약검병 케우리그 샤스터(Keurig Shaster)',
               '전직 맹세의 칼날 케우리그 샤스터(Oathblade Keurig Shaster)'],
    '12991' => ['맹세의 칼날 켄트(Kent)',
                '맹세의 칼날 켄트(Oathblade Kent)'],
    '16575' => ['모든 맹세의 칼날에게',
                '모든 맹세의 칼날(Oathblade)에게'],
    '19219' => ['맹세의 칼날', '맹세의 칼날(Oathblade)'],
    '20512' => ['맹세의 칼날(Oathblade) 키르비(Kirby)',
                '맹세의 칼날 커비(Oathblade Kirby)'],
    '21022' => ['서약검 그윈 안웨이(Oathblade Gwyn Anwy)',
                '맹세의 칼날 그윈 안웨이(Oathblade Gwyn Anwy)'],
    '22634' => ['맹세의 칼날', '맹세의 칼날(Oathblade)'],
    '22744' => ['맹세의 칼날 고윈(Gorwin)',
                '맹세의 칼날 고윈(Oathblade Gorwin)'],
    '29923' => ['맹세의 칼날보다',
                '맹세의 칼날(Oathblade)보다'],
    '30913' => ['맹세의 칼날 커비',
                '맹세의 칼날 커비(Oathblade Kirby)'],
    '31403' => ['맹세의 칼날 켄트(Kent)',
                '맹세의 칼날 켄트(Oathblade Kent)'],
    '32279' => ['서약검 에드워다스',
                '맹세의 칼날 에드워다스(Oathblade Edwardas)'],
    '34329' => ['맹세의 칼날', '맹세의 칼날(Oathblade)'],
    '40352' => ['맹세의 칼날', '맹세의 칼날(Oathblade)'],
    '40993' => ['맹세의 칼날.', '맹세의 칼날(Oathblade).'],
    '43094' => ['맹세의 칼날', '맹세의 칼날(Oathblade)'],
    '44646' => ['베테랑은 맹세의 칼날이야',
                '베테랑은 맹세의 칼날(Oathblade)이야'],
    '45043' => ['맹세의 칼날이여',
                '맹세의 칼날(Oathblade)이여'],
    '48866' => ['맹세의 칼날로서',
                '맹세의 칼날(Oathblade)로서'],
    '49901' => ['맹세의 칼날이여',
                '맹세의 칼날(Oathblade)이여'],
    '51063' => ['맹세의 칼(Oathblade)',
                '맹세의 칼날(Oathblade)'],
    '58742' => ['맹세의 칼날', '맹세의 칼날(Oathblade)'],
    '59022' => ['맹세의 검 그윈 안웨이(Oathblade Gwyn Anwy)',
                '맹세의 칼날 그윈 안웨이(Oathblade Gwyn Anwy)'],
    '62542' => ['맹세의 칼날', '맹세의 칼날(Oathblade)'],
    '63147' => ['맹세의 칼날이여',
                '맹세의 칼날(Oathblade)이여'],
    '63182' => ['맹세의 칼날이여',
                '맹세의 칼날(Oathblade)이여'],
    '65066' => ['맹세의 칼날이 될',
                '맹세의 칼날(Oathblade)이 될']
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English default:2976 explicitly bestows Oathblade as a rank, and default:44646 defines it as the Warsworn veteran rank after Hireling and Pledgeshield. Other English dialogue distinguishes rank-holders from ordinary fighters and uses the title in direct address. Japanese 一等傭兵 and Chinese 誓言之刃 corroborate the rank. Reuse the established Korean 맹세의 칼날(Oathblade); for an explicit rank-plus-person source label, keep the complete English compound in one parenthetical annotation. Do not infer new identities from title-only references. Preserve prior person, faction, and sentence-level dispositions; this batch registers only title:oathblade and does not recount historical translation findings.
  TEXT

  def definitions
    [{
      'entity_key' => ENTITY,
      'english_canonical' => 'Oathblade',
      'category' => 'title',
      'korean_canonical' => '맹세의 칼날(Oathblade)',
      'english_aliases' => '',
      'korean_variants' => '맹세검|맹세의 검|맹세의 칼|서약검|서약검병',
      'evidence_ids' => 'D-21042|D-21774',
      'status' => 'confirmed',
      'notes' => EVIDENCE
    }]
  end

  def replace_once(text, old, replacement, key)
    count = text.scan(Regexp.new(Regexp.escape(old))).length
    raise "expected one reviewed Korean span at #{key.join(':')}: #{old.inspect} (#{count})" unless count == 1
    text.sub(old, replacement)
  end

  def build_reviews(inventory)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated.sort_by! { |row| row.fetch('ID_Linha').to_i }
    ids = generated.map { |row| row.fetch('ID_Linha') }
    raise "unexpected Oathblade source coverage: #{ids.inspect}" unless ids == EXPECTED_IDS

    generated.map do |hit|
      key = M.key(hit)
      old = hit.fetch('korean_current')
      replacement = EDITS[key.fetch(1)]
      new_text = replacement ? replace_once(old, *replacement, key) : old
      status = new_text == old ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => "#{EVIDENCE} Exact source key: #{key.join(':')}.",
        'english' => JSON.parse(inventory.fetch(key).fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(inventory.fetch(key).fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => inventory.fetch(key).fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
  end

  def candidate_keys(candidate)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq.sort_by do |key|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end
  end

  def build_short_dispositions(inventory, index, reviews)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    candidates = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
      .to_h { |row| [row.fetch('english_candidate'), row] }
    reviewed = {
      'Oathblade' => {
        keys: nil,
        evidence: EVIDENCE
      },
      'Pick' => {
        keys: nil,
        evidence: 'The six affix rows use Pick as an ordinary pickup action (Japanese 拾う and Chinese 挑拣; Korean 줍기:), not a named entity. Default:11042 uses the capitalized common noun Pick for an unspecified lock-picking tool confiscated from Eloren; Japanese ピック and Chinese 开锁器 support the tool sense. No source identifies it as the separately registered unique item Master’s Pick. Preserve all wording and do not create a unique-item identity or alias.'
      }
    }
    prior_by_key = index.group_by { |row| M.key(row) }
    reviews_by_key = reviews.to_h { |row| [M.key(row), row] }
    reviewed.flat_map do |term, spec|
      candidate = candidates.fetch(term) { raise "missing bounded candidate #{term}" }
      keys = candidate_keys(candidate)
      spec[:keys] = keys
      keys.map do |key|
        source = inventory.fetch(key)
        related_review = reviews_by_key[key]
        if term == 'Oathblade'
          raise "Oathblade candidate not covered #{key.inspect}" unless related_review
          disposition = related_review.fetch('status')
          evidence = related_review.fetch('evidence')
        else
          english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
          raise "Pick source phrase absent #{key.inspect}" unless
            english.match?(/(?<![A-Za-z])Pick(?![A-Za-z])/)
          disposition = 'not-an-issue'
          evidence = spec.fetch(:evidence)
        end
        {
          'english_candidate' => term,
          'disposition' => disposition,
          'resource' => key[0],
          'ID_Linha' => key[1],
          'Tipo_Variante' => key[2],
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'),
          'korean' => source.fetch('work_text'),
          'evidence' => evidence,
          'prior_index_dispositions_json' => JSON.generate(
            prior_by_key.fetch(key, []).map do |entry|
              [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')]
            end
          )
        }
      end
    end.tap do |rows|
      raise 'short-label candidate keys overlap' unless
        rows.map { |row| [row.fetch('english_candidate'), row.fetch('resource'), row.fetch('ID_Linha'), row.fetch('Tipo_Variante')] }.uniq.length == rows.length
      counts = rows.group_by { |row| row.fetch('english_candidate') }.transform_values(&:length)
      raise "unexpected Oathblade/Pick candidate coverage: #{counts.inspect}" unless
        counts == { 'Oathblade' => 20, 'Pick' => 7 }
    end
  end

  def build
    raise 'D-21774 output already exists; preserve and inspect it' if
      [DEFINITION_PATH, OUTPUT_PATH, DISPOSITION_PATH, SNAPSHOT_PATH].any? { |path| File.exist?(path) }
    inventory = M.refresh_inventory
    before = M.hashes
    index = M.table(M::INDEX).map(&:to_h)
    reviews = build_reviews(inventory)
    dispositions = build_short_dispositions(inventory, index, reviews)
    raise 'read-only preparation changed an active CSV' unless M.hashes == before
    M.write_table(DEFINITION_PATH, DEFINITION_HEADERS, definitions)
    M.write_table(OUTPUT_PATH, REVIEW_HEADERS, reviews)
    M.write_table(DISPOSITION_PATH, DISPOSITION_HEADERS, dispositions)
    counts = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
    puts "Prepared #{reviews.length} Oathblade source keys: #{counts.inspect}; #{reviews.count { |row| row['old'] != row['new'] }} Texto edits."
    puts OUTPUT_PATH
  end

  def apply
    build
    ReviewedProperNameDiscovery.run([DEFINITION_PATH, OUTPUT_PATH, D.to_s])

    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT_PATH, ShortLabelDiscovery20261018::HEADERS, snapshot)
    append_candidate_summary(snapshot.length)
    puts "D-#{D}: Oathblade registered; #{snapshot.length} bounded short-label groups remain."
  end

  def append_candidate_summary(remaining)
    note = <<~TEXT

      ## D-#{D}: Oathblade Rank And Short-Label Candidates

      Registered `title:oathblade` as `맹세의 칼날(Oathblade)` after reviewing
      all 48 exact English source keys across `affix`, `base`, and `default`.
      Explicit rank-plus-person labels retain the complete source compound
      once, without nested title/person parentheses. Corrected source-local
      rank variants and missing bilingual title spans only; prior person,
      faction, and sentence-level findings are not reopened or recounted.
      The short-label candidate review separately covered 20 Oathblade
      memberships and seven Pick memberships. Pick remains a generic action
      or tool label, distinct from the registered unique item Master's Pick.
      Exact source evidence is in
      `proper-name-short-label-dispositions-D#{D}.tsv`; indexed title edits
      are in `proper-name-edits-D#{D}.tsv`.
      Next: D-#{D + 1}; continue source discovery and review the
      #{remaining}-group bounded short-label snapshot
      `proper-name-short-label-discovery-D#{D}.tsv`. The snapshot is not
      exhaustive and is not an overall completion estimate. Full
      proper-name discovery/residual validation remains incomplete.
    TEXT
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + note)
    end
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + note)
    end
    M::DOCS.each do |path|
      text = File.read(path)
      marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
      raise "active checkpoint missing in #{path}" unless text.match?(marker)
      text.sub!(marker) do |block|
        block.sub(
          /Next batch: D-#{D + 1};[^\n]*/,
          "Next batch: D-#{D + 1}; continue from `proper-name-short-label-discovery-D#{D}.tsv` (#{remaining} bounded groups; not exhaustive or a completion estimate)."
        )
      end
      File.write(path, text)
    end
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'residual audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0')
    checks = residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip)
    verification = "\nD-#{D} index/residual validation: PASS.\n#{validation.strip}\nResidual bilingual/index audit: PASS; #{checks.join('; ')}\n"
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + verification)
    end
  end
end

ProperNameDiscoveryD21774.apply if $PROGRAM_NAME == __FILE__
