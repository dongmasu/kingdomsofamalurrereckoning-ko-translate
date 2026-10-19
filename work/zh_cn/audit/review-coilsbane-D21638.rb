#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module ReviewCoilsbaneD21638
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_638
  PLACE = 'place:coilsbain'
  CAVERN = 'place:coilsbain-cavern'
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  REPORT = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  ADDENDUM = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  HEADERS = (M::HEADERS + %w[scope]).freeze
  KEYS = %w[30165 33116 62903].map { |id| ['default', id, ''].freeze }.freeze
  SPECS = {
    '30165' => {
      'owner' => PLACE, 'matched' => 'Coilsbane',
      'old_part' => '코일스베인', 'new_part' => '코일스베인(Coilsbane)',
      'status' => 'accepted',
      'evidence' => 'A standalone English map/location label. D-19777 resolved Coilsbane versus Coilsbain as an English-source spelling inconsistency and established Korean 코일스베인; preserve this row’s actual English spelling in the local bilingual label, without adding a global alias.'
    },
    '33116' => {
      'owner' => PLACE, 'matched' => 'Coilsbane',
      'old_part' => '코일스베인(Coilsbane)', 'new_part' => '코일스베인(Coilsbane)',
      'status' => 'not-an-issue',
      'evidence' => 'This standalone label already preserves the exact source spelling Coilsbane in Korean parentheses. Retain it under the existing Coilsbain place owner as a row-scoped source spelling; no alias is added.'
    },
    '62903' => {
      'owner' => CAVERN, 'matched' => 'Coilsbane Caverns',
      'old_part' => '코일스베인 동굴로 들어가기',
      'new_part' => '코일스베인 동굴(Coilsbane Caverns)로 들어가기',
      'status' => 'accepted',
      'evidence' => 'The English objective names Coilsbane Caverns. The aligned Japanese/Chinese identify the same cave. Reuse the existing Coilsbain Cavern(s) owner and keep this source misspelling row-scoped; do not merge the separate Coilsbain Ruins entity.'
    }
  }.freeze

  def exact_scope!(inventory)
    actual = inventory.values.each_with_object([]) do |source, matches|
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      matches << M.key(source) if english.match?(/(?<![A-Za-z])Coilsbane(?![A-Za-z])/)
    end.sort
    raise "Coilsbane source scope differs: #{actual.inspect}" unless actual == KEYS.sort
  end

  def revise(source, spec)
    text = source.fetch('work_text')
    raise 'unexpected current Coilsbane cell' unless text.include?(spec.fetch('old_part'))
    raise 'multiple Coilsbane target spans' unless text.scan(spec.fetch('old_part')).length == 1
    text.sub(spec.fetch('old_part'), spec.fetch('new_part'))
  end

  def glossary_rows(glossary)
    owners = glossary.to_h { |row| [row.fetch('entity_key'), row] }
    parent = owners.fetch(PLACE)
    cavern = owners.fetch(CAVERN)
    raise 'Coilsbain canonical changed' unless
      parent['english_canonical'] == 'Coilsbain' &&
      parent['korean_canonical'] == '코일스베인(Coilsbain)'
    raise 'Coilsbain Cavern owner changed' unless
      cavern['english_canonical'] == 'Coilsbain Cavern' &&
      cavern['english_aliases'].to_s.split('|').include?('Coilsbain Caverns')
    raise 'global Coilsbane alias already exists' if
      glossary.any? do |row|
        [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
          .any? { |term| term.casecmp?('Coilsbane') || term.casecmp?('Coilsbane Caverns') }
      end

    {
      PLACE => [
        parent,
        %w[D-21638 default:30165 default:33116],
        'D-21638 records the source spelling Coilsbane only on exact reviewed rows 30165/33116. The glossary canonical remains Coilsbain; no global Coilsbane alias is introduced.'
      ],
      CAVERN => [
        cavern,
        %w[D-21638 default:62903],
        'D-21638 records the exact source spelling Coilsbane Caverns only at default:62903 under this existing cavern owner. Do not add a global Coilsbane Caverns alias or merge the separately indexed Coilsbain Ruins.'
      ]
    }.each do |_key, (row, additions, note)|
      row['evidence_ids'] =
        (row['evidence_ids'].to_s.split('|') + additions).reject(&:empty?).uniq.join('|')
      row['notes'] = [row['notes'], note].reject(&:empty?).join(' ')
    end
    glossary
  end

  def build_reviews(inventory, index)
    KEYS.map do |key|
      source = inventory.fetch(key)
      id = key[1]
      spec = SPECS.fetch(id)
      old = source.fetch('work_text')
      new_text = revise(source, spec)
      existing = index.select { |row| M.key(row) == key }
      raise "existing Coilsbane owner occurrence requires reconciliation at #{key.inspect}" unless existing.empty?
      {
        'resource' => key[0],
        'ID_Linha' => id,
        'Tipo_Variante' => '',
        'entity_key' => spec.fetch('owner'),
        'status' => spec.fetch('status'),
        'old' => old,
        'new' => new_text,
        'evidence' => spec.fetch('evidence'),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(spec.fetch('owner') => spec.fetch('status')),
        'previous_status' => '{}',
        'previous_evidence' => '{}',
        'scope' => 'row-scoped-source-spelling'
      }
    end
  end

  def occurrence(review, source)
    values = [
      review.fetch('entity_key'), review.fetch('resource'), review.fetch('ID_Linha'),
      review.fetch('Tipo_Variante'), SPECS.fetch(review.fetch('ID_Linha')).fetch('matched'),
      JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n"),
      source.fetch('work_text'), review.fetch('status'),
      "D-#{D}: #{review.fetch('evidence')}"
    ]
    OCCURRENCE_HEADERS.zip(values).to_h
  end

  def update_candidate_status!
    candidates = M.table(R::DISCOVERY_CANDIDATES)
    candidates.each do |row|
      next unless %w[Coilsbane Coilsbane Caverns].any? do |term|
        row['english_candidate'].casecmp?(term)
      end
      row['status'] = 'registered-reviewed'
    end
    M.write_table(R::DISCOVERY_CANDIDATES, candidates.headers, candidates.map(&:to_h))
  end

  def updated_index(index, reviews, inventory)
    output = index.map(&:dup)
    reviews.each do |review|
      key = M.key(review)
      output.each do |row|
        row['korean_current'] = inventory.fetch(key).fetch('work_text') if M.key(row) == key
      end
      output << occurrence(review, inventory.fetch(key))
    end
    composite = output.map { |row| [row['entity_key'], *M.key(row)] }
    raise 'duplicate occurrence key after Coilsbane review' unless composite.uniq.length == composite.length
    output.sort_by do |row|
      [row['resource'], row['ID_Linha'].to_i, row['Tipo_Variante'].to_s, row['entity_key']]
    end
  end

  def summary(reviews, checks, verify_output, inventory, index)
    counts = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
    index_counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    holds = index.select { |row| row['status'] == 'uncertain' }
    candidates = M.table(R::DISCOVERY_CANDIDATES)
    candidate_counts = candidates.group_by { |row| row['status'] }.transform_values(&:length)
    hashes = M.hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    checks_text = checks.map do |check|
      "- #{check[:resource]}: #{check[:cells]} cells; pre `#{check[:before_sha256]}`; post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    end.join("\n")
    retained = File.read(M::DOCS.first)[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\n[A-Z]|\n<!--)/m, 1
    ].to_s
    backup_lines = (retained.lines + checks_text.lines).each_with_object({}) do |line, acc|
      resource = line[/\A- (\w+): \d+ cells; pre .*backup `/, 1]
      acc[resource] = line.strip if resource
    end
    last_backups = M::RESOURCES.map { |resource| backup_lines[resource] }.compact.join("\n")
    <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed three exact Coilsbane/Coilsbane Caverns source keys: #{counts.sort.inspect}. Canonical `Coilsbain`, `Coilsbain Caverns`, and the distinct `Coilsbain Ruins` owner remain separate; source misspellings are row-scoped, not global aliases.
      Two default Texto cells were edited; default:33116 was already paired and retained.
      D-21633's uncertain note for default:32170 `MendellerBirt` is corrected by this history addendum only: terminal D-19797 `not-an-issue` stands; the key was not reopened or counted.
      Indexed matches: #{index.length}; #{index_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}.
      Reviewed unresolved indexed holds: #{holds.length}, in #{holds.map { |row| M.key(row) }.uniq.length} distinct CSV row keys. These are focused index states, not global translation totals.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Machine-generated proper-name candidate list: #{candidates.length} terms; registered-reviewed=#{candidate_counts.fetch('registered-reviewed', 0)}, heuristic-not-reviewed=#{candidate_counts.fetch('heuristic-not-reviewed', 0)}. The list is not exhaustive.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Active CSV SHA-256:
      #{hashes}
      Last batch pre-edit backups and byte validation:
      #{checks_text}
      #{verify_output.strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{last_backups}
      Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{M.table(R::GLOSSARY).length} entries; SHA-256 `#{Digest::SHA256.file(R::GLOSSARY).hexdigest}`.
      Report: `work/zh_cn/audit/#{File.basename(REPORT)}`.
      Addendum: `work/zh_cn/audit/#{File.basename(ADDENDUM)}`.
      Exact source comparison manifest: `work/zh_cn/audit/#{File.basename(MANIFEST)}`.
      Next: run a fresh all-resource English residual discovery scan; review new exact source families without reopening terminal keys or counting historical totals.
    TEXT
  end

  def report_rows(reviews)
    reviews.map do |row|
      action = row['old'] == row['new'] ? 'already paired; retained' : 'Texto edited'
      "| `default:#{row['ID_Linha']}` | `#{row['english']}` | #{row['status']} | #{action} |"
    end.join("\n")
  end

  def append_register!(reviews)
    path = M::DOCS[3]
    register = File.read(path)
    heading = "## D-#{D}: Coilsbane Source Spellings And MendellerBirt History Correction"
    raise 'D-21638 decision-register section already exists' if register.include?(heading)
    register << <<~TEXT

      #{heading}

      | Key | English source | Disposition | Decision |
      | --- | --- | --- | --- |
      #{report_rows(reviews)}

      D-19777's terminal `Coilsbane`/`Coilsbain` source-spelling decision is
      preserved. Korean follows the established `코일스베인` form, while the
      exact English source spelling is paired only on each reviewed row.
      `default:62903` belongs to the existing `place:coilsbain-cavern`
      compound; the distinct `place:coilsbain-ruins` entry is untouched.

      **MendellerBirt reconciliation:** D-19797 already closed
      `default:32170` as `not-an-issue`: Korean spacing does not invent a
      source-name boundary. D-21633 later recorded an uncertainty for the
      same key without new evidence; that duplicate uncertainty is withdrawn
      as an invalid reopen. D-19797 remains terminal, the active text
      `멘델러 버트` is unchanged, and no space is inserted in the English
      source or glossary.
    TEXT
    File.write(path, register)
  end

  def write_reports!(reviews, summary, verify_output)
    File.write(REPORT, <<~TEXT)
      # D-#{D}: Coilsbane Source Spellings And MendellerBirt History Correction

      Date: #{M::RUN_DATE_ISO}

      ## Coilsbane

      English source spelling and existing indexed owners were checked
      against the aligned Japanese and Chinese cells and the D-19777,
      D-20096, and D-21186 decisions.

      | Key | English | Disposition | Change |
      | --- | --- | --- | --- |
      #{report_rows(reviews)}

      Keep the accepted canonical `Coilsbain` owner, the distinct
      `Coilsbain Cavern(s)` owner, and the separate `Coilsbain Ruins` owner.
      The source misspellings `Coilsbane` and `Coilsbane Caverns` are paired
      only at the exact reviewed rows; neither is added as a global glossary
      alias.

      ## MendellerBirt Correction

      D-19797 already terminally dispositioned `default:32170` as
      `not-an-issue`. D-21633's later uncertainty is withdrawn as a duplicate
      reopen without new evidence. The existing Korean `멘델러 버트` is
      retained; no CSV edit, new alias, or glossary entry is made for this
      historical reconciliation.

      ## Evidence

      Aligned English, Japanese, Chinese, and previous/revised Korean cells
      are recorded in `proper-name-edits-D#{D}.tsv`. No PAK material was
      consulted.
    TEXT
    File.write(ADDENDUM, <<~TEXT)
      # D-#{D} Edit Addendum

      #{summary}

      #{verify_output.strip}

      The D-21633/D-19797 MendellerBirt conflict was corrected in the decision
      history without reopening the terminal D-19797 row or changing the CSV.
    TEXT
  end

  def replace_checkpoint!(summary)
    block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "missing checkpoint marker in #{path}" unless
        text.sub!(/<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m, block)
      File.write(path, text)
    end
  end

  def apply!
    R.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    exact_scope!(inventory)
    glossary_table = M.table(R::GLOSSARY)
    index_table = M.table(M::INDEX)
    reviews = build_reviews(inventory, index_table.map(&:to_h))
    raise 'D-21638 scope count differs' unless reviews.length == 3
    before_hashes = M.hashes
    edits = reviews.select { |row| row['old'] != row['new'] }
    raise 'D-21638 expected exactly two Texto edits' unless edits.length == 2
    edits.each do |row|
      ProperNameCellEditor.prepare(
        File.binread(M.csv_path('default')),
        [row.slice('resource', 'ID_Linha', 'Tipo_Variante', 'old', 'new')]
      )
    end
    M.write_table(MANIFEST, HEADERS, reviews)
    backup = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, backup, before_hashes)
    verify_output = M.command!(
      'ruby', File.join(M::AUDIT, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', backup
    )
    inventory = M.refresh_inventory
    reviews.each do |row|
      raise "post-edit Coilsbane text mismatch #{M.key(row).inspect}" unless
        inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('new')
    end
    new_glossary = glossary_rows(glossary_table.map(&:to_h))
    new_index = updated_index(index_table.map(&:to_h), reviews, inventory)
    M.write_table(R::GLOSSARY, glossary_table.headers, new_glossary)
    M.write_table(M::INDEX, index_table.headers, new_index)
    update_candidate_status!
    validate_output = M.command!('ruby', File.join(M::AUDIT, 'validate-proper-name-data.rb'))
    raise 'proper-name data validation failed' unless validate_output.include?('PASS')
    final_inventory = M.refresh_inventory
    raise 'indexed Korean snapshots do not match active CSV' unless
      new_index.all? { |row| final_inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('korean_current') }
    summary = summary(reviews, checks, verify_output, final_inventory.values, new_index)
    append_register!(reviews)
    write_reports!(reviews, summary, [verify_output, validate_output].join("\n"))
    replace_checkpoint!(summary)
    puts "Applied D-#{D}: 3 Coilsbane source rows; 2 Texto edits; D-19797 MendellerBirt terminal disposition preserved."
    puts validate_output
  end
end

ReviewCoilsbaneD21638.apply! if $PROGRAM_NAME == __FILE__
