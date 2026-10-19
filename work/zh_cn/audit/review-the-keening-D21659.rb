#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module TheKeeningD21659
  extend self

  D = 21_659
  CANONICAL = '키닝(The Keening)'
  EDITS = {
    ['base', '2472', '11'] => ['통곡 (The Keening)', CANONICAL],
    ['default', '3201', ''] => ['키닝(the Keening)', CANONICAL],
    ['default', '7099', ''] => [CANONICAL, CANONICAL],
    ['default', '7882', ''] => [CANONICAL, CANONICAL],
    ['default', '14754', ''] => ['통곡(The Keening)', CANONICAL],
    ['default', '26539', ''] => [
      '고맙네, 필멸자여. 알레이아(Alleia)의 동굴은 라닐이라고 하네. 키닝 남쪽 끝에 있지.',
      '고맙네, 필멸자여. 알레이아(Alleia)의 동굴은 라닐이라고 하네. 키닝(The Keening) 남쪽 끝에 있지.'
    ],
    ['default', '26653', ''] => [
      '여기서 남쪽, 키닝 산봉우리에 있어. 오래된 에라시(Erathi) 유적이라 방어하기도 쉽지. 반란군이 거기에 모인 건 현명한 선택이었어.',
      '여기서 남쪽, 키닝(The Keening) 산봉우리에 있어. 오래된 에라시(Erathi) 유적이라 방어하기도 쉽지. 반란군이 거기에 모인 건 현명한 선택이었어.'
    ],
    ['default', '26929', ''] => [
      '마녀기사 클레란(Khleran)은 키닝에 있는 게니그(Ghennig) 요새 꼭대기에 있다. 오드라 피란(Audra Firan)이 그를 처치하는 걸 도와 달라고 했다.',
      '마녀기사 클레란(Khleran)은 키닝(The Keening)에 있는 게니그(Ghennig) 요새 꼭대기에 있다. 오드라 피란(Audra Firan)이 그를 처치하는 걸 도와 달라고 했다.'
    ],
    ['default', '29355', ''] => [
      '끔찍했어. 날 투아사(Tuatha)에게 팔아 \'키닝(The Keening)\'이라는 곳으로 보내려 했어.',
      '끔찍했어. 날 투아사(Tuatha)에게 팔아 \'키닝(The Keening)\'이라는 곳으로 보내려 했어.'
    ],
    ['default', '30230', ''] => [CANONICAL, CANONICAL],
    ['default', '31777', ''] => [
      '끔찍했어. 놈들은 날 투아사(Tuatha)에 팔아넘기고 키닝이라는 곳으로 보내려 했어.',
      '끔찍했어. 놈들은 날 투아사(Tuatha)에 팔아넘기고 키닝(The Keening)이라는 곳으로 보내려 했어.'
    ],
    ['default', '31813', ''] => ['키닝', CANONICAL],
    ['default', '41526', ''] => [
      '라닐은 키닝 남쪽 끝에 있는 페이(Fae) 동굴이야.',
      '라닐은 키닝(The Keening) 남쪽 끝에 있는 페이(Fae) 동굴이야.'
    ],
    ['default', '52413', ''] => [CANONICAL, CANONICAL],
    ['default', '56783', ''] => [
      '라닐(Rahnil)로 가. 키닝 남쪽 끝에 있는 굴이야.',
      '라닐(Rahnil)로 가. 키닝(The Keening) 남쪽 끝에 있는 굴이야.'
    ]
  }.freeze
  EXCLUDED = ['default', '14431', ''].freeze
  EXCLUDED_TEXT = '통곡의 저주'
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English-led all-resource review found 15 exact region references to
    The Keening and one separate title, The Keening Curse. Battle history,
    the named southern edge/peaks, a keep located in the Keening, a hollow's
    position, and a line explicitly calling it a place establish the region.
    Japanese キーニング supports the name form; Chinese 哀恸之地 independently
    renders the place. Register only place:the-keening and normalize its
    Korean display to 키닝(The Keening), including the existing 통곡 variant
    and missing English annotations. Exclude The Keening Curse as a distinct
    title; do not infer that it names or belongs to the region. All 15 exact
    source keys and the excluded title were checked across affix/base/default.
    The official Korean manual files contain no direct Keening entry; their
    omission is not contrary evidence. Existing row findings and historical
    translation totals are not reopened or recounted.
  TEXT

  def transform(spec, key, text, source)
    expected = EDITS.keys + [EXCLUDED]
    raise "unexpected Keening source #{key.inspect}" unless expected.include?(key)

    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise 'English Keening reference missing' unless english.match?(/\bKeening\b/)
    raise 'Japanese place-name corroboration missing' unless japanese.include?('キーニング')
    if key == EXCLUDED
      raise 'Keening Curse title changed' unless english == 'The Keening Curse'
      raise 'Chinese curse-title corroboration missing' unless chinese == '哀恸诅咒'
      raise 'Keening Curse Korean label changed' unless text == EXCLUDED_TEXT
      return [text, true]
    end
    raise 'Chinese place rendering missing' unless chinese.include?('哀恸之地')

    old, replacement = EDITS.fetch(key)
    if old == replacement
      raise 'existing canonical Keening label missing' unless text.scan(old).length == 1
      return [text, false]
    end
    if key == ['default', '3201', '']
      raise 'unexpected Keening mention count' unless
        text.scan(old).length + text.scan(replacement).length == 1
      return [text.sub(old, replacement), false]
    end
    raise "unexpected Korean cell at #{key.inspect}" unless [old, replacement].include?(text)
    [replacement, false]
  end

  def apply
    specs = [{
      key: 'place:the-keening',
      english: 'The Keening',
      category: 'place',
      korean: CANONICAL,
      aliases: 'Keening',
      variants: '통곡|키닝',
      count: EDITS.length + 1,
      notes: NOTE
    }]
    ReviewedDiscoverySpecs.run(
      D, 'The Keening Region', specs, NOTE,
      '<!-- current-proper-name-batch:start -->'
    ) do |_spec, key, text, source|
      transform(specs.first, key, text, source)
    end
  end
end

TheKeeningD21659.apply if $PROGRAM_NAME == __FILE__
