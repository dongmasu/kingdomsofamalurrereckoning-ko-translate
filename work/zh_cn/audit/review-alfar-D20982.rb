#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module AlfarD20982
  extend self
  M = ReviewedNameBatches
  ENTITY = 'people:alfar'
  DEFINITION = {
    'entity_key' => ENTITY, 'english_canonical' => 'Alfar', 'category' => 'people',
    'korean_canonical' => '알파르(Alfar)', 'english_aliases' => '',
    'korean_variants' => '알파르|알파르어', 'evidence_ids' => 'D-20982-D-20991|default:3613|default:26150|default:51625',
    'status' => 'confirmed',
    'notes' => 'Umbrella ethnonym, also used attributively and for the Alfar language. English an Alfar and the shared ancestry of Ljosalfar/Dokkalfar establish identity; Japanese アルファー and Chinese 精灵 corroborate. The manual establishes the two subgroup names 료스알브 and 도크알브, not a merger of their identities. Preserve military/item heads, plural suffixes and the existing complete Wild Alfar compound; language context uses 알파르어(Alfar).'
  }.freeze

  def transform(text, id)
    if id == '51625'
      target = '료스알브와 도크알브, 알마인(Almain)'
      raise 'Alfar subgroup paraphrase changed' unless text.include?(target)
      return text.sub(target, '알파르(Alfar)의 두 갈래인 료스알브(Ljosalfar)와 도크알브(Dokkalfar), 알마인(Almain)')
    end
    raise "unmatched Alfar rendering #{id}" unless text.include?('알파르')
    language = text.gsub(/알파르(?:\(Alfar\))?어(?:\(Alfar\))?/, '알파르어(Alfar)')
    language.gsub(/알파르(?:어)?(?:\([^()\r\n]+\))?/) do |match|
      # Complete bilingual compounds already cover this component ethnonym.
      match.include?('(') ? match : "#{match}(Alfar)"
    end
  end

  def run
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [DEFINITION]).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    raise "Alfar scope changed: #{generated.length}" unless generated.length == 460
    raise 'unexpected Alfar resource distribution' unless generated.group_by { |r| r['resource'] }.transform_values(&:length) == {'base' => 6, 'default' => 454}
    reviews = generated.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      updated = transform(old, key[1])
      status = old == updated ? 'not-an-issue' : 'accepted'
      evidence = 'English Alfar denotes the umbrella people, their attributive identity, or their language, not either individual Ljosalfar/Dokkalfar subgroup alone. Japanese アルファー and Chinese 精灵 corroborate the shared referent. Add the missing ethnonym label, retaining every military/item/role head, plural suffix and particle. In language context keep 어 inside the Korean label as 알파르어(Alfar). The official manual establishes subgroup terminology and background, not an alternative spelling for the umbrella term.'
      evidence += ' English both varieties of Alfar is already explained by the Korean subgroup names. Retain that explanation with manual-established bilingual subgroup names and restore the explicit English umbrella name rather than replacing either subgroup with the other.' if key[1] == '51625'
      evidence += ' Preserve the complete existing 야생 알파르(Wild Alfar) pair; its English label already covers the ethnonym.' if key[1] == '23013'
      evidence += ' Preserve the existing Korean rendering of the invocation; only append the source-supported Alfar label, corroborated by Japanese アルファー and Chinese 精灵.' if key[1] == '53493'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => updated,
        'evidence' => evidence, 'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n"), 'chinese' => source['zh_text'],
        'entity_dispositions_json' => JSON.generate(ENTITY => status), 'previous_status' => '', 'previous_evidence' => ''
      }
    end
    definitions = File.join(__dir__, 'proper-name-discovery-definitions-D20982.tsv')
    proposals = File.join(__dir__, 'proper-name-discovery-D20982.tsv')
    M.write_table(definitions, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, [DEFINITION])
    M.write_table(proposals, M::HEADERS, reviews)
    ReviewedProperNameDiscovery.run([definitions, proposals, '20982'])
  end
end

AlfarD20982.run if $PROGRAM_NAME == __FILE__
