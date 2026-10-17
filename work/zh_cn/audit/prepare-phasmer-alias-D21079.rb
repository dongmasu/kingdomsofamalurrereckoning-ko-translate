#!/usr/bin/env ruby

require 'digest'
require 'fileutils'
require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'
require_relative 'build-proper-name-occurrences'

module PhasmerAliasD21079
  M = ReviewedNameBatches
  ENTITY = 'person:phasmer-humm'
  ENGLISH = 'Phasmer'
  KOREAN = '파스머(Phasmer)'
  FULL_NAME = 'Phasmer Humm'
  FULL_KOREAN = '파스머 험(Phasmer Humm)'
  REVIEW_PATH = '/private/tmp/proper-name-reviewed-D21079.tsv'
  APPLY_PATH = '/private/tmp/apply-phasmer-alias-D21079.rb'
  REVIEW_HEADERS = (M::HEADERS + ['review_scope']).freeze
  SHORT_ONLY_IDS = %w[
    1275 2674 4449 5237 5851 6544 9459 11077 13494 13525 15683 15873
    16034 16257 19336 20022 20462 20618 21200 21322 21725 22828 23787
    25216 26434 27098 27166 27690 27812 28680 28739 30179 32727 33377
    35053 36711 37708 43833 44427 45407 46134 46500 47320 49708 50398
    51114 55389 55467 55678 55790 59473 60148 63991
  ].freeze
  SAME_FULL_IDS = %w[8706 32402 42521].freeze
  FULL_NAME_IDS = %w[
    864 5649 8466 8706 10702 13755 24498 30297 32402 32728 34607 36399
    40098 42521 50551 52074 56410 57865
  ].freeze
  TITLE_KEY = ['default', '13525', ''].freeze
  SHORT_PATTERN = /(?<![가-힣A-Za-z])(?:(?:늙은)\s+)?(?:파스머|패스머|페즈머)(?:\(Phasmer\))?(?![A-Za-z])(?!\s*험)/
  FULL_PATTERN = /(?<![A-Za-z])Phasmer Humm(?![A-Za-z])/i
  SHORT_EN_PATTERN = /(?<![A-Za-z])Phasmer(?![A-Za-z])/i
  JA_ALIAS_PATTERN = /ファズマー|ファスマー|Phasmer/i
  ZH_ALIAS_PATTERN = /法斯玛|Phasmer/i
  NOTES = 'D-21079 adds Phasmer as a short-name alias of the already registered person:phasmer-humm. English short-name occurrences identify the Rithen/Moon Camp Traveler; aligned Japanese ファズマー/ファスマー and Chinese 法斯玛 corroborate in the contextual rows, and all exact EN/JA/ZH source cells are retained for each decision. Pair only Korean short-name spans as 파스머(Phasmer), including repeated mentions and the attested 패스머/페즈머 variants. The 53 short-only keys include default:13525, the standalone Phasmer’s Curse title; exclude that complete title. Review the three same-full keys separately as follow-ups, preserving each prior index status/evidence; do not recount the other 15 full-name rows. Humm at default:12209 is an interjection and is not an alias. No global Humm alias or new entity is created.'

  module_function

  def key(source)
    M.key(source)
  end

  def texts(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json") || '[]').compact
  end

  def english_counts(source)
    english = texts(source, 'en').join("\n")
    full = english.scan(FULL_PATTERN).length
    short = english.scan(SHORT_EN_PATTERN).length - full
    [full, short]
  end

  def korean_spans(text)
    offset = 0
    text.split(/(#{ReviewedProperNameDiscovery::OPAQUE.source})/).each_with_index.flat_map do |part, index|
      start_offset = offset
      offset += part.length
      next [] if index.odd?
      part.to_enum(:scan, SHORT_PATTERN).map do
        match = Regexp.last_match
        [start_offset + match.begin(0), start_offset + match.end(0), match[0]]
      end
    end
  end

  def korean_mentions(text)
    korean_spans(text).length
  end

  def mask_short_names(text)
    outside_tokens(text) { |part| part.gsub(SHORT_PATTERN, "\0SHORT\0") }
  end

  def outside_tokens(text)
    text.split(/(#{ReviewedProperNameDiscovery::OPAQUE.source})/).each_with_index.map do |part, index|
      index.odd? ? part : yield(part)
    end.join
  end

  def canonicalize(text, expected_count)
    spans = korean_spans(text)
    raise "Phasmer English/Korean mention count differs: #{expected_count} != #{spans.length}" unless
      spans.length == expected_count

    result = text.dup
    spans.reverse_each do |start_at, end_at, old|
      replacement = old.start_with?('늙은 ') ? "늙은 #{KOREAN}" : KOREAN
      result[start_at...end_at] = replacement
    end
    raise 'Phasmer replacement changed unrelated Korean text' unless
      mask_short_names(result) == mask_short_names(text)
    raise 'Phasmer short-name pairing incomplete' unless
      korean_mentions(result) == expected_count &&
      result.scan(/파스머\(Phasmer\)/).length == expected_count
    result
  end

  def source_keys(inventory)
    short_only = []
    same_full = []
    inventory.each_value do |source|
      full, short = english_counts(source)
      next if short.zero?
      raise "unexpected Phasmer resource #{key(source).inspect}" unless source['resource'] == 'default'
      (full.zero? ? short_only : same_full) << key(source)
    end
    [short_only.sort, same_full.sort]
  end

  def expected_short_keys
    SHORT_ONLY_IDS.map { |id| ['default', id, ''] }.sort
  end

  def expected_same_full_keys
    SAME_FULL_IDS.map { |id| ['default', id, ''] }.sort
  end

  def validate_scope!(inventory)
    short_only, same_full = source_keys(inventory)
    unless short_only == expected_short_keys && same_full == expected_same_full_keys
      raise "D-21079 source scope changed: short-only=#{short_only.map { |k| k[1] }.join(',')} " \
            "same-full=#{same_full.map { |k| k[1] }.join(',')}"
    end
    raise 'D-21079 expected 53 short-only and 3 same-full keys' unless
      short_only.length == 53 && same_full.length == 3
  end

  def glossary_entry!(glossary)
    entries = glossary.select { |row| row['entity_key'] == ENTITY }
    raise 'D-21079 registered entity missing or duplicated' unless entries.length == 1
    entry = entries.first
    raise 'D-21079 registered entity identity changed' unless
      entry['category'] == 'person' && entry['english_canonical'] == FULL_NAME &&
      entry['korean_canonical'] == FULL_KOREAN
    raise 'D-21079 alias already registered; refusing duplicate update' if
      entry['english_aliases'].to_s.split('|').include?(ENGLISH)
    owners = glossary.select do |row|
      ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
        .any? { |term| term.casecmp(ENGLISH).zero? }
    end
    raise 'D-21079 English alias belongs to another glossary entity' unless owners.empty?
    entry
  end

  def index_row_key(row)
    [row.fetch('entity_key'), *M.key(row)]
  end

  def validate_index!(index, inventory = nil)
    matching = index.select { |row| row['entity_key'] == ENTITY }
    by_key = matching.group_by { |row| key(row) }
    expected_full = FULL_NAME_IDS.map { |id| ['default', id, ''] }.sort
    raise 'D-21079 full-name index coverage changed' unless by_key.keys.sort == expected_full
    raise 'D-21079 duplicate full-name index key' if by_key.any? { |_key, rows| rows.length != 1 }
    matching.each do |row|
      raise "D-21079 full-name disposition not terminal #{key(row).inspect}" unless
        %w[accepted not-an-issue].include?(row.fetch('status'))
      if inventory
        source = inventory.fetch(key(row))
        raise "D-21079 full-name index text is stale #{key(row).inspect}" unless
          row.fetch('korean_current') == source.fetch('work_text')
      end
    end
    expected_same_full_keys.each do |row_key|
      row = by_key.fetch(row_key).first
      raise "D-21079 same-full prior evidence missing #{row_key.inspect}" if row['evidence'].to_s.empty?
    end
    unexpected_alias = expected_short_keys.find do |row_key|
      by_key.key?(row_key)
    end
    raise "D-21079 short alias occurrence already indexed #{unexpected_alias.inspect}" if unexpected_alias
    raise 'D-21079 excluded title unexpectedly indexed as a person' if by_key.key?(TITLE_KEY)
    by_key
  end

  def validate_anchor_evidence!(inventory)
    {
      '864' => [/ファズマー・ヒュム/, /法斯玛·胡姆/],
      '24498' => [/ファズマー・ヒュム/, /法斯玛·胡姆/],
      '42521' => [/ファズマー・ヒュム/, /法斯玛·胡姆/]
    }.each do |id, patterns|
      source = inventory.fetch(['default', id, ''])
      ja = texts(source, 'ja').join("\n")
      zh = source.fetch('zh_text')
      raise "D-21079 Japanese identity anchor changed default:#{id}" unless ja.match?(patterns[0])
      raise "D-21079 Chinese identity anchor changed default:#{id}" unless zh.match?(patterns[1])
    end
    title = inventory.fetch(TITLE_KEY)
    english = texts(title, 'en').join("\n")
    raise 'D-21079 title exclusion source changed' unless english == "Phasmer's Curse"
    raise 'D-21079 Humm interjection source changed' unless
      texts(inventory.fetch(['default', '12209', '']), 'en').join("\n") == 'Humm'
  end

  def review_row(source, scope, previous = nil)
    entity_index_row = previous
    full, short = english_counts(source)
    raise 'D-21079 invalid review scope' unless
      (scope == 'short-only' && full.zero? && short.positive?) ||
      (scope == 'same-full-followup' && full.positive? && short.positive?) ||
      (scope == 'excluded-title' && key(source) == TITLE_KEY)

    old = source.fetch('work_text')
    japanese = texts(source, 'ja').join("\n")
    chinese = source.fetch('zh_text')
    raise "D-21079 Japanese/Chinese alias evidence missing #{key(source).inspect}" unless
      japanese.match?(JA_ALIAS_PATTERN) || chinese.match?(ZH_ALIAS_PATTERN)
    new_text = scope == 'excluded-title' ? old : canonicalize(old, short)
    status = if scope == 'excluded-title'
               'excluded'
             else
               old == new_text ? 'not-an-issue' : 'accepted'
             end
    prev_status = entity_index_row ? JSON.generate(ENTITY => entity_index_row.fetch('status')) : ''
    prev_evidence = entity_index_row ? JSON.generate(ENTITY => entity_index_row.fetch('evidence')) : ''
    {
      'resource' => source.fetch('resource'), 'ID_Linha' => source.fetch('ID_Linha'),
      'Tipo_Variante' => source['Tipo_Variante'].to_s, 'entity_key' => ENTITY,
      'status' => status, 'old' => old, 'new' => new_text,
      'evidence' => NOTES,
      'english' => texts(source, 'en').join("\n"),
      'japanese' => texts(source, 'ja').join("\n---\n"),
      'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(ENTITY => status),
      'previous_status' => prev_status, 'previous_evidence' => prev_evidence,
      'review_scope' => scope
    }
  end

  def build_reviews(inventory, glossary, index)
    glossary_entry!(glossary)
    index_by_key = validate_index!(index, inventory)
    validate_scope!(inventory)
    validate_anchor_evidence!(inventory)
    short_only, same_full = source_keys(inventory)
    reviews = short_only.map do |row_key|
      source = inventory.fetch(row_key)
      scope = row_key == TITLE_KEY ? 'excluded-title' : 'short-only'
      review_row(source, scope)
    end
    reviews.concat(same_full.map do |row_key|
      review_row(inventory.fetch(row_key), 'same-full-followup',
                 index_by_key.fetch(row_key).first)
    end)
    reviews.sort_by! { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
    raise 'D-21079 duplicate manifest row key' unless reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    raise 'D-21079 unexpected source/status evidence gap' if reviews.any? do |row|
      %w[english japanese chinese evidence].any? { |field| row.fetch(field).strip.empty? } ||
        row.fetch('entity_dispositions_json') != JSON.generate(ENTITY => row.fetch('status'))
    end
    reviews
  end

  def current_inventory(resource = 'default')
    rows = %w[en_us ja_jp zh_cn work].map do |locale|
      read_rows(inventory_paths(M::ROOT, locale, resource))
    end
    build_inventory(resource, *rows).map { |values| OUTPUT_HEADERS.zip(values).to_h }
      .to_h { |row| [key(row), row] }
  end

  def read_inventory(path)
    rows = M.table(path).map(&:to_h)
    indexed = rows.to_h { |row| [key(row), row] }
    raise 'D-21079 duplicate inventory source key' unless rows.length == indexed.length
    indexed
  end

  def verify_fresh_rows!(inventory)
    current = current_inventory
    (expected_short_keys + expected_same_full_keys + FULL_NAME_IDS.map { |id| ['default', id, ''] }).uniq.each do |row_key|
      raise "D-21079 inventory/source is stale at #{row_key.inspect}" unless
        inventory.fetch(row_key) == current.fetch(row_key)
    end
  end

  def apply_script
    <<~RUBY
      #!/usr/bin/env ruby
      abort 'usage: apply-phasmer-alias-D21079.rb --apply' unless ARGV == ['--apply']
      require #{File.join(M::AUDIT, 'prepare-phasmer-alias-D21079.rb').dump}
      PhasmerAliasD21079.apply!(#{REVIEW_PATH.dump})
    RUBY
  end

  def run(argv = ARGV)
    inventory_path = M::INVENTORY
    unless argv.empty?
      raise 'usage: prepare-phasmer-alias-D21079.rb [FRESH_INVENTORY.tsv]' unless argv.length == 1
      inventory_path = argv.first
    end
    [REVIEW_PATH, APPLY_PATH].each do |path|
      raise "D-21079 output already exists: #{path}" if File.exist?(path)
    end
    inventory = read_inventory(inventory_path)
    verify_fresh_rows!(inventory)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    reviews = build_reviews(inventory, glossary, index)
    File.open(REVIEW_PATH, 'w:UTF-8') do |file|
      csv = CSV.new(file, col_sep: "\t", row_sep: "\r\n", force_quotes: true)
      csv << REVIEW_HEADERS
      reviews.each { |row| csv << REVIEW_HEADERS.map { |header| row[header] } }
    end
    File.write(APPLY_PATH, apply_script)
    File.chmod(0o755, APPLY_PATH)
    short = reviews.select { |row| %w[short-only excluded-title].include?(row['review_scope']) }
    followup = reviews.select { |row| row['review_scope'] == 'same-full-followup' }
    title_count = short.count { |row| row['review_scope'] == 'excluded-title' }
    puts "D-21079 alias review: #{short.length} short-only keys #{status_counts(short)} " \
         "(#{title_count} standalone title excluded); " \
         "#{followup.length} same-full follow-ups #{status_counts(followup)}."
    puts "Manifest: #{REVIEW_PATH}; apply script (requires --apply): #{APPLY_PATH}"
  end

  def status_counts(rows)
    rows.group_by { |row| row['status'] }.transform_values(&:length)
  end

  def append_terms(old, additions)
    (old.to_s.split('|').reject(&:empty?) + additions).uniq.join('|')
  end

  def serialize_table(headers, rows)
    CSV.generate(col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << headers
      rows.each { |row| csv << headers.map { |header| row[header] } }
    end
  end

  def validate_manifest!(reviews, inventory, glossary, index)
    expected = build_reviews(inventory, glossary, index)
    raise 'D-21079 reviewed manifest no longer matches source/previous dispositions' unless
      reviews == expected
    raise 'D-21079 accepted edit contains no text change' if reviews.any? do |row|
      row['status'] == 'accepted' && row['old'] == row['new']
    end
  end

  def apply!(manifest_path)
    reviews = CSV.read(manifest_path, headers: true, col_sep: "\t").map(&:to_h)
    inventory = current_inventory
    glossary_table = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    glossary = glossary_table.map(&:to_h)
    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    validate_manifest!(reviews, inventory, glossary, index)

    entity = glossary_entry!(glossary)
    entity['english_aliases'] = append_terms(entity['english_aliases'], [ENGLISH])
    entity['korean_variants'] = append_terms(entity['korean_variants'], ['파스머'])
    entity['evidence_ids'] = append_terms(entity['evidence_ids'], ['D-21079'])
    entity['notes'] = [entity['notes'], NOTES].reject(&:empty?).join(' ')

    row_by_key = reviews.to_h { |row| [key(row), row] }
    entity_index = validate_index!(index)
    alias_definition = entity.dup
    generated = build_occurrences(inventory.values, [alias_definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated_by_key = generated.to_h { |row| [key(row), row] }
    raise 'D-21079 duplicate alias occurrence generation' unless generated_by_key.length == generated.length
    expected_generated = (FULL_NAME_IDS + SHORT_ONLY_IDS).uniq
      .map { |id| ['default', id, ''] }.sort
    raise 'D-21079 alias matcher/source key coverage differs' unless
      generated_by_key.keys.sort == expected_generated
    target_alias_keys = (expected_short_keys - [TITLE_KEY]) + expected_same_full_keys
    target_alias_keys.each do |row_key|
      raise "D-21079 alias occurrence missing #{row_key.inspect}" unless generated_by_key.key?(row_key)
    end

    index_by_key = index.to_h { |row| [index_row_key(row), row] }
    (expected_short_keys - [TITLE_KEY]).each do |row_key|
      review = row_by_key.fetch(row_key)
      index_key = [ENTITY, *row_key]
      raise "D-21079 refusing existing short index key #{index_key.inspect}" if index_by_key.key?(index_key)
      occurrence = generated_by_key.fetch(row_key)
      index << occurrence.merge(
        'status' => 'needs-context',
        'evidence' => 'D-21079: newly discovered short-name alias; awaiting batch checkpoint.'
      )
      index_by_key[index_key] = index.last
    end
    expected_same_full_keys.each do |row_key|
      existing = entity_index.fetch(row_key).first
      terms = (existing['matched_english'].to_s.split('|') + [ENGLISH]).uniq
      existing['matched_english'] = terms.join('|')
    end
    index.sort_by! do |row|
      [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i,
       row['Tipo_Variante'].to_s, row['entity_key']]
    end

    M.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary_table.headers, glossary)
    M.write_table(M::INDEX, index_table.headers, index)
    M.run(
      manifest_path, 21079, nil,
      review_states: %w[needs-context accepted not-an-issue]
    )

    scope_note = <<~TEXT

      ## Scope Note

      The source scan also found `default:13525`, the standalone title
      “Phasmer's Curse”; it is explicitly excluded from the Phasmer-person
      alias and is not counted as a reviewed person row. The 55 processed
      person keys comprise 52 newly indexed short-name keys and three
      same-row short-name follow-ups; the other 15 previously terminal
      full-name rows were not reopened.
    TEXT
    %w[
      named-scope-review-D21079-20261016.md
      named-scope-edit-addendum-D21079-20261016.md
      named-scope-review-D21080-20261016.md
      named-scope-edit-addendum-D21080-20261016.md
    ].each do |name|
      File.open(File.join(M::AUDIT, name), 'a') { |file| file.write(scope_note) }
    end
  end
end

PhasmerAliasD21079.run if $PROGRAM_NAME == __FILE__
