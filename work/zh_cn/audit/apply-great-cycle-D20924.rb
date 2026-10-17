#!/usr/bin/env ruby

require 'csv'
require 'digest'
require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'

module ApplyGreatCycleD20924
  extend self

  M = ReviewedNameBatches
  D = 20_924
  ENTITY = 'lore:great-cycle'
  GLOSSARY = File.join(M::AUDIT, 'proper-name-glossary.tsv')
  MANIFEST = File.join(M::AUDIT, "proper-name-edits-D#{D}.tsv")
  BACKUP = "/private/tmp/ko-translate-backups/20261015/before-proper-name-D#{D}"
  CANONICAL = '위대한 순환(Great Cycle)'
  TERM_PATTERN = /(?:위대한\s*대순환|위대한\s*순환|대순환|대원환)(?:\((?:The )?Great Cycle\))?/i
  DOCS = [
    File.join(M::ROOT, 'NEXT-SESSION.md'),
    File.join(M::ROOT, 'work/zh_cn/TRANSLATION_PROGRESS.md'),
    File.join(M::AUDIT, 'README.md'),
    File.join(M::AUDIT, 'decision-register-20261009.md')
  ].freeze
  ANWON_KEYS = %w[10747 27523 42674 49434 57733].freeze

  def row_key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def entity_key(row)
    [row.fetch('entity_key'), *row_key(row)]
  end

  def replacement(id, old)
    if id == '4828'
      expected = '대주기의 한 순환을 마칠 때마다'
      raise 'unexpected ID 4828 Korean source' unless old.include?(expected)
      return old.sub(expected, '위대한 순환(Great Cycle)이 한 차례 돌 때마다')
    end
    old.gsub(TERM_PATTERN, CANONICAL)
  end

  def source_rows(inventory)
    inventory.values.select do |row|
      row['resource'] == 'default' &&
        JSON.parse(row.fetch('en_texts_json')).compact.join("\n").match?(/Great Cycle/i)
    end.sort_by { |row| [row.fetch('ID_Linha').to_i, row.fetch('ID_Linha')] }
  end

  def build_reviews(inventory)
    rows = source_rows(inventory)
    raise "expected 75 Great Cycle rows, found #{rows.length}" unless rows.length == 75
    rows.map do |source|
      old = source.fetch('work_text')
      new_text = replacement(source.fetch('ID_Linha'), old)
      raise "no Korean term found at #{row_key(source).inspect}" unless new_text.include?(CANONICAL)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => 'default',
        'ID_Linha' => source.fetch('ID_Linha'),
        'Tipo_Variante' => source['Tipo_Variante'].to_s,
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => 'English explicitly identifies the named Great Cycle; Japanese 大円環 and Chinese 伟大轮回 corroborate the concept. Use the later D-19613/D-19617 canonical Korean 위대한 순환 and pair the English name once per occurrence. Generic seasonal cycles and standalone Cycle wording are outside this exact-phrase scope.',
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => JSON.generate(ENTITY => 'needs-context'),
        'previous_evidence' => JSON.generate(ENTITY => 'Candidate hit from the English source; verify this occurrence in context.')
      }
    end.tap do |reviews|
      statuses = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
      raise "unexpected review disposition split #{statuses.inspect}" unless
        statuses == { 'accepted' => 71, 'not-an-issue' => 4 }
      raise 'duplicate Great Cycle source key' unless reviews.map { |row| row_key(row) }.uniq.length == 75
    end
  end

  def preserve_and_add_index(inventory, reviews)
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
      additions.length == 75 && additions.all? { |key| key.first == ENTITY }

    review_by_key = reviews.to_h { |row| [[ENTITY, *row_key(row)], row] }
    raise 'new entity keys do not match reviewed source rows' unless
      (additions - review_by_key.keys).empty? && (review_by_key.keys - additions).empty?

    merged = generated.map(&:to_h).map do |candidate|
      key = entity_key(candidate)
      if previous = old_by_key[key]
        candidate['status'] = previous.fetch('status')
        candidate['evidence'] = previous.fetch('evidence')
      else
        review = review_by_key.fetch(key)
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
    raise 'unexpected generated candidate count' unless generated.length == 26_098
    raise 'unexpected merged occurrence count' unless merged.length == 26_103
    M.write_table(M::INDEX, old_index.headers, merged)
  end

  def write_current_checkpoint(reviews, checks, verify_output, inventory)
    index = M.table(M::INDEX)
    counts = index.group_by { |row| row['status'] }.transform_values(&:length)
    held = index.select { |row| row['status'] == 'uncertain' }
    unreviewed = index.select { |row| row['status'] == 'needs-context' }
    last = reviews.last
    integrity = checks.map do |check|
      "- #{check[:resource]}: #{check[:cells]} cells; pre `#{check[:before_sha256]}`; post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    end.join("\n")
    hash_lines = M.hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    counts_text = counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (2026-10-15).
      Reviewed #{reviews.length} distinct resource/ID/variant keys: {"accepted"=>71, "not-an-issue"=>4}.
      Groups: {"#{ENTITY}"=>75}. Last reviewed key: #{row_key(last).join(':')} / #{ENTITY}.
      Next batch: D-#{D + 1}; continue source discovery from unreviewed proper-name candidates. Do not revisit the 18 existing uncertain occurrences without new evidence.
      Indexed matches: #{index.length}; #{counts_text}.
      Remaining unreviewed indexed matches: #{unreviewed.length}, in #{unreviewed.map { |row| row_key(row) }.uniq.length} distinct CSV row keys.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |row| row_key(row) }.uniq.length} distinct CSV row keys.
      If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
      These are focused entity/row index states, not global translation totals.
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`; #{index.length - ANWON_KEYS.length} generated matches plus five documented Anwon context rows.
      Proper-name glossary: #{M.table(GLOSSARY).length} entries; SHA-256 `#{Digest::SHA256.file(GLOSSARY).hexdigest}`.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hash_lines}
      Last batch pre-edit backups and byte validation:
      #{integrity}
      #{verify_output.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{integrity}
      Report: `work/zh_cn/audit/named-scope-review-D#{D}-20261015.md`.
      Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D#{D}-20261015.md`.
      Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D#{D}.tsv`.
    TEXT
    DOCS.each do |path|
      text = File.read(path)
      block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
      raise "missing checkpoint markers in #{path}" unless
        text.sub!(/<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m, block)
      File.write(path, text)
    end
    summary
  end

  def write_report(reviews, checks, verify_output, summary)
    report = File.join(M::AUDIT, "named-scope-review-D#{D}-20261015.md")
    addendum = File.join(M::AUDIT, "named-scope-edit-addendum-D#{D}-20261015.md")
    File.write(report, <<~TEXT)
      # D-#{D}: Great Cycle Glossary Standardization

      Date: 2026-10-15

      ## Scope and Decision

      Reviewed all 75 distinct `default` row keys whose English source contains
      the exact named term `Great Cycle`. English is the meaning anchor;
      Japanese uses `大円環` and Chinese uses `伟大轮回`, corroborating the
      same Fae cosmological cycle involving death, rebirth, seasons, and
      magical balance. The official Korean manual's extracted text and
      reference were searched; they do not provide a direct Korean rendering
      for this lore concept.

      D-19550 locally preferred `대순환` at ID 62899 by reference to D-3787,
      but the later D-19613 and D-19617 reviews explicitly established
      `위대한 순환` as the corpus form. This pass follows those later decisions
      and registers `lore:great-cycle` as `위대한 순환(Great Cycle)`.
      Observed alternatives `대순환`, `대주기`, `대원환`, and
      `위대한 대순환` are recorded as Korean variants, not canonical forms.
      Generic seasonal/natural cycles and standalone `Cycle` wording were not
      inferred from this exact-phrase search.

      Corrected 71 `Texto` cells and retained four already-canonical cells as
      `not-an-issue`. ID 4828's `대주기의 한 순환을 마칠 때마다` was recast
      as `위대한 순환(Great Cycle)이 한 차례 돌 때마다` to preserve the
      source's meaning while making the named term explicit. Repeated
      Great Cycle mentions inside a reviewed cell were normalized together.
      These are focused glossary dispositions; historical sequential-review
      totals and exact-key findings were not recounted or changed.

      ## Integrity

      - Active default before: `#{checks.fetch(0)[:before_sha256]}`.
      - Active default after: `#{checks.fetch(0)[:after_sha256]}`.
      - Byte-identical pre-edit backup: `#{checks.fetch(0)[:backup]}`.
      - The independent verifier confirmed 65,135 ordered rows, target
        `Texto` values, BOM, mixed line endings, unchanged non-target bytes,
        and byte-for-byte inverse reconstruction.
      - The occurrence index preserves all prior dispositions and five
        contextual Anwon-family records; it adds 75 reviewed Great Cycle
        matches. No global translation tally was changed.
      - `src/csv/` was read-only. No PAK or PAK-derived resource was inspected.

      See [`proper-name-edits-D#{D}.tsv`](proper-name-edits-D#{D}.tsv) for
      all aligned English/Japanese/Chinese/Korean cells, and
      [`proper-name-glossary.tsv`](proper-name-glossary.tsv) /
      [`proper-name-occurrences.tsv`](proper-name-occurrences.tsv) for the
      canonical entry and reviewed match index.
    TEXT
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      #{summary}

      `ProperNameCellEditor` applied only the 71 accepted `Texto` cells after
      validating the byte-identical backup. The independent verifier reported:

      #{verify_output.strip}

      The four remaining rows were already exactly `위대한 순환(Great Cycle)`.
      The indexed scope consists of 75 new `lore:great-cycle` matches; all
      earlier entity dispositions and the five documented Anwon context rows
      were preserved.
    TEXT
  end

  def register_decision
    path = File.join(M::AUDIT, 'decision-register-20261009.md')
    text = File.read(path)
    heading = "## D-#{D}: Great Cycle Glossary Standardization"
    return if text.include?(heading)
    anchor = "## D-20822-D-20828: Proper-Name Continuation"
    raise 'decision-register insertion point missing' unless text.include?(anchor)
    entry = <<~TEXT
      #{heading}

      Registered `Great Cycle` as `lore:great-cycle`, canonical
      `위대한 순환(Great Cycle)`. Reviewed 75 default row keys: 71 accepted
      terminology/annotation edits and four already-canonical
      `not-an-issue`. English identifies the named Fae cosmological cycle;
      Japanese `大円環` and Chinese `伟大轮回` corroborate. D-19550's local
      `대순환` choice is superseded for this standardization by later
      D-19613/D-19617 decisions establishing `위대한 순환`. No prior exact-key
      dispositions or historical global totals were recounted. Generic
      seasonal cycles and standalone `Cycle` aliases remain outside scope.
      See [report](named-scope-review-D#{D}-20261015.md),
      [addendum](named-scope-edit-addendum-D#{D}-20261015.md), and
      [manifest](proper-name-edits-D#{D}.tsv).

      #{anchor}
    TEXT
    text.sub!(anchor, entry)
    File.write(path, text)
  end

  def run
    raise "batch already exists for D-#{D}" if File.exist?(File.join(M::AUDIT, "named-scope-review-D#{D}-20261015.md"))
    glossary = M.table(GLOSSARY)
    entry = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'Great Cycle glossary entry missing or incorrect' unless
      entry && entry['korean_canonical'] == CANONICAL && entry['english_canonical'] == 'Great Cycle'

    inventory = M.refresh_inventory
    reviews = build_reviews(inventory)
    M.write_table(MANIFEST, M::HEADERS, reviews)
    checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, BACKUP, M.hashes)
    raise 'expected exactly one default CSV edit set' unless checks.length == 1 && checks.first[:resource] == 'default'
    verify_output = M.command!('ruby', File.join(M::AUDIT, 'verify-proper-name-edits.rb'),
                               '--review', MANIFEST, '--backup-dir', BACKUP)
    inventory = M.refresh_inventory
    reviews.each do |review|
      raise "post-edit text mismatch #{row_key(review).inspect}" unless
        inventory.fetch(row_key(review)).fetch('work_text') == review.fetch('new')
    end
    preserve_and_add_index(inventory, reviews)
    summary = write_current_checkpoint(reviews, checks, verify_output, inventory)
    write_report(reviews, checks, verify_output, summary)
    register_decision
    puts summary
    puts "D-#{D}: completed #{reviews.length} source-aligned keys; #{checks.first[:cells]} CSV cells edited."
  end
end

ApplyGreatCycleD20924.run if $PROGRAM_NAME == __FILE__
