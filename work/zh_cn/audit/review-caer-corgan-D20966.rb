#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module CaerCorganD20966
  extend self
  M = ReviewedNameBatches
  SPECS = [
    ['place:corgan-hold', 'Corgan Hold', '코르간 요새', /(?:코건 (?:홀드|홀|요새|성채)|코르간(?:\(Corgan\))? (?:요새|홀드))(?:\(Corgan Hold\))?/, 13, 'default:34448|default:34706', 'English ancestral estate/Alfar stronghold, Japanese コルガン砦, Chinese 科尔根要塞. Bare Corgan at default 55716 is not a verified alias.'],
    ['place:caer-elatha', 'Caer Elatha', '케어 엘라사', /(?:케어|카에르) 엘라[사타](?:\(Caer Elatha\))?/, 22, 'base:534:11|default:26306', 'English Fae hollow, Japanese ケア・エラサ, Chinese 卡尔埃莱萨 support established base 엘라사 over 엘라타.'],
    ['place:caer-drya', 'Caer Drya', '케어 드라이아', /(?:케어|카에르) 드(?:라이아|리아)(?:\(Caer Drya\))?/, 3, 'base:2558:11|default:53833', 'English ancient Fae stronghold of Ragnall, Japanese ケア・ドライア and Chinese 卡尔迪亚 support the complete geographic name.'],
    ['place:caer-tosai', 'Caer Tosai', '케어 토사이', /(?:케어|카에르) 토사이(?:\(Caer Tosai\))?/, 3, 'default:1095|default:12998|default:16254', 'English named hollow, Japanese ケア・トサイ and Chinese 托赛要塞 establish the geographic identity.'],
    ['place:caer-purendal', 'Caer Purendal', '케어 푸렌달', /케어 푸렌달(?:\(Caer Purendal\))?/, 2, 'base:1485:11|default:16573', 'Two aligned English/Japanese/Chinese geographic labels corroborate the existing consistent full name; do not infer a structure subtype.'],
    ['place:caer-ohn', 'Caer Ohn', '케어 오운', /케어 오운(?:\(Caer Ohn\))?/, 1, 'base:4132:11', 'Retain the source-aligned existing complete geographic label. This does not decide the spelling or identity of the separate Lord Ohn name family.']
  ].freeze

  def run
    inventory = M.refresh_inventory
    definitions = SPECS.map do |key, english, korean, _pattern, _count, ids, notes|
      {
        'entity_key' => key, 'english_canonical' => english, 'category' => 'place',
        'korean_canonical' => "#{korean}(#{english})", 'english_aliases' => '',
        'korean_variants' => korean, 'evidence_ids' => "D-20966|#{ids}",
        'status' => 'confirmed', 'notes' => notes
      }
    end
    generated = build_occurrences(inventory.values, definitions).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    raise "Caer/Corgan scope changed: #{generated.length}" unless generated.length == 44
    SPECS.each do |key, _english, _korean, _pattern, count, _ids, _notes|
      raise "#{key} count changed" unless generated.count { |r| r['entity_key'] == key } == count
    end
    reviews = generated.map do |match|
      spec = SPECS.find { |s| s.first == match['entity_key'] }
      _key, english, korean, pattern, _count, _ids, notes = spec
      source = inventory.fetch(M.key(match))
      old = source.fetch('work_text')
      raise "unmatched place span #{M.key(match).inspect}" unless old.match?(pattern)
      updated = old.gsub(pattern, "#{korean}(#{english})")
      status = old == updated ? 'not-an-issue' : 'accepted'
      {
        'resource' => match['resource'], 'ID_Linha' => match['ID_Linha'], 'Tipo_Variante' => match['Tipo_Variante'],
        'entity_key' => match['entity_key'], 'status' => status, 'old' => old, 'new' => updated,
        'evidence' => "#{notes} Standardize only verified full-name spans, retaining source item/map heads, title grammar, particles and other entities. The official manual supplies Fae/region background, not spellings for these sites. Caer Nyralim and standalone Corgan are outside this scope.",
        'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n"),
        'chinese' => source['zh_text'], 'entity_dispositions_json' => JSON.generate(match['entity_key'] => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    # The source inventory already groups these disjoint complete place names.
    raise 'overlapping Caer/Corgan row' unless reviews.map { |r| M.key(r) }.uniq.length == reviews.length
    definitions_path = File.join(__dir__, 'proper-name-discovery-definitions-D20966.tsv')
    proposals = File.join(__dir__, 'proper-name-discovery-D20966.tsv')
    M.write_table(definitions_path, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, definitions)
    M.write_table(proposals, M::HEADERS, reviews)
    ReviewedProperNameDiscovery.run([definitions_path, proposals, '20966'])
  end
end

CaerCorganD20966.run if $PROGRAM_NAME == __FILE__
