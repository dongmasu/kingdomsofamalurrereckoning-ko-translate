#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module WinterFaeCourtAnnotationD21554
  extend self
  M = ReviewedNameBatches
  D = 21_554
  ENTITY = 'people:winter-fae'
  KEY = ['default', '55140', ''].freeze
  FROM = '궁정(Court of Winter)'
  TO = '궁정'
  DETAIL = <<~TEXT.chomp
    ### D-21554: Generic Court Annotation Correction

    Resolved the default:55140 follow-up from D-21549-D-21553.
    English says `a court of Winter Fae`, not a complete `Court of Winter`
    name. Japanese explicitly refers to the House of Sorrows; Chinese
    renders it as Winter Court and does not override the English syntax.
    Removed only the unsupported `(Court of Winter)` after `궁정`.
    Retained `겨울 페이(Winter Fae)`, Tuatha and all surrounding text.

    This is a new, exact-span counterexample to an inherited annotation,
    not a repeat of the earlier Winter Fae translation review. Update the
    existing `people:winter-fae` occurrence in place, retaining its previous
    accepted status/evidence in the manifest. No entity/occurrence was
    added; the excluded court occurrence and every unrelated disposition
    remain unchanged. The separate base:2353 Imperial title remains deferred.
  TEXT

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    source = inventory.fetch(KEY)
    old = source.fetch('work_text')
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    raise 'English generic-court syntax differs' unless english.include?('a court of Winter Fae')
    raise 'Japanese institution evidence differs' unless japanese.include?('ハウス・オブ・ソロー')
    raise 'Chinese conflicting reference differs' unless chinese.include?('冬廷')
    raise 'inherited incorrect annotation span differs' unless old.scan(FROM).length == 1
    prior = M.table(M::INDEX).select { |row| row['entity_key'] == ENTITY && M.key(row) == KEY }
    raise 'expected one existing accepted Winter Fae occurrence' unless prior.length == 1 && prior.first['status'] == 'accepted'
    new_text = old.sub(FROM, TO)
    raise 'Winter Fae pair was changed' unless new_text.include?('겨울 페이(Winter Fae)')
    row = {
      'resource' => KEY[0], 'ID_Linha' => KEY[1], 'Tipo_Variante' => KEY[2],
      'entity_key' => ENTITY, 'status' => 'accepted', 'old' => old, 'new' => new_text,
      'english' => english, 'japanese' => japanese, 'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
      'evidence' => 'Concrete new syntactic counterevidence from D-21549-D-21553: English says a court of Winter Fae, where Winter modifies Fae, not a named Court of Winter. Japanese names the House of Sorrows; Chinese Winter Court is conflicting secondary evidence. Remove only the inherited unsupported (Court of Winter) annotation, retaining the complete Winter Fae pair and every other span. Update the existing accepted people:winter-fae occurrence in place, with previous status/evidence recorded; do not add or recount keys. The separate faction:winter-court occurrence remains excluded. No source/PAK inspection or historical global tally change.'
    }
    puts "D-#{D}: one existing key; one annotation-only correction; prepare only."
    [row]
  end

  def apply
    rows = prepare
    prior = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row['entity_key'], *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    path = File.join(__dir__, "proper-name-corrective-review-D#{D}.tsv")
    M.write_table(path, M::HEADERS.take(12), rows)
    M.run(path, D, nil, review_states: ['accepted'])
    current = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row['entity_key'], *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    raise 'correction changed occurrence-key set' unless prior.keys.sort == current.keys.sort
    prior.each do |key, row|
      next if key == [ENTITY, *KEY]
      raise "unrelated prior decision changed #{key.inspect}" unless current[key] == row
    end
    paths = M::DOCS + %w[review edit-addendum].map do |kind|
      File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    end
    paths.each do |target|
      text = File.read(target)
      marker = '<!-- current-proper-name-batch:end -->'
      if text.include?(marker)
        File.write(target, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
      else
        File.open(target, 'a') { |file| file.write("\n\n#{DETAIL}\n") }
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then WinterFaeCourtAnnotationD21554.prepare
  when ['apply'] then WinterFaeCourtAnnotationD21554.apply
  else abort 'usage: correct-winter-fae-court-annotation-D21554.rb [prepare|apply]'
  end
end
