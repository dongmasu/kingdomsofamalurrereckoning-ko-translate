#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module PersonShortTitlesD21108
  M = ReviewedNameBatches
  D = 21_108
  REVIEW_PATH = File.join(M::AUDIT, "proper-name-discovery-D#{D}.tsv")
  DEFINITION_PATH = File.join(M::AUDIT, "proper-name-definitions-D#{D}.tsv")
  EXPECTED_COUNTS = { 'accepted' => 31, 'not-an-issue' => 16, 'excluded' => 12 }.freeze
  PEOPLE = {
    'person:niahm-kent' => 'Niahm Kent',
    'person:cartery-jayck' => 'Cartery Jayck',
    'person:nesta-gwynedd' => 'Nesta Gwynedd',
    'person:byrn-elgar' => 'Byrn Elgar'
  }.freeze
  PRESERVE_ONLY_NOTES = {
    '51539' => 'Preserve the existing opaque Cartery hold; do not register or edit this key.',
    '38080' => 'Preserve the already paired standalone Byrn label without assigning Elgar or Dodwin; do not register a new hold.'
  }.freeze

  # Each tuple is ID, exact English short form, old span, new span, row context.
  PERSON_ROWS = {
    'person:niahm-kent' => [
      ['2105', 'Niahm', '니암(Niahm)과', '니암(Niahm)과', 'Speak to Niahm; Japanese ニアム and Chinese 尼亚姆 agree. Retain the existing short label.'],
      ['5481', 'Niahm', '니암(Niahm)의', '니암(Niahm)의', 'Nameria Kent explicitly identifies herself as Niahm’s sister; Japanese ニアムの姉妹 and Chinese 尼亚姆的姐妹 support the family link. Preserve Nameria Kent’s complete label and the existing Niahm label.'],
      ['8430', 'Niahm', '니암(Niahm)과', '니암(Niahm)과', 'Speak to Niahm; Japanese ニアム and Chinese 尼亚姆 agree. Retain the existing short label.'],
      ['8470', 'Niahm', '니암(Niahm)에게', '니암(Niahm)에게', 'The Malgar-killing journal returns to Niahm; Japanese ニアム and Chinese 尼亚姆 corroborate this monster-hunting patron.'],
      ['9879', 'Niahm', '니암이', '니암(Niahm)이', 'Niahm again requests help killing Smiler near Corgan Hold; Japanese ニアム and Chinese 尼亚姆 agree. Do not revise Smiler or any creature/place wording.'],
      ['11952', 'Niahm', '니암(Niahm)이', '니암(Niahm)이', 'Niahm requests the final Malgar task in Tala-Rane; Japanese ニアム and Chinese 尼亚姆 agree. Retain the existing short label.'],
      ['12345', 'Niahm', '니암(Niahm)', '니암(Niahm)', 'All three source locales contain only Niahm. Retain the correct name label; do not expand it into Niahm’s Labors or Niahm’s Task or infer a quest UI category.'],
      ['12991', 'Kent', '맹세의 칼날 켄트(Kent)', '맹세의 칼날 켄트(Kent)', 'Oathblade Kent is the Warsworn Niahm Kent who introduces that rank at default:7875; Japanese 一等傭兵のケント and Chinese 誓言之刃肯特 corroborate. Preserve the existing title-outside-short-label structure.'],
      ['14134', 'Kent', '맹세의 칼날 켄트(Oathblade Kent)', '맹세의 칼날 켄트(Oathblade Kent)', 'The insult explicitly addresses Oathblade Kent, consistent with Niahm’s rank at default:7875. Japanese and Chinese agree on Kent and the rank. Retain the complete Oathblade Kent label and all prose.'],
      ['19101', 'Niahm', '니엄은', '니암(Niahm)은', 'The work-failure journal explicitly reports Niahm’s death; Japanese ニアム and Chinese 尼亚姆 agree. Normalize only the name, preserving the topic particle.'],
      ['19714', 'Niahm', '니암이', '니암(Niahm)이', 'Niahm requests help with Kolmir in Tala-Rane; Japanese ニアム and Chinese 尼亚姆 agree. Preserve all monster and rank wording.'],
      ['23529', 'Niahm', '니엄(Niahm)과', '니암(Niahm)과', 'Speak to Niahm; Japanese ニアム and Chinese 尼亚姆 support 니암 rather than 니엄. Preserve the existing English label and particle.'],
      ['29275', 'Niahm', '니암에게', '니암(Niahm)에게', 'English names Niahm twice around the completed Smiler task; Japanese and Chinese preserve the patron context. Pair only the second Korean mention; the first is already paired.'],
      ['31403', 'Kent', '켄트를', '켄트(Kent)를', 'The Castellan sends Oathblade Kent to do trapper’s work; default:7875 identifies Niahm Kent as an Oathblade. Japanese ケント and Chinese 肯特 agree. Pair the surname only; leave the title and trapper prose intact.'],
      ['35714', 'Niahm', '니아흐를', '니암(Niahm)을', 'The completed Tala-Rane monster task explicitly names Niahm; Japanese ニアム and Chinese 尼亚姆 confirm identity. Correct 니아흐 to 니암 and change 를 to 을 for the canonical consonant-final name only.'],
      ['44688', 'Niahm', '니암과', '니암(Niahm)과', 'Speak to Niahm; Japanese ニアム and Chinese 尼亚姆 agree. Preserve the conjunction particle.'],
      ['47280', 'Niahm', '니암뿐이야', '니암(Niahm)뿐이야', 'The speaker names brother Niahm among the remaining Tala-Rane family; Japanese ニアム and Chinese 尼亚姆 agree. Preserve the Korean kinship wording exactly; do not decide relative age.'],
      ['50987', 'Niahm', '니암(Niahm)이', '니암(Niahm)이', 'English explicitly identifies Niahm as Warsworn and the Tala-Rane monster patron; Japanese and Chinese agree. Retain the existing label without changing enemies, ranks, or other findings.'],
      ['60021', 'Niahm', '니아움(Niahm)에게', '니암(Niahm)에게', 'The completed Kolmir task returns to Niahm; Japanese ニアム and Chinese 尼亚姆 agree. Correct only the Korean name within its existing pairing.'],
      ['63022', 'Niahm', '니암에게', '니암(Niahm)에게', 'The completed Rotclaw, Blackshriek, and King Fang task returns to Niahm; Japanese ニアム and Chinese 尼亚姆 agree. Preserve all creature names and prose.']
    ],
    'person:cartery-jayck' => [
      ['4398', 'Jayck', '제이크(Jayck)', '제이크(Jayck)', 'All locales preserve the short name Jayck, also present in the full Cartery Jayck identity. Retain the existing source-short label, without an unrestricted surname alias.'],
      ['8508', 'Cartery', '카터리를', '카터리(Cartery)를', 'The confrontation over the Togh farm murders identifies Cartery; Japanese カーテリー and Chinese 卡特里 agree with the full-name story at default:5313.'],
      ['16998', 'Cartery', '카터리(Cartery)는', '카터리(Cartery)는', 'Menri discusses Cartery’s claim that spiders killed her parents; Japanese カーテリー and Chinese 卡特里 agree. Retain the existing short label.'],
      ['17010', 'Cartery', '카터리를', '카터리(Cartery)를', 'The speaker names Cartery in the savior’s arrival dialogue; Japanese カーテリー and Chinese 卡特里 agree. Pair the name only; do not resolve or rewrite comes for / 구하러.'],
      ['19425', 'Cartery', '카터리가', '카터리(Cartery)가', 'Menri expects Cartery to help restore the farm after her parents’ deaths; Japanese カーテリー and Chinese 卡特里 agree. Preserve the rest of her account.'],
      ['27197', 'Cartery', '카터리(Cartery)를', '카터리(Cartery)를', 'The objective explicitly says Kill Cartery; Japanese カーテリー and Chinese 卡特里 agree. Retain the existing short label.'],
      ['35256', 'Cartery', '카터리에게', '카터리(Cartery)에게', 'The journal proposes confronting Cartery with the knife evidence; Japanese カーテリー and Chinese 卡特里 agree. Preserve the literal C. J. initials; do not expand them into a name or alter the evidence wording.'],
      ['46451', 'Cartery', '카터리는', '카터리(Cartery)는', 'Menri reflects on Cartery being gone after the forest/family events; Japanese カーテリー and Chinese 卡特里 agree. Pair only the explicit name.'],
      ['56436', 'Cartery', '카터리가', '카터리(Cartery)가', 'Menri explicitly says Cartery killed her parents, matching full-name default:5313/30306; Japanese カーテリー and Chinese 卡特里 corroborate.']
    ],
    'person:nesta-gwynedd' => [
      ['9687', 'Nesta', '네스타에게', '네스타(Nesta)에게', 'The speaker intends to return to Nesta; Japanese ネスタ and Chinese 奈斯塔 agree with the Gwynedd couple’s island context.'],
      ['36472', 'Nesta', '네스타에게', '네스타(Nesta)에게', 'Return to Nesta; Japanese ネスタ and Chinese 奈斯塔 agree. Preserve the existing objective and particle.'],
      ['36710', 'Nesta', '네스타는', '네스타(Nesta)는', 'The speaker describes Nesta’s curiosity about trustworthy survivors; Japanese ネスタ and Chinese 奈斯塔 corroborate the castaway context.'],
      ['43512', 'Nesta', '네스타였으니', '네스타(Nesta)였으니', 'The Olaf rescue journal names Nesta as the one who requested the survivor search; Japanese ネスタ and Chinese 奈斯塔 agree with full-name default:19979. Preserve the copula ending.'],
      ['44738', 'Nesta', '네스타에게', '네스타(Nesta)에게', 'The spouse objects to Olaf approaching his Nesta; Japanese ネスタ and Chinese 奈斯塔 agree with the Gwynedd/Olaf story.'],
      ['47173', 'Nesta', '네스타와', '네스타(Nesta)와', 'The speaker and Nesta intend to leave the island; Japanese ネスタ and Chinese 奈斯塔 corroborate the Gwynedd couple context.'],
      ['48438', 'Nesta', '네스타와', '네스타(Nesta)와', 'The speaker and Nesta are shaken and may leave Gallows End; Japanese ネスタ and Chinese 奈斯塔 corroborate the same couple.'],
      ['49173', 'Nesta', '네스타에게', '네스타(Nesta)에게', 'The speaker asks that Nesta be told they will meet under Lyria’s eyes; Japanese ネスタ and Chinese 奈斯塔 agree. Preserve Lyria and all dialogue wording.'],
      ['49792', 'Nesta', '네스타를', '네스타(Nesta)를', 'The speaker recalls first meeting Nesta while serving in a great house; Japanese ネスタ and Chinese 奈斯塔 agree with the spouse’s personal history.'],
      ['52505', 'Nesta', '네스타(Nesta)는', '네스타(Nesta)는', 'Nesta reports a galley wreck beyond the eastern beach; Japanese ネスタ and Chinese 奈斯塔 agree. Retain the existing short label.'],
      ['57549', 'Nesta', '네스타는', '네스타(Nesta)는', 'The speaker explicitly names the Alfar girl Nesta; Japanese ネスタ and Chinese 奈斯塔 corroborate the island/Olaf context. Preserve the personal dialogue.'],
      ['59665', 'Nesta', '네스타는', '네스타(Nesta)는', 'The speaker says Nesta doubts they can handle the Storm Point infestation; Japanese ネスタ and Chinese 奈斯塔 agree with the island couple context.'],
      ['60849', 'Nesta', '네스타(Nesta)와', '네스타(Nesta)와', 'English explicitly pairs Nesta with Cadwallon on the western coast; Japanese ネスタとキャドワロン and Chinese 奈斯塔和凯德沃伦 identify the Gwynedd couple. Retain both existing short labels.']
    ],
    'person:byrn-elgar' => [
      ['16331', 'Byrn', '번(Byrn)이', '번(Byrn)이', 'Old Byrn is explicitly associated with Seawatch, matching steward Byrn Elgar at default:8110/21944, not Byrn Dodwin. Japanese バーン and Chinese 巴林 corroborate. Retain the label.'],
      ['17761', 'Byrn', '번(Byrn)이', '번(Byrn)이', 'Byrn waits at the old castle and refuses to leave it, matching the Seawatch steward’s return story. Japanese バーン and Chinese 巴林 corroborate. Retain the label without a global Byrn alias.']
    ]
  }.freeze

  # These are new exclusions for the indicated entity, not reopened other-entity decisions.
  EXCLUSIONS = {
    'person:niahm-kent' => [
      ['18606', 'Kent', 'English House Kent, Japanese ケント家, and Chinese 肯特家族 identify the family rather than Niahm personally.'],
      ['21252', 'Kents', 'The poem lists the collective Kents alongside Ratofer and Scaiths as former Aster servants; Japanese and Chinese preserve the collective list. Not an individual Niahm reference.'],
      ['25264', 'Kent', 'English Kent Family, Japanese ケント家, and Chinese 肯特家族 explicitly identify the family, not Niahm.'],
      ['39557', 'Kents', 'The repeated poem lists the collective Kents alongside Ratofer and Scaiths; Japanese and Chinese corroborate the family/collective context. Not an individual Niahm reference.'],
      ['45188', 'Kent', 'English Kent Family, Japanese ケント家, and Chinese 肯特家族 explicitly identify the family, not Niahm.'],
      ['47079', 'Kent', 'English Kent Family, Japanese ケント家, and Chinese 肯特家族 explicitly identify the family, not Niahm.'],
      ['49259', 'Kent', 'English explicitly lists the families Kent, Ratofer and Scaith in Aster history; Japanese ケント家 and Chinese 肯特 support a collective. Preserve the entire historical account.'],
      ['56110', 'Kent', 'English Captain Kent commands Gull Stream in Dead Kel’s historical account; Japanese ケント船長 and Chinese 船长肯特 corroborate. Do not merge this naval captain with Warsworn Oathblade Niahm Kent.']
    ],
    'person:nesta-gwynedd' => [
      ['4940', 'Gwynedd', 'English Find Cadwallon Gwynedd explicitly identifies Nesta’s husband, not Nesta; Japanese キャドワロン・グイネズ and Chinese 凯德沃伦·格温内德 agree. Preserve the full other-person label.'],
      ['35735', 'Gwynedd', 'All three sources explicitly name Cadwallon Gwynedd, not Nesta: Japanese キャドワロン・グイネズ and Chinese 凯德沃伦·格温内德. Do not normalize this other person here.'],
      ['44963', 'Gwynedd', 'All three sources explicitly name Cadwallon Gwynedd, not Nesta: Japanese キャドワロン・グイネズ and Chinese 凯德沃伦·格温内德. Do not normalize this other person here.']
    ],
    'person:byrn-elgar' => [
      ['59714', 'Byrn', 'English Byrn Dodwin, Japanese バーン・ドドウィン, and Chinese 巴林·多德文 identify a different full person. Do not infer Byrn Elgar from their shared given name.']
    ]
  }.freeze

  TITLES = [
    {
      entity: 'unique-item:jaycks-knife', category: 'unique item',
      english: "Jayck's Knife", korean: "제이크의 칼(Jayck's Knife)",
      resource: 'base', id: '1602', variant: '11',
      old_span: '제이크(Jayck)의 칼', new_span: "제이크의 칼(Jayck's Knife)",
      evidence: 'English Jayck’s Knife is a complete named knife label; Japanese ジェイックのナイフ and Chinese 杰克的匕首 agree. Keep the existing Korean noun 칼 and pair the whole item atomically, not the owner component.'
    },
    {
      entity: 'title:niahms-labors', category: 'title',
      english: "Niahm's Labors", korean: "니암의 과업(Niahm's Labors)",
      resource: 'default', id: '46513', variant: '',
      old_span: '니암의 과업', new_span: "니암의 과업(Niahm's Labors)",
      evidence: 'English explicitly supplies the complete title Niahm’s Labors; Japanese ニアムの仕事 and Chinese 尼亚姆的任务 support its possessive name and work meaning. Pair the title atomically; the inventory does not establish a specific quest UI category.'
    },
    {
      entity: 'title:niahms-task', category: 'title',
      english: "Niahm's Task", korean: "니암의 임무(Niahm's Task)",
      resource: 'default', id: '47760', variant: '',
      old_span: '니암의 임무', new_span: "니암의 임무(Niahm's Task)",
      evidence: 'English explicitly supplies the distinct complete title Niahm’s Task; Japanese ニアムの仕事 and Chinese 尼阿姆的任务 support its possessive name and task meaning. Do not merge it with Niahm’s Labors or infer a quest UI category.'
    }
  ].freeze

  module_function

  def specs
    people = PERSON_ROWS.flat_map do |entity, rows|
      rows.map do |id, term, old_span, new_span, evidence|
        { entity: entity, resource: 'default', id: id, variant: '', term: term,
          old_span: old_span, new_span: new_span, evidence: evidence }
      end
    end
    exclusions = EXCLUSIONS.flat_map do |entity, rows|
      rows.map do |id, term, evidence|
        { entity: entity, resource: 'default', id: id, variant: '', term: term,
          excluded: true, evidence: evidence }
      end
    end
    people + exclusions + TITLES.map { |title| title.merge(term: title.fetch(:english)) }
  end

  def source_key(spec)
    [spec.fetch(:resource), spec.fetch(:id), spec.fetch(:variant)]
  end

  def text_list(source, locale)
    JSON.parse(source.fetch("#{locale}_texts_json")).compact
  end

  def expected_text(old, spec)
    return old if spec[:excluded]

    span = spec.fetch(:old_span)
    count = old.scan(Regexp.new(Regexp.escape(span))).length
    raise "expected one bounded Korean span at #{source_key(spec).inspect}, got #{count}" unless count == 1

    # Changed spans include the attached particle where required; no prose is rebuilt.
    old.sub(span, spec.fetch(:new_span))
  end

  def build_reviews(inventory)
    rows = specs.map do |spec|
      key = source_key(spec)
      source = inventory.fetch(key)
      english = text_list(source, 'en').join("\n")
      raise "missing exact English term at #{key.inspect}" unless
        english.match?(/(?<![A-Za-z])#{Regexp.escape(spec.fetch(:term))}(?![A-Za-z])/i)
      old = source.fetch('work_text')
      replacement = expected_text(old, spec)
      status = spec[:excluded] ? 'excluded' : old == replacement ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => spec.fetch(:entity), 'status' => status,
        'old' => old, 'new' => replacement,
        'evidence' => spec.fetch(:evidence) + ' Exact source-row scope only; English anchors identity and the complete aligned Japanese/Chinese evidence is retained. No global short-name alias is introduced. Preserve all other names, particles, punctuation, line breaks, opaque tokens and prior decisions.',
        'english' => english,
        'japanese' => text_list(source, 'ja').join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(spec.fetch(:entity) => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    rows.sort_by! { |row| [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i, row.fetch('Tipo_Variante')] }
    validate_review_set!(rows)
    rows
  end

  def definitions
    TITLES.map do |title|
      {
        'entity_key' => title.fetch(:entity),
        'english_canonical' => title.fetch(:english),
        'category' => title.fetch(:category),
        'korean_canonical' => title.fetch(:korean),
        'english_aliases' => '',
        'korean_variants' => title.fetch(:old_span).sub('(Jayck)', ''),
        'evidence_ids' => source_key(title).join(':'),
        'status' => 'confirmed',
        'notes' => "D-21108-D-21109: #{title.fetch(:evidence)} Source/corpus supplies spelling evidence. No shortened English aliases or nested component labels."
      }
    end
  end

  def validate_review_set!(reviews)
    by_key = specs.to_h { |spec| [source_key(spec), spec] }
    keys = reviews.map { |row| M.key(row) }
    raise 'scope is not the 59 approved keys' unless
      keys.length == 59 && keys.uniq.length == 59 && keys.sort == by_key.keys.sort
    counts = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
    raise "unexpected D-21108 statuses #{counts.inspect}" unless counts == EXPECTED_COUNTS
    raise 'preserve-only key entered package' if
      reviews.any? { |row| PRESERVE_ONLY_NOTES.key?(row.fetch('ID_Linha')) }
    reviews.each do |row|
      spec = by_key.fetch(M.key(row))
      raise 'wrong row-local entity' unless row.fetch('entity_key') == spec.fetch(:entity)
      raise 'non-local Korean transformation' unless
        row.fetch('new') == expected_text(row.fetch('old'), spec)
      expected_status = spec[:excluded] ? 'excluded' :
        row.fetch('old') == row.fetch('new') ? 'not-an-issue' : 'accepted'
      raise 'wrong row-local disposition' unless row.fetch('status') == expected_status
      raise 'wrong entity dispositions' unless
        JSON.parse(row.fetch('entity_dispositions_json')) == { spec.fetch(:entity) => expected_status }
      raise 'missing aligned evidence' if
        %w[english japanese chinese evidence].any? { |field| row.fetch(field).strip.empty? }
      raise 'changed opaque tokens or line breaks' unless
        row.fetch('old').scan(ReviewedProperNameDiscovery::OPAQUE) ==
          row.fetch('new').scan(ReviewedProperNameDiscovery::OPAQUE) &&
        row.fetch('old').scan(/\r\n|\r|\n/) == row.fetch('new').scan(/\r\n|\r|\n/)
    end
    true
  end

  def title_occurrences(inventory, new_definitions)
    build_occurrences(inventory.values, new_definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
  end

  def occurrence_rows(reviews)
    by_key = specs.to_h { |spec| [source_key(spec), spec] }
    reviews.map do |row|
      spec = by_key.fetch(M.key(row))
      values = [
        row.fetch('entity_key'), *M.key(row), spec.fetch(:term),
        row.fetch('english'), row.fetch('old'), 'needs-context',
        "D-#{D} exact-row candidate: #{spec.fetch(:evidence)} No global short-name alias."
      ]
      OCCURRENCE_HEADERS.zip(values).to_h
    end
  end

  def validate_registry!(glossary, index, reviews, inventory, new_definitions = definitions)
    validate_review_set!(reviews)
    PEOPLE.each do |entity, english|
      definition = glossary.find { |row| row.fetch('entity_key') == entity }
      raise "D-21107 person must be registered first: #{entity}" unless
        definition && definition['category'] == 'person' && definition['english_canonical'] == english
      short_terms = specs.select { |spec| spec[:entity] == entity }.map { |spec| spec[:term].downcase }
      aliases = definition['english_aliases'].to_s.split('|').map(&:downcase)
      raise "unrestricted short-name alias for #{entity}" unless (short_terms & aliases).empty?
    end
    title_entities = TITLES.map { |title| title.fetch(:entity) }
    title_reviews = reviews.select { |row| title_entities.include?(row.fetch('entity_key')) }
    generated = title_occurrences(inventory, new_definitions)
    raise 'expected exactly three generated title occurrences' unless generated.length == 3
    ReviewedProperNameDiscovery.validate!(new_definitions, title_reviews, generated, glossary, index)
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    existing = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    requested = reviews.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'exact person/exclusion key already indexed' unless (existing & requested).empty?
    true
  end

  def prepare
    inventory = M.refresh_inventory
    reviews = build_reviews(inventory)
    new_definitions = definitions
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    headers = M.table(ReviewedProperNameDiscovery::GLOSSARY).headers
    M.write_table(DEFINITION_PATH, headers, new_definitions)
    M.write_table(REVIEW_PATH, M::HEADERS, reviews)
    puts "Prepared D-#{D}: 3 definitions, 59 keys, 31 edits, 16 retained, 12 excluded; no shared data changed."
    [inventory, new_definitions, reviews]
  end

  def apply
    # Neither proposal regeneration nor registration may precede these batch gates.
    [D, D + 1].each { |d| ReviewedProperNameDiscovery.ensure_unused_batch!(d) }
    inventory, new_definitions, reviews = prepare
    glossary_table = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index_table = M.table(M::INDEX)
    glossary_headers = glossary_table.headers
    index_headers = index_table.headers
    glossary = glossary_table.map(&:to_h)
    index = index_table.map(&:to_h)
    validate_registry!(glossary, index, reviews, inventory, new_definitions)
    reviews.select { |row| row.fetch('status') == 'accepted' }
      .group_by { |row| row.fetch('resource') }.each do |resource, edits|
        ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
      end
    occurrences = occurrence_rows(reviews)
    M.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary_headers, glossary + new_definitions)
    M.write_table(M::INDEX, index_headers, index + occurrences)
    M.run(REVIEW_PATH, D, nil)
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when ['--prepare']
    PersonShortTitlesD21108.prepare
  when ['--apply']
    PersonShortTitlesD21108.apply
  else
    abort 'usage: prepare-person-short-titles-D21108.rb --prepare|--apply'
  end
end
