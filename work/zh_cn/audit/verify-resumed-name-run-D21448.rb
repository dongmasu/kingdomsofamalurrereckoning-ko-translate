#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
last = Integer(ARGV.fetch(0, '21453'))
baseline = '/private/tmp/ko-translate-backups/20261017/before-proper-name-resume-D21448'
manifests = (21_448..last).map do |d|
  path = File.join(__dir__, "proper-name-edits-D#{d}.tsv")
  if File.file?(path)
    [d, m.table(path).map(&:to_h)]
  elsif d == 21_454 && File.file?(File.join(__dir__, "proper-name-candidate-screen-D21454-#{m::RUN_DATE_COMPACT}.md"))
    nil
  else
    raise "missing completed batch artifact D-#{d}"
  end
end.compact
raise 'no run manifests found' if manifests.empty?
all_reviews = manifests.flat_map(&:last)
edited = all_reviews.select { |row| row['old'] != row['new'] }
integrity = m::RESOURCES.to_h do |resource|
  old_path = File.join(baseline, File.basename(m.csv_path(resource)))
  before = File.binread(old_path)
  after = File.binread(m.csv_path(resource))
  old_rows = ProperNameCellEditor.parse(before)
  new_rows = ProperNameCellEditor.parse(after)
  raise 'headers/order/keys changed' unless old_rows.headers == new_rows.headers &&
    old_rows.map { |row| ProperNameCellEditor.key(row) } ==
      new_rows.map { |row| ProperNameCellEditor.key(row) }
  raise 'BOM/line endings changed' unless before.byteslice(0, 3) == after.byteslice(0, 3) &&
    before.scan(/\r\n|\r|\n/n) == after.scan(/\r\n|\r|\n/n)
  targets = edited.select { |row| row['resource'] == resource }.group_by { |row| ProperNameCellEditor.key(row) }
  old_spans = ProperNameCellEditor.records(before)
  new_spans = ProperNameCellEditor.records(after)
  texto = old_rows.headers.index('Texto')
  restored = after.dup
  new_rows.each_with_index.to_a.reverse_each do |row, ordinal|
    key = ProperNameCellEditor.key(row)
    original = old_rows[ordinal].to_h
    events = targets[key]
    expected = original.merge('Texto' => events ? events.last.fetch('new') : original.fetch('Texto'))
    raise "unaccounted cell change #{resource}/#{key.inspect}" unless row.to_h == expected
    next unless events
    raise 'manifest initial text differs from baseline' unless events.first.fetch('old') == original.fetch('Texto')
    events.each_cons(2) { |a, b| raise 'edit chain text mismatch' unless a['new'] == b['old'] }
    restored[new_spans.fetch(ordinal + 1).fetch(texto)] =
      before.byteslice(old_spans.fetch(ordinal + 1).fetch(texto))
  end
  raise "whole-file inverse failed #{resource}" unless restored == before
  [resource, {
    rows: old_rows.length, changed_cells: targets.length,
    before_sha256: Digest::SHA256.hexdigest(before), after_sha256: Digest::SHA256.hexdigest(after),
    full_inverse_and_non_target_bytes: 'PASS'
  }]
end
old_index = m.table(File.join(baseline, 'proper-name-occurrences.tsv')).map(&:to_h)
current = m.table(m::INDEX).map(&:to_h)
key_for = ->(row) { [row['entity_key'], *m.key(row)] }
original_by_key = old_index.to_h { |row| [key_for.call(row), row] }
expected_prior = original_by_key.transform_values(&:dup)
reviewed_keys = all_reviews.flat_map { |row| row['entity_key'].split('|').map { |entity| [entity, *m.key(row)] } }.uniq
new_keys = current.map { |row| key_for.call(row) } - original_by_key.keys
raise 'unmanifested or missing new occurrence keys' unless
  new_keys.sort == (reviewed_keys - original_by_key.keys).sort
manifests.each do |d, rows|
  rows.each do |review|
    statuses = JSON.parse(review.fetch('entity_dispositions_json'))
    previous_status = JSON.parse(review.fetch('previous_status'))
    previous_evidence = JSON.parse(review.fetch('previous_evidence'))
    statuses.each do |entity, status|
      key = [entity, *m.key(review)]
      prior = expected_prior[key]
      if prior
        raise 'prior status/evidence chain not retained' unless
          previous_status.fetch(entity) == prior.fetch('status') &&
          previous_evidence.fetch(entity) == prior.fetch('evidence')
        prior['status'] = status
        prior['evidence'] = "D-#{d}: #{review.fetch('evidence')}"
      else
        raise 'new occurrence did not start as unreviewed discovery' unless previous_status.fetch(entity) == 'needs-context'
        actual = current.find { |row| key_for.call(row) == key }
        raise 'new occurrence final decision/evidence differs' unless actual &&
          actual['status'] == status && actual['evidence'] == "D-#{d}: #{review.fetch('evidence')}"
      end
    end
  end
end
raise 'duplicate final entity/row keys' unless current.map { |row| key_for.call(row) }.uniq.length == current.length
current_by_key = current.to_h { |row| [key_for.call(row), row] }
expected_prior.each do |key, expected|
  actual = current_by_key.fetch(key)
  raise "unaccounted prior disposition change #{key.inspect}" unless
    expected.reject { |field, _| field == 'korean_current' } ==
      actual.reject { |field, _| field == 'korean_current' }
end
old_holds = old_index.select { |row| row['status'] == 'uncertain' }
old_holds.each do |row|
  actual = current_by_key.fetch(key_for.call(row))
  raise 'earlier reviewed hold changed' unless actual['status'] == row['status'] && actual['evidence'] == row['evidence']
end
old_glossary = m.table(File.join(baseline, 'proper-name-glossary.tsv')).map(&:to_h)
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
by_entity = glossary.to_h { |row| [row['entity_key'], row] }
declared_entities = manifests.flat_map do |d, _rows|
  path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
  File.file?(path) ? m.table(path).map { |row| row['entity_key'] } : []
end
raise 'unmanifested or missing new glossary entities' unless
  (by_entity.keys - old_glossary.map { |row| row['entity_key'] }).sort == declared_entities.sort
old_glossary.each do |row|
  actual = by_entity.fetch(row.fetch('entity_key'))
  raise 'prior glossary canonical/alias altered' unless
    row.reject { |field, _| %w[notes evidence_ids].include?(field) } ==
      actual.reject { |field, _| %w[notes evidence_ids].include?(field) }
end
result = {
  range: "D-21448-D-#{last}", manifests: manifests.length,
  reviewed_distinct_rows: all_reviews.map { |row| m.key(row) }.uniq.length,
  edited_distinct_cells: edited.map { |row| m.key(row) }.uniq.length,
  new_occurrence_keys: current.length - old_index.length,
  new_glossary_entities: glossary.length - old_glossary.length,
  earlier_dispositions_preserved_except_manifest_supersessions: 'PASS',
  earlier_reviewed_holds_preserved: old_holds.length,
  prior_glossary_canonicals_and_aliases_preserved: 'PASS',
  csv_integrity: integrity
}
puts JSON.pretty_generate(result)
