#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module PrepareTyrannusBolganusD21833
  extend self

  M = ReviewedNameBatches
  ENTITY = 'title:tyrannus-bolganus'
  LABEL = 'Tyrannus Bolganus'
  DEFINITIONS = File.join(__dir__, 'proper-name-discovery-definitions-D21833.tsv')
  REVIEWS = File.join(__dir__, 'proper-name-discovery-D21833.tsv')
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
    'korean_canonical' => '볼간을 막아 내는 자(Tyrannus Bolganus)',
    'english_aliases' => '',
    'korean_variants' => '티라누스 볼가누스|티란누스 볼가누스|볼간을 막아 내는 분|볼간(Bolgan)을 막아 내는 자',
    'evidence_ids' => 'D-21833|default:19050|default:34421|default:53011|default:57657',
    'status' => 'confirmed',
    'notes' => [
      'English default:34421 explicitly says the speaker proclaims the',
      'player Tyrannus Bolganus; aligned Japanese explicitly calls it a',
      'title and Chinese describes the player as Bolgan king. The two',
      'announcer labels say this figure keeps the Bolgans at bay.',
      'Japanese ボルガンを制す者 and Chinese 波尔干之王 corroborate a title',
      'meaning, not a separate person. Reuse the established Korean',
      'meaning from the parallel announcer line and pair the full title.',
      'Existing monster:bolgan dispositions remain separate. Resolve only',
      'the name identity/title display; preserve unrelated source and',
      'sentence-quality findings in D-6011, D-11136, and D-17354.'
    ].join(' ')
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English default:34421 explicitly says `I proclaim you Tyrannus
    Bolganus`, establishing that this is an awarded title rather than a
    person's name. The aligned Japanese calls it a title (称号); Chinese
    renders it as Bolgan king (波尔干之王). The announcer labels at
    default:53011 and default:57657 describe the title bearer as keeping
    the Bolgans at bay. Japanese ボルガンを制す者 and Chinese 波尔干之王
    corroborate the meaning. Use the established Korean title wording
    `볼간을 막아 내는 자(Tyrannus Bolganus)` across all four exact rows.
    Keep monster:bolgan dispositions separate. D-6011, D-11136, and
    D-17354 remain historical records; this scope settles only identity
    and title display, not unrelated translation or malformed-source
    concerns.
  TEXT
  EXPECTED_KEYS = [
    ['default', '19050', ''],
    ['default', '34421', ''],
    ['default', '53011', ''],
    ['default', '57657', '']
  ].to_set.freeze
  REPLACEMENTS = {
    ['default', '19050', ''] => [
      ['티라누스 볼가누스', '볼간을 막아 내는 자(Tyrannus Bolganus)', 1]
    ],
    ['default', '34421', ''] => [
      ['티라누스 볼가누스', '볼간을 막아 내는 자(Tyrannus Bolganus)', 1]
    ],
    ['default', '53011', ''] => [
      [
        '볼간(Bolgan)들을 막아 내는 분, 티란누스 볼가누스(Tyrannus Bolganus)',
        '볼간(Bolgan)을 막아 내는 자(Tyrannus Bolganus)', 1
      ]
    ],
    ['default', '57657', ''] => [
      [
        '볼간(Bolgan)을 막아 내는 자, 티라누스 볼가누스를',
        '볼간(Bolgan)을 막아 내는 자(Tyrannus Bolganus)', 1
      ]
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
      actual == EXPECTED_KEYS

    reviews = generated.map do |occurrence|
      source_key = key(occurrence)
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "English title missing at #{source_key.inspect}" unless
        english.match?(/(?<![A-Za-z])Tyrannus Bolganus(?![A-Za-z])/)
      old = source.fetch('work_text')
      new_text = old.dup
      REPLACEMENTS.fetch(source_key).each do |from, to, count|
        raise "unexpected text count at #{source_key.inspect}: #{from}" unless
          new_text.scan(from).length == count
        new_text = new_text.sub(from, to)
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
    puts "D-21833 prepared #{reviews.length} exact source keys; " \
         "#{reviews.length} Texto edits; next run apply-reviewed-proper-name-discovery.rb."
  end
end

PrepareTyrannusBolganusD21833.run if $PROGRAM_NAME == __FILE__
