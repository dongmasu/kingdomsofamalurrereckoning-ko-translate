#!/usr/bin/env ruby

require 'csv'
require 'json'
require 'optparse'
require_relative 'proper-name-cell-editor'
require_relative 'build-proper-name-inventory'

options = { expected: {} }
OptionParser.new do |parser|
  parser.on('--proposals PATH') { |path| options[:proposals] = path }
  parser.on('--out PATH') { |path| options[:out] = path }
  parser.on('--backup-dir PATH') { |path| options[:backup] = path }
  parser.on('--expected RESOURCE:HASH') do |value|
    resource, hash = value.split(':', 2)
    raise 'invalid expected hash' unless RESOURCES.include?(resource) && hash.to_s.match?(/\A[0-9a-f]{64}\z/)
    options[:expected][resource] = hash
  end
  parser.on('--apply') { options[:apply] = true }
  parser.on('--expand-person-families') { options[:expand] = true }
  parser.on('--approve-reviewed') { options[:approved] = true }
end.parse!
abort 'need --proposals and --out' unless options[:proposals] && options[:out] && ARGV.empty?
root = File.expand_path('../../..', __dir__)
out = ProperNameCandidates.safe_output(options[:out], [options[:proposals]])
abort 'manifest must be in audit' unless out.start_with?(File.realpath(__dir__) + '/')
if options[:apply]
  abort 'need backup directory under /private/tmp/ko-translate-backups' unless
    options[:backup] && File.expand_path(options[:backup]).start_with?('/private/tmp/ko-translate-backups/')
end
inventory = CSV.read('/private/tmp/proper-name-source-inventory.tsv', headers: true, col_sep: "\t")
aligned = inventory.group_by { |row| [row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s] }
proposals = CSV.read(options[:proposals], headers: true, col_sep: "\t")
rows = {}
glossary = CSV.read(File.join(__dir__, 'proper-name-glossary.tsv'), headers: true, col_sep: "\t")
entities = glossary.to_h { |entity| [entity['entity_key'], entity] }
proposals.each do |proposal|
  row = proposal.to_h
  row['status'] = 'accepted' if row['status'] == 'proposed' && options[:approved]
  key = [row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s]
  raise "invalid disposition #{row['status']}" unless %w[accepted not-an-issue excluded uncertain].include?(row['status'])
  if rows.key?(key)
    previous = rows[key]
    raise "conflicting duplicate proposal #{key.inspect}" unless
      %w[old new status].all? { |field| previous[field] == row[field] }
    previous['entity_key'] = (previous['entity_key'].split('|') | row['entity_key'].split('|')).join('|')
    next
  end
  sources = aligned.fetch(key)
  raise "ambiguous inventory #{key.inspect}" unless sources.length == 1
  source = sources.first
  raise "stale proposal #{key.inspect}" unless source['work_text'] == row['old']
  raise "unrecorded proposal change #{key.inspect}" if row['old'] != row['new'] && row['status'] != 'accepted'
  raise "accepted no-op #{key.inspect}" if row['status'] == 'accepted' && row['old'] == row['new']
  raise "duplicate parentheses #{key.inspect}" if row['new'].match?(/\([A-Za-z ]+\)\([A-Za-z ]+\)/)
  row['english'] = JSON.parse(source['en_texts_json']).join("\n---\n")
  row['japanese'] = JSON.parse(source['ja_texts_json']).join("\n---\n")
  row['chinese'] = source['zh_text']
  if options[:expand] && row['status'] != 'excluded'
    person_entities = glossary.select { |entity| entity['category'] == 'person' }
    reviewed_entities = row['entity_key'].split('|').map { |entity_key| entities.fetch(entity_key) }
    parent_terms = reviewed_entities.map { |entity| entity['english_canonical'] }
    person_entities.each do |entity|
      full_name = entity['english_canonical']
      next unless parent_terms.any? { |term| full_name.match?(/\b#{Regexp.escape(term)}\b/i) } && full_name.include?(' ')
      terms = [full_name, *entity['english_aliases'].to_s.split('|')]
      next unless terms.any? { |term| row['english'].match?(/\b#{Regexp.escape(term)}\b/i) }
      row['entity_key'] = (row['entity_key'].split('|') | [entity['entity_key']]).join('|')
      components = terms.flat_map { |term| term.scan(/[A-Za-z]+/) }.uniq
      person_entities.each do |component|
        next unless components.any? { |term| component['english_canonical'].casecmp?(term) }
        next unless row['english'].match?(/\b#{Regexp.escape(component['english_canonical'])}\b/i)
        row['entity_key'] = (row['entity_key'].split('|') | [component['entity_key']]).join('|')
      end
    end
  end
  rows[key] = row
end
headers = %w[resource ID_Linha Tipo_Variante entity_key status old new evidence english japanese chinese]
CSV.open(out, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
  csv << headers
  rows.sort_by { |key, _row| [key[0], key[1].to_i, key[2]] }.each do |_key, row|
    csv << headers.map { |header| row[header] }
  end
end
puts "unique reviewed rows=#{rows.length}; #{rows.values.group_by { |row| row['status'] }.transform_values(&:length)}"
if options[:apply]
  puts JSON.pretty_generate(ProperNameCellEditor.apply(root, out, options[:backup], options[:expected]))
end
