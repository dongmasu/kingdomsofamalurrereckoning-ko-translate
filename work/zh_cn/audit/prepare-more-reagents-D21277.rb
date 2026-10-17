#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
inventory = m.refresh_inventory
specs = [
  {
    key: 'resource:black-cohosh', english: 'Black Cohosh',
    korean: '블랙 코호시(Black Cohosh)', count: 18, aliases: '',
    variants: '검은 승마|블랙 코호시',
    pattern: /(?:검은 승마|블랙[ \t]*코호시)(?:[ \t]*\(Black Cohosh\))?/,
    notes: 'English default:7423 describes Black Cohosh roots used in potion making; both base labels and health recipes identify the same reagent. Japanese ブラック・コホシュ and Chinese 黑升麻 corroborate. Reuse the established paired 블랙 코호시 rather than the isolated 검은 승마 labels. Do not infer real-world pharmacology.'
  },
  {
    key: 'resource:star-thistle', english: 'Star Thistle',
    korean: '별엉겅퀴(Star Thistle)', count: 29, aliases: '',
    variants: '별엉겅퀴|별 엉겅퀴|스타 시슬',
    pattern: /(?:별[ \t]*엉겅퀴|스타[ \t]*시슬)(?:[ \t]*\(Star Thistle\))?/,
    notes: 'English default:48055 explicitly names Star Thistle wildgrass and its blossoms as a potion ingredient; recipes, gathering objectives and gardening prose corroborate. Japanese スターシスル supports the English name; Chinese consistently uses 矢车菊 but is not authority for identifying a real-world species. Keep the existing semantic 별엉겅퀴, unify its spacing and the 스타 시슬 form, and pair Star Thistle. The normalized vowel-ending name requires 을-to-를 at default:10881 and 이-to-가 at default:59501; these two particle corrections were identified in the independent pre-edit review. Preserve flowers/grass distinctions, quantities and all plant effects.'
  },
  {
    key: 'resource:sativa-fibers', english: 'Sativa Fibers',
    korean: '사티바 섬유(Sativa Fibers)', count: 31, aliases: 'Sativa Fiber',
    variants: '사티바 섬유',
    pattern: /사티바[ \t]*섬유(?:[ \t]*\(Sativa Fibers?\))?/,
    notes: 'English base:224 and recipes name Sativa Fibers; default:15532/33812/37439/41977/63566 corroborates singular Sativa Fiber as the harvested plant material. Japanese サティヴァの葉 and Chinese 亚麻纤维 support identity, but English Fibers controls the material noun. Reuse 사티바 섬유 and pair the complete canonical ingredient label. Preserve default:5457’s covering Woven Sativa Fibers annotation unchanged rather than duplicate it. Sativa Road is a distinct place; Sativa Stalk/Stalks and bare Sativa require their own scope. Register no bare Sativa alias.'
  }
]
definitions = specs.map do |spec|
  {
    'entity_key' => spec[:key], 'english_canonical' => spec[:english],
    'category' => 'resource', 'korean_canonical' => spec[:korean],
    'english_aliases' => spec[:aliases], 'korean_variants' => spec[:variants],
    'evidence_ids' => 'D-21277', 'status' => 'confirmed',
    'notes' => spec[:notes]
  }
end
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected = specs.to_h { |spec| [spec[:key], spec[:count]] }
actual = generated.group_by { |row| row['entity_key'] }.transform_values(&:length)
raise "reagent source coverage differs: #{actual}" unless actual == expected
reviews = generated.group_by { |row| m.key(row) }.sort_by do |key, _|
  [m::RESOURCES.index(key[0]), key[1].to_i, key[2]]
end.map do |key, matches|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = old.dup
  dispositions = {}
  matches.each do |match|
    spec = specs.find { |candidate| candidate[:key] == match['entity_key'] }
    before = new_text.dup
    if spec[:key] == 'resource:sativa-fibers' && key == ['default', '5457', '']
      raise 'missing covering full material label' unless new_text.include?('직조 사티바 섬유(Woven Sativa Fibers)')
    else
      raise "missing Korean reagent span #{spec[:key]} #{key}" unless new_text.match?(spec[:pattern])
      new_text.gsub!(spec[:pattern], spec[:korean])
      if spec[:key] == 'resource:star-thistle'
        if key == ['default', '10881', '']
          raise 'Star Thistle object particle differs' unless
            new_text.sub!('별엉겅퀴(Star Thistle)을', '별엉겅퀴(Star Thistle)를')
        elsif key == ['default', '59501', '']
          raise 'Star Thistle subject particle differs' unless
            new_text.sub!('별엉겅퀴(Star Thistle)이', '별엉겅퀴(Star Thistle)가')
        end
      end
    end
    dispositions[spec[:key]] = before == new_text ? 'not-an-issue' : 'accepted'
  end
  status = old == new_text ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
    'old' => old, 'new' => new_text,
    'evidence' => 'English-first reagent consistency; exact aligned Japanese/Chinese retained in the manifest. Official Korean manual PDF pp. 4 and 8 supplies Alchemy, Reagent and Recipe context, not individual plant spellings. Preserve all quantities, effects, names outside the approved spans, tokens and exact line breaks; only the two documented Star Thistle particles change to fit the normalized name. ' + matches.map { |row| specs.find { |spec| spec[:key] == row['entity_key'] }.fetch(:notes) }.join(' '),
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end
headers = m.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers
m.write_table(File.join(__dir__, 'proper-name-discovery-definitions-D21277.tsv'), headers, definitions)
m.write_table(File.join(__dir__, 'proper-name-discovery-D21277.tsv'), m::HEADERS.take(12), reviews)
puts "Prepared #{reviews.length} distinct rows; #{generated.length} entity matches; #{reviews.count { |row| row['old'] != row['new'] }} proposed cell edits."
