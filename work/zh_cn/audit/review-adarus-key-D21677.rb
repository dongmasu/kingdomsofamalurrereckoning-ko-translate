#!/usr/bin/env ruby

require 'json'
require_relative 'run-reviewed-discovery-specs'

module AdarusKeyD21677
  extend self

  D = 21_677
  CANONICAL = '아다루스의 열쇠(Adarus Key)'
  TARGETS = {
    ['base', '2066', '11'] => {
      english: 'Adarus Key',
      japanese: 'アダラスの鍵',
      chinese: '阿达鲁斯钥匙',
      old: '아다루스(Adarus)의 열쇠',
      new: CANONICAL
    },
    ['default', '26423', ''] => {
      english: 'The seed for the blade of the Adarus Key.',
      japanese: 'アダラスの鍵の刃に使う種。',
      chinese: '阿达鲁斯钥匙剑刃的种子。',
      old_span: '아다루스 열쇠',
      new_span: CANONICAL
    },
    ['default', '30017', ''] => {
      english: 'The seed for the bow of the Adarus Key.',
      japanese: 'アダラスの鍵の弓に使う種。',
      chinese: '阿达鲁斯钥匙弓的种子。',
      old_span: '아다루스 열쇠',
      new_span: CANONICAL
    }
  }.freeze
  PAIRED = {
    ['default', '8189', ''] => {
      english: 'The seed that binds the blade and the bow of the Adarus Key.',
      japanese: 'アダラスの鍵の刃と弓を繋ぐ種。',
      chinese: '结合阿达鲁斯钥匙的剑刃和弓的种子。',
      korean: '아다루스의 열쇠(Adarus Key)의 칼날과 활을 잇는 씨앗.'
    }
  }.freeze
  ALL_KEYS = (TARGETS.keys + PAIRED.keys).sort.freeze
  EXACT_ITEM = /(?<![A-Za-z])Adarus Key(?![A-Za-z])/

  D19307_ROW =
    '| D-19307 | `default` 26405-26406, 26408, 26417, 26419-26420, 26423-26424, 26428, 26430, 26432, 26434, 26436-26437, 26439-26440, 26442, 26444, 26447 | not an issue | The names, terms, and narrative details preserve their English meaning; Japanese/Chinese support the readings. The Headhunter context includes a reward handoff. |'
  D9640_ROW =
    "| D-9640 | `default` 30017 | Bow of the Adarus Key | unchanged | uncertain | Capitalization leaves the boundary between a named `Adarus Key` and a key-like bow unclear; Korean's compound can be parsed ambiguously. |"
  D19307_CONSOLIDATED_ROW =
    '| D-19307 | `default` 26405-26406, 26408, 26417, 26419-26420, 26423-26424, 26428, 26430, 26432, 26434, 26436-26437, 26439-26440, 26442, 26444, 26447 | not an issue | Proper names and concise labels are recognizable; the Master\'s Key, seasteel, Adarus Key seed, relic, loyalty, amulet, and quest passages preserve the source facts. The Headhunter-to-reward handoff supports `현상금 사냥꾼`; the already accepted `감시관` at 26436 is unchanged. Japanese and Chinese corroborate the relevant meanings without requiring a new Korean form. |'

  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Register Adarus Key as the named item Adarus Key, not the bare Adarus
    person/name. English base:2066 is the standalone item label; Japanese
    アダラスの鍵 and Chinese 阿达鲁斯钥匙 corroborate it. Default:26423 and
    default:30017 refer to the same named item within seed descriptions;
    their Japanese and Chinese rows support the item reference. Pair only
    those exact Korean item-name spans as 아다루스의 열쇠(Adarus Key).
    Default:8189 already contains that complete bilingual form and remains
    unchanged. Keep Adarus Keybinding Seed, Adarus Keybow Seed, and Adarus
    Keyblade Seed atomic and separate; do not attach the bare Adarus name to
    this item entity. D-19307's terminal not-an-issue record for default:26423
    remains verbatim and is not reopened or reinterpreted. At default:30017,
    this item-name annotation does not resolve the outstanding sentence and
    translation hold: D-9640 remains unchanged and open. All exact
    Adarus Key source keys across affix/base/default are checked; no other
    source key is included. No historical global tally is recounted.
  TEXT

  def transform(spec, key, text, source)
    raise 'unreviewed Adarus Key source key' unless ALL_KEYS.include?(key)
    raise 'wrong Adarus Key entity' unless spec.fetch(:key) == 'item:adarus-key'

    expected = TARGETS[key] || PAIRED.fetch(key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    raise "English source changed at #{key.inspect}" unless english == expected.fetch(:english)
    raise "Japanese source changed at #{key.inspect}" unless japanese == expected.fetch(:japanese)
    raise "Chinese source changed at #{key.inspect}" unless chinese == expected.fetch(:chinese)
    raise "English item span missing at #{key.inspect}" unless english.match?(EXACT_ITEM)

    if PAIRED.key?(key)
      raise "existing paired Korean form changed at #{key.inspect}" unless
        text == expected.fetch(:korean)
      return [text, false]
    end

    if key == ['base', '2066', '11']
      raise "standalone item label changed at #{key.inspect}" unless
        text == expected.fetch(:old) || text == expected.fetch(:new)
      return [expected.fetch(:new), false]
    end

    old_span = expected.fetch(:old_span)
    new_span = expected.fetch(:new_span)
    raise "exact item span count differs at #{key.inspect}" unless text.scan(old_span).length == 1
    [text.sub(old_span, new_span), false]
  end

  def verify_historical_state!
    register = File.read(File.join(__dir__, 'decision-register-20261009.md'))
    raise 'D-19307 historical judgment changed or missing' unless register.include?(D19307_ROW)
    raise 'D-9640 unresolved judgment changed or missing' unless register.include?(D9640_ROW)

    consolidated = File.read(
      File.join(__dir__, 'consolidated-context-review-default-26401-26450-20261011.md')
    )
    raise 'D-19307 consolidated judgment changed or missing' unless
      consolidated.include?(D19307_CONSOLIDATED_ROW)
  end

  def apply
    verify_historical_state!
    note = NOTE
    specs = [{
      key: 'item:adarus-key',
      english: 'Adarus Key',
      category: 'item',
      korean: CANONICAL,
      variants: '아다루스(Adarus)의 열쇠|아다루스 열쇠',
      count: ALL_KEYS.length,
      notes: note
    }]
    ReviewedDiscoverySpecs.run(
      D, 'Adarus Key Named Item', specs, note,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, key, text, source| transform(spec, key, text, source) }
  end
end

AdarusKeyD21677.apply if $PROGRAM_NAME == __FILE__
