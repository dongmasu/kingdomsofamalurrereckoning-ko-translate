#!/usr/bin/env ruby

require 'digest'
require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module ReviewSylD21637
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_637
  PERSON = 'person:syl'
  PLACE = 'place:syl-hollow'
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  REPORT = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  ADDENDUM = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
  HEADERS = (M::HEADERS + %w[scope]).freeze

  KEYS = %w[7509 9918 14513 17547 24765 30641 36738 43207 47222 55176 59101]
    .map { |id| ['default', id, ''].freeze }.freeze
  PLACE_TERMINAL = {
    '7509' => 'not-an-issue',
    '14513' => 'accepted',
    '36738' => 'accepted'
  }.freeze
  PLACE_STATUS = {
    '7509' => 'not-an-issue',
    '9918' => 'accepted',
    '14513' => 'accepted',
    '17547' => 'not-an-issue',
    '24765' => 'excluded',
    '30641' => 'accepted',
    '36738' => 'accepted',
    '43207' => 'uncertain',
    '47222' => 'uncertain',
    '55176' => 'not-an-issue',
    '59101' => 'accepted'
  }.freeze
  PERSON_STATUS = {
    '7509' => 'excluded',
    '9918' => 'excluded',
    '14513' => 'excluded',
    '17547' => 'excluded',
    '24765' => 'accepted',
    '30641' => 'excluded',
    '36738' => 'excluded',
    '43207' => 'uncertain',
    '47222' => 'uncertain',
    '55176' => 'excluded',
    '59101' => 'excluded'
  }.freeze
  REPLACEMENTS = {
    '9918' => ['실에서만', '실(Syl)에서만'],
    '24765' => ['실의 시신', '실(Syl)의 시신'],
    '30641' => ['실의 움푹한 곳으로 가.', '실(Syl)의 움푹한 곳으로 가.'],
    '59101' => ['실에 있는', '실(Syl)에 있는']
  }.freeze
  PLACE_IDS = %w[9918 17547 24765 30641 43207 47222 55176 59101].freeze

  def source_inventory
    M.refresh_inventory
  end

  def exact_source_scope!(inventory)
    actual = inventory.values.each_with_object([]) do |source, matches|
      key = M.key(source)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      matches << key if english.match?(/(?<![A-Za-z])Syl(?![A-Za-z])/i)
    end.sort
    raise "Syl English source scope differs: #{actual.inspect}" unless actual == KEYS.sort
    raise 'Syl scope unexpectedly crosses resources' unless KEYS.all? { |key| key.first == 'default' }
  end

  def glossary_with_person(glossary)
    raise 'person:syl already exists' if glossary.any? { |row| row['entity_key'] == PERSON }
    place = glossary.find { |row| row['entity_key'] == PLACE }
    raise 'Syl Hollow glossary owner missing or duplicated' unless
      glossary.count { |row| row['entity_key'] == PLACE } == 1
    raise 'Syl Hollow canonical changed' unless
      place['english_canonical'] == 'Syl Hollow' &&
      place['korean_canonical'] == '실 할로우(Syl Hollow)'
    raise 'Syl must not be a global place alias' if
      place['english_aliases'].to_s.split('|').any? { |term| term.casecmp?('Syl') }

    place['evidence_ids'] =
      ([place['evidence_ids'].to_s, 'D-21637', *PLACE_IDS.map { |id| "default:#{id}" }]
        .reject(&:empty?).join('|').split('|').uniq).join('|')
    place['notes'] = [
      place['notes'],
      'D-21637 records Syl as a row-scoped place reference only in explicit Hollow-of-Syl contexts; Syl is not added as a global place alias because the corpus also uses it for a person and leaves two standalone labels unresolved.'
    ].reject(&:empty?).join(' ')

    person = {
      'entity_key' => PERSON,
      'english_canonical' => 'Syl',
      'category' => 'person',
      'korean_canonical' => '실(Syl)',
      'english_aliases' => '',
      'korean_variants' => '',
      'evidence_ids' => 'D-21637|default:24765',
      'status' => 'confirmed',
      'notes' => 'English default:24765 explicitly identifies Syl as a person whose corpse was found in the alley. Scope this personal-name identity only to that row; distinguish the separately named Syl Hollow place and do not infer biography or identity for the standalone labels default:43207/47222.'
    }
    glossary + [person]
  end

  def revised_text(id, text)
    replacement = REPLACEMENTS[id]
    return text unless replacement
    old, new_text = replacement
    raise "expected one reviewed Syl span at default:#{id}" unless text.scan(old).length == 1
    text.sub(old, new_text)
  end

  def build_reviews(inventory, index)
    KEYS.reject { |key| PLACE_TERMINAL.key?(key[1]) }.map do |key|
      source = inventory.fetch(key)
      id = key[1]
      existing = index.select { |row| M.key(row) == key }
      old = source.fetch('work_text')
      new_text = revised_text(id, old)
      dispositions = {
        PERSON => PERSON_STATUS.fetch(id),
        PLACE => PLACE_STATUS.fetch(id)
      }
      aggregate = if dispositions.value?('accepted')
                    'accepted'
                  elsif dispositions.value?('uncertain')
                    'uncertain'
                  elsif dispositions.values.all? { |status| status == 'excluded' }
                    'excluded'
                  else
                    'not-an-issue'
                  end
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => [PERSON, PLACE].join('|'),
        'status' => aggregate,
        'old' => old,
        'new' => new_text,
        'evidence' => "D-#{D}: English establishes Syl as the named person only at default:24765; explicit hollow references are the separate Syl Hollow place, while standalone default:43207/47222 do not resolve the referent. Japanese and Chinese are pronunciation/context checks. Entity dispositions: #{JSON.generate(dispositions)}. Existing same-row terminal decisions are preserved: #{JSON.generate(existing.to_h { |row| [row['entity_key'], row['status']] })}.",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => JSON.generate(existing.to_h { |row| [row['entity_key'], row['status']] }),
        'previous_evidence' => JSON.generate(existing.to_h { |row| [row['entity_key'], row['evidence']] }),
        'scope' => 'row-scoped-homonym'
      }
    end
  end

  def scoped_occurrence(entity, source, status, evidence, matched)
    [
      entity, source.fetch('resource'), source.fetch('ID_Linha'),
      source['Tipo_Variante'].to_s, matched,
      JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n"),
      source.fetch('work_text'), status, "D-#{D}: #{evidence}"
    ].zip(OCCURRENCE_HEADERS).to_h { |value, header| [header, value] }
  end

  def updated_index(index, inventory)
    updated = index.map(&:dup)
    inventory.each_value do |source|
      key = M.key(source)
      next unless KEYS.include?(key)
      updated.each do |row|
        row['korean_current'] = source.fetch('work_text') if M.key(row) == key
      end
    end

    person_rows = build_occurrences(inventory.values, [{
      'entity_key' => PERSON,
      'english_canonical' => 'Syl',
      'english_aliases' => ''
    }]).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    raise 'person Syl generated matches differ from the 11 reviewed rows' unless
      person_rows.map { |row| M.key(row) }.sort == KEYS.sort
    person_rows.each do |row|
      id = row.fetch('ID_Linha')
      row['status'] = PERSON_STATUS.fetch(id)
      row['evidence'] = case row['status']
                        when 'accepted'
                          "D-#{D}: English default:24765 identifies Syl as a person; Korean is paired as 실(Syl)."
                        when 'excluded'
                          "D-#{D}: This exact occurrence belongs to the separate Syl Hollow location or an explicit Hollow of Syl reference, not the person named in default:24765."
                        else
                          "D-#{D}: Standalone Syl label; English, Japanese and Chinese do not establish whether it is the person or the location."
                        end
    end

    place_rows = PLACE_IDS.map do |id|
      source = inventory.fetch(['default', id, ''])
      status = PLACE_STATUS.fetch(id)
      explanation = case status
                    when 'accepted'
                      "English explicitly places this reference in the Hollow of Syl; use the existing Syl Hollow place owner and pair Syl locally."
                    when 'not-an-issue'
                      "The row-scoped Syl place reference is already paired in Korean; retain the existing wording."
                    when 'excluded'
                      "English default:24765 identifies this occurrence as a person's corpse, not the Syl Hollow location."
                    else
                      "Standalone Syl label; the source does not resolve person versus place."
                    end
      scoped_occurrence(PLACE, source, status, explanation, 'Syl')
    end
    appended = person_rows + place_rows
    existing_keys = updated.map { |row| [row['entity_key'], *M.key(row)] }
    appended.each do |row|
      composite = [row['entity_key'], *M.key(row)]
      raise "duplicate Syl occurrence #{composite.inspect}" if existing_keys.include?(composite)
      existing_keys << composite
    end
    (updated + appended).sort_by do |row|
      [row['resource'], row['ID_Linha'].to_i, row['Tipo_Variante'].to_s, row['entity_key']]
    end
  end

  def update_candidate_status!
    candidates = M.table(R::DISCOVERY_CANDIDATES)
    candidates.each do |row|
      next unless row['english_candidate'].casecmp?('Syl')
      row['status'] = 'registered-reviewed'
    end
    M.write_table(R::DISCOVERY_CANDIDATES, candidates.headers, candidates.map(&:to_h))
  end

  def report_rows(reviews)
    reviews.map do |row|
      dispositions = JSON.parse(row.fetch('entity_dispositions_json'))
      "| `default:#{row['ID_Linha']}` | `#{dispositions[PERSON]}` / `#{dispositions[PLACE]}` | #{row['old'] == row['new'] ? 'unchanged' : 'Texto edited'} |"
    end.join("\n")
  end

  def latest_summary(reviews, checks, verify_output, inventory, index)
    counts = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
    index_counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    held = index.select { |row| row['status'] == 'uncertain' }
    candidates = M.table(R::DISCOVERY_CANDIDATES)
    candidate_counts = candidates.group_by { |row| row['status'] }.transform_values(&:length)
    checks_text = checks.map do |check|
      "- #{check[:resource]}: #{check[:cells]} cells; pre `#{check[:before_sha256]}`; post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    end.join("\n")
    backup_lines = checks.map do |check|
      "- #{check[:resource]}: #{check[:cells]} cells; pre `#{check[:before_sha256]}`; post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    end
    retained = File.read(M::DOCS.first)[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\n[A-Z]|\n<!--)/m, 1
    ].to_s
    backup_lines = (retained.lines + backup_lines).each_with_object({}) do |line, acc|
      resource = line[/\A- (\w+): \d+ cells; pre .*backup `/, 1]
      acc[resource] = line.strip if resource
    end
    last_backups = M::RESOURCES.map { |resource| backup_lines[resource] }.compact.join("\n")
    hashes = M.hashes.map { |resource, hash| "- #{resource}: `#{hash}`." }.join("\n")
    <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed 8 new Syl source keys across person/place scopes: #{counts.sort.inspect}; preserved three terminal `place:syl-hollow` rows from D-21219.
      Four default Texto cells were paired: person Syl only at default:24765; explicit Hollow-of-Syl place references remain row-scoped; default:43207/47222 remain uncertain and unchanged.
      Indexed matches: #{index.length}; #{index_counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')}.
      Reviewed unresolved indexed holds: #{held.length}, in #{held.map { |row| M.key(row) }.uniq.length} distinct CSV row keys. These are focused index states, not global translation totals.
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
      Next: D-21638 Coilsbane/Coilsbain row-scoped spelling review and D-21633 MendellerBirt history correction.
    TEXT
  end

  def append_register!(reviews)
    path = M::DOCS[3]
    register = File.read(path)
    heading = "## D-#{D}: Syl Person And Place Homonyms"
    raise 'D-21637 decision-register section already exists' if register.include?(heading)
    register << <<~TEXT

      #{heading}

      English-led source-scope review of all 11 exact `Syl` tokens across
      affix/base/default found 11 default keys. The identity is split by
      explicit context: `default:24765` refers to a person whose corpse was
      found in an alley; `default:9918`, `17547`, `30641`, `55176`, and `59101`
      refer to the Syl Hollow place. The three existing D-21219 place rows
      (`7509`, `14513`, `36738`) remain terminal and were not reopened.
      Standalone `default:43207` and `47222` remain uncertain. No global
      `Syl` alias was added to either entity.

      | Key | Person Syl | Syl Hollow place | Texto |
      | --- | --- | --- | --- |
      #{report_rows(reviews)}

      Exact EN/JA/ZH evidence and old/new Korean cells are in
      `proper-name-edits-D#{D}.tsv`. The person identity is scoped only to
      `default:24765`; no further biography or identity was inferred.
    TEXT
    File.write(path, register)
  end

  def write_reports!(reviews, summary, verify_output)
    File.write(REPORT, <<~TEXT)
      # D-#{D}: Syl Person And Place Homonyms

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      Scanned the exact English token `Syl` across all three resources and
      locales. The complete English scope is 11 default keys. Japanese and
      Chinese were checked as supporting pronunciation/context only.

      The English context distinguishes the person at `default:24765` from
      five explicit references to the Syl Hollow place. Three already
      terminal D-21219 place rows were preserved, not re-reviewed or
      recounted. The standalone labels at `default:43207` and `47222` do not
      establish person versus place and remain unchanged. No global `Syl`
      alias was added.

      | Key | Person disposition | Place disposition | Change |
      | --- | --- | --- | --- |
      #{report_rows(reviews)}
      | `default:7509` | excluded | not-an-issue | Preserved terminal D-21219 |
      | `default:14513` | excluded | accepted | Preserved terminal D-21219 |
      | `default:36738` | excluded | accepted | Preserved terminal D-21219 |

      ## Evidence And Validation

      The new `person:syl` glossary entry is limited to `default:24765`.
      Existing `place:syl-hollow` keeps its canonical `Syl Hollow` spelling;
      individual `Syl` matches are recorded only for the explicitly reviewed
      rows. The manifest contains aligned English, Japanese, Chinese, and
      previous/revised Korean values.

      #{verify_output.strip}

      The full edit addendum and active hashes are in
      [`named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md`](named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md).
      No PAK or PAK-derived material was consulted.
    TEXT
    File.write(ADDENDUM, <<~TEXT)
      # D-#{D} Edit Addendum

      #{summary}

      Existing terminal place dispositions were preserved. The occurrence
      index adds the person/place split for all exact Syl source keys, with
      place matches scoped to explicit locations and unresolved standalones
      retained as uncertain. The CSV verifier checks the BOM, mixed line
      endings, row order, target cells, every non-target byte, and inverse
      reconstruction against the byte-identical backup.
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
    inventory = source_inventory
    exact_source_scope!(inventory)
    glossary_table = M.table(R::GLOSSARY)
    index_table = M.table(M::INDEX)
    reviews = build_reviews(inventory, index_table.map(&:to_h))
    raise 'D-21637 expected eight new source keys' unless reviews.length == 8
    before_hashes = M.hashes
    glossary_bytes = File.binread(R::GLOSSARY)
    index_bytes = File.binread(M::INDEX)
    candidates_bytes = File.binread(R::DISCOVERY_CANDIDATES)

    edits = reviews.select { |row| row['old'] != row['new'] }
    raise 'D-21637 expected four Texto edits' unless edits.length == 4
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
      raise "post-edit Syl text mismatch #{M.key(row).inspect}" unless
        inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('new')
    end

    new_glossary = glossary_with_person(glossary_table.map(&:to_h))
    new_index = updated_index(index_table.map(&:to_h), inventory)
    M.write_table(R::GLOSSARY, glossary_table.headers, new_glossary)
    M.write_table(M::INDEX, index_table.headers, new_index)
    update_candidate_status!
    raise 'active CSV changed outside default' unless
      M.hashes.fetch('affix') == before_hashes.fetch('affix') &&
      M.hashes.fetch('base') == before_hashes.fetch('base')
    validate_output = M.command!('ruby', File.join(M::AUDIT, 'validate-proper-name-data.rb'))
    raise 'proper-name data validation failed' unless validate_output.include?('PASS')
    raise 'glossary/index changed during D-21637 preflight' if
      glossary_bytes == File.binread(R::GLOSSARY) && index_bytes == File.binread(M::INDEX)
    raise 'Syl candidate registration did not change candidate data' if
      candidates_bytes == File.binread(R::DISCOVERY_CANDIDATES) &&
      M.table(R::DISCOVERY_CANDIDATES).any? { |row| row['english_candidate'].casecmp?('Syl') && row['status'] != 'registered-reviewed' }

    final_inventory = M.refresh_inventory
    raise 'indexed Korean snapshots do not match active CSV' unless
      new_index.all? { |row| final_inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('korean_current') }
    summary = latest_summary(reviews, checks, verify_output, final_inventory.values, new_index)
    append_register!(reviews)
    write_reports!(reviews, summary, verify_output)
    replace_checkpoint!(summary)
    puts "Applied D-#{D}: 11 Syl source keys; 4 default Texto edits; 3 prior place rows preserved; 2 standalone holds retained."
    puts validate_output
  end
end

ReviewSylD21637.apply! if $PROGRAM_NAME == __FILE__
