#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module PrepareTrialOfInitiationD21829
  extend self

  M = ReviewedNameBatches
  ENTITY = 'named event:trial-of-initiation'
  LABEL = 'Trial of Initiation'
  DEFINITIONS = File.join(__dir__, 'proper-name-discovery-definitions-D21829.tsv')
  REVIEWS = File.join(__dir__, 'proper-name-discovery-D21829.tsv')
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  REVIEW_HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence english
    japanese chinese entity_dispositions_json
  ].freeze
  DEFINITION = {
    'entity_key' => ENTITY,
    'english_canonical' => LABEL,
    'category' => 'named event',
    'korean_canonical' => '입문 시험(Trial of Initiation)',
    'english_aliases' => '',
    'korean_variants' => '입문 시련|입문 의식|입문 의식의 시련',
    'evidence_ids' => 'D-21829|default:8405|default:40813',
    'status' => 'confirmed',
    'notes' => [
      'English explicitly describes this as the formal trial required for',
      'admission to the Scholia Arcana; completion, preparation, and',
      'administration contexts confirm one named event.',
      'Japanese 入門試練 and Chinese 启蒙试炼 corroborate the initiation-trial',
      'meaning. Reuse the already paired 입문 시험 form as the canonical',
      'Korean wording and pair each source-present occurrence.',
      'Prior terminology uncertainties remain historical and are not',
      'recounted or generalized beyond this exact event.'
    ].join(' ')
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English uses `Trial of Initiation` for the formal rite required to join
    the Scholia Arcana. The aligned rows describe eligibility, admission,
    preparation, completion, administration, and the beginning of a series
    of challenges, confirming one named event rather than unrelated generic
    initiation trials. Japanese 入門試練 and Chinese 启蒙试炼 corroborate the
    event meaning. Reuse the existing paired Korean `입문 시험(Trial of
    Initiation)` and standardize exact event references to that form.
    Existing D-3431, D-3757, D-9149, D-10279, and D-15269 terminology
    decisions remain historical; this registration adds the named-event
    identity and does not recount or silently supersede broader terminology
    findings.
  TEXT
  REPLACEMENTS = {
    ['default', '133', ''] => [
      '입문 시험에서', '입문 시험(Trial of Initiation)에서'
    ],
    ['default', '9781', ''] => [
      '입문 시험을 마친', '입문 시험(Trial of Initiation)을 마친'
    ],
    ['default', '11689', ''] => [
      '입문 시험을 통과', '입문 시험(Trial of Initiation)을 통과'
    ],
    ['default', '12876', ''] => [
      '입문 시험은 끝났다', '입문 시험(Trial of Initiation)은 끝났다'
    ],
    ['default', '18347', ''] => [
      '입문 시험을 치른', '입문 시험(Trial of Initiation)을 치른'
    ],
    ['base', '2510', '11'] => [
      '입문 시험', '입문 시험(Trial of Initiation)'
    ],
    ['default', '26729', ''] => [
      '입문 시험', '입문 시험(Trial of Initiation)'
    ],
    ['default', '29169', ''] => [
      '입문 의식을 진행할', '입문 시험(Trial of Initiation)을 진행할'
    ],
    ['default', '30274', ''] => [
      '입문 시험 말이야', '입문 시험(Trial of Initiation) 말이야'
    ],
    ['default', '31722', ''] => [
      '입문 의식을 주관해', '입문 시험(Trial of Initiation)을 주관해'
    ],
    ['default', '38853', ''] => [
      '입문 시련', '입문 시험(Trial of Initiation)'
    ],
    ['default', '40813', ''] => [
      '입문 시험이 시작', '입문 시험(Trial of Initiation)이 시작'
    ],
    ['default', '43038', ''] => [
      '그는 입문 시험을 치렀고',
      '그는 입문 시험(Trial of Initiation)을 치렀고'
    ],
    ['default', '44578', ''] => [
      '입문 시련을 치를', '입문 시험(Trial of Initiation)을 치를'
    ],
    ['default', '48876', ''] => [
      '내 입문 의식의 시련을 둘러싼',
      '내 입문 시험(Trial of Initiation)을 둘러싼'
    ],
    ['default', '50230', ''] => [
      '입문 시험', '입문 시험(Trial of Initiation)'
    ]
  }.freeze
  EXPECTED_KEYS = (
    REPLACEMENTS.keys + [['default', '8405', '']]
  ).to_set.freeze

  def key(row)
    M.key(row)
  end

  def run
    [DEFINITIONS, REVIEWS].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [DEFINITION]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    actual_keys = generated.map { |row| key(row) }.to_set
    raise "source coverage differs: #{actual_keys.to_a.inspect}" unless
      actual_keys == EXPECTED_KEYS

    reviews = generated.map do |occurrence|
      source_key = key(occurrence)
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "English label missing at #{source_key.inspect}" unless
        english.match?(/(?<![A-Za-z])Trial of Initiation(?![A-Za-z])/i)
      old = source.fetch('work_text')
      replacement = REPLACEMENTS[source_key]
      if replacement
        from, to = replacement
        raise "expected Korean span missing at #{source_key.inspect}" unless
          old.scan(from).length == 1
        new_text = old.sub(from, to)
        status = 'accepted'
      else
        raise "unexpected unchanged key #{source_key.inspect}" unless
          source_key == ['default', '8405', ''] &&
          old.include?('(Trial of Initiation)')
        new_text = old
        status = 'not-an-issue'
      end
      {
        'resource' => source_key[0],
        'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => "#{EVIDENCE} Exact source key: #{source_key.join(':')}.",
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    M.write_table(DEFINITIONS, DEFINITION_HEADERS, [DEFINITION])
    M.write_table(REVIEWS, REVIEW_HEADERS, reviews)
    puts "D-21829 prepared #{reviews.length} exact source keys; " \
         "#{reviews.count { |row| row['status'] == 'accepted' }} Texto edits; " \
         "next run apply-reviewed-proper-name-discovery.rb."
  end
end

PrepareTrialOfInitiationD21829.run if $PROGRAM_NAME == __FILE__
