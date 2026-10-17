#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ElementalNamesD21535
  extend self

  M = ReviewedNameBatches
  D = 21_535
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  SPECS = [
    ['lore_term:elemental-harmony', 'Elemental Harmony', 'lore term', '원소 조화',
     %w[18611],
     'English explicitly names and defines a complex spellweaving procedure, not a playable skill. Japanese 属性調和 and Chinese 元素调和 corroborate. Pair the second name mention without duplicating the first existing annotation; leave the existing Ethereal Guard and person-name judgments unchanged.'],
    ['skill:elemental-escape', 'Elemental Escape', 'skill', '원소 탈출',
     %w[11982 29100 60689 61767],
     'English explicitly calls this a special attack and describes a delayed Chakram attack that retreats from danger. Japanese エレメンタルエスケープ and Chinese 元素逃脱 corroborate. Retain the existing standalone bilingual label and append missing English annotations outside the unchanged localized display tokens.'],
    ['skill:arcane-fury', 'Arcane Fury', 'skill', '비전 격노',
     %w[29100 58543 60689 61767],
     'English explicitly calls this a special attack and describes a delayed Staff attack that launches enemies. Japanese アーケンヒューリー and Chinese 奥术怒火 corroborate. This is distinct from the registered Wrath skill. Pair the standalone label and append English outside unchanged localized display tokens.'],
    ['item:elemental-cloak', 'Elemental Cloak', 'item', '원소 망토',
     %w[16054 22268 24154 52577],
     'English identifies the named personal armor across four component descriptions, corroborated by Chinese 元素披风. Japanese describes the same equipment provenance but omits this name; it is not independent lexical confirmation. All four Korean mentions are already bilingual. Register the armor name only, without asserting rarity or merging the separate pieces.']
  ].freeze

  def entities
    SPECS.map do |entity, english, category, korean, ids, note|
      {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => category, 'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '', 'korean_variants' => korean,
        'evidence_ids' => ["D-#{D}", *ids.map { |id| "default:#{id}" }].join('|'),
        'status' => 'confirmed', 'notes' => note
      }
    end
  end

  def reviews(inventory)
    generated = build_occurrences(inventory.values, entities).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = SPECS.flat_map do |entity, _en, _cat, _ko, ids, _note|
      ids.map { |id| [entity, 'default', id, ''] }
    end.sort
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    raise "elemental source coverage differs: #{actual.inspect}" unless actual == expected

    generated.group_by { |row| M.key(row) }.map do |key, occurrences|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      proposed = old.dup
      dispositions = {}
      notes = []
      occurrences.each do |occurrence|
        entity = occurrence.fetch('entity_key')
        _entity, english, _category, korean, _ids, note = SPECS.find { |spec| spec.first == entity }
        before = proposed.dup
        case entity
        when 'lore_term:elemental-harmony'
          raise 'expected one bare second Harmony mention' unless proposed.scan('원소 조화는').length == 1
          proposed.sub!('원소 조화는', '원소 조화(Elemental Harmony)는')
        when 'skill:elemental-escape', 'skill:arcane-fury'
          token = "{*1#{korean}}"
          if proposed.include?(token)
            raise 'expected one special attack token' unless proposed.scan(token).length == 1
            proposed.sub!(token, "#{token}(#{english})")
          elsif proposed == korean
            proposed = "#{korean}(#{english})"
          else
            raise 'unexpected special attack label' unless proposed == "#{korean}(#{english})"
          end
        when 'item:elemental-cloak'
          raise 'expected existing complete armor annotation' unless proposed.include?("#{korean}(#{english})")
        end
        dispositions[entity] = before == proposed ? 'not-an-issue' : 'accepted'
        notes << note
      end
      occurrences.first.merge(
        'entity_key' => dispositions.keys.join('|'),
        'status' => old == proposed ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => proposed,
        'evidence' => notes.join(' ') + ' Preserve exact tokens, line breaks, numbers, prose, and all prior entity/key decisions. Generic elemental adjectives, the existing Elemental Rage/Ethereal Guard scopes, and the context-poor Elemental Keys label are not new dispositions.',
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
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

ElementalNamesD21535.apply if $PROGRAM_NAME == __FILE__
