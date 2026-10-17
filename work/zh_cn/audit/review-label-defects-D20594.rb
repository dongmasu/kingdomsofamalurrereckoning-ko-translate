#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
audit = __dir__
holds = m.table(File.join(audit, 'proper-name-reviewed-label-defects-final.tsv'))
  .select { |row| row['status'] == 'hold-unsafe' }
inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
index = m.table(m::INDEX)

selected = holds.select do |row|
  ids = %w[
    5275 8982 10548 12422 15146 15148 15391 17388 19116 19209
    19510 20251 21022 21354 25522 26250 29804 32212 32891 33650
    34024 34361 34396 35609 35876 36405 36735 38745 39823 40384
    40706 41108 41338 41668 41739 42204 42252 42614 42794 43344
    43920 44358 46094 47738 48293 48698 56100 58022 58290 59022
  ]
  ids.include?(row['ID_Linha']) &&
    %w[person:anwy person:arick person:azo].include?(row['entity_key'])
end
raise "expected 50 held rows, found #{selected.length}" unless selected.length == 50
raise 'duplicate selected row key' unless selected.map { |row| m.key(row) }.uniq.length == 50

reviews = selected.map do |hold|
  row_key = m.key(hold)
  source = inventory.fetch(row_key)
  english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
  chinese = source.fetch('zh_text').to_s
  old = source.fetch('work_text')
  new_text = hold.fetch('pre_edit_text')
  entity = hold.fetch('entity_key')

  case entity
  when 'person:anwy'
    raise "English identity mismatch at #{row_key.inspect}" unless
      english.match?(/(?<![A-Za-z])Gwyn Anwy(?![A-Za-z])/i)
    count = new_text.scan(
      /그윈\s*(?:안웨이|앤위)(?:\s*\((?:Anwy|Gwyn Anwy)\))?/i
    ).length
    new_text = new_text.gsub(
      /그윈\s*(?:안웨이|앤위)(?:\s*\((?:Anwy|Gwyn Anwy)\))?/i,
      '그윈 안웨이(Gwyn Anwy)'
    )
    raise "Korean name span not found at #{row_key.inspect}" if count.zero?
  when 'person:arick'
    if english.match?(/(?<![A-Za-z])Black Arick(?![A-Za-z])/i)
      count = new_text.scan(
        /(?:블랙|검은)\s*(?:애릭|아릭)(?:\s*\(Black Arick\))?/i
      ).length
      new_text = new_text.gsub(
        /(?:블랙|검은)\s*(?:애릭|아릭)(?:\s*\(Black Arick\))?/i,
        '검은 아릭(Black Arick)'
      )
      raise "Black Arick span not found at #{row_key.inspect}" if count.zero?
    elsif english.match?(/(?<![A-Za-z])Arick Nareen(?![A-Za-z])/i)
      count = new_text.scan(
        /(?:애릭|아릭)\s+나린(?:\s*\(Arick Nareen\))?/i
      ).length
      new_text = new_text.gsub(
        /(?:애릭|아릭)\s+나린(?:\s*\(Arick Nareen\))?/i,
        '아릭 나린(Arick Nareen)'
      )
      raise "Arick Nareen span not found at #{row_key.inspect}" if count.zero?
    else
      raise "unrecognized Arick identity at #{row_key.inspect}"
    end
  when 'person:azo'
    raise "English identity mismatch at #{row_key.inspect}" unless
      english.match?(/(?<![A-Za-z])Azo Raemund(?![A-Za-z])/i)
    count = new_text.scan(
      /아조\s+(?:레이먼드|레이문드|래먼드)(?:\s*\(Azo Raemund\))?/i
    ).length
    new_text = new_text.gsub(
      /아조\s+(?:레이먼드|레이문드|래먼드)(?:\s*\(Azo Raemund\))?/i,
      '아조 레이먼드(Azo Raemund)'
    )
    raise "Azo Raemund span not found at #{row_key.inspect}" if count.zero?
  else
    raise "unexpected entity #{entity}"
  end

  raise "repair is a no-op at #{row_key.inspect}" if old == new_text
  raise "introduced duplicate English labels at #{row_key.inspect}" if
    new_text.match?(/\([A-Za-z][A-Za-z .'-]*\)\s*\([A-Za-z][A-Za-z .'-]*\)/)

  pending_entities = index.select do |entry|
    m.key(entry) == row_key && entry['status'] == 'uncertain'
  end.map { |entry| entry['entity_key'] }.sort
  pending_entities &= entity == 'person:arick' ? %w[person:arick person:nareen] : [entity]
  raise "missing pending entity at #{row_key.inspect}" unless pending_entities.include?(entity)

  dispositions = pending_entities.to_h { |key| [key, 'accepted'] }
  evidence = case entity
             when 'person:anwy'
               'The aligned English explicitly names Gwyn Anwy; the Korean pre-edit baseline is restored and the damaged repeated insertion is replaced by one complete bilingual name. Japanese グウィン・アンウェイ and Chinese 格文·安维 corroborate the identity. Other text, title, particles, and line breaks are preserved.'
             when 'person:arick'
               if english.match?(/(?<![A-Za-z])Black Arick(?![A-Za-z])/i)
                 'The aligned English explicitly names Black Arick; the Korean pre-edit baseline is restored and the damaged repeated insertion is replaced by one complete bilingual name. Japanese and Chinese identify the same literary hero where the aligned row carries the name.'
               else
                 'The aligned English explicitly names Arick Nareen; Japanese アリック・ナリーン and Chinese 阿里克·纳林 corroborate the full identity. The Korean pre-edit baseline is restored and normalized to one complete bilingual name.'
               end
             else
               'The aligned English explicitly names Azo Raemund; Japanese アゾ・レイムンド and Chinese 阿佐·雷蒙德 corroborate the identity. The Korean pre-edit baseline is restored and normalized to one complete bilingual name; the shortened later surname mention is left intact.'
             end

  {
    'resource' => row_key[0],
    'ID_Linha' => row_key[1],
    'Tipo_Variante' => row_key[2],
    'entity_key' => pending_entities.join('|'),
    'status' => 'accepted',
    'old' => old,
    'new' => new_text,
    'evidence' => evidence,
    'english' => english,
    'japanese' => japanese,
    'chinese' => chinese,
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end.sort_by { |row| [row['resource'], row['ID_Linha'].to_i, row['Tipo_Variante']] }

out = File.join(audit, 'proper-name-reviewed-label-defects-D20594.tsv')
m.write_table(out, m::HEADERS, reviews)
puts "#{out}: #{reviews.length} accepted repairs"
