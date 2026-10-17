#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = <<~TEXT.gsub(/\s+/, ' ').strip
  English default:17265 explicitly calls Besin's minions Fahrlangi and
  distinguishes the mage Fahrlang. Default:51339 explains the historical
  followers who adopted that group name; default:5270/54309 identifies Besin
  as its leader. Japanese ファーランギ and Chinese 法朗教/法朗信徒 corroborate
  a named faction, not a personal-name alias. Reuse the Korean root of the
  existing 파를랑(Fahrlang) and the repeated 파를랑기 form; normalize
  파흘랑기 to 파를랑기(Fahrlangi). Preserve ordinary role nouns and the
  already covering Fahrlangi mages annotation at default:12428. The official
  Korean manual supplies setting/quest context (PDF pp. 1, 6), but does not
  list this faction. All affix/base/default source rows were searched; only
  default has applicable hits. Do not reopen the distinct Fahrlang record or
  other historical entity/row dispositions.
TEXT

specs = [{
  key: 'faction:fahrlangi', english: 'Fahrlangi', category: 'faction',
  korean: '파를랑기(Fahrlangi)', variants: '파를랑기|파흘랑기', count: 33,
  notes: context
}]
ReviewedDiscoverySpecs.run(
  21_376, 'Fahrlangi Faction', specs, context, '### D-21375: Jakin Short Alias'
) do |_spec, key, text, _source|
  if key == ['default', '12428', '']
    raise 'changed covering label' unless text == '파를랑기 마법사들(Fahrlangi mages)'
    [text, false]
  else
    pattern = /(?:파를랑기|파흘랑기)(?:\(Fahrlangi\))?/
    raise "missing faction span #{key.inspect}" unless text.match?(pattern)
    [text.gsub(pattern, '파를랑기(Fahrlangi)'), false]
  end
end
