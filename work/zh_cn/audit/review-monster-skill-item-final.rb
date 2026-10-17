#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'

inventory = ReviewedNameBatches.table(ReviewedNameBatches::INVENTORY)
  .to_h { |r| [ReviewedNameBatches.key(r), r.to_h] }
pending = ReviewedNameBatches.table(ReviewedNameBatches::INDEX).select do |r|
  r['status'] == 'needs-context' && r['entity_key'].match?(/\A(monster|skill|unique_item):/)
end
rows = pending.group_by { |r| ReviewedNameBatches.key(r) }.map do |key, matches|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  text = old.dup
  decisions = {}
  evidence = matches.map do |match|
    entity = match.fetch('entity_key')
    status = 'not-an-issue'
    reason = case entity
             when 'skill:quake'
               if %w[33667 34452].include?(key[1])
                 status = 'excluded'
                 'Poem uses lowercase quake as a verb (JA 天への道を揺らす, ZH 颤抖), not the named skill.'
               else
                 raise "missing Quake label #{key}" unless old.include?('퀘이크(Quake)')
                 'English Quake skill heading/damage/mana context agrees with JA クエイク and ZH 震地; existing bilingual label retained.'
               end
             when 'monster:thresh', 'monster:kora-thresh', 'monster:paragon-thresh'
               raise "missing Thresh label #{key}" unless old.match?(/스레시\((?:Kora |Paragon )?Thresh\)/)
               'English tree-spirit creature context and JA スレッシュ / ZH 长尾怪 (Kora: コラ・スレッシュ / 科拉·希里什) corroborate identity. Preserve the full Kora/Paragon compound where present, not a nested Thresh label.'
             when 'unique_item:loop-of-meditation'
               raise "unexpected ring text #{key}" unless old == '명상의 반지'
               text = '명상의 반지(Loop of Meditation)'
               status = 'accepted'
               'EN Loop of Meditation item title; JA 終わりなき瞑想 and ZH 冥想之环, with default:30334 wearer/loop and ZH 戒指, establish a wearable ring. Add glossary English title without changing the item type.'
             when 'unique_item:cryamor'
               english = JSON.parse(source.fetch('en_texts_json')).join("\n")
               if english == 'Cryamor'
                 status = 'uncertain'
                 'Bare identical Cryamor label does not identify whether it is the person or the pet sword. Both use the same confirmed bilingual spelling; retain text, defer entity assignment only. Do not reuse a prior personal-name label disposition as independent identity evidence.'
               else
                 status = 'excluded'
                 'EN mentions Witch Knight, soldiers, men, defeating the foe or threatening the Fae/Alfar; JA/ZH align with the person. This is not the pet sword explicitly named separately at default:54488. Person disposition is already recorded and is not counted again.'
               end
             else
               raise "unreviewed entity #{entity}"
             end
    decisions[entity] = status
    "#{entity}: #{reason}"
  end.join(' ')
  status = decisions.values.include?('accepted') ? 'accepted' : decisions.values.first
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => matches.map { |r| r['entity_key'] }.sort.join('|'),
    'status' => status, 'old' => old, 'new' => text,
    'evidence' => evidence, 'entity_dispositions_json' => JSON.generate(decisions)
  }
end
rows.sort_by! { |r| [r['entity_key'], ReviewedNameBatches::RESOURCES.index(r['resource']), r['ID_Linha'].to_i] }
path = File.join(__dir__, 'proper-name-reviewed-monster-skill-item-final.tsv')
ReviewedNameBatches.write_table(path, ReviewedNameBatches::HEADERS, rows)
puts "#{rows.length} row keys / #{pending.length} entity matches"
puts rows.group_by { |r| r['status'] }.transform_values(&:length).inspect
