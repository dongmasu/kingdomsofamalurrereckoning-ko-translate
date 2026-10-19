#!/usr/bin/env ruby

require_relative 'build-proper-name-discovery-D21775'

module ShrinesDiscoveryD21777
  extend self
  M = ReviewedNameBatches
  D = 21_777
  ENTITIES = {
    'place:shrine-of-air' => ['Shrine of Air', '대기의 성소(Shrine of Air)',
                            %w[114 8343 19082 40644 57440 59266]],
    'place:shrine-of-earth' => ['Shrine of Earth', '대지의 성소(Shrine of Earth)',
                              %w[4600 6955 7092 7256 8204 38755]]
  }.freeze
  EVIDENCE = 'English names two distinct sacred locations in the Teeth of Naros quest: Shrine of Air and Shrine of Earth. The Air site is explicitly a holy site at default:19082; the quest journals 8343/8204 establish their separate objectives. Japanese 大気の聖堂/大地の聖堂 and Chinese 空气神龛/大地神龛 corroborate. Reuse the established paired journal forms 대기의 성소(Shrine of Air) and 대지의 성소(Shrine of Earth). Only exact shrine-name spans change, plus the erroneous directional particle 성소으로 to 성소로. The official Korean manual does not name these DLC locations. Do not infer any new relationship or change other entity findings.'.freeze

  def definitions
    ENTITIES.map do |entity, (english, korean, _ids)|
      {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => 'place', 'korean_canonical' => korean,
        'english_aliases' => '',
        'korean_variants' => entity.end_with?('air') ? '공기의 성소|바람의 성소|바람의 사당' : '대지의 성소',
        'evidence_ids' => "D-#{D}", 'status' => 'confirmed', 'notes' => EVIDENCE
      }
    end
  end

  def proposed(entity, old)
    return old if old.include?(ENTITIES.fetch(entity)[1])
    if entity.end_with?('air')
      old.sub(/(?:공기의 성소|바람의 성소|바람의 사당)/,
              ENTITIES.fetch(entity)[1]).sub('성소(Shrine of Air)으로', '성소(Shrine of Air)로')
    else
      old.sub('대지의 성소', ENTITIES.fetch(entity)[1])
    end
  end

  def reviews(inventory)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    ENTITIES.each do |entity, (_english, _korean, ids)|
      found = generated.select { |r| r['entity_key'] == entity }.map { |r| M.key(r) }
      raise "shrine exact source coverage differs: #{entity}" unless
        found.sort == ids.map { |id| ['default', id, ''] }.sort
    end
    generated.sort_by { |r| r.fetch('ID_Linha').to_i }.map do |hit|
      key = M.key(hit)
      source = inventory.fetch(key)
      old = hit.fetch('korean_current')
      new_text = proposed(hit.fetch('entity_key'), old)
      status = new_text == old ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => hit.fetch('entity_key'), 'status' => status,
        'old' => old, 'new' => new_text, 'evidence' => EVIDENCE,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(hit.fetch('entity_key') => status)
      }
    end.tap do |rows|
      raise 'expected ten reviewed shrine edits' unless rows.count { |r| r['old'] != r['new'] } == 10
    end
  end

  def run
    definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
    review_path = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
    raise 'preserve existing shrine manifests' if [definition_path, review_path].any? { |p| File.exist?(p) }
    inventory = M.refresh_inventory
    reviewed = reviews(inventory)
    M.write_table(definition_path, ProperNameDiscoveryD21775::DEFINITION_HEADERS, definitions)
    M.write_table(review_path, ProperNameDiscoveryD21775::REVIEW_HEADERS, reviewed)
    ReviewedProperNameDiscovery.run([definition_path, review_path, D.to_s])
    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    snapshot_name = "proper-name-short-label-discovery-D#{D}.tsv"
    M.write_table(File.join(__dir__, snapshot_name), ShortLabelDiscovery20261018::HEADERS, snapshot)
    M::DOCS.each do |path|
      text = File.read(path)
      marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
      raise "missing current checkpoint: #{path}" unless text.match?(marker)
      text.sub!(marker) do |block|
        block.sub(/Next batch: D-#{D + 1};[^\n]*/,
                  "Next batch: D-#{D + 1}; continue from `#{snapshot_name}` (#{snapshot.length} bounded groups; not exhaustive or a completion estimate).")
      end
      File.write(path, text)
    end
    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'shrine residual audit failed' unless residual.include?('missing=0') && residual.include?('undocumented extras=0')
    puts validation
    puts residual.lines.grep(/\A(?:Source\/|Terminal matches)/)
    puts "D-#{D}: 12 reviewed shrine keys, 10 edited cells; #{snapshot.length} bounded groups remain."
  end
end

ShrinesDiscoveryD21777.run if $PROGRAM_NAME == __FILE__
