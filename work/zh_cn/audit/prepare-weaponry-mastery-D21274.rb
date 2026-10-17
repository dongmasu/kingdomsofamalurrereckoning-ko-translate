#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
inventory = m.refresh_inventory
specs = [
  ['Brutal Weaponry', '잔혹한 무기술', 5, /잔혹한 무기술(?:[ \t]*\(Brutal Weaponry\))?/],
  ['Precise Weaponry', '정밀 무기술', 5, /정밀 무기술?(?:[ \t]*\(Precise Weaponry\))?/],
  ['Arcane Weaponry', '비전 무기술', 6, /비전 무기술?(?:[ \t]*\(Arcane Weaponry\))?/],
  ['Mirrorblades Mastery', '미러블레이드 숙련', 1, /미러블레이드 숙련/],
  ['Greatsword Mastery', '그레이트소드 숙련', 1, /대검 숙련/],
  ['Hammer Mastery', '해머 숙련', 1, /망치 숙련/],
  ['Chakram Mastery', '차크람 숙련', 1, /차크람 숙련/],
  ['Longbow Mastery', '롱보우 숙련', 2, /장궁 숙련/],
  ['Katar Mastery', '카타르 숙련', 1, /카타르 숙련/],
  ['Wand Mastery', '마법봉 숙련', 1, /마법봉 숙련/],
  ['Longsword Mastery', '롱소드 숙련', 2, /장검 숙련/],
  ['Dagger Mastery', '대거 숙련', 1, /단검 숙련/],
  ['Greathammer Mastery', '대형 해머 숙련', 1, /대형 망치 숙련/],
  ['Natural Mastery', '자연 숙련', 1, /자연 숙련/],
  ['Faeblade Mastery', '패블레이드 숙련', 1, /페이 블레이드 숙련/],
  ['Sword Mastery', '검 숙련', 2, /검 숙련/],
  ['Staff Mastery', '지팡이 숙련', 2, /지팡이 숙련/],
  ['Spear Mastery', '창 숙련', 1, /창 숙련/],
  ['Sceptre Mastery', '셉터 숙련', 1, /셉터 숙련/],
  ['Two-Handed Sword Mastery', '양손검 숙련', 1, /양손검 숙련/]
].map do |english, korean, count, pattern|
  {
    key: "skill:#{english.downcase.gsub(/[^a-z0-9]+/, '-')}",
    english: english, korean: "#{korean}(#{english})",
    count: count, pattern: pattern
  }
end
definitions = specs.map do |spec|
  {
    'entity_key' => spec[:key], 'english_canonical' => spec[:english],
    'category' => 'skill', 'korean_canonical' => spec[:korean],
    'english_aliases' => '', 'korean_variants' => '',
    'evidence_ids' => 'D-21274', 'status' => 'confirmed',
    'notes' => 'Named ability/weapon-proficiency label from aligned English, Japanese and Chinese UI records. English default:45681 explicitly identifies the three Weaponry branches as abilities; default:34574 and default:39104 identify weapon Mastery abilities. Official manual PDF pp. 4-5 distinguishes combat abilities from noncombat skills; PDF p. 7 supplies weapon terms 롱소드, 그레이트소드, 해머, 롱보우, 대거, 패블레이드, 차크람, 지팡이 and 셉터. The original PDF page was rendered and visually checked: 패블레이드 is printed; the former 페이블레이드 in the working reference table was a transcription error and was corrected before this edit. Apply those weapon terms in compound names, not to unrelated generic weapon prose. Preserve Roman ranks outside the name annotation. Label existence does not establish runtime availability of every unused weapon type. Exclude ordinary arcane weaponry in default:51958 and exclude the shorter Sword Mastery match inside Two-Handed Sword Mastery.'
  }
end
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
expected = specs.to_h { |spec| [spec[:key], spec[:count]] }
actual = generated.group_by { |row| row['entity_key'] }.transform_values(&:length)
raise "unexpected skill source coverage #{actual}" unless expected == actual
reviews = generated.group_by { |row| m.key(row) }.sort_by do |key, _|
  [m::RESOURCES.index(key[0]), key[1].to_i, key[2]]
end.map do |key, matches|
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  new_text = old.dup
  dispositions = {}
  matches.each do |match|
    spec = specs.find { |candidate| candidate[:key] == match['entity_key'] }
    excluded = (spec[:english] == 'Arcane Weaponry' && key == ['default', '51958', '']) ||
      (spec[:english] == 'Sword Mastery' && key == ['default', '6482', ''])
    if excluded
      dispositions[spec[:key]] = 'excluded'
      next
    end
    raise "missing skill Korean span #{key} #{spec[:english]}" unless new_text.match?(spec[:pattern])
    before = new_text.dup
    new_text.gsub!(spec[:pattern], spec[:korean])
    dispositions[spec[:key]] = before == new_text ? 'not-an-issue' : 'accepted'
  end
  status = if old != new_text
             'accepted'
           elsif dispositions.values.all? { |value| value == 'excluded' }
             'excluded'
           else
             'not-an-issue'
           end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
    'old' => old, 'new' => new_text,
    'evidence' => definitions.first.fetch('notes') + ' All applicable English-source matches in affix/base/default are mapped; no affix or base matches. Weaponry Korean 무기/무기술 variants are standardized only in the ability labels and explicit ability tutorial. The ordinary newspaper wording and nested lexical match are excluded, not new skill identities.',
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end
raise 'more than 50 distinct rows' if reviews.length > 50
headers = m.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers
m.write_table(File.join(__dir__, 'proper-name-discovery-definitions-D21274.tsv'), headers, definitions)
m.write_table(File.join(__dir__, 'proper-name-discovery-D21274.tsv'), m::HEADERS.take(12), reviews)
puts "Prepared #{reviews.length} distinct skill keys; #{generated.length} entity matches; #{reviews.count { |row| row['old'] != row['new'] }} cell edits."
