#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
additions = [
  ['person:anru-besin', 'Anru Besin', 'person', '안루 베신(Anru Besin)', '',
   '안루 베신', 'D-20410|D-20411|default:834|default:29469', 'confirmed',
   'Complete Alfar lord name; Japanese アンル・ベシン and Chinese 安鲁·贝辛. Keep full-name pairing distinct from the Anru component.'],
  ['person:mallion-anwon', 'Mallion Anwon', 'person', '말리온 안원(Mallion Anwon)', '',
   '말리언 안원|맬리언 안원|말리온 앤원|말리언 앤원', 'D-20411|D-20412|default:19360|default:31293|default:45846', 'confirmed',
   'Complete name of Coriana Anwon’s son; Japanese マリオン・アンウォン and Chinese 马里恩·安文. Keep distinct from the Anwon family collective.'],
  ['person:mahlew-anwon', 'Mahlew Anwon', 'person', '말류 안원(Mahlew Anwon)', '',
   '말류 안원', 'D-20412|default:36684', 'confirmed',
   'English wine description names Mahlew Anwon; Chinese 马卢·安文 corroborates. Japanese substitutes Mallion; this is not evidence that the English names are aliases.']
].map { |values| glossary.headers.zip(values).to_h }
existing = glossary.map { |entry| entry['entity_key'] }
additions.reject! { |entry| existing.include?(entry['entity_key']) }
if additions.empty?
  puts 'Already registered; no changes.'
  exit
end
inventory = m.table(m::INVENTORY)
reviews = [20410, 20411, 20412].flat_map { |d| m.table(File.join(__dir__, "proper-name-edits-D#{d}.tsv")).map(&:to_h) }
by_key = reviews.to_h { |review| [m.key(review), review] }
generated = build_occurrences(inventory, additions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
generated.each do |occurrence|
  review = by_key.fetch(m.key(occurrence))
  raise 'derived full-name text not verified' unless review['new'] == occurrence['korean_current']
  raise 'full-name bilingual form missing' unless occurrence['korean_current'].include?(
    additions.find { |entry| entry['entity_key'] == occurrence['entity_key'] }.fetch('korean_canonical'))
  occurrence['status'] = review['status']
  occurrence['evidence'] = 'Derived full-name record from the same exact row already reviewed at D-20410-D-20412; no new CSV edit or repeated review. ' + review['evidence']
end
index = m.table(m::INDEX)
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + additions)
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + generated)
File.write(File.join(__dir__, 'anru-anwon-full-name-registration-20261015.md'), <<~TEXT)
  # Anru / Anwon Full-Name Registration

  Date: 2026-10-15

  Added #{additions.length} complete-name dictionary entries and #{generated.length}
  derived entity/row records from exactly the same verified keys in
  D-20410-D-20412. This separates complete personal names from their components
  and from the Anwon family collective. It is not a new translation review,
  cell change, or global tally adjustment.

  #{additions.map { |entry| "- #{entry['english_canonical']}: #{entry['korean_canonical']}. #{entry['notes']}" }.join("\n")}

  No active CSV was modified. Every added occurrence is aligned to an existing
  exact reviewed source row and already contains the complete bilingual name.
TEXT
puts "Registered #{additions.length} full names; #{generated.length} derived exact reviewed records."
