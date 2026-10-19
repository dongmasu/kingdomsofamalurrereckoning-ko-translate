#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewConfirmedOwnerWorksD21580
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_580
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  # Complete source labels, not aliases for their owners.
  DATA = [
    ['journal-of-pagus', 'Journal of Pagus', '파구스의 일지', '', 3],
    ['nell-journal', "Nell's Journal", '넬의 일지', '', 1],
    ['wildfrold-notes', "Wildfrold's Notes", '와일드프로울드의 기록', '', 2],
    ['diary-of-othe-theswin', 'Diary of Othe Theswin', '오테 세스윈의 일기', '', 1],
    ['jared-journal', "Jared's Journal", '재러드의 일지', '', 2],
    ['padric-travel-notes', "Brother Padric's Travel Notes", '패드릭 수사의 여행 기록', '', 3],
    ['journal-of-sir-airor', 'Journal of Sir Airor', '에어로르 경의 일지', '', 1],
    ['journal-of-stellan-reitan', 'The Journal of Stellan Reitan', '스텔란 레이탄의 일지', '', 3],
    ['dulstan-notes', "Dulstan's Notes", '덜스턴의 기록', '', 2],
    ['aiden-diary', "Aiden's Diary", '에이든의 일기', '', 1],
    ['journal-of-sigbert-sawerth', 'Journal of Sigbert Sawerth',
     '시그버트 소워스의 일지', "Sigbert's Journal", 2],
    ['hystis-journal', "Hystis' Journal", '히스티스의 일지', '', 1],
    ['weniret-journal', "Weniret's Journal", '웨니렛의 일지', '', 1],
    ['journal-of-gunnar-frode', 'The Journal of Gunnar Frode', '거너 프로드의 일지', '', 1],
    ['journal-of-rikka-egest', 'The Journal of Rikka Egest', '리카 이게스트의 일지', '', 1],
    ['memoirs-of-patrick-morkan', 'The Memoirs of Patrick Morkan', '패트릭 모르칸의 회고록', '', 1],
    ['journal-of-lerkara-fel', 'The Journal of Lerkara Fel', '레르카라 펠의 일지', '', 1]
  ].freeze
  OLD_LABELS = {
    'Journal of Pagus' => ['파구스(Pagus)의 일지'],
    "Nell's Journal" => ['넬(Nell)의 일지'],
    "Wildfrold's Notes" => ['와일드프로울드(Wildfrold)의 기록'],
    'Diary of Othe Theswin' => ['오테 세스윈(Othe Theswin)의 일기'],
    "Jared's Journal" => ['재러드(Jared)의 일지'],
    "Brother Padric's Travel Notes" => ['패드릭 수사(Brother Padric)의 여행 기록'],
    'Journal of Sir Airor' => ['에어로르 경(Sir Airor)의 일지'],
    'The Journal of Stellan Reitan' => [
      '스텔란 레이탄의 일지 (The Journal of Stellan Reitan)',
      '스텔란 레이탄의 일지(The Journal of Stellan Reitan)'
    ],
    "Dulstan's Notes" => ['덜스턴(Dulstan)의 기록'],
    "Aiden's Diary" => ['에이든(Aiden)의 일기'],
    'Journal of Sigbert Sawerth' => ['시그버트 소워스(Sigbert Sawerth)의 일지'],
    "Sigbert's Journal" => ['시그버트(Sigbert)의 일지'],
    "Hystis' Journal" => ['히스티스(Hystis)의 일지'],
    "Weniret's Journal" => ['웨니렛(Weniret)의 일지'],
    'The Journal of Gunnar Frode' => ['거너 프로드(Gunnar Frode)의 일지'],
    'The Journal of Rikka Egest' => ['리카 이게스트(Rikka Egest)의 일지'],
    'The Memoirs of Patrick Morkan' => ['패트릭 모르칸(Patrick Morkan)의 회고록'],
    'The Journal of Lerkara Fel' => ['레르카라(Lerkara) 펠(Fel)의 일지']
  }.freeze
  CONTEXT = <<~TEXT.chomp
    Review 17 complete journal/notes/memoir titles across affix/base/default,
    using established owner-name spellings without reopening owner-person
    dispositions. There are 27 source keys/matches: 13 base and 14 default,
    no affix hits. English defines each work; exact Japanese and Chinese
    evidence is retained per row. Both reference languages corroborate the
    diary/notes/memoir type and names. The non-exhaustive official Korean
    manual has no direct entries for these works. Keep the two lowercase
    descriptive journal mentions (default:26858 Stellan, 33302 Pagus)
    unchanged/excluded, rather than treating all nouns as display titles.
    Default:38228 explicitly uses capitalized Brother Padric's Travel Notes
    inside its description: pair that whole title, use the same 여행 기록
    as its two labels, and retain the Splitrock description and punctuation.
    Sigbert's Journal is the source-short label for the fully named journal
    whose author was established in D-21575; preserve the local short title
    rather than adding the surname to base:3322.
    No generic Journal, Notes or Memoirs alias is added. Complete bilingual
    works do not receive redundant nested owner annotations. Preserve all
    other entities, wording, actions, tokens, line endings and prior decisions.
    This is focused work-title review, not a recount of global translation
    totals or a completion claim. The D-21569 release ZIP is unchanged.
  TEXT

  def transform(key, old, english, definition)
    return [old, 'excluded'] if
      key[0] == 'default' && %w[26858 33302].include?(key[1])

    canonical = definition.fetch('english_canonical')
    if key == ['default', '38228', '']
      raise 'unexpected Padric description source' unless
        english == "Brother Padric's Travel Notes containing an account of his time in Splitrock Depths."
      expected = '스플릿록 심층부(Splitrock Depths)에서 보낸 시간을 기록한 패드릭 수사(Brother Padric)의 여행기.'
      raise 'unexpected Padric description translation' unless old == expected
      return [
        "스플릿록 심층부(Splitrock Depths)에서 보낸 시간을 기록한 패드릭 수사의 여행 기록(Brother Padric's Travel Notes).",
        'accepted'
      ]
    end
    local_terms = [canonical, *definition.fetch('english_aliases').split('|')]
    raise "non-label source #{key.inspect}: #{english}" unless local_terms.include?(english)
    raise "unexpected old label #{key.inspect}" unless OLD_LABELS.fetch(english).include?(old)
    korean = english == "Sigbert's Journal" ? '시그버트의 일지' :
      DATA.find { |row| row[1] == canonical }.fetch(2)
    updated = "#{korean}(#{english})"
    [updated, updated == old ? 'not-an-issue' : 'accepted']
  end

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    entities = DATA.map do |slug, english, korean, aliases, _count|
      values = {
        'entity_key' => "named work:#{slug}", 'english_canonical' => english,
        'korean_canonical' => "#{korean}(#{english})", 'category' => 'named work',
        'english_aliases' => aliases, 'korean_variants' => korean,
        'evidence_ids' => "D-#{D}", 'status' => 'confirmed', 'notes' => CONTEXT
      }
      glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    end
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, entities).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    counts = generated.group_by { |row| row.fetch('entity_key') }.transform_values(&:length)
    raise "source counts differ: #{counts.inspect}" unless
      counts == DATA.to_h { |row| ["named work:#{row[0]}", row[4]] }
    reviews = generated.sort_by do |row|
      key = M.key(row)
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      entity = match.fetch('entity_key')
      definition = entities.find { |row| row.fetch('entity_key') == entity }
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      updated, status = transform(key, old, english, definition)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => updated,
        'evidence' => CONTEXT, 'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
    raise "expected 27 keys, got #{reviews.length}" unless reviews.length == 27
    raise 'expected 24 reviewed edits' unless reviews.count { |row| row['old'] != row['new'] } == 24
    R.validate!(entities, reviews, generated, glossary.map(&:to_h),
                M.table(M::INDEX).map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.select { |row| row['old'] != row['new'] }
           .group_by { |row| row['resource'] }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    puts "D-#{D}: #{entities.length} works, #{reviews.length} keys, 24 edits; prepare only."
    [glossary.headers, entities, reviews]
  end

  def apply
    headers, entities, reviews = prepare
    M.write_table(DEFINITIONS, headers, entities)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Complete Works Of Previously Confirmed Owners

      #{CONTEXT}
      Registered 17 work identities and reviewed 27 keys. Corrected 24
      complete-title annotations (13 base, 11 default); one Stellan label
      was already correct and two descriptive prose matches were excluded.
      The Rikka/Lerkara journals and Patrick memoirs excluded from the
      preceding person scope now have separate complete-work dispositions.
      Existing owner-person decisions remain unchanged.
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
  when [], ['prepare'] then ReviewConfirmedOwnerWorksD21580.prepare
  when ['apply'] then ReviewConfirmedOwnerWorksD21580.apply
  else abort 'usage: review-confirmed-owner-works-D21580.rb [prepare|apply]'
  end
end
