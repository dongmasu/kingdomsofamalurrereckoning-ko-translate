#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewStillManorD21804
  extend self

  M = ReviewedNameBatches
  D = 21_804
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21803.tsv')
  DISPOSITIONS = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  CANDIDATE_GROUP = {
    'base:1631:11' => 'accepted',
    'default:12629:' => 'not-an-issue'
  }.freeze
  MANOR_KEYS = [
    ['base', '1292', '11'], ['base', '1631', '11'],
    ['base', '1886', '11'], ['default', '12629', '']
  ].freeze
  GUARD_KEY = ['base', '1292', '11'].freeze
  SERVANTS_KEY = ['base', '1886', '11'].freeze
  SPECS = [
    {
      key: 'place:still-manor',
      english: 'Still Manor',
      category: 'place',
      korean: '스틸 저택(Still Manor)',
      aliases: '',
      variants: '스틸(Still) 저택|스틸 저택',
      count: 4,
      notes: 'The standalone Still Manor labels at base:1631 and default:12629, plus the exact source compounds Still Manor Guard Entrance and Still Manor Servants Entrance, identify the same residence. Japanese Still Manor/スティル邸 and Chinese 寂静庄园/平静庄园 corroborate. Reuse the Korean stem 스틸 저택 and pair the complete standalone name as 스틸 저택(Still Manor). Treat the two compound entrances as separate named map labels; exclude the manor component on those keys to prevent nested parentheses.'
    },
    {
      key: 'place:still-manor-guard-entrance',
      english: 'Still Manor Guard Entrance',
      category: 'place',
      korean: '스틸 저택 경비 출입구(Still Manor Guard Entrance)',
      aliases: '',
      variants: '스틸 저택 경비 출입구',
      count: 1,
      notes: 'Base:1292 is a complete map-location label. Japanese スティル邸の警備員入口 and Chinese 寂静庄园守卫入口 corroborate the manor guard entrance. Preserve the established Korean wording and pair the full English compound atomically; do not nest the separate Still Manor component.'
    },
    {
      key: 'place:still-manor-servants-entrance',
      english: 'Still Manor Servants Entrance',
      category: 'place',
      korean: '스틸 저택 하인 출입구(Still Manor Servants Entrance)',
      aliases: '',
      variants: '스틸 저택 하인 출입구',
      count: 1,
      notes: 'Base:1886 is a complete map-location label. Japanese Still Manor Servants Entrance and Chinese 寂静庄园仆人入口 corroborate the servants entrance. Preserve the established Korean wording and pair the full English compound atomically; do not nest the separate Still Manor component.'
    }
  ].freeze
  EDIT_EVIDENCE = 'English is the identity anchor. The standalone residence is named Still Manor at base:1631/default:12629; Japanese Still Manor/スティル邸 and Chinese 寂静庄园/平静庄园 support the same place. Use 스틸 저택(Still Manor), correcting the nested/incomplete base label and retaining the already canonical default label. English also names distinct map labels Still Manor Guard Entrance and Still Manor Servants Entrance at base:1292/base:1886; aligned Japanese/Chinese corroborate their different users. Register each complete entrance as its own place label, pair the full English compound, and exclude the overlapping Still Manor component on those two rows. No other properties, ownership or relationships are inferred.'
  EVIDENCE = 'D-21804: English-led exact labels identify Still Manor and two separate entrance locations. The aligned Japanese and Chinese labels corroborate the residence and the guard/servants distinction. Use the established Korean stem and atomic bilingual labels; preserve the two compound entrance identities and do not add nested parentheses.'

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    prior = File.read(M::DOCS.first)[marker]
    raise 'D-21803 is not the active checkpoint' unless
      prior&.include?('Latest verified proper-name batch: D-21803 ')
    raise 'active checkpoint documents differ' unless
      M::DOCS.all? { |path| File.read(path)[marker] == prior }
    raise 'candidate output already exists' if File.exist?(DISPOSITIONS)

    inventory = M.refresh_inventory
    candidate = M.table(INPUT).map(&:to_h).find do |row|
      row.fetch('english_candidate') == 'Still Manor'
    end
    raise 'Still Manor candidate missing' unless candidate
    candidate_keys = (
      JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
      JSON.parse(candidate.fetch('paired_evidence_keys_json'))
    ).map { |parts| parts.map(&:to_s) }.uniq
    expected_candidate = CANDIDATE_GROUP.keys.map { |value| value.split(':', -1) }
    raise 'Still Manor candidate membership changed' unless
      candidate_keys.to_set == expected_candidate.to_set

    source_expectations = {
      ['base', '1292', '11'] => ['Still Manor Guard Entrance', '스틸 저택 경비 출입구'],
      ['base', '1631', '11'] => ['Still Manor', '스틸(Still) 저택'],
      ['base', '1886', '11'] => ['Still Manor Servants Entrance', '스틸 저택 하인 출입구'],
      ['default', '12629', ''] => ['Still Manor', '스틸 저택(Still Manor)']
    }
    source_expectations.each do |row_key, (english, korean)|
      source = inventory.fetch(row_key)
      raise "English source mismatch at #{row_key.inspect}" unless
        JSON.parse(source.fetch('en_texts_json')).compact.join("\n") == english
      raise "Korean source mismatch at #{row_key.inspect}" unless source.fetch('work_text') == korean
    end
    raise 'Still Manor glossary keys already exist' if
      M.table(File.join(__dir__, 'proper-name-glossary.tsv')).any? do |row|
        SPECS.any? { |spec| spec.fetch(:key) == row['entity_key'] }
      end

    ReviewedDiscoverySpecs.run(
      D, 'Still Manor Residence And Entrance Labels', SPECS, EDIT_EVIDENCE,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, row_key, text, _source|
      case spec.fetch(:key)
      when 'place:still-manor'
        if row_key == ['base', '1631', '11']
          raise 'base Still Manor text differs' unless text == '스틸(Still) 저택'
          ['스틸 저택(Still Manor)', false]
        elsif [GUARD_KEY, SERVANTS_KEY].include?(row_key)
          [text, true]
        elsif row_key == ['default', '12629', '']
          raise 'default Still Manor canonical changed' unless text == '스틸 저택(Still Manor)'
          [text, false]
        else
          raise "unexpected Still Manor key #{row_key.inspect}"
        end
      when 'place:still-manor-guard-entrance'
        raise 'unexpected guard entrance key' unless row_key == GUARD_KEY
        raise 'guard entrance Korean text differs' unless text == '스틸 저택 경비 출입구'
        ['스틸 저택 경비 출입구(Still Manor Guard Entrance)', false]
      when 'place:still-manor-servants-entrance'
        raise 'unexpected servants entrance key' unless row_key == SERVANTS_KEY
        raise 'servants entrance Korean text differs' unless text == '스틸 저택 하인 출입구'
        ['스틸 저택 하인 출입구(Still Manor Servants Entrance)', false]
      else
        raise "unexpected Still Manor entity #{spec.fetch(:key)}"
      end
    }

    refreshed = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    index_by_key = index.group_by { |row| key(row) }
    dispositions = candidate_keys.sort_by { |parts| [parts[0], parts[1].to_i, parts[2]] }.map do |parts|
      source = refreshed.fetch(parts)
      {
        'english_candidate' => 'Still Manor',
        'disposition' => CANDIDATE_GROUP.fetch(parts.join(':')),
        'resource' => parts[0], 'ID_Linha' => parts[1], 'Tipo_Variante' => parts[2],
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'), 'korean' => source.fetch('work_text'),
        'evidence' => "D-#{D}: #{EVIDENCE}",
        'prior_index_dispositions_json' => JSON.generate(
          index_by_key.fetch(parts, []).map do |row|
            [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
          end
        )
      }
    end
    M.write_table(DISPOSITIONS, HEADERS, dispositions)

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(refreshed.values, glossary, index)
    snapshot_path = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
    M.write_table(snapshot_path, ShortLabelDiscovery20261018::HEADERS, snapshot)
    remaining = snapshot.map { |row| row.fetch('english_candidate') }
    raise 'Still Manor compound candidates were not consumed by exact registrations' if
      %w[Still Manor Still Manor Guard Entrance Still Manor Servants Entrance].any? { |name| remaining.include?(name) }
    next_line = "Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first&.fetch('english_candidate', 'none')}`; not exhaustive or a completion estimate)."
    candidate_line = "Still Manor candidate memberships: 2 reviewed; 1 corrected and 1 already canonical. Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`. Two separately registered entrance labels were reviewed source-wide."
    M::DOCS.each do |path|
      text = File.read(path)
      block = text[marker]
      block = block.sub(/^Next batch:.*$/, next_line)
      block = block.sub(/^(Next batch:.*\n)/, "\\1#{candidate_line}\n")
      File.write(path, text.sub(marker, block))
    end
    note = <<~TEXT

      ## D-#{D}: Still Manor Candidate Membership Review

      Corrected base:1631 to `스틸 저택(Still Manor)`; default:12629 was
      already canonical. Separately reviewed and paired `Still Manor Guard
      Entrance` and `Still Manor Servants Entrance` as complete place labels.
      Their overlapping `Still Manor` component matches are excluded on the
      compound rows to avoid nested labels. Candidate dispositions:
      `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
    TEXT
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |name|
      path = File.join(__dir__, name)
      File.open(path, 'a') { |file| file.write(note) }
      text = File.read(path)
      File.write(path, text.sub(/^Next batch:.*$/, next_line))
    end
    %w[README.md decision-register-20261009.md].each do |name|
      File.open(File.join(__dir__, name), 'a') { |file| file.write(note) }
    end
    puts "D-#{D}: reviewed Still Manor and both entrance labels across 4 source keys; corrected 3 cells."
  end
end

ReviewStillManorD21804.run if $PROGRAM_NAME == __FILE__
