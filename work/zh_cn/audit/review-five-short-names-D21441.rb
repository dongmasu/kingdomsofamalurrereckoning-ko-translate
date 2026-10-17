#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module FiveShortNamesD21441
  extend self

  M = ReviewedNameBatches
  D = 21_441
  CONFIG = {
    'person:adrith-deofrit' => {
      short: 'Adrith', korean: '아드리스', ids: %w[2854 40583 57406], base: [],
      pattern: /(?:아드리스|애드리스)(?:\(Adrith\))?(?!\s*데오프리트)/,
      ja: /アドリス/, zh: /阿德里斯/,
      note: 'English 7921/25917/44392 names Adrith Deofrit as the Ironfast Keep contract/spider-stinger contact; short 2854/40583/57406 is the same work. Japanese アドリス and Chinese 阿德里斯 corroborate. Reuse 아드리스 and correct 애드리스.'
    },
    'person:hillared-gastyr' => {
      short: 'Hillared', korean: '힐러레드',
      ids: %w[1119 10575 12847 26068 27442 30091 34563 35613 43838 44237 56179 58586 63425 64605],
      base: [], pattern: /(?:힐러레드|힐라레드)(?:\(Hillared\))?(?!\s*가스티르)/,
      ja: /ヒラレッド/, zh: /希尔拉雷德|希拉雷德|希拉里德/,
      note: 'English 44483 identifies Hillared Gastyr as the last Gastyr heir; 58586/44237/64605 identify the same heir reclaiming the castle, and full 46678 links Drewn\'s former sweetheart to short 27442/43838. Japanese ヒラレッド and Chinese 希尔拉雷德/希拉雷德/希拉里德 corroborate. Japanese 30091 omits the addressed name but preserves Castle Gastyr and Piers\' letter context; English explicitly addresses Hillared. Reuse 힐러레드; preserve the Korean 검객 title at 26068. Isolated romanized-only 10575 lacks corroborating identity context and remains uncertain without a text edit.'
    },
    'person:aubrey-gilcrest' => {
      short: 'Aubrey', korean: '오브리',
      ids: %w[1759 5442 5570 5694 6682 8730 16196 27086 27784 36143 45935 54495],
      base: %w[3137], pattern: /오브리(?:\(Aubrey\))?(?!\s*길크레스트)/,
      ja: /オーブリー/, zh: /奥布里/,
      note: 'English 6836 explicitly restores the castaway\'s memory as Aubrey Gilcrest, Othe Theswin\'s scholar assistant sailing from Rathir; 22479/43893 link her apprenticeship and treasure-map work. This links the amnesiac, map fragments and voyage diary 54495 without inventing another Aubrey. English full 15903 explicitly identifies Aubrey Gilcrest\'s severed hand, supporting the already paired person reference at base:3137. Preserve all diary paragraphs and annotate each Korean name mention.'
    },
    'person:medgar-krast' => {
      short: 'Medgar', korean: '메드가르',
      ids: %w[6065 13653 22524 30331 39593 48566], base: [],
      pattern: /(?>메드가르|메드거|메드가)(?:\(Medgar\))?(?!\s*크라스트)/,
      ja: /メドガー/, zh: /麦德加/,
      note: 'English 22524/26414 explicitly identifies Red Legion brothers Medgar and Osgar Krast; 13653/39593 gives their weapons/hiding places. Japanese メドガー and Chinese 麦德加 corroborate. Reuse the registered 메드가르 stem. Standalone Medgar\'s Dagger labels are excluded from person-name annotation for separate complete item-label review.'
    },
    'person:osgar-krast' => {
      short: 'Osgar', korean: '오스가르',
      ids: %w[13653 23124 26414 34259 39593 53413 64305], base: [],
      pattern: /(?>오스가르|오스가)(?:\(Osgar\))?(?!\s*크라스트)/,
      ja: /オスガー/, zh: /奥斯加/,
      note: 'English 22524/26414 explicitly identifies Osgar and Medgar Krast as Red Legion brothers. Japanese オスガー and Chinese 奥斯加 corroborate. Reuse 오스가르; preserve the existing joint Osgar and Medgar Krast annotation at 53413 atomically. Standalone Osgar\'s Dagger labels are excluded for separate complete item-label review. Do not modify Medgar\'s existing terminal full-name row scopes.'
    }
  }.freeze
  ITEM_LABELS = {
    'person:medgar-krast' => %w[6065 48566],
    'person:osgar-krast' => %w[23124 64305]
  }.freeze

  def transform(entity, key, text)
    return text if ITEM_LABELS.fetch(entity, []).include?(key[1])
    return text if entity == 'person:hillared-gastyr' && key[1] == '10575'
    if entity == 'person:osgar-krast' && key[1] == '53413'
      raise 'joint person annotation changed' unless text.include?('오스가르와 메드가르 크라스트(Osgar and Medgar Krast)')
      return text
    end
    config = CONFIG.fetch(entity)
    raise "missing Korean short name #{entity} #{key.inspect}" unless text.match?(config.fetch(:pattern))
    text.gsub(config.fetch(:pattern), "#{config.fetch(:korean)}(#{config.fetch(:short)})")
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    definitions = CONFIG.map do |entity, config|
      entry = glossary.find { |row| row['entity_key'] == entity }
      raise "missing entity #{entity}" unless entry
      entry.to_h.merge('english_aliases' => (
        entry['english_aliases'].to_s.split('|') + [config.fetch(:short)]
      ).reject(&:empty?).uniq.join('|'))
    end
    generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    previous = index.to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    missing = generated.reject { |row| previous.key?([row['entity_key'], *M.key(row)]) }
    expected = CONFIG.flat_map do |entity, config|
      (config.fetch(:ids).map { |id| ['default', id, ''] } +
        config.fetch(:base).map { |id| ['base', id, '11'] }).map { |key| [entity, *key] }
    end
    actual = missing.map { |row| [row['entity_key'], *M.key(row)] }
    raise 'exact new short-form source coverage differs' unless actual.sort == expected.sort
    reviews = missing.group_by { |row| M.key(row) }.sort_by { |key, _rows| [M::RESOURCES.index(key[0]), key[1].to_i] }.map do |key, occurrences|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      new_text = old.dup
      dispositions = {}
      notes = occurrences.map do |occurrence|
        entity = occurrence.fetch('entity_key')
        config = CONFIG.fetch(entity)
        if entity == 'person:hillared-gastyr' && key[1] == '10575'
          raise 'isolated name evidence differs' unless english == 'Hillared' && japanese == 'Hillared' && chinese == 'Hillared'
          dispositions[entity] = 'uncertain'
        else
          japanese_agrees = japanese.match?(config.fetch(:ja))
          if entity == 'person:hillared-gastyr' && key[1] == '30091'
            japanese_agrees = japanese.include?('ガスティア城') && japanese.include?('愛しているよ、ピアース')
          end
          raise "Japanese name/context absent #{key.inspect}" unless japanese_agrees
          raise "Chinese name absent #{key.inspect}" unless chinese.match?(config.fetch(:zh))
          changed = transform(entity, key, new_text)
          dispositions[entity] = if ITEM_LABELS.fetch(entity, []).include?(key[1])
                                   'excluded'
                                 else
                                   changed == new_text ? 'not-an-issue' : 'accepted'
                                 end
          new_text = changed
        end
        config.fetch(:note)
      end
      status = if new_text != old then 'accepted'
               elsif dispositions.value?('uncertain') then 'uncertain'
               elsif dispositions.values.all? { |value| value == 'excluded' } then 'excluded'
               else 'not-an-issue'
               end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
        'old' => old, 'new' => new_text,
        'evidence' => "#{notes.join(' ')} Exact row-scoped short forms only; no global short aliases are introduced. English anchors identity, Japanese/Chinese corroborate except the explicit isolated-name hold. All affix/base/default rows searched. The official manual provides setting/quest background, not direct spelling evidence. Preserve prior terminal entity/key dispositions, full-name pairs, tokens, line breaks and historical totals.",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.reject { |row| row['old'] == row['new'] }.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
    end
    puts "D-#{D}: #{missing.length} scoped entity/keys, #{reviews.length} rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'entity_key', 'status', 'new')) }
    [glossary, index, missing, reviews]
  end

  def apply
    glossary, index, missing, reviews = prepare
    proposal = File.join(__dir__, "proper-name-short-references-D#{D}.tsv")
    original = File.join(__dir__, "proper-name-short-reference-original-definitions-D#{D}.tsv")
    raise 'prepared outputs exist' if [proposal, original].any? { |path| File.exist?(path) }
    M.write_table(original, glossary.headers, glossary.select { |row| CONFIG.key?(row['entity_key']) }.map(&:to_h))
    M.write_table(proposal, M::HEADERS.take(12), reviews)
    M.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers, glossary.map do |row|
      config = CONFIG[row['entity_key']]
      config ? row.to_h.merge('notes' => "#{row['notes']} D-#{D}: #{config.fetch(:note)} Row-scoped only; no global short alias.",
        'evidence_ids' => "#{row['evidence_ids']}|D-#{D}") : row.to_h
    end)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + missing)
    M.run(proposal, D, nil)
    final = M.table(M::INDEX).to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    index.each do |row|
      raise 'prior terminal evidence/status changed' unless
        row.to_h.reject { |field, _| field == 'korean_current' } ==
          final.fetch([row['entity_key'], *M.key(row)]).reject { |field, _| field == 'korean_current' }
    end
    raise 'new occurrence count differs' unless final.length == index.length + missing.length
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then FiveShortNamesD21441.prepare
  when 'apply' then FiveShortNamesD21441.apply
  else abort 'usage: review-five-short-names-D21441.rb [prepare|apply]'
  end
end
