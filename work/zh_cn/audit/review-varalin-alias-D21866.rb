#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'

module ReviewVaralinAliasD21866
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_866
  ENTITY = 'place:gallows-end'
  ALIAS = 'Varalin'
  REVIEW_INPUT = File.join(__dir__, 'proper-name-review-input-D21866.tsv')
  REVIEWED = File.join(__dir__, 'proper-name-edits-D21866.tsv')
  ALIAS_RECORD = File.join(__dir__, 'proper-name-alias-expansion-D21866.tsv')
  SPELLING_EDITS = File.join(__dir__, 'proper-name-varalin-spelling-D21866.tsv')
  TARGETS = [
    %w[base 82 11],
    %w[base 4363 11],
    ['default', '17542', ''],
    ['default', '31946', ''],
    ['default', '32740', ''],
    ['default', '43053', '']
  ].freeze
  TEXT_EDITS = {
    %w[base 82 11] => ['바랄린(Varalin)', '바라린(Varalin)'],
    ['default', '43053', ''] => ["'바랄린'", "'바라린(Varalin)'"]
  }.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:32740 explicitly says the Dverga named the island
    Varalin, meaning "dangerous"; default:43053 directly identifies
    Varalin as their word for Gallows End island. Japanese バラリン/
    ヴァラリン and Chinese 瓦拉林 corroborate. Add Varalin only as a source alias of the
    existing place:gallows-end entity, not as a new place. Review all six
    exact source keys; preserve the two pre-existing Gallows End terminal
    dispositions and their evidence. Normalize the Korean spelling to the
    established 바라린, correcting only base:82 and default:43053.
    D-20679, D-20680, and D-20851 findings outside these exact keys are
    not reopened.
  TEXT
  ALIAS_HEADERS = %w[entity_key english_alias scope evidence].freeze
  SPELLING_HEADERS = %w[resource ID_Linha Tipo_Variante status old new evidence].freeze

  def artifact_paths
    [
      REVIEW_INPUT, REVIEWED, ALIAS_RECORD, SPELLING_EDITS,
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ]
  end

  def ensure_unused!
    R.ensure_unused_batch!(D)
    existing = artifact_paths.select { |path| File.exist?(path) }
    raise "D-#{D} artifacts already exist: #{existing.inspect}" unless existing.empty?
  end

  def expanded_owner(owner)
    aliases = owner['english_aliases'].to_s.split('|').reject(&:empty?)
    updated = owner.dup
    updated['english_aliases'] = (aliases + [ALIAS]).join('|')
    updated['evidence_ids'] = (
      owner['evidence_ids'].to_s.split('|') + ["D-#{D}"] +
      TARGETS.map { |key| key[2].empty? ? key[0, 2].join(':') : key.join(':') }
    ).uniq.join('|')
    updated['notes'] = [owner['notes'], NOTE].reject(&:empty?).join("\n")
    updated
  end

  def prepare
    ensure_unused!
    before_hashes = M.hashes
    inventory = M.refresh_inventory
    glossary_table = M.table(R::GLOSSARY)
    glossary = glossary_table.map(&:to_h)
    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    owner = glossary.find { |row| row['entity_key'] == ENTITY }
    raise "missing confirmed owner #{ENTITY}" unless
      owner && owner['status'] == 'confirmed' &&
      owner['english_canonical'] == 'Gallows End'

    aliases = owner['english_aliases'].to_s.split('|').reject(&:empty?)
    raise 'Varalin alias is already registered' if aliases.any? { |term| term.casecmp?(ALIAS) }
    collision = glossary.find do |row|
      row['entity_key'] != ENTITY &&
        ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
          .any? { |term| term.casecmp?(ALIAS) }
    end
    raise "Varalin alias collision with #{collision['entity_key']}" if collision

    updated_owner = expanded_owner(owner)

    generated = build_occurrences(inventory.values, [updated_owner]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    alias_rows = generated.select do |row|
      row['matched_english'].to_s.split('|').any? { |term| term.casecmp?(ALIAS) }
    end
    raise "Varalin source-key scope differs: #{alias_rows.map { |r| M.key(r) }.inspect}" unless
      alias_rows.map { |row| M.key(row) }.sort == TARGETS.sort

    source_evidence = TARGETS.to_h do |key|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "English Varalin missing at #{key.inspect}" unless
        english.match?(/(?<![A-Za-z0-9])Varalin(?![A-Za-z0-9])/i)
      raise "Japanese Varalin transliteration missing at #{key.inspect}" unless
        %w[バラリン ヴァラリン].any? { |form| japanese.include?(form) }
      raise "Chinese 瓦拉林 missing at #{key.inspect}" unless chinese.include?('瓦拉林')
      [key, [english, japanese, chinese, source.fetch('work_text')]]
    end

    index_by_key = index.to_h do |row|
      [[row['entity_key'], *M.key(row)], row]
    end
    prior_keys = TARGETS.map { |key| [ENTITY, *key] }.select { |key| index_by_key.key?(key) }
    expected_prior = [
      [ENTITY, 'default', '32740', ''],
      [ENTITY, 'default', '43053', '']
    ].sort
    raise "overlapping terminal scope differs: #{prior_keys.inspect}" unless
      prior_keys.sort == expected_prior
    prior_rows = prior_keys.map { |key| index_by_key.fetch(key) }
    raise 'prior Varalin-overlap keys are not terminal accepted records' unless
      prior_rows.all? { |row| row['status'] == 'accepted' }
    raise 'prior 32740 disposition changed' unless
      index_by_key.fetch([ENTITY, 'default', '32740', ''])['evidence'].start_with?('D-20849:')
    raise 'prior 43053 disposition changed' unless
      index_by_key.fetch([ENTITY, 'default', '43053', ''])['evidence'].start_with?('D-20851:')

    reviews = alias_rows.reject do |row|
      index_by_key.key?([row['entity_key'], *M.key(row)])
    end.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english, japanese, chinese, old = source_evidence.fetch(key)
      before, after = TEXT_EDITS.fetch(key, [old, old])
      raise "Korean old text differs at #{key.inspect}" unless old.scan(before).length == 1
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => 'accepted',
        'old' => old, 'new' => before == old ? old : old.sub(before, after),
        'evidence' => NOTE,
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    raise "unexpected new Varalin occurrence count #{reviews.length}" unless reviews.length == 4
    R.validate_sources!(reviews, inventory)
    TEXT_EDITS.each do |key, (before, _after)|
      raise "text edit is outside the Varalin alias scope #{key.inspect}" unless TARGETS.include?(key)
      source = inventory.fetch(key)
      raise "text edit target missing at #{key.inspect}" unless
        source.fetch('work_text').scan(before).length == 1
    end

    spelling_rows = TEXT_EDITS.map do |key, (before, after)|
      source = inventory.fetch(key)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'status' => 'accepted',
        'old' => source.fetch('work_text'),
        'new' => source.fetch('work_text').sub(before, after),
        'evidence' => NOTE
      }
    end
    alias_definition = {
      'entity_key' => ENTITY, 'english_alias' => ALIAS,
      'scope' => TARGETS.map { |key| key.join(':') }.join('|'),
      'evidence' => NOTE
    }

    raise 'active CSV changed during prepare' unless M.hashes == before_hashes
    M.write_table(REVIEW_INPUT, M::HEADERS, reviews)
    M.write_table(REVIEWED, M::HEADERS, reviews)
    M.write_table(ALIAS_RECORD, ALIAS_HEADERS, [alias_definition])
    M.write_table(SPELLING_EDITS, SPELLING_HEADERS, spelling_rows)
    puts "D-#{D} prepared: one existing-place alias, six source keys, " \
         "four new index matches, two spelling corrections."
  end

  def apply
    ensure_unused! if artifact_paths.none? { |path| File.exist?(path) }
    raise 'D-21866 review input is missing' unless File.file?(REVIEW_INPUT)
    raise 'D-21866 prepared outputs are incomplete' unless
      [REVIEWED, ALIAS_RECORD, SPELLING_EDITS].all? { |path| File.file?(path) }

    before_hashes = M.hashes
    inventory = M.refresh_inventory
    glossary_table = M.table(R::GLOSSARY)
    glossary = glossary_table.map(&:to_h)
    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    owner = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'Gallows End glossary changed after prepare' unless owner &&
      owner['status'] == 'confirmed' &&
      owner['english_canonical'] == 'Gallows End' &&
      owner['english_aliases'].to_s.split('|').none? { |term| term.casecmp?(ALIAS) }
    updated_owner = expanded_owner(owner)

    reviews = M.table(REVIEW_INPUT).map(&:to_h)
    new_keys = [
      %w[base 82 11],
      %w[base 4363 11],
      ['default', '17542', ''],
      ['default', '31946', '']
    ]
    raise 'review input keys differ' unless reviews.map { |row| M.key(row) }.sort == new_keys.sort
    raise 'review input disposition differs' unless reviews.all? do |row|
      row['entity_key'] == ENTITY && row['status'] == 'accepted'
    end
    reviews.each do |row|
      source = inventory.fetch(M.key(row))
      raise "stale review source at #{M.key(row).inspect}" unless
        [row.fetch('old'), row.fetch('new')].include?(source.fetch('work_text'))
    end
    R.validate_sources!(reviews, inventory)
    alias_rows = M.table(ALIAS_RECORD).map(&:to_h)
    expected_alias = {
      'entity_key' => ENTITY, 'english_alias' => ALIAS,
      'scope' => TARGETS.map { |key| key.join(':') }.join('|'),
      'evidence' => NOTE
    }
    raise 'prepared alias definition differs' unless alias_rows == [expected_alias]
    spelling_rows = M.table(SPELLING_EDITS).map(&:to_h)
    raise 'spelling correction manifest must contain two rows' unless spelling_rows.length == 2
    raise 'spelling correction keys differ' unless spelling_rows.map { |row| M.key(row) }.sort == TEXT_EDITS.keys.sort
    raise 'spelling correction must be accepted' unless spelling_rows.all? { |row| row['status'] == 'accepted' }

    edit_rows = spelling_rows.map do |row|
      key = M.key(row)
      source = inventory.fetch(key)
      raise "stale spelling source at #{key.inspect}" unless
        [row.fetch('old'), row.fetch('new')].include?(source.fetch('work_text'))
      before, after = TEXT_EDITS.fetch(key)
      raise "spelling manifest differs at #{key.inspect}" unless
        row.fetch('old').scan(before).length == 1 &&
          row.fetch('new') == row.fetch('old').sub(before, after)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'old' => row.fetch('old'), 'new' => row.fetch('new'), 'status' => 'accepted',
        'evidence' => row.fetch('evidence')
      }
    end
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    active_values = edit_rows.map do |edit|
      inventory.fetch(M.key(edit)).fetch('work_text')
    end
    old_values = edit_rows.map { |edit| edit.fetch('old') }
    new_values = edit_rows.map { |edit| edit.fetch('new') }
    if active_values == old_values
      checks = ProperNameCellEditor.apply(M::ROOT, SPELLING_EDITS, backup_dir, before_hashes)
    elsif active_values == new_values
      checks = edit_rows.group_by { |edit| edit.fetch('resource') }.map do |resource, group|
        path = M.csv_path(resource)
        backup = File.join(backup_dir, File.basename(path))
        raise "missing pre-edit recovery backup #{backup}" unless File.file?(backup)
        original = File.binread(backup)
        current = File.binread(path)
        reconstructed, count = ProperNameCellEditor.prepare(original, group)
        raise "active #{resource} bytes do not match the reviewed edit" unless reconstructed == current
        {
          resource: resource, cells: group.length, rows: count,
          before_sha256: Digest::SHA256.hexdigest(original),
          after_sha256: Digest::SHA256.hexdigest(current),
          backup: backup,
          validation: 'reconstructed from byte-identical pre-edit backup; inverse PASS'
        }
      end
    else
      raise 'partial Varalin spelling application; refusing to overwrite or reconstruct'
    end
    raise 'expected both base and default edit backups' unless
      checks.map { |check| check.fetch(:resource) }.sort == %w[base default]

    updated_inventory = M.refresh_inventory
    updated_owner = expanded_owner(owner)
    generated = build_occurrences(updated_inventory.values, [updated_owner]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    alias_rows = generated.select do |row|
      row['matched_english'].to_s.split('|').any? { |term| term.casecmp?(ALIAS) }
    end
    raise 'Varalin generated occurrence set changed after edits' unless
      alias_rows.map { |row| M.key(row) }.sort == TARGETS.sort

    old_index = M.table(M::INDEX)
    old_rows = old_index.map(&:to_h)
    old_by_key = old_rows.to_h { |row| [[row['entity_key'], *M.key(row)], row] }
    fresh_rows = []
    target_updates = {}
    alias_rows.each do |generated_row|
      key = [generated_row['entity_key'], *M.key(generated_row)]
      current = old_by_key[key]
      korean = updated_inventory.fetch(M.key(generated_row)).fetch('work_text')
      if current
        updated = current.dup
        updated['matched_english'] = generated_row.fetch('matched_english')
        updated['korean_current'] = korean
        target_updates[key] = updated
      else
        updated = generated_row.dup
        updated['status'] = 'needs-context'
        updated['evidence'] = "New source-local alias match reviewed in D-#{D}."
        fresh_rows << updated
      end
    end
    raise 'expected four newly indexed Varalin rows' unless fresh_rows.length == 4
    updated_index = old_rows.map do |row|
      target_updates.fetch([row['entity_key'], *M.key(row)], row)
    end + fresh_rows
    M.write_table(R::GLOSSARY, glossary_table.headers,
                  glossary.map { |row| row['entity_key'] == ENTITY ? updated_owner : row })
    M.write_table(M::INDEX, old_index.headers, updated_index)

    R.validate_sources!(reviews, updated_inventory)
    M.checkpoint(D, reviews, checks, checks.map { |c| "#{c[:resource]}: PASS #{c[:cells]} cells; SHA-256 #{c[:after_sha256]}" }.join("\n"),
                 updated_inventory, review_states: ['needs-context'])

    write_scope_report(checks, updated_inventory)
    append_history
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'active proper-name data validation failed' unless validation.include?('PASS')
    raise 'residual index audit failed' unless residual.include?('missing=0') &&
      residual.include?('undocumented extras=0') &&
      residual.include?('Terminal matches without a covering bilingual English label: 0')
    puts "D-#{D}: #{validation.strip}"
    puts residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).join
  end

  def write_scope_report(checks, inventory)
    index = M.table(M::INDEX).map(&:to_h)
    glossary = M.table(R::GLOSSARY).map(&:to_h)
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    files = checks.map do |check|
      "- #{check[:resource]}: #{check[:cells]} cells; pre `#{check[:before_sha256]}`; " \
        "post `#{check[:after_sha256]}`; backup `#{check[:backup]}`."
    end.join("\n")
    body = <<~TEXT
      # D-#{D}: Varalin Source Alias And Spelling Review

      Date: #{M::RUN_DATE_ISO}

      Reviewed six exact source keys for `Varalin`: `base:82:11`,
      `base:4363:11`, `default:17542`, `default:31946`, `default:32740`,
      and `default:43053`. English identifies Varalin as the Dverga name for
      Gallows End; Japanese `バラリン`/`ヴァラリン` and Chinese `瓦拉林` corroborate.
      Added `Varalin` as an alias of existing `place:gallows-end`; no new
      place entity was created.

      Four exact rows were newly indexed. Existing `place:gallows-end`
      matches at default:32740 and default:43053 retain their prior status
      and evidence; their matched-English cache now also records `Varalin`.
      Only the misspelling at base:82 and default:43053 was corrected from
      `바랄린` to `바라린`. Other names, text, tokens, particles and line
      breaks were preserved.

      Existing D-20679, D-20680 and D-20851 decisions outside these six
      keys were not reopened or recounted. Sequential default review and
      global translation tallies remain unchanged. Full proper-name
      discovery and in-game validation remain incomplete.

      ## Verification

      - Cell edits: #{checks.sum { |check| check[:cells] }} exact `Texto` cells across base/default.
      - Byte-preserving backup validation: PASS; BOM, line endings, row order/count, keys, non-target bytes and inverse reconstruction.
      #{files.lines.map { |line| "- #{line.strip}" }.join("\n")}
      - Proper-name data: #{index.length} indexed occurrences, #{glossary.length} glossary entities.
      - Aligned inventory: #{inventory.length} rows; SHA-256 `#{Digest::SHA256.file(M::INVENTORY).hexdigest}`.
      - Occurrence index SHA-256: `#{Digest::SHA256.file(M::INDEX).hexdigest}`.
      - Glossary SHA-256: `#{Digest::SHA256.file(R::GLOSSARY).hexdigest}`.
      - Review input: `proper-name-review-input-D#{D}.tsv`.
      - New-occurrence manifest: `proper-name-edits-D#{D}.tsv`.
      - Alias scope: `proper-name-alias-expansion-D#{D}.tsv`.
      - Text corrections: `proper-name-varalin-spelling-D#{D}.tsv`.
    TEXT
    File.write(report, body)
    File.write(addendum, "# D-#{D} Edit Addendum\n\n#{body.lines.drop(2).join}")
  end

  def append_history
    section = <<~TEXT

      ## D-#{D}: Varalin Source Alias And Spelling Review

      Registered `Varalin` as a source alias of the existing
      `place:gallows-end` entity after English explicitly identified it as
      the Dverga name for Gallows End. Japanese `バラリン`/`ヴァラリン`
      and Chinese `瓦拉林` corroborate. Reviewed six exact source keys; added four
      previously unindexed matches while preserving the status and evidence
      of the two existing Gallows End rows. Corrected only `바랄린` to
      `바라린` at base:82 and default:43053. See
      `named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md` and
      `proper-name-alias-expansion-D#{D}.tsv`. No prior unrelated terminal
      decision or global translation tally was reopened.
    TEXT
    [File.join(__dir__, 'README.md'), File.join(__dir__, 'decision-register-20261009.md')].each do |path|
      text = File.read(path)
      raise "D-#{D} history already present in #{path}" if text.include?("## D-#{D}: Varalin")
      File.write(path, text + section)
    end
  end

  def run
    case ARGV
    when [], ['prepare'] then prepare
    when ['apply'] then apply
    else abort 'usage: review-varalin-alias-D21866.rb [prepare|apply]'
    end
  end
end

ReviewVaralinAliasD21866.run if $PROGRAM_NAME == __FILE__
