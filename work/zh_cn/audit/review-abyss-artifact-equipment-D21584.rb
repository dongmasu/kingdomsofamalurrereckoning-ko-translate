#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewAbyssArtifactEquipmentD21584
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_584
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  EQUIPMENT = [
    ['abyss-shoes', 'Abyss Shoes', '심연의 신발', 'base', '1498'],
    ['abyss-cowl', 'Abyss Cowl', '심연의 두건', 'base', '1937'],
    ['abyss-handwraps', 'Abyss Handwraps', '심연의 손붕대', 'base', '2772'],
    ['abyss-robes', 'Abyss Robes', '심연의 로브', 'base', '3578'],
    ['abyss-ring', 'Abyss Ring', '심연의 반지', 'default', '48044'],
    ['abyss-armor', 'Abyss armor', '심연의 갑옷', 'default', '32217']
  ].freeze
  ARTIFACT_IDS = %w[11476 58825 61754].freeze
  GENERIC_IDS = %w[11906 24898 52619 55986].freeze
  CONTEXT = <<~TEXT.chomp
    English default:61754 explicitly says the cloak was named Abyss and
    describes the Abyss cloak and experiment. Default:11476 names the
    cursed cloak/relic Abyss, and 58825 names the quoted Abyss experiment.
    Japanese アビス / 「アビス」 and Chinese 深渊 corroborate the named
    subject. Reuse existing 어비스(Abyss) in those three contexts; add the
    missing pairs on repeated mentions and replace the isolated translated
    experiment name 심연 with 어비스(Abyss), preserving its quotes and prose.
    Scan affix/base/default: Abyss matches 13 row keys, four base and nine
    default, with no affix hits. The four lowercase common-noun contexts
    (unknown abyss, watery abyss, Ciara's abyss and magical abyss) are
    explicitly excluded and unchanged, not proper names by capitalization.
    Register six complete equipment labels independently. Japanese item
    labels use アビスの and Chinese uses 深渊, supporting the existing
    Korean 심연의 wording in the equipment series; pair each complete English
    item/set label, including source-local lowercase armor at default:32217.
    These names alone do not prove the equipment's physical identity with
    the separately named cursed cloak, so exclude all six equipment keys
    from that artifact identity and introduce no such lore assertion.
    Item category does not assert rarity, uniqueness or mechanics. Keep
    the named cloak 어비스 distinct from the literal 심연의 equipment series.
    The non-exhaustive official Korean manual has no direct entry for this
    artifact or equipment. Preserve the Atarum accounts, other names,
    chronology, particles, tokens and exact line-ending sequence.
    No prior entity dispositions or global totals are reopened or recounted.
    Full discovery remains incomplete; release ZIP is unchanged.
  TEXT

  def transform(entity, key, text)
    if entity == 'unique item:abyss-cloak'
      return [text, 'excluded'] unless
        key[0] == 'default' && ARTIFACT_IDS.include?(key[1])

      updated = if key[1] == '58825'
                  raise 'unexpected Abyss experiment label' unless
                    text == "'심연' 실험에 관한 기록."
                  text.sub('심연', '어비스(Abyss)')
                else
                  text.gsub(/어비스(?:\(Abyss\))?/, '어비스(Abyss)')
                end
    else
      equipment = EQUIPMENT.find { |row| "item:#{row[0]}" == entity }
      raise "unreviewed equipment #{entity}" unless equipment
      raise "wrong equipment key #{key.inspect}" unless
        key[0] == equipment[3] && key[1] == equipment[4]
      raise "missing equipment Korean #{key.inspect}" unless text.include?(equipment[2])
      updated = text.sub(equipment[2], "#{equipment[2]}(#{equipment[1]})")
    end
    raise "expected a reviewed edit #{entity} #{key.inspect}" if updated == text
    [updated, 'accepted']
  end

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    data = [
      ['unique item:abyss-cloak', 'Abyss', '어비스', 'unique item', 13]
    ] + EQUIPMENT.map do |slug, english, korean, _resource, _id|
      ["item:#{slug}", english, korean, 'item', 1]
    end
    entities = data.map do |key, english, korean, category, _count|
      values = {
        'entity_key' => key, 'english_canonical' => english,
        'korean_canonical' => "#{korean}(#{english})", 'category' => category,
        'english_aliases' => '', 'korean_variants' => korean,
        'evidence_ids' => "D-#{D}", 'status' => 'confirmed', 'notes' => CONTEXT
      }
      glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    end
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, entities).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    counts = generated.group_by { |row| row.fetch('entity_key') }.transform_values(&:length)
    raise "source counts differ: #{counts.inspect}" unless
      counts == data.to_h { |row| [row[0], row[4]] }
    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      updated = old.dup
      dispositions = {}
      matches.each do |match|
        entity = match.fetch('entity_key')
        updated, dispositions[entity] = transform(entity, key, updated)
      end
      status = old == updated ? 'excluded' : 'accepted'
      if status == 'excluded'
        raise "unclassified generic Abyss #{key.inspect}" unless
          key[0] == 'default' && GENERIC_IDS.include?(key[1])
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
        'old' => old, 'new' => updated, 'evidence' => CONTEXT,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    raise 'expected 13 keys, 19 matches and nine edits' unless
      reviews.length == 13 && generated.length == 19 &&
      reviews.count { |row| row['old'] != row['new'] } == 9
    R.validate!(entities, reviews, generated, glossary.map(&:to_h),
                M.table(M::INDEX).map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.select { |row| row['old'] != row['new'] }
           .group_by { |row| row['resource'] }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    puts "D-#{D}: seven entries, 13 keys, 19 matches, nine edits; prepare only."
    [glossary.headers, entities, reviews]
  end

  def apply
    headers, entities, reviews = prepare
    M.write_table(DEFINITIONS, headers, entities)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Abyss Cloak, Equipment Labels And Ordinary Abysses

      #{CONTEXT}
      Registered the named cloak and six full equipment labels. Reviewed
      13 keys / 19 entity-row matches; corrected nine Texto cells (four
      base, five default). Four common-noun abyss contexts are unchanged.
      The six equipment references are explicitly excluded from the
      cloak identity; no physical-equivalence assertion was introduced.
    TEXT
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{detail}"))
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewAbyssArtifactEquipmentD21584.prepare
  when ['apply'] then ReviewAbyssArtifactEquipmentD21584.apply
  else abort 'usage: review-abyss-artifact-equipment-D21584.rb [prepare|apply]'
  end
end
