#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module CradleSummerD21507
  extend self

  M = ReviewedNameBatches
  START = 21_507
  PLACE = 'place:cradle-of-summer'
  STONE = 'item:cradle-of-summer-stone'
  CANONICAL = '여름의 요람(Cradle of Summer)'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{START}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{START}.tsv")
  HOLDS = %w[1833 11199].freeze
  IDS = %w[
    453 1833 3551 5011 7247 8319 9066 9918 11199 11948 12735 13140
    13274 14415 16295 17231 17616 17762 18970 19135 20623 26073
    26399 26772 27749 29148 30279 30535 30697 32348 32643 32679
    33467 33700 36156 37163 37366 39351 39451 39540 40332 41977
    43310 43632 44030 48005 48163 54676 56240 56496 57607 59101
    59513 60194 60370 63566 63877
  ].freeze
  PLACE_NOTE = 'English default:37163 explicitly identifies Cradle of Summer as a source of Fae magic, default:32348 identifies its protective barrier and residents, and default:7247 locates it in the Plains of Erathell. Japanese 夏のゆりかご and Chinese 夏之摇篮 corroborate. Reuse 여름의 요람(Cradle of Summer). Ordinary grammatical the/The is not an extra name component. Do not merge it with the Gardens of Ysa, the Summer Court, or other sacred wellsprings. Only exact source-name spans are changed; all prior sentence-level uncertainties and other entity dispositions remain intact.'
  STONE_NOTE = 'English base:1967 is the complete label Cradle of Summer Stone, corroborated by Japanese "夏のゆりかご"の石 and Chinese 夏之摇篮石. The current 여름돌의 요람 reverses the modifier relationship. Render 여름의 요람 돌(Cradle of Summer Stone) atomically and exclude the nested parent-place occurrence. This label does not infer item mechanics or uniqueness.'
  HOLD_NOTE = 'English default:1833/11199 uses lowercase poetic our cradle of summer in a prophecy about Ysa, dawn and the land defending the birthplace of light. Japanese quotes 夏のゆりかご and Chinese 夏之摇篮, but the aligned text alone does not establish whether this is the specific sacred region or a metaphorical birthplace of Summer. Retain the Korean cell without an invented proper-name annotation; hold only this new place-entity relation. No prior Ysa or lore disposition is reopened.'
  COMMON = 'English is primary; Japanese and Chinese are supporting cross-checks. No PAK evidence, source changes, global alias for Cradle, or historical translation tally recount.'
  DETAIL = <<~TEXT.chomp
    ### D-21507-D-21508: Cradle Of Summer

    Registered `place:cradle-of-summer` as
    `여름의 요람(Cradle of Summer)` and the complete stone label as
    `여름의 요람 돌(Cradle of Summer Stone)`. Reviewed 59 row keys in
    50/9-key batches: 60 entity matches including the excluded nested
    place occurrence in the stone title. English identifies the sacred
    region, its magic and barrier; Japanese 夏のゆりかご and Chinese
    夏之摇篮 corroborate. Fixed base:1967's reversed modifier relationship,
    missing full-name annotations, the repeated full reference at
    default:13274 and the same-row short `Cradle` reference at
    default:59513. No global `Cradle` alias was introduced.

    Default:1833 and default:11199 remain unchanged and uncertain for
    this new entity: lowercase poetic `our cradle of summer` could name
    the sacred region or describe a metaphorical birthplace of Summer.
    The aligned languages do not resolve that identity. These two new
    entity holds do not reopen earlier row/lore decisions. Every other
    entity disposition and historical translation total is preserved.
  TEXT

  def definition(headers, entity, en, ko, category, variants, ids, note)
    fields = {
      'entity_key' => entity, 'english_canonical' => en, 'category' => category,
      'korean_canonical' => ko, 'english_aliases' => '',
      'korean_variants' => variants, 'evidence_ids' => "D-21507-D-21508|#{ids}",
      'status' => 'confirmed', 'notes' => "#{note} #{COMMON}"
    }
    headers.to_h { |h| [h, fields.fetch(h, '')] }
  end

  def expected_pairs
    IDS.map { |id| [PLACE, 'default', id, ''] } +
      [[PLACE, 'base', '1967', '11'], [PLACE, 'base', '3890', '11'],
       [STONE, 'base', '1967', '11']]
  end

  def prepare
    2.times { |n| ReviewedProperNameDiscovery.ensure_unused_batch!(START + n) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    headers = glossary.headers
    definitions = [
      definition(headers, PLACE, 'Cradle of Summer', CANONICAL, 'place', '여름의 요람',
                 'base:3890:11|default:7247|default:32348|default:37163', PLACE_NOTE),
      definition(headers, STONE, 'Cradle of Summer Stone',
                 '여름의 요람 돌(Cradle of Summer Stone)', 'item', '여름돌의 요람',
                 'base:1967:11', STONE_NOTE)
    ]
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'Cradle source scope differs' unless
      generated.map { |r| [r.fetch('entity_key'), *M.key(r)] }.sort == expected_pairs.sort
    reviews = generated.group_by { |r| M.key(r) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, occurrences|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = old
      entities = occurrences.map { |r| r.fetch('entity_key') }.sort
      dispositions = {}
      if entities.include?(STONE)
        raise 'unexpected Cradle stone label' unless old == '여름돌의 요람'
        new_text = '여름의 요람 돌(Cradle of Summer Stone)'
        dispositions = { PLACE => 'excluded', STONE => 'accepted' }
        note = STONE_NOTE
      elsif key[0] == 'default' && HOLDS.include?(key[1])
        dispositions[PLACE] = 'uncertain'
        note = HOLD_NOTE
      else
        pattern = /여름의 요람(?:\(Cradle of Summer\))?/
        raise "Cradle Korean span missing #{key.inspect}" unless old.match?(pattern)
        new_text = old.gsub(pattern, CANONICAL)
        if key == ['default', '13274', '']
          from = '테레니아(Terenia)가 요람을 둘러싼'
          raise 'repeated Cradle reference differs' unless new_text.scan(from).length == 1
          new_text = new_text.sub(from, "테레니아(Terenia)가 #{CANONICAL}을 둘러싼")
        elsif key == ['default', '59513', '']
          from = '요람의 수호자'
          raise 'local short Cradle reference differs' unless new_text.scan(from).length == 1
          new_text = new_text.sub(from, '요람(Cradle)의 수호자')
        end
        dispositions[PLACE] = new_text == old ? 'not-an-issue' : 'accepted'
        note = "#{PLACE_NOTE} The exact same-row repeated/short references at default:13274/59513 are linked by the explicit full English name; no other Cradle alias is inferred."
      end
      status = new_text != old ? 'accepted' :
        (dispositions.value?('uncertain') ? 'uncertain' : 'not-an-issue')
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entities.join('|'), 'status' => status,
        'old' => old, 'new' => new_text, 'evidence' => "#{note} #{COMMON}",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{START}-D-#{START + 1}: #{reviews.length} keys; #{generated.length} matches; #{reviews.count { |r| r['old'] != r['new'] }} edits."
    [headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    previous = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, START.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    previous.each { |k, v| raise "prior occurrence changed #{k.inspect}" unless current[k] == v }
    raise 'unexpected occurrence additions' unless (current.keys - previous.keys).sort == expected_pairs.sort
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
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
  when [], ['prepare'] then CradleSummerD21507.prepare
  when ['apply'] then CradleSummerD21507.apply
  else abort 'usage: review-cradle-of-summer-D21507.rb [prepare|apply]'
  end
end
