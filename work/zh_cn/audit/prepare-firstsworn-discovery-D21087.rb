#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module FirstswornDiscoveryD21087
  M = ReviewedNameBatches
  GROUP = 'faction:firstsworn'
  FORGE = 'place:forge-of-the-firstsworn'
  SHRINE = 'place:shrine-of-the-firstsworn'
  PREFIX = File.join(M::AUDIT, 'proper-name-discovery')
  DEFINITIONS = "#{PREFIX}-definitions-D21087.tsv"
  REVIEWS = "#{PREFIX}-D21087.tsv"
  COMPOUND = /\b(?:Halls?|Forge|Shrine) of the Firsts?worn\b/i
  ROOT = /(?:최초의 맹세자|첫 ?맹세자|첫 ?서약자|퍼스트스원|선서자|초대 서약)(들)?(?:\(Firstsworn\))?/
  NOTES = 'English default:23047 explicitly identifies the Firstsworn as the earliest Warsworn guild members and a Niskaru-hunting cult; default:62666 confirms the historical heroes. Japanese ファーストスウォーン and Chinese 首誓者 corroborate the group. Reuse 첫서약자, already established at default:23047/56668 and in the separately reviewed Hall of the Firstsworn. Official Korean manual PDF p.7 supplies the Warsworn faction context, but not a Firstsworn spelling. Preserve number, particles, honorifics, surrounding prose, tokens, and line breaks. Complete Hall/Forge/Shrine names are excluded from group-component editing; prior place dispositions are not reopened or recounted. These are new entity-specific index decisions, not global translation totals.'

  module_function

  def definitions
    [
      [GROUP, 'Firstsworn', 'faction', '첫서약자(Firstsworn)',
       '최초의 맹세자|최초의 맹세자들|첫 맹세자|첫 서약자|퍼스트스원|선서자|초대 서약',
       'default:23047|default:56668|default:62666', NOTES],
      [FORGE, 'Forge of the Firstsworn', 'place',
       '첫서약자의 대장간(Forge of the Firstsworn)',
       '최초의 맹세자의 대장간|퍼스트스원의 대장간|첫 서약자의 대장간',
       'default:4300|default:27574|default:34776',
       'English explicitly names the Forge of the Firstsworn where the Mystic Hammer is reforged. Japanese ファーストスウォーンの鍛冶場 and Chinese 首誓者的锻造炉 confirm the same place/function. Preserve the complete bilingual place name atomically, without a nested group label or merging it with the hall. The manual supplies faction/crafting context, not this proper place spelling.'],
      [SHRINE, 'Shrine of the Firstsworn', 'place',
       '첫서약자 성소(Shrine of the Firstsworn)',
       '퍼스트스원 성소', 'default:45316',
       'The exact English label Shrine of the Firstsworn, Japanese ファーストスウォーン聖堂, and Chinese 首誓者神龛 establish this complete place label. Reuse the existing 성소 noun and established 첫서약자 root; do not merge Shrine with Hall or Forge.']
    ].map do |entity, english, category, korean, variants, evidence, notes|
      {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => category, 'korean_canonical' => korean,
        'english_aliases' => entity == GROUP ? 'Firstworn' : '', 'korean_variants' => variants,
        'evidence_ids' => "D-21087|#{evidence}", 'status' => 'confirmed',
        'notes' => notes
      }
    end
  end

  def edit_group(text)
    text.gsub(ROOT) { "첫서약자#{Regexp.last_match(1)}(Firstsworn)" }
  end

  def reviews(inventory)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated.group_by { |row| M.key(row) }.sort_by do |key, _rows|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      new_text = old
      dispositions = {}
      evidence = []
      matches.each do |match|
        entity = match.fetch('entity_key')
        definition = definitions.find { |row| row['entity_key'] == entity }
        if entity == GROUP && english.match?(COMPOUND)
          dispositions[entity] = 'excluded'
          evidence << 'Firstsworn is a component of a complete proper place name on this exact row. Exclude group-component normalization and retain its separately reviewed place identity. The plural Halls row default:40118 and source-typo Firstworn row default:44231 require a row-scoped place follow-up, not a new group translation.'
          next
        end
        proposed = case entity
                   when GROUP
                     edit_group(new_text)
                   when FORGE
                     new_text.sub(/(?:최초의 맹세자|퍼스트스원|첫 서약자)(?:\(Firstsworn\))?의 대장간/,
                                  definition.fetch('korean_canonical'))
                   when SHRINE
                     new_text.sub('퍼스트스원 성소', definition.fetch('korean_canonical'))
                   end
        raise "missing canonical name at #{key.inspect}" unless
          proposed.include?(definition.fetch('korean_canonical')) ||
            (entity == GROUP && proposed.include?('첫서약자들(Firstsworn)'))
        dispositions[entity] = proposed == new_text ? 'not-an-issue' : 'accepted'
        new_text = proposed
        evidence << definition.fetch('notes')
        if entity == GROUP && key[1] == '51339'
          evidence << 'This book contains three Firstsworn spellings plus one Firstworn source typo in the Eagonn sentence. Japanese and Chinese consistently name the same historical group in all four spans. Normalize all four existing Korean group references; preserve the source files unchanged.'
        end
      end
      status = if old != new_text
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.join('|'), 'status' => status,
        'old' => old, 'new' => new_text, 'evidence' => evidence.join(' '),
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
  end

  def run
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    review_rows = reviews(inventory)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    ReviewedProperNameDiscovery.validate!(
      definitions, review_rows, generated, glossary.map(&:to_h), index.map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(review_rows, inventory)
    raise 'unexpected Firstsworn source scope' unless
      review_rows.length == 69 && generated.length == 73
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS, review_rows)
    puts "Prepared Firstsworn: #{review_rows.length} rows, #{generated.length} entity keys: " \
      "#{review_rows.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

FirstswornDiscoveryD21087.run if $PROGRAM_NAME == __FILE__
