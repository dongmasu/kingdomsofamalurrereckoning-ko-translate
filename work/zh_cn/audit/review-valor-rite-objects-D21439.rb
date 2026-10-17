#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ValorRiteObjectsD21439
  extend self

  M = ReviewedNameBatches
  D = 21_439
  ITEMS = [
    {
      entity: 'unique_item:kora-petal', english: 'Kora Petal', korean: '코라 꽃잎',
      category: 'unique item', base: %w[3811],
      ids: %w[4480 4890 16083 23429 26053 34203 36623 52172],
      ja: /コラの花びら/, zh: /寇拉花|科拉花瓣/,
      pattern: /코라(?:\(Kora\))?(?:의)? 꽃잎(?:\(Kora Petal\))?/,
      note: 'English identifies the named petal taken from the cave guardian and used by Florion to remove Alard\'s curse (4480/25534/52172). Japanese コラの花びら and Chinese 科拉花瓣/寇拉花 corroborate. Reuse the complete-label majority 코라 꽃잎, replacing the component-only base label. Do not infer a separate Kora person or any item rarity.'
    },
    {
      entity: 'lore_term:rite-of-valor', english: 'Rite of Valor', korean: '용맹의 의식',
      category: 'lore term', base: [], ids: %w[7459 25534 34203 35581 37508 60332],
      ja: /武勇の儀式/, zh: /英勇仪式/,
      pattern: /(?:용맹의 의식|무훈의 의식)(?:\(Rite of Valor\))?/,
      note: 'English identifies the named Fae cave rite that activates the guardian and may cure the imprisoned Almain (25534/34203/60332). Japanese 武勇の儀式 and Chinese 英勇仪式 corroborate. Reuse 용맹의 의식 and correct the isolated 무훈 wording. This registers a named rite, not a new quest name or an alias for every use of Rite/Valor.'
    },
    {
      entity: 'unique_item:essence-of-valor', english: 'Essence of Valor', korean: '용맹의 정수',
      category: 'unique item', base: %w[3177], ids: %w[4162 7139 16432 58575],
      ja: /武勇のエッセンス/, zh: /英勇精元|英勇精华/,
      pattern: /용맹의 정수(?:\(Essence of Valor\))?/,
      note: 'English 58575 says this named essence protects against Dren\'s attacks; 4162 and base:3177/default:7139 provide possession and item labels. Japanese 武勇のエッセンス and Chinese 英勇精元/英勇精华 corroborate. Preserve 용맹의 정수 and add missing complete English annotation. Do not merge the separately worded Essence of the Defender or essence of Valor\'s Defender without explicit identity evidence; no rarity is inferred.'
    },
    {
      entity: 'place:tree-of-valor', english: 'Tree of Valor', korean: '용맹의 나무',
      category: 'place', base: [], ids: %w[16083 22178 40405],
      ja: /武勇の木/, zh: /英勇之树/,
      pattern: /용맹의 나무(?:\(Tree of Valor\))?/,
      note: 'English 16083/40405 identifies this named cave landmark and its sigil stone in the rite sequence. Japanese 武勇の木 and Chinese 英勇之树 corroborate. Keep the existing 용맹의 나무; place is a landmark scope, not an inferred portable item or a global Tree/Valor alias.'
    },
    {
      entity: 'place:stone-of-valor', english: 'Stone of Valor', korean: '용맹의 돌',
      category: 'place', base: %w[4455], ids: %w[1384 3625 18121 27543 29069 40405],
      ja: /武勇の石/, zh: /英勇之石/,
      pattern: /용맹의 돌(?:\(Stone of Valor\))?/,
      note: 'English 18121/27543/40405 identifies this named activatable cave landmark in the same rite sequence. Japanese 武勇の石 and Chinese 英勇之石 corroborate. Keep 용맹의 돌. Do not merge the explicitly different Pillar of Valor, Pillar of Strength or ordinary sigil-stone references.'
    },
    {
      entity: 'place:waterfall-of-valor', english: 'Waterfall of Valor', korean: '용맹의 폭포',
      category: 'place', base: %w[1148], ids: %w[11009],
      ja: /バロールの滝|武勇の滝/, zh: /英勇瀑布/,
      pattern: /용맹의 폭포(?:\(Waterfall of Valor\))?/,
      note: 'English base:1148/default:11009 explicitly names the waterfall. Japanese バロールの滝/武勇の滝 and Chinese 英勇瀑布 corroborate the existing 용맹의 폭포. Register this complete landmark label only; do not infer an alias with the distinct source wording Waterfall of Radiance or bare Waterfall.'
    }
  ].freeze

  def keys(item)
    item.fetch(:base).map { |id| ['base', id, '11'] } +
      item.fetch(:ids).map { |id| ['default', id, ''] }
  end

  def definitions(headers)
    ITEMS.map do |item|
      fields = {
        'entity_key' => item.fetch(:entity), 'english_canonical' => item.fetch(:english),
        'category' => item.fetch(:category), 'english_aliases' => '',
        'korean_canonical' => "#{item.fetch(:korean)}(#{item.fetch(:english)})",
        'korean_variants' => item.fetch(:korean), 'status' => 'confirmed',
        'evidence_ids' => "D-#{D}", 'notes' => item.fetch(:note)
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def transform(item, text)
    raise "missing Korean label #{item.fetch(:entity)}" unless text.match?(item.fetch(:pattern))
    text.gsub(item.fetch(:pattern), "#{item.fetch(:korean)}(#{item.fetch(:english)})")
  end

  def excluded_key?(entity, key)
    entity == 'unique_item:essence-of-valor' && key == ['default', '16432', '']
  end

  def reviews(inventory, generated)
    expected = ITEMS.flat_map { |item| keys(item).map { |key| [item.fetch(:entity), *key] } }
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise "source scope differs #{(actual - expected).inspect} / #{(expected - actual).inspect}" unless expected.sort == actual.sort
    generated.group_by { |row| M.key(row) }.sort_by { |key, _rows| [M::RESOURCES.index(key[0]), key[1].to_i] }.map do |key, occurrences|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      new_text = old.dup
      dispositions = {}
      notes = occurrences.map do |occurrence|
        item = ITEMS.find { |config| config.fetch(:entity) == occurrence.fetch('entity_key') }
        if excluded_key?(item.fetch(:entity), key)
          raise 'possessive homonym evidence changed' unless
            english.include?("The essence of Valor's Defender?") &&
            japanese.include?('ハウス・オブ・バローの守護者') &&
            chinese.include?('英勇捍卫者')
          dispositions[item.fetch(:entity)] = 'excluded'
          next "Excluded lexical prefix at default:16432: English essence of Valor's Defender names the defender's essence, not the exact Essence of Valor item label. Japanese ハウス・オブ・バローの守護者 and Chinese 英勇捍卫者 corroborate the possessive construction. Preserve the Korean cell and its existing person/faction scopes; do not infer item identity."
        end
        raise "Japanese anchor missing #{key.inspect}" unless japanese.match?(item.fetch(:ja))
        raise "Chinese anchor missing #{key.inspect}" unless chinese.match?(item.fetch(:zh))
        changed = transform(item, new_text)
        dispositions[item.fetch(:entity)] = new_text == changed ? 'not-an-issue' : 'accepted'
        new_text = changed
        item.fetch(:note)
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.sort.join('|'),
        'status' => new_text != old ? 'accepted' :
          (dispositions.values.all? { |status| status == 'excluded' } ? 'excluded' : 'not-an-issue'),
        'old' => old, 'new' => new_text,
        'evidence' => "#{notes.join(' ')} English anchors meaning/identity; Japanese and Chinese corroborate. Searched affix/base/default. The official manual provides setting/crafting background, not these spellings. Existing entities on shared rows, opaque tokens and line breaks are preserved. No historical translation tally is recounted.",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions)
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
    reviewed.reject { |row| row['old'] == row['new'] }.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
    end
    puts "D-#{D}: #{items.length} entities; #{generated.length} entity/keys in #{reviewed.length} rows; #{reviewed.count { |row| row['old'] != row['new'] }} edits"
    reviewed.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'entity_key', 'status', 'new')) }
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
  when 'prepare' then ValorRiteObjectsD21439.prepare
  when 'apply' then ValorRiteObjectsD21439.apply
  else abort 'usage: review-valor-rite-objects-D21439.rb [prepare|apply]'
  end
end
