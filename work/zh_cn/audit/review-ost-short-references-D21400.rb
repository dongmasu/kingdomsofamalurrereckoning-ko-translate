#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-occurrences'

module OstShortReferencesD21400
  module_function

  D = 21_400
  ENTITY = 'person:ost-ordura'
  KEYS = %w[4388 4439].map { |id| ['base', id, '11'] } +
    %w[
      10183 12194 14053 17277 17737 18684 19165 21564 27238 33371
      35519 38091 40277 41226 41982 42543 44466 46233 46747 50833
      51098 52088 58283 62039
    ].map { |id| ['default', id, ''] }
  EVIDENCE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English full-name default:13101/13724 and the surrounding Warsworn
    patrol, Niskaru, death and commendation storyline identify the same
    Ost Ordura referred to as Ost at default:21564/35519/62039. Japanese
    オースト and Chinese 欧斯特 corroborate. Reuse the established full-name
    stem オースト rendered 오스트, pairing only existing short references
    as 오스트(Ost). Retain the ownership labels Ost's Helm and Ost's
    Commendation as person references, not global aliases or new assertions
    about item rarity. Preserve the literal PH - prefix at default:58283.
    All three active and aligned source resources were searched; no affix
    match. Official Korean manual PDF p. 7 establishes the Warsworn faction
    background, not this person's spelling. Existing full-name and other
    entity/key decisions remain untouched; no global Ost/Ordura alias.
  TEXT

  def transform(text)
    raise 'missing short Ost span' unless text.match?(/오스트/)
    text.gsub(/오스트(?:\(Ost\))?/, '오스트(Ost)')
  end

  def plan
    m = ReviewedNameBatches
    inventory = m.refresh_inventory
    glossary_table = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    entity = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'unexpected Ost canonical/alias' unless entity &&
      entity['korean_canonical'] == '오스트 오르두라(Ost Ordura)' &&
      entity['english_aliases'].to_s.empty?
    index_table = m.table(m::INDEX)
    index = index_table.map(&:to_h)
    old_keys = index.to_h { |row| [[row['entity_key'], *m.key(row)], row] }
    generated = build_occurrences(
      inventory.values, [entity.merge('english_aliases' => 'Ost')]
    ).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    occurrences = generated.reject { |row| old_keys.key?([ENTITY, *m.key(row)]) }
    raise 'unexpected new Ost source coverage' unless
      occurrences.map { |row| m.key(row) }.sort == KEYS.sort
    reviews = occurrences.map do |row|
      key = m.key(row)
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
    raise 'unexpected Ost changes' unless reviews.count { |row| row['status'] == 'accepted' } == 13
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
      entity['evidence_ids'].to_s.split('|') + ["D-#{D}"] +
      KEYS.map { |resource, id, _variant| "#{resource}:#{id}" }
    ).uniq.join('|')
    entity['notes'] += " D-#{D}: #{EVIDENCE}"
    index = result.fetch(:index) + result.fetch(:occurrences)
    index.sort_by! { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante'].to_s, row['entity_key']] }
    m.write_table(m::INDEX, result.fetch(:index_table).headers, index)
    m.write_table(File.join(__dir__, 'proper-name-glossary.tsv'),
                  result.fetch(:glossary_table).headers, result.fetch(:glossary))
    proposal = '/private/tmp/proper-name-edits-D21400-proposal.tsv'
    raise 'proposal already exists' if File.exist?(proposal)
    m.write_table(proposal, m::HEADERS.take(12), result.fetch(:reviews))
    m.run(proposal, D, 1)
  end
end

OstShortReferencesD21400.run if $PROGRAM_NAME == __FILE__
