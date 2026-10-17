#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

specs = [{
  key: 'family:gwynedds', english: 'Gwynedds', category: 'people',
  korean: '그위네드 부부(Gwynedds)', variants: '귀네드 가족|그위네드 가족|그윈에드 부부',
  count: 6,
  notes: 'English default:53181 explicitly names Cadwallon and Nesta Gwynedd, then refers to the Gwynedds resuming their harvest; default:3886 says one of them has died. Japanese グイネズ夫妻/グイネズ夫婦 explicitly identifies the couple and Chinese 格温内德家/格温内德一家 corroborates the family group. This is a named couple/family group (schema category people), not an ethnic people, individual person, dynasty or global Gwynedd surname alias. Reuse Nesta\'s established family spelling 그위네드 and the explicit couple sense 부부, with the exact English plural Gwynedds rather than singular Gwynedd. Keep the two separate personal names and all prior person dispositions.'
}]
spans = {
  '3886' => ['그위네드(Gwynedd) 사람 중 하나', '그위네드 부부(Gwynedds) 중 한 사람'],
  '5580' => ['귀네드 가족', '그위네드 부부(Gwynedds)'],
  '9106' => ['그위네드 가족은', '그위네드 부부(Gwynedds)는'],
  '28073' => ['그윈에드(Gwynedd) 부부', '그위네드 부부(Gwynedds)'],
  '45641' => ['그위네드(Gwynedd) 가문 사람들을', '그위네드 부부(Gwynedds)를'],
  '53181' => ['그위네드 가족이', '그위네드 부부(Gwynedds)가']
}
context = 'English-first named-family consistency across affix/base/default. The explicit English couple at 53181 and Japanese spouse wording distinguish plural Gwynedds from either person; Chinese supports the family group. Official Korean manual PDF p. 1 gives people/world context and PDF p. 7 quest context, not this family name. Apply only the six approved family-label spans, including required noun/particle agreement when 가족/사람들 becomes 부부. At 3886 preserve the exact one-person death meaning with 중 한 사람. Preserve all named individuals, garden/harvest actions, other terms, tokens and line breaks. This does not reopen Nesta or Cadwallon person-name decisions or historical global totals.'

ReviewedDiscoverySpecs.run(
  21_293, 'The Gwynedd Couple as a Distinct Family Group', specs, context,
  '## D-21283: Delfric Surname-Only References'
) do |_spec, key, text, _source|
  raise 'unexpected non-default family key' unless key[0] == 'default'
  old_span, new_span = spans.fetch(key[1])
  raise "family label span changed #{key.inspect}" unless text.scan(old_span).length == 1
  [text.sub(old_span, new_span), false]
end
