#!/usr/bin/env ruby

require 'csv'
require 'json'

root = File.expand_path('../../..', __dir__)
occurrence_path = '/private/tmp/proper-name-occurrences-D20922.tsv'
inventory_path = '/private/tmp/proper-name-source-inventory-D20922.tsv'
output_path = File.join(__dir__, 'proper-name-edits-D20922.tsv')
entity_key = 'title:scion'
excluded_ids = %w[33884 40025]

def table(path)
  CSV.read(path, headers: true, col_sep: "\t", encoding: 'bom|utf-8')
end

occurrences = table(occurrence_path).select { |row| row['entity_key'] == entity_key }
inventory = table(inventory_path).to_h do |row|
  [[row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s], row]
end
raise "expected 149 Scion occurrences, got #{occurrences.length}" unless occurrences.length == 149

manifest = occurrences.map do |occurrence|
  key = [occurrence['resource'], occurrence['ID_Linha'], occurrence['Tipo_Variante'].to_s]
  source = inventory.fetch(key) { raise "missing aligned source row #{key.inspect}" }
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n")
  japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
  chinese = source.fetch('zh_text')
  old = source.fetch('work_text')
  new_text = old.dup

  status, evidence =
    if excluded_ids.include?(occurrence['ID_Linha'])
      [
        'excluded',
        'Lower-case scion means a descendant/heir of the Rathir Kent family, not the religious office. Japanese and Chinese use generic lineage/successor wording; retain the current Korean and exclude this homonym from title:scion.'
      ]
    else
      if occurrence['resource'] == 'base'
        replacement = {
          '1132' => ['후손의 기도서', '사이온(Scion)의 기도서'],
          '3640' => ['후계자의 부적', '사이온(Scion)의 부적'],
          '3980' => ['후계자의 길', '사이온(Scion)의 길']
        }.fetch(occurrence['ID_Linha'])
        raise "unexpected base text at #{key.inspect}" unless new_text == replacement[0]
        new_text = replacement[1]
      else
        new_text.gsub!('사이온(The Scion)', '사이온(Scion)')
        new_text.gsub!('첫 사이온(First Scion)', '첫 사이온(Scion)')
        new_text.gsub!(/(?:후계자|계승자)\(Scion\)/, '사이온(Scion)')
        new_text.gsub!(/(?:스키온|사이언)\(Scion\)/, '사이온(Scion)')

        {
          '43086' => ['이전 후계자보다', '이전 사이온(Scion)보다'],
          '51988' => ['후계자의 수호대(Scion\'s Guard)', '사이온(Scion)의 경비병'],
          '52328' => ['후계자가 되지 못했어', '사이온이 되지 못했어'],
          '54665' => ['새 후계자가 새로운 삶', '새 사이온(Scion)이 새로운 삶'],
          '56966' => ['사이온의 수호', '사이온(Scion)의 경비병'],
          '59362' => ['후계자가 되려면', '사이온이 되려면'],
          '59734' => ['다음 후계자를 뽑았을 때', '다음 사이온을 뽑았을 때'],
          '8580' => ['사이온의 경비병', '사이온(Scion)의 경비병'],
          '50343' => ['사이온의 경비병', '사이온(Scion)의 경비병'],
          '54795' => ['사이온(Scion) 근위대', '사이온(Scion)의 경비병'],
          '23210' => ['- 후계자', '- 사이온(Scion)']
        }.each do |id, (before, after)|
          next unless occurrence['ID_Linha'] == id
          raise "expected contextual text not found at #{key.inspect}" unless new_text.include?(before)
          new_text.sub!(before, after)
        end

        new_text.gsub!(/사이온(?!\()/, '사이온(Scion)')
        new_text.gsub!('사이온(Scion)는', '사이온(Scion)은')
        new_text.gsub!('사이온(Scion)를', '사이온(Scion)을')
        new_text.gsub!('사이온(Scion)가', '사이온(Scion)이')
        new_text.gsub!('사이온(Scion)였', '사이온(Scion)이었')
        new_text.gsub!('사이온(Scion)로', '사이온(Scion)으로')
      end

      context =
        if occurrence['ID_Linha'] == '26150'
          'English explicitly calls the Ljosalfar religious leader the Scion and equates the office with the Justicars’ high priestess.'
        elsif occurrence['ID_Linha'] == '1641'
          'English explicitly identifies the Scion as Gallows End’s spiritual leader.'
        else
          'English context identifies the Akara/Offering religious office or its named holder; Japanese サイオン and Chinese 赛恩/司祭 corroborate the title. Keep successors and generic descendants distinct.'
        end
      ['accepted', "#{context} Standardize the Korean title as 사이온(Scion); preserve distinct officeholders and unrelated successor meanings."]
    end

  status = 'not-an-issue' if status == 'accepted' && old == new_text
  raise "excluded row changed #{key.inspect}" if status == 'excluded' && old != new_text
  {
    'resource' => occurrence['resource'],
    'ID_Linha' => occurrence['ID_Linha'],
    'Tipo_Variante' => occurrence['Tipo_Variante'].to_s,
    'entity_key' => entity_key,
    'status' => status,
    'old' => old,
    'new' => new_text,
    'evidence' => evidence,
    'english' => english,
    'japanese' => japanese,
    'chinese' => chinese,
    'entity_dispositions_json' => JSON.generate(entity_key => status),
    'previous_status' => '',
    'previous_evidence' => ''
  }
end

headers = %w[
  resource ID_Linha Tipo_Variante entity_key status old new evidence english
  japanese chinese entity_dispositions_json previous_status previous_evidence
]
CSV.open(output_path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
  csv << headers
  manifest.each { |row| csv << headers.map { |header| row.fetch(header) } }
end

puts "Wrote #{manifest.length} reviewed Scion rows to #{output_path}"
puts manifest.group_by { |row| row.fetch('status') }.transform_values(&:length).inspect
puts "Accepted edits by resource: #{manifest.select { |row| row['status'] == 'accepted' }.group_by { |row| row['resource'] }.transform_values(&:length).inspect}"
