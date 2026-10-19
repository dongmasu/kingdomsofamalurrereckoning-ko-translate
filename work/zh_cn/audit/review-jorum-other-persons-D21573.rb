#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module ReviewJorumOtherPersonsD21573
  extend self
  D = 21_573
  JORUM = 'person:jorum-quintis'
  SPECS = [
    {
      key: JORUM, english: 'Jorum Quintis', korean: '조럼 퀸티스(Jorum Quintis)',
      aliases: 'Jorum Quintus|Jorum|Quintis', category: 'person', count: 11,
      variants: '조럼 퀸티스|조럼 퀸투스|조룸 퀸투스|요룸 퀸투스|조럼|요룸|퀸티스',
      notes: 'Use the complete display name Jorum Quintis at default:20322 and Adept Jorum Quintis at 43300 as the canonical spelling, reusing 조럼 퀸티스. Quest entries 1594/8735/18787/33498 instead spell the same Ysa Scholia Arcana contact Jorum Quintus. Both sources identify the three missing initiates and the stolen gem: default:18787 explicitly says the gem was to be stolen from Jorum, linking the Quintis possessive in their plan at 15430. Default:16656 independently names Jorum Quintis as the Ysa Chapter gem merchant. Japanese ジョーラム・クインティス/クインタス and Chinese 乔洛姆·奎因提斯/奎图斯 corroborate these source variants. Standardize Korean to 조럼 퀸티스, but preserve source-local English Quintis/Quintus and the explicit short Jorum/Quintis forms in annotations. Do not silently fix source spelling or add a Quintus-only alias. Two unique-given-name Fae-magic remarks and the explicit Return to Jorum objective keep their short form.'
    },
    {
      key: 'person:nora-duerr', english: 'Nora Duerr', korean: '노라 듀어(Nora Duerr)',
      category: 'person', count: 3, variants: '노라 듀어',
      notes: 'The two Grave of Nora Duerr labels and the default:57704 epitaph explicitly identify the same deceased person. Japanese ノラ・デュアー and Chinese 诺拉·杜尔 corroborate. Reuse the paired base:2868 spelling 노라 듀어; preserve the epitaph, 1489 date and previous deity decision. No Nora-only alias: do not merge Nora Pepper.'
    },
    {
      key: 'person:cyrus-erlin', english: 'Cyrus Erlin', korean: '사이러스 얼린(Cyrus Erlin)',
      category: 'person', count: 1, variants: '사이러스 얼린',
      notes: 'Default:62021 provides the complete personal display name, already paired correctly. Japanese サイラス・エルリン and Chinese 塞鲁斯·厄林 corroborate identity. Register the exact full name without inventing a biography or Cyrus-only alias; this is not Cyrus Pepper.'
    },
    {
      key: 'person:bara-warnir', english: 'Bara Warnir', korean: '바라 워니르(Bara Warnir)',
      category: 'person', count: 1, variants: '바라 와르니르|바라 워니르',
      notes: 'English default:34002 identifies the Varani sea-rover Bara Warnir and her treacherous brother Tostig Warnir. Japanese バラ・ワーニア and Chinese 巴拉·瓦尼尔 corroborate the explicit full name. Use 워니르, matching the existing Warnir transcription in base:141, consistently for both named siblings. Do not infer who owns the separate Warnir Reward label or register a Warnir-only identity alias.'
    },
    {
      key: 'person:tostig-warnir', english: 'Tostig Warnir', korean: '토스티그 워니르(Tostig Warnir)',
      category: 'person', count: 1, variants: '토스티그 와르니르|토스티그 워니르',
      notes: 'English default:34002 explicitly identifies Tostig Warnir as Bara Warnir brother. Japanese トスティグ・ワーニア and Chinese 托斯提格·瓦尼尔 corroborate. Retain 토스티그 and use 워니르 consistently with Bara and the existing transcription at base:141. Add the complete-name annotation without changing the battle account or inferring an additional family entity.'
    }
  ].freeze
  CONTEXT = <<~TEXT.chomp
    Check full names and explicitly supported short variants across all three
    CSV resources. Use English for identity and the aligned Japanese/Chinese
    cells for corroboration; the official Korean manual supplies no direct
    entry for these people. Keep existing unrelated entity dispositions,
    quest wording, Fae/Scholia annotations, historical dates, opaque tokens
    and line breaks. Shared given names do not establish shared identity.
    The Warnir-only reward, Pepper names and separate Nora/Cyrus characters
    are not assigned to any new full-name identity.
  TEXT

  def transform(spec, key, text, english)
    if spec.fetch(:key) == JORUM
      label = if english.include?('Jorum Quintis')
                'Jorum Quintis'
              elsif english.include?('Jorum Quintus')
                'Jorum Quintus'
              end
      if label
        text = text.gsub(/(?:조럼|조룸|요룸) (?:퀸티스|퀸투스)(?:\(Jorum Quint(?:is|us)\))?/,
                         "조럼 퀸티스(#{label})")
      end
      # The full-name replacement is deliberately excluded from the short-name pass.
      text = text.gsub(/(?:조럼|조룸|요룸)(?![ \t]*(?:퀸티스|퀸투스))(?:\(Jorum\))?/, '조럼(Jorum)')
      if key == ['default', '15430', '']
        text = text.gsub(/퀸티스(?:\(Quintis\))?/, '퀸티스(Quintis)')
      end
      text
    else
      ko = spec.fetch(:korean).sub(/\([^()]+\)\z/, '')
      variants = [ko, *spec.fetch(:variants).split('|')].uniq.sort_by { |value| -value.length }
      pattern = /(?:#{variants.map { |value| Regexp.escape(value) }.join('|')})(?:\(#{Regexp.escape(spec.fetch(:english))}\))?/
      raise "missing reviewed personal name #{key.inspect}" unless text.match?(pattern)
      text.gsub(pattern, spec.fetch(:korean))
    end
  end

  def apply
    ReviewedDiscoverySpecs.run(
      D, 'Jorum Source Variants And Distinct Full Names', SPECS, CONTEXT,
      '## D-21572: Numbered Explorer And Initiate Journal Titles'
    ) do |spec, key, text, source|
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      [transform(spec, key, text, english), false]
    end
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-jorum-other-persons-D21573.rb apply' unless ARGV == ['apply']
  ReviewJorumOtherPersonsD21573.apply
end
