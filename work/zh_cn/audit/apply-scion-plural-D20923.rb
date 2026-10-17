#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module ApplyScionPluralD20923
  extend self

  M = ReviewedNameBatches
  D = 20_923
  MANIFEST = File.join(__dir__, 'proper-name-edits-D20923.tsv')
  BACKUP = '/private/tmp/ko-translate-backups/20261015/before-proper-name-D20923'

  def run
    reviews = M.table(MANIFEST).map(&:to_h)
    raise 'expected six reviewed Scions rows' unless reviews.length == 6
    raise 'unexpected target/status' unless reviews.all? do |row|
      row['entity_key'] == 'title:scion' && row['resource'] == 'default' &&
        %w[accepted not-an-issue].include?(row['status'])
    end

    index = M.table(M::INDEX)
    title_keys = index.select { |row| row['entity_key'] == 'title:scion' }
      .map { |row| M.key(row) }
    new_keys = reviews.map { |row| M.key(row) }
    raise 'duplicate review keys' unless new_keys.uniq.length == new_keys.length
    raise 'Scions row already indexed' unless (title_keys & new_keys).empty?
    raise 'unexpected pre-edit index count' unless index.length == 26_022

    checks = ProperNameCellEditor.apply(M::ROOT, MANIFEST, BACKUP, M.hashes)
    verify_output = M.command!(
      'ruby', File.join(M::AUDIT, 'verify-proper-name-edits.rb'),
      '--review', MANIFEST, '--backup-dir', BACKUP
    )
    inventory = M.refresh_inventory
    reviews.each do |review|
      raise "post-edit mismatch #{M.key(review).inspect}" unless
        inventory.fetch(M.key(review)).fetch('work_text') == review.fetch('new')
    end

    additions = reviews.map do |review|
      source = inventory.fetch(M.key(review))
      {
        'entity_key' => 'title:scion',
        'resource' => review.fetch('resource'),
        'ID_Linha' => review.fetch('ID_Linha'),
        'Tipo_Variante' => review['Tipo_Variante'].to_s,
        'matched_english' => 'Scions',
        'english_source' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n"),
        'korean_current' => source.fetch('work_text'),
        'status' => review.fetch('status'),
        'evidence' => "D-#{D}: #{review.fetch('evidence')}"
      }
    end
    merged = index.map(&:to_h) + additions
    merged.sort_by! do |row|
      [row.fetch('resource'), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end
    raise 'occurrence count mismatch' unless merged.length == 26_028
    M.write_table(M::INDEX, index.headers, merged)

    M.checkpoint(D, reviews, checks, verify_output, inventory)
    puts "Added #{additions.length} Scions title occurrences without changing prior dispositions."
  end
end

ApplyScionPluralD20923.run if $PROGRAM_NAME == __FILE__
