#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module HeroAndMaidD20981
  extend self
  M = ReviewedNameBatches
  ENTITY = 'work:the-hero-and-the-maid'
  DEFINITION = {
    'entity_key' => ENTITY, 'english_canonical' => 'The Hero and the Maid', 'category' => 'named work',
    'korean_canonical' => '영웅과 시녀(The Hero and the Maid)', 'english_aliases' => 'Hero and the Maid',
    'korean_variants' => '영웅과 시녀|영웅과 처녀',
    'evidence_ids' => 'D-20981|D-19606|base:4585:11|default:16530|default:42887',
    'status' => 'confirmed',
    'notes' => 'Named ballad and its Fae Cairn, explicitly called a ballad/song at default 16530/42887. Japanese 英雄と烈女 and Chinese 英雄与少女 corroborate. Use established 영웅과 시녀 and retain complete English title atomically; the component Maid is not a standalone person alias here. Default 12288/33782 are poetic mourning for the characters, not explicit references to an owned/retrieved song object, and are excluded from title insertion.'
  }.freeze

  def transform(text, resource, id)
    return text if %w[12288 33782].include?(id)
    english = resource == 'base' ? 'Hero and the Maid' : 'The Hero and the Maid'
    raise "unmatched Hero and Maid title #{id}" unless text.match?(/영웅과 (?:시녀|처녀)/)
    updated = text.gsub(/영웅과 (?:시녀|처녀)(?:\((?:The )?Hero and the Maid\))?/, "영웅과 시녀(#{english})")
    updated = updated.sub('(The Hero and the Maid)에게 쓰였다면', '(The Hero and the Maid)에 쓰였다면') if id == '60372'
    updated
  end

  def run
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [DEFINITION]).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    raise "Hero and Maid scope changed: #{generated.length}" unless generated.length == 17
    reviews = generated.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      updated = transform(old, key[0], key[1])
      excluded = %w[12288 33782].include?(key[1])
      status = excluded ? 'excluded' : old == updated ? 'not-an-issue' : 'accepted'
      evidence = if excluded
        'The poem ends with mourners grieving the Hero and the Maid as characters; it does not explicitly name a retrieved/owned ballad object here. Do not force the atomic work title into the poetic character-reference clause.'
      else
        'English explicitly names the ballad/Fae Cairn The Hero and the Maid, with Japanese 英雄と烈女 and Chinese 英雄与少女 corroborating. Use established 영웅과 시녀 and a complete English title, not a nested personal Maid label. Preserve quotation punctuation, including the pre-existing unmatched opening quotation mark at default 20179.'
      end
      evidence += ' English used on the song and the aligned Japanese/Chinese wording establish an inanimate work; correct person-directed 에게 to 에.' if key[1] == '60372'
      evidence += ' Correct the lone 영웅과 처녀 title variant to the established 영웅과 시녀.' if key[1] == '64449'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => updated,
        'evidence' => evidence, 'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n"), 'chinese' => source['zh_text'],
        'entity_dispositions_json' => JSON.generate(ENTITY => status), 'previous_status' => '', 'previous_evidence' => ''
      }
    end
    definitions = File.join(__dir__, 'proper-name-discovery-definitions-D20981.tsv')
    proposals = File.join(__dir__, 'proper-name-discovery-D20981.tsv')
    M.write_table(definitions, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, [DEFINITION])
    M.write_table(proposals, M::HEADERS, reviews)
    ReviewedProperNameDiscovery.run([definitions, proposals, '20981'])
  end
end

HeroAndMaidD20981.run if $PROGRAM_NAME == __FILE__
