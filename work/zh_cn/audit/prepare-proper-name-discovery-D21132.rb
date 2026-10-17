#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_132
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
definition = glossary.headers.zip([
  'person:lyenna-crosse', 'Lyenna Crosse', 'person',
  '리엔나 크로스(Lyenna Crosse)', 'Lyenna|Ms. Crosse|Crosse woman',
  '리에나|리엔나|크로스', "D-#{d}", 'confirmed',
  'English explicitly identifies Lyenna Crosse as the necklace owner and Unbound religious leader. Japanese リエナ・クロッセ and Chinese 莉恩娜·克罗塞 corroborate the identity, not a mandatory Korean phonetic spelling. Preserve the established 리엔나 canonical explicitly accepted at D-19514/default:14539 and D-20040/default:48253; normalize competing 리에나 occurrences to it without reopening those earlier dispositions or totals. Female Crosse references are scoped by Ms. Crosse or Crosse woman and the necklace/sect context; do not use the shared Crosse surname as a global alias or conflate her with Helyc/Helyca Crosse. The isolated Japanese リアナ at default:41986 is not a new English identity.'
]).to_h
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |row|
  OCCURRENCE_HEADERS.zip(row).to_h
end
expected = %w[
  394 3585 5657 6813 9550 10155 10751 14499 14539 14651 15550
  16832 16855 21031 22563 22623 23108 23125 23649 25447 26098
  26400 27063 27199 28735 29364 29694 30486 32851 33178 34692
  35435 40316 40957 41986 42650 43432 43931 45473 45777 46468
  47867 48253 48396 49006 50932 51321 52411 53362 56304 60029
  62976 63841 64084 64287 64437
].map { |id| ['default', id, ''] } + [['base', '960', '11']]
raise 'unexpected Lyenna source matches' unless
  generated.map { |row| m.key(row) }.sort == expected.sort

reviews = generated.sort_by do |row|
  [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i]
end.map do |match|
  key = m.key(match)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  proposed = old.gsub('리에나', '리엔나')
  proposed.gsub!(/리엔나 크로스(?:\(Lyenna Crosse\))?/, '리엔나 크로스(Lyenna Crosse)')
  proposed.gsub!(/리엔나(?! 크로스|\()/, '리엔나(Lyenna)')
  proposed.gsub!(/(?<!리엔나 )크로스(?!\(| 양\(Ms\. Crosse\))/, '크로스(Crosse)')
  if key == ['default', '25447', '']
    proposed.sub!('리엔나 크로스(Lyenna Crosse) 가문의 가보야',
                  '리엔나 크로스(Lyenna Crosse)의 가보야')
  end
  status = old == proposed ? 'not-an-issue' : 'accepted'
  evidence = case key[1]
             when '25447'
               'English says the family heirloom belongs to the person Lyenna Crosse, not a family named Lyenna Crosse. Restore the personal possessive and canonical full name; preserve the necklace description.'
             when '41986'
               'English Lyenna necklace and Chinese 莉恩娜 agree with repeated Japanese リエナ; this label alone has Japanese リアナ. Keep the established Korean 리엔나(Lyenna), not a new person.'
             when '14651', '32851', '34692', '42650', '50932', '52411', '64084'
               'English female Crosse/Ms. Crosse references concern the same necklace or Unbound sect leader. Add missing surname glosses while retaining local titles and the already bilingual Ms. Crosse form. Do not match unrelated Helyc/Helyca Crosse rows.'
             else
               'English names Lyenna Crosse or the same local Lyenna necklace/Unbound leader. Japanese and Chinese corroborate identity. Preserve the 리엔나 spelling explicitly accepted at D-19514/default:14539 and D-20040/default:48253; normalize 리에나 and add missing glosses without reopening historical decisions. Preserve full/short forms, particles and unrelated names.'
             end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => definition['entity_key'], 'status' => status,
    'old' => old, 'new' => proposed, 'evidence' => evidence,
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(definition['entity_key'] => status)
  }
end
definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'batch preparation exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, [definition])
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "D-#{d}-D-#{d + 1}: #{reviews.length} rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
