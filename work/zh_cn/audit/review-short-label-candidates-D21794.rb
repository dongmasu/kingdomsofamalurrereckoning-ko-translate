#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-short-label-discovery-20261018'

module ReviewShortLabelCandidatesD21794
  extend self

  M = ReviewedNameBatches
  D = 21_794
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21793.tsv')
  CANDIDATES = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  MANIFEST = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
  HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  ENTITIES = {
    'Sir Airmer' => {
      key: 'person:airmer', count: 20,
      evidence: 'English uses the complete knight name Sir Airmer; Japanese サー・エアマー and Chinese 艾尔梅尔爵士 corroborate. Preserve the existing person:airmer owner and standardize only this complete source form to 에어머 경(Sir Airmer). Do not register a duplicate person or change prior entity statuses.'
    },
    'Sir Farrara' => {
      key: 'person:farrara', count: 25,
      evidence: 'English uses the complete knight name Sir Farrara; Japanese サー・ファララ and Chinese 法拉拉爵士 corroborate. Preserve the existing person:farrara owner and standardize only this complete source form to 파라라 경(Sir Farrara), including repeated references within a row. Do not register a duplicate person or change prior entity statuses.'
    },
    'Sister Zelda' => {
      key: 'person:zelda', count: 15,
      evidence: 'English identifies Sister Zelda; Japanese シスター・ゼルダ and Chinese 塞尔达修女 corroborate. Preserve the existing person:zelda owner and standardize incomplete name/title pairs to 젤다 수녀(Sister Zelda). A complete compound label such as Crazy Sister Zelda remains atomic.'
    }
  }.freeze
  REPLACEMENTS = {
    ['Sir Airmer', '24246'] => ['에어머(Airmer) 경', '에어머 경(Sir Airmer)'],
    ['Sir Airmer', '25411'] => ['시르 에어머(Airmer)', '에어머 경(Sir Airmer)'],
    ['Sir Airmer', '32578'] => ['에어머(Airmer) 경', '에어머 경(Sir Airmer)'],
    ['Sir Airmer', '34416'] => ['에어머(Airmer) 경', '에어머 경(Sir Airmer)'],
    ['Sir Airmer', '38222'] => ['에어머(Airmer) 경', '에어머 경(Sir Airmer)'],
    ['Sir Airmer', '38294'] => ['에어머(Airmer) 경', '에어머 경(Sir Airmer)'],
    ['Sir Airmer', '38793'] => ['에어머(Airmer) 경', '에어머 경(Sir Airmer)'],
    ['Sir Airmer', '39796'] => ['에어머(Airmer) 경', '에어머 경(Sir Airmer)'],
    ['Sir Airmer', '43172'] => ['에어머(Airmer) 경', '에어머 경(Sir Airmer)'],
    ['Sir Airmer', '47557'] => ['에어머(Airmer) 경', '에어머 경(Sir Airmer)'],
    ['Sir Airmer', '47708'] => ['에어머(Airmer) 경', '에어머 경(Sir Airmer)'],
    ['Sir Airmer', '49793'] => ['에어머(Airmer) 경', '에어머 경(Sir Airmer)'],
    ['Sir Airmer', '50339'] => ['에어머(Airmer) 경', '에어머 경(Sir Airmer)'],
    ['Sir Airmer', '58159'] => ['에어머(Airmer) 경', '에어머 경(Sir Airmer)'],
    ['Sir Airmer', '59636'] => ['에어머(Airmer) 경', '에어머 경(Sir Airmer)'],
    ['Sir Farrara', '4149'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '17986'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '19885'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '20989'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '21218'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '24755'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '26329'] => ['시르 파라라(Farrara)', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '29590'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '31620'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '32856'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '33531'] => ['위대한 파라라(Farrara) 경', '위대한 파라라 경(Sir Farrara)'],
    ['Sir Farrara', '34994'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '35224'] => ['세이르 파라라(Farrara)', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '36016'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '38667'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '43185'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '47056'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '57337'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sir Farrara', '61455'] => ['파라라(Farrara) 경', '파라라 경(Sir Farrara)'],
    ['Sister Zelda', '2880'] => ['젤다(Zelda) 수녀', '젤다 수녀(Sister Zelda)'],
    ['Sister Zelda', '14105'] => ['젤다(Zelda) 수녀', '젤다 수녀(Sister Zelda)'],
    ['Sister Zelda', '29112'] => ['젤다(Zelda) 수녀', '젤다 수녀(Sister Zelda)'],
    ['Sister Zelda', '30932'] => ['젤다(Zelda) 수녀', '젤다 수녀(Sister Zelda)']
  }.freeze

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def candidate_keys(row)
    %w[unpaired_label_keys_json paired_evidence_keys_json].flat_map do |field|
      JSON.parse(row.fetch(field)).map { |parts| parts.map(&:to_s) }
    end.uniq
  end

  def source_matches(inventory)
    ENTITIES.to_h do |term, definition|
      pattern = /(?<![A-Za-z0-9])#{Regexp.escape(term)}(?![A-Za-z0-9])/i
      rows = inventory.values.select do |row|
        JSON.parse(row.fetch('en_texts_json')).compact.any? { |text| text.match?(pattern) }
      end
      raise "#{term} full-source coverage differs: #{rows.length}" unless
        rows.length == definition.fetch(:count)
      [term, rows.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }]
    end
  end

  def transformed_text(term, row, old)
    replacement = REPLACEMENTS[[term, row.fetch('ID_Linha')]]
    return old unless replacement

    before, after = replacement
    count = old.scan(Regexp.new(Regexp.escape(before))).length
    raise "expected one reviewed span for #{term}/#{row.fetch('ID_Linha')}, got #{count}" unless count == 1
    old.sub(before, after)
  end

  def reviews(inventory, index)
    source_matches(inventory).flat_map do |term, rows|
      entity = ENTITIES.fetch(term).fetch(:key)
      rows.map do |source|
        row_key = key(source)
        owners = index.select { |entry| key(entry) == row_key && entry['entity_key'] == entity }
        raise "existing owner #{entity} missing at #{row_key.inspect}" unless owners.length == 1
        raise "unreviewed prior owner #{entity} at #{row_key.inspect}" if owners.first['status'] == 'needs-context'
        old = source.fetch('work_text')
        new_text = transformed_text(term, source, old)
        {
          'resource' => row_key[0], 'ID_Linha' => row_key[1], 'Tipo_Variante' => row_key[2],
          'entity_key' => entity, 'status' => old == new_text ? 'not-an-issue' : 'accepted',
          'old' => old, 'new' => new_text,
          'evidence' => ENTITIES.fetch(term).fetch(:evidence),
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'),
          'entity_dispositions_json' => JSON.generate(entity => (old == new_text ? 'not-an-issue' : 'accepted')),
          'previous_status' => JSON.generate(entity => owners.first.fetch('status')),
          'previous_evidence' => JSON.generate(entity => owners.first.fetch('evidence'))
        }
      end
    end
  end

  def candidate_reviews(candidate_rows, inventory, index, row_reviews)
    changes = row_reviews.to_h { |row| [key(row), row.fetch('old') != row.fetch('new')] }
    candidate_rows.flat_map do |candidate|
      term = candidate.fetch('english_candidate')
      candidate_keys(candidate).map do |parts|
        resource, id, variant = parts
        row_key = [resource, id, variant]
        source = inventory.fetch(row_key)
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        pattern = /(?<![A-Za-z0-9])#{Regexp.escape(term)}(?![A-Za-z0-9])/i
        raise "candidate source missing #{term}/#{row_key.inspect}" unless english.match?(pattern)
        accepted = changes.fetch(row_key, false)
        {
          'english_candidate' => term,
          'disposition' => accepted ? 'accepted' : 'not-an-issue',
          'resource' => resource, 'ID_Linha' => id, 'Tipo_Variante' => variant,
          'english' => english,
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
          'chinese' => source.fetch('zh_text'), 'korean' => source.fetch('work_text'),
          'evidence' => "D-#{D}: #{ENTITIES.fetch(term).fetch(:evidence)}",
          'prior_index_dispositions_json' => JSON.generate(
            index.select { |entry| key(entry) == row_key }.map do |entry|
              [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')]
            end
          )
        }
      end
    end
  end

  def update_docs(snapshot, checks, index)
    hashes = M.hashes
    counts = index.group_by { |row| row.fetch('status') }.transform_values(&:length)
    status_text = counts.sort.map { |status, count| "#{status}=#{count}" }.join(', ')
    check_lines = checks.map do |check|
      "- #{check.fetch(:resource)}: #{check.fetch(:cells)} cells; pre `#{check.fetch(:before_sha256)}`; post `#{check.fetch(:after_sha256)}`; backup `#{check.fetch(:backup)}`."
    end.join("\n")
    retained_block = File.read(M::DOCS.first)[
      /Last actual CSV-edit backups \(retained across no-edit batches\):\n(.*?)(?=\nAligned inventory:)/m, 1
    ]
    raise 'could not preserve prior last-edit backup records' unless retained_block
    merged = (retained_block.lines + check_lines.lines).each_with_object({}) do |line, result|
      resource = line[/\A- (\w+): \d+ cells; pre .*backup `/, 1]
      result[resource] = line.strip if resource
    end
    last_backups = M::RESOURCES.map { |resource| merged[resource] }.compact.join("\n")
    summary = <<~TEXT
      Latest verified proper-name batch: D-#{D} (#{M::RUN_DATE_ISO}).
      Reviewed every exact English source occurrence of Sir Airmer (20 rows), Sir Farrara (25 rows), and Sister Zelda (15 rows): 60 distinct source keys; corrected #{checks.sum { |check| check.fetch(:cells) }} Texto cells to complete Korean (English title/name) labels.
      Existing person:airmer, person:farrara, and person:zelda glossary/index owners and all prior statuses/evidence remain unchanged; no new entity or cumulative match was added.
      Short-label candidate memberships: #{candidate_rows_count} reviewed; #{candidate_accept_count} accepted corrections and #{candidate_not_issue_count} already canonical. Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`.
      Next batch: D-#{D + 1}; continue the refreshed short-label candidate snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first&.fetch('english_candidate', 'none')}`; not exhaustive or a completion estimate).
      Indexed matches: #{index.length}; #{status_text}.
      Remaining unreviewed indexed matches: 0; reviewed unresolved indexed holds: #{index.count { |row| row.fetch('status') == 'uncertain' }}. These focused index counts do not measure discovery remaining.
      Sequential default review through ID 65134 remains completed and is not recounted.
      Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
      Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D#{D}.tsv`.
      Active CSV SHA-256:
      - affix: `#{hashes.fetch('affix')}`.
      - base: `#{hashes.fetch('base')}`.
      - default: `#{hashes.fetch('default')}`.
      Last batch pre-edit backup and byte validation:
      #{check_lines}
      #{M.command!('ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
                   '--review', MANIFEST, '--backup-dir', "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}").strip}
      Last actual CSV-edit backups (retained across no-edit batches):
      #{last_backups}
      Aligned inventory: 73430 rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      Occurrence index: #{index.length} rows; SHA-256 `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      Proper-name glossary: #{M.table(File.join(__dir__, 'proper-name-glossary.tsv')).length} entries; SHA-256 `#{Digest::SHA256.file(File.join(__dir__, 'proper-name-glossary.tsv')).hexdigest}` (unchanged).
      Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D#{D}.tsv`.
    TEXT

    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->\n/m
    block = "<!-- current-proper-name-batch:start -->\n## Latest Verified Proper-Name Batch\n\n#{summary}<!-- current-proper-name-batch:end -->\n"
    M::DOCS.each do |path|
      text = File.read(path)
      raise "active checkpoint missing from #{path}" unless text.match?(marker)
      File.write(path, text.sub(marker, block))
    end
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    File.write(report, <<~TEXT)
      # D-#{D}: Knight And Cleric Full-Title Pairing

      Date: #{M::RUN_DATE_ISO}

      ## Scope

      #{summary}

      ## Evidence And Preservation

      English is the anchor for each complete title/name; aligned Japanese and Chinese are retained in the row manifest as pronunciation and supporting checks. Correct only the source-supported complete forms to `에어머 경(Sir Airmer)`, `파라라 경(Sir Farrara)`, and `젤다 수녀(Sister Zelda)`. The full-source search covered all 60 exact English source rows, not only the short-label candidates. Preserve complete compound `Crazy Sister Zelda` as an atomic label.

      Existing person entity ownership, index status/evidence, unrelated wording, tokens, particles, and line endings were preserved. No prior translation decision or historical total was reopened or recounted.
    TEXT
    File.write(addendum, <<~TEXT)
      # D-#{D} Edit Addendum

      #{summary}

      The byte-preserving editor and independent verifier checked byte-identical pre-edit backup, BOM, mixed line endings, headers, row count/order, exact target cells, unchanged non-target bytes, and inverse reconstruction. Only `Texto` cells listed as changed in the manifest were edited.
    TEXT
  end

  def candidate_rows_count
    @candidate_rows_count
  end

  def candidate_accept_count
    @candidate_accept_count
  end

  def candidate_not_issue_count
    @candidate_not_issue_count
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    prior_block = File.read(M::DOCS.first)[marker]
    raise 'D-21793 is not the active checkpoint' unless
      prior_block&.include?('Latest verified proper-name batch: D-21793 ')
    raise 'checkpoint documents differ' unless
      M::DOCS.all? { |path| File.read(path)[marker] == prior_block }
    output_paths = [
      CANDIDATES, SNAPSHOT, MANIFEST,
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ]
    raise "D-#{D} output already exists" if output_paths.any? { |path| File.exist?(path) }

    before_hashes = M.hashes
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    inputs = M.table(INPUT).map(&:to_h)
    candidate_rows = inputs.first(3)
    raise 'candidate prefix changed' unless
      candidate_rows.map { |row| row.fetch('english_candidate') } ==
        ['Sir Airmer', 'Sir Farrara', 'Sister Zelda']
    row_reviews = reviews(inventory, index)
    raise 'expected 60 exact source rows' unless row_reviews.length == 60
    raise 'unexpected text-change count' unless row_reviews.count { |row| row['old'] != row['new'] } == 38
    raise 'duplicate review source keys' unless row_reviews.map { |row| key(row) }.uniq.length == row_reviews.length
    raise 'unexpected resource scope' unless row_reviews.map { |row| row['resource'] }.uniq == ['default']
    M.write_table(MANIFEST, M::HEADERS, row_reviews)

    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, backup_dir, before_hashes)
    raise 'expected only the 38 reviewed default cells' unless
      checks.length == 1 && checks.first.fetch(:resource) == 'default' &&
      checks.first.fetch(:cells) == 38

    inventory = M.refresh_inventory
    actual_index = M.table(M::INDEX).map(&:to_h)
    before_index = actual_index.map(&:dup)
    changed_keys = row_reviews.select { |row| row['old'] != row['new'] }
                              .map { |row| key(row) }.to_set
    actual_index.each do |row|
      row['korean_current'] = inventory.fetch(key(row)).fetch('work_text') if
        changed_keys.include?(key(row))
    end
    M.write_table(M::INDEX, M.table(M::INDEX).headers, actual_index)
    reread_index = M.table(M::INDEX).map(&:to_h)
    raise 'index status/evidence or non-target fields changed' unless
      before_index.zip(reread_index).all? do |before, after|
        before.all? { |field, value| field == 'korean_current' || after[field] == value } &&
          (changed_keys.include?(key(before)) ||
           before['korean_current'] == after['korean_current'])
      end

    candidate_dispositions = candidate_reviews(
      candidate_rows, inventory, before_index, row_reviews
    )
    raise 'expected 36 short-label memberships' unless candidate_dispositions.length == 36
    @candidate_rows_count = candidate_dispositions.length
    @candidate_accept_count = candidate_dispositions.count { |row| row['disposition'] == 'accepted' }
    @candidate_not_issue_count = candidate_dispositions.count { |row| row['disposition'] == 'not-an-issue' }
    raise 'short-label candidate disposition counts differ' unless
      [@candidate_accept_count, @candidate_not_issue_count] == [15, 21]
    M.write_table(CANDIDATES, HEADERS, candidate_dispositions)

    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, glossary, reread_index
    )
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)

    verification = M.command!(
      'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', backup_dir
    )
    raise 'byte-preserving verification failed' unless verification.include?('PASS')
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    raise "proper-name validation failed: #{validation}" unless validation.include?('PASS')
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise "residual audit failed: #{residual}" unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0')
    raise 'unexpected resource changed' unless
      M.hashes.fetch('affix') == before_hashes.fetch('affix') &&
      M.hashes.fetch('base') == before_hashes.fetch('base')
    update_docs(snapshot, checks, reread_index)
    puts "D-#{D}: reviewed 60 exact source rows, corrected 38 cells, preserved all index statuses; reviewed 36 title-label memberships; next candidates=#{snapshot.length}."
  end
end

ReviewShortLabelCandidatesD21794.run if $PROGRAM_NAME == __FILE__
