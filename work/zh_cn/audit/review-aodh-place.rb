#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module AodhPlaceReview
  extend self
  M = ReviewedNameBatches
  ENTITY = 'place:aodh'
  DEFINITION = {
    'entity_key' => ENTITY, 'english_canonical' => 'Aodh', 'category' => 'place',
    'korean_canonical' => '아오드(Aodh)', 'english_aliases' => '',
    'korean_variants' => '아오드|애오드', 'evidence_ids' => 'base:2793:11|base:3972:11|default:9405|default:42825',
    'status' => 'confirmed',
    'notes' => 'Named fire temple/ruin, not a person. English ruin/temple and three elemental sites, Japanese エイ and Chinese 奥德 establish the geographic identity. Retain established Korean 아오드 rather than deriving Korean pronunciation solely from Japanese. Distinct from the unique item Fangs of Aodh and the book Aodh: The Mythos of Mayhem; preserve their title heads.'
  }.freeze

  def transform(text, resource, id)
    # The complete item label already pairs its Korean name with English.
    return text if resource == 'base' && id == '4716'
    raise "unmatched Aodh rendering #{id}" unless text.match?(/(?:아오드|애오드)/)
    result = text.gsub(/(?:아오드|애오드)(?:\(Aodh\))?/, '아오드(Aodh)')
    result = result.sub('아오드(Aodh)에게서', '아오드(Aodh)에서') if id == '7484'
    result = result.sub('아오드(Aodh)에게서는', '아오드(Aodh)에서는') if id == '34632'
    result
  end

  def run(start_d)
    inventory = M.refresh_inventory
    matches = build_occurrences(inventory.values, [DEFINITION]).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    raise "Aodh scope changed: #{matches.length}" unless matches.length == 39
    reviews = matches.map do |match|
      source = inventory.fetch(M.key(match))
      old = source.fetch('work_text')
      updated = transform(old, match['resource'], match['ID_Linha'])
      status = old == updated ? 'not-an-issue' : 'accepted'
      evidence = 'English names Aodh as the fire ruin/temple, corroborated by Japanese エイ and Chinese 奥德, including the history at default 9405 and the elemental-site comparison at 42825. Use established 아오드(Aodh), correcting 애오드 and missing bilingual labels, without conflating the place with item/book titles. Official-manual regional and magic context supplies background but does not prescribe this place spelling.'
      evidence += ' Complete The Key to Aodh label already provides the English name; do not duplicate Aodh inside its Korean title.' if match['resource'] == 'base' && match['ID_Linha'] == '4716'
      evidence += ' English from/in this ruin and Japanese location エイで establish a place, so replace person-directed 에게서(는) with location 에서(는).' if %w[7484 34632].include?(match['ID_Linha'])
      {
        'resource' => match['resource'], 'ID_Linha' => match['ID_Linha'], 'Tipo_Variante' => match['Tipo_Variante'],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => updated,
        'evidence' => evidence, 'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n"),
        'chinese' => source['zh_text'], 'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    definitions = File.join(__dir__, "proper-name-discovery-definitions-D#{start_d}.tsv")
    proposals = File.join(__dir__, "proper-name-discovery-D#{start_d}.tsv")
    M.write_table(definitions, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, [DEFINITION])
    M.write_table(proposals, M::HEADERS, reviews)
    ReviewedProperNameDiscovery.run([definitions, proposals, start_d.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-aodh-place.rb START_D' unless ARGV.length == 1
  AodhPlaceReview.run(Integer(ARGV.first))
end
