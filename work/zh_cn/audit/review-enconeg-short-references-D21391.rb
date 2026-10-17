#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-occurrences'

module EnconegShortReferencesD21391
  module_function

  D = 21_391
  ENTITY = 'person:enconeg-holn'
  SHORT_NAME = 'Enconeg'
  TARGET_KEYS = (
    [['base', '1269', '11']] +
    %w[
      1217 12797 14476 1511 15716 16495 16768 18532 26939 28678
      34954 38886 4088 41403 47080 49747 50571 55144 55482 7289 8265
    ].map { |id| ['default', id, ''] }
  ).freeze
  KOREAN_NAME = /(?:엔코넥|엔코네그|엔코니그|에노넥)(?:\s+홀(?:른)?)?(?:\s*\(Enconeg(?:\s+Holn)?\))?/
  ENGLISH_NAME = /(?<![A-Za-z])Enconeg(?![A-Za-z])/i
  EVIDENCE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    D-21391: English uses the short personal name Enconeg in these exact
    rows. The already registered person:enconeg-holn is the Ettinmere
    fisherman/quest giver: default:17093 identifies him as Enconeg Holn,
    default:32562 calls the wedding ring his, and default:51816 identifies
    him as the fisherman seeking his nymph bride. The quest dialogue and
    possession references connect the short forms to that same person.
    Japanese エンコニグ and Chinese 恩康涅格 corroborate the name. Use the
    established full-name stem 엔코네그 as 엔코네그(Enconeg), while retaining source-local
    English labels and adjusting 받침-dependent particles. Existing full-name keys are already terminal
    and are not reopened. No global English alias is added.
    Official Korean manual PDF p. 7 distinguishes quest types and p. 9 gives
    exploration context; it is not the authority for this specific character.
  TEXT

  def transform(text, english)
    source_count = english.scan(ENGLISH_NAME).length
    korean_count = text.to_enum(:scan, KOREAN_NAME).count
    raise "Enconeg source/Korean span count differs: #{source_count}/#{korean_count}" unless
      source_count.positive? && source_count == korean_count

    text.gsub(/#{KOREAN_NAME.source}(을|이|은|과|으로)?/) do
      particle = Regexp.last_match(1)
      '엔코네그(Enconeg)' + {
        '을' => '를', '이' => '가', '은' => '는',
        '과' => '와', '으로' => '로'
      }.fetch(particle, particle.to_s)
    end
  end

  def plan
    m = ReviewedNameBatches
    inventory = m.refresh_inventory
    glossary_table = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    canonical = glossary.find { |row| row.fetch('entity_key') == ENTITY }
    raise "missing registered entity #{ENTITY}" unless canonical
    raise 'Enconeg short name is already a global alias' if
      canonical.fetch('english_aliases').to_s.split('|').include?(SHORT_NAME)

    # Use the short form only to discover row-scoped references; never persist it as an alias.
    scoped_definition = canonical.merge('english_aliases' => SHORT_NAME)
    generated = build_occurrences(inventory.values, [scoped_definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated_by_key = generated.to_h { |row| [m.key(row), row] }
    raise 'duplicate scoped source key' unless generated_by_key.length == generated.length
    raise "unexpected scoped source coverage #{generated.length}" unless generated.length == 31

    index_table = m.table(m::INDEX)
    index = index_table.map(&:to_h)
    index_by_entity_key = index.to_h do |row|
      [[row.fetch('entity_key'), *m.key(row)], row]
    end
    raise 'duplicate existing occurrence key' unless index_by_entity_key.length == index.length
    old_keys = generated.select do |row|
      index_by_entity_key.key?([ENTITY, *m.key(row)])
    end
    raise "unexpected existing Enconeg key count #{old_keys.length}" unless old_keys.length == 9
    raise 'an existing full-name decision is not terminal' unless old_keys.all? do |row|
      %w[accepted not-an-issue excluded uncertain].include?(
        index_by_entity_key.fetch([ENTITY, *m.key(row)]).fetch('status')
      )
    end

    new_rows = generated.reject do |row|
      index_by_entity_key.key?([ENTITY, *m.key(row)])
    end
    actual_keys = new_rows.map { |row| m.key(row) }.sort
    raise 'new Enconeg row scope changed' unless actual_keys == TARGET_KEYS.sort

    reviews = new_rows.sort_by do |row|
      [m::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row.fetch('Tipo_Variante').to_s]
    end.map do |row|
      key = m.key(row)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old_text = source.fetch('work_text')
      new_text = transform(old_text, english)
      status = old_text == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status,
        'old' => old_text, 'new' => new_text, 'evidence' => EVIDENCE,
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    raise 'unexpected Enconeg change/retention counts' unless
      reviews.count { |row| row.fetch('status') == 'accepted' } == 20 &&
      reviews.count { |row| row.fetch('status') == 'not-an-issue' } == 2

    { m: m, inventory: inventory, glossary_table: glossary_table,
      glossary: glossary, canonical: canonical, index_table: index_table,
      index: index, generated: generated, old_keys: old_keys, reviews: reviews }
  end

  def run
    result = plan
    m = result.fetch(:m)
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)

    canonical = result.fetch(:canonical)
    variants = canonical.fetch('korean_variants').to_s.split('|').reject(&:empty?)
    %w[엔코네그 엔코넥 엔코니그 에노넥].each do |variant|
      variants << variant unless variants.include?(variant)
    end
    canonical['korean_variants'] = variants.join('|')
    evidence_ids = canonical.fetch('evidence_ids').to_s.split('|').reject(&:empty?)
    evidence_ids.concat(['D-21391', *TARGET_KEYS.map { |resource, id, _variant| "#{resource}:#{id}" }])
    canonical['evidence_ids'] = evidence_ids.uniq.join('|')
    canonical['notes'] = [
      canonical.fetch('notes'),
      'D-21391 reviewed 22 source-local short Enconeg references under this existing person; no English alias or duplicate entity was added.'
    ].reject(&:empty?).join(' ')

    old_by_key = result.fetch(:index).to_h do |row|
      [[row.fetch('entity_key'), *m.key(row)], row]
    end
    new_occurrences = result.fetch(:generated).reject do |row|
      old_by_key.key?([ENTITY, *m.key(row)])
    end.map do |row|
      row.merge('korean_current' => result.fetch(:inventory).fetch(m.key(row)).fetch('work_text'))
    end
    new_index = result.fetch(:index) + new_occurrences
    new_index.sort_by! do |row|
      [m::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row.fetch('Tipo_Variante').to_s, row.fetch('entity_key')]
    end
    m.write_table(m::INDEX, result.fetch(:index_table).headers, new_index)
    m.write_table(
      File.join(__dir__, 'proper-name-glossary.tsv'),
      result.fetch(:glossary_table).headers,
      result.fetch(:glossary)
    )

    proposal = '/private/tmp/proper-name-edits-D21391-proposal.tsv'
    raise 'temporary proposal already exists' if File.exist?(proposal)
    m.write_table(proposal, m::HEADERS.take(12), result.fetch(:reviews))
    m.run(proposal, D, 1)

    detail = <<~TEXT

    ## D-21391: Enconeg Row-Scoped Short References

    Reviewed 22 newly indexed source keys for the short form `Enconeg` under
    the existing `person:enconeg-holn` entity: 20 accepted spelling/annotation
    corrections and 2 `not-an-issue`. Standardized the short Korean form to
    `엔코네그(Enconeg)`, matching the established full-name stem, with
    vowel-final particles. The 9 already-terminal full-name keys were verified as
    terminal and not reopened. `base:1269`'s Enconeg-owned ring is retained as
    a person reference; its item wording is not registered as an alias. No
    global English alias, duplicate person, or historical global tally was
    added. Aligned Japanese and Chinese support the same fisherman/quest giver.
    Exact source cells and prior dispositions are in
    `proper-name-edits-D21391.tsv`.
    TEXT
    %W[
      named-scope-review-D#{D}-#{m::RUN_DATE_COMPACT}.md
      named-scope-edit-addendum-D#{D}-#{m::RUN_DATE_COMPACT}.md
    ].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + detail)
    end
    m::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing current summary end marker in #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, marker + "\n" + detail))
    end
    puts detail
  end
end

EnconegShortReferencesD21391.run if $PROGRAM_NAME == __FILE__
