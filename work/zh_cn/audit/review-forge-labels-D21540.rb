#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ForgeLabelsD21540
  extend self

  M = ReviewedNameBatches
  D = 21_540
  CARD = 'title:the-forge-fate-card'
  VLASKER = 'title:vlaskers-forge'
  VLASKAR = 'title:vlaskars-forge'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CARD_DEFAULT_IDS = %w[
    974 3142 4300 4430 5034 8931 9342 10543 12967 13306 13593 14699
    15152 17977 19786 20117 21990 22949 26964 27574 28730 28839
    29104 31799 31970 32637 34776 35500 35736 37581 40384 41747
    46037 47778 48720 51264 51339 53306 58135 59684 60483 61212 61681 61804
  ].freeze
  HOLDS = [%w[base 1563 11], ['default', '12967', ''], ['default', '19786', '']].freeze
  LABELS = {
    ['base', '1150', '11'] => [VLASKER, "Vlasker's Forge", '블라스커(Vlasker)의 대장간', "블라스커의 대장간(Vlasker's Forge)"],
    ['default', '26736', ''] => [VLASKER, "Vlasker's Forge", '블래스커의 대장간', "블라스커의 대장간(Vlasker's Forge)"],
    ['base', '2325', '11'] => [VLASKAR, "Vlaskar's Forge", '블라스카르(Vlaskar)의 대장간', "블라스카르의 대장간(Vlaskar's Forge)"],
    ['default', '60990', ''] => [VLASKAR, "Vlaskar's Forge", "블라스카르의 대장간(Vlaskar's Forge)", "블라스카르의 대장간(Vlaskar's Forge)"]
  }.freeze
  CARD_NOTE = 'English default:29104 explicitly describes the named Fate card The Forge and its destiny; Japanese ザ・フォージ and Chinese 锻炉 corroborate. Reuse its existing Korean 단조(The Forge), adding only the missing second annotation. The three isolated The Forge labels do not establish that they are this card; preserve them as identity holds. Exclude physical forges, crafting/repair dialogue, deity epithets, the Master of the Forge title, and the separately registered Forge of the Firstsworn.'
  LABEL_NOTE = 'English provides the exact complete source-local label, corroborated by aligned Japanese and Chinese. Preserve the established Korean wording and move the English annotation to the complete label. Vlasker uses 블라스커 from base:1150, normalizing only the alternate 블래스커 at default:26736; Vlaskar retains 블라스카르. Keep the two source spellings as separate title scopes, not person aliases or an assertion of shared/different physical identity. The neutral title category does not infer an item, workshop, or place type. Existing person:vlaskar decisions remain unchanged.'

  def entities
    [
      [CARD, 'The Forge', '단조(The Forge)', '단조', 'default:29104', CARD_NOTE],
      [VLASKER, "Vlasker's Forge", "블라스커의 대장간(Vlasker's Forge)", '블라스커|블래스커', 'base:1150:11|default:26736', LABEL_NOTE],
      [VLASKAR, "Vlaskar's Forge", "블라스카르의 대장간(Vlaskar's Forge)", '블라스카르', 'base:2325:11|default:60990', LABEL_NOTE]
    ].map do |entity, english, korean, variants, ids, note|
      {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => 'title', 'korean_canonical' => korean,
        'english_aliases' => '', 'korean_variants' => variants,
        'evidence_ids' => "D-#{D}|#{ids}", 'status' => 'confirmed', 'notes' => note
      }
    end
  end

  def expected_pairs
    [[CARD, 'base', '1563', '11']] +
      CARD_DEFAULT_IDS.map { |id| [CARD, 'default', id, ''] } +
      LABELS.map { |key, (entity, *)| [entity, *key] }
  end

  def reviews(inventory)
    generated = build_occurrences(inventory.values, entities).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise "Forge full source coverage differs: #{actual.inspect}" unless actual.sort == expected_pairs.sort
    generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      proposed = old.dup
      entity = occurrence.fetch('entity_key')
      if LABELS.key?(key)
        expected_entity, english, expected_old, proposed = LABELS.fetch(key)
        raise 'unexpected Forge label entity or source' unless entity == expected_entity &&
          JSON.parse(source.fetch('en_texts_json')).compact == [english]
        raise 'stale complete Forge label' unless old == expected_old
        status = old == proposed ? 'not-an-issue' : 'accepted'
        note = LABEL_NOTE
      elsif key == ['default', '29104', '']
        raise 'expected first annotated and second bare Forge card name' unless
          old.scan('단조(The Forge)').length == 1 && old.scan('단조의 운명을').length == 1
        proposed.sub!('단조의 운명을', '단조(The Forge)의 운명을')
        status = 'accepted'
        note = CARD_NOTE
      elsif HOLDS.include?(key)
        status = 'uncertain'
        note = 'Isolated The Forge label: no source context establishes the Fate card or a physical forge. Preserve the existing Korean without inferring identity. ' + CARD_NOTE
      else
        status = 'excluded'
        note = 'The English phrase denotes a physical forge, service/action, different title, or deity epithet, not the named Fate card. ' + CARD_NOTE
      end
      occurrence.merge(
        'status' => status, 'old' => old, 'new' => proposed, 'evidence' => note,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => status),
        'previous_status' => '', 'previous_evidence' => ''
      )
    end
  end

  def apply
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    rows = reviews(inventory)
    M.write_table(DEFINITIONS, glossary.headers, entities)
    M.write_table(REVIEWS, M::HEADERS, rows)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

ForgeLabelsD21540.apply if $PROGRAM_NAME == __FILE__
