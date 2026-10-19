#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module ReviewHeadhunterPersonsD21571
  extend self
  D = 21_571
  DATA = [
    ['sinder', 'Sinder', '신더', 5, 'Japanese シンダー and Chinese 辛德 corroborate the name. Retain the established 신더, not the differently spelled English word Cinder.'],
    ['rendi-walsh', 'Rendi Walsh', '렌디 월시', 4, 'Japanese レンディ・ウォルシュ and Chinese 伦蒂·沃尔什 corroborate. Reuse the existing paired 렌디 월시(Rendi Walsh) in default:8463/50658.'],
    ['sorcha-donohue', 'Sorcha Donohue', '소르카 도너휴', 5, 'Japanese ソーチャ・ドナヒュー and Chinese 索查·多纳休 corroborate identity, not an authoritative pronunciation change. Preserve the repeated 소르카 도너휴. English default:34508 instead spells the surname Donahue, but Japanese/Chinese retain exactly the same full name and the warning concerns the same pursuer; register Sorcha Donahue as the explicit source spelling variant and retain that local English annotation. At default:54611, the preceding Korean 헤드헌터 already conveys the title; normalize only the annotation from (Headhunter Sorcha Donohue) to (Sorcha Donohue).'],
    ['cyrus-pepper', 'Cyrus Pepper', '사이러스 페퍼', 4, 'Japanese サイラス・ペッパー and Chinese 塞鲁斯·佩珀 corroborate. Reuse the existing complete paired name at default:64828.'],
    ['nora-pepper', 'Nora Pepper', '노라 페퍼', 4, 'Japanese ノーラ・ペッパー and Chinese 诺拉·佩珀 corroborate. Reuse the existing complete paired name at default:56469.']
  ].freeze
  CONTEXT = <<~TEXT.chomp
    English default:29912 explicitly enumerates five named Headhunters band
    members; the individual labels, proof-of-death items and matching reward
    descriptions identify the same people. Check all affix/base/default
    sources; the exact five-name scope has only default hits. Retain names,
    gender-neutral Korean dialogue, token labels, reward wording and Warden
    Rask/Crownhold decisions. Do not register unrestricted Pepper, Nora, Cyrus,
    Rendi, Sorcha, or Walsh aliases; do not merge Apothecary Pepper, Dr. Pepper
    or pepper-named quarters with these people. The Pepper twins reference is
    outside the complete-name scope and remains unchanged. The official Korean
    manual supplies no exact entry for these NPCs. This does not normalize
    the generic Headhunter profession or claim a family relationship.
  TEXT

  def specs
    DATA.map do |key, english, korean, count, notes|
      {
        key: "person:#{key}", english: english, korean: "#{korean}(#{english})",
        category: 'person', count: count, variants: korean,
        aliases: key == 'sorcha-donohue' ? 'Sorcha Donahue' : '',
        notes: "English-led full-name registration. #{notes}"
      }
    end
  end

  def transform(spec, text, local_english = spec.fetch(:english))
    english = spec.fetch(:english)
    korean = spec.fetch(:korean).sub(/\(#{Regexp.escape(english)}\)\z/, '')
    allowed = [english, *spec.fetch(:aliases, '').split('|')]
    raise 'unreviewed English name label' unless allowed.include?(local_english)
    labels = allowed.map { |label| Regexp.escape(label) }.join('|')
    pattern = /#{Regexp.escape(korean)}(?:\((?:Headhunter )?(?:#{labels})\))?/
    raise "missing reviewed Korean name #{english}" unless text.match?(pattern)

    text.gsub(pattern, "#{korean}(#{local_english})")
  end

  def apply
    ReviewedDiscoverySpecs.run(
      D, 'Five Named Headhunters', specs, CONTEXT,
      '### D-21570: Three Missing Scholia Arcana Initiates'
    ) do |spec, _key, text, source|
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      label = [spec.fetch(:english), *spec.fetch(:aliases, '').split('|')].find { |name| english.include?(name) }
      raise 'unexpected source name' unless label
      [transform(spec, text, label), false]
    end
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-headhunter-persons-D21571.rb apply' unless ARGV == ['apply']
  ReviewHeadhunterPersonsD21571.apply
end
