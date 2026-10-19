#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewJournalOwnerContextsD21575
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_575
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  PERSON_DATA = [
    ['person:singing-nell', 'Singing Nell', '노래하는 넬', 'Nell', '노래하는 넬|노래꾼 넬|넬', 19,
     'Default:6054 explicitly calls Singing Nell the Ayten recluse and journal owner. Default:6192/12780/43576 identify the same recluse with the ring, and default:52254 identifies Nell as the Ayten recluse who assigns the Windstone task. Japanese 歌うたいのネル and Chinese 歌手奈尔 corroborate. Reuse 노래하는 넬(Singing Nell), correcting 노래꾼 넬 only where the complete epithet occurs; short source names stay 넬(Nell).'],
    ['person:wildfrold', 'Wildfrold', '와일드프로울드', '', '와일드프로울드|윌드프로울드|와일드프롤드', 5,
     'Base:933 and default:17591/23598 identify the notes of the historian Wildfrold; default:27835 supplies the bare display name, and 64907 includes him in the list of lost historians works. Japanese ウィルドフロルド and Chinese 维尔德弗洛德 corroborate. Reuse the paired base and bare-name spelling 와일드프로울드 and normalize the two isolated variants.'],
    ['person:jared', 'Jared', '재러드', '', '재러드|자레드', 4,
     'Default:31109 and 38499 explicitly identify Jared as the author of the damaged, blood-soaked journal. Japanese ジャレッド and Chinese 杰瑞德 corroborate. Reuse base:1907 재러드; correct 자레드 in the long diary introduction and pair the other explicit mentions without changing tokens, quoted diary text or its chronology.'],
    ['person:dulstan', 'Dulstan', '덜스턴', 'Dulsten', '덜스턴|둘스턴|덜스텐', 7,
     'Base:3246 and default:11868/48427 identify historian Dulstan and his notes; default:3411 names his musings about God Storm. The list of lost scribes at 64907 instead spells the name Dulsten; Japanese ダルステン and Chinese 达尔斯坦/杜尔斯腾 corroborate the same author in this shared notes quest. Reuse 덜스턴 and preserve source-local English Dulstan/Dulsten. Do not rewrite the historical account or God Storm title.'],
    ['person:aiden-oconor', "Aiden O'Conor", '에이든 오코너', 'Aiden', '에이든 오코너|에이든', 5,
     'Default:62702 explicitly identifies the diary author as Aiden O Conor, a founding member of the Tree and the Branches; the armor search objectives at 7588/43481/50124 name the same druid. Japanese エイデン・オコナー and Chinese 艾登·奥康纳 corroborate. Reuse 에이든 오코너 and preserve the exact source apostrophe spelling O Conor as written in English evidence. Base:3274 uses only Aiden, so retain the source-short annotation 에이든(Aiden) rather than inserting his surname.'],
    ['person:sigbert-sawerth', 'Sigbert Sawerth', '시그버트 소워스', 'Sigbert', '시그버트 소워스|시그버트', 2,
     'English default:8927 Journal of Sigbert Sawerth explicitly supplies the full author name of the journal labeled Sigbert at base:3322. Japanese シグバート・サワース and Chinese 西格伯特·萨维尔斯 corroborate. Reuse the existing 시그버트 소워스 and pair the full author once; the short base owner remains 시그버트(Sigbert).'],
    ['person:weniret-soll', 'Weniret Soll', '웨니렛 솔', 'Weniret', '웨니렛 솔|웨니렛', 4,
     'Default:568 explicitly identifies the journal of Weniret Soll, the Traveler staying in Ayten; the display name at 38502 and self-introduction at 60851 corroborate, as do Japanese ウェネレット・ソル and Chinese 韦尼瑞特·索尔. Preserve the already consistent Korean name and complete-name annotations. Base:4461 explicitly uses the source-short owner Weniret and remains short.'],
    ['person:jenniker', 'Jenniker', '제니커', '', '제니커', 15,
     'Default:57518 identifies the diary author as the wizard Jenniker, apparently dead in Cranalt. The corpse, device, tainted-water and Rond Farm quest entries identify the same wizard. Japanese ジェニカー and Chinese 杰尼克尔/詹尼克尔 corroborate. Reuse 제니커 and pair explicit unannotated mentions. Preserve compound journal/device/treatise titles as single complete annotations rather than adding nested person annotations.']
  ].freeze
  WORK_DATA = [
    ['named work:jennikers-journal', "Jenniker's Journal", '제니커의 일지', 'named work', 4,
     'Pair only the complete capitalized title at base:4702 and default:28540. English default:1743 and 51644 use lowercase journal in descriptive prose; exclude those two from the complete-title scope and retain the ordinary person annotations there. Japanese ジェニカーの日誌 and Chinese 杰尼克尔的日记 corroborate the named journal.'],
    ['named work:jennikers-treatise', "Jenniker's Treatise", '제니커의 논고', 'named work', 1,
     'Default:55004 already pairs the complete treatise title correctly. Japanese ジェニカーの論文 and Chinese 詹尼克尔的论文 corroborate. Register without changing this cell or adding a second annotation for the owner. No identity merger with the separate journal.'],
    ['item:jennikers-device', "Jenniker's Device", '제니커의 장치', 'item', 2,
     'Default:45733/61761 explicitly name the repaired Jenniker Device in the same artifact quest. Japanese ジェニカーの装置 and Chinese 杰尼克尔的装置 corroborate. Use 제니커의 장치(Jenniker\'s Device) in both rows, including the possessive 의 missing at 61761. This is a named mechanism, not a claim that it is an equippable inventory item.']
  ].freeze
  CONTEXT = <<~TEXT.chomp
    Review eight explicitly identified journal owners and the three complete
    Jenniker work/object labels across affix/base/default. Source scope:
    60 distinct base/default keys and 68 entity-row matches, applied as
    consecutive 50/10-key batches D-21575-D-21576. There are no affix hits.
    English defines identity and local full/short names; Japanese/Chinese
    corroborate. The official Korean manual has no direct entry for these
    people or titles. Do not infer Odi or Bede identities from an owner-only
    label: multiple distinct full names occur, and those candidates are
    outside this batch. Preserve all unrelated existing entity dispositions,
    chronology, variables, opaque tokens and line endings. Names inside a
    complete bilingual work/object label are already covered and are not
    redundantly annotated. These edits are not in the D-21569 release ZIP.
  TEXT

  def definitions(headers)
    people = PERSON_DATA.map do |key, english, korean, aliases, variants, count, notes|
      [key, english, korean, 'person', aliases, variants, count, notes]
    end
    works = WORK_DATA.map do |key, english, korean, category, count, notes|
      [key, english, korean, category, '', korean, count, notes]
    end
    (works + people).map do |key, english, korean, category, aliases, variants, _count, notes|
      values = {
        'entity_key' => key, 'english_canonical' => english,
        'korean_canonical' => "#{korean}(#{english})", 'category' => category,
        'english_aliases' => aliases, 'korean_variants' => variants,
        'evidence_ids' => "D-#{D}-D-#{D + 1}", 'status' => 'confirmed',
        'notes' => "#{notes} #{CONTEXT}"
      }
      headers.to_h { |header| [header, values.fetch(header, '')] }
    end
  end

  def transform(entity, key, text, english)
    id = key[1]
    updated = case entity
              when 'person:singing-nell'
                text.gsub(/(?:노래하는 넬|노래꾼 넬)(?:\(Singing Nell\))?/, '노래하는 넬(Singing Nell)')
                    .gsub(/(?<!노래하는 )넬(?:\(Nell\))?/, '넬(Nell)')
              when 'person:wildfrold'
                text.gsub(/(?:와일드프로울드|윌드프로울드|와일드프롤드)(?:\(Wildfrold\))?/, '와일드프로울드(Wildfrold)')
              when 'person:jared'
                text.gsub(/(?:재러드|자레드)(?:\(Jared\))?/, '재러드(Jared)')
              when 'person:dulstan'
                label = english.match?(/\bDulsten\b/) ? 'Dulsten' : 'Dulstan'
                text.gsub(/(?:덜스턴|둘스턴|덜스텐)(?:\(Dulst(?:an|en)\))?/, "덜스턴(#{label})")
              when 'person:aiden-oconor'
                if key == %w[base 3274 11]
                  text.gsub(/에이든(?:\(Aiden\))?/, '에이든(Aiden)')
                else
                  text.gsub(/에이든 오코너(?:\(Aiden O'Conor\))?/, "에이든 오코너(Aiden O'Conor)")
                end
              when 'person:sigbert-sawerth'
                if key[0] == 'base'
                  text.gsub(/시그버트(?:\(Sigbert\))?/, '시그버트(Sigbert)')
                else
                  text.gsub(/시그버트 소워스(?:\(Sigbert Sawerth\))?/, '시그버트 소워스(Sigbert Sawerth)')
                end
              when 'person:weniret-soll'
                text
              when 'person:jenniker'
                atomic = [%w[base 4702 11], ['default', '28540', ''],
                          ['default', '55004', ''], ['default', '45733', ''],
                          ['default', '61761', '']]
                atomic.include?(key) ? text : text.gsub(/제니커(?:\(Jenniker\))?/, '제니커(Jenniker)')
              when 'named work:jennikers-journal'
                return [text, 'excluded'] if key[0] == 'default' && %w[1743 51644].include?(id)
                text.gsub(/제니커(?:\(Jenniker\))?의 일지(?:\(Jenniker's Journal\))?/, "제니커의 일지(Jenniker's Journal)")
              when 'named work:jennikers-treatise'
                text
              when 'item:jennikers-device'
                text.gsub(/제니커(?:의)? 장치(?:\(Jenniker's Device\))?/, "제니커의 장치(Jenniker's Device)")
              else
                raise "unreviewed entity #{entity}"
              end
    [updated, updated == text ? 'not-an-issue' : 'accepted']
  end

  def prepare
    [D, D + 1].each { |d| R.ensure_unused_batch!(d) }
    raise 'discovery artifacts already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    entities = definitions(glossary.headers)
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, entities).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    expected = PERSON_DATA.to_h { |row| [row[0], row[5]] }.merge(WORK_DATA.to_h { |row| [row[0], row[4]] })
    counts = generated.group_by { |row| row.fetch('entity_key') }.transform_values(&:length)
    raise "source coverage mismatch: #{counts.inspect}" unless counts == expected
    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      updated = old.dup
      dispositions = {}
      matches.sort_by { |row| row['entity_key'].start_with?('person:') ? 1 : 0 }.each do |match|
        entity = match.fetch('entity_key')
        updated, dispositions[entity] = transform(entity, key, updated, english)
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.sort.join('|'),
        'status' => old == updated ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => updated,
        'evidence' => "#{CONTEXT} #{dispositions.keys.map { |entity| entities.find { |row| row['entity_key'] == entity }.fetch('notes') }.join(' ')}",
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    raise "expected 60 keys, got #{reviews.length}" unless reviews.length == 60
    R.validate!(entities, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.select { |row| row['old'] != row['new'] }.group_by { |row| row['resource'] }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    puts "D-#{D}-D-#{D + 1}: #{reviews.length} keys, #{generated.length} matches, #{reviews.count { |row| row['old'] != row['new'] }} edits; prepare only."
    [glossary.headers, entities, reviews]
  end

  def apply
    headers, entities, reviews = prepare
    M.write_table(DEFINITIONS, headers, entities)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}-D-#{D + 1}: Journal Authors And Atomic Jenniker Labels

      #{CONTEXT}
      Reviewed explicit Singing Nell/Nell, Wildfrold, Jared, Dulstan/Dulsten,
      Aiden O'Conor/Aiden and Sigbert Sawerth/Sigbert forms; confirmed the
      already consistent Weniret Soll/Weniret forms. Jenniker person mentions
      are distinguished from his complete Journal, Treatise and Device labels.
      The final checkpoint gives row-level dispositions and current hashes.
      Full proper-name discovery remains incomplete.
    TEXT
    paths = M::DOCS + [D, D + 1].flat_map do |d|
      %w[review edit-addendum].map { |kind| File.join(__dir__, "named-scope-#{kind}-D#{d}-#{M::RUN_DATE_COMPACT}.md") }
    end
    paths.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      text = text.include?(marker) ? text.sub(marker, "#{marker}\n\n#{detail}") : "#{text}\n\n#{detail}\n"
      File.write(path, text)
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewJournalOwnerContextsD21575.prepare
  when ['apply'] then ReviewJournalOwnerContextsD21575.apply
  else abort 'usage: review-journal-owner-contexts-D21575.rb [prepare|apply]'
  end
end
