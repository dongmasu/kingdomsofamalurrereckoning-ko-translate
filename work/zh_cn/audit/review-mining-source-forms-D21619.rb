#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewMiningSourceFormsD21619
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_619
  PATH = File.join(__dir__, "proper-name-source-forms-D#{D}.tsv")
  CONTEXT = <<~TEXT.chomp
    English-led existing-owner continuation, searching affix/base/default.
    Cynric Quarry is linked to existing Cynric Mine by the same family's
    old tyrenium quarry and Adath hiding there: 13595, 22757 and 50221.
    English 22757/50221 place it south of Whitestone; Japanese 22757 calls
    the English Cynric mine シンリック採石場, the same complete Quarry
    label in the six selected rows. Chinese corroborates the mining site.
    Register Cynric Quarry as a source-form alias of the existing site,
    not a new location. Preserve English's source-local Quarry versus Mine
    nouns in Korean 채석장 versus 광산; identity linkage does not rewrite
    those nouns globally or merge the isolated Cynric Pit label.
    Darkvari map in 12142/22843 is the shortened title of the family
    treasure map held by Steg; 23499 and the grandfather/hoard descriptions
    corroborate the inherited map. Register that exact phrase alias under
    the existing item. Use the shorter source-local 다크바리 지도 pair,
    without adding Treasure to English that does not contain it.
    Skoria's ore-sample and awakened-evil contexts in 9555/12639/28182
    identify the previously registered mine, corroborated by Chinese
    矿场/矿藏 and the vein/sample/monster contexts in 9853/16854/43328.
    Expand the Korean place noun to 광산 but retain source-shortened
    Skoria in the pair. This is row-scoped, not a global Skoria alias.
    Surname-as-name references in 38373/59457/61305 belong to the existing
    family-name context, not individual people: add only missing English
    spelling, preserving 성/이름, metaphors, uncertainty and source meaning.
    The already paired 61305 remains unchanged. No new people, family
    relationships or biographies are inferred. Keep prior person exclusions
    and all prior terminal entity/key decisions unchanged, without recount.
    The official Korean manual extraction/reference has no direct entries.
    Exact aligned Japanese and Chinese evidence remains in each row.
    Preserve other names, markup, variables and line endings. No PAK
    material is used. Full discovery/residual validation remains incomplete.
    Published release ZIP unchanged.
  TEXT
  ALIASES = {
    'place:cynric-mine' => ['Cynric Quarry', %w[2077 7293 40979 42481 50221 54958]],
    'item:darkvari-treasure-map' => ['Darkvari map', %w[12142 22843]]
  }.freeze
  SCOPED = {
    'place:skoria-mine' => ['Skoria', %w[9555 12639 28182]],
    'family:darkvari' => ['Darkvari', %w[59457 61305]],
    'family:zungar' => ['Zungar', %w[38373]]
  }.freeze
  SUBSTITUTIONS = {
    '9555' => ['스코리아로', '스코리아 광산(Skoria)으로'],
    '12639' => ['스코리아(Skoria) 안으로', '스코리아 광산(Skoria) 안으로'],
    '28182' => ['스코리아(Skoria)에', '스코리아 광산(Skoria)에'],
    '38373' => ['중가르라는 이름', '중가르(Zungar)라는 이름'],
    '59457' => ['다크바리라는 성', '다크바리(Darkvari)라는 성']
  }.freeze

  def prepare
    R.ensure_unused_batch!(D)
    raise 'source-form manifest already exists' if File.exist?(PATH)
    inventory = M.refresh_inventory
    glossary, index = M.table(R::GLOSSARY), M.table(M::INDEX)
    known = index.map { |row| [row['entity_key'], *M.key(row)] }.to_set
    additions, reviews, updated = [], [], {}
    (ALIASES.merge(SCOPED)).each do |entity, (term, ids)|
      owner = glossary.find { |row| row['entity_key'] == entity }&.to_h
      raise "missing confirmed owner #{entity}" unless owner && owner['status'] == 'confirmed'
      candidate = owner.merge('english_aliases' =>
        ([*owner['english_aliases'].to_s.split('|'), term].reject(&:empty?).uniq.join('|')))
      generated = build_occurrences(inventory.values, [candidate]).map do |values|
        OCCURRENCE_HEADERS.zip(values).to_h
      end
      keys = ids.map { |id| ['default', id, ''] }
      if ALIASES.key?(entity)
        raise "global alias collision #{term}" if glossary.any? do |row|
          row['entity_key'] != entity &&
            [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
              .any? { |name| name.casecmp?(term) }
        end
        fresh = generated.reject { |row| known.include?([entity, *M.key(row)]) }
        raise "unexpected new alias coverage #{term}" unless fresh.map { |row| M.key(row) }.sort == keys.sort
        owner['english_aliases'] = candidate['english_aliases']
        variant = entity == 'place:cynric-mine' ? '신릭 채석장' : '다크바리 지도'
        owner['korean_variants'] = (owner['korean_variants'].to_s.split('|') + [variant]).reject(&:empty?).uniq.join('|')
      else
        fresh = generated.select { |row| keys.include?(M.key(row)) }
        raise "unexpected scoped coverage #{term}" unless fresh.map { |row| M.key(row) }.sort == keys.sort
      end
      fresh.each do |occurrence|
        key = M.key(occurrence)
        raise "duplicate terminal key #{entity}/#{key.inspect}" if known.include?([entity, *key])
        source = inventory.fetch(key)
        en = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        old = source.fetch('work_text')
        revised = old.dup
        if entity == 'place:cynric-mine'
          pattern = /신릭 채석장(?:\(Cynric Quarry\))?/
          raise "unexpected quarry span #{key.inspect}" unless old.scan(pattern).length == 1
          revised = old.sub(pattern, '신릭 채석장(Cynric Quarry)')
        elsif entity == 'item:darkvari-treasure-map'
          pattern = /다크바리 가문\(Darkvari\)의 지도|다크바리\(Darkvari\) 지도/
          raise "unexpected map span #{key.inspect}" unless old.scan(pattern).length == 1
          local = en.match(/Darkvari map/i).to_s
          raise 'map alias absent in English' if local.empty?
          revised = old.sub(pattern, "다크바리 지도(#{local})")
        elsif SUBSTITUTIONS.key?(key[1])
          from, to = SUBSTITUTIONS.fetch(key[1])
          raise "unexpected Korean span #{key.inspect}" unless old.scan(from).length == 1
          revised = old.sub(from, to)
        else
          raise 'unexpected unchanged key' unless key[1] == '61305' && old.include?('다크바리(Darkvari)라는 이름')
        end
        status = old == revised ? 'not-an-issue' : 'accepted'
        additions << occurrence
        reviews << {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'entity_key' => entity, 'status' => status,
          'old' => old, 'new' => revised, 'evidence' => CONTEXT,
          'english' => en,
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'),
          'entity_dispositions_json' => JSON.generate(entity => status)
        }
      end
      owner['evidence_ids'] = (owner['evidence_ids'].to_s.split('|') +
        ["D-#{D}"] + ids.map { |id| "default:#{id}" }).uniq.join('|')
      owner['notes'] = [owner['notes'], CONTEXT].join("\n")
      updated[entity] = owner
    end
    reviews.sort_by! { |row| row['ID_Linha'].to_i }
    raise 'unexpected source-form scope' unless reviews.length == 14 && additions.length == 14
    raise 'duplicate source-form row' unless reviews.map { |row| M.key(row) }.uniq.length == 14
    R.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')),
                                reviews.select { |row| row['old'] != row['new'] })
    puts "D-#{D}: 14 new existing-owner keys; #{reviews.count { |row| row['old'] != row['new'] }} Texto edits."
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'old', 'new')) }
    [glossary, index, updated, additions, reviews]
  end

  def apply
    glossary, index, updated, additions, reviews = prepare
    M.write_table(R::GLOSSARY, glossary.headers,
                  glossary.map { |row| updated.fetch(row['entity_key'], row.to_h) })
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + additions)
    M.write_table(PATH, M::HEADERS.take(12), reviews)
    M.run(PATH, D, 1)
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewMiningSourceFormsD21619.prepare
  when ['apply'] then ReviewMiningSourceFormsD21619.apply
  else abort 'usage: review-mining-source-forms-D21619.rb [prepare|apply]'
  end
end
