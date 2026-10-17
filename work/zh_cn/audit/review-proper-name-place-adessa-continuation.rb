#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
start_d = Integer(ARGV.fetch(0))
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
entity = 'place:adessa'
raise 'Adessa already registered' if glossary.any? { |row| row['entity_key'] == entity }
definition = glossary.headers.zip([
  entity, 'Adessa', 'place', '아데사(Adessa)', '', '',
  'base:2850|default:522|default:19498', 'confirmed',
  'English names the gnomish city Adessa. Japanese アデッサ and Chinese 阿德萨 corroborate identity. Retain established 아데사. Preserve complete mine/library/laboratory labels and annotate exact prison, district and numbered titles atomically. The official manual gives world/quest context but no Adessa spelling.'
]).to_h
inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
raise 'Adessa source count changed' unless generated.length == 366
complete_labels = {
  'Adessa Rising' => '아데사 봉기',
  'Adessa Prison' => '아데사 감옥',
  'Adessa Jail' => '아데사 감옥',
  'Adessa Prison Key' => '아데사 감옥 열쇠',
  'Adessa - The Isles' => '아데사 - 제도',
  'Adessa - The Walls' => '아데사 - 성벽',
  'Library of Adessa' => '아데사 도서관',
  'Adessa Mine' => '아데사 광산'
}
%w[I II III IV V VI VII VIII].each { |number| complete_labels["Adessa #{number}"] = "아데사 #{number}" }
reviews = generated.map do |occurrence|
  key = m.key(occurrence)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  visible = english.gsub(/\$[^$]*\$/, ' ').match?(/(?<![A-Za-z])Adessa(?![A-Za-z])/i)
  raise "unmatched Adessa span #{key.inspect}" if visible && !old.include?('아데사')
  text = old.dup
  if complete_labels.key?(english)
    text = "#{complete_labels.fetch(english)}(#{english})"
  else
    text.to_enum(:scan, /아데사(?:\(Adessa\))?/).map { Regexp.last_match.dup }.reverse_each do |match|
      prefix = text[0...match.begin(0)]
      next if prefix.count('(') > prefix.count(')')
      tail = text[match.end(0)..]
      compound = tail.match(/\A[^()\r\n,.!?;]{0,80}\((?<label>[^()]*)\)/)
      next if compound && compound[:label].match?(/\bAdessa\b/i) &&
        !tail[0...compound.begin(:label)].include?('아데사')
      text[match.begin(0)...match.end(0)] = '아데사(Adessa)'
    end
  end
  status = !visible ? 'excluded' : (old == text ? 'not-an-issue' : 'accepted')
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entity, 'status' => status, 'old' => old, 'new' => text,
    'evidence' => visible ? 'English names the gnomish city Adessa; aligned Japanese アデッサ and Chinese 阿德萨 corroborate. Retained 아데사(Adessa), including repeated mentions and particles. Existing full mine, laboratory, library and crater pairs are preserved; exact named prison, district, book and numbered titles use one complete bilingual pair. No other text, token, number or line ending was changed. The official manual supplies setting context, not this city spelling.' : 'Adessa occurs only in an opaque runtime variable, not visible player-facing text. Excluded without modifying the variable or Korean.',
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
index = m.table(m::INDEX)
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + [definition])
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + generated)
out = File.join(__dir__, "proper-name-reviewed-adessa-D#{start_d}.tsv")
m.write_table(out, m::HEADERS, reviews)
m.run(out, start_d, nil)
