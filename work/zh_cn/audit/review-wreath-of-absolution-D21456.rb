#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module WreathOfAbsolutionD21456
  extend self

  M = ReviewedNameBatches
  D = 21_456
  ENTITY = 'unique_item:wreath-of-absolution'
  ENGLISH = 'Wreath of Absolution'
  KOREAN = '면죄의 화관'
  CANONICAL = "#{KOREAN}(#{ENGLISH})"
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  JA_EVIDENCE = '免赦の輪'
  ZH_EVIDENCE = '赦罪羽冠'

  # key => [English full-name count, [old Korean span, replacement, count], whole cell]
  ROWS = {
    ['default', '1111', ''] => [
      1,
      [
        ['면죄의 화관(Wreath of Absolution)', CANONICAL, 1],
        ['화관을 완성하려면', '화관(Wreath)을 완성하려면', 1]
      ],
      false
    ],
    ['default', '4616', ''] => [
      1, [['면죄의 화관(Wreath of Absolution)', CANONICAL, 1]], false
    ],
    ['default', '6515', ''] => [
      1, [['속죄의 화관', CANONICAL, 1]], false
    ],
    ['default', '9449', ''] => [
      1, [['사면의 화관', CANONICAL, 1]], false
    ],
    ['default', '11712', ''] => [
      1, [['면죄의 화관(Wreath of Absolution)', CANONICAL, 1]], false
    ],
    ['default', '11732', ''] => [
      1, [['면죄의 화관', CANONICAL, 1]], false
    ],
    ['default', '14977', ''] => [
      1, [["'면죄의 화관'", "'#{CANONICAL}'", 1]], false
    ],
    ['default', '15992', ''] => [
      1, [['사죄의 화관(Wreath of Absolution)', CANONICAL, 1]], false
    ],
    ['default', '16811', ''] => [
      1, [['면죄의 화관(Wreath of Absolution)', CANONICAL, 1]], false
    ],
    ['default', '18921', ''] => [
      2, [['면죄의 화관', CANONICAL, 2]], false
    ],
    ['default', '24742', ''] => [
      1, [['면죄의 화관', CANONICAL, 1]], false
    ],
    ['default', '25146', ''] => [
      2, [['사면의 화관', CANONICAL, 2]], false
    ],
    ['default', '25202', ''] => [
      1, [['사면의 화관', CANONICAL, 1]], false
    ],
    ['default', '25540', ''] => [
      1, [['사면의 화관', "#{KOREAN}(The #{ENGLISH})", 1]], true
    ],
    ['default', '46857', ''] => [
      1, [['속죄의 화관', CANONICAL, 1]], false
    ],
    ['default', '47752', ''] => [
      1, [['속죄의 화관', CANONICAL, 1]], false
    ],
    ['default', '51769', ''] => [
      1, [['면죄의 화관(Wreath of Absolution)', CANONICAL, 1]], false
    ],
    ['default', '54403', ''] => [
      1, [['면죄의 화관(Wreath of Absolution)', CANONICAL, 1]], false
    ],
    ['default', '61897', ''] => [
      1, [['사면의 화관(Wreath of Absolution)', CANONICAL, 1]], false
    ],
    ['default', '62416', ''] => [
      1, [['사면의 화관', CANONICAL, 1]], false
    ]
  }.transform_values do |english_count, spans, whole_cell|
    [english_count, spans.map(&:freeze).freeze, whole_cell].freeze
  end.freeze

  SOURCE_KEYS = ROWS.keys.freeze
  HISTORICAL_SCOPE_NOTE =
    'This registers only the complete named artifact and annotates its exact full-name spans. ' \
    'The ten short-only Wreath/wreath source rows remain out of scope; no global Wreath alias is added. ' \
    'Earlier sequential dispositions, including D-18001 at default:62416, remain historical records; ' \
    'this scoped annotation and spelling standardization do not revise prior decisions or totals. ' \
    'Japanese 免赦の輪 and Chinese 赦罪羽冠 corroborate the named ceremonial artifact. ' \
    'No equipment subtype, material, rarity, or gameplay classification is inferred.'

  def literal_count(text, span)
    text.scan(Regexp.new(Regexp.escape(span))).length
  end

  def unannotated_count(text, span)
    pattern = Regexp.new("#{Regexp.escape(span)}(?!\\(#{Regexp.escape(ENGLISH)}\\))")
    text.scan(pattern).length
  end

  def definitions_for(headers)
    variants = ROWS.values.flat_map do |_english_count, spans, _whole_cell|
      spans.select do |_old_span, new_span, _count|
        new_span.include?("(#{ENGLISH})") || new_span.include?("(The #{ENGLISH})")
      end.flat_map do |old_span, new_span, _count|
        [old_span, new_span]
      end
    end
    variants.concat([CANONICAL, KOREAN])
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => ENGLISH,
      'korean_canonical' => CANONICAL, 'category' => 'unique item',
      'english_aliases' => '', 'korean_variants' => variants.uniq.join('|'),
      'evidence_ids' => "D-#{D}|" + SOURCE_KEYS.map { |key| key.reject(&:empty?).join(':') }.join('|'),
      'status' => 'confirmed', 'notes' => HISTORICAL_SCOPE_NOTE
    }
    [headers.to_h { |header| [header, fields.fetch(header, '')] }]
  end

  def normalize(text, key)
    english_count, spans, whole_cell = ROWS.fetch(key) do
      raise "unreviewed Wreath of Absolution key #{key.inspect}"
    end
    if whole_cell
      old_span, new_span, expected_count = spans.fetch(0)
      raise "whole-title source count differs #{key.inspect}" unless expected_count == 1
      return new_span if text == new_span
      raise "whole-title Korean source differs #{key.inspect}" unless text == old_span

      return new_span
    end

    original = text
    spans.each do |old_span, new_span, expected_count|
      old_count = old_span == new_span ? literal_count(text, old_span) : unannotated_count(text, old_span)
      new_count = literal_count(text, new_span)
      if old_span == new_span
        raise "canonical Wreath span count differs #{key.inspect}" unless new_count == expected_count
      elsif old_count == expected_count && new_count.zero?
        text = text.gsub(old_span, new_span)
      elsif old_count.zero? && new_count == expected_count
        next
      else
        raise "Wreath Korean span count differs #{key.inspect}: " \
              "#{old_span.inspect}=#{old_count}, #{new_span.inspect}=#{new_count}"
      end
    end
    raise "Wreath normalization is not idempotent #{key.inspect}" unless normalize_spans_done?(text, key)
    raise "Wreath normalization changed opaque tokens #{key.inspect}" unless
      original.scan(ReviewedProperNameDiscovery::OPAQUE) ==
        text.scan(ReviewedProperNameDiscovery::OPAQUE)
    raise "Wreath normalization changed line breaks #{key.inspect}" unless
      original.scan(/\r\n|\r|\n/) == text.scan(/\r\n|\r|\n/)

    text
  end

  def normalize_spans_done?(text, key)
    _english_count, spans, = ROWS.fetch(key)
    spans.all? { |_old_span, new_span, expected_count| literal_count(text, new_span) == expected_count }
  end

  def assert_scope!(generated)
    expected = SOURCE_KEYS.map { |key| [ENTITY, *key] }.sort
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    return if actual == expected

    raise "Wreath full-name source scope differs: missing=#{(expected - actual).inspect}; " \
          "extra=#{(actual - expected).inspect}; expected 20 keys (22 full-name spans)."
  end

  def reviews_for(inventory, generated)
    assert_scope!(generated)
    generated.map do |occurrence|
      key = M.key(occurrence)
      english_count, spans, whole_cell = ROWS.fetch(key)
      source = inventory.fetch(key)
      english_parts = JSON.parse(source.fetch('en_texts_json')).compact
      japanese_parts = JSON.parse(source.fetch('ja_texts_json')).compact
      english = english_parts.join("\n")
      japanese = japanese_parts.join("\n---\n")
      chinese = source.fetch('zh_text')
      if whole_cell
        raise "exact English title differs #{key.inspect}" unless english_parts == ["The #{ENGLISH}"]
      else
        raise "English full-name count differs #{key.inspect}" unless
          literal_count(english, ENGLISH) == english_count
      end
      raise "Japanese corroboration missing #{key.inspect}" unless japanese.include?(JA_EVIDENCE)
      raise "Chinese corroboration missing #{key.inspect}" unless chinese.include?(ZH_EVIDENCE)

      old = source.fetch('work_text')
      if whole_cell
        raise "exact Korean title source differs #{key.inspect}" unless old == spans.fetch(0).fetch(0)
      else
        spans.each do |old_span, new_span, expected_count|
          count = old_span == new_span ? literal_count(old, old_span) : unannotated_count(old, old_span)
          raise "Korean source span count differs #{key.inspect}: #{old_span.inspect}" unless count == expected_count
        end
      end
      proposed = normalize(old, key)
      raise "Wreath normalization not idempotent #{key.inspect}" unless normalize(proposed, key) == proposed
      status = old == proposed ? 'not-an-issue' : 'accepted'
      extra = key == ['default', '1111', ''] ?
        ' The second English reference is the short name Wreath, not a pronoun or generic description; annotate only the guarded Korean clause 화관을 완성하려면 as 화관(Wreath)을 완성하려면. No other bare Wreath is in this scope.' :
        ' Preserve bare or lowercase descriptive references, short aliases, particles, other names, tokens, and line breaks.'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => "English contains #{english_count} full-name occurrence(s) of #{ENGLISH}; " \
          "Japanese #{JA_EVIDENCE} and Chinese #{ZH_EVIDENCE} corroborate. " \
          "#{HISTORICAL_SCOPE_NOTE}#{extra}",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
  end

  def prior_dispositions(index_rows)
    keys = SOURCE_KEYS.to_set
    index_rows.each_with_object({}) do |row, result|
      key = M.key(row)
      next unless keys.include?(key)

      result[[row.fetch('entity_key'), *key]] =
        [row.fetch('status'), row.fetch('evidence')]
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'prepared outputs already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    definitions = definitions_for(glossary.headers)
    inventory = M.table(M::INVENTORY).to_h { |row| [M.key(row), row.to_h] }
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = reviews_for(inventory, generated)
    index = M.table(M::INDEX).map(&:to_h)
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.select { |row| row['old'] != row['new'] }
      .group_by { |row| row.fetch('resource') }.each do |resource, rows|
        ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
      end
    puts "Prepared D-#{D}: one unique item, 20 full-name keys, 22 full-name spans; no files written."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new'))
    end
    [definitions, reviews]
  end

  def apply
    index_path = M::INDEX
    prior = prior_dispositions(M.table(index_path).map(&:to_h))
    definitions, reviews = prepare
    M.write_table(DEFINITIONS, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    current = prior_dispositions(M.table(index_path).map(&:to_h))
    preserved = prior.keys.to_h { |key| [key, current.fetch(key)] }
    raise 'prior entity dispositions changed in the Wreath batch' unless preserved == prior
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then WreathOfAbsolutionD21456.prepare
  when 'apply' then WreathOfAbsolutionD21456.apply
  else abort 'usage: review-wreath-of-absolution-D21456.rb [prepare|apply]'
  end
end
