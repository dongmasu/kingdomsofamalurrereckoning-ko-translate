#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewMiningItemsSitesD21618
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_618
  CONTEXT = <<~TEXT.chomp
    English-led comparison of separately named mining-family items and
    sites across affix/base/default. Preserve exact aligned English,
    Japanese and Chinese evidence and source-local English capitalization.
    Replace surname-only or partial parentheses with complete item/place
    labels. Reuse established 다크바리, 신릭, 중가르 and 스코리아 stems.
    Contracts are document items: Japanese 契約 and Chinese 契约 support
    계약서, not a new agreement quest or an individual family member.
    The explicit keys, treasure map and deed remain distinct item entries.
    The named Skoria Mine inside its deed remains the previously registered
    place, while the whole Deed to Skoria Mine receives a separate item
    owner. Existing person/family/mine dispositions are preserved.
    English colliery and Chinese 煤矿 support 탄광; Japanese leaves the
    base label in English. Register Darkvari Colliery separately from
    Darkvari Mine: these labels alone do not prove site equivalence.
    Separate glossary ownership is a source-label distinction, not a claim
    that Colliery and Mine are physically different sites. Cynric Quarry
    needs an existing-owner alias review using the south-of-Whitestone
    contexts at 22757/50221; it is not registered as a new site here.
    Cynric Pit is an isolated separately worded label, outside this scope.
    The shortened Darkvari map questions are outside this complete-title
    matcher pending a row-scoped identity decision. No global surname
    aliases or duplicate existing entities are introduced.
    The official Korean manual extraction/reference has no direct entries
    for these titles. Preserve all other wording, names, tokens and line
    endings. Full discovery/residual validation remains incomplete.
    No PAK material is used; published release ZIP unchanged.
  TEXT
  SPECS = [
    ['item:zungar-contract', 'Zungar contract', '중가르 계약서', 'item',
     [['base', '278', '11']], '중가르(Zungar)의 계약서'],
    ['item:darkvari-key', 'Darkvari Key', '다크바리 열쇠', 'item',
     [['base', '418', '11']], '다크바리(Darkvari)의 열쇠'],
    ['place:darkvari-colliery', 'Darkvari Colliery', '다크바리 탄광', 'place',
     [['base', '560', '11']], '다크바리(Darkvari) 탄광'],
    ['item:cynric-contract', 'Cynric contract', '신릭 계약서', 'item',
     [['base', '793', '11']], '신릭(Cynric)의 계약서'],
    ['item:darkvari-treasure-map', 'Darkvari Treasure Map', '다크바리 보물 지도', 'item',
     [['base', '2712', '11']], '다크바리(Darkvari)의 보물 지도'],
    ['item:zungar-key', 'Zungar Key', '중가르 열쇠', 'item',
     [['base', '2748', '11']], '중가르(Zungar)의 열쇠'],
    ['item:darkvari-contract', 'Darkvari contract', '다크바리 계약서', 'item',
     [['base', '3450', '11']], '다크바리(Darkvari)의 계약'],
    ['item:deed-to-skoria-mine', 'Deed to Skoria Mine', '스코리아 광산 소유권 증서', 'item',
     [['base', '340', '11']] +
       %w[3578 27539 40598 49427 54225 64282].map { |id| ['default', id, ''] },
     '스코리아 광산(Skoria Mine) 소유권 증서']
  ].freeze

  def prepare
    R.ensure_unused_batch!(D)
    paths = %w[proper-name-discovery-definitions proper-name-discovery].map do |stem|
      File.join(__dir__, "#{stem}-D#{D}.tsv")
    end
    raise 'discovery manifests already exist' if paths.any? { |path| File.exist?(path) }
    inventory = M.refresh_inventory
    glossary, index = M.table(R::GLOSSARY), M.table(M::INDEX)
    definitions, generated_all, reviews = [], [], []
    SPECS.each do |entity, english, korean, category, keys, from|
      values = {
        'entity_key' => entity, 'english_canonical' => english,
        'korean_canonical' => "#{korean}(#{english})", 'category' => category,
        'english_aliases' => '', 'korean_variants' => [korean, from].compact.join('|'),
        'status' => 'confirmed', 'notes' => CONTEXT,
        'evidence_ids' => (["D-#{D}"] + keys.map { |key| key.reject(&:empty?).join(':') }).join('|')
      }
      definition = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
      generated = build_occurrences(inventory.values, [definition]).map do |row|
        OCCURRENCE_HEADERS.zip(row).to_h
      end
      raise "unexpected source scope #{english}" unless
        generated.map { |row| M.key(row) }.sort == keys.sort
      definitions << definition
      generated_all.concat(generated)
      generated.each do |match|
        key = M.key(match)
        source = inventory.fetch(key)
        old = source.fetch('work_text')
        if entity == 'item:deed-to-skoria-mine'
          pattern = /스코리아 광산\(Skoria Mine\)(?:의)? (?:소유권 증서|소유 증서|권리증)/
          raise "missing deed span #{key.inspect}" unless old.scan(pattern).length == 1
          en = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
          local = en.match(/Deed to Skoria Mine/i).to_s
          raise 'missing source deed label' if local.empty?
          revised = old.sub(pattern, "#{korean}(#{local})")
        else
          raise "unexpected Korean span #{key.inspect}" unless old.scan(from).length == 1
          revised = old.sub(from, "#{korean}(#{english})")
        end
        status = old == revised ? 'not-an-issue' : 'accepted'
        reviews << {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'entity_key' => entity, 'status' => status,
          'old' => old, 'new' => revised, 'evidence' => CONTEXT,
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'),
          'entity_dispositions_json' => JSON.generate(entity => status)
        }
      end
    end
    reviews.sort_by! { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
    raise 'unexpected scope size' unless reviews.length == 14
    R.validate!(definitions, reviews, generated_all, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)),
                                  rows.select { |row| row['old'] != row['new'] })
    end
    puts "D-#{D}: #{definitions.length} separate item/site entities, 14 keys; #{reviews.count { |row| row['old'] != row['new'] }} Texto edits."
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'old', 'new')) }
    [paths, glossary.headers, definitions, reviews]
  end

  def apply
    paths, headers, definitions, reviews = prepare
    M.write_table(paths[0], headers, definitions)
    M.write_table(paths[1], M::HEADERS.take(12), reviews)
    R.run([*paths, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewMiningItemsSitesD21618.prepare
  when ['apply'] then ReviewMiningItemsSitesD21618.apply
  else abort 'usage: review-mining-items-sites-D21618.rb [prepare|apply]'
  end
end
