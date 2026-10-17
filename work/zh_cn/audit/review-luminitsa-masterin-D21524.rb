#!/usr/bin/env ruby

require_relative 'review-well-of-souls-D21510'

module LuminitsaMasterinD21524
  extend self

  M = ReviewedNameBatches
  D = 21_524
  PERSON = 'person:luminitsa'
  THINKER = 'person:maxim-masterin'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CHINESE_NAME = /卢米尼特莎|鲁米尼特萨|Luminitsa/
  IDS = %w[
    461 742 2063 2230 4743 6863 7230 9735 9943 10623 10826 12067 13364
    14876 19903 27288 35645 49190 50240 53721 56239 56610 56906
  ].freeze
  COMPOUNDS = {
    ['base', '1832', '11'] => ['place:luminitsas-cottage', "Luminitsa's Cottage", "루미니차의 오두막(Luminitsa's Cottage)", 'place'],
    ['default', '10826', ''] => ['place:luminitsas-cottage', "Luminitsa's Cottage", "루미니차의 오두막(Luminitsa's Cottage)", 'place'],
    ['default', '12067', ''] => ['place:luminitsas-house', "Luminitsa's House", "루미니차의 집(Luminitsa's House)", 'place'],
    ['base', '3232', '11'] => ['title:to-luminitsa-i', 'To Luminitsa I', '루미니차에게 I(To Luminitsa I)', 'title'],
    ['default', '56610', ''] => ['item:luminitsas-cards', "Luminitsa's Cards", "루미니차의 카드(Luminitsa's Cards)", 'item']
  }.freeze
  COMPOUND_OLD = {
    ['base', '1832', '11'] => '루미니차(Luminitsa)의 오두막',
    ['default', '10826', ''] => '루미니차의 오두막',
    ['default', '12067', ''] => "루미니차의 집(Luminitsa's House)",
    ['base', '3232', '11'] => '루미니차(Luminitsa)에게 I',
    ['default', '56610', ''] => '루미니차의 카드 획득'
  }.freeze
  NOTE = 'English default:53721 explicitly introduces Luminitsa by name; default:49190/35645 are signed letters and default:56239 names her as the Plagueshield sender. Japanese ルミニツァ and Chinese 卢米尼特莎/鲁米尼特萨 corroborate; both supporting source labels at default:2230 retain literal Luminitsa. Reuse 루미니차(Luminitsa). Preserve all allegations about Boggarts, disease, cards and Fateweaving; do not resolve them by assuming the accusations are true. Complete possessive labels are paired atomically and their nested person hits excluded. Cottage and House labels are not asserted to be distinct buildings or proven aliases; title To Luminitsa I has no inferred medium. At default:56239, replace only person-adjacent 에서 with 가: the person sent Plagueshield, not a named place. No other grammar, source, PAK evidence or historical tally changes.'
  THINKER_NOTE = 'English default:33025 explicitly identifies the Maxim Masterin as a great thinker, names the yellow-triangle symbol and repeats the full name twice; Japanese マクシム・マスタリン and Chinese 马克西姆·马斯特因 corroborate. Pair both full Korean names as 맥심 마스터린(Maxim Masterin). The same-row short The Maxim becomes 맥심(Maxim)은 only in the explicit short-reference clause. Do not infer whether Maxim is a given name, family name or title, and do not register a broad Maxim alias. Preserve the four-lock/four-shelf puzzle and all prior Tome, Telogrus and Mitharu decisions.'
  DETAIL = <<~TEXT.chomp
    ### D-21524: Luminitsa And Maxim Masterin

    Registered `루미니차(Luminitsa)` across all 25 lexical keys,
    including 5 excluded nested-person hits in complete named labels.
    Paired Cottage (2 keys), House, Cards and To Luminitsa I separately;
    this does not infer a shared or distinct physical building or a
    medium for the bare To Luminitsa I label. Registered the thinker
    `맥심 마스터린(Maxim Masterin)` at default:33025, pairing its two
    full mentions and one explicitly linked local `Maxim` reference.
    No global Maxim alias was added.

    Reviewed 26 row keys / 31 entity matches; changed 12 cells.
    At default:56239 only the name-adjacent 에서 -> 가 is corrected:
    Luminitsa is the person sending Plagueshield, not a place.
    English, Japanese and Chinese support that attribution.
    Letter paragraphs, puzzle instructions, allegations and all earlier
    entity dispositions remain unchanged. Historical totals are not recounted.
  TEXT

  def expected_pairs
    IDS.map { |id| [PERSON, 'default', id, ''] } +
      [[PERSON, 'base', '1832', '11'], [PERSON, 'base', '3232', '11']] +
      COMPOUNDS.map { |key, spec| [spec[0], *key] } +
      [[THINKER, 'default', '33025', '']]
  end

  def definitions(headers)
    specs = [
      [PERSON, 'Luminitsa', '루미니차(Luminitsa)', 'person', NOTE],
      [THINKER, 'Maxim Masterin', '맥심 마스터린(Maxim Masterin)', 'person', THINKER_NOTE]
    ]
    COMPOUNDS.values.uniq.each do |entity, en, ko, category|
      specs << [entity, en, ko, category, NOTE]
    end
    specs.map do |entity, en, ko, category, note|
      evidence = if entity == PERSON
                   'default:53721|default:49190|default:56239'
                 elsif entity == THINKER
                   'default:33025'
                 else
                   COMPOUNDS.select { |_, spec| spec[0] == entity }.keys.map { |key| key.join(':') }.join('|')
                 end
      fields = {
        'entity_key' => entity, 'english_canonical' => en, 'korean_canonical' => ko,
        'category' => category, 'english_aliases' => '', 'korean_variants' => '',
        'evidence_ids' => "D-#{D}|#{evidence}",
        'status' => 'confirmed', 'notes' => note
      }
      headers.to_h { |h| [h, fields.fetch(h, '')] }
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    defs = definitions(glossary.headers)
    inventory = WellOfSoulsD21510.load_inventory
    generated = build_occurrences(inventory.values, defs).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'Luminitsa/Masterin scope differs' unless
      generated.map { |r| [r.fetch('entity_key'), *M.key(r)] }.sort == expected_pairs.sort
    reviews = generated.group_by { |r| M.key(r) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i]
    end.map do |key, occurrences|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      entities = occurrences.map { |r| r.fetch('entity_key') }.sort
      dispositions = {}
      if (compound = COMPOUNDS[key])
        entity, en, ko, = compound
        raise "Luminitsa complete source label differs #{key.inspect}" unless english.include?(en)
        raise "Luminitsa compound Korean cell differs #{key.inspect}" unless old == COMPOUND_OLD.fetch(key)
        raise "Luminitsa compound support differs #{key.inspect}" unless
          japanese.include?('ルミニツァ') && chinese.match?(CHINESE_NAME)
        if key == ['default', '56610', '']
          raise 'Luminitsa cards wording differs' unless old == '루미니차의 카드 획득'
          new_text = "#{ko} 획득"
        else
          new_text = ko
        end
        dispositions[PERSON] = 'excluded'
        dispositions[entity] = old == new_text ? 'not-an-issue' : 'accepted'
        note = NOTE
      elsif entities == [THINKER]
        raise 'Masterin source evidence differs' unless
          english.scan('Maxim Masterin').length == 2 &&
          japanese.scan('マクシム・マスタリン').length == 2 &&
          chinese.scan('马克西姆·马斯特因').length == 2 &&
          english.include?('The Maxim was a lover')
        raise 'Masterin Korean source spans differ' unless
          old.scan(/맥심 마스터린(?:\(Maxim Masterin\))?/).length == 2 &&
          old.scan('맥심은 수수께끼').length == 1
        new_text = old.gsub(/맥심 마스터린(?:\(Maxim Masterin\))?/, '맥심 마스터린(Maxim Masterin)')
                      .sub('맥심은 수수께끼', '맥심(Maxim)은 수수께끼')
        dispositions[THINKER] = 'accepted'
        note = THINKER_NOTE
      else
        raise "Luminitsa person evidence differs #{key.inspect}" unless
          english.scan(/(?<![A-Za-z])Luminitsa(?![A-Za-z])/).length == 1 &&
          (japanese.include?('ルミニツァ') || key[1] == '2230' || key[1] == '19903') &&
          chinese.match?(CHINESE_NAME)
        pattern = /루미니차(?:\(Luminitsa\))?/
        raise "Luminitsa Korean name differs #{key.inspect}" unless old.scan(pattern).length == 1
        new_text = old.sub(pattern, '루미니차(Luminitsa)')
        if key == ['default', '56239', '']
          from = '루미니차(Luminitsa)에서 역병 방호제(Plagueshield)를 더 보내 왔어!'
          raise 'Luminitsa sender clause differs' unless new_text.scan(from).length == 1
          new_text = new_text.sub(from, '루미니차(Luminitsa)가 역병 방호제(Plagueshield)를 더 보내 왔어!')
        end
        dispositions[PERSON] = old == new_text ? 'not-an-issue' : 'accepted'
        note = NOTE
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entities.join('|'), 'status' => old == new_text ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => new_text, 'evidence' => note,
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    raise 'Luminitsa/Masterin edit count differs' unless
      reviews.length == 26 && reviews.count { |r| r['old'] != r['new'] } == 12
    ReviewedProperNameDiscovery.validate!(
      defs, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: 26 row keys; 31 entity matches; 12 changed cells."
    [glossary.headers, defs, reviews]
  end

  def apply
    headers, defs, reviews = prepare
    previous = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, defs)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    previous.each { |k, v| raise "prior occurrence changed #{k.inspect}" unless current[k] == v }
    raise 'Luminitsa/Masterin additions differ' unless (current.keys - previous.keys).sort == expected_pairs.sort
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
    end
    %w[review edit-addendum].each do |kind|
      path = File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
      File.open(path, 'a') { |f| f.write("\n\n#{DETAIL}\n") }
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then LuminitsaMasterinD21524.prepare
  when ['apply'] then LuminitsaMasterinD21524.apply
  else abort 'usage: review-luminitsa-masterin-D21524.rb [prepare|apply]'
  end
end
