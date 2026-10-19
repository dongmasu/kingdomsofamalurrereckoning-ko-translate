#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-short-label-discovery-20261018'

module ReviewTemplarsD21809
  extend self

  M = ReviewedNameBatches
  D = 21_809
  AUDIT = __dir__
  GLOSSARY = File.join(AUDIT, 'proper-name-glossary.tsv')
  DEFINITIONS = File.join(AUDIT, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(AUDIT, "proper-name-discovery-D#{D}.tsv")
  ENTITY = 'faction:gnome-templars'
  ENGLISH = 'Templars'
  KOREAN = '템플러(Templars)'
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  REVIEW_HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese entity_dispositions_json
  ].freeze
  IDS = %w[
    11 983 1553 2080 24378 2530 3261 4172 4264 4528 4573 4850 6365 7285 7317
    9693 13725 13929 14606 15860 18097 20329 21294 21434 24560 26673 28929
    31969 32508 35199 36695 37126 38000 38169 39068 39380 39513 39891 41258
    41576 45045 45594 46941 47489 50466 52739 53009 58238 58773 60158 62486
  ].freeze
  CHECKPOINT_D = D + (IDS.length - 1) / 50
  SHORT_SNAPSHOT =
    File.join(AUDIT, "proper-name-short-label-discovery-D#{CHECKPOINT_D}.tsv")
  CHECKPOINT_MARKER =
    /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
  KOREAN_TERM = /
    (?<root>
      성전\s*기사단원|성전\s*기사단|성전\s*기사|
      템플러\s*기사단|템플\s*기사단원|템플\s*기사단|템플\s*기사|
      템플러|기사단
    )
    (?<plural>들)?
    (?<particle>들은|들의|들이|에게|에서|과|와|은|는|이|가|을|를|의|에|도|처럼|으로|로|뿐|이나|나|만)?
  /x.freeze
  NOTES = <<~TEXT.strip.freeze
    English names the Templars as a distinct Gnomish social group: default:62486
    explicitly calls Scholars, Templars, and Praetorians three castes, while
    default:58652 directly calls them the Gnome Templar faction. The 50
    capitalized and one lowercase English plural-token keys were checked
    across the aligned corpus. Japanese
    聖堂騎士 and Chinese 圣殿骑士 consistently support the same group reading;
    they do not determine Korean spelling. Standardize the entity name as
    템플러(Templars), retaining Korean grammatical particles and plural markers.
    default:11 already has the complete pair and remains unchanged. The source
    also uses singular Templar as a personal rank/title; those rows are outside
    this plural faction scope. D-19521's terminal sentence finding at 62486 is
    preserved; this is a distinct faction-name annotation, not a reopened or
    recounted sentence judgment. D-17729's separate uncertainty about the
    meaning of “code” at default:58652 remains open. No PAK-derived evidence.
  TEXT

  def definition
    {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'category' => 'faction',
      'korean_canonical' => KOREAN,
      'english_aliases' => '',
      'korean_variants' => [
        '템플러', '템플러들', '성전기사단', '성전 기사단',
        '성전기사들', '성전 기사들', '성전기사단원', '성전 기사단원',
        '템플러 기사단', '템플 기사들', '기사단'
      ].join('|'),
      'evidence_ids' => "D-#{D}|default:58652|default:62486",
      'status' => 'confirmed',
      'notes' => NOTES
    }
  end

  def source_phrase?(text)
    text.match?(/(?<![A-Za-z])Templars(?![A-Za-z])/i)
  end

  def paired?(text)
    text.include?(KOREAN)
  end

  def normalize_particle(particle, plural)
    return particle if plural && !plural.empty?

    {
      '은' => '는',
      '이' => '가',
      '을' => '를',
      '과' => '와',
      '으로' => '로'
    }.fetch(particle, particle)
  end

  def canonicalize(text, key)
    return text if paired?(text)

    matches = text.to_enum(:scan, KOREAN_TERM).map { Regexp.last_match.dup }
    raise "expected one Korean Templars span at #{key.join(':')}, got #{matches.length}" unless
      matches.length == 1

    match = matches.first
    plural = match[:plural].to_s
    particle = normalize_particle(match[:particle].to_s, plural)
    replacement = "#{KOREAN}#{plural}#{particle}"
    text.sub(KOREAN_TERM, replacement)
  end

  def build_rows(inventory, index)
    hits = inventory.values.select do |source|
      JSON.parse(source.fetch('en_texts_json')).compact.any? do |text|
        source_phrase?(text)
      end
    end
    actual_keys = hits.map { |source| M.key(source) }.to_set
    expected_keys = IDS.map { |id| ['default', id, ''] }.to_set
    raise "Templars source coverage differs: #{actual_keys.to_a.sort.inspect}" unless
      actual_keys == expected_keys && hits.length == IDS.length
    raise 'Templars faction already registered' if
      M.table(GLOSSARY).any? { |row| row['entity_key'] == ENTITY }

    existing = index.map do |row|
      [row.fetch('entity_key'), *M.key(row)]
    end.to_set
    reviews = hits.sort_by { |source| source.fetch('ID_Linha').to_i }.map do |source|
      key = M.key(source)
      raise "Templars faction key already indexed: #{key.inspect}" if
        existing.include?([ENTITY, *key])

      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      old = source.fetch('work_text')
      new_text = canonicalize(old, key)
      raise "English Templars evidence missing at #{key.join(':')}" unless
        source_phrase?(english)
      raise "Japanese Templar evidence missing at #{key.join(':')}" unless
        japanese.match?(/聖堂騎士/)
      raise "Chinese Templar evidence missing at #{key.join(':')}" unless
        source.fetch('zh_text').include?('圣殿骑士')

      status = old == new_text ? 'not-an-issue' : 'accepted'
      row_notes = "#{NOTES} Exact source key: #{key.join(':')}."
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => row_notes,
        'english' => english,
        'japanese' => japanese,
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    status_counts = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
    raise "unexpected Templars dispositions: #{status_counts.inspect}" unless
      status_counts == { 'accepted' => 50, 'not-an-issue' => 1 }

    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'registered Templars occurrence coverage differs' unless
      generated.map { |row| M.key(row) }.to_set == expected_keys
    [definition, reviews]
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    paths = [DEFINITIONS, REVIEWS, SHORT_SNAPSHOT]
    raise "D-#{D} preparation artifacts already exist; preserve them" if
      paths.any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    entity_definition, reviews = build_rows(inventory, index)
    M.write_table(DEFINITIONS, DEFINITION_HEADERS, [entity_definition])
    M.write_table(REVIEWS, REVIEW_HEADERS, reviews)
    changed = reviews.count { |row| row.fetch('old') != row.fetch('new') }
    puts "Prepared D-#{D}: #{reviews.length} exact keys; #{changed} Texto edits."
  end

  def refresh_checkpoint
    inventory = M.refresh_inventory
    glossary = M.table(GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SHORT_SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    first = snapshot.first&.fetch('english_candidate')
    next_line = "Next batch: D-#{CHECKPOINT_D + 1}; continue refreshed short-label snapshot " \
                "`proper-name-short-label-discovery-D#{CHECKPOINT_D}.tsv` " \
                "(#{snapshot.length} bounded groups; first `#{first || 'none'}`; " \
                'not exhaustive or a completion estimate).'
    prior = File.read(M::DOCS.first)[CHECKPOINT_MARKER]
    raise "D-#{CHECKPOINT_D} checkpoint is not active" unless
      prior&.include?("Latest verified proper-name batch: D-#{CHECKPOINT_D} ")
    M::DOCS.each do |path|
      text = File.read(path)
      raise "D-#{CHECKPOINT_D} checkpoints differ in #{path}" unless
        text[CHECKPOINT_MARKER] == prior
      File.write(path, text.sub(CHECKPOINT_MARKER,
                                prior.sub(/^Next batch:.*$/, next_line)))
    end
    ["named-scope-review-D#{CHECKPOINT_D}-#{M::RUN_DATE_COMPACT}.md",
     "named-scope-edit-addendum-D#{CHECKPOINT_D}-#{M::RUN_DATE_COMPACT}.md"].each do |name|
      File.open(File.join(AUDIT, name), 'a') do |file|
        file.write(
          "\n## Bounded Discovery Queue\n\n" \
          "Refreshed snapshot: `proper-name-short-label-discovery-D#{CHECKPOINT_D}.tsv` " \
          "(#{snapshot.length} bounded groups; first `#{first || 'none'}`). " \
          "This queue is not exhaustive and is not a completion estimate.\n"
        )
      end
    end
    decision = <<~TEXT

      ## D-#{D} and D-#{CHECKPOINT_D}: Gnome Templars Faction Name

      Reviewed all 51 English plural-token source keys: 50 capitalized uses
      and the lowercase “templars” at default:24378, which refers to the same
      Gnomish group. English
      default:62486 identifies Templars as one of three Gnomish castes, and
      default:58652 explicitly names the Gnome Templar faction; aligned
      Japanese and Chinese corroborate the same group. Registered
      `faction:gnome-templars` with canonical `템플러(Templars)` and standardized
      50 Texto cells. default:11 already had the complete bilingual form and
      remains unchanged. This resolves the faction-name scope left open at
      D-1706/default:6365 and D-12580/default:39513; D-206/default:1553 is
      superseded only for the Templars name, not the separate Praetorians or
      sentence questions. D-19521/default:62486 is preserved as a terminal
      sentence finding, not reopened or recounted. D-17729/default:58652's
      separate “code” wording uncertainty remains open.
    TEXT
    %w[README.md decision-register-20261009.md].each do |name|
      File.open(File.join(AUDIT, name), 'a') { |file| file.write(decision) }
    end
    puts "D-#{CHECKPOINT_D}: refreshed bounded queue (#{snapshot.length} groups); " \
         "first=#{first.inspect}; overall discovery remains incomplete."
  end

  def apply
    artifacts = [DEFINITIONS, REVIEWS]
    if artifacts.any? { |path| File.exist?(path) }
      raise "D-#{D} proposal is incomplete" unless artifacts.all? { |path| File.file?(path) }
    else
      prepare
    end
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    refresh_checkpoint
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then ReviewTemplarsD21809.prepare
  when 'apply' then ReviewTemplarsD21809.apply
  when 'refresh' then ReviewTemplarsD21809.refresh_checkpoint
  else abort 'usage: review-templars-D21809.rb [prepare|apply|refresh]'
  end
end
