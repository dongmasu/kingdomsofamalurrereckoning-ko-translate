#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'set'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelMaidOfFortuneD21818
  extend self

  M = ReviewedNameBatches
  D = 21_818
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21817.tsv')
  DISPOSITIONS = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  EXPECTED = {
    ['default', '57264', ''] => ['행운의 시녀호', '행운의 시녀호(Maid of Fortune)', 'accepted'],
    ['default', '61973', ''] => [
      '웨일런(Walen)이 부두에 있는 제이버(Jeibir)에게 배 이름을 알려 달라고 했어. 메이드 오브 포춘호(The Maid of Fortune)야. 그림자 장미(Rose-of-Shadows)라는 독으로 죽은 척하려는 치밀한 계획의 마지막 단계지. 그의 가짜 시신은 배에 실려 라시르(Rathir) 밖으로 옮겨지고, 그는 도시와 병역 의무에서 모두 벗어날 거야.',
      '웨일런(Walen)이 부두에 있는 제이버(Jeibir)에게 배 이름을 알려 달라고 했어. 메이드 오브 포춘호(The Maid of Fortune)야. 그림자 장미(Rose-of-Shadows)라는 독으로 죽은 척하려는 치밀한 계획의 마지막 단계지. 그의 가짜 시신은 배에 실려 라시르(Rathir) 밖으로 옮겨지고, 그는 도시와 병역 의무에서 모두 벗어날 거야.',
      'not-an-issue'
    ]
  }.freeze
  ALL_IDS = %w[1151 5239 7568 13675 17546 27645 33962 57264 61973].freeze
  EVIDENCE = <<~TEXT.strip.freeze
    The candidate is a standalone ship-name label. English `default:57264`
    gives `The Maid of Fortune`; Japanese `メイド・オブ・フォーチュン号`
    explicitly marks a vessel, and Chinese `命运少女号` uses the ship suffix.
    Reuse the already accepted display `행운의 시녀호(Maid of Fortune)` from
    D-1281/D-4058. Here `The` is the English determiner, not part of the
    established parenthetical canonical name. Add only the missing English
    pairing at default:57264. Keep the separately paired phrase in
    default:61973 and all of its existing row-level findings unchanged;
    in particular, do not reopen D-17975 or recount its sentence judgment.
    The nine English source keys containing Maid of Fortune were checked
    across all locale files for context. This bounded short-label review does
    not globally retranslate those sentence occurrences or resolve the
    separate D-10967 wording uncertainty at default:33962. No item entity,
    glossary entry, occurrence-index status, or cumulative count is added.
  TEXT

  def key(row)
    M.key(row)
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    prior_block = docs.fetch(M::DOCS.first)[marker]
    raise 'D-21817 checkpoint is not current' unless
      prior_block&.include?('Latest verified proper-name batch: D-21817 ')
    raise 'checkpoint documents differ' unless docs.values.all? { |text| text[marker] == prior_block }

    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [DISPOSITIONS, MANIFEST, SNAPSHOT, report, addendum].each do |path|
      raise "D-#{D} output already exists: #{path}" if File.exist?(path)
    end

    before_hashes = M.hashes
    inventory = M.refresh_inventory
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_hash = Digest::SHA256.file(glossary_path).hexdigest
    index = M.table(M::INDEX).map(&:to_h)
    candidates = M.table(INPUT).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    candidate = candidates.fetch('The Maid of Fortune')
    candidate_keys = %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(candidate.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
    raise "unexpected candidate keys: #{candidate_keys.inspect}" unless
      candidate_keys.to_set == EXPECTED.keys.to_set
    raise 'unexpected unpaired key' unless
      JSON.parse(candidate.fetch('unpaired_label_keys_json')) == [['default', '57264', '']]
    raise 'unexpected paired evidence key' unless
      JSON.parse(candidate.fetch('paired_evidence_keys_json')) == [['default', '61973', '']]

    source_hits = inventory.values.select do |row|
      JSON.parse(row.fetch('en_texts_json')).compact.any? do |text|
        text.match?(/(?<![A-Za-z])Maid of Fortune(?![A-Za-z])/i)
      end
    end
    hit_ids = source_hits.select { |row| row.fetch('resource') == 'default' }
      .map { |row| row.fetch('ID_Linha') }.uniq.sort_by(&:to_i)
    raise "unexpected all-source hit IDs: #{hit_ids.inspect}" unless hit_ids == ALL_IDS.sort_by(&:to_i)

    prior_by_key = index.group_by { |row| key(row) }
    reviews = EXPECTED.map do |source_key, (old, revised, disposition)|
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      chinese = source.fetch('zh_text')
      current = source.fetch('work_text')
      raise "stale Korean text at #{source_key.inspect}" unless current == old
      if source_key == ['default', '57264', '']
        raise "English label mismatch: #{english.inspect}" unless english == 'The Maid of Fortune'
        raise "Japanese/Chinese ship evidence mismatch" unless
          japanese == 'メイド・オブ・フォーチュン号を借りた' && chinese == '命运少女号'
      else
        raise 'paired Korean evidence changed' unless
          current.include?('(The Maid of Fortune)')
      end
      prior = prior_by_key.fetch(source_key, [])
      evidence = "#{EVIDENCE} Exact source key: #{source_key.join(':')}."
      {
        'english_candidate' => 'The Maid of Fortune',
        'disposition' => disposition,
        'resource' => source_key[0],
        'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2],
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'korean' => old,
        'evidence' => evidence,
        'prior_index_dispositions_json' => JSON.generate(
          prior.map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        ),
        'old' => old,
        'new' => revised,
        'entity_key' => 'candidate:The Maid of Fortune',
        'status' => disposition,
        'entity_dispositions_json' => '{}',
        'previous_status' => JSON.generate(
          prior.to_h { |row| [row.fetch('entity_key'), row.fetch('status')] }
        ),
        'previous_evidence' => JSON.generate(
          prior.to_h { |row| [row.fetch('entity_key'), row.fetch('evidence')] }
        )
      }
    end

    M.write_table(DISPOSITIONS, HEADERS,
                  reviews.map { |row| HEADERS.to_h { |field| [field, row[field]] } })
    M.write_table(MANIFEST, M::HEADERS,
                  reviews.map { |row| M::HEADERS.to_h { |field| [field, row.fetch(field, '')] } })
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, backup_dir, before_hashes)
    raise 'unexpected edit set' unless checks.map { |check| check.fetch(:resource) } == ['default']
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', backup_dir
    )

    inventory = M.refresh_inventory
    raise 'target label did not update' unless
      inventory.fetch(['default', '57264', '']).fetch('work_text') == '행운의 시녀호(Maid of Fortune)'
    raise 'occurrence index changed unexpectedly' unless Digest::SHA256.file(M::INDEX).hexdigest == index_hash
    raise 'glossary changed unexpectedly' unless Digest::SHA256.file(glossary_path).hexdigest == glossary_hash

    reviewed = ShortLabelDiscovery20261018.reviewed_dispositions
    reviewed.merge(reviews.map do |row|
      [row.fetch('english_candidate'), row.fetch('resource'),
       row.fetch('ID_Linha'), row.fetch('Tipo_Variante').to_s]
    end)
    snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, M.table(glossary_path).map(&:to_h), index,
      reviewed_dispositions: reviewed
    )
    raise 'reviewed Maid candidate was not removed' if
      snapshot.any? { |row| row.fetch('english_candidate') == 'The Maid of Fortune' }
    raise 'unexpected next candidate' unless
      snapshot.first&.fetch('english_candidate') == 'The Mission'
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'residual audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')

    status_counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    held = index.select { |row| row.fetch('status') == 'uncertain' }
    variants = M.table(File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'))
    variant_counts = variants.group_by { |row| row.fetch('status') }.transform_values(&:length)
    hashes = M.hashes
    integrity = checks.map do |check|
      "- #{check.fetch(:resource)}: #{check.fetch(:cells)} cells; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    end.join("\n")
    counts_text = status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed both bounded `The Maid of Fortune` label memberships: added the established bilingual display `행운의 시녀호(Maid of Fortune)` at default:57264 and retained the already-paired label evidence at default:61973.
      The English determiner `The` is omitted from the parenthetical canonical form, consistent with D-1281/D-4058. Japanese `メイド・オブ・フォーチュン号` and Chinese `命运少女号` corroborate the ship reading. D-17975 and D-10967's separate wording uncertainty remain untouched; no item entity was registered and no indexed status/count or glossary entry changed.
      Nine aligned default source rows containing Maid of Fortune were checked for context: #{ALL_IDS.join(', ')}. This bounded pairing batch does not globally retranslate those occurrences.
      Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first.fetch('english_candidate')}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{counts_text} (unchanged).
      Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |row| key(row) }.uniq.length} distinct CSV row keys.
      These focused index counts are not global translation totals. Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: #{variants.length} terms; registered-reviewed=#{variant_counts.fetch('registered-reviewed', 0)}, heuristic-not-reviewed=#{variant_counts.fetch('heuristic-not-reviewed', 0)}. This list is not exhaustive and establishes no overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Edit manifest: `work/zh_cn/audit/proper-name-edits-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      Last batch pre-edit backup and byte validation:
      #{integrity}
      #{verification.strip}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_hash}`.
      Proper-name glossary: #{M.table(glossary_path).length} entries; SHA-256 `#{glossary_hash}` (unchanged).
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}.
      Data validation: #{validation.strip}
      Report: `work/zh_cn/audit/#{File.basename(report)}`.
      Addendum: `work/zh_cn/audit/#{File.basename(addendum)}`.
    TEXT

    details = reviews.map do |row|
      "- `#{key(row).join(':')}` (#{row.fetch('disposition')}): EN `#{row.fetch('english')}`; JA `#{row.fetch('japanese')}`; ZH `#{row.fetch('chinese')}`; KO `#{row.fetch('old')}`#{row.fetch('old') == row.fetch('new') ? '' : " -> `#{row.fetch('new')}`"}."
    end.join("\n")
    replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "checkpoint changed during D-#{D}: #{path}" unless text[marker] == prior_block
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << "\n## D-#{D}: Maid of Fortune Label Pairing\n\nAdded the missing established English pairing to default:57264 as `행운의 시녀호(Maid of Fortune)`. The already-paired default:61973 label and its prior sentence findings remain unchanged. The bounded review does not register a new entity or resolve D-10967's separate wording uncertainty.\n"
      elsif path.end_with?('README.md')
        text << "\n## D-#{D}: Maid of Fortune Short-Label Review\n\nThe standalone ship label at default:57264 now uses the established `행운의 시녀호(Maid of Fortune)` form. Existing sentence variants, the paired evidence at default:61973, and prior translation findings were not reopened in this bounded label-pairing review.\n"
      end
      File.write(path, text)
    end
    File.write(report, <<~TEXT)
      # D-#{D}: The Maid of Fortune Short-Label Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Aligned Source Evidence

      English is the meaning anchor. The standalone label at default:57264
      names a ship; Japanese adds the ship suffix `号`, and Chinese uses the
      corresponding suffix `号`. The English article is not part of the
      established parenthetical form from D-1281/D-4058. The nine relevant
      default rows were checked across English, Japanese, Chinese, and Korean:
      #{ALL_IDS.join(', ')}.

      #{details}

      ## Historical Scope

      This batch adds only the missing bilingual pairing at default:57264.
      The already paired text at default:61973 and its D-17975 sentence-level
      judgment are retained. D-10967's distinct wording uncertainty at
      default:33962 is not resolved or recounted. No new entity, glossary row,
      occurrence-index row/status, or cumulative count was created.
    TEXT
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      Only default:57264 changed: `행운의 시녀호` ->
      `행운의 시녀호(Maid of Fortune)`. The paired candidate evidence at
      default:61973 was retained. No glossary or occurrence-index bytes changed.

      #{summary}

      The byte-preserving editor and independent verifier checked the
      byte-identical pre-edit backup, BOM, mixed line endings, row order/count,
      target cell, unchanged non-target bytes, and inverse reconstruction.
    TEXT
    puts "D-#{D}: two bounded memberships reviewed; one pairing added; validation and residual audit PASS."
  end
end

ReviewShortLabelMaidOfFortuneD21818.run if $PROGRAM_NAME == __FILE__
