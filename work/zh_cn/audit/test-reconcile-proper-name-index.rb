#!/usr/bin/env ruby

require_relative 'reconcile-proper-name-index'

row = { 'resource' => 'default', 'ID_Linha' => '1', 'Tipo_Variante' => '',
        'entity_key' => 'person:a', 'korean_current' => 'Final',
        'status' => 'needs-context' }
review = row.merge('old' => 'Old', 'new' => 'Final', 'status' => 'accepted', 'evidence' => 'D-test')
result = reconcile_occurrences([row.dup], [review])
raise 'disposition not retained' unless result[0]['status'] == 'accepted'
begin
  reconcile_occurrences([row.merge('korean_current' => 'Other')], [review])
  raise 'stale review accepted'
rescue RuntimeError => error
  raise unless error.message.start_with?('stale review')
end
begin
  reconcile_occurrences([], [review])
  raise 'orphan review accepted'
rescue RuntimeError => error
  raise unless error.message.start_with?('reviewed occurrence not indexed')
end
reconcile_occurrences([], [review.merge('status' => 'excluded', 'old' => 'Final')])
puts 'PASS: reviewed occurrence reconciliation fixtures'
