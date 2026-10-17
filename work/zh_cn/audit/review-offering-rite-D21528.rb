#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module OfferingRiteD21528
  extend self

  M = ReviewedNameBatches
  D = 21_528
  ENTITY = 'named event:offering-rite'
  CANDIDATES = File.join(__dir__, 'proper-name-person-scout-next50-D21454.tsv')
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  UNCERTAIN_KEYS = [
    ['default', '37131', ''],
    ['default', '40882', '']
  ].freeze
  ITEM_KEY = ['base', '3748', '11'].freeze
  SPECIAL_REPLACEMENTS = {
    '13429' => ['제물이 바쳐질 때가 다가온다', '봉헌 의식(Offering)이 다가온다'],
    '21790' => ['제물이 온다', '봉헌 의식(Offering)이 다가온다'],
    '21834' => ['제물 준비에 여념이 없어', '봉헌 의식(Offering)을 준비하느라 여념이 없어'],
    '30523' => ['봉헌물을 바쳤으니', '봉헌 의식(Offering)을 치렀으니'],
    '47159' => ['제물 바칠 준비', '봉헌 의식(Offering)을 치를 준비'],
    '48482' => ['제물을 바칠 때', '봉헌 의식(Offering)을 치를 때'],
    '54489' => ['봉헌(Offering) 의식', '봉헌 의식(Offering)'],
    '59193' => ['제물이 바쳐질 때가 가까워진다', '봉헌 의식(Offering)이 가까워진다'],
    '63982' => ['봉헌을 올리고', '봉헌 의식(Offering)을 치르고']
  }.freeze
  RITE_EVIDENCE = 'The English-led corpus identifies Offering as the recurring Cape Solace/Gallows End rite through which Akara selects and blesses a new Scion. The Offering references at default:32249, 32440, 34490, 48894, 53200, and 54489 establish the named ceremony and its function; Japanese quotes ささげ物 and Chinese uses 献祭 in the same source contexts. Use the established 봉헌 의식(Offering), annotate only this rite, and retain source-local syntax. Earlier exact-row decisions are cited as context, not recounted. The separate Chernobog item, ordinary offerings, and unresolved standalone references are not conflated.'
  GENERIC_EVIDENCE = 'English uses offering as an ordinary object, act, proposal, sacrifice, or verb in a context distinct from the named Scion rite. Japanese and Chinese support the local generic sense. Exclude this occurrence from named event:offering-rite; do not alter the Korean or create an alias.'
  ITEM_EVIDENCE = "English base:3748 is the separate complete item title Chernobog's Offering, already registered as an atomic item. Exclude it from the Scion rite; preserve its terminal item decision and do not add a nested event annotation."
  UNCERTAIN_EVIDENCE = 'The source names an Offering, but this row alone does not establish whether it is the Scion rite or a literal offering. Preserve the existing Korean and historical uncertainty; broader corpus evidence is insufficient to resolve this specific reference without reopening its prior disposition.'

  def source_inventory
    M.refresh_inventory
  end

  def definitions(headers)
    fields = {
      'entity_key' => ENTITY,
      'english_canonical' => 'Offering',
      'category' => 'named event',
      'korean_canonical' => '봉헌 의식(Offering)',
      'english_aliases' => 'The Offering',
      'korean_variants' => '봉헌 의식|봉헌식|봉헌물|제물|공물',
      'evidence_ids' => 'D-21528|default:32249|default:32440|default:34490|default:48894|default:53200|default:54489',
      'status' => 'confirmed',
      'notes' => RITE_EVIDENCE
    }
    headers.to_h { |header| [header, fields.fetch(header, '')] }
  end

  def candidate_keys
    candidate = M.table(CANDIDATES).find do |row|
      row['rank'] == '388' && row['english_candidate'] == 'Offering'
    end
    raise 'Offering scout candidate is missing or changed' unless candidate

    candidate.fetch('source_context_keys').split('|').map do |value|
      resource, id, variant = value.split(':', 3)
      [resource, id, variant.to_s]
    end
  end

  def normalize(text, source)
    key = M.key(source)
    raise "not an Offering-rite key #{key.inspect}" unless
      key[0] == 'default' && candidate_keys.include?(key) && !UNCERTAIN_KEYS.include?(key)

    if (replacement = SPECIAL_REPLACEMENTS[key[1]])
      text = text.sub(replacement[0], replacement[1])
    end

    text = text.gsub('공물 의식', '봉헌 의식(Offering)')
    text = text.gsub('제물 의식', '봉헌 의식(Offering)')
    text = text.gsub('봉헌(Offering)', '봉헌 의식(Offering)')
    text = text.gsub(/봉헌식(?=(?:은|이|을|에|의|도|만|로|에서|으로)?)/,
                     '봉헌 의식(Offering)')
    text = text.gsub(/봉헌 의식(?!\(Offering\))/, '봉헌 의식(Offering)')

    text = text.gsub(/봉헌물(이|은|을|에|의|도|만|로|에서|으로)?/) do
      "봉헌 의식(Offering)#{Regexp.last_match(1)}"
    end
    text = text.gsub(/공물(이|은|을|에|의|도|만|로|에서|으로)?/) do
      "봉헌 의식(Offering)#{Regexp.last_match(1)}"
    end
    text = text.gsub(/봉헌(이|은|을|에|의|도|만|로|에서|으로)(?!\s*의식)/) do
      "봉헌 의식(Offering)#{Regexp.last_match(1)}"
    end
    text = text.gsub(/제물(이|은|을|에|의|도|만|로|에서|으로)?/) do
      "봉헌 의식(Offering)#{Regexp.last_match(1)}"
    end

    if text == '제물' || text == '봉헌물' || text == '봉헌'
      text = '봉헌 의식(Offering)'
    end
    text
  end

  def source_evidence(review, inventory)
    source = inventory.fetch(M.key(review))
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    [english, japanese, chinese]
  end

  def reviews(inventory, glossary_headers)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    generated = build_occurrences(inventory.values, [definitions(glossary.headers)]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "Offering source match count differs: #{generated.length}" unless generated.length == 90
    generated_keys = generated.map { |row| M.key(row) }
    raise 'Offering candidate key missing from complete source matches' unless
      (candidate_keys - generated_keys).empty?
    raise 'unexpected non-queue Offering matches' unless
      (generated_keys - candidate_keys).length == 29

    generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      if key == ITEM_KEY
        status = 'excluded'
        new_text = old
        disposition = 'excluded'
        evidence = ITEM_EVIDENCE
      elsif UNCERTAIN_KEYS.include?(key)
        status = 'uncertain'
        new_text = old
        disposition = 'uncertain'
        evidence = UNCERTAIN_EVIDENCE
      elsif candidate_keys.include?(key)
        proposed = normalize(old, source)
        changed = proposed != old
        status = changed ? 'accepted' : 'not-an-issue'
        new_text = proposed
        disposition = status
        evidence = RITE_EVIDENCE
      else
        status = 'excluded'
        new_text = old
        disposition = 'excluded'
        evidence = GENERIC_EVIDENCE
      end
      english, japanese, chinese = source_evidence(occurrence, inventory)
      occurrence.merge(
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => evidence,
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => disposition),
        'previous_status' => '',
        'previous_evidence' => ''
      )
    end.sort_by { |row| M.key(row).then { |key| [M::RESOURCES.index(key[0]), key[1].to_i, key[2]] } }
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    headers = M.table(ReviewedProperNameDiscovery::GLOSSARY).headers
    inventory = source_inventory
    defs = definitions(headers)
    reviews = reviews(inventory, headers)
    raise 'duplicate Offering entity definition' if
      M.table(ReviewedProperNameDiscovery::GLOSSARY).any? { |row| row['entity_key'] == ENTITY }
    M.write_table(DEFINITIONS, headers, [defs])
    M.write_table(REVIEWS, M::HEADERS, reviews)
    puts "Prepared #{reviews.length} Offering matches: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
  end
end

OfferingRiteD21528.prepare if $PROGRAM_NAME == __FILE__
