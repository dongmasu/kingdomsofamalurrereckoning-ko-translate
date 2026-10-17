#!/usr/bin/env ruby

require 'csv'
require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module ApplyVictoryGamesD20925
  extend self

  M = ReviewedNameBatches
  D = 20_925
  ENTITY = 'event:victory-games'
  GLOSSARY = File.join(M::AUDIT, 'proper-name-glossary.tsv')
  MANIFEST = File.join(M::AUDIT, "proper-name-edits-D#{D}.tsv")
  BACKUP = "/private/tmp/ko-translate-backups/20261015/before-proper-name-D#{D}"
  CANONICAL = '승리의 경기(Victory Games)'
  VARIANT_PATTERN = /(?:빅토리\s*게임즈|빅토리\s*게임|승리\s*게임즈|승리\s*게임|승리의\s*게임|승리\s*대회|승리의\s*경기)(?:\((?:The )?Victory Games\))?/i
  ANWON_KEYS = %w[10747 27523 42674 49434 57733].freeze
  DOCS = [
    File.join(M::ROOT, 'NEXT-SESSION.md'),
    File.join(M::ROOT, 'work/zh_cn/TRANSLATION_PROGRESS.md'),
    File.join(M::AUDIT, 'README.md'),
    File.join(M::AUDIT, 'decision-register-20261009.md')
  ].freeze

  def row_key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def entity_key(row)
    [row.fetch('entity_key'), *row_key(row)]
  end

  def replacement(old)
    text = old.dup
    text.gsub!('승리의 경기장(Victory Games)', '승리의 경기(Victory Games) 경기장')
    text.gsub!('승리의 경기 대회 VIP 패스', '승리의 경기(Victory Games) VIP 패스')
    text.gsub!('승리의 경기 대회에 참가', '승리의 경기(Victory Games)에 참가')
    text.gsub!('승리의 경기들은', '승리의 경기(Victory Games)는')
    text.gsub!(VARIANT_PATTERN, CANONICAL)
    { '은' => '는', '이' => '가', '을' => '를', '으로' => '로' }.each do |old_particle, new_particle|
      text.gsub!(/#{Regexp.escape(CANONICAL)}#{old_particle}(?=\s|[.,!?]|$)/, "#{CANONICAL}#{new_particle}")
    end
    text
  end

  def build_reviews(inventory)
    rows = inventory.values.select do |row|
      JSON.parse(row.fetch('en_texts_json')).compact.join("\n")
        .match?(/(?<![A-Za-z])Victory Games(?![A-Za-z])/i)
    end.sort_by { |row| [row.fetch('ID_Linha').to_i, row.fetch('ID_Linha')] }
    raise "expected 37 Victory Games rows, found #{rows.length}" unless rows.length == 37
    rows.map do |source|
      old = source.fetch('work_text')
      compound_title = row_key(source) == ['base', '62', '11']
      new_text = compound_title ? old : replacement(old)
      if compound_title
        status = 'excluded'
        evidence = 'The complete base label is Victory Games Star, a separate compound/title candidate rather than a standalone event reference. Keep the full source phrase atomic and defer its dedicated title decision to D-20926.'
      else
        raise "unexpected resource for event reference #{row_key(source).inspect}" unless source['resource'] == 'default'
        raise "no Korean event label at #{row_key(source).inspect}" unless new_text.include?(CANONICAL)
        status = old == new_text ? 'not-an-issue' : 'accepted'
        evidence = 'English identifies the named House of Valor annual/touring combat competition; Japanese ビクトリーゲームズ and Chinese 胜利大赛 corroborate. Standardize the event as 승리의 경기(Victory Games), preserving surrounding sentence grammar. Ordinary games, matches, arenas, and compound titles are not broad aliases.'
      end
      {
        'resource' => source.fetch('resource'),
        'ID_Linha' => source.fetch('ID_Linha'),
        'Tipo_Variante' => source['Tipo_Variante'].to_s,
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => evidence,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => JSON.generate(ENTITY => 'needs-context'),
        'previous_evidence' => JSON.generate(ENTITY => 'Candidate hit from the English source; verify this occurrence in context.')
      }
    end.tap do |reviews|
      raise 'duplicate Victory Games source key' unless reviews.map { |row| row_key(row) }.uniq.length == reviews.length
    end
  end

  def update_index(inventory, reviews)
    generated_path = "/private/tmp/proper-name-occurrences-post-D#{D}.tsv"
    M.command!('ruby', File.join(M::AUDIT, 'build-proper-name-occurrences.rb'),
               '--glossary', GLOSSARY, '--inventory', M::INVENTORY, '--out', generated_path)
    old_index = M.table(M::INDEX)
    generated = M.table(generated_path)
    old_by_key = old_index.to_h { |row| [entity_key(row), row.to_h] }
    generated_by_key = generated.to_h { |row| [entity_key(row), row.to_h] }
    raise 'duplicate active occurrence key' unless old_by_key.length == old_index.length
    raise 'duplicate generated occurrence key' unless generated_by_key.length == generated.length

    absent = old_by_key.keys - generated_by_key.keys
    expected_absent = ANWON_KEYS.map { |id| ['faction:house-anwon', 'default', id, ''] }
    raise "unexpected prior contextual rows #{absent.inspect}" unless absent.sort == expected_absent.sort
    additions = generated_by_key.keys - old_by_key.keys
    raise "unexpected generated additions #{additions.length}" unless
      additions.length == 37 && additions.all? { |key| key.first == ENTITY }
    reviews_by_key = reviews.to_h { |row| [[ENTITY, *row_key(row)], row] }
    raise 'review keys differ from generated event matches' unless
      (additions - reviews_by_key.keys).empty? && (reviews_by_key.keys - additions).empty?

    merged = generated.map(&:to_h).map do |candidate|
      key = entity_key(candidate)
      if previous = old_by_key[key]
        candidate['status'] = previous.fetch('status')
        candidate['evidence'] = previous.fetch('evidence')
      else
        review = reviews_by_key.fetch(key)
        candidate['status'] = review.fetch('status')
        candidate['evidence'] = "D-#{D}: #{review.fetch('evidence')}"
      end
      candidate['korean_current'] = inventory.fetch(row_key(candidate)).fetch('work_text')
      candidate
    end
    absent.each do |key|
      row = old_by_key.fetch(key).dup
      row['korean_current'] = inventory.fetch(row_key(row)).fetch('work_text')
      raise "stale contextual Anwon row #{key.inspect}" unless
        row['korean_current'] == old_by_key.fetch(key).fetch('korean_current')
      merged << row
    end
    merged.sort_by! do |row|
      [row.fetch('resource'), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end
    raise 'unexpected generated candidate count' unless generated.length == 26_135
    raise 'unexpected merged occurrence count' unless merged.length == 26_140
    M.write_table(M::INDEX, old_index.headers, merged)
  end

  def checkpoint(reviews, checks, verification, inventory)
    index = M.table(M::INDEX)
    counts = index.group_by { |row| row['status'] }.transform_values(&:length)
    pending = index.select { |row| row['status'] == 'needs-context' }
    held = index.select { |row| row['status'] == 'uncertain' }
    statuses = reviews.group_by { |row| row['status'] }.transform_values(&:length)
    last = reviews.last
    integrity = checks.map do |check|
      "- #{check[:resource]}: #{check[:cells]} cells; pre `#{check[:before_sha256]}`; post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    end.join("\n")
    csv_hashes = M.hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    count_text = counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (2026-10-15).
      Reviewed #{reviews.length} distinct resource/ID/variant keys: #{statuses.inspect}.
      Groups: {"#{ENTITY}"=>#{reviews.length}}. Last reviewed key: #{row_key(last).join(':')} / #{ENTITY}.
      Next batch: D-#{D + 1}; continue source discovery from unreviewed proper-name candidates. Do not revisit the 18 existing uncertain occurrences without new evidence.
      Indexed matches: #{index.length}; #{count_text}.
      Remaining unreviewed indexed matches: #{pending.length}, in #{pending.map { |row| row_key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |row| row_key(row) }.uniq.length} distinct CSV row keys.
      If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
      These are focused entity/row index states, not global translation totals.
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`; #{index.length - ANWON_KEYS.length} generated matches plus five documented Anwon context rows.
      Proper-name glossary: #{M.table(GLOSSARY).length} entries; SHA-256 `#{Digest::SHA256.file(GLOSSARY).hexdigest}`.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{csv_hashes}
      Last batch pre-edit backups and byte validation:
      #{integrity}
      #{verification.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{integrity}
      Report: `work/zh_cn/audit/named-scope-review-D#{D}-20261015.md`.
      Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D#{D}-20261015.md`.
      Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D#{D}.tsv`.
    TEXT
    DOCS.each do |path|
      text = File.read(path)
      block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
      raise "checkpoint markers missing in #{path}" unless
        text.sub!(/<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m, block)
      File.write(path, text)
    end
    summary
  end

  def write_report(reviews, check, verification, summary)
    File.write(File.join(M::AUDIT, "named-scope-review-D#{D}-20261015.md"), <<~TEXT)
      # D-#{D}: Victory Games Event Standardization

      Date: 2026-10-15

      ## Scope and Decision

      Reviewed 37 distinct row keys whose English source contains the name
      `Victory Games`: 36 standalone `default` event references and one
      out-of-scope compound `base` title. English identifies the House of Valor's
      annual, touring combat competition; Japanese consistently uses
      `ビクトリーゲームズ`, and Chinese `胜利大赛` corroborates the event.
      Context includes arena access, event rounds, passes, prizes, scheduling,
      and its public entertainment purpose.

      Registered `event:victory-games` with canonical Korean
      `승리의 경기(Victory Games)`. Corrected #{check[:cells]} cells, retained
      already-canonical event references as `not-an-issue`, and excluded
      `base:62:11` (`Victory Games Star`) from event-only normalization so its
      complete title can be reviewed atomically next. Context-specific edits preserve arena, round, event,
      annual, and participation grammar; they do not turn ordinary matches,
      games, or arenas into aliases. Prior exact-key decisions and historical
      global translation tallies were not recounted or changed.

      ## Integrity

      - Active default before: `#{check[:before_sha256]}`.
      - Active default after: `#{check[:after_sha256]}`.
      - Byte-identical pre-edit backup: `#{check[:backup]}`.
      - The independent verifier checked 65,135 ordered rows, target `Texto`
        values, BOM, mixed line endings, unchanged non-target bytes, and
        byte-for-byte inverse reconstruction.
      - The occurrence index preserves prior dispositions and five
        contextual Anwon-family records while adding 37 reviewed event-scope
        matches. No global tally changed.
      - `src/csv/` was read-only. No PAK or PAK-derived resource was inspected.

      The [manifest](proper-name-edits-D#{D}.tsv) contains aligned source and
      target cells. See also the [glossary](proper-name-glossary.tsv) and
      [occurrence index](proper-name-occurrences.tsv).
    TEXT
    File.write(File.join(M::AUDIT, "named-scope-edit-addendum-D#{D}-20261015.md"), <<~TEXT)
      # D-#{D} Edit Addendum

      #{summary}

      The byte-preserving editor applied the accepted target cells after
      creating and verifying the exact backup. Independent verification:

      #{verification.strip}

      Existing occurrence-index dispositions and contextual Anwon rows were
      preserved; only the 37 new `event:victory-games` matches were added.
    TEXT
  end

  def register
    path = File.join(M::AUDIT, 'decision-register-20261009.md')
    text = File.read(path)
    heading = "## D-#{D}: Victory Games Event Standardization"
    return if text.include?(heading)
    anchor = "## D-20822-D-20828: Proper-Name Continuation"
    entry = <<~TEXT
      #{heading}

      Registered `Victory Games` as `event:victory-games`, canonical
      `승리의 경기(Victory Games)`. Reviewed 36 standalone default event rows;
      `base:62:11` (`Victory Games Star`) was excluded as a separate compound
      title for atomic review in D-20926. English identifies the House of Valor's annual touring
      combat competition; Japanese `ビクトリーゲームズ` and Chinese
      `胜利大赛` corroborate. Ordinary games, individual matches, and arenas
      are not broad aliases. Existing exact-key findings and global
      translation totals were not recounted. See
      [report](named-scope-review-D#{D}-20261015.md),
      [addendum](named-scope-edit-addendum-D#{D}-20261015.md), and
      [manifest](proper-name-edits-D#{D}.tsv).

      #{anchor}
    TEXT
    raise 'decision register insertion point missing' unless text.sub!(anchor, entry)
    File.write(path, text)
  end

  def update_audit_readme
    path = File.join(M::AUDIT, 'README.md')
    text = File.read(path)
    heading = "## D-#{D}: Victory Games Event Standardization"
    return if text.include?(heading)
    anchor = '## Historical Focused Checkpoint (D-20409, 2026-10-15; Proper Names)'
    entry = <<~TEXT
      #{heading}

      Registered `Victory Games` as `event:victory-games` / `승리의 경기(Victory Games)`.
      Reviewed 36 default event references and excluded one compound base
      title for its own atomic review; no prior exact-key findings were
      reopened. See the
      [review](named-scope-review-D#{D}-20261015.md),
      [addendum](named-scope-edit-addendum-D#{D}-20261015.md), and
      [row manifest](proper-name-edits-D#{D}.tsv).

      #{anchor}
    TEXT
    raise 'audit README insertion point missing' unless text.sub!(anchor, entry)
    File.write(path, text)
  end

  def run
    raise "batch already exists for D-#{D}" if File.exist?(File.join(M::AUDIT, "named-scope-review-D#{D}-20261015.md"))
    glossary = M.table(GLOSSARY)
    entry = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'Victory Games glossary entry missing or incorrect' unless
      entry && entry['english_canonical'] == 'Victory Games' &&
      entry['korean_canonical'] == CANONICAL && entry['category'] == 'named event'

    inventory = M.refresh_inventory
    reviews = build_reviews(inventory)
    M.write_table(MANIFEST, M::HEADERS, reviews)
    checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, BACKUP, M.hashes)
    raise 'expected only default CSV edits' unless checks.length == 1 && checks.first[:resource] == 'default'
    verification = M.command!('ruby', File.join(M::AUDIT, 'verify-proper-name-edits.rb'),
                              '--review', MANIFEST, '--backup-dir', BACKUP)
    inventory = M.refresh_inventory
    reviews.each do |review|
      raise "post-edit mismatch #{row_key(review).inspect}" unless
        inventory.fetch(row_key(review)).fetch('work_text') == review.fetch('new')
    end
    update_index(inventory, reviews)
    summary = checkpoint(reviews, checks, verification, inventory)
    write_report(reviews, checks.first, verification, summary)
    register
    update_audit_readme
    puts summary
    puts "D-#{D}: reviewed #{reviews.length} event rows; edited #{checks.first[:cells]} cells."
  end
end

ApplyVictoryGamesD20925.run if $PROGRAM_NAME == __FILE__
