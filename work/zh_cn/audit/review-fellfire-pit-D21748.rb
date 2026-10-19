#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module ReviewFellfirePitD21748
  extend self

  M = ReviewedNameBatches
  D = 21_748
  TERM = 'Fellfire Pit'
  CANONICAL = '펠파이어 구덩이(Fellfire Pit)'
  CONTEXT = <<~TEXT.strip.freeze
    Review every exact Fellfire Pit reference across affix/base/default.
    English default:12808 explicitly calls it another Fae Hollow and says
    Fellfire Bloom grows only in the pit's sulfuric climate; travel and
    quest-label rows independently identify the same place. Japanese
    フェルファイア岩窟 and Chinese 邪火洞/落火坑 corroborate the location.
    Use the established Fellfire root 펠파이어 and canonical place form
    펠파이어 구덩이(Fellfire Pit), correcting the split base label and
    adding missing English pairs. At default:12808, restore the second
    explicit English place mention rather than leaving the generic 그 구덩이.
    Keep the distinct item:fellfire-bloom as 펠파이어 꽃(Fellfire Bloom);
    do not merge the flower with its location. Earlier sentence findings at
    default:12808, 13511, 19699, 25490, 50298, and 50534 remain historical
    decisions and are not resolved or recounted by this place-name pass.
    Preserve particles, markup, tokens, punctuation, and line breaks. The
    official Korean manual has no direct Fellfire entry.
  TEXT

  SPANS = {
    ['base', '812', '11'] => ['펠파이어(Fellfire) 구덩이', CANONICAL],
    ['default', '12808', ''] => [
      '유황 기후의 그 구덩이에서',
      "유황 기후의 #{CANONICAL}에서"
    ],
    ['default', '13511', ''] => ['펠파이어 구덩이', CANONICAL],
    ['default', '19212', ''] => ['펠파이어 구덩이로 가기', "#{CANONICAL}로 가기"],
    ['default', '19699', ''] => ['펠파이어 구덩이를', "#{CANONICAL}를"],
    ['default', '25490', ''] => ['펠파이어 구덩이 찾기', "#{CANONICAL} 찾기"],
    ['default', '44873', ''] => ['펠파이어 구덩이로 들어가기', "#{CANONICAL}로 들어가기"],
    ['default', '50298', ''] => ['펠파이어 구덩이를 지키는', "#{CANONICAL}를 지키는"],
    ['default', '50534', ''] => ['펠파이어 구덩이에 들어가', "#{CANONICAL}에 들어가"],
    ['default', '57595', ''] => ['펠파이어 구덩이에서', "#{CANONICAL}에서"]
  }.freeze
  COMPLETE_KEYS = [
    ['default', '16502', ''], ['default', '18696', ''],
    ['default', '23221', '']
  ].freeze

  SPECS = [{
    key: 'place:fellfire-pit',
    english: TERM,
    category: 'place',
    korean: CANONICAL,
    variants: '펠파이어 구덩이|펠파이어(Fellfire) 구덩이',
    count: 13,
    notes: CONTEXT
  }].freeze

  def transform(_spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    raise "English Fellfire Pit source missing at #{key.inspect}" unless
      english.match?(/(?<![A-Za-z])Fellfire Pit(?![A-Za-z])/i)

    if COMPLETE_KEYS.include?(key)
      raise "canonical Fellfire Pit pair missing at #{key.inspect}" unless
        text.include?(CANONICAL)
      return [text, false]
    end

    old, replacement = SPANS.fetch(key) do
      raise "unmapped Fellfire Pit source key #{key.inspect}"
    end
    return [text, false] if text.include?(replacement)
    raise "expected one reviewed Korean span at #{key.inspect}" unless
      text.scan(Regexp.new(Regexp.escape(old))).length == 1

    [text.sub(old, replacement), false]
  end

  def preflight
    inventory = M.refresh_inventory
    generated = build_occurrences(
      inventory.values,
      [{
        'entity_key' => 'place:fellfire-pit',
        'english_canonical' => TERM,
        'english_aliases' => ''
      }]
    )
    keys = generated.map { |row| [row[1], row[2], row[3]] }.sort
    expected = (SPANS.keys + COMPLETE_KEYS).sort
    raise "Fellfire Pit source coverage changed: #{keys.inspect}" unless
      keys.length == 13 && keys.uniq.length == 13 && keys == expected

    edits = keys.count do |key|
      source = inventory.fetch(key)
      text, = transform(SPECS.first, key, source.fetch('work_text'), source)
      text != source.fetch('work_text')
    end
    raise "unexpected planned edit count #{edits}; expected 0 or 10" unless
      [0, 10].include?(edits)
    puts "D-#{D}: read-only; #{keys.length} exact source keys; " \
         "#{edits} cell edits; #{COMPLETE_KEYS.length} already canonical."
    keys
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['--check']
    ReviewFellfirePitD21748.preflight
  when ['--apply']
    ReviewFellfirePitD21748.preflight
    ReviewedDiscoverySpecs.run(
      ReviewFellfirePitD21748::D,
      'Fellfire Pit Place',
      ReviewFellfirePitD21748::SPECS,
      ReviewFellfirePitD21748::CONTEXT,
      '<!-- current-proper-name-batch:start -->'
    ) do |spec, key, text, source|
      ReviewFellfirePitD21748.transform(spec, key, text, source)
    end
  else
    abort 'Usage: review-fellfire-pit-D21748.rb [--check|--apply]'
  end
end
