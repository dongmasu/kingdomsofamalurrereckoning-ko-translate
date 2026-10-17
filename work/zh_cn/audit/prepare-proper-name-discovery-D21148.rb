#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
start_d = 21_148
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))

event = {
  'entity_key' => 'event:crystal-war',
  'english_canonical' => 'Crystal War',
  'category' => 'named event',
  'korean_canonical' => '수정 전쟁(Crystal War)',
  'english_aliases' => '',
  'korean_variants' => '크리스탈 전쟁|크리스털 전쟁|크리스탈 워|수정 전쟁',
  'evidence_ids' => 'D-21148-D-21149',
  'status' => 'confirmed',
  'notes' => 'English identifies the recurring named historical conflict. Aligned Japanese クリスタル戦争 and Chinese 水晶之战 corroborate it. Reuse the established Korean event form 수정 전쟁 from D-20097 and pair it as 수정 전쟁(Crystal War). The official Korean manual reference has no direct hit; its omission is not contradictory. Keep ordinary uses of war and independently named book titles distinct.'
}
history = {
  'entity_key' => 'work:history-of-the-crystal-war',
  'english_canonical' => 'History of the Crystal War',
  'category' => 'named work',
  'korean_canonical' => '수정 전쟁사(History of the Crystal War)',
  'english_aliases' => '',
  'korean_variants' => '수정 전쟁사',
  'evidence_ids' => 'D-21148-D-21149',
  'status' => 'confirmed',
  'notes' => 'Four volume-title rows explicitly identify the named history series. Preserve each English-source volume number and subtitle, despite Japanese volume-number conflicts at default IDs 36150 and 49857. Pair each complete translated volume title with its exact English source title.'
}
definitions = [event, history].map do |definition|
  glossary.headers.to_h { |header| [header, definition[header]] }
end

inventory = m.refresh_inventory
scoped = inventory.values.select do |row|
  JSON.parse(row.fetch('en_texts_json') || '[]').compact.any? do |text|
    text.match?(/(?<![A-Za-z])Crystal War(?![A-Za-z])/i)
  end
end
scoped.sort_by! do |row|
  [m::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
   row['Tipo_Variante'].to_s]
end
raise "expected 75 Crystal War source keys, got #{scoped.length}" unless scoped.length == 75
raise 'duplicate Crystal War source keys' unless scoped.map { |row| m.key(row) }.uniq.length == 75
raise 'Crystal War glossary entity already exists' if glossary.any? do |row|
  row['entity_key'] == event['entity_key'] ||
    row['entity_key'] == history['entity_key']
end

book_titles = {
  '11565' => 'History of the Crystal War, Vol I: The Onset',
  '36150' => 'History of the Crystal War, Vol III: Across the Phorian',
  '41372' => 'History of the Crystal War, Vol IV: Klurikon Until the Siege',
  '49857' => 'History of the Crystal War, Vol II: Erathell Campaign'
}
reviews = scoped.map do |row|
  key = m.key(row)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  english_texts = JSON.parse(source.fetch('en_texts_json') || '[]').compact
  english = english_texts.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
  chinese = source.fetch('zh_text')
  raise "missing aligned source text at #{key.inspect}" if
    [english, japanese, chinese].any?(&:empty?)

  work_title = key[0] == 'default' ? book_titles[key[1]] : nil
  if work_title
    raise "source title mismatch at #{key.inspect}" unless english_texts.any? do |text|
      text.include?(work_title)
    end
    new_text = "#{old}(#{work_title})"
    entities = [event['entity_key'], history['entity_key']]
    dispositions = {
      event['entity_key'] => 'not-an-issue',
      history['entity_key'] => 'accepted'
    }
    evidence = 'English identifies this as a volume title in History of the Crystal War; the complete source title is appended to the existing Korean title. Japanese and Chinese were checked for title and volume context, but English controls the volume number where they conflict. The Crystal War component is paired atomically as part of the book title; no separate event label is inserted.'
  else
    new_text = old.gsub(
      /(?:크리스탈 전쟁|크리스털 전쟁|크리스탈 워|수정 전쟁)(?!\(Crystal War\))/,
      '수정 전쟁(Crystal War)'
    )
    raise "no Korean event-name span at #{key.inspect}" if new_text == old &&
      !old.include?('수정 전쟁(Crystal War)')
    entities = [event['entity_key']]
    event_status = new_text == old ? 'not-an-issue' : 'accepted'
    dispositions = { event['entity_key'] => event_status }
    evidence = if event_status == 'accepted'
                 'English names the Crystal War in this exact context. Aligned Japanese クリスタル戦争 and Chinese 水晶之战 corroborate the event reference. Standardize the Korean spelling to the established 수정 전쟁 and pair it as 수정 전쟁(Crystal War), preserving all other wording, particles, tokens, and line breaks.'
               else
                 'The complete named-event form 수정 전쟁(Crystal War) is already present in this exact Korean cell; retain it. English, aligned Japanese クリスタル戦争, and Chinese 水晶之战 identify the same event.'
               end
  end

  status = new_text == old ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => entities.join('|'),
    'status' => status,
    'old' => old,
    'new' => new_text,
    'evidence' => evidence,
    'english' => english,
    'japanese' => japanese,
    'chinese' => chinese,
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end

expected_books = book_titles.keys.sort
actual_books = reviews.select { |row| row['entity_key'].include?(history['entity_key']) }
                     .map { |row| row['ID_Linha'] }.sort
raise 'named-work row coverage differs' unless actual_books == expected_books
raise 'unexpected source/entity row coverage' unless reviews.length == 75

definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{start_d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{start_d}.tsv")
raise 'batch preparation already exists' if [definitions_path, reviews_path].any? do |path|
  File.exist?(path)
end
m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)
counts = reviews.group_by { |row| row['status'] }.transform_values(&:length)
puts "D-#{start_d}-D-#{start_d + 1}: #{reviews.length} distinct rows; #{counts}"
