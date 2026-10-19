#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-short-label-discovery-20261018'

module ProperNameDiscoveryD21775
  extend self

  M = ReviewedNameBatches
  D = 21_775
  DEFINITION_PATH = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  OUTPUT_PATH = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  DISPOSITION_PATH = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT_PATH = File.join(__dir__, "proper-name-short-label-discovery-D#{D + 1}.tsv")
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
  CANONICALS = {
    'place:plains-of-erathell' => '에라셀 평원(Plains of Erathell)',
    'resource:petrichor' => '페트리코르(Petrichor)',
    'place:pillar-of-valor' => '용맹의 기둥(Pillar of Valor)'
  }.freeze
  EXPECTED_IDS = {
    'place:plains-of-erathell' => %w[
      2535 2597 3699 3201 4017 4364 5088 5562 5798 7119 7247 9212 9244
      9397 11070 13183 13945 14335 15619 16300 17355 18471 18499 18775
      21451 23884 26441 26625 29115 29682 32256 33628 34491 37123 38932
      39139 39910 43733 43778 44865 48338 48599 49188 50668 51339 51522
      52423 52619 53682 53706 54216 54451 55948 56877 57495 57531 57674
      58557 59817 61105 61318 63681
    ],
    'resource:petrichor' => %w[4530 1793 6435 11347 15840 28946 48177],
    'place:pillar-of-valor' => %w[3415 1384 13872]
  }.transform_values { |ids| ids.sort_by(&:to_i).freeze }.freeze
  SPAN_EDITS = {
    ['default', '1793', ''] => ['페트리코(Petrichor)', '페트리코르(Petrichor)'],
    ['default', '6435', ''] => ['페트리코어(Petrichor)', '페트리코르(Petrichor)'],
    ['default', '48177', ''] => ['페트리코르', '페트리코르(Petrichor)'],
    ['base', '3415', '11'] => ['용맹의 기둥', '용맹의 기둥(Pillar of Valor)'],
    ['default', '13872', ''] => ['용맹의 기둥', '용맹의 기둥(Pillar of Valor)']
  }.freeze
  NOTES = {
    'place:plains-of-erathell' =>
      'English identifies the Plains of Erathell as the same named region across labels, history, travel directions, and dialogue. Japanese エラセル平原 and Chinese 伊拉塞尔平原 corroborate. Use 에라셀 평원(Plains of Erathell), including the source capitalization variant Plains Of Erathell. Preserve the exact article-bearing standalone label The Plains of Erathell. The official Korean manual provides broad setting context but no direct spelling for this region. Existing entity decisions and all text outside exact region-name spans remain unchanged.',
    'resource:petrichor' =>
      'English consistently identifies Petrichor as the named alchemical substance required by the Century Plant quest. Japanese ペトリチャー/香料 and Chinese 空濛雨汽 corroborate the reagent identity but do not override English meaning. Use the established paired form 페트리코르(Petrichor), correcting only source-local spelling variants and the missing bilingual pair. No unique inventory item, additional mechanics, or relationship to another item is inferred.',
    'place:pillar-of-valor' =>
      'English default:1384 explicitly identifies the Pillar of Valor as a landmark in the Valor rite and distinguishes it from the Stone of Valor. Japanese バローの柱/武勇の柱 and Chinese 英勇之柱 corroborate. Use 용맹의 기둥(Pillar of Valor), distinct from the already registered Stone of Valor, Pillar of Strength, and ordinary sigil stones. No portable-item identity is inferred.'
  }.freeze

  def definitions
    [
      {
        'entity_key' => 'place:plains-of-erathell',
        'english_canonical' => 'Plains of Erathell',
        'category' => 'place',
        'korean_canonical' => CANONICALS.fetch('place:plains-of-erathell'),
        'english_aliases' => 'Plains Of Erathell',
        'korean_variants' => '에라셀(Erathell) 평원|에라셀(Erathell) 서부 평원',
        'evidence_ids' => 'D-21775',
        'status' => 'confirmed',
        'notes' => NOTES.fetch('place:plains-of-erathell')
      },
      {
        'entity_key' => 'resource:petrichor',
        'english_canonical' => 'Petrichor',
        'category' => 'resource',
        'korean_canonical' => CANONICALS.fetch('resource:petrichor'),
        'english_aliases' => '',
        'korean_variants' => '페트리코|페트리코어',
        'evidence_ids' => 'D-21775',
        'status' => 'confirmed',
        'notes' => NOTES.fetch('resource:petrichor')
      },
      {
        'entity_key' => 'place:pillar-of-valor',
        'english_canonical' => 'Pillar of Valor',
        'category' => 'place',
        'korean_canonical' => CANONICALS.fetch('place:pillar-of-valor'),
        'english_aliases' => '',
        'korean_variants' => '용맹의 기둥',
        'evidence_ids' => 'D-21775',
        'status' => 'confirmed',
        'notes' => NOTES.fetch('place:pillar-of-valor')
      }
    ]
  end

  def canonicalize_plains(text)
    text
      .gsub('에라셀(Erathell) 서부 평원',
            '에라셀 평원(Plains of Erathell) 서부')
      .gsub('에라셀(Erathell) 평원',
            CANONICALS.fetch('place:plains-of-erathell'))
      .gsub('에라셀 평원 (The Plains of Erathell)',
            '에라셀 평원(The Plains of Erathell)')
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
    actual = generated.group_by { |row| row.fetch('entity_key') }
      .transform_values { |rows| rows.map { |row| row.fetch('ID_Linha') }.sort_by(&:to_i) }
    raise "unexpected exact source coverage: #{actual.inspect}" unless actual == EXPECTED_IDS

    generated.sort_by! do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row.fetch('Tipo_Variante').to_s, row.fetch('entity_key')]
    end
    generated.map do |hit|
      key = M.key(hit)
      entity = hit.fetch('entity_key')
      old = hit.fetch('korean_current')
      if entity == 'place:plains-of-erathell'
        new_text = canonicalize_plains(old)
      elsif span = SPAN_EDITS[key]
        new_text = replace_once(old, *span, key)
      else
        new_text = old
      end
      status = new_text == old ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => entity,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => "#{NOTES.fetch(entity)} Exact source key: #{key.join(':')}.",
        'english' => JSON.parse(inventory.fetch(key).fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(inventory.fetch(key).fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => inventory.fetch(key).fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end.tap do |rows|
      raise 'unexpected D-21775 exact key overlap' unless
        rows.map { |row| M.key(row) }.uniq.length == rows.length
      raise 'unexpected D-21775 edit count' unless
        rows.count { |row| row.fetch('old') != row.fetch('new') } == 48
      raise 'target Korean spans remain after canonicalization' if rows.any? do |row|
        row.fetch('entity_key') == 'place:plains-of-erathell' &&
          row.fetch('new').match?(/에라셀\(Erathell\)(?: 서부)? 평원/)
      end
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
    terms = {
      'Plains Of Erathell' => 'place:plains-of-erathell',
      'Plains of Erathell' => 'place:plains-of-erathell',
      'Petrichor' => 'resource:petrichor',
      'Pillar of Valor' => 'place:pillar-of-valor'
    }
    reviews_by_key = reviews.to_h { |row| [M.key(row), row] }
    prior_by_key = index.group_by { |row| M.key(row) }
    rows = terms.flat_map do |term, entity|
      candidate = candidates.fetch(term) { raise "missing candidate group #{term}" }
      candidate_keys(candidate).map do |key|
        source = inventory.fetch(key)
        review = reviews_by_key.fetch(key) do
          raise "candidate key is outside registered source coverage: #{term} / #{key.inspect}"
        end
        {
          'english_candidate' => term,
          'disposition' => review.fetch('status'),
          'resource' => key[0],
          'ID_Linha' => key[1],
          'Tipo_Variante' => key[2],
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'),
          'korean' => source.fetch('work_text'),
          'evidence' => review.fetch('evidence'),
          'prior_index_dispositions_json' => JSON.generate(
            prior_by_key.fetch(key, []).map do |entry|
              [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')]
            end
          )
        }
      end
    end
    counts = rows.group_by { |row| row.fetch('english_candidate') }.transform_values(&:length)
    raise "unexpected short-label coverage: #{counts.inspect}" unless
      counts == {
        'Plains Of Erathell' => 20,
        'Plains of Erathell' => 22,
        'Petrichor' => 7,
        'Pillar of Valor' => 3
      }
    rows
  end

  def build
    raise 'D-21775 outputs already exist; preserve and inspect them' if
      [DEFINITION_PATH, OUTPUT_PATH, DISPOSITION_PATH, SNAPSHOT_PATH].any? do |path|
        File.exist?(path)
      end
    before = M.hashes
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    reviews = build_reviews(inventory)
    dispositions = build_short_dispositions(inventory, index, reviews)
    raise 'read-only preparation changed an active CSV' unless M.hashes == before
    M.write_table(DEFINITION_PATH, DEFINITION_HEADERS, definitions)
    M.write_table(OUTPUT_PATH, REVIEW_HEADERS, reviews)
    M.write_table(DISPOSITION_PATH, DISPOSITION_HEADERS, dispositions)
    counts = reviews.group_by { |row| row.fetch('entity_key') }
      .transform_values { |rows| [rows.length, rows.count { |row| row['status'] == 'accepted' }] }
    puts "Prepared 72 reviewed source keys (count/edits by entity): #{counts.inspect}"
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
    append_notes(snapshot.length)
    puts "D-#{D}/D-#{D + 1}: three entities registered; #{snapshot.length} bounded groups remain."
  end

  def append_notes(remaining)
    note = <<~TEXT

      ## D-#{D}-D-#{D + 1}: Erathell Region, Petrichor, And Pillar Of Valor

      Registered `place:plains-of-erathell` across all 62 exact source keys,
      `resource:petrichor` across seven, and `place:pillar-of-valor` across
      three. English anchors identity and meaning; aligned Japanese and
      Chinese corroborate. Normalized 48 exact `Texto` cells: the region's
      `에라셀(Erathell) 평원`/western-region forms, the two Petrichor spelling
      variants and missing pair, and the two missing Pillar of Valor pairs.
      Existing already-canonical occurrences were retained. Pillar of Valor
      remains distinct from Stone of Valor; Petrichor is not merged with a
      unique inventory item. Prior row findings and historical totals were
      not reopened or recounted. Per-range manifests and pre-edit backups are
      recorded in the D-#{D} and D-#{D + 1} reports/addenda.
      Next batch: D-#{D + 2}; continue from the #{remaining}-group bounded
      short-label snapshot `proper-name-short-label-discovery-D#{D + 1}.tsv`.
      It is not exhaustive or an overall completion estimate; full
      proper-name discovery/residual validation remains incomplete.
    TEXT
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + note)
    end
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-review-D#{D + 1}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D + 1}-#{M::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      raise "missing generated report #{filename}" unless File.file?(path)
      File.write(path, File.read(path) + note)
    end
    M::DOCS.each do |path|
      text = File.read(path)
      marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
      raise "active checkpoint missing in #{path}" unless text.match?(marker)
      text.sub!(marker) do |block|
        block.sub(
          /Next batch: D-#{D + 2};[^\n]*/,
          "Next batch: D-#{D + 2}; continue from `proper-name-short-label-discovery-D#{D + 1}.tsv` (#{remaining} bounded groups; not exhaustive or a completion estimate)."
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
    verification = "\nD-#{D}/D-#{D + 1} index/residual validation: PASS.\n#{validation.strip}\nResidual bilingual/index audit: PASS; #{checks.join('; ')}\n"
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-review-D#{D + 1}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D + 1}-#{M::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + verification)
    end
  end
end

ProperNameDiscoveryD21775.apply if $PROGRAM_NAME == __FILE__
