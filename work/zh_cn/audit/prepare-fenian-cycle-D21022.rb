#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module FenianCycleD21022
  M = ReviewedNameBatches
  AUDIT = M::AUDIT
  DEFINITION_PATH = File.join(AUDIT, 'proper-name-discovery-definitions-D21022.tsv')
  REVIEW_PATH = File.join(AUDIT, 'proper-name-discovery-D21022.tsv')
  EXPECTED_IDS = %w[27211 34912 51496 54054 57550].freeze
  REPLACEMENTS = {
    '27211' => ['페니안 순환(Fenian Cycle)', '페니안 전설군(Fenian Cycle)'],
    '34912' => ['페니안 서사시의 수호자', '페니안 전설군(Fenian Cycle)의 수호자'],
    '51496' => ['페니안의 주기(Fenian Cycles)', '페니안 전설군(Fenian Cycles)'],
    '54054' => ['페니안 순환(Fenian Cycles)', '페니안 전설군(Fenian Cycles)'],
    '57550' => ['펜니안 전승의 수호자', '페니안 전설군(Fenian Cycle)의 수호자']
  }.freeze
  EVIDENCE = 'The English proper name “Fenian Cycle” denotes the named body of Fenian legends, not the shared Fae Telling or a generic cycle. Japanese フィアナ伝説群 corroborates the legendary-cycle reading; Chinese 芬尼安轮回 is supporting evidence only. Standardize to 페니안 전설군 and pair the source-local singular/plural English form. This focused terminology decision supersedes the earlier uncertain Fenian-cycle terminology only at default:51496 (D-15688), default:54054 (D-16379), and default:57550 (D-17326); all other prior row findings and verse breaks remain untouched.'

  module_function

  def definition
    headers = M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).headers
    {
      'entity_key' => 'lore:fenian-cycle',
      'english_canonical' => 'Fenian Cycle',
      'category' => 'lore term',
      'korean_canonical' => '페니안 전설군(Fenian Cycle)',
      'english_aliases' => 'Fenian Cycles',
      'korean_variants' => '페니안 순환|페니안 서사시|페니안의 주기|페니안 전승|펜니안 전승',
      'evidence_ids' => "D-21022|#{EXPECTED_IDS.map { |id| "default:#{id}" }.join('|')}",
      'status' => 'confirmed',
      'notes' => 'Named body of Fenian legends. English context establishes the proper-name reading; Japanese フィアナ伝説群 corroborates the legendary-cycle sense and Chinese 芬尼安轮回 is supporting only. Canonical Korean form is 페니안 전설군(Fenian Cycle); preserve source-local plural Fenian Cycles when present. Keep this distinct from lore:the-telling and lore:great-cycle.'
    }.slice(*headers)
  end

  def run
    raise 'D-21022 proposal outputs already exist' if
      [DEFINITION_PATH, REVIEW_PATH].any? { |path| File.exist?(path) }
    definitions = [definition]
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    actual_ids = generated.map { |row| row.fetch('ID_Linha') }.sort_by(&:to_i)
    raise "unexpected source matches: #{actual_ids.inspect}" unless actual_ids == EXPECTED_IDS

    reviews = generated.map do |candidate|
      id = candidate.fetch('ID_Linha')
      from, to = REPLACEMENTS.fetch(id)
      old = candidate.fetch('korean_current')
      raise "replacement source missing/ambiguous at default:#{id}" unless old.scan(from).length == 1
      new_text = old.sub(from, to)
      {
        'resource' => candidate.fetch('resource'),
        'ID_Linha' => id,
        'Tipo_Variante' => candidate.fetch('Tipo_Variante'),
        'entity_key' => 'lore:fenian-cycle',
        'status' => 'accepted',
        'old' => old,
        'new' => new_text,
        'evidence' => EVIDENCE,
        'english' => candidate.fetch('english_source'),
        'japanese' => JSON.parse(inventory.fetch([candidate.fetch('resource'), id, candidate.fetch('Tipo_Variante')]).fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => inventory.fetch([candidate.fetch('resource'), id, candidate.fetch('Tipo_Variante')]).fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate('lore:fenian-cycle' => 'accepted')
      }
    end.sort_by { |row| row.fetch('ID_Linha').to_i }
    M.write_table(DEFINITION_PATH, M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).headers, definitions)
    M.write_table(REVIEW_PATH, M::HEADERS, reviews)
    puts "Prepared #{reviews.length} source-aligned Fenian Cycle reviews: #{EXPECTED_IDS.join(', ')}"
    puts "Definitions: #{DEFINITION_PATH}"
    puts "Review manifest: #{REVIEW_PATH}"
  end
end

FenianCycleD21022.run if $PROGRAM_NAME == __FILE__
