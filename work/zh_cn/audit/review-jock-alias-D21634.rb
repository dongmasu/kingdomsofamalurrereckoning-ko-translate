#!/usr/bin/env ruby

require 'json'
require 'tempfile'
require_relative 'apply-reviewed-proper-name-discovery'

module ReviewJockAliasD21634
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_634
  ENTITY = 'person:jock-macnelly'
  ALIAS = 'Jock'
  KOREAN = '조크'
  GLOSSARY = R::GLOSSARY
  INDEX = M::INDEX

  SHORT_KEYS = %w[10371 17669 37175 38304 58470 63949 64870 63443]
    .map { |id| ['default', id, ''].freeze }.freeze
  FULL_KEYS = %w[2870 21954 45521 46217 56710 56769]
    .map { |id| ['default', id, ''].freeze }.freeze
  EXPECTED_PRIOR_STATUS = {
    '2870' => 'not-an-issue',
    '21954' => 'not-an-issue',
    '45521' => 'not-an-issue',
    '46217' => 'accepted',
    '56710' => 'not-an-issue',
    '56769' => 'not-an-issue'
  }.freeze
  EXPECTED_TEXT = {
    '10371' => ['조크', '조크(Jock)'],
    '17669' => ['조크(Jock)', '조크(Jock)'],
    '37175' => ['조크', '조크(Jock)'],
    '38304' => ['조크', '조크(Jock)'],
    '58470' => ['조크', '조크(Jock)'],
    '63949' => ['조크(Jock)', '조크(Jock)'],
    '64870' => ['조크', '조크(Jock)'],
    '63443' => ['{*1조크}', '{*1조크}(Jock)']
  }.freeze

  EVIDENCE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    D-21634 scoped supersession/addendum to the D-21259 alias note:
    D-21259 correctly declined a bare Jock alias on the full-name evidence
    then available. New English default:37175 introduces Jock as Skald's
    apprentice, default:64870 explicitly calls him the speaker's apprentice,
    and default:63443 identifies {*1Jock} as Skald's apprentice. Together with
    D-21259's full-name crafting contexts, these role-linked sources support
    Jock as the short-name alias of the existing person:jock-macnelly entity.
    Japanese ジョック and Chinese 乔克 corroborate the short name. This
    addendum applies only to the eight listed default rows; it retains the
    original D-21259 note, full-name decisions, and every unrelated entity
    disposition. Pair only the local Korean name as 조크(Jock), keeping the
    marker bytes unchanged and placing the annotation outside the marker.
  TEXT

  def key_string(key)
    key.join(':')
  end

  def append_values(old, values)
    (old.to_s.split('|').reject(&:empty?) + values).uniq.join('|')
  end

  def updated_owner(glossary, source_keys: SHORT_KEYS)
    owners = glossary.select { |row| row.fetch('entity_key') == ENTITY }
    raise "expected one existing #{ENTITY} glossary row" unless owners.length == 1
    row = owners.first
    raise 'Jock owner canonical changed' unless
      row['english_canonical'] == 'Jock MacNelly' &&
      row['korean_canonical'] == '조크 맥넬리(Jock MacNelly)' &&
      row['category'] == 'person' && row['status'] == 'confirmed'
    raise 'D-21259 historical caution missing' unless
      row['notes'].include?('do not invent a bare Jock alias')
    raise 'Jock alias already exists on its owner' if
      row['english_aliases'].to_s.split('|').any? { |term| term.casecmp?(ALIAS) }
    collision = glossary.reject { |entry| entry['entity_key'] == ENTITY }.any? do |entry|
      ([entry['english_canonical']] + entry['english_aliases'].to_s.split('|'))
        .any? { |term| term.casecmp?(ALIAS) }
    end
    raise 'Jock is already assigned to another glossary entity' if collision

    row.merge(
      'english_aliases' => append_values(row['english_aliases'], [ALIAS]),
      'korean_variants' => append_values(row['korean_variants'], [KOREAN]),
      'evidence_ids' => append_values(
        row['evidence_ids'],
        ["D-#{D}", *source_keys.map { |key| "#{key[0]}:#{key[1]}" }]
      ),
      'notes' => [row['notes'], EVIDENCE].reject(&:empty?).join(' ')
    )
  end

  def source_inventory
    Tempfile.create(['proper-name-jock-source-', '.tsv'], '/private/tmp') do |file|
      path = file.path
      file.close
      M.command!(
        'ruby', File.join(M::AUDIT, 'build-proper-name-inventory.rb'),
        '--resource', 'all', '--out', path
      )
      rows = M.table(path)
      raise "incomplete aligned inventory: #{rows.length}" unless rows.length == 73_430
      rows.to_h { |row| [M.key(row), row.to_h] }
    end
  end

  def alias_occurrences(inventory, owner)
    rows = inventory.respond_to?(:values) ? inventory.values : inventory
    build_occurrences(rows, [owner]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end.select do |row|
      row.fetch('matched_english').split('|').any? { |term| term.casecmp?(ALIAS) }
    end
  end

  def verify_scope!(generated, index, inventory)
    keys = generated.map { |row| M.key(row) }
    raise 'Jock alias source scope differs from the reviewed 14 rows' unless
      keys.sort == (SHORT_KEYS + FULL_KEYS).sort &&
      keys.uniq.length == keys.length
    raise 'Jock alias matched outside default resource' unless
      generated.all? { |row| row['resource'] == 'default' }

    generated.each do |row|
      source = inventory.fetch(M.key(row))
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "Jock alias missing from English source #{M.key(row).inspect}" unless
        english.match?(/(?<![A-Za-z])Jock(?![A-Za-z])/)
      if FULL_KEYS.include?(M.key(row))
        raise "unexpected non-full-name owner key #{M.key(row).inspect}" unless
          english.match?(/(?<![A-Za-z])Jock MacNelly(?![A-Za-z])/i)
      end
    end

    by_entity_key = index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row]
    end
    raise 'duplicate existing occurrence keys' unless by_entity_key.length == index.length
    target_rows = index.select { |row| row['entity_key'] == ENTITY }
    target_keys = target_rows.map { |row| M.key(row) }
    raise 'existing Jock owner occurrence keys differ from the six full names' unless
      target_keys.sort == FULL_KEYS.sort
    target_rows.each do |row|
      key = M.key(row)
      raise "prior Jock owner status changed at #{key.inspect}" unless
        row['status'] == EXPECTED_PRIOR_STATUS.fetch(key[1])
      raise "prior Jock owner row is not terminal at #{key.inspect}" unless
        %w[accepted not-an-issue excluded uncertain].include?(row['status'])
    end
    raise 'a scoped short key is already indexed to the Jock owner' if
      (SHORT_KEYS & target_keys).any?

    [by_entity_key, target_rows]
  end

  def revised_text(id, old)
    expected, replacement = EXPECTED_TEXT.fetch(id) do
      raise "unreviewed Jock source row #{id}"
    end
    occurrences = old.scan(Regexp.new(Regexp.escape(expected))).length
    raise "expected one #{expected.inspect} span at default:#{id}, found #{occurrences}" unless
      occurrences == 1
    old.sub(expected, replacement)
  end

  def build_reviews(generated, inventory)
    generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = revised_text(key[1], old)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => EVIDENCE,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row.fetch('Tipo_Variante')]
    end
  end

  def registered_index(original_index, generated, reviews)
    generated_by_key = generated.to_h { |row| [M.key(row), row] }
    updated = original_index.map(&:dup)
    FULL_KEYS.each do |key|
      prior = updated.find do |row|
        row['entity_key'] == ENTITY && M.key(row) == key
      end
      raise "missing prior Jock full-name row #{key.inspect}" unless prior
      prior['matched_english'] = generated_by_key.fetch(key).fetch('matched_english')
    end
    pending = reviews.map do |review|
      {
        'entity_key' => ENTITY,
        'resource' => review.fetch('resource'),
        'ID_Linha' => review.fetch('ID_Linha'),
        'Tipo_Variante' => review.fetch('Tipo_Variante'),
        'matched_english' => generated_by_key.fetch(M.key(review)).fetch('matched_english'),
        'english_source' => generated_by_key.fetch(M.key(review)).fetch('english_source'),
        'korean_current' => review.fetch('old'),
        'status' => 'needs-context',
        'evidence' => "Candidate hit from newly registered English short-name alias #{ALIAS}."
      }
    end
    keys = pending.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'duplicate pending Jock alias rows' unless keys.uniq.length == SHORT_KEYS.length
    updated.concat(pending)
    updated
  end

  def prepare(inventory:, glossary:, index:)
    glossary_rows = glossary.map(&:to_h)
    index_rows = index.map(&:to_h)
    owner = updated_owner(glossary_rows)
    generated = alias_occurrences(inventory.values, owner)
    verify_scope!(generated, index_rows, inventory)
    reviews = build_reviews(generated.select { |row| SHORT_KEYS.include?(M.key(row)) }, inventory)
    raise 'Jock short-name review coverage differs' unless
      reviews.map { |row| M.key(row) }.sort == SHORT_KEYS.sort
    raise 'unexpected Jock review totals' unless
      reviews.length == 8 &&
      reviews.count { |row| row['old'] != row['new'] } == 6 &&
      reviews.count { |row| row['status'] == 'not-an-issue' } == 2

    R.validate_sources!(reviews, inventory)
    edits = reviews.select { |row| row['old'] != row['new'] }
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), edits)
    updated_index = registered_index(index_rows, generated, reviews)
    {
      owner: owner,
      generated: generated,
      reviews: reviews,
      updated_index: updated_index,
      original_glossary: glossary_rows,
      original_index: index_rows
    }
  end

  def source_csv_paths
    %w[en_us ja_jp zh_cn].product(M::RESOURCES).to_h do |locale, resource|
      [
        [locale, resource],
        File.join(M::ROOT, 'src/csv', locale,
                  "locatexts_#{locale}.koalocatext_#{resource}.csv")
      ]
    end
  end

  def snapshot
    {
      active_hashes: M.hashes,
      source_hashes: source_csv_paths.transform_values { |path| Digest::SHA256.file(path).hexdigest },
      glossary: File.binread(GLOSSARY),
      index: File.binread(INDEX)
    }
  end

  def assert_snapshot_unchanged!(before)
    raise 'active CSV changed since Jock alias preflight' unless M.hashes == before.fetch(:active_hashes)
    source_hashes = source_csv_paths.transform_values { |path| Digest::SHA256.file(path).hexdigest }
    raise 'aligned source CSV changed since Jock alias preflight' unless
      source_hashes == before.fetch(:source_hashes)
    raise 'glossary changed since Jock alias preflight' unless File.binread(GLOSSARY) == before.fetch(:glossary)
    raise 'occurrence index changed since Jock alias preflight' unless File.binread(INDEX) == before.fetch(:index)
  end

  def assert_history_preserved!(original_index, final_index, final_inventory, generated)
    final_by_key = final_index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row]
    end
    raise 'duplicate final occurrence key' unless final_by_key.length == final_index.length
    generated_by_key = generated.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row]
    end
    original_index.each do |before|
      key = [before.fetch('entity_key'), *M.key(before)]
      after = final_by_key.fetch(key)
      expected = before.dup
      expected['korean_current'] = final_inventory.fetch(M.key(before)).fetch('work_text')
      if before['entity_key'] == ENTITY
        expected['matched_english'] = generated_by_key.fetch(key).fetch('matched_english')
      end
      raise "historical occurrence decision changed #{key.inspect}" unless after == expected
    end
  end

  def postflight!(prepared, final_glossary, final_index, final_inventory)
    original_glossary = prepared.fetch(:original_glossary)
    expected_glossary = original_glossary.map do |row|
      row['entity_key'] == ENTITY ? prepared.fetch(:owner) : row
    end
    raise 'unexpected glossary mutation' unless final_glossary == expected_glossary
    assert_history_preserved!(
      prepared.fetch(:original_index), final_index, final_inventory,
      prepared.fetch(:generated)
    )

    target = final_index.select { |row| row['entity_key'] == ENTITY }
    expected_keys = (FULL_KEYS + SHORT_KEYS).sort
    raise 'post-registration Jock owner key set differs' unless
      target.map { |row| M.key(row) }.sort == expected_keys
    prepared.fetch(:reviews).each do |review|
      row = target.find { |candidate| M.key(candidate) == M.key(review) }
      raise "Jock alias review mismatch #{M.key(review).inspect}" unless
        row && row['status'] == review['status'] &&
        row['evidence'] == "D-#{D}: #{review.fetch('evidence')}" &&
        row['korean_current'] == review['new']
    end
  end

  def apply!(prepared, before)
    assert_snapshot_unchanged!(before)
    glossary_table = M.table(GLOSSARY)
    index_table = M.table(INDEX)
    glossary_rows = glossary_table.map(&:to_h)
    index_rows = index_table.map(&:to_h)
    raise 'glossary changed after Jock alias preflight' unless
      glossary_rows == prepared.fetch(:original_glossary)
    raise 'index changed after Jock alias preflight' unless
      index_rows == prepared.fetch(:original_index)

    updated_glossary = glossary_rows.map do |row|
      row['entity_key'] == ENTITY ? prepared.fetch(:owner) : row
    end
    M.write_table(GLOSSARY, glossary_table.headers, updated_glossary)
    M.write_table(INDEX, index_table.headers, prepared.fetch(:updated_index))

    Tempfile.create(['proper-name-alias-review-D21634-', '.tsv'], '/private/tmp') do |file|
      file.close
      M.write_table(file.path, M::HEADERS, prepared.fetch(:reviews))
      M.run(file.path, D, 1)
    end

    final_glossary = M.table(GLOSSARY).map(&:to_h)
    final_index = M.table(INDEX).map(&:to_h)
    final_inventory = M.refresh_inventory
    postflight!(prepared, final_glossary, final_index, final_inventory)
    register_path = M::DOCS[3]
    register = File.read(register_path)
    raise 'D-21634 decision-register section already exists' if
      register.include?('## D-21634: Jock Short-Name Alias')
    decision_rows = prepared.fetch(:reviews).map do |row|
      "| `#{row['resource']}` `#{row['ID_Linha']}` | `#{row['english']}` | " \
        "`#{row['old']}` | `#{row['new']}` | #{row['status']} | " \
        "Scoped Jock MacNelly alias; unrelated entity decisions preserved. |"
    end.join("\n")
    register << <<~TEXT

      ## D-21634: Jock Short-Name Alias

      Added `Jock` as a short alias to the existing `person:jock-macnelly`
      owner based on newly reviewed apprentice-role evidence. This scoped
      addendum supersedes only D-21259's earlier no-bare-alias caution;
      it creates no duplicate person and does not reopen prior full-name
      or mixed-row decisions.

      | Key | English | Previous Korean | Reviewed Korean | Disposition | Evidence |
      | --- | --- | --- | --- | --- | --- |
      #{decision_rows}
    TEXT
    File.write(register_path, register)
    puts 'Registered Jock as a short alias on the existing person entity; ' \
         'reviewed 8 short-name rows and preserved 6 prior full-name decisions.'
  end

  def run
    applying = ARGV == ['--apply']
    raise "usage: #{File.basename(__FILE__)} [--apply]" unless ARGV.empty? || applying
    R.ensure_unused_batch!(D)
    before = snapshot
    glossary = M.table(GLOSSARY)
    index = M.table(INDEX)
    inventory = source_inventory
    prepared = prepare(inventory: inventory, glossary: glossary, index: index)
    assert_snapshot_unchanged!(before)
    if applying
      apply!(prepared, before)
    else
      puts "D-#{D}: 8 Jock short-name rows; " \
           "#{prepared.fetch(:reviews).count { |row| row['old'] != row['new'] }} edits; " \
           "preserved #{FULL_KEYS.length} existing full-name decisions. Prepare only; no shared writes."
    end
  end
end

ReviewJockAliasD21634.run if $PROGRAM_NAME == __FILE__
