#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

module EnfamanirD21656
  extend self
  D = 21_656
  TITLE_ONLY = {
    'base' => %w[2218 3449],
    'default' => %w[9143 32963 54698 60140]
  }.freeze
  EXPECTED = {
    'base' => %w[2218 3449],
    'default' => %w[9143 13659 20151 26329 30467 32963 35224 36027 38975 54698 60140 61125 64967]
  }.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:26329 explicitly identifies Enfamanir as a dreaded
    Niskaru Horrinox; default:35224 independently names the wicked Niskaru.
    Japanese エンファマニア and Chinese 恩法玛尼尔/恩法曼米尔 corroborate.
    Reuse the established 엔파마니르(Enfamanir) at default:61125.
    The ballad Shadow of Enfamanir remains a separate named work:
    exclude title-only rows and preserve its complete bilingual title.
    At 26329 pair only the two independent creature references.
    Preserve prior D-9881/D-9893/D-16552/D-17888/D-18153 sentence,
    title and other-name holds; this narrow annotation is not a resolution
    or recount of those translation judgments. No additional biography
    or identity merge is inferred. Official Korean manual context gives
    no direct spelling for this individual creature.
  TEXT

  def transform(key, text, source)
    resource, id, = key
    raise "unexpected Enfamanir source #{key}" unless EXPECTED.fetch(resource, []).include?(id)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    raise 'English name missing' unless english.include?('Enfamanir')
    raise 'Japanese name missing' unless japanese.match?(/Enfamanir|エンファマニア/)
    raise 'Chinese name missing' unless source.fetch('zh_text').match?(/Enfamanir|恩法/)
    return [text, true] if TITLE_ONLY.fetch(resource, []).include?(id)

    changed = text.gsub(/엔파마니르(?!의 그림자|\(Enfamanir\))/, '엔파마니르(Enfamanir)')
    expected_pairs = %w[26329 36027].include?(id) ? 2 : 1
    raise "creature annotation count differs at #{key}" unless
      changed.scan('엔파마니르(Enfamanir)').length == expected_pairs
    [changed, false]
  end

  def apply
    spec = {
      key: 'monster:enfamanir', english: 'Enfamanir', category: 'monster',
      korean: '엔파마니르(Enfamanir)', variants: '엔파마니르',
      count: 15, notes: NOTE
    }
    ReviewedDiscoverySpecs.run(D, 'Enfamanir Creature And Separate Ballad Title',
      [spec], NOTE, '<!-- current-proper-name-batch:start -->') do |_spec, key, text, source|
      transform(key, text, source)
    end
  end
end

EnfamanirD21656.apply if $PROGRAM_NAME == __FILE__
