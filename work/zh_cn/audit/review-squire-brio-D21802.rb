#!/usr/bin/env ruby

require 'json'
require_relative 'apply-proper-name-text-corrections-20261018'
require_relative 'build-short-label-discovery-20261018'

module ReviewSquireBrioD21802
  extend self

  M = ReviewedNameBatches
  D = 21_802
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21801.tsv')
  DISPOSITIONS = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  GROUP = {
    'default:23978:' => 'not-an-issue',
    'default:33546:' => 'accepted',
    'default:61437:' => 'not-an-issue'
  }.freeze
  EDIT_KEY = ['default', '33546', ''].freeze
  OLD = '종자 브리오(Brio)'
  NEW = '종자 브리오(Squire Brio)'
  CANONICAL = '종자 브리오(Squire Brio)'
  EVIDENCE = <<~TEXT.strip.freeze
    D-21802: English labels the existing glossary person Brio with the role-bearing full display name “Squire Brio.” The aligned Japanese 従者ブリオ and Chinese 乡绅布里奥 support the squire/rank wording but do not override English identity. Reuse the established Korean role noun 종자 and pair the exact full standalone label as 종자 브리오(Squire Brio), matching default:61437. Correct only default:33546; default:23978 already has this full bilingual label and also contains a separately paired Brio mention. Preserve all prior indexed statuses/evidence, including the broader D-7680 and D-11766 sentence holds.
  TEXT

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    prior_block = File.read(M::DOCS.first)[marker]
    raise 'D-21801 is not the active checkpoint' unless
      prior_block&.include?('Latest verified proper-name batch: D-21801 ')
    raise 'active checkpoint documents differ' unless
      M::DOCS.all? { |path| File.read(path)[marker] == prior_block }
    raise 'candidate output already exists' if File.exist?(DISPOSITIONS)

    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    candidates = M.table(INPUT).map(&:to_h)
    candidate = candidates.find { |row| row.fetch('english_candidate') == 'Squire Brio' }
    raise 'Squire Brio candidate missing' unless candidate
    members = (
      JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
      JSON.parse(candidate.fetch('paired_evidence_keys_json'))
    ).map { |parts| parts.map(&:to_s) }.uniq
    expected = GROUP.keys.map { |value| value.split(':', -1) }
    raise 'Squire Brio candidate membership changed' unless members.to_set == expected.to_set

    edit_source = inventory.fetch(EDIT_KEY)
    raise 'unexpected Squire Brio target text' unless edit_source.fetch('work_text') == OLD
    english = JSON.parse(edit_source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(edit_source.fetch('ja_texts_json')).compact.join("\n")
    raise 'English full label differs' unless english == 'Squire Brio'
    raise 'Japanese aligned label differs' unless japanese == '従者ブリオ'
    raise 'Chinese aligned label differs' unless edit_source.fetch('zh_text') == '乡绅布里奥'

    correction = {
      'resource' => EDIT_KEY[0], 'ID_Linha' => EDIT_KEY[1], 'Tipo_Variante' => EDIT_KEY[2],
      'entity_key' => 'person:brio', 'old' => OLD, 'new' => NEW,
      'evidence' => EVIDENCE
    }
    ProperNameTextCorrections20261018.run(
      D, [correction], 'Squire Brio Full Standalone Label'
    )

    refreshed = M.refresh_inventory
    current_index = M.table(M::INDEX).map(&:to_h)
    index_by_key = current_index.group_by { |row| key(row) }
    rows = members.sort_by { |parts| parts[1].to_i }.map do |parts|
      source = refreshed.fetch(parts)
      english_text = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "candidate source label missing at #{parts.inspect}" unless
        english_text.match?(/(?<![A-Za-z0-9])Squire Brio(?![A-Za-z0-9])/)
      old_text = parts == EDIT_KEY ? OLD : source.fetch('work_text')
      new_text = parts == EDIT_KEY ? NEW : source.fetch('work_text')
      {
        'english_candidate' => 'Squire Brio',
        'disposition' => GROUP.fetch(parts.join(':')),
        'resource' => parts[0], 'ID_Linha' => parts[1], 'Tipo_Variante' => parts[2],
        'english' => english_text,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'korean' => new_text,
        'evidence' => EVIDENCE,
        'prior_index_dispositions_json' => JSON.generate(
          index_by_key.fetch(parts, []).map do |entry|
            [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')]
          end
        )
      }
    end
    raise 'Squire Brio candidate disposition counts differ' unless
      rows.count { |row| row['disposition'] == 'accepted' } == 1 &&
      rows.count { |row| row['disposition'] == 'not-an-issue' } == 2
    M.write_table(DISPOSITIONS, HEADERS, rows)

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(
      refreshed.values, glossary, current_index
    )
    snapshot_path = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
    M.write_table(snapshot_path, ShortLabelDiscovery20261018::HEADERS, snapshot)
    raise 'Squire Brio remains in refreshed candidate queue' if
      snapshot.any? { |row| row.fetch('english_candidate') == 'Squire Brio' }
    next_line = "Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first&.fetch('english_candidate', 'none')}`; not exhaustive or a completion estimate)."

    note = <<~TEXT

      ## D-#{D}: Squire Brio Full Label Candidate Review

      Reviewed all three refreshed `Squire Brio` candidate memberships:
      corrected the standalone label at `default:33546` to
      `종자 브리오(Squire Brio)`; `default:23978` and `default:61437` already
      use the canonical full label. The correction reuses `person:brio` and
      leaves all prior entity/row statuses and evidence unchanged. Broader
      sentence holds D-7680 and D-11766 remain open. Candidate dispositions:
      `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
    TEXT
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |name|
      path = File.join(__dir__, name)
      File.open(path, 'a') { |file| file.write(note) }
    end
    %w[README.md decision-register-20261009.md].each do |name|
      path = File.join(__dir__, name)
      File.open(path, 'a') { |file| file.write(note) }
    end
    M::DOCS.each do |path|
      text = File.read(path)
      block = text[marker]
      block = block.sub(/^Next batch:.*$/, next_line)
      candidate_line = "Squire Brio candidate memberships: 3 reviewed; 1 corrected and 2 already canonical. Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`."
      block = block.sub(/^(Next batch:.*\n)/, "\\1#{candidate_line}\n")
      File.write(path, text.sub(marker, block))
    end
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |name|
      path = File.join(__dir__, name)
      text = File.read(path)
      text.sub!(/^Next batch:.*$/, next_line)
      File.write(path, text)
    end
    puts "D-#{D}: reviewed 3 Squire Brio memberships; corrected default:33546; prior indexed decisions preserved."
  end
end

ReviewSquireBrioD21802.run if $PROGRAM_NAME == __FILE__
