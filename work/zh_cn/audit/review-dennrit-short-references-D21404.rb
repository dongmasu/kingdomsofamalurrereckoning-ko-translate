#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-occurrences'

module DennritShortReferencesD21404
  module_function

  D = 21_404
  ENTITY = 'person:dennrit-rond'
  CANONICAL = '덴릿(Dennrit)'
  KEYS = %w[
    9513 10196 15921 21427 30710 32766 32939 32981 33847 40646
    47793 48563 8184 54214 54242 62729 64189
  ].map { |id| ['default', id, ''] }.freeze
  SHORT_NAME = /(?:데른릿|덴리트|덴릿)(?:\(Dennrit\))?/
  EVIDENCE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:2729 establishes Dennrit Rond as Alrette's husband and
    co-owner of Rond Farm; the nine already-terminal full-name references
    identify the same person. These 17 additional rows use the short English
    form Dennrit in the same husband, farm, madness, recovery, and death
    storyline. Japanese デンリット and Chinese 丹里特 corroborate the short
    name. Reuse the established full-name stem and standardize only these
    source-local short references to 덴릿(Dennrit), correcting 데른릿 and
    덴리트 variants and the subject particle at default:33847/default:48563.
    Do not add a global Dennrit alias or reopen the nine terminal full-name
    keys. All active affix/base/default resources were checked; only default
    has these short-form matches. The official Korean manual has no entry for
    this individual, and that omission does not change the source evidence.
  TEXT

  def transform(text)
    raise 'short form overlaps a full-name label' if text.match?(/덴릿 론드\(Dennrit Rond\)/)
    raise 'missing reviewed Dennrit short span' unless text.match?(SHORT_NAME)

    normalized = text.gsub(/#{SHORT_NAME.source}는/, '덴릿(Dennrit)은')
    normalized = normalized.gsub(SHORT_NAME, CANONICAL)
    raise 'Dennrit canonical label missing after transform' unless normalized.include?(CANONICAL)

    normalized
  end

  def plan
    m = ReviewedNameBatches
    inventory = m.refresh_inventory
    glossary_table = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    entity = glossary.find { |row| row['entity_key'] == ENTITY }
    raise "missing confirmed entity #{ENTITY}" unless entity &&
      entity['english_canonical'] == 'Dennrit Rond' &&
      entity['korean_canonical'] == '덴릿 론드(Dennrit Rond)' &&
      entity['english_aliases'].to_s.empty?

    index_table = m.table(m::INDEX)
    index = index_table.map(&:to_h)
    old_keys = index.to_h { |row| [[row['entity_key'], *m.key(row)], row] }
    generated = build_occurrences(
      inventory.values, [entity.merge('english_aliases' => 'Dennrit')]
    ).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    occurrences = generated.reject { |row| old_keys.key?([ENTITY, *m.key(row)]) }
    raise "unexpected new Dennrit short-form keys: #{occurrences.map { |r| m.key(r) }.inspect}" unless
      occurrences.map { |row| m.key(row) }.sort == KEYS.sort

    terminal_full_names = generated.select do |row|
      old_keys.key?([ENTITY, *m.key(row)])
    end
    raise 'expected nine already-terminal full-name rows' unless terminal_full_names.length == 9
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
    raise 'unexpected Dennrit short-form edit count' unless
      reviews.count { |row| row['old'] != row['new'] } == 12
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
    entity['notes'] += " D-#{D}: reviewed 17 source-local Dennrit short references against the established Dennrit Rond identity; no global short-name alias was added."
    index = result.fetch(:index) + result.fetch(:occurrences)
    index.sort_by! do |row|
      [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i,
       row['Tipo_Variante'].to_s, row['entity_key']]
    end
    m.write_table(m::INDEX, result.fetch(:index_table).headers, index)
    m.write_table(File.join(__dir__, 'proper-name-glossary.tsv'),
                  result.fetch(:glossary_table).headers, result.fetch(:glossary))
    proposal = '/private/tmp/proper-name-edits-D21404-proposal.tsv'
    raise 'Dennrit proposal already exists' if File.exist?(proposal)
    m.write_table(proposal, m::HEADERS.take(12), result.fetch(:reviews))
    m.run(proposal, D, 1)
  end
end

DennritShortReferencesD21404.run if $PROGRAM_NAME == __FILE__
