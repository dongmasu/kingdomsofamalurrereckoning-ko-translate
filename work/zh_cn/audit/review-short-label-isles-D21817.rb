#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelIslesD21817
  extend self

  M = ReviewedNameBatches
  D = 21_817
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21816.tsv')
  DISPOSITIONS = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  EXPECTED = {
    ['default', '24097', ''] => ['군도', '군도(The Isles)', 'accepted'],
    ['default', '22615', ''] => [
      '장벽(The Walls)은 조수들과 나 같은 평범한 연구자들의 터전이지. 우린 군도(The Isles)의 기관들이 최상의 지원을 받도록 힘쓰고 있어.',
      '장벽(The Walls)은 조수들과 나 같은 평범한 연구자들의 터전이지. 우린 군도(The Isles)의 기관들이 최상의 지원을 받도록 힘쓰고 있어.',
      'not-an-issue'
    ],
    ['default', '22986', ''] => [
      '군도(The Isles)의 프레토리안 근위병(Praetorians)단을 지휘하고 있네. 문제가 있으면 내 부하 중 한 명을 찾아오게.',
      '군도(The Isles)의 프레토리안 근위병(Praetorians)단을 지휘하고 있네. 문제가 있으면 내 부하 중 한 명을 찾아오게.',
      'not-an-issue'
    ],
    ['default', '51449', ''] => ['제도(The Isles)', '제도(The Isles)', 'not-an-issue'],
    ['default', '51487', ''] => [
      '제도(The Isles)에는 무슨 일로 왔나? 용건을 말하게. 난 꽤 바쁘거든.',
      '제도(The Isles)에는 무슨 일로 왔나? 용건을 말하게. 난 꽤 바쁘거든.',
      'not-an-issue'
    ],
    ['default', '51665', ''] => [
      '제도(The Isles)를 돌아다닐 때 조심하게. 이곳엔 돌봐야 할 귀중품이 많으니까.',
      '제도(The Isles)를 돌아다닐 때 조심하게. 이곳엔 돌봐야 할 귀중품이 많으니까.',
      'not-an-issue'
    ],
    ['default', '53812', ''] => ['군도(The Isles)', '군도(The Isles)', 'not-an-issue'],
    ['default', '55782', ''] => ['군도(The Isles)', '군도(The Isles)', 'not-an-issue'],
    ['default', '56160', ''] => [
      '아일즈(The Isles)에는 아직 할 일이 많지만, 언젠가 아데사(Adessa)가 태양보다 더 밝게 빛날 거라고 장담할게.',
      '아일즈(The Isles)에는 아직 할 일이 많지만, 언젠가 아데사(Adessa)가 태양보다 더 밝게 빛날 거라고 장담할게.',
      'not-an-issue'
    ],
    ['default', '61288', ''] => [
      '아데사(Adessa)의 군도(The Isles), 바실리카 그노스트라(Basilica Gnostra)에 있는 비안 세브루스(Vian Cevrus)에게 귀중한 소포를 배달할, 정직과 신뢰를 갖춘 사람을 찾습니다. 물품 인수 시 보수를 지급합니다.',
      '아데사(Adessa)의 군도(The Isles), 바실리카 그노스트라(Basilica Gnostra)에 있는 비안 세브루스(Vian Cevrus)에게 귀중한 소포를 배달할, 정직과 신뢰를 갖춘 사람을 찾습니다. 물품 인수 시 보수를 지급합니다.',
      'not-an-issue'
    ],
    ['default', '6296', ''] => [
      '우리가 섬들(The Isles)로 내려가는 걸 저들이 싫어해. 거기 중요한 뭔가가 있는 모양이야...',
      '우리가 섬들(The Isles)로 내려가는 걸 저들이 싫어해. 거기 중요한 뭔가가 있는 모양이야...',
      'not-an-issue'
    ]
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    This candidate scope covers the exact standalone/title label and its
    paired label evidence, not a complete source-wide adjudication of every
    Isles sentence. English is the semantic anchor; Japanese アイルズ and
    Chinese 群岛 support the source wording but do not settle whether the
    Korean should be a proper-region name or the generic rendering 군도/제도.
    At default:24097, preserve the accepted Korean rendering 군도 and add
    only the exact English label: 군도(The Isles). D-18815's not-an-issue
    translation finding remains intact; D-7741 and D-19539's separate
    proper-region/canonical-form uncertainty is not resolved. The other ten
    reviewed memberships already carry The Isles in Korean parentheses and
    remain unchanged, with all row-level index findings preserved. No entity
    is registered, and no prior index decision is changed.
  TEXT

  def key(row)
    M.key(row)
  end

  def candidate_keys(row)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(row.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
  end

  def build_reviews(inventory, index, candidates)
    candidate = candidates.fetch('The Isles')
    keys = candidate_keys(candidate)
    raise "The Isles candidate keys differ: #{keys.inspect}" unless
      keys.to_set == EXPECTED.keys.to_set && keys.length == EXPECTED.length
    unpaired = JSON.parse(candidate.fetch('unpaired_label_keys_json'))
      .map { |parts| parts.map(&:to_s) }
    paired = JSON.parse(candidate.fetch('paired_evidence_keys_json'))
      .map { |parts| parts.map(&:to_s) }
    raise "unexpected unpaired key #{unpaired.inspect}" unless
      unpaired == [['default', '24097', '']]
    raise "unexpected paired keys #{paired.inspect}" unless
      paired.to_set == (EXPECTED.keys - [['default', '24097', '']]).to_set

    prior_by_key = index.group_by { |row| key(row) }
    EXPECTED.map do |source_key, (old, revised, disposition)|
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      chinese = source.fetch('zh_text')
      current = source.fetch('work_text')
      raise "English label mismatch at #{source_key.inspect}" unless
        english.match?(/(?<![A-Za-z])(?:The )?Isles(?![A-Za-z])/i)
      raise "stale Korean text at #{source_key.inspect}" unless [old, revised].include?(current)
      raise "changed text without accepted disposition at #{source_key.inspect}" if
        old != revised && disposition != 'accepted'
      raise "unexpected edit at #{source_key.inspect}" if
        old == revised && disposition != 'not-an-issue'

      prior = prior_by_key.fetch(source_key, [])
      row_evidence = if source_key == ['default', '24097', '']
        "#{EVIDENCE} Exact source key: default:24097:."
      else
        "The Korean text already includes the exact English label `The Isles` in parentheses. No edit or entity reclassification is needed for this candidate membership. Preserve every existing row-level index status/evidence and prior decision. #{EVIDENCE} Exact source key: #{source_key.join(':')}."
      end
      {
        'english_candidate' => 'The Isles',
        'disposition' => disposition,
        'resource' => source_key[0],
        'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2],
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'korean' => old,
        'evidence' => row_evidence,
        'prior_index_dispositions_json' => JSON.generate(
          prior.map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        ),
        'old' => old,
        'new' => revised,
        'entity_key' => 'candidate:The Isles',
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
  end

  def retained_backups(prior_block, checks)
    backups = prior_block.lines
      .grep(/^- (?:affix|base|default): \d+ cells; pre .*backup `/)
      .to_h { |line| [line[/\A- (\w+):/, 1], line.strip] }
    checks.each do |check|
      backups[check.fetch(:resource)] =
        "- #{check.fetch(:resource)}: #{check.fetch(:cells)} cells; " \
        "pre `#{check.fetch(:before_sha256)}`; " \
        "post `#{check.fetch(:after_sha256)}`; " \
        "backup `#{check.fetch(:backup)}`."
    end
    M::RESOURCES.map { |resource| backups[resource] }.compact.join("\n")
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    prior_block = docs.fetch(M::DOCS.first)[marker]
    raise 'D-21816 checkpoint is not current' unless
      prior_block&.include?('Latest verified proper-name batch: D-21816 ')
    raise 'checkpoint documents differ' unless docs.values.all? { |text| text[marker] == prior_block }

    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [SNAPSHOT, report, addendum].each do |path|
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
    reviews = build_reviews(inventory, index, candidates)
    raise 'unexpected source-key count' unless reviews.length == 11

    candidate_records = reviews.map { |row| HEADERS.to_h { |header| [header, row[header]] } }
    edits = reviews.map { |row| M::HEADERS.to_h { |header| [header, row.fetch(header, '')] } }
    M.write_table(DISPOSITIONS, HEADERS, candidate_records)
    M.write_table(MANIFEST, M::HEADERS, edits)
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, backup_dir, before_hashes)
    raise 'unexpected edit set' unless checks.map { |check| check.fetch(:resource) } == ['default']
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', backup_dir
    )

    inventory = M.refresh_inventory
    raise 'target label did not update' unless
      inventory.fetch(['default', '24097', '']).fetch('work_text') == '군도(The Isles)'
    raise 'index changed unexpectedly' unless Digest::SHA256.file(M::INDEX).hexdigest == index_hash
    raise 'glossary changed unexpectedly' unless Digest::SHA256.file(glossary_path).hexdigest == glossary_hash

    added = reviews.map do |row|
      [row.fetch('english_candidate'), row.fetch('resource'),
       row.fetch('ID_Linha'), row.fetch('Tipo_Variante').to_s]
    end
    reviewed = ShortLabelDiscovery20261018.reviewed_dispositions
    reviewed.merge(added)
    glossary = M.table(glossary_path).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, glossary, index, reviewed_dispositions: reviewed
    )
    raise 'The Isles remains in refreshed candidates' if
      snapshot.any? { |row| row.fetch('english_candidate') == 'The Isles' }
    raise 'next candidate is unexpected' unless
      snapshot.first&.fetch('english_candidate') == 'The Maid of Fortune'

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
    backup_lines = retained_backups(prior_block, checks)
    counts_text = status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    details = reviews.map do |row|
      "- `#{key(row).join(':')}` (#{row.fetch('disposition')}): EN `#{row.fetch('english')}`; JA `#{row.fetch('japanese')}`; ZH `#{row.fetch('chinese')}`; KO `#{row.fetch('old')}`#{row.fetch('old') == row.fetch('new') ? '' : " -> `#{row.fetch('new')}`"}."
    end.join("\n")
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed all 11 bounded `The Isles` label memberships: one missing English pairing was added to default:24097; ten already-paired labels were retained.
      The Korean rendering `군도` at default:24097 remains unchanged except for `(The Isles)`. D-18815's translation judgment remains intact; D-7741/D-19539 proper-region and canonical-form uncertainty is not resolved. No entity was registered, no occurrence-index status/count or glossary entry changed, and prior findings were not reopened or recounted.
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
      #{backup_lines}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_hash}`.
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{glossary_hash}` (unchanged).
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}.
      Data validation: #{validation.strip}
      Report: `work/zh_cn/audit/#{File.basename(report)}`.
      Addendum: `work/zh_cn/audit/#{File.basename(addendum)}`.
    TEXT

    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "checkpoint changed during D-#{D}: #{path}" unless text[marker] == prior_block
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << "\n## D-#{D}: The Isles Label Pairing\n\nReviewed the 11 bounded `The Isles` label memberships. Added the missing English pairing to default:24097 as `군도(The Isles)` without changing its Korean rendering. D-18815's not-an-issue translation finding and the D-7741/D-19539 proper-region uncertainty remain intact. Ten existing bilingual labels and every indexed row status were preserved; no entity or cumulative count was added.\n"
      elsif path.end_with?('README.md')
        text << "\n## D-#{D}: The Isles Label Pairing\n\nAdded the exact English label to the isolated `군도` display at default:24097 and retained ten existing bilingual labels. This improves source traceability without deciding whether The Isles is a proper region name or generic archipelago; related historical uncertainty remains open.\n"
      end
      File.write(path, text)
    end
    File.write(report, <<~TEXT)
      # D-#{D}: The Isles Short-Label Pairing Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Aligned Source Evidence

      English `The Isles` is the meaning anchor. Japanese consistently uses
      アイルズ for the region label; Chinese uses 群岛. Both corroborate the
      island/archipelago sense but do not settle whether the English capitalized
      region has a distinct Korean proper-name form.

      #{details}

      ## Historical Scope

      D-18815 at default:24097 found `군도` acceptable without inventing a
      narrower referent. This batch retains that translation and adds only
      the source label in parentheses. D-7741's isolated proper-region versus
      generic reading and D-19539's place-name-form uncertainty remain open.
      Existing findings at the ten paired keys are preserved; no prior row
      disposition or historical total is reopened or recounted.
    TEXT
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      Only default:24097 changed: `군도` -> `군도(The Isles)`. Ten other
      candidate memberships were verified as already paired and remain
      unchanged. No glossary or occurrence-index bytes changed.

      #{summary}

      The byte-preserving editor and independent verifier checked the
      byte-identical pre-edit backup, BOM, mixed line endings, row order/count,
      target cell, unchanged non-target bytes, and inverse reconstruction.
    TEXT
    puts "D-#{D}: 11 memberships reviewed; one bilingual pairing added; historical place uncertainty preserved; #{validation.strip}; residual audit PASS."
  end
end

ReviewShortLabelIslesD21817.run if $PROGRAM_NAME == __FILE__
