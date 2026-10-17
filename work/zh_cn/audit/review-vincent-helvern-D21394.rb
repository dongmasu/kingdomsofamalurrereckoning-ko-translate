#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module VincentHelvernD21394
  module_function

  KEYS = %w[4663 6454 8357 20890 58255].map { |id| ['default', id, ''] }.freeze

  def transform(text)
    pattern = /빈센트 헬번(?:\(Vincent Helvern\))?/
    raise 'missing complete property-manager name' unless text.match?(pattern)

    text.gsub(pattern, '빈센트 헬번(Vincent Helvern)')
  end

  def run
    context = <<~TEXT.gsub(/\s+/, ' ').strip
      English default:8357 self-introduces Vincent Helvern as Edgar Aron's
      former assistant and facilities manager. Default:20890/58255 explicitly
      self-introduce the same property manager alongside Bor Anjar and the
      mine workforce. Japanese ヴィンセント・ヘルヴァーン and Chinese
      文森特·赫尔文 corroborate. Retain the established full Korean name
      빈센트 헬번 and pair the complete name as 빈센트 헬번(Vincent Helvern).
      Do not add a generic Vincent alias: default:61995 is the country
      St. Vincent and the Grenadines, not this person. All three active
      and aligned source resources were searched; five complete-name rows
      occur in default, three already paired and two missing the pair.
      Existing Edgar Aron, Motus and Bor Anjar decisions are not reopened.
      Official Korean manual PDF p. 7 gives quest context, not this character.
    TEXT
    spec = {
      key: 'person:vincent-helvern', english: 'Vincent Helvern', category: 'person',
      korean: '빈센트 헬번(Vincent Helvern)', variants: '빈센트 헬번',
      count: 5, notes: context
    }
    ReviewedDiscoverySpecs.run(
      21_394, 'Vincent Helvern Complete Name', [spec], context,
      '## D-21393: Edgar Aelforas As A Separate Prince'
    ) do |_spec, key, text, _source|
      raise "unexpected manager scope #{key.inspect}" unless KEYS.include?(key)
      [transform(text), false]
    end
  end
end

VincentHelvernD21394.run if $PROGRAM_NAME == __FILE__
