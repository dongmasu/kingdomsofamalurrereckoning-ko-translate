#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-occurrences'

module EdgarShortReferencesD21392
  module_function

  D = 21_392
  ENTITY = 'person:edgar-aron'
  IDS = %w[
    13550 17144 20303 21009 21037 24233 26378 34775
    35382 39873 40639 44983 50519 58407 63461 64536
  ].freeze
  TARGET_KEYS = IDS.map { |id| ['default', id, ''] }.freeze
  EVIDENCE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English links these short Edgar references to the already registered
    Edgar Aron, the Hollowlands mining operator associated with Motus,
    Calovar's relic, the controlled miners and his former facilities.
    Default:17079 explicitly uses both Edgar Aron and Edgar for this person;
    default:8357 identifies his former assistant, and default:26103 identifies
    the mining foreman. Japanese エドガー and Chinese 埃德加 corroborate.
    Use the established full-name stem as 에드거(Edgar), correcting local
    에드가 spelling without expanding the English short form to the full name.
    Preserve existing Korean omissions, including the second Edgar mention
    in default:63461; do not insert an English-derived sentence or name.
    The separate prince Edgar Aelforas at default:14764 is not this person.
    The 39 existing full-name entity/key decisions are preserved; other
    entities already reviewed in these rows are not reopened or recounted.
    Official Korean manual PDF p. 7 provides quest context, not this name.
    No global English alias is added.
  TEXT

  def transform(text)
    raise 'no Edgar Korean span' unless text.match?(/에드(?:거|가)/)

    text.gsub(/에드(?:거|가)(?:\s*\(Edgar\))?/, '에드거(Edgar)')
  end

  def plan
    m = ReviewedNameBatches
    inventory = m.refresh_inventory
    glossary_table = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    entity = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'unexpected Edgar canonical' unless entity &&
      entity['korean_canonical'] == '에드거 아론(Edgar Aron)' &&
      entity['english_aliases'].to_s.empty?

    generated = build_occurrences(
      inventory.values, [entity.merge('english_aliases' => 'Edgar')]
    ).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    raise 'unexpected Edgar source coverage' unless generated.length == 56
    index_table = m.table(m::INDEX)
    index = index_table.map(&:to_h)
    prior = index.select { |row| row['entity_key'] == ENTITY }
    raise 'unexpected prior full-name count' unless prior.length == 39
    raise 'prior full-name disposition is not terminal' unless prior.all? do |row|
      %w[accepted not-an-issue excluded uncertain].include?(row['status'])
    end
    prior_keys = prior.map { |row| m.key(row) }
    outside = generated.reject { |row| prior_keys.include?(m.key(row)) }
    other_person = ['default', '14764', '']
    raise 'unexpected Edgar homonym scope' unless
      outside.map { |row| m.key(row) }.sort == (TARGET_KEYS + [other_person]).sort
    occurrences = outside.reject { |row| m.key(row) == other_person }
    reviews = occurrences.sort_by { |row| row['ID_Linha'].to_i }.map do |row|
      key = m.key(row)
      source = inventory.fetch(key)
      english = JSON.parse(source['en_texts_json']).compact.join("\n")
      raise 'unexpected short Edgar source' unless english.match?(/\bEdgar\b/) &&
        !english.match?(/\bEdgar (?:Aron|Aelforas)\b/)
      old = source.fetch('work_text')
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => 'accepted',
        'old' => old, 'new' => transform(old), 'evidence' => EVIDENCE,
        'english' => english,
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
        'chinese' => source['zh_text'],
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
      }
    end
    raise 'unexpected unchanged Edgar cell' unless reviews.all? { |row| row['old'] != row['new'] }
    {
      m: m, glossary_table: glossary_table, glossary: glossary, entity: entity,
      index_table: index_table, index: index, occurrences: occurrences,
      reviews: reviews, prior: prior
    }
  end

  def run
    result = plan
    m = result.fetch(:m)
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    entity = result.fetch(:entity)
    entity['korean_variants'] = (
      entity['korean_variants'].to_s.split('|') + %w[에드거 에드가]
    ).uniq.join('|')
    entity['evidence_ids'] = (
      entity['evidence_ids'].to_s.split('|') + ["D-#{D}"] +
      IDS.map { |id| "default:#{id}" }
    ).uniq.join('|')
    entity['notes'] += ' D-21392 reviewed 16 exact short-name references as 에드거(Edgar); no global alias and no Edgar Aelforas identity merge.'
    index = result.fetch(:index) + result.fetch(:occurrences)
    index.sort_by! { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante'].to_s, row['entity_key']] }
    m.write_table(m::INDEX, result.fetch(:index_table).headers, index)
    m.write_table(File.join(__dir__, 'proper-name-glossary.tsv'),
                  result.fetch(:glossary_table).headers, result.fetch(:glossary))
    proposal = '/private/tmp/proper-name-edits-D21392-proposal.tsv'
    raise 'proposal already exists' if File.exist?(proposal)
    m.write_table(proposal, m::HEADERS.take(12), result.fetch(:reviews))
    m.run(proposal, D, 1)
  end
end

EdgarShortReferencesD21392.run if $PROGRAM_NAME == __FILE__
