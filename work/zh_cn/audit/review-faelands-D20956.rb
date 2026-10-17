#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module FaelandsD20956
  extend self
  M = ReviewedNameBatches
  ENTITY = 'place:faelands'
  VARIANT = /(?:패란즈|페이랜드|페이란드|페이란즈|페일랜드|페일란드|패이랜드|파이랜드|페이의 땅)(?: *\((?:The )?Faelands\))?/i
  DEFINITION = {
    'entity_key' => ENTITY, 'english_canonical' => 'Faelands',
    'category' => 'place', 'korean_canonical' => '패란즈(Faelands)',
    'english_aliases' => 'The Faelands',
    'korean_variants' => '페이랜드|페이란드|페이란즈|페일랜드|페일란드|패이랜드|파이랜드|페이의 땅|패란즈',
    'evidence_ids' => 'D-20956-D-20959|base:1908:11|default:46938|official-manual:PDF1|official-manual:PDF3',
    'status' => 'confirmed',
    'notes' => 'Named region, distinct from the world Amalur and the Fae people. Official Korean manual uses 패란즈. The base label retains its English article as 패란즈(The Faelands); prose uses 패란즈(Faelands). Winter/Summer/western qualifiers and Faelands War are retained outside the geographic name. English proper-name use is corroborated by Japanese フェイランド and Chinese 灵族大陆.'
  }.freeze

  def transform(text, resource)
    label = resource == 'base' ? '패란즈(The Faelands)' : '패란즈(Faelands)'
    raise 'unmatched Faelands Korean rendering' unless text.match?(VARIANT)
    particles = {'으로' => '로', '이' => '가', '은' => '는', '을' => '를', '과' => '와'}
    text.gsub(/페이의 땅(으로|[이은을과](?=[\s.,!?]))/) do
      label + particles.fetch(Regexp.last_match(1))
    end.gsub(VARIANT, label)
  end

  def run
    inventory = M.refresh_inventory
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    raise 'Faelands already registered' if glossary.any? { |r| r['entity_key'] == ENTITY }
    generated = build_occurrences(inventory.values, [DEFINITION]).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    raise "Faelands scope changed: #{generated.length}" unless generated.length == 153
    raise 'unexpected Faelands resource distribution' unless generated.group_by { |r| r['resource'] }.transform_values(&:length) == {'base' => 1, 'default' => 152}
    reviews = generated.map do |match|
      source = inventory.fetch(M.key(match))
      old = source.fetch('work_text')
      proposed = transform(old, match['resource'])
      evidence = 'English Faelands denotes the named region, not the Fae species or the world Amalur. Official Korean manual PDF pp. 1 and 3 establishes 패란즈; Japanese フェイランド and Chinese 灵族大陆 corroborate the region. Normalize the exact reviewed Korean name spans with an English label, retaining regional/seasonal/war qualifiers and all unrelated text.'
      if %w[24089 64521 64733 64963].include?(match['ID_Linha'])
        evidence += ' This row rendered the English proper name descriptively as 페이의 땅; the English source and corresponding regional references justify the canonical proper-name form.'
      end
      evidence += ' The base standalone title retains The from the English label.' if match['resource'] == 'base'
      {
        'resource' => match['resource'], 'ID_Linha' => match['ID_Linha'],
        'Tipo_Variante' => match['Tipo_Variante'], 'entity_key' => ENTITY,
        'status' => old == proposed ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => proposed, 'evidence' => evidence,
        'entity_dispositions_json' => '{}', 'previous_status' => '', 'previous_evidence' => ''
      }
    end
    index = M.table(M::INDEX)
    raise 'Faelands index collision' if index.any? { |r| r['entity_key'] == ENTITY }
    M.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + [DEFINITION])
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + generated)
    proposals = File.join(__dir__, 'proper-name-proposals-D20956.tsv')
    M.write_table(proposals, M::HEADERS, reviews)
    M.run(proposals, 20_956, nil)
  end
end

FaelandsD20956.run if $PROGRAM_NAME == __FILE__
