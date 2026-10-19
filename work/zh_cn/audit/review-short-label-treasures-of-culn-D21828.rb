#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelTreasuresOfCulnD21828
  extend self

  M = ReviewedNameBatches
  D = 21_828
  LABEL = 'Treasures of Culn'
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21827.tsv')
  DISPOSITIONS = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante english
    japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  TARGETS = {
    ['default', '37145', ''] => {
      'english' => 'Treasures of Culn',
      'japanese' => 'カルンの財宝',
      'chinese' => '考伦的宝藏',
      'korean' => '컬른(Culn)의 보물'
    },
    ['default', '55278', ''] => {
      'english' =>
        "The Rathir authorities don't have to know. Keep this quiet and let me sail with this galley, and you can have the gold I received for the Treasures of Culn.",
      'japanese' =>
        'ラシーアの当局が知る必要はない。黙ってこのガレー船で行かせてくれ。そうすればカルンの財宝で手に入ったゴールドをやる',
      'chinese' =>
        '拉瑟里的当权者没必要知道。保持安静，让我驶着这艘帆船离开，你就能获得我从考伦的宝藏所获得的黄金。',
      'korean' =>
        '라시르(Rathir) 당국은 알 필요 없어. 입 다물고 이 갤리선으로 떠나게 해 주면, 컬른(Culn)의 보물(Treasures of Culn) 값으로 받은 금화를 네게 주지.'
    },
    ['default', '55323', ''] => {
      'english' =>
        "Cras' bodyguard Urlik has been ordered to kill me and protect his master's scheme to steal the Treasures of Culn from their owners. I now have to defeat Urlik in order to exact my revenge on his master Cras.",
      'japanese' =>
        'クルンの財宝を持ち主から盗むという計画のために、クラスは護衛のウルリクにこちらを殺すよう命じた。主人のクラスに復讐するには、まずウルリクを倒さねばならない。',
      'chinese' =>
        '克拉斯的保镖乌尔里克受命取走我的性命，不让他主人盗取考伦宝藏的计划被曝光。我必须击败乌尔里克，并向他的主人克拉斯发起复仇。',
      'korean' =>
        '크라스(Cras)의 경호원 울릭(Urlik)은 주인의 음모를 지키기 위해 날 죽이라는 명령을 받았다. 주인은 컬른(Culn)의 보물(Treasures of Culn)을 본래 소유자들에게서 훔치려 한다. 주인 크라스(Cras)에게 복수하려면 먼저 울릭(Urlik)을 쓰러뜨려야 한다.'
    }
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English uses the exact title-case label `Treasures of Culn` at
    default:37145 and refers to the same treasures in the two dialogue rows.
    Those lines establish a set of valuables associated with Culn: one says
    gold was received for them and the other says Cras planned to steal them
    from their owners. Japanese `カルン/クルンの財宝` and Chinese
    `考伦的宝藏/考伦宝藏` render treasures belonging to Culn but do not
    establish whether this is a formal item/set name, a quest objective, or
    descriptive wording. The English standalone capitalization alone does
    not resolve that classification. Record this candidate as uncertain and
    make no CSV, glossary, or occurrence-index change. Preserve the already
    paired narrative labels and the separate accepted `place:culn` finding at
    default:37145. Existing D-16712/default:55278, D-2791, D-6562 and related
    historical questions are not closed or recounted by this candidate review.
  TEXT

  def key(row)
    M.key(row)
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    docs = M::DOCS.to_h { |path| [path, File.read(path)] }
    prior_block = docs.fetch(M::DOCS.first)[marker]
    raise 'D-21827 checkpoint is not current' unless
      prior_block&.include?('Latest verified proper-name batch: D-21827 ')
    raise 'checkpoint documents differ' unless
      docs.values.all? { |text| text[marker] == prior_block }
    candidate = M.table(INPUT).map(&:to_h).find do |row|
      row.fetch('english_candidate') == LABEL
    end
    raise 'Treasures of Culn candidate missing' unless candidate
    unpaired = JSON.parse(candidate.fetch('unpaired_label_keys_json'))
      .map { |parts| parts.map(&:to_s) }
    paired = JSON.parse(candidate.fetch('paired_evidence_keys_json'))
      .map { |parts| parts.map(&:to_s) }
    raise "unexpected Treasures of Culn keys: #{unpaired.inspect}, #{paired.inspect}" unless
      unpaired == [['default', '37145', '']] &&
      paired == [['default', '55278', ''], ['default', '55323', '']]

    before_hashes = M.hashes
    index_hash = Digest::SHA256.file(M::INDEX).hexdigest
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_hash = Digest::SHA256.file(glossary_path).hexdigest
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    reviews = TARGETS.map do |source_key, expected|
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      korean = source.fetch('work_text')
      raise "unexpected English at #{source_key.inspect}" unless
        english == expected.fetch('english')
      raise "unexpected Japanese at #{source_key.inspect}" unless
        japanese == expected.fetch('japanese')
      raise "unexpected Chinese at #{source_key.inspect}" unless
        chinese == expected.fetch('chinese')
      raise "unexpected Korean at #{source_key.inspect}" unless
        korean == expected.fetch('korean')
      if source_key[1] == '37145'
        raise 'existing Culn entity ownership missing' unless
          candidate.fetch('existing_label_owners_json')
            .include?('"place:culn","accepted"')
      else
        raise 'expected previously paired narrative label' unless
          korean.include?("(#{LABEL})")
      end
      prior = index.select { |row| key(row) == source_key }.map do |row|
        [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
      end
      {
        'english_candidate' => LABEL,
        'disposition' => 'uncertain',
        'resource' => source_key[0],
        'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2],
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'korean' => korean,
        'evidence' => "#{EVIDENCE} Exact source key: #{source_key.join(':')}.",
        'prior_index_dispositions_json' => JSON.generate(prior)
      }
    end
    if File.exist?(DISPOSITIONS)
      existing = M.table(DISPOSITIONS).map(&:to_h)
      raise 'existing D-21828 dispositions differ from verified evidence' unless
        existing == reviews
    else
      M.write_table(DISPOSITIONS, HEADERS, reviews)
    end
    reviewed = ShortLabelDiscovery20261018.reviewed_dispositions
    snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, M.table(glossary_path).map(&:to_h), index,
      reviewed_dispositions: reviewed
    )
    raise 'uncertain candidate remains in the refreshed snapshot' if
      snapshot.any? { |row| row.fetch('english_candidate') == LABEL }
    raise 'candidate-only review changed CSV/index/glossary' unless
      M.hashes == before_hashes &&
      Digest::SHA256.file(M::INDEX).hexdigest == index_hash &&
      Digest::SHA256.file(glossary_path).hexdigest == glossary_hash
    if File.exist?(SNAPSHOT)
      existing = M.table(SNAPSHOT).map(&:to_h)
      raise 'existing D-21828 snapshot differs from regenerated candidate queue' unless
        existing == snapshot
    else
      M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    end

    status_counts = index.group_by { |row| row.fetch('status') }
      .transform_values(&:length)
    held_keys = index.select { |row| row.fetch('status') == 'uncertain' }
      .map { |row| key(row) }.uniq.length
    inventory_hash = Digest::SHA256.file(M::INVENTORY).hexdigest
    hashes = M.hashes
    glossary_count = M.table(glossary_path).length
    first = snapshot.first&.fetch('english_candidate', 'none') || 'none'
    next_line =
      "Next batch: D-#{D + 1}; continue refreshed short-label snapshot " \
      "`proper-name-short-label-discovery-D#{D}.tsv` " \
      "(#{snapshot.length} bounded groups; first `#{first}`; " \
      'not exhaustive or a completion estimate).'
    backup_section = prior_block[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n.*?(?=\nAligned inventory:)/m
    ]
    raise 'retained actual backup checkpoint missing' unless backup_section
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed 3 exact `Treasures of Culn` candidate keys: uncertain=3 in 3 distinct source keys; no named-item category was inferred.
      English describes a Culn-associated treasure set, but the available rows do not establish whether the label is a formal item/set name, quest objective, or descriptive wording. Japanese and Chinese support the treasure/place reading without resolving that classification. No CSV text, occurrence-index status, or glossary entry changed. Existing `place:culn` at default:37145 remains accepted.
      Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{first}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{status_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')} (unchanged).
      Remaining unreviewed indexed matches: #{index.count { |row| row['status'] == 'needs-context' }}, in #{index.select { |row| row['status'] == 'needs-context' }.map { |row| key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{status_counts.fetch('uncertain', 0)}, in #{held_keys} distinct CSV row keys.
      Candidate uncertainty is recorded separately from indexed entity holds and is not added to their counts. Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      No CSV edits in D-#{D}; no new pre-edit backup required. Retained last actual edit backups:
      #{backup_section.lines.drop(1).map(&:strip).join("\n")}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{inventory_hash}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{index_hash}` (unchanged).
      Proper-name glossary: #{glossary_count} entries; SHA-256 `#{glossary_hash}` (unchanged).
      Report: `work/zh_cn/audit/named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
      Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md`.
    TEXT
    replacement = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "checkpoint changed during D-#{D}: #{path}" unless text[marker] == prior_block
      text.sub!(marker, replacement)
      if path.end_with?('decision-register-20261009.md')
        text << <<~TEXT

          ## D-#{D}: Treasures of Culn Short-Label Hold

          Reviewed all three exact `Treasures of Culn` keys. English supports a
          specific treasure set associated with Culn, but does not settle
          whether it is a formal named item/set, quest objective, or descriptive
          phrase. Japanese and Chinese do not resolve that distinction. Keep all
          three candidate keys uncertain; add no glossary/index entity and make
          no CSV edit. The accepted `place:culn` row at default:37145 remains
          intact. D-16712/default:55278, D-2791, D-6562 and related historical
          findings are not closed or recounted.
        TEXT
      elsif path.end_with?('README.md')
        text << <<~TEXT

          ## D-#{D}: Treasures of Culn Short-Label Hold

          Reviewed the standalone label and both dialogue references. The
          treasure/place meaning is clear, but the source does not establish
          whether this is a named item/set or a quest/descriptive label. The
          candidate remains uncertain; no translation or index change was made.
        TEXT
      end
      File.write(path, text)
    end
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    details = reviews.map do |row|
      "- `#{key(row).join(':')}`: EN `#{row.fetch('english')}`; " \
        "JA `#{row.fetch('japanese')}`; ZH `#{row.fetch('chinese')}`; " \
        "KO `#{row.fetch('korean')}` (uncertain; unchanged)."
    end.join("\n")
    report_text = <<~TEXT
      # D-#{D}: Treasures of Culn Short-Label Review

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Aligned Source Evidence

      #{EVIDENCE}

      ### Reviewed Rows

      #{details}

      Existing D-16712/default:55278, D-2791, D-6562 and related findings
      remain unresolved and are not recounted. The existing accepted
      `place:culn` occurrence is retained separately.
    TEXT
    File.write(report, report_text)
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      No CSV, glossary, or occurrence-index change was made. D-#{D} records
      three uncertain short-label candidate keys and refreshes the bounded
      candidate queue. The uncertainty concerns classification of the
      `Treasures of Culn` phrase, not the already accepted `place:culn` name.

      #{summary}

      ## Aligned Rows

      #{details}

      #{EVIDENCE}
    TEXT
    puts "D-#{D}: reviewed #{reviews.length} keys as uncertain; no CSV/index/glossary changes; next=#{first}; candidate groups=#{snapshot.length}."
  end
end

ReviewShortLabelTreasuresOfCulnD21828.run if $PROGRAM_NAME == __FILE__
