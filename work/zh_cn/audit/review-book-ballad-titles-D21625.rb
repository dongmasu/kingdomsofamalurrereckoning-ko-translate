#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module ReviewBookBalladTitlesD21625
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_625
  SHADOW = '엔파마니르의 그림자(Shadow of Enfamanir)'
  MISSIVES = '세이블의 서신(Missives of Sable)'
  HOLD = ['default', '60140', ''].freeze
  CONTEXT = <<~TEXT.chomp
    English-led complete work-title review across affix/base/default, with
    aligned Japanese, Chinese and current Korean inspected for every key.
    Register the ballad and book separately as named works, not their
    characters, owners or authors. No bare Shadow, Enfamanir, Missives or
    Sable alias is introduced, and Sable is not inferred to be a person.
    Normalize only explicitly allowlisted complete Korean title spans;
    replace partial-name parentheses with the whole English title.
    Preserve quotation marks, the base:3930 (봉인됨) suffix, grammatical
    plural 들, runtime controls, line endings and all unrelated wording.
    Two necessary title-final particle changes are explicitly allowlisted.
    Retain same-row generic 서신/책 references without inventing a source
    full title where Korean uses an anaphor. Existing person, monster,
    place and other entity/key dispositions remain independently owned.
    This focused registration does not recount prior translation tallies.
    The official Korean manual's faction and Lorestone sections provide
    general ballad/story context but no spelling for either work.
    No PAK or derived resource evidence is used.
  TEXT
  SHADOW_EVIDENCE = <<~TEXT.chomp
    default:26329 explicitly names the famous Fae ballad Shadow of
    Enfamanir, recounting Farrara's rescue from the Niskaru Horrinox;
    default:54698 independently says the Fae Cairn relates that ballad.
    Japanese エンファマニアの影 and Chinese 恩法玛尼尔的阴影/暗影
    corroborate the whole title. Reuse the existing 엔파마니르의 그림자
    spelling; leave both separate creature-name mentions at 26329 intact.
    default:60140 is textually identical to the standalone title labels,
    but D-17888 explicitly left its canonical spacing/transliteration
    unresolved. Preserve that historical hold and its already bilingual
    Korean unchanged as a new uncertain work/key record, not a resolution
    of the prior judgment.
  TEXT
  MISSIVES_EVIDENCE = <<~TEXT.chomp
    default:9095 calls Missives of Sable an ancient book; 10966 calls it
    a tome and 36448 a book important to the gnomes. Japanese 黒紋章の書
    consistently identifies the same work; Chinese 萨贝尔书卷 supports
    the title, while 24939's 黑色信函 is a semantic rendering, not a
    different work. D-19038 already found 24939 intelligible from recurring
    corpus evidence; D-18257 and D-18351 establish 세이블의 서신.
    Normalize full title variants 서한/서신집/밀서/검은 서신/사절문서
    to that established title without asserting authorship by Sable.
    At 8283 and 36448 the second English full title is rendered by a
    Korean anaphor: retain it. At 12766 both Korean full-title spans
    correspond to two English full titles and are paired separately.
    default:18226 changes title-final 가 to 이 and 37293 changes 를 to 을;
    these particles must agree with the normalized final consonant 신.
  TEXT

  # Each entry pins an actual reviewed title span, not a global name pattern.
  SHADOW_SPANS = {
    'base:2218:11' => '엔파마니르(Enfamanir)의 그림자',
    'base:3449:11' => '엔파마니르(Enfamanir)의 그림자',
    'default:9143:' => '엔파마니르의 그림자',
    'default:26329:' => '엔파마니르의 그림자',
    'default:32963:' => '엔파마니르의 그림자',
    'default:54698:' => SHADOW,
    'default:60140:' => SHADOW
  }.freeze
  MISSIVES_SPANS = {
    'base:2584:11' => '세이블(Sable)의 서한',
    'base:3930:11' => '세이블(Sable)의 서신',
    'base:3937:11' => '세이블(Sable)의 서신',
    'default:582:' => '세이블(Sable)의 서신',
    'default:1037:' => '세이블(Sable)의 서한',
    'default:4084:' => MISSIVES,
    'default:4613:' => MISSIVES,
    'default:8283:' => MISSIVES,
    'default:8975:' => '세이블의 서신',
    'default:9095:' => '세이블의 서신',
    'default:9111:' => '세이블의 서신',
    'default:10418:' => '세이블의 서신',
    'default:10966:' => '세이블의 서신',
    'default:11244:' => MISSIVES,
    'default:12766:' => ['세이블 서신(Missives of Sable)', '세이블 서신'],
    'default:13782:' => '세이블(Sable)의 서신',
    'default:13824:' => '세이블(Sable)의 서신',
    'default:18226:' => '세이블의 밀서(Missives of Sable)가',
    'default:19173:' => MISSIVES,
    'default:21565:' => '세이블(Sable)의 서신',
    'default:21927:' => MISSIVES,
    'default:21940:' => '세이블의 서신',
    'default:24939:' => '세이블의 서신',
    'default:29581:' => MISSIVES,
    'default:30172:' => '세이블의 서신집',
    'default:30436:' => '세이블의 서신',
    'default:30668:' => '세이블의 서신',
    'default:35379:' => MISSIVES,
    'default:35698:' => '세이블의 서신',
    'default:36121:' => '세이블의 서신',
    'default:36448:' => '세이블의 서신',
    'default:37293:' => '검은 사절문서를',
    'default:39967:' => '검은 서신',
    'default:41496:' => '세이블의 서신',
    'default:43247:' => '세이블의 서신',
    'default:43499:' => '세이블의 서신',
    'default:45395:' => '세이블의 서신',
    'default:45620:' => '세이블의 서신',
    'default:48512:' => '세이블의 서신',
    'default:50551:' => '세이블 서한(Missives of Sable)',
    'default:51504:' => MISSIVES,
    'default:52493:' => '검은 서신(Missives of Sable)',
    'default:52605:' => '검은 서신(Missives of Sable)',
    'default:53759:' => MISSIVES,
    'default:53760:' => MISSIVES,
    'default:54737:' => MISSIVES,
    'default:54854:' => MISSIVES,
    'default:55414:' => MISSIVES,
    'default:59088:' => '세이블의 서신',
    'default:61153:' => MISSIVES
  }.freeze
  SPECS = [
    ['named work:shadow-of-enfamanir', 'Shadow of Enfamanir', SHADOW,
     SHADOW_SPANS, SHADOW_EVIDENCE],
    ['named work:missives-of-sable', 'Missives of Sable', MISSIVES,
     MISSIVES_SPANS, MISSIVES_EVIDENCE]
  ].freeze

  def paths(d = D)
    %w[proper-name-discovery-definitions proper-name-discovery].map do |stem|
      File.join(__dir__, "#{stem}-D#{d}.tsv")
    end
  end

  def guard_unused!
    [D, D + 1].each do |d|
      R.ensure_unused_batch!(d)
      raise "D-#{d} discovery artifacts exist" if paths(d).any? { |path| File.exist?(path) }
    end
  end

  # Rebuild alignment from immutable sources and active cells without staging
  # or refreshing the shared inventory during prepare.
  def live_inventory
    rows = M::RESOURCES.flat_map do |resource|
      locales = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *locales).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end
    inventory = rows.to_h { |row| [M.key(row), row] }
    raise 'incomplete or duplicate aligned inventory' unless
      rows.length == 73_430 && inventory.length == rows.length
    inventory
  end

  def replace_title(old, spans, canonical, key)
    replacements = Array(spans).to_h { |span| [span, canonical] }
    replacements['세이블의 밀서(Missives of Sable)가'] = "#{MISSIVES}이" if
      key == ['default', '18226', '']
    replacements['검은 사절문서를'] = "#{MISSIVES}을" if
      key == ['default', '37293', '']
    pattern = Regexp.union(replacements.keys.sort_by { |span| -span.length })
    matches = old.scan(pattern)
    raise "reviewed title spans changed #{key.inspect}: #{matches.inspect}" unless
      matches.group_by(&:itself).transform_values(&:length) == replacements.keys.to_h { |span| [span, 1] }
    old.gsub(pattern) { |span| replacements.fetch(span) }
  end

  def prepare
    guard_unused!
    inventory = live_inventory
    glossary, index = M.table(R::GLOSSARY), M.table(M::INDEX)
    definitions = SPECS.map do |entity, english, canonical, spans, evidence|
      values = {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => 'named work', 'korean_canonical' => canonical,
        'english_aliases' => '',
        'korean_variants' => spans.values.flat_map { |value| Array(value) }.uniq.join('|'),
        'evidence_ids' => (["D-#{D}", "D-#{D + 1}"] + spans.keys).join('|'),
        'status' => 'confirmed', 'notes' => "#{CONTEXT}\n#{evidence}"
      }
      glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    end
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    SPECS.each do |entity, english, _canonical, spans, _evidence|
      expected = spans.keys.map { |key| key.split(':', -1) }
      actual = generated.select { |row| row['entity_key'] == entity }.map { |row| M.key(row) }
      raise "unexpected complete source scope #{english}" unless actual.sort == expected.sort
    end
    reviews = generated.group_by { |row| M.key(row) }.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      text = old.dup
      dispositions = {}
      evidence = [CONTEXT]
      matches.each do |match|
        entity = match.fetch('entity_key')
        _entity, english, canonical, spans, context = SPECS.find { |spec| spec[0] == entity }
        local = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        expected_mentions = %w[8283 12766 36448].include?(key[1]) && english == 'Missives of Sable' ? 2 : 1
        raise "unexpected English title repetition #{key.inspect}" unless
          local.scan(Regexp.new(Regexp.escape(english), Regexp::IGNORECASE)).length == expected_mentions
        revised = replace_title(text, spans.fetch(key.join(':')), canonical, key)
        if key == HOLD
          raise 'historical hold must remain unchanged' unless revised == old
          dispositions[entity] = 'uncertain'
          evidence << 'D-17888 retained: uncertain unchanged; no new authority resolves the historical canonical-reading hold.'
        else
          dispositions[entity] = revised == text ? 'not-an-issue' : 'accepted'
        end
        text = revised
        evidence << context
      end
      status = if text != old then 'accepted'
               elsif dispositions.value?('uncertain') then 'uncertain'
               else 'not-an-issue'
               end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.join('|'), 'status' => status,
        'old' => old, 'new' => text, 'evidence' => evidence.join("\n"),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
    raise 'unexpected combined source coverage' unless generated.length == 57 && reviews.length == 57
    R.validate!(definitions, reviews, generated, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row['resource'] }.each do |resource, rows|
      edits = rows.select { |row| row['old'] != row['new'] }
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits) unless edits.empty?
    end
    puts "D-#{D}-D-#{D + 1}: 2 named works; #{generated.length} entity/source keys; #{reviews.length} distinct rows; batches #{reviews.each_slice(50).map(&:length).join('/')}; #{reviews.count { |row| row['old'] != row['new'] }} Texto edits."
    definitions.each do |definition|
      rows = reviews.select { |row| JSON.parse(row['entity_dispositions_json']).key?(definition['entity_key']) }
      counts = rows.group_by { |row| JSON.parse(row['entity_dispositions_json']).fetch(definition['entity_key']) }.transform_values(&:length)
      puts "#{definition['english_canonical']}: #{rows.length} rows; #{counts}"
    end
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'Tipo_Variante', 'status', 'old', 'new')) }
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    guard_unused!
    definitions_path, reviews_path = paths
    M.write_table(definitions_path, headers, definitions)
    M.write_table(reviews_path, M::HEADERS.take(12), reviews)
    R.run([definitions_path, reviews_path, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewBookBalladTitlesD21625.prepare
  when ['apply'] then ReviewBookBalladTitlesD21625.apply
  else abort 'usage: review-book-ballad-titles-D21625.rb [prepare|apply]'
  end
end
