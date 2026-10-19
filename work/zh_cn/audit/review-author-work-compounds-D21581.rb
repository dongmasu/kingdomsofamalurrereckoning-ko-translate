#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewAuthorWorkCompoundsD21581
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_581
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  PEOPLE = [
    ['giri-urdur', 'Giri Urdur', '기리 우르두르', 1,
     'English base:160 identifies Master-at-Arms Giri Urdur as a journal owner. Japanese ジリ・ウルダー and Chinese 吉里·尤杜尔 corroborate the full personal name. Retain established 기리 우르두르 and the 무기 담당관 rank.'],
    ['heittson', 'Heittson', '헤잇슨', 3,
     'English base:479/1367/1830 identifies Master Builder Heittson as the owner of the three numbered journals. Japanese ヘイットソン and Chinese 黑特森 corroborate. Preserve 헤잇슨, the 수석 건축가 title and the three Roman numerals.'],
    ['courden', 'Courden', '쿠어든', 2,
     'English base:562/3768 explicitly attributes two separately titled treatises to Courden. Japanese consistently クールデン and Chinese 柯登 corroborate the same owner name. Reuse base:562 쿠어든, rather than retaining the inconsistent 코든 at base:3768. Do not merge the Horrible and Great treatises.'],
    ['atarum-price', 'Atarum Price', '아타룸 프라이스', 3,
     'English base:3716 names Atarum Price Notes; default:11476 signs the warning with the same full name, and default:61754 explicitly credits the investigation and records to Atarum Price. Japanese アタラム・プライス and Chinese 阿塔鲁姆·普莱斯 corroborate. Preserve established 아타룸 프라이스. Do not change the experiment, warning, chronology or other names.'],
    ['jalnar-rygan', 'Jalnar Rygan', '잘나르 라이건', 1,
     'English default:38263 explicitly titles the journal of Jalnar Rygan. Japanese ヤルナー・ライガン and Chinese 加尔纳尔·莱甘 corroborate the full author name. Retain existing 잘나르 라이건; register only the attested full identity, with no short alias or inferred biographical details.'],
    ['absolon-cornielle', 'Absolon Cornielle', '앱솔론 코르니엘', 1,
     'English default:39073 explicitly titles the journal of Absolon Cornielle. Japanese アブソロン・コーニエル and Chinese 阿布索隆·科涅尔 corroborate. Retain existing 앱솔론 코르니엘; register only this full author name, with no surname alias or inferred family.']
  ].freeze
  WORKS = [
    ['giri-urdur-journal', 'Journal of Master-at-Arms Giri Urdur',
     '무기 담당관 기리 우르두르의 일지', '무기 담당관 기리 우르두르(Giri Urdur)의 일지', 'base', '160'],
    ['heittson-journal-i', 'Journal of Master Builder Heittson I',
     '수석 건축가 헤잇슨의 일지 I', '수석 건축가 헤잇슨(Heittson)의 일지 I', 'base', '479'],
    ['heittson-journal-ii', 'Journal of Master Builder Heittson II',
     '수석 건축가 헤잇슨의 일지 II', '수석 건축가 헤잇슨(Heittson)의 일지 II', 'base', '1367'],
    ['heittson-journal-iii', 'Journal of Master Builder Heittson III',
     '수석 건축가 헤잇슨의 일지 III', '수석 건축가 헤잇슨(Heittson)의 일지 III', 'base', '1830'],
    ['courden-horrible-treatise', "Courden's Horrible Treatise",
     '쿠어든의 끔찍한 논고', '쿠어든(Courden)의 끔찍한 논고', 'base', '562'],
    ['courden-great-treatise', "Courden's Great Treatise",
     '쿠어든의 위대한 논고', '코든(Courden)의 대논문', 'base', '3768'],
    ['atarum-price-notes', 'Atarum Price Notes',
     '아타룸 프라이스의 기록', '아타룸 프라이스(Atarum Price)의 기록', 'base', '3716'],
    ['jalnar-rygan-journal', 'The Journal of Jalnar Rygan',
     '잘나르 라이건의 일지', '잘나르 라이건의 일지', 'default', '38263'],
    ['absolon-cornielle-journal', 'The Journal of Absolon Cornielle',
     '앱솔론 코르니엘의 일지', '앱솔론 코르니엘의 일지', 'default', '39073']
  ].freeze
  CONTEXT = <<~TEXT.chomp
    Review six directly attested author names and nine independent complete
    work titles across affix/base/default: 11 distinct keys, 20 entity-row
    matches, seven base keys and four default keys, no affix hits.
    English anchors identity and meaning; Japanese and Chinese corroborate
    each name/title in the exact aligned manifest. No direct entries were
    found in the non-exhaustive official Korean manual. A title establishes
    only its explicitly named owner, not additional lore or family relations.
    Normalize Courden to 쿠어든 using base:562 and Japanese クールデン.
    Render Great/Horrible Treatise as 위대한/끔찍한 논고, keeping the two
    works distinct; preserve Heittson's I/II/III as three separate volumes.
    Complete work annotations contain their authors without nested pairs.
    Personal mentions already paired in Atarum's long accounts stay unchanged.
    No short-name aliases, source edits, prior-disposition reopening or
    historical translation recount. Preserve all unrelated text and tokens.
    Full discovery remains incomplete; the D-21569 release is unchanged.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    data = PEOPLE.map do |slug, english, korean, count, note|
      ["person:#{slug}", english, korean, 'person', count, note]
    end + WORKS.map do |slug, english, korean, _old, resource, id|
      ["named work:#{slug}", english, korean, 'named work', 1,
       "Complete English title at #{resource}:#{id}; preserve the attested owner's Korean spelling and pair the entire title. Japanese/Chinese evidence is recorded in the reviewed manifest."]
    end
    entities = data.map do |key, english, korean, category, _count, note|
      values = {
        'entity_key' => key, 'english_canonical' => english,
        'korean_canonical' => "#{korean}(#{english})", 'category' => category,
        'english_aliases' => '', 'korean_variants' => korean,
        'evidence_ids' => "D-#{D}", 'status' => 'confirmed',
        'notes' => "#{note} #{CONTEXT}"
      }
      glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    end
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, entities).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    counts = generated.group_by { |row| row.fetch('entity_key') }.transform_values(&:length)
    raise "source coverage differs: #{counts.inspect}" unless
      counts == data.to_h { |row| [row[0], row[4]] }
    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      work = WORKS.find { |row| row[4] == key[0] && row[5] == key[1] }
      updated = old
      if work
        raise "unexpected complete title #{key.inspect}" unless english == work[1] && old == work[3]
        updated = "#{work[2]}(#{work[1]})"
      end
      dispositions = matches.to_h do |match|
        entity = match.fetch('entity_key')
        status = if entity.start_with?('named work:') ||
                    (entity == 'person:courden' && key[1] == '3768') ||
                    %w[person:jalnar-rygan person:absolon-cornielle].include?(entity)
                   'accepted'
                 else
                   'not-an-issue'
                 end
        [entity, status]
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.sort.join('|'),
        'status' => old == updated ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => updated,
        'evidence' => entities.select { |row| dispositions.key?(row['entity_key']) }
                              .map { |row| row.fetch('notes') }.join(' '),
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    raise 'expected 11 row keys and nine edits' unless
      reviews.length == 11 && reviews.count { |row| row['old'] != row['new'] } == 9
    R.validate!(entities, reviews, generated, glossary.map(&:to_h),
                M.table(M::INDEX).map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.select { |row| row['old'] != row['new'] }
           .group_by { |row| row['resource'] }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    puts "D-#{D}: six authors, nine works, 11 keys, 20 matches, nine edits; prepare only."
    [glossary.headers, entities, reviews]
  end

  def apply
    headers, entities, reviews = prepare
    M.write_table(DEFINITIONS, headers, entities)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Explicit Authors And Distinct Numbered Works

      #{CONTEXT}
      Registered six author identities and nine work identities. Reviewed
      11 keys / 20 entity matches and corrected nine titles (seven base,
      two default). Courden now uses 쿠어든 in both distinct treatises;
      the Giri, Heittson, Atarum, Jalnar and Absolon titles have one full
      bilingual title pair. The two long Atarum accounts are unchanged.
    TEXT
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{detail}"))
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewAuthorWorkCompoundsD21581.prepare
  when ['apply'] then ReviewAuthorWorkCompoundsD21581.apply
  else abort 'usage: review-author-work-compounds-D21581.rb [prepare|apply]'
  end
end
