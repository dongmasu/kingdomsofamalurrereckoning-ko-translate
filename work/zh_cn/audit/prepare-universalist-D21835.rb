#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module PrepareUniversalistD21835
  extend self

  M = ReviewedNameBatches
  ENTITY = 'title:universalist'
  LABEL = 'Universalist'
  DEFINITIONS = File.join(__dir__, 'proper-name-discovery-definitions-D21835.tsv')
  REVIEWS = File.join(__dir__, 'proper-name-discovery-D21835.tsv')
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
    'category' => 'title',
    'korean_canonical' => '보편주의자(Universalist)',
    'english_aliases' => '',
    'korean_variants' => '보편자|보편주의자의',
    'evidence_ids' => 'D-21835|affix:396|default:3426|default:57747',
    'status' => 'confirmed',
    'notes' => [
      'The standalone Destiny/archetype label appears at default:57747;',
      'default:3426 describes its command of all combat styles, all weapons,',
      'and all three specialities. Japanese default:3426 explicitly calls',
      'it a Destiny and uses ユニバーサリスト; Chinese 博识者 corroborates',
      'the expertise/generalist reading. Use the established standalone',
      'Korean 보편주의자 consistently, including the affix possessive.',
      'D-17389 is superseded only for Universalist; its other labels and',
      'all unrelated row concerns remain unchanged.'
    ].join(' ')
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English default:3426 describes the Universalist as expert in every
    combat style and weapon and as unmatched across finesse, might, and
    sorcery. Japanese default:3426 explicitly identifies this as a Destiny
    (ディスティニー) and the standalone label uses ユニバーサリスト; Chinese
    博识者 supports the broad-expertise meaning. default:57747 is the
    standalone archetype label. Normalize the description and standalone
    label to `보편주의자(Universalist)`. The six affix:396 variants are
    the same Destiny possessive and become `보편주의자(Universalist)의`.
    Resolve only the Universalist portion of D-17389; preserve its other
    labels and unrelated translation decisions.
  TEXT
  EXPECTED_KEYS = (
    [11, 12, 14, 21, 22, 24].map { |variant| ['affix', '396', variant.to_s] } +
    [['default', '3426', ''], ['default', '57747', '']]
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
    actual = generated.map { |row| key(row) }.to_set
    raise "source coverage differs: #{actual.to_a.inspect}" unless
      actual == EXPECTED_KEYS

    reviews = generated.map do |occurrence|
      source_key = key(occurrence)
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "English title missing at #{source_key.inspect}" unless
        english.match?(/(?<![A-Za-z])Universalist(?![A-Za-z])/)
      old = source.fetch('work_text')
      if source_key[0] == 'affix'
        raise "stale possessive at #{source_key.inspect}" unless old == '보편주의자의'
        new_text = '보편주의자(Universalist)의'
      elsif source_key[1] == '3426'
        from = '보편자(Universalist)'
        to = '보편주의자(Universalist)'
        raise "stale description at #{source_key.inspect}" unless old.scan(from).length == 1
        new_text = old.sub(from, to)
      else
        raise "stale standalone label at #{source_key.inspect}" unless old == '보편주의자'
        new_text = '보편주의자(Universalist)'
      end
      {
        'resource' => source_key[0],
        'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2],
        'entity_key' => ENTITY,
        'status' => 'accepted',
        'old' => old,
        'new' => new_text,
        'evidence' => "#{EVIDENCE} Exact source key: #{source_key.join(':')}.",
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
      }
    end
    M.write_table(DEFINITIONS, DEFINITION_HEADERS, [DEFINITION])
    M.write_table(REVIEWS, REVIEW_HEADERS, reviews)
    puts "D-21835 prepared #{reviews.length} exact source keys; " \
         "#{reviews.length} Texto edits."
  end
end

PrepareUniversalistD21835.run if $PROGRAM_NAME == __FILE__
