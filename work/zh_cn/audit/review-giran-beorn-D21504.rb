#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module GiranBeornD21504
  extend self

  M = ReviewedNameBatches
  D = 21_504
  GIRAN = 'person:giran-alba'
  BEORN = 'person:beorn'
  JOURNAL = 'unique_item:girans-journal'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  GIRAN_IDS = %w[
    120 2445 3452 5603 9940 11097 13255 21084 24144 26485 27190 27592
    32756 37570 40886 41806 44241 44301 44520 48067 50834 50893 53149
    54257 54376 56627 59156 62791
  ].freeze
  BEORN_IDS = %w[5435 6881 13644 14823 15276 23863 28991 33494 33674].freeze
  GIRAN_NOTE = 'English default:26485/40886 supply the full name Giran Alba; default:2445/9940/27190/27592 identify Colm’s brother Giran in the Belen’s Testament quest. Japanese ガイラン・アルバ/ガイラン and Chinese 基兰·阿尔巴/阿尔瓦 corroborate. Reuse the established Korean 기란 알바(Giran Alba) and source-short 기란(Giran), pairing every mention but not expanding short names into full names. Preserve age-neutral 형제, the cult terminology, and the separate opening ambiguity at default:48067. Exclude the complete journal title from the personal-name occurrence.'
  BEORN_NOTE = 'English default:6881 identifies Beorn as the mercenary leader carrying the key; default:23863 independently identifies the Whitestone mercenaries and key. Japanese ビオーン/ビョルン and Chinese 比翁/贝奥恩 corroborate identity; Chinese default:23863 erroneously calls the mercenaries merchants and does not override English. Reuse 베오른(Beorn) from default:13644/33494; normalize 비온/비오른/베른 and unpaired 베오른. Preserve the arrest/future-threat interpretation at default:28991 and hiring/bringing wording at default:33674.'
  JOURNAL_NOTE = 'English base:1188 names Giran’s Journal; default:54376 explicitly identifies the book as belonging to Giran, Colm’s brother. Japanese ガイランの日誌 and Chinese 吉兰的日记 corroborate the complete item label. Pair the atomic title 기란의 일지(Giran\'s Journal), not a nested person annotation. Do not infer any additional contents or journal author.'
  COMMON = 'English is the meaning/identity anchor; aligned Japanese and Chinese are supporting evidence. No PAK evidence, source change, historical translation recount, or reopening of unrelated entity dispositions.'
  DETAIL = <<~TEXT.chomp
    ### D-21504: Giran Alba, Beorn And Giran's Journal

    Registered `person:giran-alba` as `기란 알바(Giran Alba)` with the
    source-attested short form `기란(Giran)`, and `person:beorn` as
    `베오른(Beorn)`. Reviewed 38 distinct source keys, covering all three
    resource types (no affix matches). Normalized missing Giran annotations
    and the mixed 비온/비오른/베른/베오른 spellings. English full labels,
    family/quest descriptions, and the mercenary leader's key establish
    identity; Japanese and Chinese corroborate rather than dictate spelling.

    Registered `unique_item:girans-journal` separately as
    `기란의 일지(Giran's Journal)` at base:1188:11. The complete title
    remains atomic and its parent personal-name occurrence is excluded:
    39 entity matches across 38 row keys, not 39 edited rows. Prior
    age-neutral 형제, arrest/future-threat, and hiring/bringing decisions
    are untouched. No historical translation tally was recounted.
  TEXT

  def definition(headers, entity, en, ko, category, aliases, variants, evidence, notes)
    fields = {
      'entity_key' => entity, 'english_canonical' => en, 'category' => category,
      'korean_canonical' => ko, 'english_aliases' => aliases,
      'korean_variants' => variants, 'evidence_ids' => "D-#{D}|#{evidence}",
      'status' => 'confirmed', 'notes' => "#{notes} #{COMMON}"
    }
    headers.to_h { |h| [h, fields.fetch(h, '')] }
  end

  def expected_pairs
    GIRAN_IDS.map { |id| [GIRAN, 'default', id, ''] } +
      [[GIRAN, 'base', '1188', '11'], [JOURNAL, 'base', '1188', '11']] +
      BEORN_IDS.map { |id| [BEORN, 'default', id, ''] }
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    headers = glossary.headers
    definitions = [
      definition(headers, GIRAN, 'Giran Alba', '기란 알바(Giran Alba)', 'person', 'Giran',
                 '기란 알바|기란', 'default:26485|default:40886|default:2445|default:27190', GIRAN_NOTE),
      definition(headers, BEORN, 'Beorn', '베오른(Beorn)', 'person', '',
                 '비온|비오른|베른|베오른', 'default:5435|default:6881|default:23863|default:33494', BEORN_NOTE),
      definition(headers, JOURNAL, "Giran's Journal", "기란의 일지(Giran's Journal)", 'unique item', '',
                 '기란(Giran)의 일지', 'base:1188:11|default:54376', JOURNAL_NOTE)
    ]
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'Giran/Beorn source scope differs' unless
      generated.map { |r| [r.fetch('entity_key'), *M.key(r)] }.sort == expected_pairs.sort
    reviews = generated.group_by { |r| M.key(r) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, occurrences|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = old
      entities = occurrences.map { |r| r.fetch('entity_key') }.sort
      dispositions = {}
      notes = []
      if entities.include?(JOURNAL)
        raise 'unexpected journal label' unless old == '기란(Giran)의 일지'
        new_text = "기란의 일지(Giran's Journal)"
        dispositions[GIRAN] = 'excluded'
        dispositions[JOURNAL] = 'accepted'
        notes = [GIRAN_NOTE, JOURNAL_NOTE]
      elsif entities == [GIRAN]
        raise "missing Giran span #{key.inspect}" unless old.include?('기란')
        new_text = old.gsub(/기란(?: 알바)?(?:\((?:Giran Alba|Giran)\))?/) do |span|
          span.include?('알바') ? '기란 알바(Giran Alba)' : '기란(Giran)'
        end
        dispositions[GIRAN] = new_text == old ? 'not-an-issue' : 'accepted'
        notes = [GIRAN_NOTE]
      elsif entities == [BEORN]
        pattern = /(?:비온|비오른|베른|베오른)(?:\(Beorn\))?/
        raise "missing Beorn span #{key.inspect}" unless old.match?(pattern)
        new_text = old.gsub(pattern, '베오른(Beorn)')
        dispositions[BEORN] = new_text == old ? 'not-an-issue' : 'accepted'
        notes = [BEORN_NOTE]
      else
        raise "unexpected entity overlap #{key.inspect}"
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entities.join('|'),
        'status' => new_text == old ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => new_text, 'evidence' => "#{notes.join(' ')} #{COMMON}",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: #{reviews.length} keys; #{generated.length} matches; #{reviews.count { |r| r['old'] != r['new'] }} edits."
    [headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    previous = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    previous.each { |k, v| raise "prior occurrence changed #{k.inspect}" unless current[k] == v }
    raise 'unexpected occurrence additions' unless (current.keys - previous.keys).sort == expected_pairs.sort
    M::DOCS.each do |path|
      marker = '<!-- current-proper-name-batch:end -->'
      text = File.read(path)
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
    end
    %w[review edit-addendum].each do |kind|
      path = File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
      File.open(path, 'a') { |f| f.write("\n\n#{DETAIL}\n") }
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then GiranBeornD21504.prepare
  when ['apply'] then GiranBeornD21504.apply
  else abort 'usage: review-giran-beorn-D21504.rb [prepare|apply]'
  end
end
