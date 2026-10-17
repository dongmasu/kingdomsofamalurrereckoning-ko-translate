#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module BeggarsBluffTanceseD21436
  extend self

  M = ReviewedNameBatches
  D = 21_436
  ITEMS = [
    {
      entity: 'place:beggars-bluff', english: "Beggar's Bluff",
      korean: '거지의 절벽', category: 'place', aliases: 'Beggars Bluff',
      ids: %w[1130 5647 7812 8619 10034 20700 23184 31610 57408 59131 60282 63897],
      ja: /物乞いの断崖/, zh: /乞丐(?:的断)?崖/,
      pattern: /(?:베거스 블러프|거지의 절벽|거지 절벽|거지의 벼랑|거지의 허세)(?:\(Beggar'?s Bluff\))?/,
      note: 'English 31610 explicitly defines this as the high hill across Galafor Plain, and 8619/23184 explain its refugee-derived name. Japanese 物乞いの断崖 and Chinese 乞丐崖/乞丐的断崖 corroborate the landform. Reuse 거지의 절벽; bluff here is not boasting, so default:59131 거지의 허세 is incorrect. Beggars Bluff at 57408 is an apostrophe-omission source variant in the same refugees/Paling Wand/Graem quest. Do not register generic bluff as a global alias.'
    },
    {
      entity: 'person:fastrada-tancese', english: 'Fastrada Tancese',
      korean: '파스트라다 탄세스', category: 'person', aliases: 'Tancese',
      ids: %w[11256 12223 14729 17902 27767 28301 32700 41642 44214 47174 47648 60614],
      ja: /タンセス/, zh: /坦泽|坦瑟塞/,
      pattern: /(?:파스트라다 )?(?:탄세스|탄체세|탄체스|탠시즈)(?:\((?:Templar )?(?:Fastrada )?Tancese\))?/,
      note: 'English 47174 identifies Fastrada Tancese as the gnome expedition leader receiving the Tome of Contrition; 27767/32700 use the full Templar title, while 11256/28301/44214/47648 use Templar Tancese for the same Basilica Gnostra expedition. Japanese ファストラダ・タンセス/タンセス and Chinese 法斯特拉达·坦泽/坦瑟塞 corroborate. Reuse 파스트라다 탄세스 and short 탄세스, correcting 탄체세/탄체스/탠시즈. Retain each existing Korean rank wording outside the person label; no unrelated institutional or rank translation is changed.'
    },
    {
      entity: 'person:fiona-caid', english: 'Fiona Caid', korean: '피오나 케이드',
      category: 'person', aliases: '', ids: %w[36761],
      ja: /フィオナ・ケイド/, zh: /菲奥娜·凯德/,
      pattern: /피오나 케이드(?:\(Fiona Caid\))?/,
      note: 'English names Fiona Caid as the deceased Ljosalfar enchanter whose staff remains, corroborated by Japanese フィオナ・ケイド and Chinese 菲奥娜·凯德. Keep her separate from the keep blacksmith Fiona Terane and Princess Fiona. No global Fiona or Caid alias is added.'
    },
    {
      entity: 'person:princess-fiona', english: 'Princess Fiona', korean: '피오나 공주',
      category: 'person', aliases: '', ids: %w[17688],
      ja: /フィオナ姫/, zh: /菲奥娜公主/,
      pattern: /피오나(?:\(Fiona\))? 공주/,
      note: 'English explicitly identifies Princess Fiona as the murdered owner whose possessions were ransomed. Japanese フィオナ姫 and Chinese 菲奥娜公主 corroborate the named title. Register the complete person/title label; do not equate her with Fiona Caid or Fiona Terane, and do not add a global Fiona alias.'
    },
    {
      entity: 'person:lyra-vogard', english: 'Lyra Vogard', korean: '리라 보가드',
      category: 'person', aliases: '', ids: %w[1835],
      ja: /ライラ・ボガード/, zh: /里拉·沃加德/,
      pattern: /리라 보가드(?:\(Lyra Vogard\))?/,
      note: 'English explicitly names refugee Lyra Vogard escaping Orieator\'s Tomb to the Forsaken Plain camp. Japanese ライラ・ボガード and Chinese 里拉·沃加德 corroborate the complete name. Preserve the existing 리라 보가드(Lyra Vogard). Do not merge Lyra Turrelm, infer any family relationship, or register a global Lyra alias from the conflicting daughter/wife and otherwise isolated short-name dialogue.'
    }
  ].freeze

  def definitions(headers)
    ITEMS.map do |item|
      fields = {
        'entity_key' => item.fetch(:entity), 'english_canonical' => item.fetch(:english),
        'korean_canonical' => "#{item.fetch(:korean)}(#{item.fetch(:english)})",
        'category' => item.fetch(:category), 'english_aliases' => item.fetch(:aliases),
        'korean_variants' => item.fetch(:korean), 'status' => 'confirmed',
        'evidence_ids' => "D-#{D}", 'notes' => item.fetch(:note)
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def transform(item, old)
    raise "Korean label missing #{item.fetch(:entity)}" unless old.match?(item.fetch(:pattern))
    result = old.gsub(item.fetch(:pattern)) do |span|
      if item.fetch(:entity) == 'person:fastrada-tancese' && !span.start_with?('파스트라다 ')
        '탄세스(Tancese)'
      else
        "#{item.fetch(:korean)}(#{item.fetch(:english)})"
      end
    end
    result = result.sub("'거지의 절벽(Beggar's Bluff)'라고", "'거지의 절벽(Beggar's Bluff)'이라고") if
      item.fetch(:entity) == 'place:beggars-bluff'
    result
  end

  def reviews(inventory, generated)
    expected = ITEMS.flat_map { |item| item.fetch(:ids).map { |id| [item.fetch(:entity), 'default', id, ''] } }
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise "exact source scope differs #{(actual - expected).inspect} / #{(expected - actual).inspect}" unless
      expected.sort == actual.sort
    generated.sort_by { |row| row.fetch('ID_Linha').to_i }.map do |occurrence|
      item = ITEMS.find { |config| config.fetch(:entity) == occurrence.fetch('entity_key') }
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "Japanese anchor differs #{key.inspect}" unless japanese.match?(item.fetch(:ja))
      raise "Chinese anchor differs #{key.inspect}" unless chinese.match?(item.fetch(:zh))
      old = source.fetch('work_text')
      new_text = transform(item, old)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => item.fetch(:entity), 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => "#{item.fetch(:note)} English anchors identity/meaning; aligned Japanese and Chinese corroborate. Search covered all three resources. Official Korean manual setting/people background is not a direct spelling source for these names. All unrelated entity decisions, tokens, paragraph breaks and historical translation totals remain unchanged.",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(item.fetch(:entity) => status)
      }
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    items = definitions(glossary.headers)
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, items).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    reviewed = reviews(inventory, generated)
    ReviewedProperNameDiscovery.validate!(items, reviewed, generated,
      glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h))
    ReviewedProperNameDiscovery.validate_sources!(reviewed, inventory)
    targets = reviewed.reject { |row| row['old'] == row['new'] }
    targets.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
    end
    puts "D-#{D}: #{items.length} entities, #{reviewed.length} exact rows, #{targets.length} edits"
    reviewed.each { |row| puts JSON.generate(row.slice('ID_Linha', 'entity_key', 'status', 'new')) }
    [items, reviewed]
  end

  def apply
    items, reviewed = prepare
    definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
    review_path = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
    raise 'prepared outputs exist' if [definition_path, review_path].any? { |path| File.exist?(path) }
    M.write_table(definition_path, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, items)
    M.write_table(review_path, M::HEADERS.take(12), reviewed)
    ReviewedProperNameDiscovery.run([definition_path, review_path, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then BeggarsBluffTanceseD21436.prepare
  when 'apply' then BeggarsBluffTanceseD21436.apply
  else abort 'usage: review-beggars-bluff-tancese-D21436.rb [prepare|apply]'
  end
end
