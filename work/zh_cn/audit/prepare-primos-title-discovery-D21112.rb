#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module PrimosTitleDiscoveryD21112
  M = ReviewedNameBatches
  DEFINITIONS_PATH = File.join(__dir__, 'proper-name-discovery-definitions-D21112.tsv')
  REVIEWS_PATH = File.join(__dir__, 'proper-name-discovery-D21112.tsv')
  INVENTORY_SHA256 = '0967391b7f9be7b3649eec29dc4da4e6ed54e69ad4345cc6f96e995fbbff47ff'

  DEFINITION = {
    'entity_key' => 'title:primos',
    'english_canonical' => 'Primos',
    'category' => 'title',
    'korean_canonical' => '프리모스(Primos)',
    'english_aliases' => '',
    'korean_variants' => '프리모스',
    'status' => 'confirmed',
    'notes' => 'English uses Primos for the Kollossae leadership office/holder, not one individual. Japanese プリモス and Chinese 首领 corroborate the title. Keep it distinct from office holders Anokatos, Arkes, and Secandra. Pair standalone Korean title mentions as 프리모스(Primos), while preserving complete compound-title English labels atomically.'
  }.freeze
  JAPANESE = 'プリモス'
  CHINESE = '首领'
  EXPECTED_ROWS = 148

  module_function

  def source_match?(row)
    JSON.parse(row.fetch('en_texts_json') || '[]').compact.join("\n")
      .match?(/(?<![A-Za-z0-9])Primos(?![A-Za-z0-9])/i)
  end

  def complete_title_follows?(text, offset)
    tail = text[offset..].to_s
    match = tail.match(/\A[ \t]*([\p{Hangul} \t·'’:-]{0,40})\(([^()\r\n]*)\)/)
    match && match[2].match?(/\bPrimos\b/i)
  end

  def standardize(text)
    text.gsub(/프리모스(?:[ \t]*\(Primos\))?/i) do |matched|
      next DEFINITION.fetch('korean_canonical') if matched.include?('(')

      complete_title_follows?(text, Regexp.last_match.end(0)) ?
        '프리모스' : DEFINITION.fetch('korean_canonical')
    end
  end

  def build
    bytes = File.binread(M::INVENTORY)
    raise 'aligned source inventory hash changed' unless
      Digest::SHA256.hexdigest(bytes) == INVENTORY_SHA256
    inventory = M.table(M::INVENTORY).map(&:to_h)
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv')).map(&:to_h)
    raise 'Primos title is already registered' if
      glossary.any? { |row| row.fetch('entity_key') == DEFINITION.fetch('entity_key') }

    sources = inventory.select { |row| source_match?(row) }
    raise "expected #{EXPECTED_ROWS} source rows, found #{sources.length}" unless
      sources.length == EXPECTED_ROWS

    generated = build_occurrences(inventory, [DEFINITION]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'English title/source-hit coverage differs' unless
      generated.map { |row| M.key(row) }.sort == sources.map { |row| M.key(row) }.sort
    raise 'duplicate title source row' unless generated.map { |row| M.key(row) }.uniq.length == generated.length

    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.find { |row| M.key(row) == key }
      old_text = source.fetch('work_text')
      new_text = standardize(old_text)
      raise "unrecognized Korean Primos title at #{key.inspect}" unless new_text.include?('프리모스')
      status = old_text == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key.fetch(0),
        'ID_Linha' => key.fetch(1),
        'Tipo_Variante' => key.fetch(2),
        'entity_key' => DEFINITION.fetch('entity_key'),
        'status' => status,
        'old' => old_text,
        'new' => new_text,
        'evidence' => "English uses Primos as the named Kollossae leadership office/holder, rather than one individual; aligned Japanese #{JAPANESE} and Chinese #{CHINESE} support the title reading. Distinguish the office from its holders. Normalize standalone Korean title mentions to #{DEFINITION.fetch('korean_canonical')}; preserve complete compound-title labels without a duplicate nested name.",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(
          DEFINITION.fetch('entity_key') => status
        )
      }
    end
    raise 'review row count changed' unless reviews.length == EXPECTED_ROWS

    definition = DEFINITION.merge(
      'evidence_ids' => (['D-21112-D-21114'] + reviews.map do |row|
        M.key(row).join(':')
      end).join('|')
    )
    M.write_table(DEFINITIONS_PATH, definition.keys, [definition])
    M.write_table(REVIEWS_PATH, reviews.first.keys, reviews)
    edits = reviews.count { |row| row.fetch('old') != row.fetch('new') }
    puts "Prepared #{reviews.length} title row keys; #{edits} proposed Texto edits."
    puts "Review slices: #{reviews.each_slice(50).map(&:length).inspect}; " \
         "standalone/compound-title pairs preserved: " \
         "#{reviews.count { |row| row.fetch('old') == row.fetch('new') }}."
  end
end

PrimosTitleDiscoveryD21112.build if $PROGRAM_NAME == __FILE__
