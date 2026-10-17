#!/usr/bin/env ruby

require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module FourPersonComponentsD21287
  M = ReviewedNameBatches
  PROPOSAL = File.join(M::AUDIT, 'proper-name-residual-review-D21287.tsv')
  SPECS = [
    {
      entity: 'person:anker-edmure', ids: %w[55051 56541 59554], base: [],
      pattern: /(?:에드뮤어|에드무어)(?:\(Edmure\))?/, korean: '에드뮤어(Edmure)',
      notes: 'English Edmure in the Shardfall cold-protection talisman context (default:59554) connects the short form to the established scholar Anker Edmure and the mission at default:39351. Japanese エドミュア and Chinese 艾德莫尔 corroborate localized rows; default:56541 is literal English fallback in both supporting locales. Reuse the established Korean 에드뮤어 rather than 에드무어. Complete Edmure Home labels are outside this person-component scope; no global surname alias.'
    },
    {
      entity: 'person:aethan-engar', ids: %w[17052 20766 39351 40216 43869 45194 58916],
      base: %w[4642], pattern: /(?:엥가르|엔가르|엥가)(?:\(Engar\))?/, korean: '엥가르(Engar)',
      notes: 'English identifies Engar in the Scholia Arcana mission, Neophyte, Rathir and corpse-search contexts; Japanese エンガー and Chinese 恩加尔/恩格纳 corroborate the name component. Preserve the source-local full spelling Aethen Engar at default:39351, with Japanese イーサン・エンガー and Chinese 艾森·恩加尔, while retaining the established Korean 에이선 엥가르. Do not link the separately explicit Elfhard Engar keys default:4111/24894/45894 to Aethan on their shared surname; those keys are excluded from this batch. No global Engar/Aethen alias.'
    },
    {
      entity: 'person:cillian-keen', ids: %w[10311 22504 29936 34862 36455 44170 54566 59595 62901],
      base: [], pattern: /(?:실리언|실리안|킬리언)(?:\(Cillian\))?/, korean: '실리언(Cillian)',
      notes: 'English default:25466 explicitly joins Cillian Keen and short Cillian in the beast-master/pet role; default:47305 joins both forms in Cape Solace. These new short-form rows repeat the same beast-pen, food, pet, keep and island-companion contexts. Japanese シリアン and Chinese 希里安/西里安 corroborate. Normalize 실리안/킬리언 to the established full-name stem 실리언. Preserve all beasts, pet terminology, other island residents and journal prose. No global short alias.'
    },
    {
      entity: 'person:fomorous-hugues', ids: %w[1389 3592 21436 24039 25332 37397 62384 63438],
      base: [], pattern: /포모러스(?:\(Fomorous\))?/, korean: '포모러스(Fomorous)',
      notes: 'English Fomorous appears in the resurrection research, Allestar laboratory, Motus report and Ivan-scholar contexts associated with the established Fomorous Hugues. Japanese フォモラス/フォモラス・ヒューズ and Chinese 佛摩罗斯/佛摩罗斯·修格斯 corroborate; default:62384 Japanese uses Professor Hugues for English Fomorous, strengthening the component link. Default:24039 is literal English fallback in both supporting locales. At default:21436 annotate the previously unpaired full name with exact local English Fomorous Hughes, without a new entity or global Hughes alias. Exclude default:51702 entirely: D-19515 already accepted its canonical Hugues spelling, which is not reopened or recounted. Preserve the established Korean 포모러스 휴그.'
    }
  ].freeze

  module_function

  def run
    raise 'proposal already exists' if File.exist?(PROPOSAL)
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    # Keep literal English matches separate from the already-recorded scope evidence.
    index.each do |row|
      if row['entity_key'] == 'person:anru-besin' &&
         row['matched_english'] == 'Besin [row-scoped surname; no global alias]' &&
         row['evidence'].match?(/\AD-2128[45]:/)
        row['matched_english'] = 'Besin'
      elsif row['entity_key'] == 'organization:aron-excavations' &&
            row['matched_english'] == "Aron's Excavations [row-scoped possessive company form]" &&
            row['evidence'].start_with?('D-21286:')
        row['matched_english'] = "Aron's Excavations"
      end
    end
    existing = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }.to_set
    pairs = SPECS.flat_map do |spec|
      keys = spec.fetch(:ids).map { |id| ['default', id, ''] } +
        spec.fetch(:base).map { |id| ['base', id, '11'] }
      keys.map { |key| [spec, inventory.fetch(key)] }
    end.sort_by do |_spec, source|
      [M::RESOURCES.index(source.fetch('resource')), source.fetch('ID_Linha').to_i,
       source['Tipo_Variante'].to_s]
    end
    raise 'wrong reviewed scope' unless pairs.length == 28 &&
      pairs.map { |_spec, source| M.key(source) }.uniq.length == 28
    reviews = pairs.map do |spec, source|
      key = M.key(source)
      entity = spec.fetch(:entity)
      raise "already indexed component #{key.inspect}" if existing.include?([entity, *key])
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      if key == ['default', '39351', '']
        raise 'Aethen source changed' unless english.include?('Aethen Engar')
        raise 'Aethen Korean span changed' unless old.scan('에이선 엥가르').length == 1
        new_text = old.sub('에이선 엥가르', '에이선 엥가르(Aethen Engar)')
      elsif entity == 'person:fomorous-hugues' && english.include?('Fomorous Hughes')
        pattern = /포모러스 휴그(?:\(Fomorous Hugues\))?/
        raise 'full Hughes span changed' unless old.scan(pattern).length == 1
        new_text = old.sub(pattern, '포모러스 휴그(Fomorous Hughes)')
      else
        raise "missing short Korean name #{key.inspect}" unless old.match?(spec.fetch(:pattern))
        new_text = old.gsub(spec.fetch(:pattern), spec.fetch(:korean))
      end
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => spec.fetch(:notes) + ' Official Korean manual PDF p. 1 provides world/people context and PDF p. 7 distinguishes Scholia Arcana, Warsworn and faction quests; it does not supply these component names. Name-only corrections preserve all separate earlier holds, sentence content, particles, tokens and line breaks. No old entity/row decision or global tally is reopened.',
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    additions = pairs.map do |spec, source|
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      matched = if english.include?('Aethen Engar')
                  'Aethen Engar'
                elsif english.include?('Fomorous Hughes')
                  'Fomorous Hughes'
                else
                  spec.fetch(:korean)[/\(([^()]*)\)/, 1]
                end
      raise 'literal English match missing from source' unless english.include?(matched)
      [spec.fetch(:entity), *M.key(source), matched,
       JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n"),
       source.fetch('work_text'), 'needs-context', spec.fetch(:notes)]
    end
    rows = index.map(&:to_h) + additions.map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    raise 'duplicate entity/row key' unless
      rows.map { |row| [row.fetch('entity_key'), *M.key(row)] }.uniq.length == rows.length
    M.write_table(PROPOSAL, M::HEADERS, reviews)
    M.write_table(M::INDEX, OCCURRENCE_HEADERS, rows.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end)
    puts "Prepared #{reviews.length} component keys: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

FourPersonComponentsD21287.run if $PROGRAM_NAME == __FILE__
