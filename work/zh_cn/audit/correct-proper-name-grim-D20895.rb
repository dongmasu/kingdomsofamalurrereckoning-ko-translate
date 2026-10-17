#!/usr/bin/env ruby

require 'digest'
require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
root = m::ROOT
manifest_path = File.join(__dir__, 'proper-name-edits-D20895.tsv')
correction_path = File.join(__dir__, 'proper-name-correction-D20895.tsv')
raise 'correction artifacts already exist' if File.exist?(correction_path)

reviews_table = m.table(manifest_path)
reviews = reviews_table.map(&:to_h)
target = reviews.find { |row| row['resource'] == 'default' && row['ID_Linha'] == '8975' }
raise 'D-20895 correction target missing or unexpected' unless
  target && target['status'] == 'accepted' &&
  target['new'].include?('그림(Grim)(Grim)')

current_text = ProperNameCellEditor.parse(File.binread(m.csv_path('default'))).find do |row|
  row['ID_Linha'] == '8975' && row['Tipo_Variante'].to_s.empty?
end&.fetch('Texto')
raise 'active correction target differs from reviewed output' unless current_text == target['new']

corrected_text = target['old'].gsub('그라임', '그림(Grim)')
raise 'corrected output is not the intended canonical form' unless
  corrected_text.include?('그림(Grim)이 찾는') &&
  !corrected_text.include?('(Grim)(Grim)')

correction = m::HEADERS.to_h { |header| [header, ''] }
correction.merge!(
  'resource' => 'default',
  'ID_Linha' => '8975',
  'Tipo_Variante' => '',
  'entity_key' => 'person:grim',
  'status' => 'accepted',
  'old' => current_text,
  'new' => corrected_text,
  'evidence' => 'D-20895 correction: remove the duplicate (Grim) introduced while replacing the prior misspelling 그라임; retain exactly 그림(Grim).',
  'english' => target['english'],
  'japanese' => target['japanese'],
  'chinese' => target['chinese'],
  'entity_dispositions_json' => JSON.generate('person:grim' => 'accepted'),
  'previous_status' => JSON.generate('person:grim' => 'accepted'),
  'previous_evidence' => JSON.generate('person:grim' => target['evidence'])
)
m.write_table(correction_path, m::HEADERS, [correction])

correction_backup = '/private/tmp/ko-translate-backups/20261015/correction-proper-name-D20895'
correction_checks = ProperNameCellEditor.apply(root, correction_path, correction_backup, m.hashes)
correction_verify = m.command!(
  'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
  '--review', correction_path, '--backup-dir', correction_backup
)

target['new'] = corrected_text
m.write_table(manifest_path, reviews_table.headers, reviews)
primary_backup = '/private/tmp/ko-translate-backups/20261015/before-proper-name-D20895'
primary_verify = m.command!(
  'ruby', File.join(__dir__, 'verify-proper-name-edits.rb'),
  '--review', manifest_path, '--backup-dir', primary_backup
)
inventory = m.refresh_inventory
raise 'corrected target absent from refreshed inventory' unless
  inventory.fetch(['default', '8975', ''])['work_text'] == corrected_text

primary_check = {
  resource: 'default',
  cells: reviews.count { |row| row['resource'] == 'default' && row['status'] == 'accepted' },
  before_sha256: Digest::SHA256.file(File.join(primary_backup, File.basename(m.csv_path('default')))).hexdigest,
  after_sha256: m.hashes.fetch('default'),
  backup: File.join(primary_backup, File.basename(m.csv_path('default')))
}
m.checkpoint(20895, reviews, [primary_check], primary_verify, inventory)

note = <<~TEXT

## Immediate Correction

The first D-20895 write duplicated `(Grim)` at `default:8975` while replacing
the prior misspelling `그라임`. The cell was corrected to exactly
`그림(Grim)`. The correction manifest is
`proper-name-correction-D20895.tsv`; its byte-identical pre-correction backup
is `#{correction_checks.first.fetch(:backup)}`. Validation: #{correction_verify.strip}
The full D-20895 result was re-verified against its original pre-edit backup:
#{primary_verify.strip}
TEXT
%w[named-scope-review-D20895-20261015.md named-scope-edit-addendum-D20895-20261015.md].each do |filename|
  File.open(File.join(__dir__, filename), 'a') { |file| file.write(note) }
end

puts "Corrected default:8975; active default SHA-256 #{m.hashes.fetch('default')}"
