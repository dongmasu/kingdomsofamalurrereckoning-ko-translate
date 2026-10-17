#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module VipersD21458
  extend self

  M = ReviewedNameBatches
  D = 21_458
  ENTITY = 'faction:the-vipers'
  CANONICAL = '바이퍼스(The Vipers)'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  ENGLISH_ANCHORS = {
    '1575' => "Don't underestimate the Vipers.",
    '1970' => 'They say the Vipers are formidable.',
    '8122' => "The Vipers' multiple disciplines weren't enough to defeat you",
    '8549' => 'The Vipers had no real advantage',
    '13122' => 'The Vipers were the favorite to win in the early rounds.',
    '16592' => 'the Crows against Holden LaFayette and his Vipers!',
    '18198' => "The Vipers vs. The Ravens\nFranz Englehart: 20,000 - The Vipers\n" \
               "Alard Aedic: 1,000 - The Ravens\nAdrian Agni: 10,000 - The Vipers",
    '18406' => 'Tell me about the Vipers.',
    '18703' => "Those Vipers won't know what hit them.",
    '21057' => 'Vipers',
    '21746' => 'Tell me about the Vipers.',
    '22209' => 'The Vipers employ several disciplines of combat.',
    '23923' => 'Tell me about the Vipers.',
    '28316' => 'Vipers',
    '29745' => "The Vipers aren't strong at any one thing.",
    '46163' => 'I must slay Holden LaFayette and the Vipers',
    '49230' => 'Your opponents are the Vipers, a team with fighters trained from many disciplines.',
    '49506' => 'Your next opponents are Holden LaFayette and the Vipers, a team with eclectic strengths.',
    '60283' => 'You tore those Vipers to pieces!',
    '61695' => "Your opponents are the Vipers",
    '62103' => "the Crows deal with the Vipers' eclectic line-up!",
    '63116' => 'The Vipers are a new team, but effective.'
  }.freeze
  DEFAULT_IDS = ENGLISH_ANCHORS.keys.freeze
  GENERIC_ANCHORS = {
    '8072' => 'I am an honest man in a village of vipers.',
    '40510' => 'A boot full of vipers, this place.',
    '49864' => 'Go back to that nest of sand vipers, where you belong.'
  }.freeze
  EDIT_IDS = %w[
    1575 1970 8549 18198 18406 18703 21057 29745 46163 49230 49506 62103 63116
  ].freeze
  NAME_SPAN = /(?<![가-힣A-Za-z])(?:바이퍼스|바이퍼즈)(?:\((?:The )?Vipers\)|(?!(?:\s*)\()(?=[^가-힣A-Za-z]|\z|(?:에게는|는|를|야|의)(?![가-힣A-Za-z])))/
  PROTECTED = Regexp.union(ReviewedProperNameDiscovery::OPAQUE, NAME_SPAN, /\([^()\r\n]*\)/)
  NOTE = 'English default:63116 explicitly identifies the Vipers as a new arena team led by Holden; 49506/49230 describe its mixed-discipline fighters and 18198 lists its arena bets. Japanese ヴァイパーズ and Chinese 毒蛇队/毒蛇 corroborate all 22 scoped rows. Category faction denotes the named arena team, not a political faction. Use 바이퍼스, preserving source-local Vipers in prose and the complete The Vipers roster label. Correct only the observed 바이퍼즈 variant and missing/mismatched annotations. No singular Viper identity is inferred. A temporary in-memory search also finds lowercase generic vipers at default:8072/40510/49864; exclude them without edits or new occurrence dispositions. Therefore no global Vipers alias is registered. Existing other-entity/key terminal decisions, roles, tokens, particles and line breaks remain unchanged. This is a new entity scope only; earlier translation decisions and historical global tallies are not reopened or recounted.'

  def expected_keys
    DEFAULT_IDS.map { |id| ['default', id, ''] }
  end

  def definitions_for(headers)
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => 'The Vipers',
      'category' => 'faction', 'korean_canonical' => CANONICAL,
      'english_aliases' => '', 'korean_variants' => '바이퍼스|바이퍼즈',
      'evidence_ids' => "D-#{D}|default:63116|default:49506|default:18198",
      'status' => 'confirmed', 'notes' => NOTE
    }
    [headers.to_h { |header| [header, fields.fetch(header)] }]
  end

  def active_inventory
    rows = RESOURCES.flat_map do |resource|
      sources = (LOCALES + ['work']).map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *sources).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end
    keyed = rows.to_h { |row| [M.key(row), row] }
    raise 'duplicate aligned inventory key' unless keyed.length == rows.length
    keyed
  end

  def evidence(source)
    [
      JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
      JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
      source.fetch('zh_text')
    ]
  end

  def source_occurrences(inventory, definitions)
    raise 'Vipers must not be a global alias' unless definitions.one? &&
      definitions.first.fetch('english_aliases').empty?
    # Search-only alias: retain the real, alias-free definition for registration.
    search = definitions.map { |row| row.merge('english_aliases' => 'Vipers') }
    hits = build_occurrences(inventory.values, search).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generic_keys = GENERIC_ANCHORS.keys.map { |id| ['default', id, ''] }
    raise 'Vipers all-resource source scope differs' unless
      hits.map { |row| M.key(row) }.sort == (expected_keys + generic_keys).sort
    generic_keys.each do |key|
      en, ja, zh = evidence(inventory.fetch(key))
      raise "generic vipers exclusion differs #{key.inspect}" unless
        en.include?(GENERIC_ANCHORS.fetch(key[1])) &&
        en.scan(/\bvipers\b/).length == 1 && !en.match?(/\bVipers\b/) &&
        ja.include?('毒ヘビ') && !ja.include?('ヴァイパーズ') && zh.include?('毒蛇')
    end
    hits.reject { |row| generic_keys.include?(M.key(row)) }
  end

  def name_span?(span)
    span.match?(/\A#{NAME_SPAN}\z/)
  end

  def name_spans(text)
    text.scan(PROTECTED).select { |span| name_span?(span) }
  end

  def skeleton(text)
    text.gsub(PROTECTED) { |span| name_span?(span) ? '__D21458_NAME__' : span }
  end

  def local_pair(id)
    raise "unreviewed Vipers key #{id}" unless DEFAULT_IDS.include?(id)
    id == '18198' ? CANONICAL : '바이퍼스(Vipers)'
  end

  def normalize(text, id)
    pair = local_pair(id)
    text.gsub(PROTECTED) { |span| name_span?(span) ? pair : span }
  end

  def reviews_for(inventory, generated)
    raise 'Vipers team source scope differs' unless generated.length == 22 &&
      generated.all? { |row| row['entity_key'] == ENTITY } &&
      generated.map { |row| M.key(row) }.sort == expected_keys.sort
    generated.sort_by { |row| row.fetch('ID_Linha').to_i }.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      en, ja, zh = evidence(source)
      mentions = key[1] == '18198' ? 3 : 1
      raise "Vipers locale/identity evidence differs #{key.inspect}" unless
        en.include?(ENGLISH_ANCHORS.fetch(key[1])) &&
        en.scan(/\bVipers\b/).length == mentions &&
        ja.scan('ヴァイパーズ').length == mentions &&
        zh.scan(/毒蛇(?:队)?/).length == mentions
      old = source.fetch('work_text')
      proposed = normalize(old, key[1])
      raise "Vipers Korean name-span coverage differs #{key.inspect}" unless
        name_spans(old).length == mentions &&
        name_spans(proposed) == Array.new(mentions, local_pair(key[1]))
      raise 'Vipers normalization not idempotent' unless normalize(proposed, key[1]) == proposed
      raise 'unrelated Vipers row text changed' unless skeleton(old) == skeleton(proposed)
      status = old == proposed ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => NOTE, 'english' => en, 'japanese' => ja, 'chinese' => zh,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'prepared outputs exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX).map(&:to_h)
    definitions = definitions_for(glossary.headers)
    inventory = active_inventory
    generated = source_occurrences(inventory, definitions)
    reviews = reviews_for(inventory, generated)
    raise 'Vipers batch exceeds fifty rows' if reviews.length > 50
    raise 'Vipers edited-cell scope differs' unless reviews.select { |row| row['old'] != row['new'] }
      .map { |row| row['ID_Linha'] }.sort == EDIT_IDS.sort
    ReviewedProperNameDiscovery.validate!(definitions, reviews, generated, glossary.map(&:to_h), index)
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "Prepared D-#{D}: 22 team keys, 24 mentions, 13 edits, 9 unchanged; " \
         '3 generic hits excluded; no global Vipers alias.'
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new')) }
    [definitions, reviews, generated]
  end

  def prior_records(rows)
    rows.each_with_object({}) do |row, result|
      key = [row.fetch('entity_key'), *M.key(row)]
      raise "duplicate prior occurrence #{key.inspect}" if result.key?(key)
      result[key] = row.reject { |field, _| field == 'korean_current' }
    end
  end

  def verify_prior_records!(before, rows)
    after = prior_records(rows)
    before.each do |key, record|
      raise "prior occurrence changed #{key.inspect}" unless after[key] == record
    end
    raise 'unexpected new Vipers occurrence keys' unless
      (after.keys - before.keys).sort == expected_keys.map { |key| [ENTITY, *key] }.sort
  end

  def apply
    definitions, reviews, generated = prepare
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    before = prior_records(index.map(&:to_h))
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), index.map(&:to_h)
    )
    reviews.select { |row| row['old'] != row['new'] }.group_by { |row| row['resource'] }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    # The standard discovery runner would regenerate from global aliases. Register
    # the validated row-scoped hits instead, then use the standard batch executor.
    M.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers, glossary.map(&:to_h) + definitions)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + generated)
    M.run(REVIEWS, D, 1)
    final = M.table(M::INDEX).map(&:to_h)
    verify_prior_records!(before, final)
    raise 'Vipers final dispositions differ' unless final.select { |row| row['entity_key'] == ENTITY }
      .all? { |row| %w[accepted not-an-issue].include?(row['status']) }
    raise 'prior glossary changed' unless M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h) ==
      glossary.map(&:to_h) + definitions
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-vipers-D21458.rb [prepare|apply]' if ARGV.length > 1
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then VipersD21458.prepare
  when 'apply' then VipersD21458.apply
  else abort 'usage: review-vipers-D21458.rb [prepare|apply]'
  end
end
