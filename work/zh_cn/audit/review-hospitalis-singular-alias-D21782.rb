#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-short-label-discovery-20261018'

module HospitalisSingularAliasD21782
  extend self
  M = ReviewedNameBatches
  D = 21_782
  ENTITY = 'place:hospitalis-quarters'
  ALIAS = 'Hospitalis Quarter'
  PAIR = '병원 구역(Hospitalis Quarter)'
  TARGETS = {
    ['default', '40601', ''] => '병원 구역',
    ['default', '62156', ''] => '호스피탈리스 구역(Hospitalis Quarters)'
  }.freeze
  NOTE = 'English uses the singular possessive Hospitalis Quarter in two petition-board journals (default:40601 and 62156), referring to the same Adessa district/building as the already registered Hospitalis Quarters. Both Japanese 救護区域 and Chinese 医疗营房 corroborate. Append only this source-supported singular alias to the existing place entity; retain all prior 47 owner findings and the plural canonical. Use established 병원 구역 with source-local English Hospitalis Quarter in the two fresh keys. Bare Hospitalis at default:7670 remains unassigned; this does not establish a general Hospitalis alias. Preserve petition actions, other place names and game tokens. The manual does not directly name this location.'.freeze

  def prepare(inventory)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    owner = glossary.find { |r| r['entity_key'] == ENTITY }
    raise 'Hospitalis owner canonical differs' unless
      owner && owner['english_canonical'] == 'Hospitalis Quarters' &&
      owner['korean_canonical'] == '병원 구역(Hospitalis Quarters)' && owner['status'] == 'confirmed'
    raise 'Hospitalis singular alias is already owned' if glossary.any? do |r|
      [r['english_canonical'], *r['english_aliases'].to_s.split('|')].any? { |t| t.casecmp?(ALIAS) }
    end
    updated_owner = owner.to_h.merge(
      'english_aliases' => [owner['english_aliases'], ALIAS].reject { |t| t.to_s.empty? }.join('|'),
      'evidence_ids' => [owner['evidence_ids'], "D-#{D}"].reject { |t| t.to_s.empty? }.join('|'),
      'notes' => [owner['notes'], NOTE].join("\n")
    )
    old_rows = index.select { |r| r['entity_key'] == ENTITY }
    raise 'expected 47 existing reviewed Hospitalis keys' unless
      old_rows.length == 47 && old_rows.none? { |r| r['status'] == 'needs-context' }
    known = index.map { |r| [r['entity_key'], *M.key(r)] }.to_set
    generated = build_occurrences(inventory.values, [updated_owner]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    fresh = generated.reject { |r| known.include?([ENTITY, *M.key(r)]) }
    raise 'Hospitalis singular exact source scope differs' unless
      generated.length == 49 && fresh.map { |r| M.key(r) }.sort == TARGETS.keys.sort
    reviews = fresh.map do |hit|
      key = M.key(hit)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      raise "source-local Hospitalis alias evidence differs #{key}" unless
        english.include?("Hospitalis Quarter's petition board") &&
        japanese.include?('救護区域') && source.fetch('zh_text').include?('医疗营房')
      old = source.fetch('work_text')
      old_span = TARGETS.fetch(key)
      raise "expected one Hospitalis span #{key}" unless old.scan(old_span).length == 1
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => 'accepted', 'old' => old,
        'new' => old.sub(old_span, PAIR), 'evidence' => NOTE,
        'english' => english, 'japanese' => japanese, 'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
      }
    end
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), reviews)
    [glossary, index, updated_owner, fresh, reviews]
  end

  def run
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    manifest = File.join(__dir__, "proper-name-source-alias-D#{D}.tsv")
    raise 'Hospitalis alias manifest already exists' if File.exist?(manifest)
    glossary, index, owner, fresh, reviews = prepare(M.refresh_inventory)
    M.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers,
                  glossary.map { |r| r['entity_key'] == ENTITY ? owner : r.to_h })
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + fresh)
    M.write_table(manifest, M::HEADERS.take(12), reviews)
    M.run(manifest, D, 1)
    inventory = M.refresh_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    snapshot_name = "proper-name-short-label-discovery-D#{D}.tsv"
    M.write_table(File.join(__dir__, snapshot_name), ShortLabelDiscovery20261018::HEADERS, snapshot)
    M::DOCS.each do |path|
      text = File.read(path)
      marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
      raise "missing checkpoint #{path}" unless text.match?(marker)
      text.sub!(marker) do |block|
        block.sub(/Next batch: D-#{D + 1};[^\n]*/,
                  "Next batch: D-#{D + 1}; continue from `#{snapshot_name}` (#{snapshot.length} bounded groups; not exhaustive or a completion estimate).")
      end
      File.write(path, text)
    end
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'Hospitalis alias residual audit failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0')
    puts validation
    puts "D-#{D}: two singular alias matches/cells; prior 47 findings unchanged; #{snapshot.length} bounded groups remain."
  end
end

HospitalisSingularAliasD21782.run if $PROGRAM_NAME == __FILE__
