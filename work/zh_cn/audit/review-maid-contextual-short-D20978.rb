#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module MaidContextualShortD20978
  extend self
  M = ReviewedNameBatches
  ENTITY = 'person:magwyr'
  IDS = %w[
    1 89 610 857 1250 1792 2097 2294 2337 2931 3237 3370 3399
    3643 3688 3695 5153 5543 5754 7130 7832 8540 8690 9026 9137
    11789 11937 11999 12539 12653 13188 13365 14091 14188 14355
    17284 17907 18193 18484 18988 19444 19590 19919 20074 20196
    20813 21045 23323 23583 23958 24433 24557 24671 25411 25596
    25918 26337 26513 27250 29031 30469 30576 30921 31526 31771
    32436 33882 33900 34159 34685 34804 36186 36588 36648 37093
    37458 37887 37963 39542 39543 39571 40238 40723 41044 41152
    41467 41523 42194 43582 44603 44911 46338 46972 47018 47565
    48093 49111 49413 49868 50043 50177 50479 51022 51091 51268
    51354 54000 54759 55950 56068 56105 57724 58218 59429 59636
    59723 59799 59952 60058 62219 62956 63527 64575 64732 64785
  ].freeze
  MALFORMED_FULL = %w[8523 31442].freeze

  def transform(text, id)
    if MALFORMED_FULL.include?(id)
      return text.sub(/윈더미어(?:의)? 시녀/, '윈더미어의 시녀(Maid of Windemere)')
    end
    result = text
    result = result.sub('메이드(The Maid)', '시녀(The Maid)') if id == '2337'
    result = result.sub('아가씨의 말', '시녀(The Maid)의 말') if id == '37887'
    result = result.sub('그 처녀', '그 시녀(The Maid)') if id == '64732'
    result.gsub(/시녀(?:\((?:The )?Maid(?: of Windemere)?\))?/) do |match|
      match.include?('(') ? match : "#{match}(The Maid)"
    end
  end

  def run
    raise 'duplicate contextual Maid IDs' unless IDS.length == 125 && IDS.uniq.length == 125
    inventory = M.refresh_inventory
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    definition = glossary.find { |r| r['entity_key'] == ENTITY }
    raise 'full-title alias prerequisite missing' unless definition['english_aliases'].include?('Maid of Windemere')
    raise 'contextual short alias must not be global' if definition['english_aliases'].split('|').include?('The Maid')
    raise 'malformed full alias already registered' if definition['english_aliases'].include?('Maid Windemere')
    definition['english_aliases'] += '|Maid Windemere'
    definition['evidence_ids'] += '|D-20978-D-20980'
    definition['notes'] += ' Source typo Maid Windemere is a confirmed full-title alias at default 8523/31442. Short Maid references are registered only by the 125-ID contextual allowlist in review-maid-contextual-short-D20978.rb; generic maid, Maid of Fortune, Maid of the Arne and atomic Hero and the Maid titles are excluded from this person alias.'
    index = M.table(M::INDEX)
    existing = index.select { |r| r['entity_key'] == ENTITY }.to_h { |r| [M.key(r), r] }
    keys = (IDS + MALFORMED_FULL).map { |id| ['default', id, ''] }
    additions = keys.reject { |key| existing.key?(key) }.map do |key|
      source = inventory.fetch(key)
      english = JSON.parse(source['en_texts_json']).compact.join("\n")
      raise "contextual source lacks Maid #{key.inspect}" unless english.match?(/\bMaid\b/i)
      {
        'entity_key' => ENTITY, 'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'matched_english' => MALFORMED_FULL.include?(key[1]) ? 'Maid Windemere' : 'Maid [reviewed contextual short title]',
        'english_source' => english, 'korean_current' => source['work_text'],
        'status' => 'needs-context', 'evidence' => 'Explicitly allowlisted contextual title reference; not a global short-form alias.'
      }
    end
    raise "contextual additions changed: #{additions.length}" unless additions.length == 122
    reviews = keys.map do |key|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      updated = transform(old, key[1])
      # Preserve a prior terminal name finding when no title edit is needed.
      next if existing.key?(key) && old == updated
      evidence = 'English contextual Maid refers to the Windemere antagonist Magwyr in the reviewed ballad/quest setting, corroborated by aligned Japanese and Chinese. This exact ID is allowlisted; no global Maid/The Maid alias is registered. Pair only the named 시녀 references, preserving existing full-title labels, personal-name annotations, honorifics and unrelated text.'
      evidence += ' Generic strange maiden at the start of this row is left untouched; only the later named Maid references are paired.' if key[1] == '59952'
      evidence += ' Earlier source-faithful meaning judgments are not reopened; this is a focused label/spelling consistency correction, with no historical global recount.' if %w[2337 64732].include?(key[1])
      evidence += ' English omits of in Maid Windemere; Japanese and Chinese identify the same full title, so normalize the Korean locality/title, not a second person.' if MALFORMED_FULL.include?(key[1])
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => old == updated ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => updated, 'evidence' => evidence, 'entity_dispositions_json' => '{}',
        'previous_status' => '', 'previous_evidence' => ''
      }
    end.compact
    raise "unexpected contextual review count: #{reviews.length}" unless reviews.length == 126
    M.write_table(glossary_path, glossary.headers, glossary)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + additions)
    proposals = File.join(__dir__, 'proper-name-proposals-D20978.tsv')
    M.write_table(proposals, M::HEADERS, reviews)
    M.run(proposals, 20_978, nil, review_states: %w[needs-context accepted not-an-issue])
  end
end

MaidContextualShortD20978.run if $PROGRAM_NAME == __FILE__
