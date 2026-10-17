#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = <<~TEXT.gsub(/\s+/, ' ').strip
  English default:34706 explicitly lists Virki among Erathell's Alfar
  strongholds; default:4974/54888/62113 describes its water-gates and their
  connection to Tywili Coast. Japanese ヴァーキ and Chinese 维尔吉
  corroborate the same place. Reuse the dominant base/standalone Korean
  비르키(Virki), replacing the two 버르키 variants and pairing repeated
  mentions locally. Base:1307 separately labels Virki Upstairs; Japanese
  ヴァーキの上り階段 and Chinese 维尔吉楼上 corroborate the upstairs
  destination. Retain the English meaning and Korean 위층, pairing the whole
  label as 비르키 위층(Virki Upstairs). The official Korean manual PDF p. 7
  explains map destinations and quest targets, not this fortress's name.
  All three resources were searched; matches occur only in base/default.
  Existing Anela, Culn and other entity/row dispositions are not reopened.
TEXT
specs = [
  {
    key: 'place:virki', english: 'Virki', category: 'place',
    korean: '비르키(Virki)', variants: '비르키|버르키', count: 27, notes: context
  },
  {
    key: 'place:virki-upstairs', english: 'Virki Upstairs', category: 'place',
    korean: '비르키 위층(Virki Upstairs)', variants: '비르키(Virki) 위층',
    count: 1, notes: context
  }
]
ReviewedDiscoverySpecs.run(
  21_385, 'Virki And Upstairs', specs, context,
  '## D-21384: Arhaus Vorm And Short Name'
) do |spec, key, text, _source|
  if spec[:key] == 'place:virki'
    pattern = /(?:비르키|버르키)(?:\(Virki\))?/
    raise "missing Virki span #{key.inspect}" unless text.match?(pattern)
    [text.gsub(pattern, spec[:korean]), false]
  else
    raise 'changed upstairs label' unless text == '비르키(Virki) 위층'
    [spec[:korean], false]
  end
end
