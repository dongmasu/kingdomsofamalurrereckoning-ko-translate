#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module UnboundShortReferencesD21409
  module_function

  D = 21_409
  ENTITY = 'faction:the-unbound'
  TARGETS = {
      '28955' => {
        english: 'at an Unbound discount',
        old: '속박되지 않은 자(Unbound) 할인',
        new: '언바운드(The Unbound)에게 할인'
    },
    '48396' => {
      english: 'one of the new Unbound followers',
      old: '새 언바운드 신도',
      new: '새 언바운드(The Unbound) 신도'
    },
    '50072' => {
      english: 'Unbound activity',
      old: '언바운드의 활동',
      new: '언바운드(The Unbound)의 활동'
    }
  }.freeze

  EVIDENCE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    These are three row-scoped uses of the short source form Unbound, not
    a global English alias. At default:28955, English says purchases are at
    an Unbound discount; Japanese explicitly gives the discount to members
    of 縛られざる者 and Chinese calls it 自由者折扣. Render the beneficiary
    as 언바운드(The Unbound), without asserting a branded discount item.
    At default:48396, Nard is one of the new Unbound followers; aligned
    Japanese 縛られざる者の新しい信者 and Chinese 自由者的新追随者 confirm
    the faction reference. At default:50072, Unbound activity is discussed
    as faction activity, corroborated by Japanese 縛られざる者の活動 and
    Chinese 自由者活动. Keep the glossary english_aliases field empty and
    record only these three exact occurrence keys. D-9061's open question
    about default:28955 is superseded only as to the faction beneficiary;
    the prior purchase-scope disposition and historical tally are not
    reopened or recounted.
  TEXT

  def transform(id, text)
    target = TARGETS.fetch(id)
    raise "missing reviewed old span at #{id}" unless text.include?(target.fetch(:old))
    raise "ambiguous reviewed old span at #{id}" unless text.scan(target.fetch(:old)).length == 1
    text.sub(target.fetch(:old), target.fetch(:new))
  end

  def plan
    m = ReviewedNameBatches
    inventory = m.refresh_inventory
    glossary_table = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    entity = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'missing confirmed The Unbound faction entry' unless entity &&
      entity['english_canonical'] == 'The Unbound' &&
      entity['korean_canonical'] == '언바운드(The Unbound)' &&
      entity['english_aliases'].to_s.empty?

    index_table = m.table(m::INDEX)
    index = index_table.map(&:to_h)
    existing = index.to_h { |row| [[row['entity_key'], *m.key(row)], row] }
    candidate_definition = entity.merge('english_aliases' => 'Unbound')
    generated = build_occurrences(
      inventory.values, [candidate_definition]
    ).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    targets = TARGETS.keys.map { |id| ['default', id, ''] }
    matches = generated.select { |row| targets.include?(m.key(row)) }
    raise "short-form source-key mismatch: #{matches.map { |row| m.key(row) }.inspect}" unless
      matches.map { |row| m.key(row) }.sort == targets.sort

    reviews = matches.map do |occurrence|
      key = m.key(occurrence)
      id = key[1]
      target = TARGETS.fetch(id)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "wrong English occurrence at #{id}" unless english.include?(target.fetch(:english))
      raise "not a row-scoped Unbound alias at #{id}" unless
        occurrence.fetch('matched_english') == 'Unbound'
      old = source.fetch('work_text')
      new_text = transform(id, old)
      {
        'resource' => key[0], 'ID_Linha' => id, 'Tipo_Variante' => '',
        'entity_key' => ENTITY, 'status' => 'accepted', 'old' => old,
        'new' => new_text, 'evidence' => EVIDENCE, 'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
      }
    end
    raise 'unexpected existing row-scoped occurrence' unless
      targets.none? { |key| existing.key?([ENTITY, *key]) }
    {
      m: m, inventory: inventory, glossary_table: glossary_table,
      glossary: glossary, entity: entity, index_table: index_table,
      index: index, matches: matches, reviews: reviews
    }
  end

  def run
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    result = plan
    m = result.fetch(:m)
    glossary = result.fetch(:glossary)
    entity = result.fetch(:entity)
    entity['evidence_ids'] = (
      entity.fetch('evidence_ids').to_s.split('|') + ["D-#{D}"] +
      TARGETS.keys.map { |id| "default:#{id}" }
    ).uniq.join('|')
    entity['notes'] += " D-#{D}: reviewed three exact short-form Unbound references as row-scoped faction mentions; no global English alias was added."
    m.write_table(File.join(__dir__, 'proper-name-glossary.tsv'),
                  result.fetch(:glossary_table).headers, glossary)

    index = result.fetch(:index)
    index.concat(result.fetch(:matches))
    index.sort_by! do |row|
      [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i,
       row['Tipo_Variante'].to_s, row['entity_key']]
    end
    m.write_table(m::INDEX, result.fetch(:index_table).headers, index)

    proposal = "/private/tmp/proper-name-edits-D#{D}-proposal.tsv"
    raise 'proposal already exists' if File.exist?(proposal)
    m.write_table(proposal, m::HEADERS.take(12), result.fetch(:reviews))
    m.run(proposal, D, 1)

    note = <<~TEXT

    ## D-#{D}: Row-Scoped Short Unbound References

    Reviewed 3 distinct default row keys: {"accepted"=>3}.
    Standardized only the source-local short form `Unbound` at default:28955,
    48396, and 50072 to the established `언바운드(The Unbound)` faction label.
    The glossary has no global `Unbound` alias; no Path, generic adjective,
    or unrelated occurrence was added. D-9061's open faction-beneficiary
    question at 28955 is superseded only for that name reference; its historic
    tally and other findings remain unchanged.
    English/Japanese/Chinese evidence and old/new Korean cells are in the
    manifest. No global translation totals were recounted.
    TEXT
    %W[named-scope-review-D#{D}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{D}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + note)
    end
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      text = File.read(path)
      marker = '## D-21406: Fieros Lighthouse Complete Display Label'
      raise "missing summary marker #{marker}" unless text.include?(marker)
      File.write(path, text.sub(marker, note + "\n" + marker))
    end
  end
end

UnboundShortReferencesD21409.run if $PROGRAM_NAME == __FILE__
