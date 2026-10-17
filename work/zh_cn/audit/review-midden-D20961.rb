#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module MiddenD20961
  extend self
  M = ReviewedNameBatches
  ENTITY = 'place:the-midden'
  DEFINITION = {
    'entity_key' => ENTITY, 'english_canonical' => 'The Midden',
    'category' => 'place', 'korean_canonical' => '미든(The Midden)',
    'english_aliases' => 'Midden', 'korean_variants' => '미든|머든|납골당',
    'evidence_ids' => 'D-20961-D-20963|base:4107:11|default:54587|default:51345',
    'status' => 'confirmed',
    'notes' => 'Named Winter Fae burial region, not the generic noun midden. English The Midden, Japanese ミッデン, Chinese 贝冢, and the cross-row Winter Fae/Sorrows context establish the place. Default 49001 and 63930 refer to generic refuse heaps and are excluded. The manual supplies Winter Court/Fae setting background, not a spelling for this region.'
  }.freeze

  def transform(text, id)
    return text.sub('미든에서', '오물 더미에서') if id == '49001'
    return text if id == '63930'
    if id == '57911'
      raise 'missing descriptive place rendering' unless text.include?('납골당과')
      return text.sub('납골당과', '미든(The Midden)과')
    end
    pattern = /(?:미든|머든)(?: *\((?:The )?Midden\))?/
    raise "unmatched Midden place rendering #{id}" unless text.match?(pattern)
    text.gsub(pattern, '미든(The Midden)')
  end

  def run
    inventory = M.refresh_inventory
    path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(path)
    raise 'Midden already registered' if glossary.any? { |r| r['entity_key'] == ENTITY }
    generated = build_occurrences(inventory.values, [DEFINITION]).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    raise "Midden scope changed: #{generated.length}" unless generated.length == 120
    reviews = generated.map do |match|
      source = inventory.fetch(M.key(match))
      old = source.fetch('work_text')
      id = match['ID_Linha']
      new_text = transform(old, id)
      generic = match['resource'] == 'default' && %w[49001 63930].include?(id)
      entity_status = generic ? 'excluded' : old == new_text ? 'not-an-issue' : 'accepted'
      status = old == new_text ? entity_status : 'accepted'
      evidence = if generic
        'English lowercase a midden is a generic refuse heap, not the named Winter Fae region. Japanese 塚/ごみの山 and the Aodh/artifact context distinguish the ordinary noun. Exclude this entity match.'
      else
        'English identifies the Winter Fae burial region The Midden; Japanese ミッデン and Chinese 贝冢 corroborate. Normalize all place-name mentions to 미든(The Midden), retaining possessives, Korean particles, and the Stone of the Midden item head. Official-manual Winter Court/Fae background is contextual, not a source for this unattested place spelling.'
      end
      evidence += ' Correct the mistaken transliteration 미든 to 오물 더미 at 49001, without labeling it as a proper place.' if id == '49001'
      evidence += ' The Korean descriptive 납골당 here represents the named region, not an unrelated building.' if id == '57911'
      {
        'resource' => match['resource'], 'ID_Linha' => id, 'Tipo_Variante' => match['Tipo_Variante'],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => evidence, 'entity_dispositions_json' => JSON.generate(ENTITY => entity_status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    raise 'Midden place/generic split changed' unless reviews.count { |r| JSON.parse(r['entity_dispositions_json'])[ENTITY] == 'excluded' } == 2
    index = M.table(M::INDEX)
    raise 'Midden index collision' if index.any? { |r| r['entity_key'] == ENTITY }
    M.write_table(path, glossary.headers, glossary.map(&:to_h) + [DEFINITION])
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + generated)
    proposals = File.join(__dir__, 'proper-name-proposals-D20961.tsv')
    M.write_table(proposals, M::HEADERS, reviews)
    M.run(proposals, 20_961, nil)
  end
end

MiddenD20961.run if $PROGRAM_NAME == __FILE__
