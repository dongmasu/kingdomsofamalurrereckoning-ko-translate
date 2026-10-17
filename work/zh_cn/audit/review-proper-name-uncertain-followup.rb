#!/usr/bin/env ruby
# encoding: UTF-8

require 'csv'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

# Focused follow-up for two previously held people-name occurrences.
# This file has no effects unless invoked with a D-number by the main runner.
module ProperNameUncertainFollowup
  AUDIT = File.expand_path(__dir__)
  GLOSSARY = File.join(AUDIT, 'proper-name-glossary.tsv')
  OUT = File.join(AUDIT, 'proper-name-reviewed-uncertain-followup.tsv')
  EILALY_KEY = 'person:eilaly'
  CLARY_KEY = 'person:clary-ansilla'
  OLD_LADY_KEY = 'person:old-lady-clary'
  NEW_DEFINITION = {
    'entity_key' => OLD_LADY_KEY,
    'english_canonical' => 'Old Lady Clary',
    'category' => 'person',
    'korean_canonical' => '클라리 노부인(Old Lady Clary)',
    'english_aliases' => '',
    'korean_variants' => '클레리|클라리',
    'evidence_ids' => 'default:35294',
    'status' => 'confirmed',
    'notes' => 'Distinct source display identity Old Lady Clary; canonical Korean title/name pair is 클라리 노부인(Old Lady Clary). No English alias Clary is registered, avoiding conflation with Clary Ansilla; no Ansilla surname is assigned.'
  }.freeze
  TARGETS = {
    ['default', '58462', ''] => EILALY_KEY,
    ['default', '35294', ''] => OLD_LADY_KEY
  }.freeze

  module_function

  def row_key(row)
    ReviewedNameBatches.key(row)
  end

  def check_context!(source, key)
    english, japanese, chinese = [
      JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n"),
      JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
      source.fetch('zh_text').to_s
    ]
    if key == ['default', '58462', '']
      raise 'Airancourt identity context changed; re-review before proceeding' unless
        english.match?(/\bAirancourt\b/i) && english.match?(/gnomish scholar/i) &&
        japanese.include?('アイランコート') && japanese.include?('ノーム') &&
        chinese.include?('埃兰库特') && chinese.include?('侏儒')
    elsif key == ['default', '35294', '']
      raise 'Old Lady Clary identity context changed; re-review before proceeding' unless
        english.match?(/Old Lady Clary/i) && english.match?(/last bride of House Ansilla/i) &&
        japanese.include?('老レディー・クレリー') &&
        chinese.include?('克莱里老夫人') && chinese.include?('安西拉')
    end
    [english, japanese, chinese]
  end

  def validate_cell!(old, new_text, key)
    raise "token skeleton changed at #{key.inspect}" unless
      old.scan(/\{[^{}]*\}/) == new_text.scan(/\{[^{}]*\}/)
    raise "line breaks changed at #{key.inspect}" unless
      old.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)
    raise "parentheses unbalanced at #{key.inspect}" unless
      new_text.count('(') == new_text.count(')')
  end

  def target_replacement(text, key)
    case key
    when ['default', '58462', '']
      raise 'expected one bounded Airancourt span' unless text.scan('에어랑쿠르라는').length == 1
      text.sub('에어랑쿠르라는', '에어랑쿠르(Airancourt)라는')
    when ['default', '35294', '']
      raise 'expected one Clary form beside 노부인' unless
        text.scan('클레리 노부인').length == 1
      text.sub('클레리 노부인', '클라리 노부인(Old Lady Clary)')
    else
      raise "unexpected target #{key.inspect}"
    end
  end

  def ensure_definition!(glossary)
    existing = glossary.find { |row| row['entity_key'] == OLD_LADY_KEY }
    if existing
      NEW_DEFINITION.each do |field, expected|
        raise "conflicting Old Lady Clary definition field #{field}" unless existing[field] == expected
      end
      return
    end
    collision = glossary.find do |row|
      terms = [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
      terms.any? { |term| term.casecmp?(NEW_DEFINITION.fetch('english_canonical')) }
    end
    raise "Old Lady Clary English-key collision with #{collision['entity_key']}" if collision
    glossary << NEW_DEFINITION.dup
  end

  def run(start_d)
    raise 'START_D must be positive' unless start_d.positive?
    m = ReviewedNameBatches
    inventory = m.refresh_inventory.values
    sources = inventory.to_h { |row| [row_key(row), row.to_h] }
    index_table = m.table(m::INDEX)
    index = index_table.map(&:to_h)
    glossary_table = m.table(GLOSSARY)
    glossary = glossary_table.map(&:to_h)
    by_entity = glossary.to_h { |row| [row.fetch('entity_key'), row] }

    eilaly = by_entity.fetch(EILALY_KEY)
    raise 'Eilaly glossary key is not a confirmed person' unless
      eilaly['category'] == 'person' && eilaly['status'] == 'confirmed'
    clary = by_entity.fetch(CLARY_KEY)
    raise 'Clary Ansilla glossary key is not a confirmed person' unless
      clary['category'] == 'person' && clary['status'] == 'confirmed'
    ensure_definition!(glossary)

    expected = {
      [EILALY_KEY, 'default', '58462', ''] => nil,
      [CLARY_KEY, 'default', '35294', ''] => nil,
      [OLD_LADY_KEY, 'default', '35294', ''] => nil
    }
    definitions = [eilaly, clary, NEW_DEFINITION]
    generated = build_occurrences(inventory, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated.each do |occurrence|
      key = [occurrence['entity_key'], *row_key(occurrence)]
      expected[key] = occurrence if expected.key?(key)
    end
    raise 'one or more reviewed English occurrences are missing' if expected.values.any?(&:nil?)

    indexed = index.to_h { |row| [[row.fetch('entity_key'), *row_key(row)], row] }
    raise 'duplicate indexed entity-row keys' unless indexed.length == index.length
    additions = expected.keys.map do |key|
      next if indexed.key?(key)
      occurrence = expected.fetch(key).dup
      occurrence['status'] = 'needs-context'
      occurrence['evidence'] = 'English-anchored occurrence queued for focused cross-locale review.'
      occurrence
    end.compact
    index.concat(additions)
    indexed = index.to_h { |row| [[row.fetch('entity_key'), *row_key(row)], row] }

    reviews = []
    TARGETS.each do |key, target_entity|
      source = sources.fetch(key)
      english, japanese, chinese = check_context!(source, key)
      old = source.fetch('work_text')
      new_text = target_replacement(old, key)
      validate_cell!(old, new_text, key)
      if target_entity == EILALY_KEY
        prior = indexed.fetch([EILALY_KEY, *key])
        next unless %w[needs-context uncertain].include?(prior.fetch('status'))
        reviews << {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'entity_key' => EILALY_KEY, 'status' => 'accepted', 'old' => old, 'new' => new_text,
          'evidence' => 'English explicitly identifies Airancourt as a gnomish scholar; Japanese アイランコート and Chinese 埃兰库特 corroborate the surname. The unique Korean span 에어랑쿠르라는 becomes 에어랑쿠르(Airancourt)라는; retain the particle 라는 and existing person:eilaly key.',
          'english' => english, 'japanese' => japanese, 'chinese' => chinese,
          'entity_dispositions_json' => JSON.generate(EILALY_KEY => 'accepted')
        }
      else
        old_person = indexed.fetch([CLARY_KEY, *key])
        new_person = indexed.fetch([OLD_LADY_KEY, *key])
        next unless %w[needs-context uncertain].include?(old_person.fetch('status')) &&
          %w[needs-context uncertain].include?(new_person.fetch('status'))
        dispositions = { CLARY_KEY => 'excluded', OLD_LADY_KEY => 'accepted' }
        reviews << {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'entity_key' => dispositions.keys.sort.join('|'), 'status' => 'accepted',
          'old' => old, 'new' => new_text,
          'evidence' => 'English names Old Lady Clary as the last bride of House Ansilla; Japanese 老レディー・クレリー and Chinese 克莱里老夫人 corroborate that display identity. The text does not identify her as Clary Ansilla: exclude person:clary-ansilla on this row, register distinct person:old-lady-clary with canonical full title/name 클라리 노부인(Old Lady Clary), and add no Clary alias or Ansilla surname.',
          'english' => english, 'japanese' => japanese, 'chinese' => chinese,
          'entity_dispositions_json' => JSON.generate(dispositions)
        }
      end
    end
    reviews.sort_by! { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
    raise 'duplicate reviewed row keys' unless reviews.map { |row| row_key(row) }.uniq.length == reviews.length

    # Future invocation only: persist the new independent entity and its source
    # occurrence, then let the standard reviewed-batch runner apply these rows.
    m.write_table(GLOSSARY, glossary_table.headers, glossary)
    m.write_table(m::INDEX, index_table.headers, index)
    m.write_table(OUT, m::HEADERS, reviews)
    puts "Uncertain follow-up: reviewed rows=#{reviews.length}; statuses=#{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
    m.run(OUT, start_d, 1, review_states: %w[needs-context uncertain]) unless reviews.empty?
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-proper-name-uncertain-followup.rb START_D' unless ARGV.length == 1
  ProperNameUncertainFollowup.run(Integer(ARGV.fetch(0)))
end
