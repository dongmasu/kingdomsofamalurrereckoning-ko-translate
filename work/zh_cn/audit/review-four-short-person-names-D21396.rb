#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-occurrences'

module FourShortPersonNamesD21396
  module_function

  FIRST_D = 21_396
  CONFIG = {
    'person:alder-malloi' => {
      short: 'Alder', korean: '앨더', pattern: /(?:앨더|알더|올더)(?:\(Alder\))?/,
      ids: %w[
        675 4912 5271 6834 6969 11352 12709 13637 13950 15120 15396
        15541 15630 16527 16569 18782 19306 19403 19459 21503 22236
        22504 28071 28440 30135 34240 34295 35247 36535 36552 36900
        37294 39221 39907 41089 44878 45926 46344 46680 48212 50985
        56493 60413 62082 63160
      ],
      changes: 34,
      evidence: 'English default:63160 identifies Nina Malloi as Alder\'s daughter, while the full-name rows identify Cape Solace leader Alder Malloi. Japanese アルダー and Chinese 阿尔德 corroborate. Reuse the established full-name stem 앨더; normalize 알더/올더 in these exact short references. Default:22504 has two Korean mentions, and both are normalized without changing its paragraphs.'
    },
    'person:bridgette-malloi' => {
      short: 'Bridgette', korean: '브리짓', pattern: /브리짓(?:\(Bridgette\))?/,
      base: %w[1061],
      ids: %w[
        3903 4064 4207 5534 11893 11954 12707 18600 21503 24263
        30262 33240 35520 37440 39907 40173 42771 48482 51999 56638
        58406 61977 64794 64929
      ],
      changes: 12,
      evidence: 'English default:21503 explicitly calls the new Scion Alder\'s wife Bridgette. Full-name rows identify Bridgette Malloi; Japanese ブリジット and Chinese 布里吉特 corroborate. Reuse 브리짓 and annotate all existing short references, including the three Korean mentions in default:39907. The letter label at base:1061 is a person reference, not a global alias for the whole letter title.'
    },
    'person:angharad-glyndowr' => {
      short: 'Angharad', korean: '앙가라드',
      pattern: /(?:앙가라드|안가라드|앵거라드|앵가라드)(?:\(Angharad\))?/,
      ids: %w[
        12773 21078 21740 23182 28277 31274 32062 35186 35702 36492
        38611 48265 50168 51752 52169 52483 53059 55699 56210 62902
        63693 63848
      ],
      changes: 16,
      evidence: 'English default:35537 identifies Conrad Cronberg\'s friend Angharad Glyndowr and then uses Angharad; default:52169 is the same friend and Dead Kel bargain. Japanese アンガラード and Chinese 安哈蕾德 corroborate. Reuse the registered full-name stem 앙가라드, replacing the attested 안가라드/앵거라드/앵가라드 short forms. Preserve the letter paragraphs and signature at default:48265.'
    },
    'person:pepin-jamane' => {
      short: 'Pepin', korean: '페핀', pattern: /페핀(?:\(Pepin\))?/,
      ids: %w[1882 8011 8139 8939 9860 10666 16705 31226 36644 36823 40222 50933 53937 54598],
      changes: 8,
      evidence: 'English default:18039 uses Pepin Jamane and Pepin for the same rescued gnome in Undersea Fasting. Japanese ペピン and Chinese 派平 corroborate. Reuse the registered full-name stem 페핀 and retain Scholar/학자 outside the short-name pair at default:36644.'
    }
  }.freeze

  def target_keys(config)
    config.fetch(:ids).map { |id| ['default', id, ''] } +
      config.fetch(:base, []).map { |id| ['base', id, '11'] }
  end

  def transform(entity, text)
    config = CONFIG.fetch(entity)
    raise "missing Korean short name #{entity}" unless text.match?(config.fetch(:pattern))
    text.gsub(config.fetch(:pattern), "#{config.fetch(:korean)}(#{config.fetch(:short)})")
  end

  def plan
    m = ReviewedNameBatches
    inventory = m.refresh_inventory
    glossary_table = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    definitions = CONFIG.map do |entity, config|
      canonical = glossary.find { |row| row['entity_key'] == entity }
      raise "missing canonical #{entity}" unless canonical
      raise "unexpected global alias #{entity}" unless canonical['english_aliases'].to_s.empty?
      canonical.merge('english_aliases' => config.fetch(:short))
    end
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    index_table = m.table(m::INDEX)
    index = index_table.map(&:to_h)
    previous = index.to_h { |row| [[row['entity_key'], *m.key(row)], row] }
    new_rows = generated.reject { |row| previous.key?([row['entity_key'], *m.key(row)]) }
    CONFIG.each do |entity, config|
      actual = new_rows.select { |row| row['entity_key'] == entity }.map { |row| m.key(row) }
      raise "unexpected source/key coverage #{entity}: #{actual.inspect}" unless
        actual.sort == target_keys(config).sort
    end
    raise 'duplicate discovery entity/key' unless new_rows.map { |row| [row['entity_key'], *m.key(row)] }.uniq.length == 106
    change_counts = Hash.new(0)
    reviews = new_rows.group_by { |row| m.key(row) }.sort_by do |key, _rows|
      [m::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, occurrences|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      current = old.dup
      dispositions = {}
      evidence = occurrences.map do |occurrence|
        entity = occurrence.fetch('entity_key')
        config = CONFIG.fetch(entity)
        changed = transform(entity, old) != old
        dispositions[entity] = changed ? 'accepted' : 'not-an-issue'
        change_counts[entity] += 1 if changed
        current = transform(entity, current)
        config.fetch(:evidence)
      end
      evidence << 'English is the meaning/identity anchor; Japanese and Chinese corroborate. Official Korean manual PDF p. 7 establishes quest types, not these expansion characters. These are exact row-scoped short forms under existing full-name entities, not global aliases. All prior full-name decisions and unrelated entity/key decisions remain untouched; no historical global recount. Preserve tokens, paragraph breaks, existing omissions and particles.'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.sort.join('|'),
        'status' => old == current ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => current, 'evidence' => evidence.join(' '),
        'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
        'chinese' => source['zh_text'],
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    CONFIG.each do |entity, config|
      raise "unexpected correction count #{entity}" unless change_counts[entity] == config.fetch(:changes)
    end
    raise 'unexpected distinct row count' unless reviews.length == 104
    {
      m: m, inventory: inventory, glossary_table: glossary_table, glossary: glossary,
      index_table: index_table, index: index, occurrences: new_rows, reviews: reviews
    }
  end

  def run
    result = plan
    m = result.fetch(:m)
    (FIRST_D..FIRST_D + 2).each { |d| ReviewedProperNameDiscovery.ensure_unused_batch!(d) }
    result.fetch(:glossary).each do |entity|
      config = CONFIG[entity['entity_key']]
      next unless config
      entity['evidence_ids'] = (
        entity['evidence_ids'].to_s.split('|') + ['D-21396-D-21398'] +
        target_keys(config).map { |resource, id, _variant| "#{resource}:#{id}" }
      ).uniq.join('|')
      entity['notes'] += " D-21396-D-21398: #{config.fetch(:evidence)} Exact short-reference keys only; no global English alias."
    end
    index = result.fetch(:index) + result.fetch(:occurrences)
    index.sort_by! { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante'].to_s, row['entity_key']] }
    m.write_table(m::INDEX, result.fetch(:index_table).headers, index)
    m.write_table(File.join(__dir__, 'proper-name-glossary.tsv'),
                  result.fetch(:glossary_table).headers, result.fetch(:glossary))
    proposal = '/private/tmp/proper-name-edits-D21396-proposal.tsv'
    raise 'proposal already exists' if File.exist?(proposal)
    m.write_table(proposal, m::HEADERS.take(12), result.fetch(:reviews))
    m.run(proposal, FIRST_D, 3)
  end
end

FourShortPersonNamesD21396.run if $PROGRAM_NAME == __FILE__
