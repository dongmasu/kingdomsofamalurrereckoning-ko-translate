#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module WhisperingWitchD21448
  extend self

  M = ReviewedNameBatches
  D = 21_448
  ENTITY = 'person:whispering-witch'
  CANONICAL = '속삭이는 마녀(Whispering Witch)'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  DEFAULT_IDS = %w[
    4443 6802 10328 14333 14453 16238 17391 18441 24125 28242
    31464 32392 35538 40395 44804 45923 49919 51271 56125 57209
  ].freeze
  EDIT_IDS = %w[
    4443 10328 16238 31464 32392 35538 40395 44804 45923 49919 51271 57209
  ].freeze
  ENGLISH_NAME = /\bWhispering Witch\b/
  NAME_SPAN = /(?:위스퍼링 위치|속삭이는 마녀)(?:\(Whispering Witch\)|(?!\())/
  PROTECTED_SPANS = Regexp.union(
    ReviewedProperNameDiscovery::OPAQUE, NAME_SPAN, /\([^()\r\n]*\)/
  )
  NOTE = 'English default:51271 identifies the Whispering Witch as a woman in Dead Kel\'s crew; default:35538 explicitly calls her a pirate. Japanese ウィスパー・ウィッチ and Chinese 低语女巫/低语的女巫 corroborate each scoped row. Register the named person/epithet, not a generic witch or an independent quest/item entity. Default:10328 distinguishes Bridgette Malloi, her host, from the Witch. Drold Barri is a borrowed name taken from a distinct slaver in default:51271; do not register it as an alias. Normalize only the exact Witch name spans; retain generic 마녀, all other names, narrative wording, punctuation, quantities, markup, line breaks, and previous dispositions/evidence for other entities.'

  def normalize(text)
    text.gsub(PROTECTED_SPANS) do |span|
      span.match?(/\A#{NAME_SPAN}\z/) ? CANONICAL : span
    end
  end

  # Use the existing aligner in memory: prepare must not refresh shared inventory.
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

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'prepared output exists' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => 'Whispering Witch',
      'category' => 'person', 'korean_canonical' => CANONICAL, 'english_aliases' => '',
      'korean_variants' => '속삭이는 마녀|위스퍼링 위치',
      'evidence_ids' => 'D-21448|default:51271|default:35538|default:10328',
      'status' => 'confirmed', 'notes' => NOTE
    }
    definitions = [glossary.headers.to_h { |header| [header, fields.fetch(header, '')] }]
    inventory = active_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected_keys = DEFAULT_IDS.map { |id| ['default', id, ''] }
    raise 'Whispering Witch source scope differs' unless
      generated.map { |row| M.key(row) }.sort == expected_keys.sort
    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      mentions = key[1] == '51271' ? 3 : 1
      raise "unaligned Whispering Witch #{key.inspect}" unless
        english.scan(ENGLISH_NAME).length == mentions &&
        japanese.scan('ウィスパー・ウィッチ').length == mentions &&
        chinese.scan(/低语(?:的)?女巫/).length == mentions
      if key[1] == '51271'
        raise 'pirate/borrowed-name identity evidence differs' unless
          english.include?('the woman known as the Whispering Witch') &&
          english.include?("part of Dead Kel's crew") &&
          english.include?('using the name Drold Barri, which she took from the Varani slaver')
      elsif key[1] == '35538'
        raise 'pirate identity evidence differs' unless
          english.include?('the pirate the Whispering Witch')
      elsif key[1] == '10328'
        raise 'host/person distinction differs' unless
          english.include?('Bridgette Malloi is dead.') &&
          english.include?("a host body for Dead Kel's accomplice, the Whispering Witch")
      end
      old = source.fetch('work_text')
      proposed = normalize(old)
      raise "Witch name-span coverage differs #{key.inspect}" unless
        old.scan(NAME_SPAN).length == mentions && proposed.scan(CANONICAL).length == mentions
      raise 'Witch normalization not idempotent' unless normalize(proposed) == proposed
      raise 'unrelated Witch row text changed' unless
        old.gsub(NAME_SPAN, '__WITCH__') == proposed.gsub(NAME_SPAN, '__WITCH__')
      status = old == proposed ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => NOTE, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese, 'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    edited = reviews.select { |row| row['old'] != row['new'] }
    raise 'Whispering Witch edited-cell scope differs' unless
      edited.map { |row| row.fetch('ID_Linha') }.sort == EDIT_IDS.sort
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "Prepared D-#{D}: #{reviews.length} keys; 22 source mentions; " \
         "#{edited.length} edits; #{reviews.length - edited.length} unchanged."
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new')) }
    [definitions, reviews]
  end

  def apply
    definitions, reviews = prepare
    M.write_table(DEFINITIONS, M.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers,
                  definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then WhisperingWitchD21448.prepare
  when 'apply' then WhisperingWitchD21448.apply
  else abort 'usage: review-whispering-witch-D21448.rb [prepare|apply]'
  end
end
