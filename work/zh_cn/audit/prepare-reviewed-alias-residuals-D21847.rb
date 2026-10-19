#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'

module PrepareReviewedAliasResidualsD21847
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_847
  DEFINITIONS = File.join(__dir__, 'proper-name-alias-expansion-D21847.tsv')
  REVIEWS = File.join(__dir__, 'proper-name-discovery-D21847.tsv')
  ALIASES = {
    'unique_item:grilricas-medallion' => ["Grilricas' Medallion"],
    'place:lollyrs-home' => ["Lollyr's Home"],
    'place:mull-rane' => ['Mull Rane', 'Mull -Rane'],
    'resource:star-thistle' => ['StarThistle'],
    'unique_item:shadow-prism' => ['Shadow Prisms'],
    'monster:niskaru-bloodhunter' => ['Niskaru Bloodhunters'],
    'place:lorca-rane' => ['Lorca Rane'],
    'title:siege-breaker' => ['Siege-breaker']
  }.freeze
  TARGETS = {
    ['base', '4809', '11'] => ['그릴리카스(Grilricas)의 메달', '그릴리카스 메달(Grilricas Medallion)'],
    ['default', '9643', ''] => ['롤리르의 집', "롤리스의 집(Lollyr's Home)"],
    ['default', '2002', ''] => ['멀 레인(Mull Rane)', '멀레인(Mull Rane)'],
    ['default', '10849', ''] => ['멀 레인', '멀레인(Mull Rane)'],
    ['default', '32341', ''] => ['멀-레인', '멀레인(Mull -Rane)'],
    ['default', '26737', ''] => ['스타시슬 (1)', '별엉겅퀴(StarThistle) (1)'],
    ['default', '5793', ''] => ['스타 시슬(Star Thistle) (2)', '별엉겅퀴(StarThistle) (2)'],
    ['default', '23523', ''] => ['그림자 프리즘', '그림자 프리즘(Shadow Prisms)'],
    ['default', '63278', ''] => ['니스카루(Niskaru) 피사냥꾼', '니스카루 피 사냥꾼(Niskaru Bloodhunters)'],
    ['default', '17832', ''] => ['로르카 레인(Lorca Rane)', '로르카레인(Lorca Rane)'],
    ['default', '53563', ''] => ['로르카 레인(Lorca Rane)', '로르카레인(Lorca Rane)'],
    ['default', '4934', ''] => ['공성 파괴자(Siege-Breaker)', '공성 파괴자(Siege-breaker)'],
    ['default', '11547', ''] => ['공성 돌파자(Siege-Breaker)', '공성 파괴자(Siege-breaker)'],
    ['default', '13984', ''] => ['공성 파괴자(Siege-Breaker)', '공성 파괴자(Siege-breaker)'],
    ['default', '28711', ''] => ['공성 파괴자시여', '공성 파괴자(Siege-breaker)시여'],
    ['default', '39487', ''] => ['공성 돌파자', '공성 파괴자(Siege-breaker)'],
    ['default', '53648', ''] => ['공성 돌파자(Siege-Breaker)', '공성 파괴자(Siege-breaker)'],
    ['default', '61200', ''] => ['공성 파괴자여', '공성 파괴자(Siege-breaker)여'],
    ['default', '65039', ''] => ['포위망을 무너뜨린 수정 전쟁(Crystal War)의 영웅', '공성 파괴자(Siege-breaker)']
  }.freeze
  LOCALE_EVIDENCE = {
    'unique_item:grilricas-medallion' => [/그릴리카스|グリルリカス/, /格瑞里加斯/],
    'place:lollyrs-home' => [/ロリーズ/, /洛里斯/],
    'place:mull-rane' => [/ムル[＝・]レイン/, /穆尔莱恩/],
    'resource:star-thistle' => [/スターシスル/, /矢车菊/],
    'unique_item:shadow-prism' => [/シャドウプリズム/, /暗影棱镜/],
    'monster:niskaru-bloodhunter' => [/ブラッドハンター/, /猎血者/],
    'place:lorca-rane' => [/ローカ＝レイン/, /洛卡莱恩/],
    'title:siege-breaker' => [/救国の英雄|包囲を破りし者/, /突围将军|破城者/]
  }.freeze
  HEADERS = %w[entity_key english_alias scope evidence].freeze

  def run(apply: false)
    [DEFINITIONS, REVIEWS, File.join(__dir__, 'proper-name-edits-D21847.tsv'),
     File.join(__dir__, 'named-scope-review-D21847-20261019.md'),
     File.join(__dir__, 'named-scope-edit-addendum-D21847-20261019.md')].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end
    R.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    glossary_table = M.table(R::GLOSSARY)
    glossary = glossary_table.map(&:to_h)
    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    owners = ALIASES.to_h do |entity, additions|
      row = glossary.find { |entry| entry['entity_key'] == entity }
      raise "missing confirmed owner #{entity}" unless row && row['status'] == 'confirmed'
      existing = row['english_aliases'].to_s.split('|').reject(&:empty?)
      raise "alias already owned by #{entity}" if additions.any? { |term| existing.any? { |old| old.casecmp?(term) } }
      additions.each do |term|
        collision = glossary.find do |other|
          next false if other['entity_key'] == entity
          ([other['english_canonical']] + other['english_aliases'].to_s.split('|'))
            .any? { |old| old.casecmp?(term) }
        end
        raise "alias collision #{term}: #{collision['entity_key']}" if collision
      end
      updated = row.dup
      updated['english_aliases'] = (existing + additions).join('|')
      keys = TARGETS.keys.select { |key| additions.any? { |term| inventory.fetch(key).fetch('en_texts_json').include?(term) } }
      updated['evidence_ids'] = (
        updated['evidence_ids'].to_s.split('|') + ["D-#{D}"] +
        keys.map { |resource, id, variant| variant.empty? ? "#{resource}:#{id}" : "#{resource}:#{id}:#{variant}" }
      ).uniq.join('|')
      rationale = "D-#{D}: English source-local punctuation, spacing, or plural spelling is corroborated by aligned Japanese and Chinese. Add only the listed exact English aliases; retain the established entity identity and Korean canonical form. Review every newly matched source row in the batch manifest."
      updated['notes'] = [updated['notes'], rationale].reject(&:empty?).join("\n")
      [entity, updated]
    end
    definitions = ALIASES.flat_map do |entity, terms|
      terms.map do |term|
        {
          'entity_key' => entity, 'english_alias' => term,
          'scope' => TARGETS.keys.select do |key|
            inventory.fetch(key).fetch('en_texts_json').match?(/#{Regexp.escape(term)}/i)
          end.map { |key| key.join(':') }.join('|'),
          'evidence' => LOCALE_EVIDENCE.fetch(entity).map(&:source).join(' / ')
        }
      end
    end
    generated = owners.map { |_entity, owner| build_occurrences(inventory.values, [owner]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end }.flatten
    expected = TARGETS.keys.map { |key| [key, ALIASES.keys.find { |entity| generated.any? { |row| row['entity_key'] == entity && M.key(row) == key } }] }
    raise 'target key has zero or multiple alias owners' unless
      expected.length == TARGETS.length && expected.all? { |key, entity| entity && generated.count { |row| row['entity_key'] == entity && M.key(row) == key } == 1 }
    existing_keys = index.map { |row| [row['entity_key'], M.key(row)] }.to_set
    fresh_matches = generated.reject do |row|
      existing_keys.include?([row['entity_key'], M.key(row)])
    end
    new_matches = fresh_matches.select { |row| TARGETS.key?(M.key(row)) }
    raise "unreviewed fresh alias matches: #{fresh_matches.map { |row| [row['entity_key'], *M.key(row)] }.inspect}" unless
      fresh_matches.map { |row| [row['entity_key'], M.key(row)] }.sort ==
      TARGETS.keys.map { |key| [expected.assoc(key).last, key] }.sort
    raise 'new owner match set differs from reviewed scope' unless new_matches.length == TARGETS.length
    raise 'any proposed owner/key already has an indexed disposition' if
      new_matches.any? { |row| existing_keys.include?([row['entity_key'], M.key(row)]) }

    reviews = new_matches.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      entity = occurrence.fetch('entity_key')
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      ja_regex, zh_regex = LOCALE_EVIDENCE.fetch(entity)
      raise "Japanese evidence missing at #{key}" unless japanese.match?(ja_regex)
      raise "Chinese evidence missing at #{key}" unless chinese.match?(zh_regex)
      before, after = TARGETS.fetch(key)
      old = source.fetch('work_text')
      raise "Korean target span differs at #{key}" unless old.scan(before).length == 1
      alias_label = ALIASES.fetch(entity).find do |term|
        english.match?(/#{Regexp.escape(term)}/i)
      end
      raise "English alias is not explicit at #{key}" unless alias_label
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => 'accepted',
        'old' => old, 'new' => old.sub(before, after),
        'evidence' => "D-#{D}: English identifies the exact source-local #{alias_label} form. Aligned Japanese and Chinese corroborate the same named entity. Reuse #{owners.fetch(entity).fetch('korean_canonical')} and preserve all surrounding text, particles, quantities, tokens, punctuation, and line breaks. The source spelling is registered as an alias of #{entity}; no other entity or prior terminal disposition on this row is changed.",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(entity => 'accepted')
      }
    end
    R.validate_sources!(reviews, inventory)
    new_matches.each { |row| row['status'] = 'needs-context'; row['evidence'] = "New source-local alias match reviewed in D-#{D}." }
    if apply
      M.write_table(R::GLOSSARY, glossary_table.headers,
                    glossary.map { |row| owners.fetch(row['entity_key'], row).to_h })
      M.write_table(M::INDEX, index_table.headers, index + new_matches)
      M.write_table(DEFINITIONS, HEADERS, definitions)
      M.write_table(REVIEWS, M::HEADERS, reviews)
      M.run(REVIEWS, D, 1)
    else
      reviews.group_by { |row| row['resource'] }.each do |resource, rows|
        ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), rows)
      end
    end
    puts "D-#{D} #{apply ? 'applied' : 'prepared'}: #{owners.length} existing entities, #{new_matches.length} exact alias matches."
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'entity_key', 'old', 'new')) }
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then PrepareReviewedAliasResidualsD21847.run
  when ['apply'] then PrepareReviewedAliasResidualsD21847.run(apply: true)
  else abort 'usage: prepare-reviewed-alias-residuals-D21847.rb [prepare|apply]'
  end
end
