#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'

def verify_manifest_chain(key, proposal, current, history)
  origin = history.index { |entry| entry['new'] == proposal }
  raise "proposal has no exact edit-manifest origin: #{key.inspect}" unless origin

  chain = history[origin..].each_with_index.map do |entry, index|
    entry.merge('relation' => index.zero? ? 'proposal-origin' : 'superseding-edit')
  end
  state = chain.first.fetch('new')
  chain.drop(1).each do |entry|
    unless entry['old'] == state
      raise "broken edit-manifest chain for #{key.inspect} at #{entry['manifest']}: " \
            "expected old #{state.inspect}, got #{entry['old'].inspect}"
    end
    state = entry['new']
  end
  raise "edit-manifest chain does not reach current text for #{key.inspect}" unless state == current

  chain
end

if $PROGRAM_NAME == __FILE__
  m = ReviewedNameBatches
  inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
  index = m.table(m::INDEX).to_h { |row| [[row['entity_key'], *m.key(row)], row.to_h] }
  proposals = m.table(File.join(__dir__, 'proper-name-reviewed-glossary-pending.tsv'))
  divergent_keys = proposals.each_with_object({}) do |proposal, keys|
    key = m.key(proposal)
    keys[key] = true if inventory.fetch(key).fetch('work_text') != proposal['new']
  end
  manifest_paths = Dir.glob(File.join(__dir__, 'proper-name-edits-D*.tsv'))
    .map { |path| [path, Integer(File.basename(path)[/D(\d+)\.tsv\z/, 1])] }
    .sort_by { |path, batch| [batch, path] }
  raise 'duplicate edit-manifest batch number' unless
    manifest_paths.map(&:last).uniq.length == manifest_paths.length

  manifest_history = Hash.new { |history, key| history[key] = [] }
  manifest_paths.each do |path, batch|
    seen_keys = {}
    m.table(path).each do |entry|
      key = m.key(entry)
      next unless divergent_keys[key]
      raise "duplicate row key in #{File.basename(path)}: #{key.inspect}" if seen_keys[key]

      seen_keys[key] = true
      manifest_history[key] << {
        'batch' => batch, 'manifest' => File.basename(path),
        'entity_key' => entry.fetch('entity_key'),
        'old' => entry.fetch('old'), 'new' => entry.fetch('new')
      }
    end
  end

  rows = proposals.map do |proposal|
    key = m.key(proposal)
    source = inventory.fetch(key)
    entities = proposal['entity_key'].split('|')
    current = source.fetch('work_text')
    chain = if current == proposal['new']
              []
            else
              verify_manifest_chain(key, proposal['new'], current, manifest_history.fetch(key))
            end
    state = chain.empty? ? 'proposal-exact' : 'historical-proposal-superseded'
    entity_records = entities.to_h do |entity|
      occurrence = index.fetch([entity, *key])
      raise "unreviewed indexed proposal #{entity}: #{key.inspect}" if
        occurrence['status'] == 'needs-context'
      [entity, occurrence.slice('status', 'evidence')]
    end
    {
      'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
      'entity_key' => proposal['entity_key'], 'historical_status' => proposal['status'],
      'proposal' => proposal['new'], 'korean_current' => current,
      'reconciliation' => state,
      'manifest_chain_json' => JSON.generate(chain),
      'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
      'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
      'chinese' => source['zh_text'],
      'current_entity_records_json' => JSON.generate(entity_records)
    }
  end
  headers = rows.first.keys
  out = File.join(__dir__, 'proper-name-pending-reconciliation-final.tsv')
  m.write_table(out, headers, rows)
  puts "Historical proposal rows: #{rows.length}"
  puts "Historical states: #{rows.group_by { |row| row['historical_status'] }.transform_values(&:length)}"
  puts "Active comparisons: #{rows.group_by { |row| row['reconciliation'] }.transform_values(&:length)}"
  puts "Constituent entity keys: #{rows.sum { |row| row['entity_key'].split('|').length }}; all indexed"
  puts "Verified proposal-origin manifests: #{rows.count { |row| row['reconciliation'] == 'historical-proposal-superseded' }}"
  puts "Verified subsequent edit transitions: #{rows.sum { |row| [JSON.parse(row['manifest_chain_json']).length - 1, 0].max }}"
  rows.select { |row| row['reconciliation'] != 'proposal-exact' }.each do |row|
    chain = JSON.parse(row['manifest_chain_json'])
    puts JSON.generate(row.slice('resource', 'ID_Linha', 'entity_key', 'reconciliation')
      .merge('manifest_batches' => chain.map { |entry| entry['batch'] }))
  end
  puts "CSV and occurrence index unchanged; reconciliation snapshot: #{out}"
end
