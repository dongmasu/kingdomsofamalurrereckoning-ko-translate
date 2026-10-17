#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module CourtEnchantmentsD21502
  extend self

  M = ReviewedNameBatches
  START = 21_502
  ENTITY = 'organization:court-of-enchantments'
  CANONICAL = '마법의 궁정(Court of Enchantments)'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{START}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{START}.tsv")
  IDS = %w[
    158 2289 2630 4149 4267 4452 5395 5588 5609 5668 6566 6763 8114 8858
    10128 11873 12638 12711 13650 14323 14355 15635 16946 16952 18244
    18263 18334 20539 22031 22165 23323 24495 25199 26547 28140 28444 29031
    29765 30469 31893 32205 37475 40218 41315 41390 42026 43759 45876
    46019 47833 48093 50043 51078 51367 53070 53753 53867 54520 54787
    56146 58783 60617 62420 63439 63823
  ].freeze
  PATTERN = /(?:마법부여 법정|마법부여 궁정|마법의 궁정|마법 궁정|매혹의 궁정|마법의 전당)(?:\((?:The )?Court of Enchantments?\))?/
  NOTE = 'English default:25199 identifies Wencen as leader of the Court of Enchantments; default:51078 lists its heroes and default:56146 grants membership. Default:60617 identifies its House of Ballads home, while default:41315 describes the named building. This organization name also denotes its court/venue; do not equate it with the entire House or Summer Court. Japanese 英雄院/祝福の宮殿 and Chinese 附魔廷/魔法廷 corroborate the same source name in each aligned row. Reuse the dominant Korean 마법의 궁정(Court of Enchantments), including the complete plural English name. Preserve all unrelated wording, entities, particles, tokens and line breaks. No PAK evidence or historical tally recount.'
  DETAIL = <<~TEXT.chomp
    ### D-21502-D-21503: Court Of Enchantments

    Registered `organization:court-of-enchantments` as
    `마법의 궁정(Court of Enchantments)`. Refreshed source matching found
    66 exact keys (base:3083 and 65 default keys), not merely the heuristic
    candidate snapshot's 55 IDs. Reviewed them in 50/16-key batches.
    English identifies Wencen's court, its membership and its venue;
    Japanese 英雄院/祝福の宮殿 and Chinese 附魔廷/魔法廷 corroborate.
    Unified source-matched 마법부여 궁정, 마법 궁정, 매혹의 궁정,
    마법부여 법정 and 마법의 전당; corrected the singular English annotation
    at default:22165. Default:22031's English itself uses the singular
    `Court of Enchantment`; this source-attested alias retains its singular
    English annotation rather than silently rewriting the source spelling.
    This does not merge the court with House of Ballads
    or the Summer Court. Other entities and earlier findings remain
    untouched; no historical translation tally was recounted.
  TEXT

  def prepare
    2.times { |n| ReviewedProperNameDiscovery.ensure_unused_batch!(START + n) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => 'Court of Enchantments',
      'category' => 'organization', 'korean_canonical' => CANONICAL,
      'english_aliases' => 'Court of Enchantment',
      'korean_variants' => '마법부여 궁정|마법 궁정|매혹의 궁정|마법부여 법정|마법의 전당',
      'evidence_ids' => 'D-21502-D-21503|base:3083:11|default:25199|default:51078|default:56146|default:60617|default:41315',
      'status' => 'confirmed',
      'notes' => "#{NOTE} Default:22031 uses the source-local singular alias Court of Enchantment for the same abducted court; retain that English spelling on that row. Default:22165 uses plural English and its malformed singular Korean annotation is corrected."
    }
    definition = glossary.headers.to_h { |h| [h, fields.fetch(h, '')] }
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = [['base', '3083', '11']] + IDS.map { |id| ['default', id, ''] }
    raise 'Court exact source scope differs' unless
      generated.map { |r| M.key(r) }.sort == expected.sort
    reviews = generated.sort_by do |r|
      [M::RESOURCES.index(r['resource']), r['ID_Linha'].to_i, r['Tipo_Variante']]
    end.map do |occurrence|
      key = M.key(occurrence)
      row = inventory.fetch(key)
      english = JSON.parse(row.fetch('en_texts_json')).compact.join("\n")
      old = row.fetch('work_text')
      raise "unexpected court Korean span #{key.inspect}" unless old.scan(PATTERN).length == 1
      label = key[0] == 'default' && key[1] == '22031' ?
        '마법의 궁정(Court of Enchantment)' : CANONICAL
      new_text = old.sub(PATTERN, label)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => "#{NOTE} Source-local singular alias at default:22031 is retained; default:22165 uses plural English.",
        'english' => english,
        'japanese' => JSON.parse(row.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => row.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    ReviewedProperNameDiscovery.validate!(
      [definition], reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{START}-D-#{START + 1}: #{reviews.length} keys; #{reviews.count { |r| r['old'] != r['new'] }} edits."
    [glossary.headers, definition, reviews]
  end

  def apply
    headers, definition, reviews = prepare
    previous = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, [definition])
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, START.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    previous.each { |k, v| raise "prior occurrence changed #{k.inspect}" unless current[k] == v }
    raise 'unexpected occurrence additions' unless
      (current.keys - previous.keys).sort == reviews.map { |r| [ENTITY, *M.key(r)] }.sort
    M::DOCS.each do |path|
      marker = '<!-- current-proper-name-batch:end -->'
      text = File.read(path)
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
    end
    2.times do |n|
      %w[review edit-addendum].each do |kind|
        path = File.join(__dir__, "named-scope-#{kind}-D#{START + n}-#{M::RUN_DATE_COMPACT}.md")
        File.open(path, 'a') { |f| f.write("\n\n#{DETAIL}\n") }
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then CourtEnchantmentsD21502.prepare
  when ['apply'] then CourtEnchantmentsD21502.apply
  else abort 'usage: review-court-enchantments-D21502.rb [prepare|apply]'
  end
end
