#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module TeethOfNarosD20967
  extend self
  M = ReviewedNameBatches
  ENTITY = 'place:teeth-of-naros'
  DEFINITION = {
    'entity_key' => ENTITY, 'english_canonical' => 'Teeth of Naros', 'category' => 'place',
    'korean_canonical' => '나로스의 이빨(Teeth of Naros)', 'english_aliases' => '',
    'korean_variants' => '나로스의 이빨|나로스의 송곳니|나로스(Naros)의 이빨',
    'evidence_ids' => 'D-20967-D-20969|base:98:11|default:57081',
    'status' => 'confirmed',
    'notes' => 'Named mountain region and corresponding DLC title. English Teeth of Naros, Japanese ナロスの牙 and Chinese 纳罗斯之牙 establish identity; use the established 이빨 spelling consistently. The singular Tooth of Naros, the atomic Teeth of Naros Stone item, and the deity Naros are distinct. The short Teeth is context-dependent, not a global alias. The official manual supplies setting background but no Naros term.'
  }.freeze
  PATTERN = /나로스(?:\(Naros\))?의 (?:이빨|송곳니)(?:\(Teeth of Naros\))?/

  def transform(text, resource, id)
    return text if resource == 'base' && id == '2082'
    raise "unmatched Teeth of Naros rendering #{id}" unless text.match?(PATTERN)
    # The same row also describes the god's literal teeth, not a second place.
    return text.sub(PATTERN, '나로스의 이빨(Teeth of Naros)') if id == '57081'
    text.gsub(PATTERN, '나로스의 이빨(Teeth of Naros)')
  end

  def run
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [DEFINITION]).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    raise "Teeth of Naros scope changed: #{generated.length}" unless generated.length == 145
    reviews = generated.map do |match|
      source = inventory.fetch(M.key(match))
      old = source.fetch('work_text')
      updated = transform(old, match['resource'], match['ID_Linha'])
      excluded = match['resource'] == 'base' && match['ID_Linha'] == '2082'
      status = excluded ? 'excluded' : old == updated ? 'not-an-issue' : 'accepted'
      evidence = if excluded
        'English Teeth of Naros Stone is an atomic named item, not a free-standing region mention. Japanese ナロスの牙の石 and Chinese 纳罗斯之牙之石 corroborate the complete item. Exclude it from place normalization; its full item label is a separate review candidate.'
      else
        'English names the Teeth of Naros region or its corresponding title. Japanese ナロスの牙 and Chinese 纳罗斯之牙 corroborate identity; normalize the established 이빨 rendering and bilingual pair, preserving particles and other names. The manual has general setting background but no Naros spelling.'
      end
      evidence += ' Only the first span is the region; preserve the separate literal teeth of the troll god Naros in the following sentence.' if match['ID_Linha'] == '57081'
      evidence += ' The additional Korean region mention corresponds to contextually shortened the Teeth, not an extra unrelated full name.' if %w[8036 46865].include?(match['ID_Linha'])
      evidence += ' Preserve the second source mention rendered anaphorically as 그곳; do not invent another explicit name.' if match['ID_Linha'] == '26554'
      {
        'resource' => match['resource'], 'ID_Linha' => match['ID_Linha'], 'Tipo_Variante' => match['Tipo_Variante'],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => updated, 'evidence' => evidence,
        'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n"), 'chinese' => source['zh_text'],
        'entity_dispositions_json' => JSON.generate(ENTITY => status), 'previous_status' => '', 'previous_evidence' => ''
      }
    end
    definitions = File.join(__dir__, 'proper-name-discovery-definitions-D20967.tsv')
    proposals = File.join(__dir__, 'proper-name-discovery-D20967.tsv')
    M.write_table(definitions, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, [DEFINITION])
    M.write_table(proposals, M::HEADERS, reviews)
    ReviewedProperNameDiscovery.run([definitions, proposals, '20967'])
  end
end

TeethOfNarosD20967.run if $PROGRAM_NAME == __FILE__
