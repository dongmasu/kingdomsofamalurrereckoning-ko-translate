#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_189
ReviewedProperNameDiscovery.ensure_unused_batch!(d)
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
context = 'English determines whether Empyrean is the named sovereign/polity or generic empyrean space; Japanese 天帝/天の帝国 and Chinese 最高天/黑暗最高天 corroborate context but do not prescribe Korean phonetic spelling. The official manual supplies general world context, not an Empyrean entry. Keep named item labels, the queen/person, and the regime concept distinct; no global character decision is reopened.'
definitions = [
  ['lore term:empyrean', 'Empyrean', '엠피리언(Empyrean)', '', '천상계',
   'base:4402:11|default:5551|default:51265|default:16873|default:29546',
   'The antagonist self-identifies as the Empyrean in dialogue; preserve the distinct title from her queenly role and from the Dark Empyrean regime. The interrupted memory row remains an incomplete name fragment.'],
  ['lore term:dark-empyrean', 'Dark Empyrean', '암흑 엠피리언(Dark Empyrean)', 'The Dark Empyrean',
   '어둠의 천상계|암흑 천상계|암흑 천계|암흑의 엠피리언|어둠의 엠피리언',
   'base:1538:11|base:1919:11|base:2364:11|base:4436:11|default:1550|default:3207|default:10454|default:19921|default:22343|default:26483|default:29546|default:41311|default:48939|default:50632|default:61569|default:63543',
   'The English phrase names the sovereign/polity and appears in distinct compound gear labels. Standardize only the Empyrean component; preserve each item, title, sentence, referent and existing person decision. Generic lower-case empyrean space is excluded.']
].map do |entity, english, korean, aliases, variants, ids, note|
  glossary.headers.zip([
    entity, english, 'lore term', korean, aliases, variants,
    "D-#{d}|#{ids}", 'confirmed', "#{note} #{context}"
  ]).to_h
end
raise 'already registered entity' unless
  (glossary.map { |r| r['entity_key'] } & definitions.map { |r| r['entity_key'] }).empty?

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
reviews = generated.group_by { |row| m.key(row) }.map do |key, matches|
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  old = source.fetch('work_text')
  new_text = old.dup
  if key == ['base', '1538', '11']
    new_text = '암흑 엠피리언 장화(Boots of the Dark Empyrean)'
  elsif key == ['base', '1919', '11']
    new_text = '암흑 엠피리언 두건(Cowl of the Dark Empyrean)'
  elsif key == ['base', '2364', '11']
    new_text = '암흑 엠피리언 로브(Robes of the Dark Empyrean)'
  elsif key == ['base', '4402', '11']
    new_text = '암흑 엠피리언(The Dark Empyrean)'
  elsif key == ['base', '4436', '11']
    new_text = '암흑 엠피리언의 손아귀(Grasp of the Dark Empyrean)'
  elsif key == ['default', '1550', '']
    new_text = '암흑 엠피리언의 몰락(The Fall of the Dark Empyrean)'
  elsif key == ['default', '3207', '']
    new_text.sub!('암흑의 엠피리언(Dark Empyrean)', '암흑 엠피리언(Dark Empyrean)')
  elsif key == ['default', '10454', '']
    new_text.sub!('암흑 천상의 제국이 몰락한 이유', '암흑 엠피리언(Dark Empyrean)의 몰락')
  elsif key == ['default', '19921', '']
    new_text = '암흑 엠피리언의 예복(Raiment of the Dark Empyrean)'
  elsif key == ['default', '22343', '']
    new_text.gsub!('엠피리언의 권력', '암흑 엠피리언의 권력')
    new_text.gsub!('엠피리언은 어떤 수단', '암흑 엠피리언은 어떤 수단')
    new_text.gsub!('암흑 엠피리언은 감금되었다', '암흑 엠피리언은 감금되었다')
    new_text.gsub!('암흑 엠피리언의 지배', '암흑 엠피리언의 지배')
  elsif key == ['default', '26483', '']
    new_text.sub!('어둠의 천상계의 폭군 여왕', '암흑 엠피리언의 폭군 여왕')
  elsif key == ['default', '29546', '']
    new_text.sub!('어둠... 엠피리언...', '암흑... 엠피리언(Dark Empyrean)...')
  elsif key == ['default', '41311', '']
    new_text.sub!('그녀의 어둠의 천상계', '그녀의 암흑 엠피리언(Dark Empyrean)')
  elsif key == ['default', '48939', '']
    new_text.sub!('암흑 천계의 힘', '암흑 엠피리언의 힘')
  elsif key == ['default', '50632', '']
    new_text.sub!('어둠의 천상계(Dark Empyrean)', '암흑 엠피리언(Dark Empyrean)')
  elsif key == ['default', '51265', '']
    new_text.sub!('천상계(Empyrean)의 지배자', '엠피리언(Empyrean)')
  elsif key == ['default', '61569', '']
    new_text.sub!('암흑 천상계(Dark Empyrean)', '암흑 엠피리언(Dark Empyrean)')
  elsif key == ['default', '63543', '']
    new_text.sub!('암흑 천상계(Dark Empyrean)', '암흑 엠피리언(Dark Empyrean)')
  elsif english.match?(/\b(?:the )?Dark Empyrean\b/i) &&
        key == ['default', '22343', '']
    # The long lore row is reviewed by both the character and lore concepts.
  elsif english.match?(/\b(?:the )?Dark Empyrean\b/i) &&
        key == ['default', '26483', '']
    # Queenly role remains distinct while its named polity is standardized.
  elsif english.match?(/\b(?:the )?Dark Empyrean\b/i) &&
        key == ['default', '29546', '']
    # Keep the source's interrupted recollection.
  elsif english.match?(/\b(?:the )?Dark Empyrean\b/i) &&
        key == ['default', '41311', '']
    # The character key is not reopened by this distinct lore-term review.
  elsif english.match?(/\b(?:the )?Dark Empyrean\b/i) &&
        key == ['default', '50632', '']
    # Preserve the existing exclamation and child-directed voice.
  elsif english.match?(/\b(?:the )?Dark Empyrean\b/i) &&
        key == ['default', '63543', '']
    # Preserve the established Archsage bilingual label.
  elsif english.match?(/\bEmpyrean\b/i) &&
        key == ['default', '5551', '']
    # Already has the canonical bilingual self-title.
  elsif english.match?(/\bEmpyrean\b/i) &&
        key == ['default', '16873', '']
    # Already has the canonical bilingual self-title.
  elsif english.match?(/\bempyr(?:ean|ean) space\b/i)
    # Ordinary lower-case use, not the named antagonist or regime.
  else
    raise "unexpected Empyrean row #{key.inspect}: #{english[0, 90]}"
  end

  entities = matches.map { |row| row.fetch('entity_key') }.uniq
  dispositions = entities.to_h do |entity|
    disposition = if key == ['default', '7190', '']
                    'excluded'
                  elsif old == new_text
                    'not-an-issue'
                  else
                    'accepted'
                  end
    [entity, disposition]
  end
  status = if dispositions.values.any? { |value| value == 'accepted' }
             'accepted'
           elsif dispositions.values.all? { |value| value == 'excluded' }
             'excluded'
           else
             'not-an-issue'
           end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entities.sort.join('|'), 'status' => status,
    'old' => old, 'new' => new_text,
    'evidence' => definitions.select { |definition| entities.include?(definition['entity_key']) }
      .map { |definition| "#{definition['english_canonical']}: #{definition['notes']}" }.join(' '),
    'english' => english,
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

raise "expected 21 distinct source rows, got #{reviews.length}" unless reviews.length == 21
definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}.tsv")
raise 'preparation output exists' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }
m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "21 distinct row keys; #{generated.group_by { |row| row['entity_key'] }.transform_values(&:length).inspect}"
puts reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect
