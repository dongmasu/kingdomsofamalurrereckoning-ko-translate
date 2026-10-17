#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

module EdgarAelforasD21393
  module_function

  def transform(text)
    pattern = /에드거 알포라스(?:\(Edgar Aelforas\))?/
    raise 'missing complete prince name' unless text.match?(pattern)

    text.gsub(pattern, '에드거 알포라스(Edgar Aelforas)')
  end

  def run
    context = <<~TEXT.gsub(/\s+/, ' ').strip
      English default:14764 explicitly names the Almain prince Edgar Aelforas,
      who fell to a Banshaen hag while aiding Dokkalfar in Klurikon. This is
      not the mining operator Edgar Aron and is not a short-name alias of him.
      Japanese エドガー・エルフォラス and Chinese 埃德加·埃尔福拉斯 corroborate
      the complete separate name. Retain the existing Korean 에드거 알포라스
      rather than guessing a new pronunciation from romanization, and add
      its exact English name. Official Korean manual PDF pp. 1-3 establish
      Almain/Dokkalfar peoples, not this individual; preserve their existing
      manual-based labels. All three active and aligned source resources
      were searched; this complete person name occurs only at default:14764.
      Existing monster, people and place decisions in that row are unchanged.
    TEXT
    spec = {
      key: 'person:edgar-aelforas', english: 'Edgar Aelforas', category: 'person',
      korean: '에드거 알포라스(Edgar Aelforas)', variants: '에드거 알포라스',
      count: 1, notes: context
    }
    ReviewedDiscoverySpecs.run(
      21_393, 'Edgar Aelforas As A Separate Prince', [spec], context,
      '## D-21391: Enconeg Row-Scoped Short References'
    ) do |_spec, key, text, _source|
      raise "unexpected prince scope #{key.inspect}" unless key == ['default', '14764', '']
      [transform(text), false]
    end
  end
end

EdgarAelforasD21393.run if $PROGRAM_NAME == __FILE__
