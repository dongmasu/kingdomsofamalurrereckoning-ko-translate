#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
ReviewedProperNameDiscovery.ensure_unused_batch!(21_187)
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
definitions = [
  [
    'creature:desert-runner-bird', 'Desert Runner', 'creature',
    '사막의 질주자(Desert Runner)', '',
    '사막 질주자|사막 달리미|데저트 러너|사막 달리기꾼',
    'D-21187|default:4655|default:13753|default:50085|default:58664',
    'confirmed',
    'In the Rattlesnake folktale and its quest/title records, the English context explicitly identifies Desert Runner as the speaking/winged bird. Japanese 砂漠の走り手 and Chinese 沙漠行者/沙漠奔跑者 corroborate. Standardize the bird as 사막의 질주자(Desert Runner). Exclude lowercase generic “desert runner’s lethal dance” at 5605/27731 and Lyana’s distinct epithet at 6766/57767; D-20230 already dispositioned the Lyana wording and is not reopened. Manual PDF p. 7 does not name this bird; its Warsworn context is not used to infer identity.'
  ],
  [
    'creature:rattlesnake-fable', 'Rattlesnake', 'creature',
    '방울뱀(Rattlesnake)', '',
    '래틀스네이크|라틀스네이크',
    'D-21187|default:13753|default:22093|default:50085',
    'confirmed',
    'The English folktale consistently names this speaking snake as Rattlesnake; Japanese ラトルスネーク and Chinese 响尾蛇 corroborate the identity. Use 방울뱀(Rattlesnake) for this character, not as a global replacement for generic rattlesnakes.'
  ],
  [
    'named work:rattlesnake-and-desert-runner',
    'Rattlesnake and Desert Runner', 'named work',
    '방울뱀과 사막의 질주자(Rattlesnake and Desert Runner)', '',
    '라틀스네이크와 사막의 질주자|방울뱀과 사막의 질주자',
    'D-21187|default:50449', 'confirmed',
    'English presents this as the complete named story/quest title, followed by its synopsis. Japanese ラトルスネークと砂漠の走り手 and Chinese 响尾蛇和沙漠奔跑者 corroborate. Keep the full title atomic without nested bilingual parentheses; annotate the character names separately only in the synopsis.'
  ]
].map { |values| glossary.headers.zip(values).to_h }

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
counts = generated.group_by { |row| row['entity_key'] }.transform_values(&:length)
raise "unexpected source coverage #{counts.inspect}" unless
  counts == {
    'creature:desert-runner-bird' => 15,
    'creature:rattlesnake-fable' => 11,
    'named work:rattlesnake-and-desert-runner' => 1
  }

lyana_keys = %w[6766 57767]
generic_keys = %w[5605 27731]
reviews = generated.group_by { |row| m.key(row) }.map do |key, matches|
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  old = source.fetch('work_text')
  excluded_bird = key[0] == 'default' &&
    (lyana_keys.include?(key[1]) || generic_keys.include?(key[1]))
  new_text = old.dup
  unless excluded_bird
    title_prefix = nil
    body = new_text
    if matches.any? { |row| row['entity_key'] == 'named work:rattlesnake-and-desert-runner' }
      _old_title, separator, body = new_text.partition(': ')
      raise 'could not isolate complete story title' if separator.empty?
      title_prefix = '방울뱀과 사막의 질주자(Rattlesnake and Desert Runner): '
    end
    body.gsub!(
      /(?:방울뱀|래틀스네이크|라틀스네이크)(?:\s*\(Rattlesnake\))?/,
      '방울뱀(Rattlesnake)'
    ) if matches.any? { |row| row['entity_key'] == 'creature:rattlesnake-fable' }
    body.gsub!(
      /(?:사막의 질주자|사막 질주자|사막의 달리미|사막 달리미|데저트 러너|사막 달리기꾼)(?:\s*\(Desert Runner\))?/,
      '사막의 질주자(Desert Runner)'
    ) if matches.any? { |row| row['entity_key'] == 'creature:desert-runner-bird' }
    body.gsub!(/방울뱀\(Rattlesnake\)는/, '방울뱀(Rattlesnake)은')
    body.gsub!(/방울뱀\(Rattlesnake\)가/, '방울뱀(Rattlesnake)이')
    body.gsub!(/방울뱀\(Rattlesnake\)를/, '방울뱀(Rattlesnake)을')
    body.gsub!(/방울뱀\(Rattlesnake\)와/, '방울뱀(Rattlesnake)과')
    body.gsub!(/사막의 질주자\(Desert Runner\)은/, '사막의 질주자(Desert Runner)는')
    body.gsub!(/사막의 질주자\(Desert Runner\)이/, '사막의 질주자(Desert Runner)가')
    body.gsub!(/사막의 질주자\(Desert Runner\)을/, '사막의 질주자(Desert Runner)를')
    body.gsub!(/사막의 질주자\(Desert Runner\)과/, '사막의 질주자(Desert Runner)와')
    new_text = title_prefix ? title_prefix + body : body
    raise 'Rattlesnake particle mismatch' if
      new_text.match?(/방울뱀\(Rattlesnake\)(?:는|가|를|와)/)
    raise 'Desert Runner particle mismatch' if
      new_text.match?(/사막의 질주자\(Desert Runner\)(?:은|이|을|과)/)
  end

  entity_dispositions = matches.to_h do |match|
    entity = match['entity_key']
    status = if entity == 'creature:desert-runner-bird' && excluded_bird
               'excluded'
             elsif new_text == old
               'not-an-issue'
             else
               'accepted'
             end
    [entity, status]
  end
  status = if entity_dispositions.value?('accepted')
             'accepted'
           elsif entity_dispositions.values.all? { |value| value == 'excluded' }
             'excluded'
           else
             'not-an-issue'
           end
  rationale = if excluded_bird && lyana_keys.include?(key[1])
                'This hit is Lyana’s separate epithet, not the folktale bird; D-20230 already reviewed the Lyana context. Exclude it from the bird entity without reopening that prior decision.'
              elsif excluded_bird
                'Lowercase “desert runner” is a generic metaphor in the comparison with Wolf Pack, not the named folktale bird. Exclude it from this entity.'
              else
                'English identifies the folktale bird/character; Japanese and Chinese align with the bird’s name. Standardize the character as 사막의 질주자(Desert Runner) and the snake as 방울뱀(Rattlesnake). Complete title at default 50449 is treated atomically.'
              end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => matches.map { |row| row['entity_key'] }.sort.join('|'),
    'status' => status, 'old' => old, 'new' => new_text, 'evidence' => rationale,
    'english' => english,
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(entity_dispositions)
  }
end.sort_by do |row|
  [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
end

raise "expected 15 distinct row keys, got #{reviews.length}" unless reviews.length == 15
definitions_path = File.join(__dir__, 'proper-name-discovery-definitions-D21187.tsv')
reviews_path = File.join(__dir__, 'proper-name-discovery-D21187.tsv')
raise 'preparation output exists' if
  [definitions_path, reviews_path].any? { |path| File.exist?(path) } &&
  ARGV != ['--replace-draft']
m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
puts "#{reviews.length} distinct row keys; #{counts.inspect}"
puts reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect
