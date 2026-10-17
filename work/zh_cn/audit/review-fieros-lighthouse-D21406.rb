#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module FierosLighthouseD21406
  module_function

  def transform(text)
    pattern = /피에로스(?:\(Fieros\))? 등대(?:\(Fieros Lighthouse\))?/
    raise 'missing complete Fieros Lighthouse label' unless text.match?(pattern)
    text.gsub(pattern, '피에로스 등대(Fieros Lighthouse)')
  end

  def run
    context = <<~TEXT.gsub(/\s+/, ' ').strip
      English base:1793 identifies the complete named display label as
      Fieros Lighthouse. Japanese フィエロスの灯台 corroborates both the
      Fieros reading and lighthouse meaning; Chinese 恐怖灯塔 is secondary
      and does not override the English name. Normalize only the complete
      label to 피에로스 등대(Fieros Lighthouse), rather than pairing only
      Fieros inside the Korean compound. All active affix/base/default
      resources were searched; this exact label occurs only at base:1793:11.
      Register the complete title only, without inferring a standalone
      Fieros entity or global alias. The official Korean manual has no
      entry for this specific location.
    TEXT
    spec = {
      key: 'title:fieros-lighthouse', english: 'Fieros Lighthouse',
      category: 'title', korean: '피에로스 등대(Fieros Lighthouse)',
      variants: '피에로스(Fieros) 등대|피에로스 등대|피에로스 등대(Fieros Lighthouse)',
      count: 1, notes: context
    }
    ReviewedDiscoverySpecs.run(
      21_406, 'Fieros Lighthouse Complete Display Label', [spec], context,
      '## D-21401: Longroad Storehouse Complete Display Label'
    ) do |_spec, key, text, _source|
      raise "unexpected Fieros scope #{key.inspect}" unless
        key == ['base', '1793', '11']
      [transform(text), false]
    end
  end
end

FierosLighthouseD21406.run if $PROGRAM_NAME == __FILE__
