#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module MaidFullTitleD20972
  extend self
  M = ReviewedNameBatches
  ENTITY = 'person:magwyr'
  CANONICAL = '윈더미어의 시녀(Maid of Windemere)'
  FULL = /윈[더드]미어(?:\(Windemere\))?의 시녀(?:\((?:The )?Maid(?: of Windemere)?\))?/

  def transform(text, id)
    return text.sub('시녀(The Maid)', '시녀(Maid of Windemere)') if id == '138'
    return text.sub('시녀(The Maid)', CANONICAL) if id == '5838'
    return text.sub('길을 잘못 든 시녀에게', "길을 잘못 든 #{CANONICAL}에게") if id == '12288'
    return text.sub('시녀가 위대한', "#{CANONICAL}가 위대한") if id == '37728'
    text.gsub(FULL, CANONICAL)
        .gsub(/(?<!의 )시녀\((?:The )?Maid of Windemere\)/, CANONICAL)
  end

  def run
    inventory = M.refresh_inventory
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    definition = glossary.find { |r| r['entity_key'] == ENTITY }
    raise 'existing Magwyr entity missing' unless definition && definition['english_canonical'] == 'Magwyr'
    raise 'Maid title alias already registered' if definition['english_aliases'].to_s.include?('Maid of Windemere')
    definition['english_aliases'] = ([*definition['english_aliases'].to_s.split('|'), 'Maid of Windemere', 'The Maid of Windemere']).reject(&:empty?).uniq.join('|')
    definition['evidence_ids'] += '|D-20972-D-20973|default:138|default:62752'
    definition['notes'] += ' English default 138 directly apposes Magwyr with Maid of Windemere; 62752 confirms her self-given title. Full title canonical is 윈더미어의 시녀(Maid of Windemere), while the personal name remains 마그위르(Magwyr). The Maid is a context-bound short form, never an unrestricted global alias.'
    generated = build_occurrences(inventory.values, [definition.to_h]).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    full_matches = generated.select { |r| r['english_source'].match?(/\bMaid of Windemere\b/i) }
    raise "full Maid title scope changed: #{full_matches.length}" unless full_matches.length == 100
    index = M.table(M::INDEX)
    existing = index.select { |r| r['entity_key'] == ENTITY }.to_h { |r| [M.key(r), r] }
    additions = generated.reject { |r| existing.key?(M.key(r)) }
    raise "unexpected new Magwyr keys: #{additions.length}" unless additions.length == 96
    raise 'short alias was accidentally registered' if additions.any? { |r| !r['english_source'].match?(/\bMaid of Windemere\b/i) }
    reviews = full_matches.map do |match|
      source = inventory.fetch(M.key(match))
      old = source.fetch('work_text')
      updated = transform(old, match['ID_Linha'])
      raise "missing reviewed full title #{match['ID_Linha']}" unless updated.include?('(Maid of Windemere)')
      evidence = 'English identifies Maid of Windemere as Magwyr through direct apposition at default 138 and her self-given title at 62752. Japanese ウィンダメアの烈女 and the Chinese 温德米尔 title corroborate the existing 윈더미어의 시녀 identity. Standardize the full-title spelling/English label without adding a second person. Short The Maid references require separate contextual review and are not a global alias.'
      evidence += ' This corrects only the title annotation on an already-indexed Magwyr row; retain the personal-name finding and update the same entity/key in place, not as a new key.' if existing.key?(M.key(match))
      evidence += ' Retain the separate Windemere place annotation and Magwyr personal-name annotation in the poem.' if match['ID_Linha'] == '138'
      evidence += ' English and both supporting locales explicitly include Windemere; restore the full locality/title rather than leaving an unqualified Korean 시녀.' if %w[5838 12288 37728 11999 61307 63562].include?(match['ID_Linha'])
      {
        'resource' => match['resource'], 'ID_Linha' => match['ID_Linha'], 'Tipo_Variante' => match['Tipo_Variante'],
        'entity_key' => ENTITY, 'status' => old == updated ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => updated, 'evidence' => evidence,
        'entity_dispositions_json' => '{}', 'previous_status' => '', 'previous_evidence' => ''
      }
    end
    M.write_table(glossary_path, glossary.headers, glossary)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + additions)
    proposals = File.join(__dir__, 'proper-name-proposals-D20972.tsv')
    M.write_table(proposals, M::HEADERS, reviews)
    M.run(proposals, 20_972, nil, review_states: %w[needs-context accepted not-an-issue])
  end
end

MaidFullTitleD20972.run if $PROGRAM_NAME == __FILE__
