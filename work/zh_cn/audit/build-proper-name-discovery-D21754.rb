#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-occurrences'

module ProperNameDiscoveryD21754
  extend self
  M = ReviewedNameBatches
  DEFINITION_PATH = File.join(__dir__, 'proper-name-discovery-definitions-D21754.tsv')
  OUTPUT_PATH = File.join(__dir__, 'proper-name-discovery-D21754.tsv')
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese entity_dispositions_json
  ].freeze
  ENTITY_COUNTS = {
    'resource:gallows-bloom' => 5,
    'place:glasspillar-caves' => 4,
    'place:grave-of-gridge' => 2,
    'unique_item:grilricas-medallion' => 4
  }.freeze

  def proposed_text(entity, korean)
    patterns = {
      'resource:gallows-bloom' =>
        /교수대(?:의)? 꽃(?:\(Gallows Bloom\))?/,
      'place:glasspillar-caves' =>
        /(?:글래스필러|글라스필러|유리기둥) 동굴(?:\(Glasspillar Caves\))?/,
      'place:grave-of-gridge' =>
        /그리지(?:\(Gridge\))?의 무덤(?:\(Grave of Gridge\))?/,
      'unique_item:grilricas-medallion' =>
        /그릴리카스(?:\(Grilricas\))?(?:의)? 메달(?:\(Grilricas Medallion\))?/
    }
    canonical = {
      'resource:gallows-bloom' => '교수대 꽃(Gallows Bloom)',
      'place:glasspillar-caves' => '글래스필러 동굴(Glasspillar Caves)',
      'place:grave-of-gridge' => '그리지의 무덤(Grave of Gridge)',
      'unique_item:grilricas-medallion' => '그릴리카스 메달(Grilricas Medallion)'
    }
    pattern = patterns.fetch(entity)
    raise "missing reviewed Korean span for #{entity}: #{korean[0, 160]}" unless
      korean.match?(pattern)

    korean.gsub(pattern, canonical.fetch(entity))
  end

  def evidence(entity, key)
    case entity
    when 'resource:gallows-bloom'
      "English identifies Gallows Bloom as the named reagent/flower; Japanese ガローズの花 and Chinese 绞架花/绞架之花 corroborate. Reuse 교수대 꽃(Gallows Bloom). Preserve D-19777's separate ID 30159 correction without reopening or recounting it. Exact key: #{key.join(':')}."
    when 'place:glasspillar-caves'
      "English identifies the named cave destination; Japanese グラスピラー洞窟 and Chinese 玻璃柱洞穴 corroborate. Reuse 글래스필러 동굴(Glasspillar Caves); normalize only this place span. D-19147's separate translation finding at ID 25347 is not reopened or recounted. Exact key: #{key.join(':')}."
    when 'place:grave-of-gridge'
      "English, Japanese グリッジの墓, and Chinese 格里治之墓 identify the named grave location. Use 그리지의 무덤(Grave of Gridge); do not infer a separate Gridge person entity. Exact key: #{key.join(':')}."
    when 'unique_item:grilricas-medallion'
      "English identifies this as one of the specific objects stolen for admission to the Travelers; Japanese グリルリカスのメダル and Chinese 格瑞里加斯奖章 corroborate. Use 그릴리카스 메달(Grilricas Medallion), without inferring who Grilricas was. Exact key: #{key.join(':')}."
    else
      raise "unhandled entity #{entity}"
    end
  end

  def build
    raise 'discovery output already exists; preserve the prior review' if File.exist?(OUTPUT_PATH)
    definitions = M.table(DEFINITION_PATH).map(&:to_h)
    inventory = M.refresh_inventory
    hits = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    actual_counts = hits.group_by { |row| row.fetch('entity_key') }
      .transform_values(&:length)
    raise "unexpected exact-source match counts: #{actual_counts.inspect}" unless
      actual_counts == ENTITY_COUNTS
    rows = hits.map do |hit|
      key = M.key(hit)
      entity = hit.fetch('entity_key')
      old = hit.fetch('korean_current')
      new_text = proposed_text(entity, old)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => evidence(entity, key),
        'english' => hit.fetch('english_source').split("\n---\n").join("\n"),
        'japanese' => JSON.parse(inventory.fetch(key).fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => inventory.fetch(key).fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
    M.write_table(OUTPUT_PATH, HEADERS, rows)
    puts "Wrote #{rows.length} exact source matches: #{rows.group_by { |row| row['status'] }.transform_values(&:length)}"
    puts OUTPUT_PATH
  end
end

ProperNameDiscoveryD21754.build if $PROGRAM_NAME == __FILE__
