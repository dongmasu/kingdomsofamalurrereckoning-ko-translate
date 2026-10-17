#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'

specs = [{
  key: 'person:cadwallon-gwynedd', english: 'Cadwallon Gwynedd', category: 'person',
  korean: '캐드월런 그위네드(Cadwallon Gwynedd)', aliases: 'Cadwallon',
  variants: '캐드월런 귀네드|캐드월런 그위네드|캐드월론|캐드왈론', count: 17,
  notes: 'English full-name objective/labels default:4940/35735/44963 identify Cadwallon Gwynedd. English 19979 and 45378 explicitly call short Cadwallon Nesta Gwynedd\'s husband; the remaining source hits consistently concern the same castaway couple, Olaf pursuit, island life and garden. Japanese キャドワロン・グイネズ/キャドワロン and Chinese 凯德沃伦·格温内德/凯德沃伦 corroborate. All 17 full/short source keys were individually checked before registering the evidenced Cadwallon short alias; no Gwynedd surname or family-plural alias is registered for this person. Reuse the already established Nesta family stem 그위네드 and dominant personal stem 캐드월런, correcting 귀네드, 캐드월론 and 캐드왈론. Earlier D-21108 exclusions of these husband rows from Nesta remain valid, not reopened. Preserve every Nesta annotation and the separate family-plural expression.'
}]
context = 'English-led full/short personal-name review across affix/base/default, with independently checked identity anchors and aligned Japanese/Chinese. Official Korean manual PDF p. 1 gives world/people context and PDF p. 7 distinguishes quests; it does not name this couple. Only name spans change, with no required particle change because the alternative personal spellings end in the same consonant and the family spellings share the same final syllable. Older Nesta decisions, family-plural meanings, actions, tokens and line breaks are preserved; no historical global total is reopened.'

ReviewedDiscoverySpecs.run(
  21_292, 'Cadwallon Gwynedd and His Evidenced Short Name', specs, context,
  '## D-21283: Delfric Surname-Only References'
) do |spec, key, text, source|
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  if english.include?('Cadwallon Gwynedd')
    pattern = /캐드월런 (?:귀네드|그위네드)(?:\(Cadwallon Gwynedd\))?/
    raise "full Cadwallon name span changed #{key.inspect}" unless text.scan(pattern).length == 1
    text = text.sub(pattern, spec.fetch(:korean))
  else
    pattern = /(?:캐드월런|캐드월론|캐드왈론)(?:\(Cadwallon\))?/
    raise "short Cadwallon name span changed #{key.inspect}" unless text.scan(pattern).length == 1
    text = text.sub(pattern, '캐드월런(Cadwallon)')
  end
  [text, false]
end
