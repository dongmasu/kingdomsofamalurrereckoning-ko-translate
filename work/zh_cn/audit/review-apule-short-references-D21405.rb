#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-occurrences'

module ApuleShortReferencesD21405
  module_function

  D = 21_405
  ENTITY = 'person:apule-vire'
  CANONICAL = '아풀레(Apule)'
  KEYS = %w[
    5632 11133 13314 16723 17079 24803 26470 28208 54477 59030 61369
  ].map { |id| ['default', id, ''] }.freeze
  SHORT_NAME = /(?:아풀레|아풀|아퓰)(?:\(Apule\))?/
  EVIDENCE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:17079 identifies Apule as the Motus Foreman; default:13314
    and 11133 connect him to the miners and Canyon Hill Mine. The ten
    already-terminal Apule Vire rows identify this same person. Japanese
    アプール and Chinese 阿普勒 corroborate the short form, while the full
    forms アプール・ヴィール and 阿普勒·维莱 support the registered
    canonical 아풀레 비르(Apule Vire). Standardize only these 11 additional
    source-local short references to 아풀레(Apule), correcting 아풀/아퓰
    spellings and particles where needed. Do not add a global Apule alias or
    reopen the ten terminal full-name keys. All active affix/base/default
    resources were checked; only default has applicable short references.
    The official Korean manual does not identify this individual; that
    omission does not override the aligned source evidence.
  TEXT

  def transform(text)
    raise 'full-name span is outside this short-reference scope' if
      text.match?(/아풀레 비르\(Apule Vire\)/)
    raise 'missing reviewed Apule short span' unless text.match?(SHORT_NAME)

    normalized = text.gsub(/#{SHORT_NAME.source}과/, '아풀레(Apule)와')
    normalized = normalized.gsub(SHORT_NAME, CANONICAL)
    raise 'Apule canonical label missing after transform' unless normalized.include?(CANONICAL)

    normalized
  end

  def plan
    m = ReviewedNameBatches
    inventory = m.refresh_inventory
    glossary_table = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    entity = glossary.find { |row| row['entity_key'] == ENTITY }
    raise "missing confirmed entity #{ENTITY}" unless entity &&
      entity['english_canonical'] == 'Apule Vire' &&
      entity['korean_canonical'] == '아풀레 비르(Apule Vire)' &&
      entity['english_aliases'].to_s.empty?

    index_table = m.table(m::INDEX)
    index = index_table.map(&:to_h)
    old_keys = index.to_h { |row| [[row['entity_key'], *m.key(row)], row] }
    generated = build_occurrences(
      inventory.values, [entity.merge('english_aliases' => 'Apule')]
    ).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    occurrences = generated.reject { |row| old_keys.key?([ENTITY, *m.key(row)]) }
    raise "unexpected new Apule short-form keys: #{occurrences.map { |r| m.key(r) }.inspect}" unless
      occurrences.map { |row| m.key(row) }.sort == KEYS.sort

    terminal_full_names = generated.select do |row|
      old_keys.key?([ENTITY, *m.key(row)])
    end
    raise 'expected ten already-terminal Apule Vire rows' unless terminal_full_names.length == 10
    terminal_full_names.each do |row|
      prior = old_keys.fetch([ENTITY, *m.key(row)])
      raise "non-terminal full-name key #{m.key(row).inspect}" unless
        %w[accepted not-an-issue].include?(prior['status'])
    end

    reviews = occurrences.map do |occurrence|
      key = m.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = transform(old)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => EVIDENCE,
        'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
        'chinese' => source['zh_text'],
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    raise 'unexpected Apule short-reference edit count' unless
      reviews.count { |row| row['old'] != row['new'] } == 9
    {
      m: m, glossary_table: glossary_table, glossary: glossary, entity: entity,
      index_table: index_table, index: index, occurrences: occurrences, reviews: reviews
    }
  end

  def run
    result = plan
    m = result.fetch(:m)
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)

    entity = result.fetch(:entity)
    entity['evidence_ids'] = (
      entity.fetch('evidence_ids').to_s.split('|') + ["D-#{D}"] +
      KEYS.map { |resource, id, _variant| "#{resource}:#{id}" }
    ).uniq.join('|')
    entity['notes'] += " D-#{D}: reviewed 11 source-local Apule short references against the established Apule Vire identity; no global short-name alias was added."
    index = result.fetch(:index) + result.fetch(:occurrences)
    index.sort_by! do |row|
      [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i,
       row['Tipo_Variante'].to_s, row['entity_key']]
    end
    m.write_table(m::INDEX, result.fetch(:index_table).headers, index)
    m.write_table(File.join(__dir__, 'proper-name-glossary.tsv'),
                  result.fetch(:glossary_table).headers, result.fetch(:glossary))
    proposal = '/private/tmp/proper-name-edits-D21405-proposal.tsv'
    raise 'Apule proposal already exists' if File.exist?(proposal)
    m.write_table(proposal, m::HEADERS.take(12), result.fetch(:reviews))
    m.run(proposal, D, 1)
  end
end

ApuleShortReferencesD21405.run if $PROGRAM_NAME == __FILE__
