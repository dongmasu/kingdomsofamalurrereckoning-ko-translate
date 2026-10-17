#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module PrimalMagicD21509
  extend self

  M = ReviewedNameBatches
  D = 21_509
  ENTITY = 'lore_term:primal-magic'
  CANONICAL = '원초 마법(Primal Magic)'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  IDS = %w[
    307 7254 9865 12136 15585 19047 21345 25241 25481 31096 33284
    38872 39490 47196 51250 51672 62612
  ].freeze
  NOTE = 'English default:19047 explicitly introduces Primal Magic as a new kind of magic, not a named learned active skill. Default:33284 identifies weapon/gem infusion and default:38872/62612 describe increased magical susceptibility. Japanese プライマル・マジック/原始魔法 and Chinese 原初魔法 corroborate. Reuse 원초 마법(Primal Magic). Do not infer a skill-tree ability, register bare Primal, or change damage/effect descriptions. Default:47196 has ten explicit Korean term spans corresponding to nine English terms plus one Korean pronominal expansion; preserve the prose and annotate its existing terms without adding/removing sentences.'
  TITLE_NOTE = 'Default:25241 is the separate complete title Forward: Primal Magic Examined, Japanese 進歩について: プライマル・マジックの研究 and Chinese 向前：原初魔法已检查. Exclude it from the magic-type occurrence rather than insert a component-only annotation. Existing Korean 서문 may assume Foreword, while English Forward and Japanese/Chinese admit a different reading; the exact title translation is deferred pending evidence. Do not silently correct Forward to Foreword or assert an author/medium from this label alone.'
  DETAIL = <<~TEXT.chomp
    ### D-21509: Primal Magic

    Registered `lore_term:primal-magic` as `원초 마법(Primal Magic)`,
    a named magic type/effect, not a learned active skill. Reviewed all
    18 exact source keys (1 base, 17 default). English introduces the
    magic and its weapon/gem infusion effects; Japanese and Chinese
    corroborate. All existing Korean terms in the long default:47196
    book passage are paired without changing the prose or paragraphs.

    At default:62612, the exact `{*3원초 마법}` display marker is retained
    byte-for-byte and `(Primal Magic)` is placed immediately after it.
    No marker content is rewritten; actual in-game line width/style was
    not tested. The separate full title at default:25241 is excluded
    from this magic-type scope and unchanged. Its `Forward` versus
    existing Korean `서문` interpretation remains deferred in the
    per-row manifest, not silently corrected to `Foreword`.
    No bare `Primal` alias, unrelated decision or historical tally changed.
  TEXT

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => 'Primal Magic',
      'category' => 'lore term', 'korean_canonical' => CANONICAL,
      'english_aliases' => '', 'korean_variants' => '원초 마법',
      'evidence_ids' => "D-#{D}|base:2085:11|default:19047|default:33284|default:38872|default:62612",
      'status' => 'confirmed', 'notes' => "#{NOTE} #{TITLE_NOTE}"
    }
    definition = glossary.headers.to_h { |h| [h, fields.fetch(h, '')] }
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = [['base', '2085', '11']] + IDS.map { |id| ['default', id, ''] }
    raise 'Primal Magic exact scope differs' unless generated.map { |r| M.key(r) }.sort == expected.sort
    reviews = generated.sort_by do |r|
      [M::RESOURCES.index(r['resource']), r['ID_Linha'].to_i, r['Tipo_Variante']]
    end.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      note = NOTE
      if key == ['default', '25241', '']
        new_text = old
        status = 'excluded'
        note = TITLE_NOTE
      elsif key == ['default', '62612', '']
        marker = '{*3원초 마법}'
        raise 'Primal Magic display marker differs' unless old.scan(marker).length == 1
        new_text = old.sub(marker, "#{marker}(Primal Magic)")
        status = 'accepted'
        note += ' Keep the entire existing {*3원초 마법} display token unchanged; place the English annotation outside it. In-game width and styling remain untested.'
      else
        pattern = /원초 마법(?:\(Primal Magic\))?/
        raise "Primal Korean term absent #{key.inspect}" unless old.match?(pattern)
        new_text = old.gsub(pattern, CANONICAL)
        status = new_text == old ? 'not-an-issue' : 'accepted'
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => "#{note} English is primary, Japanese/Chinese are supporting references. Preserve unrelated names, wording, quantities, particles, tokens and line breaks. No PAK evidence, source edit or historical translation recount.",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    ReviewedProperNameDiscovery.validate!(
      [definition], reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: #{reviews.length} keys; #{reviews.count { |r| r['old'] != r['new'] }} edits."
    [glossary.headers, definition, reviews]
  end

  def apply
    headers, definition, reviews = prepare
    previous = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, [definition])
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    previous.each { |k, v| raise "prior occurrence changed #{k.inspect}" unless current[k] == v }
    raise 'unexpected occurrence additions' unless
      (current.keys - previous.keys).sort == reviews.map { |r| [ENTITY, *M.key(r)] }.sort
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
    end
    %w[review edit-addendum].each do |kind|
      path = File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
      File.open(path, 'a') { |f| f.write("\n\n#{DETAIL}\n") }
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then PrimalMagicD21509.prepare
  when ['apply'] then PrimalMagicD21509.apply
  else abort 'usage: review-primal-magic-D21509.rb [prepare|apply]'
  end
end
