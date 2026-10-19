#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module PrepareTwistsOfFateD21832
  extend self

  M = ReviewedNameBatches
  ENTITY = 'gameplay mechanic:twists-of-fate'
  LABEL = 'Twists of Fate'
  DEFINITIONS = File.join(__dir__, 'proper-name-discovery-definitions-D21832.tsv')
  REVIEWS = File.join(__dir__, 'proper-name-discovery-D21832.tsv')
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
    'category' => 'gameplay mechanic',
    'korean_canonical' => '운명의 굴곡(Twists of Fate)',
    'english_aliases' => '',
    'korean_variants' => '운명의 전환|운명의 굴곡',
    'evidence_ids' => 'D-21832|default:17279|default:52956|default:58153|default:62112',
    'status' => 'confirmed',
    'notes' => [
      'English distinguishes the named, tarot-card gameplay feature from',
      'ordinary fate-changing verbs. The 52956 explanation says Twists of',
      'Fate are represented by tarot cards; default:62112 says quests unlock',
      'them for permanent always-active stat boosts. The menu and View label',
      'identify the same feature. Japanese ツイスト・オブ・フェイト and Chinese',
      '命运转折 corroborate. Reuse the established menu wording 운명의 굴곡',
      'and pair it with the complete English name. Preserve D-16077 and',
      'D-17983 as separate broader text-review holds; this scope only settles',
      'the named feature identity/display and does not recount those findings.'
    ].join(' ')
  }.freeze
  EVIDENCE = <<~TEXT.strip.freeze
    English default:52956 explicitly names `Twists of Fate` as a tarot-card
    feature and explains its permanent bonus; default:62112 says quests
    unlock the feature and that its stat boosts are always active.
    default:17279 is the standalone menu label and default:58153 is its
    `View` action. Japanese ツイスト・オブ・フェイト and Chinese 命运转折
    corroborate the name. Reuse the established Korean menu wording
    `운명의 굴곡` and pair every reviewed feature label as
    `운명의 굴곡(Twists of Fate)`. D-16077/default:52956 and
    D-17983/default:62112 remain separate historical broader-text holds;
    this named-feature scope does not recount or supersede them.
  TEXT
  EXPECTED = {
    ['default', '17279', ''] => [
      '운명의 굴곡', '운명의 굴곡(Twists of Fate)', 'accepted'
    ],
    ['default', '52956', ''] => [
      nil, nil, 'accepted'
    ],
    ['default', '58153', ''] => [
      '운명의 굴곡 보기', '운명의 굴곡(Twists of Fate) 보기', 'accepted'
    ],
    ['default', '62112', ''] => [
      '특정 퀘스트를 완료하면 운명의 굴곡(Twists of Fate)을 해제할 수 있습니다. 언제나 적용되는 능력치 영구 상승 효과를 부여합니다.',
      '특정 퀘스트를 완료하면 운명의 굴곡(Twists of Fate)을 해제할 수 있습니다. 언제나 적용되는 능력치 영구 상승 효과를 부여합니다.',
      'not-an-issue'
    ]
  }.freeze
  TEXT_REPLACEMENTS = {
    '52956' => [
      ['{*2운명의 전환}', '{*2운명의 굴곡(Twists of Fate)}', 1],
      ['운명의 전환도 타로 카드로 표현됩니다.', '운명의 굴곡(Twists of Fate)도 타로 카드로 표현됩니다.', 1]
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
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "English feature label missing at #{source_key.inspect}" unless
        english.match?(/(?<![A-Za-z])Twists of Fate(?![A-Za-z])/)
      old = source.fetch('work_text')
      expected_old, expected_new, status = EXPECTED.fetch(source_key)
      if source_key[1] == '52956'
        new_text = old.dup
        TEXT_REPLACEMENTS.fetch('52956').each do |from, to, count|
          raise "unexpected text count at #{source_key.inspect}: #{from}" unless
            new_text.scan(from).length == count
          new_text = new_text.sub(from, to)
        end
        status = 'accepted'
      else
        raise "stale Korean at #{source_key.inspect}" unless old == expected_old
        new_text = expected_new
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
    puts "D-21832 prepared #{reviews.length} exact source keys; " \
         "#{reviews.count { |row| row['status'] == 'accepted' }} Texto edits; " \
         "next run apply-reviewed-proper-name-discovery.rb."
  end
end

PrepareTwistsOfFateD21832.run if $PROGRAM_NAME == __FILE__
