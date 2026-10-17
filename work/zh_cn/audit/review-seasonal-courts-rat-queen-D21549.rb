#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module SeasonalCourtsRatQueenD21549
  extend self

  M = ReviewedNameBatches
  START = 21_549
  SUMMER = 'faction:summer-court'
  WINTER = 'faction:winter-court'
  NECKLACE = 'item:winter-court-necklace'
  RAT = 'monster:rat-queen'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{START}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{START}.tsv")
  SUMMER_IDS = %w[
    221 223 1001 1192 1833 2744 2758 3209 3345 3809 3899 4922 5302
    5464 5578 5748 6090 6618 7449 7754 7864 7934 8167 8177 8411
    9405 9415 9447 9488 9973 10601 10642 11199 11315 11427 12735
    13160 13718 14415 14439 15104 15999 16387 16900 17051 17355
    18106 18569 19324 19842 20687 21217 21236 21609 21811 22020
    22387 22589 22620 23126 23412 23978 24268 24802 25009 25343
    25383 25738 26503 26953 27742 28415 28687 28725 28925 30175
    30447 31067 31600 32282 32574 32839 32853 33137 33597 33681
    33853 34404 34558 34642 34820 35169 35445 36333 36723 36940
    37417 37456 37843 38124 38193 38647 39314 39486 40188 40620
    41116 41667 42440 43552 43759 43958 43990 45421 45710 45964
    46085 46307 46416 46875 46948 48185 48638 48855 49289 50885
    50913 51203 51231 52396 52999 53070 53481 53578 54119 54202
    55982 57187 57426 57771 57872 59063 59437 59515 59586 60370
    60379 61164 61541 61700 62828 63593 63620 63827 63882 64424
  ].freeze
  WINTER_IDS = %w[
    1560 1640 2301 3899 4553 4780 5027 5192 5836 7155 8147 8242
    8598 9399 9547 10822 11309 11361 11472 12008 15256 15655 15994
    16139 16308 17037 17456 17597 19842 20291 21609 22020 22910
    23822 24897 26176 26490 27303 28841 30127 31067 31396 31600
    32574 33346 33853 34433 35680 36647 36970 37940 38768 38910
    39931 40890 41090 41503 41743 41967 42479 42707 43460 44109
    44253 44656 45167 47855 48100 49861 50741 51103 51900 52058
    52289 53873 54587 54787 55140 55417 57570 64090 64184
  ].freeze
  RAT_IDS = %w[1313 1399 14723 16802 32974 54505 57732].freeze
  SOURCE_COURTS = /(?<![A-Za-z])(?:High Court of Winter|Court[- ]of[- ]Winter|Winter Court|Court of Summer|Summer Court)(?![A-Za-z])/i
  KOREAN_COURTS = /(?:여름(?:의)? 궁정|서머 코트|겨울(?:의)? 궁정|윈터 코트)(?:\((?:The )?(?:High Court of Winter|Court[- ]of[- ]Winter|Winter Court|Court of Summer|Summer Court)\))?/i
  RAT_SPAN = /쥐 여왕(?:\((?:The )?Rat Queen\))?/
  EXCLUDED_KEYS = [
    ['base', '2353', '11'],
    ['base', '3876', '11'],
    ['default', '7155', ''],
    ['default', '55140', '']
  ].freeze

  COURT_NOTE = 'English default:31600 explicitly names two Fae factions, Court of Summer and Court of Winter; default:15104 describes Titarion and his advisors constituting the Court of Summer, and default:17355 calls it an authoritative body. Summer Court/Court of Summer and Winter Court/Court of Winter are source-attested alternate orders, with Japanese サマー・コート/ウィンター・コート and Chinese 夏廷/冬廷 corroboration. Reuse 여름 궁정 and 겨울 궁정, replacing only 윈터 코트 and 겨울의 궁정 variants and the English annotations. Preserve source-local word order and hyphenated Court-of-Winter when written. Political bodies, their members and metonymic seats are not asserted to be one physical building. Exclude the separate qualified High Court of Winter phrase without adding it as an alias. Do not merge either court with Summer/Winter Fae or the Seelie/Unseelie people. No global Court, Summer or Winter alias is added.'
  NECKLACE_NOTE = 'English base:3876 gives the complete item label Winter Court Necklace; Japanese ウィンター・フェイの宮殿のネックレス and Chinese 冬廷项链 corroborate 목걸이. Pair the complete existing name atomically as 겨울 궁정 목걸이(Winter Court Necklace), not a nested court annotation. No uniqueness, rarity or wearer identity is inferred.'
  RAT_NOTE = 'English default:54505 identifies one wild Rat Queen as the source of the Gale Crossing infestation, with the standalone boss label and slaying objective at default:1313/1399. Japanese 女王ネズミ and Chinese 鼠女王 corroborate the monster designation. Reuse 쥐 여왕(Rat Queen), retaining The in the complete standalone label. This registers a monster/boss designation, not a personal name or a claim that every Rat Queen mention is one physical individual.'
  COMMON = 'The official Korean manual extraction provides setting context but no direct court, necklace or Rat Queen entry. English is the identity and meaning anchor; Japanese and Chinese are supporting evidence. No PAK or PAK-derived resource, source edit or historical tally recount.'

  DETAIL = <<~TEXT.chomp
    ### D-21549-D-21553: Seasonal Courts And Rat Queen

    Registered the English-led court designations `여름 궁정(Summer Court)`
    and `겨울 궁정(Winter Court)` with their complete source aliases.
    Checked 241 distinct row keys / 250 entity matches across all three
    resources in 50/50/50/50/41-key batches; affix has no lexical matches.
    Preserve the difference between court organizations, their metonymic
    seats and seasonal Fae peoples; this is not a physical-location merger.
    Source-local English orders and the hyphenated `Court-of-Winter` are
    retained in annotations, and existing unrelated entity decisions remain
    unchanged.

    The complete `Winter Court Necklace` is paired atomically as
    `겨울 궁정 목걸이(Winter Court Necklace)`. The nested court occurrence
    is excluded from organization edits. `Summer Court Imperial` at
    base:2353 is likewise excluded from nested court edits; the isolated
    English label and Japanese court-purveyor wording do not justify its
    existing Korean `제국 기사` reading. Its complete item-name translation
    remains a documented follow-up, not an approved semantic correction.
    The qualified `High Court of Winter` at default:7155 is excluded and
    preserved, not asserted to be an alias for the entire Winter Court.

    At default:55140, English `a court of Winter Fae` is not a complete
    `Court of Winter` name. Exclude this lexical false positive. The
    pre-existing `궁정(Court of Winter)` annotation is not endorsed; its
    removal needs a separate corrective manifest rather than silently
    changing an excluded row in this discovery pass.

    Registered the monster designation `쥐 여왕(Rat Queen)` across seven
    exact default keys, without inferring that every specimen is one
    individual. At default:54505 the second Korean name expands English
    `her`; it is paired locally but adds no English occurrence key.
    Full proper-name discovery remains incomplete.
  TEXT

  def definition(headers, entity, english, korean, category, aliases, variants, note)
    values = {
      'entity_key' => entity, 'english_canonical' => english,
      'korean_canonical' => korean, 'category' => category,
      'english_aliases' => aliases, 'korean_variants' => variants,
      'evidence_ids' => "D-#{START}-D-#{START + 4}",
      'status' => 'confirmed', 'notes' => "#{note} #{COMMON}"
    }
    headers.to_h { |header| [header, values.fetch(header, '')] }
  end

  def definitions(headers)
    [
      definition(headers, SUMMER, 'Summer Court', '여름 궁정(Summer Court)',
                 'faction', 'Court of Summer', '여름 궁정|여름의 궁정|서머 코트', COURT_NOTE),
      definition(headers, WINTER, 'Winter Court', '겨울 궁정(Winter Court)',
                 'faction', 'Court of Winter|Court-of-Winter',
                 '겨울 궁정|겨울의 궁정|윈터 코트', COURT_NOTE),
      definition(headers, NECKLACE, 'Winter Court Necklace',
                 '겨울 궁정 목걸이(Winter Court Necklace)', 'item', '',
                 '겨울 궁정 목걸이', NECKLACE_NOTE),
      definition(headers, RAT, 'Rat Queen', '쥐 여왕(Rat Queen)',
                 'monster', 'The Rat Queen', '쥐 여왕', RAT_NOTE)
    ]
  end

  def expected_pairs
    [
      *%w[583 2353].map { |id| [SUMMER, 'base', id, '11'] },
      *SUMMER_IDS.map { |id| [SUMMER, 'default', id, ''] },
      *%w[2211 3876].map { |id| [WINTER, 'base', id, '11'] },
      *WINTER_IDS.map { |id| [WINTER, 'default', id, ''] },
      [NECKLACE, 'base', '3876', '11'],
      *RAT_IDS.map { |id| [RAT, 'default', id, ''] }
    ]
  end

  def transform_courts(key, english, old)
    terms = english.scan(SOURCE_COURTS)
    terms = [english] if terms.length == 1 && english.match?(/\AThe (?:Court of (?:Summer|Winter)|(?:Summer|Winter) Court)\z/)
    spans = old.to_enum(:scan, KOREAN_COURTS).map do
      match = Regexp.last_match
      [match.begin(0), match.end(0), match[0]]
    end
    raise "court source/Korean span count differs #{key.inspect}" unless terms.length == spans.length
    rewritten = old.dup
    spans.each_with_index.to_a.reverse_each do |(span, index)|
      term = terms.fetch(index)
      summer = term.match?(/Summer/i)
      raise "court source/Korean identity order differs #{key.inspect}" unless
        summer == span[2].match?(/여름|서머/)
      rewritten[span[0]...span[1]] = "#{summer ? '여름' : '겨울'} 궁정(#{term})"
    end
    rewritten
  end

  def transform_rat(key, english, old)
    expected = key == ['default', '54505', ''] ? 2 : 1
    raise "Rat Queen Korean spans differ #{key.inspect}" unless old.scan(RAT_SPAN).length == expected
    label = english == 'The Rat Queen' ? english : 'Rat Queen'
    old.gsub(RAT_SPAN, "쥐 여왕(#{label})")
  end

  def reviews(inventory, generated)
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'seasonal court/Rat Queen exact source scope differs' unless actual.sort == expected_pairs.sort
    raise 'seasonal court entity-match count differs' unless actual.length == 250
    raise 'seasonal court row-key count differs' unless generated.map { |row| M.key(row) }.uniq.length == 241

    generated.group_by { |row| M.key(row) }.map do |key, occurrences|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      entities = occurrences.map { |row| row.fetch('entity_key') }
      new_text = if entities.include?(NECKLACE)
                   raise 'unexpected complete necklace source' unless english == 'Winter Court Necklace'
                   raise 'unexpected complete necklace Korean' unless old == '겨울 궁정 목걸이'
                   '겨울 궁정 목걸이(Winter Court Necklace)'
                 elsif EXCLUDED_KEYS.include?(key)
                   old
                 elsif entities.include?(RAT)
                   transform_rat(key, english, old)
                 else
                   transform_courts(key, english, old)
                 end
      dispositions = entities.to_h do |entity|
        excluded = [SUMMER, WINTER].include?(entity) && EXCLUDED_KEYS.include?(key)
        [entity, excluded ? 'excluded' : new_text == old ? 'not-an-issue' : 'accepted']
      end
      aggregate = if old != new_text
                    'accepted'
                  elsif dispositions.values.all? { |status| status == 'excluded' }
                    'excluded'
                  else
                    'not-an-issue'
                  end
      notes = entities.map do |entity|
        case entity
        when NECKLACE then NECKLACE_NOTE
        when RAT then RAT_NOTE
        else COURT_NOTE
        end
      end.uniq
      notes << 'The second Korean Rat Queen expands English her; pairing it adds no source key.' if key == ['default', '54505', '']
      notes << 'Exclude the full qualified High Court of Winter phrase: the substring alone does not prove equivalence to the whole Winter Court. Preserve its existing full annotation and defer the missing Korean High modifier.' if key == ['default', '7155', '']
      notes << 'Exclude the nested court in the complete item label; no partial annotation. Summer Court Imperial at base:2353 remains a complete-name semantic follow-up because Imperial does not establish 제국 기사.' if key[0] == 'base' && %w[2353 3876].include?(key[1])
      notes << 'Lexical false positive: English a court of Winter Fae does not contain a complete Court of Winter name; Japanese refers to House of Sorrows. Exclude from this organization scope. The pre-existing Korean Court of Winter annotation is not endorsed and needs a separate corrective manifest.' if key == ['default', '55140', '']
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entities.sort.join('|'), 'status' => aggregate,
        'old' => old, 'new' => new_text, 'evidence' => "#{notes.join(' ')} #{COMMON}",
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions.sort.to_h),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end.sort_by { |row| key = M.key(row); [M::RESOURCES.index(key[0]), key[1].to_i, key[2]] }
  end

  def prepare
    5.times { |offset| ReviewedProperNameDiscovery.ensure_unused_batch!(START + offset) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    definitions = definitions(glossary.headers)
    inventory = M.table(M::INVENTORY).map(&:to_h).to_h { |row| [M.key(row), row] }
    raise 'incomplete aligned inventory' unless inventory.length == 73_430
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    rows = reviews(inventory, generated)
    ReviewedProperNameDiscovery.validate!(
      definitions, rows, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(rows, inventory)
    puts "D-21549-D-21553: #{rows.length} row keys; #{generated.length} entity matches; #{rows.count { |row| row['old'] != row['new'] }} edits; prepare only."
    [glossary.headers, definitions, rows]
  end

  def apply
    headers, definitions, rows = prepare
    prior = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), rows)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, START.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    prior.each { |key, value| raise "prior entity decision changed #{key.inspect}" unless current[key] == value }
    raise 'unexpected occurrence additions' unless (current.keys - prior.keys).sort == expected_pairs.sort
    paths = M::DOCS + (START..START + 4).flat_map do |d|
      %w[review edit-addendum].map do |kind|
        File.join(__dir__, "named-scope-#{kind}-D#{d}-#{M::RUN_DATE_COMPACT}.md")
      end
    end
    paths.each do |path|
      text = File.read(path)
      if text.include?('<!-- current-proper-name-batch:end -->')
        marker = '<!-- current-proper-name-batch:end -->'
        File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
      else
        File.open(path, 'a') { |file| file.write("\n\n#{DETAIL}\n") }
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then SeasonalCourtsRatQueenD21549.prepare
  when ['apply'] then SeasonalCourtsRatQueenD21549.apply
  else abort 'usage: review-seasonal-courts-rat-queen-D21549.rb [prepare|apply]'
  end
end
