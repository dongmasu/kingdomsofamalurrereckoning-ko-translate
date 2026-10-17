#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module FaeCairnParagonD21547
  extend self

  M = ReviewedNameBatches
  START = 21_547
  FAE_CAIRN = 'item:fae-cairn'
  PARAGON = 'title:paragon-fate'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{START}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{START}.tsv")

  CAIRN_IDS = %w[
    1254 3788 6884 8366 8814 10474 10559 13194 14859 16530 21895
    24429 24433 24671 25425 25563 27588 29492 29678 31983 34694
    35035 35463 36912 37187 37204 37350 38082 38793 39486 41196
    41520 43473 45796 47075 47144 47827 48910 50886 51562 53810
    54698 54766 55945 55995 58814 59578 62330 63646 64231
  ].freeze
  PARAGON_KEYS = [
    *%w[11 12 14 21 22 24].map { |variant| ['affix', '73', variant] },
    ['base', '4086', '11'],
    *%w[
      7153 10902 11948 15280 19289 19407 21797 23811 25885 28172
      31745 32494 32495 35713 42132 47095 55449 61518 62706 62731
      63508
    ].map { |id| ['default', id, ''] }
  ].freeze
  PARAGON_AFFIX_KEYS = %w[11 12 14 21 22 24].map do |variant|
    ['affix', '73', variant]
  end.freeze
  CAIRN_KEYS = [
    ['base', '3658', '11'],
    *CAIRN_IDS.map { |id| ['default', id, ''] }
  ].freeze
  STANDALONE_PARAGON_KEYS = [
    ['default', '32495', ''],
    ['default', '62731', '']
  ].freeze
  COUNT_EXCEPTION = { ['default', '38793', ''] => [2, 1] }.freeze
  SOURCE_CAIRNS = /(?<![A-Za-z])(?:Fae\s+)?Cairns?(?![A-Za-z])/i
  KOREAN_CAIRNS = /(?:페이\(Fae\)(?:의)?\s*)?(?:무덤 언덕|케언|케른|돌무덤|돌무지|고분)(?:\((?:Fae )?Cairns?\))?/

  FAE_CAIRN_NOTE = 'English default:39486 defines the Library objects as special Lorestones called Cairns; default:45796 describes them as a new kind of Lorestone, and default:64231 identifies the object by the Fae name Cairn. Japanese ケルン and Chinese 灵球/灵族堆石标 corroborate the enchanted artifact sense. Standardize the named Fae object as 페이 케언(Fae Cairn), and contextually linked short forms as 케언(Cairn); do not infer the unrelated Tinniat burial cairn at base:3658. The official Korean manual extract supplies no direct Cairn entry.'
  PARAGON_NOTE = 'English default:32495 describes the named Paragon destiny by its combined Might/Sorcery combat benefits, and default:62731 supplies the standalone Paragon label. Japanese パラゴン corroborates the name; Chinese 精英/这个精英 supports its elite-destiny function. Register the standalone title as 파라곤(Paragon), but keep Paragon Barghest and Paragon Thresh atomic under their existing monster entities. No nested Paragon label is added to those compounds.'
  COMMON_NOTE = 'English is the meaning and identity anchor; Japanese and Chinese are supporting evidence. Source CSVs are read-only. No PAK or PAK-derived resource was inspected, and no historical global tally is recounted.'

  DETAIL = <<~TEXT.chomp
    ### D-21547-D-21548: Fae Cairns And Paragon

    Registered `item:fae-cairn` as `페이 케언(Fae Cairn)` and
    `title:paragon-fate` as `파라곤(Paragon)`. Reviewed 79 distinct
    resource/ID/variant keys in consecutive 50/29-key batches: 51 Cairn
    source keys and 28 Paragon candidate keys. The Fae objects are explicitly
    defined as magical Lorestones in the English corpus; Japanese ケルン and
    Chinese 灵球/灵族堆石标 corroborate. Standardized full and contextual
    short labels without nesting `Fae` inside the complete `Fae Cairn` name.
    The separate Tinniat burial cairn at base:3658 is excluded.

    The standalone Paragon fate/title at default:32495/default:62731 is
    paired. Existing `Paragon Barghest` and `Paragon Thresh` compound monster
    names remain atomic and are excluded from the new title scope. No
    generic `paragon` use is treated as this title. The six `Paragon's`
    affix variants remain uncertain because the isolated label and aligned
    translations do not settle whether they name this fate or describe a
    generic exemplar.

    Prior dispositions for other entities on shared rows remain intact.
    Full proper-name discovery remains incomplete; this candidate pass is
    not an exhaustive completion claim.
  TEXT

  def definition(headers, entity, english, korean, category, aliases, variants, ids, note)
    values = {
      'entity_key' => entity, 'english_canonical' => english,
      'category' => category, 'korean_canonical' => korean,
      'english_aliases' => aliases, 'korean_variants' => variants,
      'evidence_ids' => "D-#{START}-D-#{START + 1}|#{ids}",
      'status' => 'confirmed', 'notes' => "#{note} #{COMMON_NOTE}"
    }
    headers.to_h { |header| [header, values.fetch(header, '')] }
  end

  def source_matches(inventory, definitions)
    build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
  end

  def transform_cairns(key, english, old)
    terms = english.scan(SOURCE_CAIRNS)
    spans = old.to_enum(:scan, KOREAN_CAIRNS).map do
      match = Regexp.last_match
      [match.begin(0), match.end(0)]
    end
    expected_exception = COUNT_EXCEPTION[key]
    if expected_exception
      raise "Cairn source/Korean count differs #{key.inspect}" unless
        [terms.length, spans.length] == expected_exception
    elsif terms.length != spans.length
      raise "Cairn source/Korean spans differ #{key.inspect}: #{terms.length}/#{spans.length}"
    end

    rewritten = old.dup
    spans.each_with_index.to_a.reverse_each do |(span, index)|
      source_term = terms.fetch(index)
      fae = source_term.match?(/\AFae\s/i)
      plural = source_term.match?(/s\z/i)
      korean = +""
      korean << '페이 ' if fae
      korean << '케언('
      korean << 'Fae ' if fae
      korean << 'Cairn'
      korean << 's' if plural
      korean << ')'
      rewritten[span[0]...span[1]] = korean
    end
    if key == ['default', '36912', '']
      raise 'Cairn plural subject differs' unless rewritten.include?('이 케언(Cairns)은')
      rewritten = rewritten.sub('이 케언(Cairns)은', '이 케언(Cairns)들은')
    end
    rewritten
  end

  def transform_paragon(key, old)
    return old unless STANDALONE_PARAGON_KEYS.include?(key)

    count = old.scan(/파라곤(?!\()/).length
    raise "Standalone Paragon Korean span differs #{key.inspect}: #{count}" unless count == 1
    old.sub(/파라곤(?!\()/, '파라곤(Paragon)')
  end

  def review_rows(inventory, generated)
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    expected = [
      *CAIRN_KEYS.map { |key| [FAE_CAIRN, *key] },
      *PARAGON_KEYS.map { |key| [PARAGON, *key] }
    ].sort
    raise "Fae Cairn/Paragon exact source scope differs (#{generated.length})" unless actual == expected
    raise 'candidate scope must fit the two 50-key batches' unless
      generated.map { |row| M.key(row) }.uniq.length == 79

    generated.group_by { |row| M.key(row) }.map do |key, occurrences|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      old = source.fetch('work_text')
      dispositions = {}
      new_text = old

      occurrences.each do |occurrence|
        entity = occurrence.fetch('entity_key')
        status = if entity == FAE_CAIRN
                   if key == ['base', '3658', '11']
                     'excluded'
                   else
                     new_text = transform_cairns(key, english, new_text)
                     new_text == old ? 'not-an-issue' : 'accepted'
                   end
                 elsif STANDALONE_PARAGON_KEYS.include?(key)
                   new_text = transform_paragon(key, new_text)
                   new_text == old ? 'not-an-issue' : 'accepted'
                 elsif PARAGON_AFFIX_KEYS.include?(key)
                   'uncertain'
                 else
                   'excluded'
                 end
        dispositions[entity] = status
      end

      status = if new_text != old
                 'accepted'
               elsif dispositions.value?('uncertain')
                 'uncertain'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      raise "opaque token or line break changed #{key.inspect}" unless
        old.scan(ReviewedProperNameDiscovery::OPAQUE) ==
          new_text.scan(ReviewedProperNameDiscovery::OPAQUE) &&
        old.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)

      notes = occurrences.map do |occurrence|
        occurrence.fetch('entity_key') == FAE_CAIRN ? FAE_CAIRN_NOTE : PARAGON_NOTE
      end
      if key == ['default', '36912', '']
        notes << 'The English plural demonstrative Those and Chinese 那些 support the Korean plural subject marker 들.'
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
        'old' => old, 'new' => new_text,
        'evidence' => "#{notes.uniq.join(' ')} #{COMMON_NOTE}",
        'english' => english, 'japanese' => japanese, 'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions.sort.to_h),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end.sort_by do |row|
      key = M.key(row)
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end
  end

  def prepare
    2.times { |offset| ReviewedProperNameDiscovery.ensure_unused_batch!(START + offset) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    headers = glossary.headers
    definitions = [
      definition(headers, FAE_CAIRN, 'Fae Cairn', '페이 케언(Fae Cairn)',
                 'item', 'Fae Cairns|Cairn|Cairns',
                 '페이 케언|페이(Fae)의 케언|페이(Fae)의 돌무덤|케언|케른|돌무덤|돌무지|고분|무덤 언덕',
                 'default:39486|default:45796|default:64231', FAE_CAIRN_NOTE),
      definition(headers, PARAGON, 'Paragon', '파라곤(Paragon)',
                 'title', '', '파라곤',
                 'default:32495|default:62731', PARAGON_NOTE)
    ]
    inventory = M.table(M::INVENTORY).map(&:to_h).to_h do |row|
      [M.key(row), row]
    end
    raise 'incomplete aligned source inventory' unless inventory.length == 73_430
    generated = source_matches(inventory, definitions)
    reviews = review_rows(inventory, generated)
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    edit_count = reviews.count { |row| row.fetch('old') != row.fetch('new') }
    puts "D-21547-D-21548: #{reviews.length} keys; #{generated.length} matches; #{edit_count} edits; prepare mode, no writes."
    [headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    previous = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |key, _| key == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, START.to_s])

    current = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |key, _| key == 'korean_current' }]
    end
    previous.each { |key, row| raise "prior occurrence changed #{key.inspect}" unless current[key] == row }
    expected = [
      *CAIRN_KEYS.map { |key| [FAE_CAIRN, *key] },
      *PARAGON_KEYS.map { |key| [PARAGON, *key] }
    ]
    raise 'unexpected proper-name occurrence additions' unless
      (current.keys - previous.keys).sort == expected.sort

    M::DOCS.each do |path|
      text = File.read(path)
      stale = /The saved candidate queue ranks 386-388 are screened:.*?validation remains incomplete\./m
      replacement = 'The saved candidate snapshot is stale: ranks 386-388 were screened under D-21454, and the remaining Helm item scope was reviewed at D-21533. Do not resume at rank 389. Continue with fresh English-source residual checks; the current next batch is D-21549.'
      text.sub!(stale, replacement)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
    end
    (0..1).each do |offset|
      %w[review edit-addendum].each do |kind|
        path = File.join(__dir__, "named-scope-#{kind}-D#{START + offset}-#{M::RUN_DATE_COMPACT}.md")
        File.open(path, 'a') { |file| file.write("\n\n#{DETAIL}\n") }
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then FaeCairnParagonD21547.prepare
  when ['apply'] then FaeCairnParagonD21547.apply
  else abort 'usage: review-fae-cairn-paragon-D21547.rb [prepare|apply]'
  end
end
