#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
entity = 'place:dalentarth'
english_name = 'Dalentarth'
korean_name = '달렌타스'
raise 'Dalentarth already registered' if glossary.any? { |row| row['entity_key'] == entity }

definition = glossary.headers.zip([
  entity, english_name, 'place', "#{korean_name}(#{english_name})", '',
  '달렌타르스|달렌다스', 'base:261|base:3208|default:121|default:2175',
  'confirmed',
  'English identifies Dalentarth as a named region; Japanese ダレンタース and Chinese 达伦塔斯 corroborate the established Korean form 달렌타스. The official Korean manual does not list this place, so its omission is not contrary evidence. Exact English source matching governs occurrence inclusion.'
]).to_h

inventory = m.table(m::INVENTORY)
generated = build_occurrences(inventory, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
raise "unexpected source match count #{generated.length}" unless generated.length == 159

sources = inventory.to_h { |row| [m.key(row), row.to_h] }
reviews = generated.map do |occurrence|
  row_key = m.key(occurrence)
  source = sources.fetch(row_key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  visible_english = english.gsub(/\$[^$]*\$/, ' ')
  old = source.fetch('work_text')
  text = old.dup
  found = false
  pattern = /(?<![가-힣])#{Regexp.escape(korean_name)}(?:\s*\((?<label>[^()]*)\))?(?<particle>에서|에게서|으로부터|으로써|으로|까지|부터|에게|에서|은|는|이|가|을|를|와|과|의|에|로|도|만)?(?![가-힣])/

  raise "English entity only occurs inside opaque variable #{row_key.inspect}" unless
    visible_english.match?(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i)

  text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
    prefix = text[0...match.begin(0)]
    next unless prefix.count('(') <= prefix.count(')')

    label = match[:label]
    particle = match[:particle].to_s
    if label && label.match?(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i)
      replacement = "#{korean_name}(#{english_name})#{particle}"
    elsif label && label.match?(/[A-Za-z]/)
      # Preserve an atomic full title such as "Dalentarth Stone".
      replacement = match[0]
    else
      replacement = "#{korean_name}(#{english_name})#{particle}"
    end
    text[match.begin(0)...match.end(0)] = replacement
    found = true
  end

  status = if !found
             'uncertain'
           elsif text == old
             'not-an-issue'
           else
             'accepted'
           end
  evidence = if !found
               'English explicitly identifies Dalentarth, but this Korean row has no safely bounded corresponding 달렌타스 span; left unchanged for focused context review.'
             else
               'English identifies the named region Dalentarth; Japanese ダレンタース and Chinese 达伦塔斯 corroborate 달렌타스. Standardized only exact Korean name spans to 달렌타스(Dalentarth), preserving atomic longer English title labels, particles, line breaks, placeholders, and surrounding text. The official Korean manual does not enumerate this region.'
             end
  {
    'resource' => row_key[0], 'ID_Linha' => row_key[1], 'Tipo_Variante' => row_key[2],
    'entity_key' => entity, 'status' => status, 'old' => old, 'new' => text,
    'evidence' => evidence,
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

index = m.table(m::INDEX)
raise 'duplicate generated entity-row keys' unless
  generated.map { |row| m.key(row) }.uniq.length == generated.length
m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + [definition])
m.write_table(m::INDEX, index.headers, index.map(&:to_h) + generated)
out = File.join(__dir__, 'proper-name-reviewed-dalentarth-D20614.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, 20614, nil)
