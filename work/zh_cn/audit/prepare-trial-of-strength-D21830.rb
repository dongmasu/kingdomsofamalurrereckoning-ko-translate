#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module PrepareTrialOfStrengthD21830
  extend self

  M = ReviewedNameBatches
  ENTITY = 'named event:trial-of-strength'
  LABEL = 'Trial of Strength'
  DEFINITIONS = File.join(__dir__, 'proper-name-discovery-definitions-D21830.tsv')
  REVIEWS = File.join(__dir__, 'proper-name-discovery-D21830.tsv')
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
    'korean_canonical' => '힘의 시련(Trial of Strength)',
    'english_aliases' => '',
    'korean_variants' => '',
    'evidence_ids' => 'D-21830|default:50172|default:53052',
    'status' => 'confirmed',
    'notes' => [
      'English supplies the exact standalone title and identifies the same',
      'Trial of Strength as the source of the magical curse.',
      'Japanese 力の試練 and Chinese 力量试炼 corroborate the named trial.',
      'Reuse the existing Korean 힘의 시련 wording and pair the standalone',
      'label. Historical terminology uncertainty is not otherwise reopened.'
    ].join(' ')
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English default:50172 supplies the standalone title `Trial of Strength`;
    default:53052 identifies the same named trial as the source of a magical
    curse. Japanese 力の試練 and Chinese 力量试炼 corroborate the trial
    reading. Reuse the established Korean `힘의 시련` and add the missing
    English pairing at the standalone label. D-16101/default:53052 remains
    intact as a historical terminology finding; this new entity scope does
    not recount or supersede its broader wording decision.
  TEXT
  EXPECTED = {
    ['default', '50172', ''] => ['힘의 시련', '힘의 시련(Trial of Strength)', 'accepted'],
    ['default', '53052', ''] => [
      '힘의 시련(Trial of Strength)이 네게 내린 마법의 저주야.',
      '힘의 시련(Trial of Strength)이 네게 내린 마법의 저주야.',
      'not-an-issue'
    ]
  }.freeze

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
    actual = generated.map { |row| key(row) }.to_set
    raise "source coverage differs: #{actual.to_a.inspect}" unless
      actual == EXPECTED.keys.to_set

    reviews = generated.map do |occurrence|
      source_key = key(occurrence)
      source = inventory.fetch(source_key)
      old, new_text, status = EXPECTED.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "English label missing at #{source_key.inspect}" unless
        english.match?(/(?<![A-Za-z])Trial of Strength(?![A-Za-z])/i)
      raise "stale Korean at #{source_key.inspect}" unless source.fetch('work_text') == old
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
    puts "D-21830 prepared #{reviews.length} exact source keys; " \
         "#{reviews.count { |row| row['status'] == 'accepted' }} Texto edit; " \
         "next run apply-reviewed-proper-name-discovery.rb."
  end
end

PrepareTrialOfStrengthD21830.run if $PROGRAM_NAME == __FILE__
