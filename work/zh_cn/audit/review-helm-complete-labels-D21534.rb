#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module HelmCompleteLabelsD21534
  extend self

  M = ReviewedNameBatches
  D = 21_534
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  LABELS = [
    ['834', 'helm-of-the-coast', 'Helm of the Coast', '해안의 투구', '해안의 투구'],
    ['873', 'helm-of-the-durek', 'Helm of the Durek', '듀렉(Durek)의 투구', '듀렉의 투구'],
    ['1584', 'helm-of-the-crucible', 'Helm of the Crucible', '도가니의 투구', '도가니의 투구'],
    ['2216', 'helm-of-the-martyr', 'Helm of the Martyr', '순교자의 투구', '순교자의 투구'],
    ['2478', 'helm-of-helius', 'Helm of Helius', '헬리우스(Helius)의 투구', '헬리우스의 투구'],
    ['2725', 'helm-of-ward-rede', 'Helm of Ward Rede', '경고의 투구', '경고의 투구'],
    ['3120', 'wraths-helm', "Wrath's Helm", '격노의 투구', '격노의 투구'],
    ['3202', 'remnant-helm', 'Remnant Helm', '잔재 투구', '잔재 투구'],
    ['3467', 'helm-of-the-legion', 'Helm of the Legion', '군단의 투구', '군단의 투구'],
    ['3488', 'castaways-helm', "Castaway's Helm", '조난자의 투구', '조난자의 투구'],
    ['3661', 'helm-of-hideous-visage', 'Helm of Hideous Visage', '흉측한 얼굴의 투구', '흉측한 얼굴의 투구'],
    ['4056', 'helm-of-bolgans-bane', "Helm of Bolgans' Bane", '볼간(Bolgan)을 처치하는 투구', '볼간을 처치하는 투구'],
    ['4388', 'osts-helm', "Ost's Helm", '오스트(Ost)의 투구', '오스트의 투구'],
    ['4545', 'gaeas-helm', "Gaea's Helm", '가이아(Gaea)의 투구', '가이아의 투구']
  ].freeze
  EVIDENCE = 'English base names a complete equipment label; aligned Japanese and Chinese corroborate. Pair only that exact label, preserving its existing Korean wording. This is an item-label registration, not an assertion of rarity, a person identity, or equivalence to similarly named skills, places, or factions. Earlier entity/key dispositions, including Wrath skill exclusion and Ost/Helius/Gaea person or deity judgments, remain unchanged. Generic helm classes and the historical Hotheaded Helm hold are outside this scope.'

  def entities
    LABELS.map do |id, slug, english, old, korean|
      {
        'entity_key' => "item:#{slug}",
        'english_canonical' => english,
        'category' => 'item',
        'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '',
        'korean_variants' => old,
        'evidence_ids' => "D-#{D}|base:#{id}:11",
        'status' => 'confirmed',
        'notes' => EVIDENCE
      }
    end
  end

  def reviews(inventory)
    generated = build_occurrences(inventory.values, entities).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = LABELS.map { |id, slug, *_| ["item:#{slug}", 'base', id, '11'] }.sort
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    raise "complete helm source coverage differs: #{actual.inspect}" unless actual == expected

    labels = LABELS.to_h { |id, slug, english, old, korean| [id, [slug, english, old, korean]] }
    generated.map do |occurrence|
      source = inventory.fetch(M.key(occurrence))
      _slug, english, old, korean = labels.fetch(source.fetch('ID_Linha'))
      raise 'unexpected complete English label' unless JSON.parse(source.fetch('en_texts_json')).compact == [english]
      raise 'stale complete Korean label' unless source.fetch('work_text') == old

      occurrence.merge(
        'status' => 'accepted', 'old' => old, 'new' => "#{korean}(#{english})",
        'evidence' => EVIDENCE,
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(occurrence.fetch('entity_key') => 'accepted'),
        'previous_status' => '', 'previous_evidence' => ''
      )
    end
  end

  def apply
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    rows = reviews(inventory)
    M.write_table(DEFINITIONS, glossary.headers, entities)
    M.write_table(REVIEWS, M::HEADERS, rows)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

HelmCompleteLabelsD21534.apply if $PROGRAM_NAME == __FILE__
