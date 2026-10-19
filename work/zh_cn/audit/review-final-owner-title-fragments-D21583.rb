#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewFinalOwnerTitleFragmentsD21583
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_583
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  DATA = [
    ['kellis-journal', "Kellis' Journal", '켈리스의 일지', 1],
    ['notes-of-octiennes-crimes', "Notes of Octienne's Crimes", '옥티엔의 범죄 기록', 2],
    ['airor-son-of-banvalga-journal', 'Journal of Airor. son of Banvalga',
     '반발가의 아들 에어로르의 일지', 1],
    ['god-storm-musings-of-dulstan', 'God Storm? The Musings of Dulstan',
     "'신의 폭풍'? 덜스턴의 사색", 1],
    ['stellan-journal', "Stellan's Journal", '스텔란의 일지', 4],
    ['journal-of-father-etair', 'Journal of Father Etair', '에테어 신부의 일지', 1]
  ].freeze
  CHANGES = {
    ['base', '1637', '11'] => [
      'kellis-journal', '켈리스(Kellis)의 일지', "켈리스의 일지(Kellis' Journal)"
    ],
    ['base', '2752', '11'] => [
      'notes-of-octiennes-crimes', '옥티엔(Octienne)의 범죄 기록',
      "옥티엔의 범죄 기록(Notes of Octienne's Crimes)"
    ],
    ['default', '865', ''] => [
      'stellan-journal',
      '데스페로(Despero)의 시신에서 스텔란(Stellan)의 일지를 찾았다. 일지와 그의 친구가 죽었다는 비보를 전하러 스텔란(Stellan)에게 돌아가야 한다.',
      '데스페로(Despero)의 시신에서 스텔란(Stellan)의 일지를 찾았다. 일지와 그의 친구가 죽었다는 비보를 전하러 스텔란(Stellan)에게 돌아가야 한다.'
    ],
    ['default', '998', ''] => [
      'airor-son-of-banvalga-journal', '반발가(Banvalga)의 아들 에어로어(Airor)의 일지',
      '반발가의 아들 에어로르의 일지(Journal of Airor. son of Banvalga)'
    ],
    ['default', '1710', ''] => [
      'notes-of-octiennes-crimes', '옥티엔(Octienne)의 범죄 기록',
      "옥티엔의 범죄 기록(Notes of Octienne's Crimes)"
    ],
    ['default', '3411', ''] => [
      'god-storm-musings-of-dulstan', "'신의 폭풍(God Storm)'? 덜스턴(Dulstan)의 사색",
      "'신의 폭풍'? 덜스턴의 사색(God Storm? The Musings of Dulstan)"
    ],
    ['default', '11593', ''] => [
      'stellan-journal',
      '스텔란(Stellan)의 일지를 되찾아 그에게 돌려줬다. 일지를 쓰느라 들인 노력의 대가를 받을 수 있게 된 그는 일지를 찾아 준 것이 무척 기뻐 내게도 보상을 줬다. 친구 호러스 데스페로(Horace Despero)의 여행은 그만큼 잘 풀리지 않아 안타깝다.',
      '스텔란(Stellan)의 일지를 되찾아 그에게 돌려줬다. 일지를 쓰느라 들인 노력의 대가를 받을 수 있게 된 그는 일지를 찾아 준 것이 무척 기뻐 내게도 보상을 줬다. 친구 호러스 데스페로(Horace Despero)의 여행은 그만큼 잘 풀리지 않아 안타깝다.'
    ],
    ['default', '11594', ''] => [
      'stellan-journal', '스텔란(Stellan)의 일지를 찾아라',
      "스텔란의 일지(Stellan's Journal)를 찾아라"
    ],
    ['default', '32243', ''] => [
      'stellan-journal', '스텔란(Stellan)의 일지 찾기',
      "스텔란의 일지(Stellan's Journal) 찾기"
    ],
    ['default', '41794', ''] => [
      'journal-of-father-etair', '에테어(Etair) 신부의 일지',
      '에테어 신부의 일지(Journal of Father Etair)'
    ]
  }.freeze
  CONTEXT = <<~TEXT.chomp
    Review six remaining explicitly owner-named work-label forms from the
    bounded journal/notes/diary scan: ten source keys, two base and eight
    default, no affix hits. English anchors meaning; Japanese/Chinese
    corroborate the names, title types and objectives in the exact manifest.
    Use existing Korean names 켈리스, 옥티엔, 반발가, 덜스턴, 스텔란 and
    에테어. Airor at default:998 uses Japanese アイロア; reuse established
    에어로르 from base:2161 and default:63500/64294 as the spelling of this
    English name, without claiming that the named son of Banvalga is
    biographically identical to Sir Airor. Keep the literal English period
    in Journal of Airor. son of Banvalga inside its complete annotation.
    Preserve the question and quoted God Storm wording at default:3411.
    Stellan objectives pair only the source-short work name, not an expanded
    surname or a new action; keep 찾아라/찾기 and the Korean object particle.
    The lowercase descriptive Stellan's journal phrases at default:865 and
    11593 remain unchanged/excluded from the complete-title annotation scope.
    The title of Octienne's crimes does not assert that Octienne authored it.
    The non-exhaustive official Korean manual has no direct title entries.
    Register only these complete source-label forms: no new person aliases
    or inferred owner/work mergers, no reopening of earlier person or event
    decisions, no global tally recount. Generic damaged/anonymous journals,
    bare research notes and unassigned Memoirs Prologue are not promoted to
    proper works merely because of capitalization. Preserve other text,
    tokens and line endings. Full discovery remains incomplete.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    entities = DATA.map do |slug, english, korean, _count|
      values = {
        'entity_key' => "named work:#{slug}", 'english_canonical' => english,
        'korean_canonical' => "#{korean}(#{english})", 'category' => 'named work',
        'english_aliases' => '', 'korean_variants' => korean,
        'evidence_ids' => "D-#{D}", 'status' => 'confirmed', 'notes' => CONTEXT
      }
      glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    end
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, entities).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = CHANGES.map { |key, change| ["named work:#{change.first}", *key] }.sort
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    raise "source coverage differs: #{actual.inspect}" unless actual == expected
    reviews = CHANGES.map do |key, (slug, old, updated)|
      source = inventory.fetch(key)
      raise "stale text #{key.inspect}" unless source.fetch('work_text') == old
      entity = "named work:#{slug}"
      status = old == updated ? 'excluded' : 'accepted'
      raise "unreviewed exclusion #{key.inspect}" if status == 'excluded' &&
        !(key[0] == 'default' && %w[865 11593].include?(key[1]))
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => updated,
        'evidence' => CONTEXT,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
    R.validate!(entities, reviews, generated, glossary.map(&:to_h),
                M.table(M::INDEX).map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.select { |row| row['old'] != row['new'] }
           .group_by { |row| row['resource'] }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    puts "D-#{D}: six work-label forms, ten keys, eight edits; prepare only."
    [glossary.headers, entities, reviews]
  end

  def apply
    headers, entities, reviews = prepare
    M.write_table(DEFINITIONS, headers, entities)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Remaining Owner-Named Work Forms In The Bounded Scan

      #{CONTEXT}
      Corrected eight complete work-label pairs and registered six source
      forms across ten keys; two descriptive Stellan mentions are excluded.
      Airor now uses 에어로르 in this title as elsewhere, with no
      biographical identity inference. All earlier owner/event decisions
      remain unchanged. The source-scan description is bounded, not an
      assertion that every proper name or work in the game is reviewed.
      These working edits are not in the D-21569 release ZIP.
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
  when [], ['prepare'] then ReviewFinalOwnerTitleFragmentsD21583.prepare
  when ['apply'] then ReviewFinalOwnerTitleFragmentsD21583.apply
  else abort 'usage: review-final-owner-title-fragments-D21583.rb [prepare|apply]'
  end
end
