#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module PrepareUndersewersD21834
  extend self

  M = ReviewedNameBatches
  ENTITY = 'place:undersewers'
  LABEL = 'Undersewers'
  DEFINITIONS = File.join(__dir__, 'proper-name-discovery-definitions-D21834.tsv')
  REVIEWS = File.join(__dir__, 'proper-name-discovery-D21834.tsv')
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
    'category' => 'place',
    'korean_canonical' => '언더시어즈(Undersewers)',
    'english_aliases' => '',
    'korean_variants' => '지하 하수도',
    'evidence_ids' => 'D-21834|base:4579:11|default:4956|default:10594',
    'status' => 'confirmed',
    'notes' => [
      'The base variant and default map label identify the same plural',
      'Undersewers destination; default:4956 links the same location to',
      'the Strange Man. Japanese 地下下水道 and Chinese 下层下水道 support',
      'the underground-sewer reading. Exclude generic lower-case uses at',
      'default:30124 and default:42413. Keep the singular Undersewer under',
      'Idylla, the separate Idylla Under Sewers label, and prior D-3555 and',
      'D-16798 findings distinct and unchanged.'
    ].join(' ')
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English base:4579 variant 11 and default:10594 provide the plural
    `Undersewers` destination label. default:4956 refers to the Strange Man
    in that same named location and already uses the complete Korean-English
    pair. Japanese 地下下水道 and Chinese 下层下水道 corroborate the
    underground-sewer meaning. Register `place:undersewers` as
    `언더시어즈(Undersewers)`. Lower-case default:30124 (`undersewers of
    the city`) and default:42413 (`undersewers beneath Idylla`) are generic
    sewer descriptions, not this map label, and are excluded.

    Keep the singular `Undersewer` beneath Idylla at default:12179/default:55037
    and `Idylla Under Sewers` at default:53809 separate. D-3555/default:12179
    and D-16798/default:55664 remain historical decisions; this batch does
    not reopen or recount either one.
  TEXT
  EXPECTED = {
    ['base', '4579', '11'] => [
      '지하 하수도', '언더시어즈(Undersewers)', 'accepted'
    ],
    ['default', '10594', ''] => [
      '지하 하수도', '언더시어즈(Undersewers)', 'accepted'
    ],
    ['default', '4956', ''] => [
      '이 사람은 언더시어즈(Undersewers)에서 만난 수상한 남자가 말한 실종된 하인인 것 같아.',
      '이 사람은 언더시어즈(Undersewers)에서 만난 수상한 남자가 말한 실종된 하인인 것 같아.',
      'not-an-issue'
    ],
    ['default', '30124', ''] => [nil, nil, 'excluded'],
    ['default', '42413', ''] => [nil, nil, 'excluded']
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
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "English term missing at #{source_key.inspect}" unless
        english.match?(/(?<![A-Za-z])Undersewers(?![A-Za-z])/i)
      old = source.fetch('work_text')
      expected_old, expected_new, status = EXPECTED.fetch(source_key)
      case status
      when 'accepted'
        raise "stale Korean at #{source_key.inspect}" unless old == expected_old
        new_text = expected_new
      when 'not-an-issue'
        raise "paired label missing at #{source_key.inspect}" unless
          old == expected_old && old.include?('(Undersewers)')
        new_text = old
      when 'excluded'
        raise "generic context mismatch at #{source_key.inspect}" unless
          (source_key[1] == '30124' && english.include?('undersewers of the city')) ||
          (source_key[1] == '42413' && english.include?('undersewers beneath Idylla'))
        new_text = old
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
    puts "D-21834 prepared #{reviews.length} exact source keys; " \
         "#{reviews.count { |row| row['status'] == 'accepted' }} Texto edits; " \
         "excluded=#{reviews.count { |row| row['status'] == 'excluded'}}."
  end
end

PrepareUndersewersD21834.run if $PROGRAM_NAME == __FILE__
