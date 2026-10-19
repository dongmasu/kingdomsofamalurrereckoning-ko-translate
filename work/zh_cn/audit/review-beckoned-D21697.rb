#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-short-label-discovery-20261018'

module ReviewBeckonedD21697
  extend self

  M = ReviewedNameBatches
  D = 21_697
  PRIOR_SNAPSHOT = File.join(__dir__, 'proper-name-short-label-discovery-D21696.tsv')
  CANDIDATE_OUTPUT = File.join(__dir__, 'proper-name-short-label-dispositions-D21697.tsv')
  NEXT_SNAPSHOT = File.join(__dir__, 'proper-name-short-label-discovery-D21697.tsv')
  DEFINITION_OUTPUT = File.join(__dir__, 'proper-name-discovery-definitions-D21697.tsv')
  REVIEW_OUTPUT = File.join(__dir__, 'proper-name-discovery-D21697.tsv')
  ENTITY = 'title:beckoned'
  ALIASES = 'The Beckoned'
  TITLE_KEYS = 448
  VERB_KEYS = 15
  ALL_KEYS = TITLE_KEYS + VERB_KEYS
  LOWERCASE_TITLE_KEY = ['default', '9273', ''].freeze
  ETHENE_TITLE_KEY = ['default', '12812', ''].freeze
  SPACED_TITLE_KEY = ['default', '17633', ''].freeze
  EXCLUDED_KEYS = %w[
    169 6706 8080 8523 15714 17188 19783 23416 31442 32235
    50648 54048 61460 62616 63664
  ].map { |id| ['default', id, ''] }.to_set.freeze

  DEFINITION = {
    'entity_key' => ENTITY,
    'english_canonical' => 'Beckoned',
    'category' => 'title',
    'korean_canonical' => '부름받은 자(Beckoned)',
    'english_aliases' => ALIASES,
    'korean_variants' => '불려온 자|불려 온 자|선택받은 자|초대받은 자|부름을 받은 자',
    'evidence_ids' => 'D-21697|D-692|D-3115|D-18212|default:9273|default:12812|default:17633',
    'status' => 'confirmed',
    'notes' => <<~TEXT.gsub(/\s+/, ' ').strip
      English uses Beckoned as the protagonist's recurring title, including
      the source-local The Beckoned form. The full aligned corpus contains
      448 title references and 15 lowercase ordinary-verb uses; the latter
      are explicitly excluded. Japanese 招かれし者 appears in 257 title rows;
      Chinese 天选者 or 召唤者 appears in 436. Every title row has at least one
      aligned supporting form, though Japanese sometimes omits direct address.
      English is the identity anchor. D-692 and D-3115 establish 부름받은 자 as the Korean
      title form. This source-wide review standardizes only this title span
      and adds its English annotation; other exact-row translation findings
      and entity owners remain unchanged. Beckoned of Ethene at default:12812
      retains the source-specific qualifier. The official Korean manual has
      no direct entry for this expansion title.
    TEXT
  }.freeze

  TITLE_SPAN = /
    (?<form>
      부름받은\s*자|불려온\s*자|불려\s+온\s*자|선택받은\s*자|
      초대받은\s*자|부름을\s+받은\s*자
    )
    (?<annotation>\s*\((?:The[ ])?Beckoned\))?
  /x

  PARTICLES = %w[
    이라는 이라고 이라며 이라서 이라도 이든지 이든
    여에게 여까지 여도 여는 여가 여를 여와 여과 여의
    에게 에서 으로 까지 부터 보다 라고 라는 라며
    는 가 를 을 은 이 와 과 의 도 만 로 여 들
  ].sort_by { |value| -value.length }.freeze

  CANDIDATE_HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze

  def inventory_rows
    M.refresh_inventory.values
  end

  def source_title?(key, source)
    return false if EXCLUDED_KEYS.include?(key)
    return true if key == LOWERCASE_TITLE_KEY

    JSON.parse(source.fetch('en_texts_json')).compact.any? do |text|
      text.match?(/(?<![A-Za-z])Beckoned(?![A-Za-z])/)
    end
  end

  def english_has_match?(source)
    JSON.parse(source.fetch('en_texts_json')).compact.any? do |text|
      text.match?(/(?<![A-Za-z])Beckoned(?![A-Za-z])/i)
    end
  end

  def canonicalize(text, key, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "English title missing at #{key.inspect}" unless
      english_has_match?(source) && source_title?(key, source)

    revised = text.dup
    if key == ETHENE_TITLE_KEY
      revised.sub!(
        '에테네(Ethene)의 부름을 받은 자',
        '에테네(Ethene)의 부름받은 자(Beckoned)'
      )
    end

    particle_pattern = Regexp.new(
      "(?<name>부름받은\\s*자|불려온\\s*자|불려\\s+온\\s*자|선택받은\\s*자|초대받은\\s*자|부름을\\s+받은\\s*자)" \
      "(?<particle>#{PARTICLES.map { |p| Regexp.escape(p) }.join('|')})\\s*" \
      "(?<label>\\((?:The )?Beckoned\\))"
    )
    revised.gsub!(particle_pattern) do
      match = Regexp.last_match
      label = match[:label].strip
      "#{match[:name]}#{label}#{match[:particle]}"
    end

    revised.gsub(TITLE_SPAN) do
      match = Regexp.last_match
      label = match[:annotation].to_s.strip
      label = '(Beckoned)' if label.empty?
      "부름받은 자#{label}"
    end
  end

  def disposition(key, source, old, revised)
    return ['excluded', old, 'English lowercase beckoned is an ordinary verb here, not the player title.'] if
      EXCLUDED_KEYS.include?(key)

    raise "unclassified English match at #{key.inspect}" unless english_has_match?(source)
    raise "title source classification mismatch at #{key.inspect}" unless source_title?(key, source)
    raise "Korean title span missing at #{key.inspect}" if revised == old &&
      !old.match?(TITLE_SPAN) && key != ETHENE_TITLE_KEY

    status = revised == old ? 'not-an-issue' : 'accepted'
    evidence = 'English identifies the player title Beckoned; aligned Japanese and Chinese were checked as supporting context. Reuse 부름받은 자(Beckoned), preserving the source-local qualifier at default:12812, particles, line breaks, and all other text.'
    [status, revised, evidence]
  end

  def candidate_keys(snapshot)
    row = M.table(snapshot).find { |candidate| candidate['english_candidate'] == 'Beckoned' }
    raise 'Beckoned candidate missing from prior snapshot' unless row
    keys = (JSON.parse(row.fetch('unpaired_label_keys_json')) +
      JSON.parse(row.fetch('paired_evidence_keys_json')))
      .map { |key| key.map(&:to_s) }.uniq
    raise "Beckoned candidate coverage differs: #{keys.length}" unless keys.length == 43
    keys
  end

  def source_rows(rows)
    rows.to_h { |row| [M.key(row), row] }
  end

  def ordered_keys(matches, candidates)
    keys = matches.map { |row| M.key(row) }
    missing = candidates - keys
    raise "candidate keys absent from full source scope: #{missing.inspect}" unless missing.empty?
    candidates + (keys - candidates).sort_by do |key|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end
  end

  def reviews_for(rows, keys, prior_index)
    inventory = source_rows(rows)
    keys.map do |key|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      is_title = source_title?(key, source)
      status, revised, reason = if is_title
        canonical = canonicalize(old, key, source)
        disposition(key, source, old, canonical)
      else
        disposition(key, source, old, old)
      end
      prior = prior_index.select { |entry| M.key(entry) == key }
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => revised,
        'evidence' => reason,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate({ ENTITY => status }),
        'prior_index_dispositions_json' => JSON.generate(
          prior.map do |entry|
            [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')]
          end
        )
      }
    end
  end

  def candidate_dispositions(candidates, inventory, prior_index)
    candidates.map do |key|
      source = inventory.fetch(key)
      prior = prior_index.select { |entry| M.key(entry) == key }
      {
        'english_candidate' => 'Beckoned',
        'disposition' => 'registered-title',
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'korean' => source.fetch('work_text'),
        'evidence' => 'D-21697 registers Beckoned as the recurring player title after checking all 463 exact source keys. This candidate key is included in the first bounded review batch; existing row owners remain unchanged.',
        'prior_index_dispositions_json' => JSON.generate(
          prior.map do |entry|
            [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')]
          end
        )
      }
    end
  end

  def build
    candidates = candidate_keys(PRIOR_SNAPSHOT)
    rows = inventory_rows
    matches = rows.select { |row| english_has_match?(row) }
    raise "full Beckoned source-key count differs: #{matches.length}" unless matches.length == ALL_KEYS
    inventory = source_rows(rows)
    title_keys = matches.map { |row| M.key(row) if source_title?(M.key(row), row) }.compact
    verb_keys = matches.map { |row| M.key(row) if EXCLUDED_KEYS.include?(M.key(row)) }.compact
    raise "title count differs: #{title_keys.length}" unless title_keys.length == TITLE_KEYS
    raise "ordinary-verb count differs: #{verb_keys.length}" unless verb_keys.length == VERB_KEYS
    title_rows = title_keys.map { |key| inventory.fetch(key) }
    ja_support = title_rows.count do |row|
      JSON.parse(row.fetch('ja_texts_json')).compact.join("\n").include?('招かれし者')
    end
    zh_support = title_rows.count { |row| row.fetch('zh_text').match?(/天选者|召唤者/) }
    unsupported = title_rows.reject do |row|
      JSON.parse(row.fetch('ja_texts_json')).compact.join("\n").include?('招かれし者') ||
        row.fetch('zh_text').match?(/天选者|召唤者/)
    end
    raise "unconfirmed cross-locale title evidence: #{unsupported.map { |row| M.key(row).inspect }}" unless
      unsupported.empty?
    raise "Japanese support count differs: #{ja_support}" unless ja_support == 257
    raise "Chinese support count differs: #{zh_support}" unless zh_support == 436
    raise 'D-21697 would exceed 50 distinct keys' if candidates.length > 50

    prior_index = M.table(M::INDEX).map(&:to_h)
    keys = ordered_keys(matches, candidates)
    reviews = reviews_for(rows, keys, prior_index)
    raise 'first batch does not contain 43 candidates plus seven source rows' unless
      reviews.first(50).map { |row| M.key(row) }.uniq.length == 50 &&
      (candidates - reviews.first(50).map { |row| M.key(row) }).empty?
    changes = reviews.count { |row| row['status'] == 'accepted' }
    unchanged = reviews.count { |row| row['status'] == 'not-an-issue' }
    excluded = reviews.count { |row| row['status'] == 'excluded' }
    raise 'all title rows do not have a Korean title span' unless
      reviews.select { |row| row['status'] != 'excluded' }.all? do |row|
        row['new'].match?(TITLE_SPAN) || row['new'].include?('부름을 받은 자(Beckoned)')
      end
    [rows, matches, candidates, prior_index, reviews, {
      accepted: changes, not_an_issue: unchanged, excluded: excluded
    }, { japanese_support: ja_support, chinese_support: zh_support }]
  end

  def dry_run
    rows, matches, candidates, prior_index, reviews, counts, support = build
    defs = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers.zip(DEFINITION.values_at(
      'entity_key', 'english_canonical', 'category', 'korean_canonical',
      'english_aliases', 'korean_variants', 'evidence_ids', 'status', 'notes'
    )).to_h
    generated = build_occurrences(rows, [DEFINITION]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "generated source coverage differs: #{generated.length}" unless generated.length == ALL_KEYS
    ReviewedProperNameDiscovery.validate!(
      [defs], reviews.map { |row| row.slice(*M::HEADERS.take(12)) }, generated,
      M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h),
      prior_index
    )
    edits = reviews.select { |row| row['status'] == 'accepted' }
    edits.group_by { |row| row.fetch('resource') }.each do |resource, group|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), group)
    end
    puts "D-#{D} read-only dry run: #{matches.length} exact source keys; " \
      "#{TITLE_KEYS} title references and #{VERB_KEYS} ordinary-verb exclusions; " \
      "first batch=#{candidates.length} candidates + #{50 - candidates.length} source-context keys; " \
      "dispositions=#{counts.inspect}; edits=#{edits.length} Texto cells; " \
      "JA title support=#{support[:japanese_support]}, ZH title support=#{support[:chinese_support]}."
  end

  def apply
    dry_run
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    rows, matches, candidates, prior_index, reviews, = build
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    glossary.headers.zip(DEFINITION.values_at(
      'entity_key', 'english_canonical', 'category', 'korean_canonical',
      'english_aliases', 'korean_variants', 'evidence_ids', 'status', 'notes'
    )).tap do |definition|
      M.write_table(DEFINITION_OUTPUT, glossary.headers, [definition.to_h])
    end
    M.write_table(REVIEW_OUTPUT, M::HEADERS.take(12), reviews.map { |row| row.slice(*M::HEADERS.take(12)) })
    ReviewedProperNameDiscovery.run([DEFINITION_OUTPUT, REVIEW_OUTPUT, D.to_s])

    inventory = M.refresh_inventory
    current_glossary = M.table(glossary_path).map(&:to_h)
    current_index = M.table(M::INDEX).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(
      inventory.values, current_glossary, current_index
    )
    raise "next candidate snapshot already exists: #{NEXT_SNAPSHOT}" if File.exist?(NEXT_SNAPSHOT)
    M.write_table(NEXT_SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    disposition_rows = candidate_dispositions(candidates, inventory, prior_index)
    M.write_table(CANDIDATE_OUTPUT, CANDIDATE_HEADERS, disposition_rows)

    note = <<~TEXT

      ## D-21697-D-21706: Beckoned Title And Full-Source Occurrences

      Reviewed all 463 exact affix/base/default source keys: 448 title
      references and 15 lowercase ordinary-verb uses excluded from the title.
      Japanese 招かれし者 occurs in 257 title rows and Chinese 天选者/召唤者 in
      436; every title row has at least one of these supporting forms.
      Registered `title:beckoned` as `부름받은 자(Beckoned)`, with `The Beckoned`
      retained as a source alias. D-692 and D-3115 establish the Korean title;
      English meaning, Japanese `招かれし者`, and Chinese `天选者` were compared.
      Normalize only the title span, including its English annotation; preserve
      particles and all other row/entity decisions. D-21697's first batch
      prioritizes all 43 short-label candidate keys. Exact locale text and prior
      row owners are in `proper-name-short-label-dispositions-D21697.tsv`;
      all per-key changes and exclusions are in the D-21697-D-21706 manifests.
      D-18212's historical uncertain findings are superseded only on this
      corpus-wide Beckoned title form; unrelated row judgments remain intact.
      Refreshed bounded short-label snapshot:
      `proper-name-short-label-discovery-D21697.tsv` (#{snapshot.length} groups;
      not an exhaustive universe or completion estimate). Full proper-name
      discovery remains incomplete.
    TEXT
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [report, addendum].each { |path| File.open(path, 'a') { |file| file.write(note) } }
    [File.join(__dir__, 'README.md'), File.join(__dir__, 'decision-register-20261009.md')].each do |path|
      File.open(path, 'a') { |file| file.write(note) }
    end

    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    M::DOCS.each do |path|
      text = File.read(path)
      block = text[marker]
      raise "current checkpoint missing in #{path}" unless block
      block.sub!(/Next batch: D-21707;.*?\n/,
        "Next batch: D-21707; continue from `proper-name-short-label-discovery-D21697.tsv` (#{snapshot.length} bounded groups; not an exhaustive total or completion estimate). Preserve explicit candidate holds in prior disposition manifests.\n")
      text.sub!(marker, block)
      File.write(path, text)
    end
    puts "Registered #{ENTITY}; reviewed #{matches.length} exact keys in D-#{D}-D-21706; " \
      "#{snapshot.length} bounded groups remain in the refreshed candidate snapshot."
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['dry-run'] then ReviewBeckonedD21697.dry_run
  when ['apply'] then ReviewBeckonedD21697.apply
  else abort 'usage: review-beckoned-D21697.rb dry-run|apply'
  end
end
