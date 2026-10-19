#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewWardingVortexD21622
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_622
  SPECS = [
    ['skill:warding-blast', 'Warding Blast', '수호 폭발', '10592', '수호의 폭발'],
    ['skill:mages-vortex', "Mage's Vortex", '마법사의 소용돌이', '12387', '마법사 소용돌이']
  ].freeze
  SHARED = %w[42670 49345 50229].freeze
  EVIDENCE = <<~TEXT.chomp
    English default:42670/49345 explicitly call Mage's Vortex and Warding
    Blast special attacks. default:50229 defines the Staff block attack
    that groups enemies and the Sceptre block attack that launches a
    projectile. This contextual evidence, missed by the earlier isolated
    label proposal, supports two named skill entries. Japanese
    メイジボルテックス/ウォーディングブラスト and Chinese 法师漩涡/守护冲击
    corroborate the source spans. Add complete English annotations to the
    standalone labels and immediately after the existing localized {*1...}
    closing braces. Preserve every localized marker byte, the optional
    Korean genitive particle variants, actions, values, line endings and
    unrelated text. Canonical labels use the existing standalone Korean
    forms; genitive/non-genitive token forms are grammatical variants,
    not different skill identities. All affix/base/default sources were
    checked: four occurrences per skill, five distinct default rows.
    The official Korean manual extraction/reference do not directly name
    these attacks. No PAK material, global translation recount, release
    update or inferred relationship to other abilities is involved.
    Full residual discovery/validation continues after this batch.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    glossary, index = M.table(R::GLOSSARY), M.table(M::INDEX)
    definitions, generated, reviews_by_key = [], [], {}
    SPECS.each do |entity, english, korean, label_id, variant|
      keys = ([label_id] + SHARED).map { |id| ['default', id, ''] }
      values = {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => 'skill', 'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '', 'korean_variants' => "#{korean}|#{variant}",
        'evidence_ids' => (["D-#{D}"] + keys.map { |key| key.reject(&:empty?).join(':') }).join('|'),
        'status' => 'confirmed', 'notes' => EVIDENCE
      }
      definition = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
      matches = build_occurrences(inventory.values, [definition]).map { |row| OCCURRENCE_HEADERS.zip(row).to_h }
      raise "unexpected source coverage #{english}" unless matches.map { |r| M.key(r) }.sort == keys.sort
      definitions << definition
      generated.concat(matches)
      matches.each do |match|
        key = M.key(match)
        source = inventory.fetch(key)
        review = reviews_by_key[key] ||= {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'entity_key' => '', 'status' => 'accepted', 'old' => source['work_text'],
          'new' => source['work_text'].dup, 'evidence' => EVIDENCE,
          'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
          'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
          'chinese' => source['zh_text'], 'entity_dispositions_json' => '{}'
        }
        if key[1] == label_id
          raise 'standalone label differs' unless review['new'] == korean
          review['new'] = "#{korean}(#{english})"
        else
          pattern = /\{\*1(?:#{Regexp.escape(korean)}|#{Regexp.escape(variant)})\}/
          raise 'missing/duplicate localized skill marker' unless review['new'].scan(pattern).length == 1
          review['new'].sub!(pattern) { |marker| "#{marker}(#{english})" }
        end
        review['entity_key'] = [review['entity_key'], entity].reject(&:empty?).join('|')
        review['entity_dispositions_json'] = JSON.generate(JSON.parse(review['entity_dispositions_json']).merge(entity => 'accepted'))
      end
    end
    reviews = reviews_by_key.values.sort_by { |r| r['ID_Linha'].to_i }
    raise 'scope differs' unless reviews.length == 5 && generated.length == 8
    R.validate!(definitions, reviews, generated, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), reviews)
    puts "D-#{D}: two skills, eight new occurrence keys, five reviewed/edited default rows."
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'old', 'new')) }
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    definition_path = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
    review_path = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
    raise 'discovery artifacts already exist' if [definition_path, review_path].any? { |path| File.exist?(path) }
    M.write_table(definition_path, headers, definitions)
    M.write_table(review_path, M::HEADERS.take(12), reviews)
    R.run([definition_path, review_path, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewWardingVortexD21622.prepare
  when ['apply'] then ReviewWardingVortexD21622.apply
  else abort 'usage: review-warding-vortex-D21622.rb [prepare|apply]'
  end
end
