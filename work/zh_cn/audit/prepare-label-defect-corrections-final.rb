#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'

source = ReviewedNameBatches.table(File.join(__dir__, 'proper-name-reviewed-label-defects-final.tsv'))
headers = ReviewedNameBatches::HEADERS
reviews = source.map do |row|
  status = case row.fetch('status')
           when 'confirmed-defect' then 'accepted'
           when 'hold-unsafe' then 'uncertain'
           else raise "unexpected defect disposition #{row['status']}"
           end
  new_text = status == 'accepted' ? row.fetch('new') : row.fetch('old')
  raise "unsafe hold must not propose an edit #{row['resource']}:#{row['ID_Linha']}" if
    status == 'uncertain' && new_text != row.fetch('old')
  entities = row.fetch('entity_key').split('|')
  {
    'resource' => row.fetch('resource'),
    'ID_Linha' => row.fetch('ID_Linha'),
    'Tipo_Variante' => row['Tipo_Variante'].to_s,
    'entity_key' => row.fetch('entity_key'),
    'status' => status,
    'old' => row.fetch('old'),
    'new' => new_text,
    'evidence' => row.fetch('evidence'),
    'entity_dispositions_json' => JSON.generate(entities.to_h { |entity| [entity, status] })
  }
end
output = File.join(__dir__, 'proper-name-reviewed-label-defects-corrections.tsv')
ReviewedNameBatches.write_table(output, headers, reviews)
puts "Prepared #{reviews.length} explicit defect dispositions: #{reviews.group_by { |r| r['status'] }.transform_values(&:length)}"
