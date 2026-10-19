#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewGalataeaSourceAliasD21608
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_608
  ENTITY = 'person:galataea'
  TARGET = ['default', '34960', ''].freeze
  EVIDENCE = <<~TEXT.chomp
    English default:34960 names Pacetor's wife Galatea, left in the Warren
    when Idylla rose. English default:18558 and 58466 name the same wife
    Galataea and identify the Warren/statue story; the first of those
    explicitly says "my wife, Galataea". Japanese uses ガラテイア in all
    three rows; Chinese 伽拉忒亚/加拉泰娅 corroborates the wife reference.
    Register source spelling Galatea as an alias of existing person:galataea,
    not a new person. Reuse established 갈라테이아 from the existing
    standalone labels and D-20436 decisions. At 34960 use the source-local
    English Galatea in the pair; do not rewrite immutable English sources.
    Only this previously unindexed entity/row key receives a new disposition.
    Preserve all 17 existing Galataea entity/key dispositions, the newly
    reviewed Pacetor wording, the other names and all non-name text.
    All affix/base/default sources were searched: adding this alias exposes
    exactly one new match, with no affix hits. The official Korean manual
    extraction/reference gives no direct spelling for this person.
    Full discovery/residual validation remains incomplete. Release ZIP unchanged.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    entry = glossary.find { |row| row['entity_key'] == ENTITY }&.to_h
    raise 'missing existing Galataea owner' unless entry
    raise 'canonical spelling changed' unless entry['korean_canonical'] == '갈라테이아(Galataea)'
    alias_terms = entry['english_aliases'].to_s.split('|').reject(&:empty?)
    raise 'alias already registered' if alias_terms.include?('Galatea')
    raise 'alias collision' if glossary.any? do |row|
      [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
        .any? { |term| term.casecmp('Galatea').zero? }
    end
    entry['english_aliases'] = (alias_terms + ['Galatea']).join('|')
    entry['evidence_ids'] = (entry['evidence_ids'].to_s.split('|') +
      ["D-#{D}", 'default:34960', 'default:18558', 'default:58466']).uniq.join('|')
    entry['notes'] = [entry['notes'], EVIDENCE].join("\n")
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [entry]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    old_keys = index.select { |row| row['entity_key'] == ENTITY }.map { |row| M.key(row) }
    raise 'existing Galataea scope differs' unless old_keys.length == 17
    fresh = generated.reject { |row| old_keys.include?(M.key(row)) }
    raise 'unexpected new alias scope' unless
      generated.length == 18 && fresh.map { |row| M.key(row) } == [TARGET]
    source = inventory.fetch(TARGET)
    en = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    ja = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    zh = source.fetch('zh_text')
    raise 'wife identity evidence changed' unless
      en.include?('his wife, Galatea') && en.include?('Pacetor') &&
      ja.include?('妻ガラテイア') && zh.include?('妻子伽拉忒亚')
    old = source.fetch('work_text')
    raise 'expected one unpaired alias spelling' unless old.scan('갈라테아').length == 1
    revised = old.sub('갈라테아', '갈라테이아(Galatea)')
    review = {
      'resource' => TARGET[0], 'ID_Linha' => TARGET[1], 'Tipo_Variante' => TARGET[2],
      'entity_key' => ENTITY, 'status' => 'accepted', 'old' => old, 'new' => revised,
      'evidence' => EVIDENCE, 'english' => en, 'japanese' => ja, 'chinese' => zh,
      'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
    }
    R.validate_sources!([review], inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), [review])
    puts "D-#{D}: existing Galataea owner; one source alias, one new row, one Texto edit."
    puts JSON.generate(review.slice('resource', 'ID_Linha', 'old', 'new'))
    [glossary, index, entry, fresh, review]
  end

  def apply
    glossary, index, entry, fresh, review = prepare
    path = File.join(__dir__, "proper-name-source-alias-D#{D}.tsv")
    raise 'alias review artifact already exists' if File.exist?(path)
    M.write_table(R::GLOSSARY, glossary.headers,
                  glossary.map { |row| row['entity_key'] == ENTITY ? entry : row.to_h })
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + fresh)
    M.write_table(path, M::HEADERS, [review])
    M.run(path, D, 1)
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewGalataeaSourceAliasD21608.prepare
  when ['apply'] then ReviewGalataeaSourceAliasD21608.apply
  else abort 'usage: review-galataea-source-alias-D21608.rb [prepare|apply]'
  end
end
