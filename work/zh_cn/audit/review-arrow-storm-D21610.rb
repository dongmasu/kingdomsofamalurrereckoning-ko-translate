#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewArrowStormD21610
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_610
  ENTITY = 'skill:arrow-storm'
  IDS = %w[14400 22412 23594 41928 53778].freeze
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  EVIDENCE = <<~TEXT.chomp
    English default:22412 explicitly identifies Arrow Storm as a Longbow
    Special executed from block. Japanese アローストーム and Chinese
    箭矢风暴 corroborate the ability and the three damage-rank descriptions.
    Retain established 화살 폭풍, adding its complete English name once
    per row. Keep the complete existing localized {*1화살 폭풍} token
    byte-identical and put (Arrow Storm) immediately after its closing brace.
    Later same-row Korean mentions are not redundantly annotated.
    Retain +20%, +40%, +60%, max arrows +1 and the block activation meaning.
    All affix/base/default sources were searched; only these five default
    keys contain the exact source name. The official Korean manual
    extraction/reference supplies no direct name entry. No other ability
    or ordinary weather term is classified by inference.
    These are new skill/entity row dispositions, not a recount of historical
    translation judgments. Full discovery/residual validation remains
    incomplete. Published release ZIP unchanged; no in-game rendering test.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    values = {
      'entity_key' => ENTITY, 'english_canonical' => 'Arrow Storm',
      'category' => 'skill', 'korean_canonical' => '화살 폭풍(Arrow Storm)',
      'english_aliases' => '', 'korean_variants' => '화살 폭풍',
      'evidence_ids' => (["D-#{D}"] + IDS.map { |id| "default:#{id}" }).join('|'),
      'status' => 'confirmed', 'notes' => EVIDENCE
    }
    definition = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    generated = build_occurrences(inventory.values, [definition]).map do |row|
      OCCURRENCE_HEADERS.zip(row).to_h
    end
    raise 'unexpected Arrow Storm source coverage' unless
      generated.map { |row| M.key(row) }.sort == IDS.map { |id| ['default', id, ''] }.sort
    reviews = generated.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      if key[1] == '23594'
        raise 'standalone Korean label changed' unless old == '화살 폭풍'
        revised = '화살 폭풍(Arrow Storm)'
      else
        raise 'expected unchanged leading localized skill token' unless old.start_with?('{*1화살 폭풍} - ')
        revised = old.sub('{*1화살 폭풍}', '{*1화살 폭풍}(Arrow Storm)')
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => 'accepted', 'old' => old, 'new' => revised,
        'evidence' => EVIDENCE,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
      }
    end.sort_by { |row| row['ID_Linha'].to_i }
    R.validate!([definition], reviews, generated, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), reviews)
    puts "D-#{D}: one named Longbow Special, five keys, five Texto edits; prepare only."
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'old', 'new')) }
    [glossary.headers, definition, reviews]
  end

  def apply
    headers, definition, reviews = prepare
    M.write_table(DEFINITIONS, headers, [definition])
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewArrowStormD21610.prepare
  when ['apply'] then ReviewArrowStormD21610.apply
  else abort 'usage: review-arrow-storm-D21610.rb [prepare|apply]'
  end
end
