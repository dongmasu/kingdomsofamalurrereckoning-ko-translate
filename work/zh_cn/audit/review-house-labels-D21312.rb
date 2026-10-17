#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = 'English standalone X House labels are compared with Japanese Xの家 and Chinese 房子/宅邸, supporting dwelling labels rather than silently inferred aristocratic factions. Official manual PDF p. 10 distinguishes physical player houses; p. 7 lists faction names, but neither identifies these exact labels. Register only the exact named titles: no surname alias, ownership link, household genealogy, or shared identity with any similarly named person is established.'
specs = [
  {key: 'title:beck-house', english: 'Beck House', category: 'title',
   korean: '벡의 집(Beck House)', count: 1,
   notes: 'default:8948 Beck House, Japanese ベックの家 and Chinese 贝克的房子. Preserve 벡의 집 and pair the complete name. Beckry Aideh is not an identity match.'},
  {key: 'title:blevins-house', english: 'Blevins House', category: 'title',
   korean: '블레빈스의 집(Blevins House)', count: 1,
   notes: 'default:20270 Blevins House, Japanese ブレビンスの家 and Chinese 布莱文斯的房子. Preserve the existing dwelling wording. Do not assert that it belongs to Nettie Blevins.'},
  {key: 'title:barclay-house', english: 'Barclay House', category: 'title',
   korean: '바클레이 저택(Barclay House)', count: 2,
   notes: 'base:2575 Barclay House is already 바클레이(Barclay) 저택, with Japanese バークレイ・ハウス and explicit Chinese 巴克雷宅邸. default:35569 has the same exact English label with Japanese バークレイの家 and Chinese 巴克雷家. Reuse the established dwelling wording 바클레이 저택 across both and pair the complete name, rather than invent a Barclay faction. These labels do not prove identity with Kester Barclay’s separately named house, so no merge or bare Barclay alias is added.'},
  {key: 'title:sinclair-house', english: 'Sinclair House', category: 'title',
   korean: '싱클레어의 집(Sinclair House)', count: 1,
   notes: 'default:13447 Sinclair House, Japanese シンクレアの家 and Chinese 辛克莱的房子. Use 집 rather than the unsupported family-only 가문. The alchemist/impostor Sinclair narrative does not establish this title’s owner or a lineage.'},
  {key: 'title:pengaras-house', english: 'Pengaras House', category: 'title',
   korean: '펜가라스의 집(Pengaras House)', count: 1,
   notes: 'default:34380 Pengaras House was excluded from person:pengaras at D-20520 as a place label. Japanese ペンガラスの家 and Chinese 彭加拉斯的房子 support 집, not an inferred mansion. Reuse the established 펜가라스 spelling without claiming ownership by the person or reopening its prior person-scope exclusion.'},
  {key: 'title:vanger-house', english: 'Vanger House', category: 'title',
   korean: '밴저의 집(Vanger House)', count: 1,
   notes: 'default:47635 Vanger House, Japanese ヴァンジャーの家 and Chinese 范格的房子. Preserve 밴저 but use 집 rather than an unsupported family-only 가문; no separate family identity is asserted.'},
  {key: 'title:taggart-house', english: 'Taggart House', category: 'title',
   korean: '태거트의 집(Taggart House)', count: 1,
   notes: 'default:48003 Taggart House, Japanese タガートの家 and Chinese 塔吉特的房子. Preserve 태거트 but use the dwelling meaning 집. Do not alias or merge with Nina Taggert: the English spellings differ and no relationship is established.'}
]
expected = {
  ['base', '2575', '11'] => '바클레이(Barclay) 저택',
  ['default', '8948', ''] => '벡의 집',
  ['default', '13447', ''] => '싱클레어 가문',
  ['default', '20270', ''] => '블레빈스의 집',
  ['default', '34380', ''] => '펭가라스 저택',
  ['default', '35569', ''] => '바클레이 가문',
  ['default', '47635', ''] => '밴저 가문',
  ['default', '48003', ''] => '태거트 가문'
}.freeze
ReviewedDiscoverySpecs.run(21312, 'Complete House Labels', specs, context,
                           '## D-21311:') do |spec, key, text, _source|
  raise "unexpected house label #{key.inspect}" unless text == expected.fetch(key)
  [spec[:korean], false]
end
