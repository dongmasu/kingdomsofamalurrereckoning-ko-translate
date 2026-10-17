#!/usr/bin/env ruby
require_relative 'run-reviewed-discovery-specs'

context = 'Exact repeated short English labels were checked across all three resources and aligned to Japanese/Chinese. Existing Korean paired labels determine spelling where available. These standalone rows alone do not prove a person/place subtype or relationships, so category title records only the source label, with no identity alias. Official manual PDF pp. 1-2 and 9 supplies broad peoples/world context, not an exhaustive name list. No source label is inferred from a neighboring randomized ID.'
rows = [
  ['arsinios', 'Arsinios', '아르시니오스', 1, 'JA アルシニオス / ZH 亚斯尼奥斯; default:19687.'],
  ['euanthe', 'Euanthe', '유안테', 2, 'JA ユアンセ / ZH 欧安瑟; default:26768/64619. Retain the paired form from 64619.'],
  ['sophaeno', 'Sophaeno', '소파에노', 2, 'JA ソファエノ / ZH 索菲诺; default:26984/56560. Retain the paired form from 56560.'],
  ['oneron', 'Oneron', '오네론', 1, 'default:44516; JA オメロン differs in its middle consonant from English Oneron, while ZH 奥内隆 and the existing Korean follow English. Retain the English-led 오네론; do not substitute an inferred Omeron alias.'],
  ['eraste', 'Eraste', '에라스테', 2, 'default:39399/44883; JA エラスト/エラステ varies, ZH 艾拉斯特 agrees on the name. Retain the already-paired Korean 에라스테.'],
  ['alaun', 'Alaun', '알라운', 1, 'default:45132; JA アラウン / ZH 阿劳恩.'],
  ['fitinia', 'Fitinia', '피티니아', 1, 'default:9333; JA フィティニア / ZH 费提尼亚.'],
  ['tarinda', 'Tarinda', '타린다', 3, 'default:8469/45245/46964; JA タリンダ / ZH 塔琳达. Reuse the two existing paired labels.'],
  ['carus', 'Carus', '카루스', 2, 'default:38463/57877; JA カルース / ZH 卡鲁斯. Reuse the paired 38463 label.'],
  ['demetria', 'Demetria', '데메트리아', 1, 'default:49538; JA デメトリア / ZH 德米提雅.'],
  ['ampelio', 'Ampelio', '암펠리오', 2, 'default:41359/55722; JA アンペリオ / ZH 安佩里奥. Reuse the paired 55722 label.'],
  ['stylidi', 'Stylidi', '스틸리디', 2, 'default:48170/58050; JA スティリディ / ZH 斯泰莉迪.'],
  ['neophytos', 'Neophytos', '네오피토스', 2, 'default:20413/62387; JA ネオフィトス is transliterated, whereas ZH 学徒 is semantic. English gives the same exact capitalized label twice; retain the Korean already paired at 62387, without inventing a novice rank or a different entity.']
]
specs = rows.map do |slug, english, korean, count, evidence|
  {key: "title:#{slug}-label", english: english, category: 'title',
   korean: "#{korean}(#{english})", count: count, notes: evidence}
end
ReviewedDiscoverySpecs.run(21313, 'Source-Local Short Labels', specs, context,
                           '## D-21312:') do |spec, key, text, source|
  english = JSON.parse(source.fetch('en_texts_json')).compact
  raise "non-exact label #{key.inspect}" unless english == [spec[:english]]
  stem = spec[:korean].split('(').first
  raise "unexpected Korean #{key.inspect}" unless [stem, spec[:korean]].include?(text)
  [spec[:korean], false]
end
