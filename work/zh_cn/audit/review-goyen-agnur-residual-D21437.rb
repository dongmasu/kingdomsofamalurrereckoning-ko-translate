#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module GoyenAgnurResidualD21437
  extend self

  M = ReviewedNameBatches
  D = 21_437
  CONFIG = {
    'person:goyen-reen' => {
      term: 'Goyen', ids: %w[7511 29394 40189 43931],
      pattern: /(?:고이엔|고옌)(?:\(Goyen\))?/, canonical: '고옌(Goyen)',
      ja: /ゴイエン/, zh: /戈因/,
      note: 'English full-name default:7598 identifies Savant Goyen Reen as Hugues\' friend, and 5657/65093 link Ivan\'s invitation and betrayal. The four short references are the same researcher, betrayer and Ivan letter recipient (43931). Japanese ゴイエン and Chinese 戈因 corroborate. Reuse the registered 고옌 stem and annotate the repeated Korean references. These are four row-scoped short forms, not a global Goyen alias; all existing nine full-name dispositions remain unchanged.'
    },
    'place:agnur-farhal' => {
      term: 'Agnur Farhol', ids: %w[61522],
      pattern: /아그누르 파홀(?:\(Agnur Farhol\))?/,
      canonical: '아그누르 파르할(Agnur Farhal)',
      ja: /アグナー・ファーハル/, zh: /埃格努尔·法哈尔/,
      note: 'English default:61522 gives the isolated source variant Agnur Farhol; its Japanese アグナー・ファーハル and Chinese 埃格努尔·法哈尔 exactly match the registered Agnur Farhal place labels (base:2654/default:15763/24574). Register only this full-name spelling alias, normalize the complete bilingual label to 아그누르 파르할(Agnur Farhal), and leave the isolated bare Agnur at 7217 unlinked. Existing full-name dispositions and historical translation totals remain unchanged.'
    }
  }.freeze

  def transform(entity, text)
    config = CONFIG.fetch(entity)
    raise "Korean name absent #{entity}" unless text.match?(config.fetch(:pattern))
    text.gsub(config.fetch(:pattern), config.fetch(:canonical))
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    definitions = CONFIG.map do |entity, config|
      entry = glossary.find { |row| row['entity_key'] == entity }
      raise "missing existing entity #{entity}" unless entry
      entry.to_h.merge('english_aliases' => (
        entry['english_aliases'].to_s.split('|') + [config.fetch(:term)]
      ).reject(&:empty?).uniq.join('|'))
    end
    generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    previous = index.to_h { |row| [[row.fetch('entity_key'), *M.key(row)], row.to_h] }
    missing = generated.reject { |row| previous.key?([row.fetch('entity_key'), *M.key(row)]) }
    expected = CONFIG.flat_map { |entity, config| config.fetch(:ids).map { |id| [entity, 'default', id, ''] } }
    raise 'unreviewed source coverage changed' unless
      missing.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort == expected.sort
    reviews = missing.sort_by { |row| row.fetch('ID_Linha').to_i }.map do |occurrence|
      entity = occurrence.fetch('entity_key')
      config = CONFIG.fetch(entity)
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "Japanese evidence differs #{key.inspect}" unless japanese.match?(config.fetch(:ja))
      raise "Chinese evidence differs #{key.inspect}" unless chinese.match?(config.fetch(:zh))
      old = source.fetch('work_text')
      new_text = transform(entity, old)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => "#{config.fetch(:note)} English anchors identity; aligned Japanese/Chinese corroborate. All three resources searched. Official-manual background does not directly name these entities. No prior terminal decision is reopened or global tally recounted.",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')),
      reviews.reject { |row| row['old'] == row['new'] })
    puts "D-#{D}: #{reviews.length} new scoped keys; #{reviews.count { |row| row['old'] != row['new'] }} edits"
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'entity_key', 'status', 'new')) }
    [glossary, index, missing, reviews]
  end

  def apply
    glossary, index, missing, reviews = prepare
    definition_path = File.join(__dir__, "proper-name-residual-definitions-D#{D}.tsv")
    review_path = File.join(__dir__, "proper-name-residual-review-D#{D}.tsv")
    raise 'prepared output exists' if [definition_path, review_path].any? { |path| File.exist?(path) }
    updated_glossary = glossary.map do |row|
      config = CONFIG[row['entity_key']]
      next row.to_h unless config
      updated = row.to_h
      updated['notes'] += " D-#{D}: #{config.fetch(:note)}"
      updated['evidence_ids'] += "|D-#{D}"
      if row['entity_key'] == 'place:agnur-farhal'
        updated['english_aliases'] = (updated['english_aliases'].to_s.split('|') + ['Agnur Farhol']).reject(&:empty?).uniq.join('|')
      end
      updated
    end
    M.write_table(definition_path, glossary.headers,
      updated_glossary.select { |row| CONFIG.key?(row['entity_key']) })
    M.write_table(review_path, M::HEADERS.take(12), reviews)
    M.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers, updated_glossary)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + missing)
    M.run(review_path, D, nil)
    final = M.table(M::INDEX).to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    index.each do |row|
      preserved = final.fetch([row['entity_key'], *M.key(row)])
      raise 'prior disposition/evidence changed' unless
        row.to_h.reject { |field, _| field == 'korean_current' } ==
        preserved.reject { |field, _| field == 'korean_current' }
    end
    raise 'unexpected occurrence count' unless final.length == index.length + missing.length
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then GoyenAgnurResidualD21437.prepare
  when 'apply' then GoyenAgnurResidualD21437.apply
  else abort 'usage: review-goyen-agnur-residual-D21437.rb [prepare|apply]'
  end
end
