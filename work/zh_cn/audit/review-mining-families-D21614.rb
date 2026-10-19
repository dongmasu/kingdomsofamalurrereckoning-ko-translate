#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewMiningFamiliesD21614
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_614
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONTEXT = <<~TEXT.chomp
    English-led comparison of the three Apotyre mining-family names across
    affix/base/default. English 32149 explicitly calls the Darkvari, Cynrics,
    Zungars and Skorias four mining families; their surrounding dialogue also
    describes family mines, family leaders, collective actions and plural
    forms. Normalize only the registered Darkvari, Cynric and Skoria family
    references as 가문, not as racial 족, and pair the English source form on
    first mention in each cell. Treat the Skoria Family Ring as a separate
    named item while retaining its family-name reference. Preserve the separate person:darkvari,
    person:skoria, person:lirin-cynric, person:adath-skoria and mine-place
    judgments. Do not reclassify bare personal surnames or mine names. Exact
    list-context aliases cover only Darkvari collective uses in 4047/44033/7671,
    the clearly collective "the Cynric" in 59807, and "Cynric boys" in 57582.
    Japanese and Chinese
    corroborate the family/collective readings where available; English
    controls meaning. The official Korean manual files were checked and have
    no direct entries for these names. No PAK or PAK-derived material was
    consulted. Prior terminal person/other-entity decisions remain unchanged.
    Full proper-name residual discovery remains incomplete.
  TEXT
  SPECS = [
    {
      entity: 'family:darkvari', english: 'Darkvari family',
      korean: '다크바리 가문', aliases: 'Darkvaris|the Darkvari|and Darkvari|Cynrics, Darkvari',
      variants: '다크바리 가문|다크바리족|다크바리스',
      category: 'people'
    },
    {
      entity: 'family:cynric', english: 'Cynric family',
      korean: '신릭 가문', aliases: 'Cynrics|the Cynric|Cynric boys',
      variants: '신릭 가문|시닉 가문|신릭족|신릭 일족',
      category: 'people'
    },
    {
      entity: 'family:skoria', english: 'Skoria family',
      korean: '스코리아 가문', aliases: 'Skorias',
      variants: '스코리아 가문|스코리아족|스코리아들|스코리아인',
      category: 'people'
    },
    {
      entity: 'item:skoria-family-ring', english: 'Skoria Family Ring',
      korean: '스코리아 가문 반지', aliases: '',
      variants: '스코리아(Scoria) 가문의 반지|스코리아 가문 반지',
      category: 'item'
    }
  ].freeze

  EDITS = {
    ['base', '1091', '11'] => [
      ['item:skoria-family-ring', '스코리아(Scoria) 가문의 반지',
       '스코리아 가문 반지(Skoria Family Ring)']
    ],
    ['default', '427', ''] => [
      ['family:cynric', '신릭(Cynrics)', '신릭 가문(Cynrics)']
    ],
    ['default', '4047', ''] => [
      ['family:darkvari', '다크바리(Darkvari)는', '다크바리 가문(Darkvari)은']
    ],
    ['default', '4299', ''] => [
      ['family:darkvari', '다크바리스(Darkvaris)', '다크바리 가문(Darkvaris)']
    ],
    ['default', '4724', ''] => [
      ['family:darkvari', '다크바리(Darkvari) 가문', '다크바리 가문(Darkvari family)']
    ],
    ['default', '5288', ''] => [
      ['family:darkvari', '다크바리족과', '다크바리 가문(Darkvari)과'],
      ['family:cynric', '신릭족도', '신릭 가문(Cynrics)도'],
      ['family:skoria', '스코리아족은', '스코리아 가문(Skorias)은']
    ],
    ['default', '7431', ''] => [
      ['family:darkvari', '다크바리(Darkvari)가', '다크바리 가문(Darkvari)이']
    ],
    ['default', '7671', ''] => [
      ['family:cynric', '신릭(Cynrics)', '신릭 가문(Cynrics)'],
      ['family:darkvari', '다크바리(Darkvari)', '다크바리 가문(Darkvari)'],
      ['family:skoria', '스코리아(Skorias)', '스코리아 가문(Skorias)']
    ],
    ['default', '11271', ''] => [
      ['family:darkvari', '다크바리(Darkvari) 가문', '다크바리 가문(Darkvari family)']
    ],
    ['default', '12142', ''] => [
      ['family:darkvari', '다크바리(Darkvari)의 지도', '다크바리 가문(Darkvari)의 지도']
    ],
    ['default', '11678', ''] => [
      ['family:skoria', '스코리아 가문 광산', '스코리아 가문(Skoria family)의 광산']
    ],
    ['default', '11816', ''] => [
      ['family:cynric', '신릭(Cynric) 가문', '신릭 가문(Cynric family)']
    ],
    ['default', '13595', ''] => [
      ['family:cynric', '시엔릭(Cynric) 가족', '신릭 가문(Cynric family)']
    ],
    ['default', '15404', ''] => [
      ['family:darkvari', '다크바리(Darkvari)', '다크바리 가문(Darkvari)'],
      ['family:cynric', '신릭(Cynrics)', '신릭 가문(Cynrics)'],
      ['family:skoria', '스코리아(Skorias)는', '스코리아 가문(Skorias)은']
    ],
    ['default', '16990', ''] => [
      ['family:darkvari', '다크바리와', '다크바리 가문(Darkvari),'],
      ['family:cynric', '시엔릭,', '신릭 가문(Cynrics),'],
      ['family:skoria', '우리 스코리아인들처럼', '우리 스코리아 가문(Skorias)처럼']
    ],
    ['default', '17950', ''] => [
      ['family:cynric', '신릭', '신릭 가문(Cynrics)']
    ],
    ['default', '18726', ''] => [
      ['family:cynric', '빌어먹을 신릭 놈들!', '빌어먹을 신릭 가문(Cynrics) 놈들!']
    ],
    ['default', '19719', ''] => [
      ['family:darkvari', '다크바리 가문', '다크바리 가문(Darkvari family)']
    ],
    ['default', '19996', ''] => [
      ['family:cynric', '신릭족은', '신릭 가문(Cynrics)은']
    ],
    ['default', '21063', ''] => [
      ['family:darkvari', '다크바리는', '다크바리 가문(Darkvari)은']
    ],
    ['default', '22756', ''] => [
      ['family:skoria', '스코리아들(Skorias)', '스코리아 가문(Skorias)']
    ],
    ['default', '22757', ''] => [
      ['family:cynric', '신릭(Cynric) 가문', '신릭 가문(Cynric family)']
    ],
    ['default', '23288', ''] => [
      ['family:darkvari', '다크바리(Darkvari)는', '다크바리 가문(Darkvaris)은']
    ],
    ['default', '23520', ''] => [
      ['family:skoria', '스코리아(Skorias)는', '스코리아 가문(Skorias)은']
    ],
    ['default', '27028', ''] => [
      ['family:cynric', '신릭 일족이', '신릭 가문(Cynrics)이']
    ],
    ['default', '29428', ''] => [
      ['family:skoria', '우리 스코리아인은', '우리 스코리아 가문(Skorias)은']
    ],
    ['default', '30987', ''] => [
      ['family:darkvari', '다크바리 가문은', '다크바리 가문(Darkvari family)은']
    ],
    ['default', '31209', ''] => [
      ['family:cynric', '신릭 가문이 운영하고', '신릭 가문(Cynric family)이 운영하고']
    ],
    ['default', '32106', ''] => [
      ['family:cynric', '신릭 가문만으로도', '신릭 가문(Cynrics)만으로도']
    ],
    ['default', '32149', ''] => [
      ['family:darkvari', '다크바리,', '다크바리 가문(Darkvari),'],
      ['family:cynric', '신릭,', '신릭 가문(Cynrics),'],
      ['family:skoria', '스코리아 가문이지', '스코리아 가문(Skorias)이지']
    ],
    ['default', '32742', ''] => [
      ['family:cynric', '신릭 형제는', '신릭 가문(Cynrics) 남자들은']
    ],
    ['default', '34765', ''] => [
      ['family:darkvari', '다크바리 가문의 범죄 행각', '다크바리 가문(Darkvari family)의 범죄 행각']
    ],
    ['default', '34889', ''] => [
      ['family:cynric', '신릭 가문', '신릭 가문(Cynric family)']
    ],
    ['default', '35429', ''] => [
      ['family:darkvari', '다크바리 가문의 광산', '다크바리 가문(Darkvari family)의 광산']
    ],
    ['default', '37117', ''] => [
      ['family:cynric', '시닉 가문', '신릭 가문(Cynric family)']
    ],
    ['default', '37686', ''] => [
      ['family:darkvari', '다크바리가 가득하다면', '다크바리 가문(Darkvaris)이 가득하다면']
    ],
    ['default', '38092', ''] => [
      ['family:skoria', '스코리아 가문의 가보', '스코리아 가문(Skoria family)의 가보']
    ],
    ['default', '39324', ''] => [
      ['family:darkvari', '다크바리스와', '다크바리 가문(Darkvaris)과']
    ],
    ['default', '39329', ''] => [
      ['family:cynric', '신릭과', '신릭 가문(Cynrics)과']
    ],
    ['default', '40943', ''] => [
      ['family:skoria', '스코리아 가문', '스코리아 가문(Skoria family)']
    ],
    ['default', '42212', ''] => [
      ['family:cynric', '신릭 가문', '신릭 가문(Cynric family)']
    ],
    ['default', '43301', ''] => [
      ['family:cynric', '신릭족에게', '신릭 가문(Cynrics)에게']
    ],
    ['default', '43618', ''] => [
      ['family:darkvari', '다크바리족에게', '다크바리 가문(Darkvaris)에게']
    ],
    ['default', '44033', ''] => [
      ['family:darkvari', '다크바리는', '다크바리 가문(Darkvari)은']
    ],
    ['default', '43944', ''] => [
      ['family:skoria', '스코리아 가문은', '스코리아 가문(Skorias)은']
    ],
    ['default', '44353', ''] => [
      ['family:cynric', '시닉 가문의 산적들', '신릭 가문(Cynric family)의 산적들']
    ],
    ['default', '45140', ''] => [
      ['family:darkvari', '다크바리들이 지닌', '다크바리 가문(Darkvaris)이 지닌']
    ],
    ['default', '45744', ''] => [
      ['family:skoria', '스코리아 가문', '스코리아 가문(Skoria family)']
    ],
    ['default', '47405', ''] => [
      ['family:skoria', '스코리아 가문', '스코리아 가문(Skoria family)']
    ],
    ['default', '48235', ''] => [
      ['family:cynric', '신릭 가문과 그 수하들', '신릭 가문(Cynric family)과 그 수하들']
    ],
    ['default', '48459', ''] => [
      ['family:skoria', '스코리아 가문은', '스코리아 가문(Skorias)은']
    ],
    ['default', '48597', ''] => [
      ['family:darkvari', '다크바리 가문과 그들의', '다크바리 가문(Darkvari family)과 그들의']
    ],
    ['default', '50179', ''] => [
      ['family:darkvari', '다크바리와 신릭,', '다크바리 가문(Darkvari), 신릭 가문(Cynrics),'],
      ['family:skoria', '스코리아 가문은', '스코리아 가문(Skorias)은']
    ],
    ['default', '50238', ''] => [
      ['family:cynric', '우리 신릭 가문은', '우리 신릭 가문(Cynrics)은']
    ],
    ['default', '50320', ''] => [
      ['family:darkvari', '다크바리 가문에서', '다크바리 가문(Darkvari family)에서']
    ],
    ['default', '52668', ''] => [
      ['family:darkvari', '다크바리(Darkvari)는', '다크바리 가문(Darkvari)은']
    ],
    ['default', '52761', ''] => [
      ['family:cynric', '신릭(Cynrics)', '신릭 가문(Cynrics)']
    ],
    ['default', '53220', ''] => [
      ['family:skoria', '스코리아 가문에 관해선', '스코리아 가문(Skorias)에 관해선']
    ],
    ['default', '57026', ''] => [
      ['family:darkvari', '다크바리가 가진', '다크바리 가문(Darkvaris)이 가진']
    ],
    ['default', '57573', ''] => [
      ['family:darkvari', '다크바리 가문의 전설적인', '다크바리 가문(Darkvari family)의 전설적인']
    ],
    ['default', '57582', ''] => [
      ['family:cynric', '시니릭 쪽 녀석들은', '신릭 가문(Cynric family) 녀석들은']
    ],
    ['default', '59562', ''] => [
      ['family:darkvari', '다크바리 가문 처단', '다크바리 가문(Darkvari family) 처단']
    ],
    ['default', '59807', ''] => [
      ['family:darkvari', '다크바리와 시닉도', '다크바리 가문(Darkvari)과 신릭 가문(Cynric family)도']
    ],
    ['default', '61445', ''] => [
      ['family:darkvari', '다크바리(The Darkvari)', '다크바리 가문(The Darkvari)']
    ],
    ['default', '64266', ''] => [
      ['family:skoria', '스코리아 가문에 대해', '스코리아 가문(Skoria family)에 대해']
    ]
  }.freeze

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    definitions = SPECS.map do |spec|
      values = {
        'entity_key' => spec.fetch(:entity),
        'english_canonical' => spec.fetch(:english),
        'category' => spec.fetch(:category),
        'korean_canonical' => "#{spec.fetch(:korean)}(#{spec.fetch(:english)})",
        'english_aliases' => spec.fetch(:aliases),
        'korean_variants' => spec.fetch(:variants),
        'evidence_ids' => "D-#{D}",
        'status' => 'confirmed',
        'notes' => CONTEXT
      }
      glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    end
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    definitions.each do |definition|
      entity = definition.fetch('entity_key')
      keys = generated.select { |row| row['entity_key'] == entity }.map { |row| M.key(row).join(':') }
      definition['evidence_ids'] = (["D-#{D}"] + keys).uniq.join('|')
    end
    grouped = generated.group_by { |row| M.key(row) }
    reviews = grouped.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      revised = old.dup
      edited_entities = []
      EDITS.fetch(key, []).each do |entity, from, to|
        raise "unexpected edit entity #{entity} at #{key.inspect}" unless matches.any? { |row| row['entity_key'] == entity }
        raise "expected one exact Korean span #{key.inspect}: #{from.inspect}" unless revised.scan(from).length == 1
        revised = revised.sub(from, to)
        edited_entities << entity
      end
      entities = matches.map { |row| row.fetch('entity_key') }.uniq.sort
      dispositions = entities.to_h do |entity|
        [entity, edited_entities.include?(entity) ? 'accepted' : 'not-an-issue']
      end
      status = revised == old ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entities.join('|'), 'status' => status,
        'old' => old, 'new' => revised, 'evidence' => CONTEXT,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    raise 'edit references a key outside generated family scopes' unless
      (EDITS.keys - grouped.keys).empty?
    raise 'expected 69 distinct source keys' unless reviews.length == 69
    R.validate!(definitions, reviews, generated, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row.fetch('resource') }.each do |resource, targets|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), targets.select { |row| row['old'] != row['new'] })
    end
    reviews.sort_by! { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
    puts "D-#{D}: three mining families, #{reviews.length} distinct keys; #{reviews.count { |row| row['old'] != row['new'] }} Texto edits; prepare only."
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'entity_key', 'old', 'new')) }
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewMiningFamiliesD21614.prepare
  when ['apply'] then ReviewMiningFamiliesD21614.apply
  else abort 'usage: review-mining-families-D21614.rb [prepare|apply]'
  end
end
