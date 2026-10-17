#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module WitheringWarD20965
  extend self
  M = ReviewedNameBatches
  ENTITY = 'event:withering-war'
  DEFINITION = {
    'entity_key' => ENTITY, 'english_canonical' => 'Withering War',
    'category' => 'named event', 'korean_canonical' => '쇠락 전쟁(Withering War)',
    'english_aliases' => '',
    'korean_variants' => '쇠락 전쟁|위더링 전쟁|쇠퇴 전쟁|쇠락의 전쟁|시들음 전쟁|시들어 가는 전쟁|시드는 전쟁|시듦의 전쟁',
    'evidence_ids' => 'D-20965|default:4017|default:11236|default:31067|default:61425',
    'status' => 'confirmed',
    'notes' => 'Named historical Fae war; English Withering War, Japanese ウィサリング戦争 and Chinese 凋零之战 establish identity. Existing source-faithful 쇠락 전쟁 is preferred. Generic withering affixes, Curse of Withering, and standalone Withering are not aliases. The manual supplies Fae/court context, not a spelling for this historical war.'
  }.freeze
  VARIANT = /(?:쇠락(?:의)? 전쟁|위더링 전쟁|쇠퇴 전쟁|시들음 전쟁|시들어 가는 전쟁|시드는 전쟁|시듦의 전쟁)(?:\(Withering War\))?/

  def transform(text)
    raise 'unmatched Withering War rendering' unless text.match?(VARIANT)
    text.gsub(VARIANT, '쇠락 전쟁(Withering War)')
  end

  def run
    inventory = M.refresh_inventory
    path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(path)
    raise 'Withering War already registered' if glossary.any? { |r| r['entity_key'] == ENTITY }
    generated = build_occurrences(inventory.values, [DEFINITION]).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    raise "Withering War scope changed: #{generated.length}" unless generated.length == 23
    raise 'unexpected non-default Withering War match' unless generated.all? { |r| r['resource'] == 'default' }
    reviews = generated.map do |match|
      source = inventory.fetch(M.key(match))
      old = source.fetch('work_text')
      updated = transform(old)
      evidence = 'English explicitly names the Withering War, independently corroborated by Japanese ウィサリング戦争 and Chinese 凋零之战. Standardize the historical-war title to established 쇠락 전쟁(Withering War), retaining every subtitle, possessive, copula and unrelated clause. The official-manual Fae/court setting is background only. Bare Withering and ordinary withering words were checked separately and are not registered as war aliases.'
      evidence += ' Review all four name mentions in the Aodh history separately from the place-name edits.' if match['ID_Linha'] == '9405'
      evidence += ' Review all three war-name mentions in the historical account; preserve the separate generic 쇠퇴 word.' if match['ID_Linha'] == '31067'
      {
        'resource' => match['resource'], 'ID_Linha' => match['ID_Linha'], 'Tipo_Variante' => match['Tipo_Variante'],
        'entity_key' => ENTITY, 'status' => old == updated ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => updated, 'evidence' => evidence,
        'entity_dispositions_json' => '{}', 'previous_status' => '', 'previous_evidence' => ''
      }
    end
    index = M.table(M::INDEX)
    raise 'Withering War index collision' if index.any? { |r| r['entity_key'] == ENTITY }
    M.write_table(path, glossary.headers, glossary.map(&:to_h) + [DEFINITION])
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + generated)
    proposals = File.join(__dir__, 'proper-name-proposals-D20965.tsv')
    M.write_table(proposals, M::HEADERS, reviews)
    M.run(proposals, 20_965, nil)
  end
end

WitheringWarD20965.run if $PROGRAM_NAME == __FILE__
