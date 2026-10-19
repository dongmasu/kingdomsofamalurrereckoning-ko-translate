#!/usr/bin/env ruby

require 'json'
require_relative 'apply-proper-name-text-corrections-20261018'
require_relative 'build-short-label-discovery-20261018'

module ReviewSparrowShortLabelsD21799
  extend self

  M = ReviewedNameBatches
  D = 21_799
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21798.tsv')
  EDIT_MANIFEST = File.join(__dir__, "proper-name-candidate-edits-D#{D}.tsv")
  CANDIDATES = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean old new evidence prior_index_dispositions_json
  ].freeze
  GROUP = {
    'default:19179:' => 'uncertain',
    'default:20899:' => 'uncertain',
    'default:3534:' => 'uncertain',
    'default:1963:' => 'accepted',
    'default:22382:' => 'accepted',
    'default:29092:' => 'accepted',
    'default:31232:' => 'not-an-issue',
    'default:54044:' => 'accepted',
    'default:60431:' => 'uncertain'
  }.freeze
  CORRECTIONS = [
    {
      'resource' => 'default', 'ID_Linha' => '1963', 'Tipo_Variante' => '',
      'entity_key' => 'person:gwalchmai',
      'old' => '대가문(Great House)이든 스패로우(Sparrow)든 병사든, 나는 누구에게나 겸손한 종복이지. 필요한 물건이 있는 남녀라면 누구나 그월흐마이의 상점(Gwalchmai\'s Goods)을 찾아와.',
      'new' => '대가문(Great House)이든 참새단(Sparrows)이든 병사든, 나는 누구에게나 겸손한 종복이지. 필요한 물건이 있는 남녀라면 누구나 그월흐마이의 상점(Gwalchmai\'s Goods)을 찾아와.',
      'evidence' => 'D-21799: English default:1963 groups Sparrow between Great House and soldier; default:54044 repeats the same speaker’s parallel “Great House and Sparrow alike” customer categories. This identifies the existing Sparrows collective, not an individual bird or a new faction. Japanese quotation marks and Chinese 麻雀 are corroborative. Reuse faction:sparrows canonical 참새단(Sparrows); preserve Gwalchmai and the remainder of the line.'
    },
    {
      'resource' => 'default', 'ID_Linha' => '22382', 'Tipo_Variante' => '',
      'entity_key' => 'person:orwin',
      'old' => '던(Dunn)이 거짓말을 한 게 아니라면, 탈리보르(Talibor) 대장은 이미 스패로우(Sparrow)의 소굴에 가서 그들 중 마지막 생존자까지 죽이려 하고 있을지 몰라.',
      'new' => '던(Dunn)이 거짓말을 한 게 아니라면, 탈리보르(Talibor) 대장은 이미 참새단(Sparrows)의 소굴에 가서 그들 중 마지막 생존자까지 죽이려 하고 있을지 몰라.',
      'evidence' => 'D-21799: English says Talibor is in the Sparrow’s nest and is attempting to kill the last of them; aligned Japanese/Chinese and the established Talibor/Dunn storyline identify the Sparrows collective. The nest remains a generic group hideout description, not a new named place. Reuse faction:sparrows canonical 참새단(Sparrows), preserve all other wording and the prior person dispositions.'
    },
    {
      'resource' => 'default', 'ID_Linha' => '29092', 'Tipo_Variante' => '',
      'entity_key' => 'organization:city-watch',
      'old' => '제발. 도시 경비대(City Watch)로 가. 또 다른 스패로우 단원(Sparrow)이 살해되기 전에.',
      'new' => '제발. 도시 경비대(City Watch)로 가. 또 다른 참새단원(Sparrow)이 살해되기 전에.',
      'evidence' => 'D-21799: English “another Sparrow” is a person/member being killed; aligned Japanese quotes スズメ and the English-led corpus identifies the group as the Sparrows. Reuse the source-local member form 참새단원(Sparrow) already established at default:31232. This does not alter the adjacent City Watch finding.'
    },
    {
      'resource' => 'default', 'ID_Linha' => '54044', 'Tipo_Variante' => '',
      'entity_key' => 'person:gwalchmai',
      'old' => '그월흐마이(Gwalchmai)의 상점(Gwalchmai\'s Goods)에 온 걸 환영해. 높은 지위든 낮은 지위든, 위대한 가문(Great House)이든 스패로우(Sparrow)든 라시르(Rathir) 사람이라면 누구나 이용하는 보급상이야.',
      'new' => '그월흐마이(Gwalchmai)의 상점(Gwalchmai\'s Goods)에 온 걸 환영해. 높은 지위든 낮은 지위든, 위대한 가문(Great House)이든 참새단(Sparrows)이든 라시르(Rathir) 사람이라면 누구나 이용하는 보급상이야.',
      'evidence' => 'D-21799: English pairs Great House with Sparrow as customer groups and explicitly says Gwalchmai provisions all Rathir; default:1963 is the same speaker’s parallel formulation. Japanese quotation marks and Chinese 麻雀 corroborate. Reuse faction:sparrows canonical 참새단(Sparrows), without creating a site or a new entity.'
    }
  ].freeze
  EVIDENCE = {
    'default:19179:' => 'English is only the isolated label “Sparrow”; aligned Japanese スズメ and Chinese 麻雀 both mean sparrow but do not establish whether this is a bird, group label, or another referent. Preserve the Korean text and leave the identity unclassified.',
    'default:20899:' => 'English and all aligned locale cells retain the isolated label “Sparrow”; no surrounding source text resolves a person, group, or common-noun reading. Preserve historical D-6445 and the Korean text.',
    'default:3534:' => 'English is only the isolated label “Sparrow”; aligned Japanese スズメ and Chinese 麻雀 do not independently establish a named group or individual. Preserve the Korean text and leave the identity unclassified.',
    'default:1963:' => 'English default:1963 pairs Sparrow with Great House and soldier; the same speaker’s default:54044 line repeats the matching Great House/Sparrow customer categories. This cross-row evidence identifies the established Sparrows group. Japanese quotation marks and Chinese 麻雀 corroborate.',
    'default:22382:' => 'English identifies Talibor’s target as the last of a group in Sparrow’s nest. The aligned Japanese/Chinese and the same murder storyline identify the established Sparrows collective; “nest” remains a generic hideout, not a named site.',
    'default:29092:' => 'English “another Sparrow” is a member/person being killed; aligned Japanese quotes スズメ. The established group terminology and D-21671’s local singular member form support 참새단원(Sparrow). Preserve the prior City Watch disposition.',
    'default:31232:' => 'Already canonical from D-21671: 참새단(Sparrows) and the explicitly singular member label 참새단원(Sparrow). Preserve the historical disposition without recounting or editing.',
    'default:54044:' => 'English explicitly groups Sparrow with Great House as customer categories; default:1963 is the same speaker’s parallel line. This identifies the existing Sparrows collective. Japanese quotation marks and Chinese 麻雀 corroborate.',
    'default:60431:' => 'English “the humblest Sparrow” is capitalized and Japanese quotes スズメ, but the isolated aphorism could be a member of the Sparrows or a metaphorical/common-noun use. Preserve D-17903’s uncertainty and the Korean text.'
  }.freeze

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def build_candidate_rows(inventory, index, candidate, edit_rows)
    members = (
      JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
      JSON.parse(candidate.fetch('paired_evidence_keys_json'))
    ).map { |parts| parts.map(&:to_s) }.uniq
    expected = GROUP.keys.map { |text| text.split(':', -1) }
    raise 'Sparrow candidate membership changed' unless members.to_set == expected.to_set

    by_key = index.group_by { |row| key(row) }
    edits = edit_rows.to_h { |row| [key(row), row] }
    members.sort_by { |parts| parts[1].to_i }.map do |parts|
      source = inventory.fetch(parts)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "source term missing at #{parts.inspect}" unless
        english.match?(/(?<![A-Za-z0-9])Sparrow(?![A-Za-z0-9])/)
      key_text = parts.join(':')
      edit = edits[key(source)]
      {
        'english_candidate' => 'Sparrow',
        'disposition' => GROUP.fetch(key_text),
        'resource' => parts[0], 'ID_Linha' => parts[1], 'Tipo_Variante' => parts[2],
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
        'chinese' => source.fetch('zh_text'),
        'korean' => source.fetch('work_text'),
        'old' => edit ? edit.fetch('old') : source.fetch('work_text'),
        'new' => edit ? edit.fetch('new') : source.fetch('work_text'),
        'evidence' => "D-#{D}: #{EVIDENCE.fetch(key_text)}",
        'prior_index_dispositions_json' => JSON.generate(
          by_key.fetch(parts, []).map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        )
      }
    end
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    prior = File.read(M::DOCS.first)[marker]
    raise 'D-21798 is not the active checkpoint' unless
      prior&.include?('Latest verified proper-name batch: D-21798 ')
    raise 'active checkpoint documents differ' unless
      M::DOCS.all? { |path| File.read(path)[marker] == prior }
    report_path = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum_path = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    raise 'D-21799 output already exists' if
      [CANDIDATES, SNAPSHOT, report_path, addendum_path].any? { |path| File.exist?(path) }

    legacy_manifest = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    if File.file?(legacy_manifest)
      raise 'candidate edit manifest already exists beside the indexed manifest' if File.exist?(EDIT_MANIFEST)
      File.rename(legacy_manifest, EDIT_MANIFEST)
    end
    raise 'D-21799 byte-edit manifest is missing' unless File.file?(EDIT_MANIFEST)

    inventory = M.refresh_inventory
    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    prior_index = index.map(&:dup)
    edit_rows = M.table(EDIT_MANIFEST).map(&:to_h)
    expected_edits = CORRECTIONS.to_h { |row| [key(row), [row.fetch('old'), row.fetch('new')]] }
    actual_edits = edit_rows.to_h { |row| [key(row), [row.fetch('old'), row.fetch('new')]] }
    raise 'D-21799 edit manifest differs from reviewed corrections' unless
      expected_edits == actual_edits
    edit_rows.each do |edit|
      prior_row = index.find do |row|
        key(row) == key(edit) && row.fetch('entity_key') == edit.fetch('entity_key')
      end
      entity = edit.fetch('entity_key')
      raise "prior index finding missing for #{key(edit).inspect}" unless prior_row
      raise "prior index disposition changed for #{key(edit).inspect}" unless
        prior_row.fetch('status') == JSON.parse(edit.fetch('previous_status')).fetch(entity) &&
        prior_row.fetch('evidence') == JSON.parse(edit.fetch('previous_evidence')).fetch(entity)
      raise "active text differs for #{key(edit).inspect}" unless
        inventory.fetch(key(edit)).fetch('work_text') == edit.fetch('new')
    end
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', EDIT_MANIFEST, '--backup-dir', backup_dir
    )
    index.each do |row|
      row['korean_current'] = inventory.fetch(key(row)).fetch('work_text')
    end
    raise 'recovery changed an index disposition or evidence field' unless
      prior_index.zip(index).all? do |before, after|
        before.all? { |field, value| field == 'korean_current' || after[field] == value }
      end
    M.write_table(M::INDEX, index_table.headers, index)
    candidate = M.table(INPUT).map(&:to_h).find do |row|
      row.fetch('english_candidate') == 'Sparrow'
    end
    raise 'Sparrow candidate missing' unless candidate
    rows = build_candidate_rows(inventory, index, candidate, edit_rows)
    raise 'expected nine Sparrow candidate memberships' unless rows.length == 9
    M.write_table(CANDIDATES, HEADERS, rows)
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    raise 'Sparrow remains in the candidate queue after disposition' if
      snapshot.any? { |row| row.fetch('english_candidate') == 'Sparrow' }

    summary_line = "Sparrow short-label memberships: 9 reviewed; 4 accepted terminology corrections, 1 already canonical, 4 retained as uncertain. Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`."
    next_line = "Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first&.fetch('english_candidate', 'none')}`; not exhaustive or a completion estimate)."
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'residual bilingual/index audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0')
    counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    held = index.select { |row| row.fetch('status') == 'uncertain' }
    retained = prior[/Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1]
    raise 'previous actual-edit backup list missing' unless retained
    hashes = M.hashes
    backup = File.join(backup_dir, File.basename(M.csv_path('default')))
    before_hash = Digest::SHA256.file(backup).hexdigest
    checks = "- default: 4 cells; pre `#{before_hash}`; post `#{hashes.fetch('default')}`; backup `#{backup}`."
    backup_lines = retained.lines.each_with_object({}) do |line, result|
      resource = line[/\A- (affix|base|default):/, 1]
      result[resource] = line.strip if resource
    end
    backup_lines['default'] = checks
    last_backups = M::RESOURCES.map { |resource| backup_lines[resource] }.compact.join("\n")
    candidate_counts = M.table(File.join(__dir__, 'proper-name-variant-discovery-candidates-20261015.tsv'))
      .group_by { |row| row.fetch('status') }.transform_values(&:length)
    status_text = counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed nine `Sparrow` short-label memberships: 4 accepted terminology corrections, 1 already canonical, 4 uncertain. Last candidate key: default:60431.
      Groups: Sparrow (9 candidate memberships).
      Existing `faction:sparrows` ownership was reused; no glossary entity, occurrence key, or cumulative indexed decision was added. Prior index statuses and evidence are unchanged.
      Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first&.fetch('english_candidate', 'none')}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{status_text}.
      Remaining unreviewed indexed matches: 0; reviewed unresolved indexed holds: #{held.length}, in #{held.map { |row| key(row) }.uniq.length} distinct source keys.
      Candidate classifications do not alter indexed status counts or global cumulative totals.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: 305 terms; registered-reviewed=#{candidate_counts.fetch('registered-reviewed', 0)}, heuristic-not-reviewed=#{candidate_counts.fetch('heuristic-not-reviewed', 0)}. This list is not exhaustive; it does not establish an overall completion percentage.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")}
      Last batch pre-edit backup and byte validation:
      #{checks}
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{last_backups}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{glossary.length} entries; SHA-256 `#{Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest}`.
      Data validation: #{validation.strip}
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}
      Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Text edit manifest: `work/zh_cn/audit/proper-name-candidate-edits-D#{D}.tsv`.
    TEXT
    M::DOCS.each do |path|
      text = File.read(path)
      raise "active checkpoint missing from #{path}" unless text.match?(marker)
      block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->"
      File.write(path, text.sub(marker, block))
    end

    note = <<~TEXT

      ## D-#{D}: Sparrow Short-Label Review

      Reviewed all nine source keys in the refreshed `Sparrow` candidate group.
      Four cells reuse the established `참새단(Sparrows)` / `참새단원(Sparrow)`
      terminology; one is already canonical. Four isolated or metaphorical
      readings remain uncertain. Existing `faction:sparrows` ownership is reused;
      no global singular alias or indexed occurrence was added. D-292, D-7026,
      D-9108, and D-16374 are superseded only for the specific Sparrow referent
      and terminology findings described in the manifest. D-6445 and D-17903
      remain uncertain. D-10122 was already handled by D-21671 and is not
      recounted. Full proper-name discovery remains incomplete.
    TEXT
    File.write(report_path, "# D-#{D}: Sparrow Short-Label Review\n\n#{summary}\n\n#{note}\n\nThe exact aligned English, Japanese, Chinese, Korean, old/new text, and prior indexed dispositions are recorded in the two manifests. No source files or PAK resources were consulted.\n")
    File.write(addendum_path, "# D-#{D} Edit Addendum\n\n#{summary}\n\n#{note}\n\nThe independent verifier confirms the byte-identical backup, BOM, mixed line endings, row order, target-only `Texto` edits, non-target byte preservation, and inverse reconstruction.\n")
    %w[README.md decision-register-20261009.md].each do |name|
      path = File.join(__dir__, name)
      text = File.read(path)
      File.write(path, text.sub("<!-- current-proper-name-batch:start -->",
                                "#{note}\n<!-- current-proper-name-batch:start -->"))
    end
    puts "D-#{D}: reviewed 9 Sparrow memberships; corrected 4 cells; #{snapshot.length} bounded groups remain."
  end
end

ReviewSparrowShortLabelsD21799.run if $PROGRAM_NAME == __FILE__
