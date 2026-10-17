#!/usr/bin/env ruby

require 'csv'
require_relative 'continue-proper-name-reviewed-batches'

module MergeScionOccurrencesD20922
  extend self

  M = ReviewedNameBatches
  GENERATED = '/private/tmp/proper-name-occurrences-post-D20922.tsv'
  MANIFEST = File.join(__dir__, 'proper-name-edits-D20922.tsv')
  ENTITY = 'title:scion'
  MANUAL = %w[10747 27523 42674 49434 57733].freeze

  def key(row)
    [row.fetch('entity_key'), row.fetch('resource'),
     row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def run
    active = M.table(M::INDEX).map(&:to_h)
    generated = M.table(GENERATED).map(&:to_h)
    reviews = M.table(MANIFEST).map(&:to_h)
    inventory = M.table('/private/tmp/proper-name-source-inventory-post-D20922.tsv')
                  .to_h { |row| [M.key(row), row.to_h] }
    raise 'duplicate active index key' unless active.map { |row| key(row) }.uniq.length == active.length
    raise 'duplicate generated index key' unless generated.map { |row| key(row) }.uniq.length == generated.length

    active_by_key = active.to_h { |row| [key(row), row] }
    generated_by_key = generated.to_h { |row| [key(row), row] }
    active_keys = active_by_key.keys
    generated_keys = generated_by_key.keys
    absent = active_keys - generated_keys
    expected_absent = MANUAL.map { |id| ['faction:house-anwon', 'default', id, ''] }
    raise "unexpected source/index residuals: #{absent.inspect}" unless absent.sort == expected_absent.sort

    additions = generated_keys - active_keys
    raise 'unexpected new entity matches' unless
      additions.length == 149 && additions.all? { |row_key| row_key.first == ENTITY }
    raise 'unexpected Scion source keys in manifest' unless
      reviews.map { |row| [row['entity_key'], row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s] }.sort == additions.sort

    reviews_by_key = reviews.to_h do |review|
      [[review.fetch('entity_key'), review.fetch('resource'),
        review.fetch('ID_Linha'), review['Tipo_Variante'].to_s], review]
    end
    raise 'duplicate Scion review key' unless reviews_by_key.length == reviews.length

    merged = generated.map do |candidate|
      candidate_key = key(candidate)
      if active_by_key.key?(candidate_key)
        previous = active_by_key.fetch(candidate_key)
        raise "existing disposition changed #{candidate_key.inspect}" unless
          %w[accepted not-an-issue excluded uncertain].include?(previous['status'])
        previous.merge('korean_current' => candidate.fetch('korean_current'))
      else
        review = reviews_by_key.fetch(candidate_key)
        candidate.merge(
          'status' => review.fetch('status'),
          'evidence' => "D-20922: #{review.fetch('evidence')}"
        )
      end
    end

    absent.each do |row_key|
      previous = active_by_key.fetch(row_key)
      source_key = [previous.fetch('resource'), previous.fetch('ID_Linha'),
                    previous['Tipo_Variante'].to_s]
      current = inventory.fetch(source_key).fetch('work_text')
      raise "stale manual occurrence #{row_key.inspect}" unless
        current == previous.fetch('korean_current')
      merged << previous
    end

    merged.sort_by! do |row|
      [row.fetch('resource'), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end
    raise 'merged occurrence count mismatch' unless merged.length == active.length + additions.length
    M.write_table(M::INDEX, M.table(M::INDEX).headers, merged)
    puts "Preserved #{active.length} existing rows and added #{additions.length} Scion rows."
    puts "Retained #{absent.length} documented contextual Anwon-family rows without duplication."
    puts merged.group_by { |row| row.fetch('status') }.transform_values(&:length).inspect
  end
end

MergeScionOccurrencesD20922.run if $PROGRAM_NAME == __FILE__
