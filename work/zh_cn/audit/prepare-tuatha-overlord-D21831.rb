#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module PrepareTuathaOverlordD21831
  extend self

  M = ReviewedNameBatches
  ENTITY = 'monster:tuatha-overlord'
  LABEL = 'Tuatha Overlord'
  DEFINITIONS = File.join(__dir__, 'proper-name-discovery-definitions-D21831.tsv')
  REVIEWS = File.join(__dir__, 'proper-name-discovery-D21831.tsv')
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
    'category' => 'monster',
    'korean_canonical' => '투아사 대군주(Tuatha Overlord)',
    'english_aliases' => 'Tuatha Overlords',
    'korean_variants' => '투아사(Tuatha) 대군주|투아사(Tuatha) 군주',
    'evidence_ids' => 'D-21831|default:4422|default:9028|default:21983|default:42673|default:43320|default:45842|default:48096',
    'status' => 'confirmed',
    'notes' => [
      'English identifies Tuatha Overlords as a hostile enemy unit/rank:',
      'they guard floors, are fought and killed, and drop shattered weapons.',
      'Japanese ツアサ・オーバーロード and Chinese 图阿撒霸主 corroborate',
      'the compound enemy label. Register this as a monster-type name, not',
      'a new faction; retain all existing faction:tuatha dispositions.',
      'Use an atomic Korean compound display to avoid nested Tuatha pairs.'
    ].join(' ')
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English uses `Tuatha Overlord(s)` for a hostile enemy unit/rank. The
    surrounding rows identify Overlords as guards on upper floors, enemies
    that are fought and killed, and the source of shattered weapons.
    Japanese ツアサ・オーバーロード and Chinese 图阿撒霸主 corroborate the
    compound enemy label. Register `monster:tuatha-overlord` separately
    from the existing `faction:tuatha` entity. Use the atomic Korean
    `투아사 대군주(Tuatha Overlord)` display to avoid nested/component
    parentheses; retain all prior faction dispositions and evidence.
    D-14031/default:45842 remains historically intact except for this
    newly reviewed monster-type name scope.
  TEXT
  REPLACEMENTS = {
    ['default', '4422', ''] => [
      '투아사(Tuatha) 대군주', '투아사 대군주(Tuatha Overlord)', 2
    ],
    ['default', '9028', ''] => [
      '투아사(Tuatha) 대군주', '투아사 대군주(Tuatha Overlord)', 1
    ],
    ['default', '42673', ''] => [
      '투아사(Tuatha) 대군주', '투아사 대군주(Tuatha Overlord)', 1
    ],
    ['default', '43320', ''] => [
      '투아사(Tuatha) 군주', '투아사 대군주(Tuatha Overlord)', 1
    ],
    ['default', '45842', ''] => [
      '투아사(Tuatha) 대군주', '투아사 대군주(Tuatha Overlord)', 1
    ],
    ['default', '48096', ''] => [
      '투아사(Tuatha) 대군주', '투아사 대군주(Tuatha Overlord)', 1
    ]
  }.freeze
  ALREADY_PAIRED = ['default', '21983', ''].freeze
  EXPECTED_KEYS = (REPLACEMENTS.keys + [ALREADY_PAIRED]).to_set.freeze

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
      actual == EXPECTED_KEYS

    reviews = generated.map do |occurrence|
      source_key = key(occurrence)
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "English source term missing at #{source_key.inspect}" unless
        english.match?(/(?<![A-Za-z])Tuatha Overlord(s)?(?![A-Za-z])/i)
      old = source.fetch('work_text')
      if replacement = REPLACEMENTS[source_key]
        from, to, count = replacement
        raise "unexpected matching count at #{source_key.inspect}" unless
          old.scan(from).length == count
        new_text = old.gsub(from, to)
        status = 'accepted'
      else
        raise "unexpected already-paired source at #{source_key.inspect}" unless
          source_key == ALREADY_PAIRED &&
          old.include?('(Tuatha Overlord)')
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
    puts "D-21831 prepared #{reviews.length} exact source keys; " \
         "#{reviews.count { |row| row['status'] == 'accepted' }} Texto edits; " \
         "next run apply-reviewed-proper-name-discovery.rb."
  end
end

PrepareTuathaOverlordD21831.run if $PROGRAM_NAME == __FILE__
