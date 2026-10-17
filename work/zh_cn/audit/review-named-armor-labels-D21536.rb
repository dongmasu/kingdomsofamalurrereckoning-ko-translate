#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module NamedArmorLabelsD21536
  extend self

  M = ReviewedNameBatches
  D = 21_536
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  LABELS = [
    ['174', 'baronetts-blades', "Baronett's Blades", '바로넷(Baronett)의 칼날', "바로넷의 칼날(Baronett's Blades)"],
    ['515', 'enkes-cowl', "Enke's Cowl", '엔케(Enke)의 두건', "엔케의 두건(Enke's Cowl)"],
    ['590', 'white-palm-leggings', 'White Palm Leggings', '화이트 팜(White Palm) 레깅스', '화이트 팜 레깅스(White Palm Leggings)'],
    ['1290', 'magnons-leggings', "Magnon's Leggings", '매그넌(Magnon)의 레깅스', "매그넌의 레깅스(Magnon's Leggings)"],
    ['1376', 'cowl-of-ophanim', 'Cowl of Ophanim', '오파님(Ophanim)의 두건', '오파님의 두건(Cowl of Ophanim)'],
    ['1409', 'deinir-leggings', 'Deinir Leggings', '데이니르(Deinir)의 레깅스', '데이니르의 레깅스(Deinir Leggings)'],
    ['1803', 'lunalas-leggings', "Lunala's Leggings", '루날라(Lunala)의 레깅스', "루날라의 레깅스(Lunala's Leggings)"],
    ['2476', 'vekreths-leggings', "Vekreth's Leggings", '베크레스(Vekreth)의 레깅스', "베크레스의 레깅스(Vekreth's Leggings)"],
    ['2512', 'lachlans-cowl', "Lachlan's Cowl", '래클런(Lachlan)의 두건', "래클런의 두건(Lachlan's Cowl)"],
    ['2550', 'bowies-leggings', "Bowie's Leggings", '보위(Bowie)의 레깅스', "보위의 레깅스(Bowie's Leggings)"],
    ['2770', 'the-guardian-chausses', 'The Guardian Chausses', '수호자의 각반 (The Guardian Chausses)', '수호자의 각반 (The Guardian Chausses)'],
    ['2884', 'the-guardian-cuirass', 'The Guardian Cuirass', '수호자 흉갑 (The Guardian Cuirass)', '수호자 흉갑 (The Guardian Cuirass)'],
    ['3201', 'lyrias-cowl', "Lyria's Cowl", '리리아(Lyria)의 두건', "리리아의 두건(Lyria's Cowl)"],
    ['3210', 'skymasons-cowl', "Skymason's Cowl", '스카이메이슨(Skymason)의 두건', "스카이메이슨의 두건(Skymason's Cowl)"],
    ['3447', 'the-valley-cowl', 'The Valley Cowl', '계곡의 두건 (The Valley Cowl)', '계곡의 두건 (The Valley Cowl)'],
    ['3538', 'naimeean-cowl', "Nai'mee'an Cowl", "나이미안(Nai'mee'an)의 두건", "나이미안의 두건(Nai'mee'an Cowl)"],
    ['3610', 'the-guardian-greaves', 'The Guardian Greaves', '수호자의 정강이받이 (The Guardian Greaves)', '수호자의 정강이받이 (The Guardian Greaves)'],
    ['3874', 'zyddies-cowl', 'Zyddie’s Cowl', '지디(Zyddie)의 두건', '지디의 두건(Zyddie’s Cowl)'],
    ['3986', 'vraekors-cowl', "Vraekor's Cowl", '브래코르(Vraekor)의 두건', "브래코르의 두건(Vraekor's Cowl)"],
    ['4594', 'the-guardian-gauntlets', 'The Guardian Gauntlets', '수호자의 건틀릿 (The Guardian Gauntlets)', '수호자의 건틀릿 (The Guardian Gauntlets)']
  ].freeze
  EVIDENCE = 'English base supplies the complete source-local equipment name, with aligned Japanese and Chinese item labels as corroboration. Retain the existing Korean wording, including manual deity spellings, and pair the complete item instead of a nested owner. Keep already bilingual labels unchanged. This confirms only the item label, not rarity, owner biography, or equipment-set identity. Do not add global Guardian, Baronett, or owner aliases here. All prior person/deity/entity decisions and historical holds remain unchanged.'

  def entities
    LABELS.map do |id, slug, english, old, proposed|
      {
        'entity_key' => "item:#{slug}", 'english_canonical' => english,
        'category' => 'item', 'korean_canonical' => proposed,
        'english_aliases' => '', 'korean_variants' => old,
        'evidence_ids' => "D-#{D}|base:#{id}:11",
        'status' => 'confirmed', 'notes' => EVIDENCE
      }
    end
  end

  def reviews(inventory)
    generated = build_occurrences(inventory.values, entities).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = LABELS.map { |id, slug, *_| ["item:#{slug}", 'base', id, '11'] }.sort
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    raise "named armor source coverage differs: #{actual.inspect}" unless actual == expected

    labels = LABELS.to_h { |id, slug, english, old, proposed| [id, [slug, english, old, proposed]] }
    generated.map do |occurrence|
      source = inventory.fetch(M.key(occurrence))
      _slug, english, old, proposed = labels.fetch(source.fetch('ID_Linha'))
      raise 'unexpected complete armor label' unless JSON.parse(source.fetch('en_texts_json')).compact == [english]
      raise 'stale complete armor translation' unless source.fetch('work_text') == old
      status = old == proposed ? 'not-an-issue' : 'accepted'
      occurrence.merge(
        'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => EVIDENCE, 'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(occurrence.fetch('entity_key') => status),
        'previous_status' => '', 'previous_evidence' => ''
      )
    end
  end

  def apply
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    rows = reviews(inventory)
    M.write_table(DEFINITIONS, glossary.headers, entities)
    M.write_table(REVIEWS, M::HEADERS, rows)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

NamedArmorLabelsD21536.apply if $PROGRAM_NAME == __FILE__
