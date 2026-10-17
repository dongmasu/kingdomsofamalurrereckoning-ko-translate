#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module SummerLoreNamesD21558
  extend self
  M = ReviewedNameBatches
  D = 21_558
  TALISMAN = 'item:talisman-of-fate'
  PRINCE = 'title:prince-of-spring'
  KINGDOM = 'organization:great-kingdom-of-summer'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  IDS = {
    TALISMAN => %w[1833 11199 18032 18583 27627 35083 39481 40183 57013 61425],
    PRINCE => %w[1833 11199],
    KINGDOM => %w[31067]
  }.freeze
  CONFIG = {
    TALISMAN => ['Talisman of Fate', '운명의 부적', 'item', 'The Talisman of Fate'],
    PRINCE => ['Prince of Spring', '봄의 왕자', 'title', ''],
    KINGDOM => ['Great Kingdom of Summer', '여름 대왕국', 'organization', '']
  }.freeze
  NOTES = {
    TALISMAN => 'English default:61425 explicitly identifies the ancient cursed Talisman of Fate as a powerful but treacherous magical artifact and repeats its transfer from Ysa to his page. The ten full-name source keys contain eleven mentions, including both at default:61425. Japanese 運命のタリスマン and Chinese 命运护符 corroborate. Reuse 운명의 부적(Talisman of Fate), preserve The in the two complete standalone headings, and pair every already-written Korean name. Do not infer an inventory slot, rarity or a general Fate/Talisman alias.',
    PRINCE => 'English default:1833/11199 explicitly names the Prince of Spring raising his sword toward dawn. Japanese 春光のプリンス and Chinese 春天王子 corroborate the title. Reuse 봄의 왕자(Prince of Spring). The following Ysa line does not explicitly establish that this prince is Ysa; register only a title, not a person alias or identity.',
    KINGDOM => 'English default:31067 explicitly calls the new kingdom declared by victorious Ysa the Great Kingdom of Summer. Japanese 夏の大王国 and Chinese 夏季王国 corroborate the historical polity. Retain 여름 대왕국(Great Kingdom of Summer) and all surrounding quotation marks and narration. No alias or identity merger with the Summer Court, Gardens of Ysa or modern city is inferred.'
  }.freeze
  COMMON = 'English is the semantic/identity anchor; Japanese and Chinese are supporting aligned references. The official Korean manual supplies setting context but no direct entry for these names. Preserve earlier accepted, excluded and uncertain entity decisions on shared rows, especially the Cradle of Summer verse holds. No PAK/PAK-derived inspection, source edit, global short alias or historical tally recount.'
  DETAIL = <<~TEXT.chomp
    ### D-21558: Talisman, Prince And Historical Kingdom

    Reviewed 11 distinct default keys / 13 entity matches, with no affix
    or base matches. Registered `운명의 부적(Talisman of Fate)` across ten
    keys, including both written mentions in default:61425, and retained
    the source article in two complete standalone headings.

    Registered `봄의 왕자(Prince of Spring)` as a title only: adjacent
    references to Ysa do not prove the prince's personal identity.
    Registered `여름 대왕국(Great Kingdom of Summer)` as the explicitly
    named historical polity, not as a Summer Court or Gardens of Ysa alias.
    No verse interpretation, lore chronology, prior entity decision,
    unresolved Cradle identification, token or line break was changed.
    Full proper-name discovery remains incomplete.
  TEXT

  def definitions(headers)
    CONFIG.map do |entity, (english, korean, category, aliases)|
      fields = {
        'entity_key' => entity, 'english_canonical' => english,
        'korean_canonical' => "#{korean}(#{english})", 'category' => category,
        'english_aliases' => aliases, 'korean_variants' => korean,
        'evidence_ids' => "D-#{D}|#{IDS.fetch(entity).map { |id| "default:#{id}" }.join('|')}",
        'status' => 'confirmed', 'notes' => "#{NOTES.fetch(entity)} #{COMMON}"
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def expected_pairs
    IDS.flat_map { |entity, ids| ids.map { |id| [entity, 'default', id, ''] } }
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    definitions = definitions(glossary.headers)
    inventory = M.table(M::INVENTORY).map(&:to_h).to_h { |row| [M.key(row), row] }
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'summer lore exact source scope differs' unless
      generated.map { |row| [row['entity_key'], *M.key(row)] }.sort == expected_pairs.sort
    rows = generated.group_by { |row| M.key(row) }.map do |key, occurrences|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      text = old.dup
      dispositions = {}
      entities = occurrences.map { |row| row['entity_key'] }.sort
      entities.each do |entity|
        en, ko, = CONFIG.fetch(entity)
        pattern = /#{Regexp.escape(ko)}(?:\((?:The )?#{Regexp.escape(en)}\))?/
        count = english.scan(/(?<![A-Za-z])#{Regexp.escape(en)}(?![A-Za-z])/).length
        raise "summer lore source/Korean count differs #{key.inspect} #{entity}" unless
          count.positive? && text.scan(pattern).length == count
        label = english == "The #{en}" ? english : en
        updated = text.gsub(pattern, "#{ko}(#{label})")
        dispositions[entity] = updated == text ? 'not-an-issue' : 'accepted'
        text = updated
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entities.join('|'), 'status' => old == text ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => text,
        'evidence' => "#{entities.map { |entity| NOTES.fetch(entity) }.join(' ')} #{COMMON}",
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions.sort.to_h)
      }
    end.sort_by { |row| row['ID_Linha'].to_i }
    raise 'summer lore distinct-key count differs' unless rows.length == 11
    ReviewedProperNameDiscovery.validate!(
      definitions, rows, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(rows, inventory)
    puts "D-#{D}: #{rows.length} keys; #{generated.length} matches; #{rows.count { |row| row['old'] != row['new'] }} edits; prepare only."
    [glossary.headers, definitions, rows]
  end

  def apply
    headers, definitions, rows = prepare
    prior = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row['entity_key'], *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), rows)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row['entity_key'], *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    prior.each { |key, value| raise "prior lore-row decision changed #{key.inspect}" unless current[key] == value }
    raise 'unexpected summer lore index additions' unless (current.keys - prior.keys).sort == expected_pairs.sort
    paths = M::DOCS + %w[review edit-addendum].map do |kind|
      File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    end
    paths.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      if text.include?(marker)
        File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
      else
        File.open(path, 'a') { |file| file.write("\n\n#{DETAIL}\n") }
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then SummerLoreNamesD21558.prepare
  when ['apply'] then SummerLoreNamesD21558.apply
  else abort 'usage: review-summer-lore-names-D21558.rb [prepare|apply]'
  end
end
