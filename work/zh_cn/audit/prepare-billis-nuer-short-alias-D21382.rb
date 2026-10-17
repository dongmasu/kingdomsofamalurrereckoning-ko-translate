#!/usr/bin/env ruby

require 'json'
require 'tempfile'
require_relative 'apply-reviewed-proper-name-discovery'

module BillisNuerShortAliasD21382
  M = ReviewedNameBatches
  START_D = 21_382
  GLOSSARY = File.join(M::AUDIT, 'proper-name-glossary.tsv')
  INDEX = M::INDEX
  REVIEW = File.join(M::AUDIT, "proper-name-alias-review-D#{START_D}.tsv")
  DEFINITION = File.join(M::AUDIT, "proper-name-alias-definition-D#{START_D}.tsv")
  CONFIG = {
    'person:billis-aideh' => {
      alias: 'Billis',
      canonical: 'Billis Aideh',
      korean_canonical: '빌리스 에이데(Billis Aideh)',
      korean: '빌리스',
      variants: ['빌리스'],
      pattern: /(?<![A-Za-z가-힣])빌리스(?:\s*\(Billis\))?(?![A-Za-z])/,
      evidence: <<~TEXT.gsub(/\s+/, ' ').strip.freeze
        English identifies Billis as the Canneroc blacksmith and as the person
        referred to in the Canneroc family/work references. The already
        registered full name Billis Aideh is aligned in the full-name rows.
        Japanese ビリス and Chinese 比利斯 corroborate the short name. Normalize
        only the short personal name as 빌리스(Billis); retain Aideh as its
        separate indexed family-name entity.
      TEXT
    },
    'person:nuer-bedlym' => {
      alias: 'Nuer',
      canonical: 'Nuer Bedlym',
      korean_canonical: '누어 베들림(Nuer Bedlym)',
      korean: '누어',
      variants: %w[누에르 뉴어 누어],
      pattern: /(?<![A-Za-z가-힣])(?:누에르|뉴어|누어)(?:\s*\(Nuer\))?(?![A-Za-z])/,
      evidence: <<~TEXT.gsub(/\s+/, ' ').strip.freeze
        English default:10002 and default:35761 identify Nuer as the man
        preaching blasphemy in the Lower Tunnels; the other short-name rows
        belong to that quest and person, including its Nuer's Blasphemy
        objective labels. Japanese ニュア and Chinese 努尔 corroborate the
        identity. Normalize only Nuer as 누어(Nuer), including attested
        누에르/뉴어/누어 spellings; preserve Bedlym as a separate indexed
        family-name entity.
      TEXT
    }
  }.freeze
  EXPECTED_SHORT_KEYS = {
    'person:billis-aideh' => %w[19811 20503 31697 33121 55125 55802].map do |id|
      ['default', id, '']
    end.freeze,
    'person:nuer-bedlym' => %w[4326 8945 9746 9886 10002 19174 35761 38183 39460 58389].map do |id|
      ['default', id, '']
    end.freeze
  }.freeze
  EXPECTED_PRIOR_KEYS = {
    'person:billis-aideh' => %w[
      549 692 10964 32555 33525 40490 40624 53811 55494 59184
    ].map { |id| ['default', id, ''] }.freeze,
    'person:nuer-bedlym' => %w[16247 32651 59808 61111 63575].map do |id|
      ['default', id, '']
    end.freeze
  }.freeze
  GLOSSARY_HEADERS = M.table(GLOSSARY).headers.freeze
  CSV_PATHS = M::RESOURCES.to_h { |resource| [resource, M.csv_path(resource)] }.freeze
  SOURCE_CSV_PATHS = %w[en_us ja_jp zh_cn].product(M::RESOURCES).to_h do |locale, resource|
    path = File.join(
      M::ROOT, 'src', 'csv', locale,
      "locatexts_#{locale}.koalocatext_#{resource}.csv"
    )
    [[locale, resource], path]
  end.freeze

  module_function

  def ordered_keys(keys)
    keys.sort_by do |resource, id, variant|
      [M::RESOURCES.index(resource), id.to_i, variant]
    end
  end

  def append_values(old, values)
    (old.to_s.split('|').reject(&:empty?) + values).uniq.join('|')
  end

  def updated_entities(glossary)
    CONFIG.to_h do |entity, config|
      row = glossary.find { |entry| entry.fetch('entity_key') == entity }
      raise "missing existing entity #{entity}" unless row
      raise "unexpected canonical for #{entity}" unless
        row['english_canonical'] == config.fetch(:canonical) &&
        row['korean_canonical'] == config.fetch(:korean_canonical) &&
        row['status'] == 'confirmed'
      alias_name = config.fetch(:alias)
      raise "#{alias_name} alias already registered on #{entity}" if
        row['english_aliases'].to_s.split('|').any? { |term| term.casecmp?(alias_name) }
      collision = glossary.reject { |entry| entry['entity_key'] == entity }.any? do |entry|
        ([entry['english_canonical']] + entry['english_aliases'].to_s.split('|'))
          .any? { |term| term.casecmp?(alias_name) }
      end
      raise "#{alias_name} alias belongs to another glossary entity" if collision

      keys = EXPECTED_SHORT_KEYS.fetch(entity) + EXPECTED_PRIOR_KEYS.fetch(entity)
      updated = row.merge(
        'english_aliases' => append_values(row['english_aliases'], [alias_name]),
        'korean_variants' => append_values(row['korean_variants'], config.fetch(:variants)),
        'evidence_ids' => append_values(
          row['evidence_ids'],
          ["D-#{START_D}", *ordered_keys(keys).map { |key| key.join(':') }]
        ),
        'notes' => [row['notes'], config.fetch(:evidence)].reject(&:empty?).join(' ')
      )
      [entity, updated]
    end
  end

  def updated_glossary(glossary, updates)
    glossary.map do |row|
      updates.fetch(row.fetch('entity_key'), row)
    end
  end

  def build_isolated_inventory
    Tempfile.create(['billis-nuer-source-inventory-', '.tsv'], '/private/tmp') do |file|
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

  def normalize_short_name(text, config)
    result = text.dup
    matches = []
    result.to_enum(:scan, config.fetch(:pattern)).each do
      match = Regexp.last_match
      before = result[0...match.begin(0)]
      matches << [match.begin(0), match.end(0)] if before.count('(') <= before.count(')')
    end
    matches.reverse_each do |start_at, finish|
      result[start_at...finish] = "#{config.fetch(:korean)}(#{config.fetch(:alias)})"
    end
    [result, matches.length]
  end

  def alias_occurrences(inventory, glossary, updates)
    definitions = updated_glossary(glossary, updates)
    build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end.select do |row|
      config = CONFIG[row.fetch('entity_key')]
      config && row.fetch('matched_english').split('|').include?(config.fetch(:alias))
    end
  end

  def classify_scope(generated, index, inventory)
    by_key = generated.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row]
    end
    raise 'duplicate generated alias key' unless by_key.length == generated.length
    existing = index.to_h { |row| [[row.fetch('entity_key'), *M.key(row)], row] }
    raise 'duplicate existing occurrence key' unless existing.length == index.length

    prior = by_key.keys.select { |key| existing.key?(key) }
    short_only = by_key.keys - prior
    CONFIG.each_key do |entity|
      expected_prior = EXPECTED_PRIOR_KEYS.fetch(entity).map { |key| [entity, *key] }
      expected_short = EXPECTED_SHORT_KEYS.fetch(entity).map { |key| [entity, *key] }
      actual_prior = prior.select { |key| key.first == entity }
      actual_short = short_only.select { |key| key.first == entity }
      raise "unexpected prior #{entity} keys" unless actual_prior.sort == expected_prior.sort
      raise "unexpected short-only #{entity} keys" unless actual_short.sort == expected_short.sort
      raise "unexpected live alias hit count for #{entity}" unless
        generated.count { |row| row.fetch('entity_key') == entity } ==
          expected_prior.length + expected_short.length
      expected_prior.each do |key|
        row = existing.fetch(key)
        source = inventory.fetch(key.drop(1))
        canonical = Regexp.escape(CONFIG.fetch(entity).fetch(:canonical))
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        raise "prior row is not a full-name occurrence #{key.inspect}" unless
          english.match?(/(?<![A-Za-z])#{canonical}(?![A-Za-z])/i)
        raise "prior row is not terminal #{key.inspect}" unless
          %w[accepted not-an-issue excluded uncertain].include?(row.fetch('status'))
      end
    end
    entity_rows = index.select { |row| CONFIG.key?(row.fetch('entity_key')) }
      .map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'existing target-entity keys differ from reviewed full-name keys' unless
      entity_rows.sort == prior.sort

    {
      by_key: by_key,
      prior: prior,
      short_only: short_only,
      new_rows: short_only.map { |key| by_key.fetch(key) }
    }
  end

  def build_reviews(new_rows, inventory)
    new_rows.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      entity = occurrence.fetch('entity_key')
      config = CONFIG.fetch(entity)
      old_text = source.fetch('work_text')
      new_text, count = normalize_short_name(old_text, config)
      raise "short #{config.fetch(:alias)} span not found at #{key.inspect}" unless count.positive?
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity,
        'status' => old_text == new_text ? 'not-an-issue' : 'accepted',
        'old' => old_text, 'new' => new_text,
        'evidence' => config.fetch(:evidence),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => old_text == new_text ? 'not-an-issue' : 'accepted'),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row.fetch('Tipo_Variante')]
    end
  end

  def validate_byte_edits!(reviews)
    reviews.group_by { |row| row.fetch('resource') }.each do |resource, rows|
      edits = rows.select { |row| row.fetch('old') != row.fetch('new') }
      next if edits.empty?
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
  end

  def snapshot
    source_bytes = SOURCE_CSV_PATHS.to_h { |key, path| [key, File.binread(path)] }
    {
      hashes: M.hashes,
      csv_bytes: CSV_PATHS.to_h { |resource, path| [resource, File.binread(path)] },
      source_hashes: source_bytes.transform_values do |bytes|
        Digest::SHA256.hexdigest(bytes)
      end,
      source_bytes: source_bytes,
      glossary_bytes: File.binread(GLOSSARY),
      index_bytes: File.binread(INDEX)
    }
  end

  def assert_snapshot_unchanged!(before)
    raise 'active CSV hashes changed since preflight' unless M.hashes == before.fetch(:hashes)
    raise 'active CSV bytes changed since preflight' unless
      CSV_PATHS.to_h { |resource, path| [resource, File.binread(path)] } == before.fetch(:csv_bytes)
    source_bytes = SOURCE_CSV_PATHS.to_h { |key, path| [key, File.binread(path)] }
    source_hashes = source_bytes.transform_values { |bytes| Digest::SHA256.hexdigest(bytes) }
    raise 'source CSV hashes changed since preflight' unless
      source_hashes == before.fetch(:source_hashes)
    raise 'source CSV bytes changed since preflight' unless
      source_bytes == before.fetch(:source_bytes)
    raise 'glossary bytes changed since preflight' unless File.binread(GLOSSARY) == before.fetch(:glossary_bytes)
    raise 'occurrence index bytes changed since preflight' unless File.binread(INDEX) == before.fetch(:index_bytes)
  end

  def prepared_files_match!(reviews, definitions)
    review_table = M.table(REVIEW)
    definition_table = M.table(DEFINITION)
    raise 'prepared review headers changed' unless review_table.headers == M::HEADERS
    raise 'prepared review differs; inspect and prepare again' unless
      review_table.map(&:to_h) == reviews
    raise 'prepared definition headers changed' unless definition_table.headers == GLOSSARY_HEADERS
    raise 'prepared definition differs; inspect and prepare again' unless
      definition_table.map(&:to_h) == definitions
  end

  def expected_historical_row(before, after, inventory, expected_match = nil)
    expected = before.dup
    expected['korean_current'] = inventory.fetch(M.key(before)).fetch('work_text')
    expected['matched_english'] = expected_match if expected_match
    expected == after
  end

  def postflight!(original_index, final_index, final_glossary, final_inventory,
                  expected_glossary, scope, reviews)
    raise 'unexpected glossary mutation' unless final_glossary == expected_glossary
    final_by_key = final_index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row]
    end
    raise 'duplicate final occurrence key' unless final_by_key.length == final_index.length
    original_index.each do |before|
      key = [before.fetch('entity_key'), *M.key(before)]
      match = scope.fetch(:by_key)[key]
      expected_match = match && match.fetch('matched_english')
      after = final_by_key.fetch(key)
      raise "historical row changed #{key.inspect}" unless
        expected_historical_row(before, after, final_inventory, expected_match)
    end
    reviews.each do |review|
      key = [review.fetch('entity_key'), *M.key(review)]
      after = final_by_key.fetch(key)
      raise "review disposition mismatch #{key.inspect}" unless
        after.fetch('status') == review.fetch('status') &&
        after.fetch('evidence') == "D-#{START_D}: #{review.fetch('evidence')}" &&
        after.fetch('korean_current') == review.fetch('new')
    end
    expected_keys = alias_occurrences(final_inventory, final_glossary, CONFIG.to_h do |entity, _config|
      [entity, final_glossary.find { |row| row.fetch('entity_key') == entity }]
    end).map do |row|
      [row.fetch('entity_key'), *M.key(row)]
    end.sort
    actual_keys = final_index.select { |row| CONFIG.key?(row.fetch('entity_key')) }
      .map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    raise 'post-registration source/index keys differ' unless expected_keys == actual_keys
  end

  def run
    applying = ARGV == ['--apply']
    raise "usage: #{File.basename(__FILE__)} [--apply]" unless ARGV.empty? || applying
    ReviewedProperNameDiscovery.ensure_unused_batch!(START_D)
    prepared_presence = [REVIEW, DEFINITION].map { |path| File.exist?(path) }
    if prepared_presence.any? && !prepared_presence.all?
      raise 'D-21382 prepared files are incomplete'
    end

    before = snapshot
    glossary_table = M.table(GLOSSARY)
    index_table = M.table(INDEX)
    glossary = glossary_table.map(&:to_h)
    original_index = index_table.map(&:to_h)
    inventory = build_isolated_inventory
    updates = updated_entities(glossary)
    generated = alias_occurrences(inventory, glossary, updates)
    scope = classify_scope(generated, original_index, inventory)
    reviews = build_reviews(scope.fetch(:new_rows), inventory)
    raise "expected 16 new short-name rows, found #{reviews.length}" unless reviews.length == 16
    raise 'unexpected reviewed status totals' unless
      reviews.group_by { |row| row.fetch('status') }.transform_values(&:length) ==
        { 'accepted' => 12, 'not-an-issue' => 4 }
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    validate_byte_edits!(reviews)

    definitions = CONFIG.keys.map { |entity| updates.fetch(entity) }
    updated_all_glossary = updated_glossary(glossary, updates)
    generated_by_key = scope.fetch(:by_key)
    updated_index = original_index.map(&:dup)
    scope.fetch(:prior).each do |key|
      row = updated_index.find do |entry|
        [entry.fetch('entity_key'), *M.key(entry)] == key
      end
      row['matched_english'] = generated_by_key.fetch(key).fetch('matched_english')
    end
    pending = scope.fetch(:new_rows).map do |row|
      row.merge(
        'status' => 'needs-context',
        'evidence' => "Candidate hit from newly registered English short-name alias " \
          "#{CONFIG.fetch(row.fetch('entity_key')).fetch(:alias)}."
      )
    end
    updated_index.concat(pending)
    raise 'unexpected new pending key count' unless pending.length == 16

    assert_snapshot_unchanged!(before)
    if applying
      raise 'D-21382 prepared files are missing' unless prepared_presence.all?
      prepared_files_match!(reviews, definitions)
      assert_snapshot_unchanged!(before)
      M.write_table(GLOSSARY, glossary_table.headers, updated_all_glossary)
      M.write_table(INDEX, index_table.headers, updated_index)
      M.run(REVIEW, START_D, 1)
      final_inventory = build_isolated_inventory
      postflight!(
        original_index, M.table(INDEX).map(&:to_h),
        M.table(GLOSSARY).map(&:to_h), final_inventory,
        updated_all_glossary, scope, M.table(REVIEW).map(&:to_h)
      )
      puts 'Registered Billis and Nuer short aliases; reviewed 16 new rows; ' \
           'preserved 15 prior full-name rows.'
    else
      if prepared_presence.all?
        prepared_files_match!(reviews, definitions)
        assert_snapshot_unchanged!(before)
        puts 'Verified existing prepared files exactly: 16 short-only rows (12 edits); ' \
             '15 prior full-name rows preserved. No files rewritten.'
      else
        M.write_table(REVIEW, M::HEADERS, reviews)
        M.write_table(DEFINITION, glossary_table.headers, definitions)
        puts 'Prepared 16 short-only rows (12 edits); preserved 15 existing full-name rows. ' \
             'No glossary, index, or CSV changes.'
      end
    end
  end
end

BillisNuerShortAliasD21382.run if $PROGRAM_NAME == __FILE__
