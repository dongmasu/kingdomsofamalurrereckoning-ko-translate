#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module LocalPersonShortFormsD21104
  M = ReviewedNameBatches
  D = 21_104
  REVIEW_PATH = File.join(M::AUDIT, "proper-name-discovery-D#{D}.tsv")
  INDEX_HEADERS = %w[
    entity_key resource ID_Linha Tipo_Variante matched_english english_source
    korean_current status evidence
  ].freeze

  MANUAL_NOTE = 'The official Korean manual PDF p. 8 provides relevant crafting/blacksmith context, but does not directly name Elwa or Fiona and is not spelling evidence.'
  ROWS = [
    {
      entity: 'person:elwa-brond', term: 'Elwa', id: '3566',
      old_span: '엘와(Elwa)', new_span: '엘와(Elwa)',
      context: 'The English explicitly names Elwa in the Calum dispute; Japanese エルワ and Chinese 艾尔瓦 corroborate the same short name. Existing Korean pairing is already correct.'
    },
    {
      entity: 'person:elwa-brond', term: 'Elwa', id: '6398',
      old_span: '엘와(Elwa)', new_span: '엘와(Elwa)',
      context: 'English says Elwa has potions, identifying the Cape Solace potion vendor in the D-21102 full-name context; Japanese エルワ and Chinese 艾尔瓦 support the local short form. Existing Korean pairing is already correct.'
    },
    {
      entity: 'person:elwa-brond', term: 'Elwa', id: '7208',
      old_span: '엘와(Elwa)', new_span: '엘와(Elwa)',
      context: 'English refers to making amends with Elwa; Japanese エルワ and Chinese 艾尔瓦 align with the Calum dispute context. Existing Korean pairing is already correct.'
    },
    {
      entity: 'person:elwa-brond', term: 'Elwa', id: '26358',
      old_span: '엘와', new_span: '엘와(Elwa)',
      context: 'English says “I talked to Elwa”; Japanese エルワ and Chinese 艾尔瓦 confirm the explicit personal-name reference. Elwa is unique in the aligned source inventory; preserve this row-local short form.'
    },
    {
      entity: 'person:fiona-terane', term: 'Fiona', id: '20129',
      old_span: '피오나', new_span: '피오나(Fiona)',
      context: 'The speaker redirects a repair request to Fiona; Japanese フィオナ and Chinese 菲奥娜 corroborate. This is the keep blacksmith, not Princess Fiona or Fiona Caid.'
    },
    {
      entity: 'person:fiona-terane', term: 'Fiona', id: '20864',
      old_span: '피오나', new_span: '피오나(Fiona)',
      context: 'The repair-related dialogue directs the player to Fiona; Japanese フィオナ and Chinese 菲奥娜 corroborate the short name. This is the keep blacksmith, not Princess Fiona or Fiona Caid.'
    },
    {
      entity: 'person:fiona-terane', term: 'Fiona', id: '32134',
      old_span: '피오나', new_span: '피오나(Fiona)',
      context: 'English asks about things to repair and points to Fiona; Japanese フィオナ and Chinese 菲奥娜 corroborate. This is the keep blacksmith, not Princess Fiona or Fiona Caid.'
    },
    {
      entity: 'person:fiona-terane', term: 'Fiona', id: '43324',
      old_span: '피오나', new_span: '피오나(Fiona)',
      context: 'English explicitly calls Fiona “our blacksmith”; Japanese うちの鍛冶職人のフィオナ and Chinese 我们的铁匠 identify the keep blacksmith. Preserve the short source form.'
    }
  ].freeze

  APPROVED_KEYS = ROWS.map { |row| ['default', row.fetch(:id), ''] }.freeze
  EXPECTED_STATUS_COUNTS = { 'accepted' => 5, 'not-an-issue' => 3 }.freeze
  EXCLUDED_CONTROLS = [
    ['default', '33910', ''], # D-21102 owns the full name and repeated short mention.
    ['default', '17688', ''], # Princess Fiona.
    ['default', '36761', '']  # Fiona Caid.
  ].freeze
  OPAQUE = /\$[^$]*\$|<[^>\r\n]*>|\{[^{}\r\n]*\}/

  module_function

  def key(row)
    M.key(row)
  end

  def text_list(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json") || '[]').compact
  end

  def exact_source_match?(source, term)
    english = text_list(source, 'en').join("\n---\n")
    english.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
  end

  def replace_once(text, old_span, new_span, source_key)
    count = text.scan(Regexp.new(Regexp.escape(old_span))).length
    raise "expected one Korean span at #{source_key.inspect}, got #{count}" unless count == 1

    text.sub(Regexp.new(Regexp.escape(old_span)), new_span)
  end

  def normalize_inventory(inventory)
    return inventory if inventory.key?(APPROVED_KEYS.first)

    inventory.to_h { |row| [key(row), row] }
  end

  def build_reviews(inventory)
    sources = normalize_inventory(inventory)
    reviews = ROWS.map do |spec|
      source_key = ['default', spec.fetch(:id), '']
      source = sources.fetch(source_key)
      english_texts = text_list(source, 'en')
      japanese_texts = text_list(source, 'ja')
      chinese = source.fetch('zh_text').to_s
      raise "missing aligned source evidence at #{source_key.inspect}" if
        english_texts.empty? || japanese_texts.empty? || chinese.strip.empty?
      raise "English short name missing at #{source_key.inspect}" unless
        exact_source_match?(source, spec.fetch(:term))

      english = english_texts.join("\n")
      japanese = japanese_texts.join("\n---\n")
      old = source.fetch('work_text')
      new_text = replace_once(old, spec.fetch(:old_span), spec.fetch(:new_span), source_key)
      raise "opaque token or line break changed at #{source_key.inspect}" unless
        old.scan(OPAQUE) == new_text.scan(OPAQUE) &&
        old.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => 'default',
        'ID_Linha' => spec.fetch(:id),
        'Tipo_Variante' => '',
        'entity_key' => spec.fetch(:entity),
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => "#{spec.fetch(:context)} #{MANUAL_NOTE} Add only the row-local bilingual short label; no global English alias is introduced.",
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(spec.fetch(:entity) => status),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end
    validate_review_set!(reviews)
    reviews
  end

  def validate_review_set!(reviews)
    keys = reviews.map { |row| key(row) }
    raise 'review scope differs from the eight approved keys' unless
      keys.sort == APPROVED_KEYS.sort
    raise 'duplicate reviewed source key' unless keys.uniq.length == keys.length
    counts = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
    raise "unexpected short-form dispositions: #{counts.inspect}" unless
      counts == EXPECTED_STATUS_COUNTS
    raise 'homonym or D-21102 control entered the package' unless
      (keys & EXCLUDED_CONTROLS).empty?
    reviews.each do |row|
      raise 'incomplete source evidence' if
        %w[english japanese chinese evidence].any? { |field| row.fetch(field).strip.empty? }
      raise 'unexpected non-default resource' unless row.fetch('resource') == 'default'
      raise 'non-accepted row has a text change' if
        row.fetch('status') != 'accepted' && row.fetch('old') != row.fetch('new')
    end
    true
  end

  def occurrence_rows(reviews, inventory)
    sources = normalize_inventory(inventory)
    reviews.map do |review|
      spec = ROWS.find { |row| row.fetch(:id) == review.fetch('ID_Linha') }
      raise "unexpected occurrence row #{key(review).inspect}" unless spec
      source = sources.fetch(key(review))
      english_source = text_list(source, 'en').join("\n---\n")
      [
        spec.fetch(:entity), 'default', spec.fetch(:id), '',
        spec.fetch(:term), english_source, source.fetch('work_text'),
        'needs-context',
        "D-#{D} exact-row candidate: #{spec.fetch(:context)}"
      ]
    end.map { |values| INDEX_HEADERS.zip(values).to_h }
  end

  def validate_registry!(glossary, index, reviews)
    validate_review_set!(reviews)
    glossary_keys = glossary.map { |row| row.fetch('entity_key') }
    expected_entities = ROWS.map { |row| row.fetch(:entity) }.uniq.sort
    raise 'required D-21102 person entities are not yet registered' unless
      (expected_entities - glossary_keys).empty?

    existing = index.map { |row| [row.fetch('entity_key'), *key(row)] }
    raise 'duplicate existing occurrence key in index' unless existing.uniq.length == existing.length
    requested = reviews.map do |row|
      [row.fetch('entity_key'), *key(row)]
    end
    raise 'short-form occurrence is already indexed' unless (existing & requested).empty?
    true
  end

  def prepare
    inventory = M.refresh_inventory
    reviews = build_reviews(inventory)
    M.write_table(REVIEW_PATH, M::HEADERS, reviews)
    counts = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
    puts "D-#{D} short forms prepared: #{reviews.length} keys; #{counts.inspect}"
    [inventory, reviews]
  end

  def apply
    inventory, reviews = prepare
    glossary_table = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index_table = M.table(M::INDEX)
    validate_registry!(glossary_table.map(&:to_h), index_table.map(&:to_h), reviews)
    occurrences = occurrence_rows(reviews, inventory)

    # Check the batch slot before the first shared index write.
    ReviewedProperNameDiscovery.ensure_unused_batch!(D, M::AUDIT)
    M.write_table(M::INDEX, index_table.headers, index_table.map(&:to_h) + occurrences)
    M.run(REVIEW_PATH, D, nil)
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['--prepare']
    LocalPersonShortFormsD21104.prepare
  when ['--apply']
    LocalPersonShortFormsD21104.apply
  else
    abort 'usage: prepare-local-person-short-forms-D21104.rb --prepare|--apply'
  end
end
