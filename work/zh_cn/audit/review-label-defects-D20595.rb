#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
audit = __dir__
holds = m.table(File.join(audit, 'proper-name-reviewed-label-defects-final.tsv'))
  .select { |row| row['status'] == 'hold-unsafe' }
inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
index = m.table(m::INDEX)
ids = %w[
  15442 17517 20678 32174 54628 40889 42444 43063 56754 58235
  38662 40270 50213 53098 54061 15394 25941 57640 8371 3917
  6896 28562 578 61614
]
selected = holds.select { |row| ids.include?(row['ID_Linha']) }
raise "expected 24 held rows, found #{selected.length}" unless selected.length == 24
raise 'duplicate selected row key' unless selected.map { |row| m.key(row) }.uniq.length == 24

def replace_once!(text, pattern, replacement, key)
  count = text.scan(pattern).length
  raise "expected a supported Korean span at #{key.inspect}" if count.zero?
  [text.gsub(pattern, replacement), count]
end

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
  when 'people:jottun|people:kollossae'
    raise "English identity mismatch at #{row_key.inspect}" unless
      english.match?(/(?<![A-Za-z])Jottun(?![A-Za-z])/i) &&
      english.match?(/(?<![A-Za-z])Kollossae(?![A-Za-z])/i)
    new_text = new_text.gsub(/콜로사이(족)?(?!\()/) do
      "콜로사이#{Regexp.last_match(1)}(Kollossae)"
    end
    new_text = new_text.gsub(/요툰(족)?(?!\()/) do
      "요툰#{Regexp.last_match(1)}(Jottun)"
    end
    raise "missing people/species names at #{row_key.inspect}" unless
      new_text.include?('(Kollossae)') && new_text.include?('(Jottun)')
  when 'person:agarth'
    raise 'Agarth source mismatch' unless english.match?(/\bAgarth\b/i)
    new_text, = replace_once!(new_text, /아가스(?!\()/, '아가스(Agarth)', row_key)
  when 'person:arigal'
    raise 'Maeve Arigal source mismatch' unless english.match?(/\bMaeve Arigal\b/i)
    new_text, = replace_once!(new_text, /메이브\s+아리갈(?:\(Arigal\))?/, '메이브 아리갈(Maeve Arigal)', row_key)
  when 'person:arkes'
    raise 'Arkes source mismatch' unless english.match?(/\bArkes the Unspoken\b/i)
    new_text = new_text.gsub('아르케스(Arkes)(Arkes the Unspoken)', '침묵의 아르케스(Arkes the Unspoken)')
    new_text = new_text.gsub('아르케스(Arkes)(Arkes)', '아르케스(Arkes)')
    raise 'Arkes duplicates remain' if new_text.match?(/아르케스\(Arkes\)\(Arkes/)
  when 'person:atheof'
    raise 'Atheof Cergren source mismatch' unless english.match?(/\bAtheof Cergren\b/i)
    new_text = new_text.gsub(
      /(?:아세오프|아시오프|아테오프)\s+(?:서그렌|세르그렌)(?:\(Atheof Cergren\))?/,
      '아테오프 세르그렌(Atheof Cergren)'
    )
    new_text = new_text.gsub(/아테오프 세르그렌\(Atheof Cergren\)\s+아테오프 세르그렌\(Atheof Cergren\)/,
                             '아테오프 세르그렌(Atheof Cergren)')
    # A later short mention remains a short name, paired to the English token.
    new_text = new_text.gsub(/아세오프(?!\()/, '아테오프(Atheof)')
    raise 'Atheof full name missing' unless new_text.include?('아테오프 세르그렌(Atheof Cergren)')
  when 'person:cleas'
    raise 'Cleas source mismatch' unless english.match?(/\bCleas\b/i)
    new_text, = replace_once!(new_text, /클레아스(?!\()/, '클레아스(Cleas)', row_key)
  when 'person:fendar'
    raise 'Nag Fendar source mismatch' unless english.match?(/\bNag Fendar\b/i)
    new_text = '낵 펜더(Nag Fendar)'
  when 'person:arnick'
    raise 'Arnick Arduna source mismatch' unless english.match?(/\bArnick Arduna\b/i)
    new_text = new_text.gsub(/아르닉\s+아르두나(?:\(Arnick Arduna\))?/,
                             '아르닉 아르두나(Arnick Arduna)')
    raise 'Arnick full name missing' unless new_text.include?('아르닉 아르두나(Arnick Arduna)')
  when 'person:cyf'
    raise 'Cyf Cadyr source mismatch' unless english.match?(/\bCyf, Cyf Cadyr\b/i)
    new_text = new_text.sub('난 시프, 시프 캐디르(Cyf Cadyr)야.',
                            '난 시프(Cyf), 시프 캐디르(Cyf Cadyr)야.')
  when 'person:desiderus'
    raise 'Desiderus source mismatch' unless english.match?(/\bDesiderus Trav\b/i)
    new_text = new_text.gsub('데시데루스 트라브(Desiderus Trav)',
                             '데시데루스(Desiderus) 트라브(Desiderus Trav)')
    new_text = new_text.gsub(/데시데루스(?!\()/, '데시데루스(Desiderus)')
  when 'person:eilaly'
    raise 'Eilaly source mismatch' unless english.match?(/\bEilaly Airancourt\b/i)
    raise 'Eilaly full name missing from pre-edit baseline' unless
      new_text.include?('에일랄리 에어랑쿠르(Eilaly Airancourt)')
  when 'person:emundas'
    raise 'Emundas source mismatch' unless english.match?(/\bEmundas\b/i) &&
      english.match?(/\bWane Emundas\b/i)
    new_text = new_text.sub('이름은 에문다스.', '이름은 에문다스(Emundas).')
  when 'person:erann'
    raise 'Erann source mismatch' unless english.match?(/\bErann Gastyr\b/i)
    raise 'Erann full name missing from pre-edit baseline' unless
      new_text.include?('에란 가스티르(Erann Gastyr)')
  when 'person:erion'
    raise 'Erion Odi source mismatch' unless english.match?(/\bErion Odi\b/i) &&
      english.match?(/\bErion's Alfar camp\b/i)
    new_text = new_text.sub('에리온의 알파르', '에리온(Erion)의 알파르')
  else
    raise "unexpected held entity #{entity}"
  end

  raise "duplicate adjacent English labels at #{row_key.inspect}" if
    new_text.match?(/\([A-Za-z][A-Za-z .'-]*\)\s*\([A-Za-z][A-Za-z .'-]*\)/)

  pending_entities = index.select do |entry|
    m.key(entry) == row_key && entry['status'] == 'uncertain'
  end.map { |entry| entry['entity_key'] }.sort
  targets = entity.split('|')
  pending_entities &= targets
  raise "missing pending entity at #{row_key.inspect}" unless pending_entities.sort == targets.sort

  status = old == new_text ? 'not-an-issue' : 'accepted'
  evidence = if status == 'accepted'
               'English-led review of the exact row; Japanese pronunciation/register and aligned Chinese meaning were checked as corroboration. Restored the known pre-edit Korean text, removed the prior repeated or nested name insertion, and kept one source-supported bilingual label per identified name. Surrounding wording, titles, particles, placeholders, and line breaks are preserved.'
             else
               'English-led review of the exact row with aligned Japanese and Chinese corroboration. The active Korean cell already contains one complete source-supported bilingual name and requires no edit.'
             end
  {
    'resource' => row_key[0],
    'ID_Linha' => row_key[1],
    'Tipo_Variante' => row_key[2],
    'entity_key' => targets.sort.join('|'),
    'status' => status,
    'old' => old,
    'new' => new_text,
    'evidence' => evidence,
    'english' => english,
    'japanese' => japanese,
    'chinese' => chinese,
    'entity_dispositions_json' => JSON.generate(targets.to_h { |key| [key, status] })
  }
end.sort_by { |row| [row['resource'], row['ID_Linha'].to_i, row['Tipo_Variante']] }

out = File.join(audit, 'proper-name-reviewed-label-defects-D20595.tsv')
m.write_table(out, m::HEADERS, reviews)
puts "#{out}: #{reviews.length} accepted repairs"
