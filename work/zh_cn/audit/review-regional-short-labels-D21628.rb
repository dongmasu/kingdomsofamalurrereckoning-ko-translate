#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module ReviewRegionalShortLabelsD21628
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_628
  SPECS = [
    ['place:dellach', 'Dellach', '델라크', %w[델라크 델락],
     %w[753], %w[2075 4235 6380 6526 7725 9311 13845 17224 25592
                  26236 26518 27898 37214 46157 47979 51906 54811
                  54858 59893 64362 64593],
     /デラック|Dellach/, /德拉什|德什拉|Dellach/],
    ['place:nerotelos', 'Nerotelos', '네로텔로스', %w[네로텔로스],
     %w[1939], %w[3391 23748 25120 28821 30086 32123 36024 49126
                   49549 53696 54363 55448],
     /ネロテロス/, /涅洛特罗斯|奈洛特洛斯/],
    ['place:bhaile', 'Bhaile', '바일', %w[바일레 바일 베일],
     %w[1262 2507], %w[492 1310 1972 4590 7471 8317 10444 10822
                        13149 18006 20291 24879 25419 26083 28131
                        28544 31917 33379 34180 34539 35726 38322
                        38456 40561 40803 41772 42831 43462 46330
                        49403 50714 51349 51900 52772 55208 58455
                        58628 60359],
     /ベイル|Bhaile/, /巴哈勒|百勒|Bhaile/],
    ['place:galafor', 'Galafor', '갈라포르', %w[갈라포르 갈라포어 갈라포],
     %w[237 1241 1591 1679],
     %w[1439 2588 3468 3840 3916 5647 8266 9132 10739 13105 13196
        13867 14335 14357 14873 19905 20121 21109 21164 22960 23304
        24307 25316 26135 26465 28624 31213 31610 33105 34568 34833
        35857 36017 37573 39482 39607 40440 41084 41894 42009 43848
        44666 44913 49740 49837 49913 50816 51601 52524 53097 54525
        54990 55110 55617 57685 58344 58840 59851 63164],
     /ガラフォー|Galafor/, /加拉弗|伽拉弗尔|嘎那佛尔|Galafor/]
  ].freeze
  NOTES = {
    'Dellach' =>
      'English default:7725 calls Dellach ruins; 37214 locates them in ' \
      'Ettinmere, and 64593 puts the Theater of Fate inside them. Japanese ' \
      'デラック/遺跡 and Chinese 德拉什/废墟 corroborate. Reuse base:753:11 ' \
      '델라크, dominant in 21 of 22 current rows; fix the sole 델락 label. ' \
      'Generic ruins remains outside the short name; no separate ruins owner.',
    'Nerotelos' =>
      'English default:55448 explicitly lists Nerotelos and Nyxaros as ' \
      'Catacombs, corroborated by Japanese 地下墓地/ネロテロス and Chinese ' \
      '地下墓穴/涅洛特罗斯. The nine journal descriptions and the treasure ' \
      'account at 36024 refer to this place, not new journal-title aliases. ' \
      'Reuse the consistent 네로텔로스 and preserve Rotelos and Nyxaros.',
    'Bhaile' =>
      'English default:4590 calls Bhaile the capital; 20291 identifies the ' \
      'seat of the Winter Court, and 51900 its destroyed city. Japanese ' \
      'ベイル and Chinese 巴哈勒/百勒 corroborate. There is no pre-existing ' \
      'Bhaile or Ruins of Bhaile place owner in the inspected glossary. ' \
      'Reuse base:2507:11 바일: the current 40 source rows have 23 바일, ' \
      '13 베일 and 4 바일레 spans. Japanese corroborates identity, not a ' \
      'mandatory replacement of the dominant established Korean spelling. ' \
      'Keep the city image in the two pale-bough poems; infer no new tree. ' \
      'Bhaile Stone is an excluded item-title parent, unchanged.',
    'Galafor' =>
      'English default:1439 describes the planes and pools of Galafor; ' \
      '13867/31213 call it a sacred or blessed valley, and 14335 explicitly ' \
      'names the Valley of Galafor. Japanese ガラフォー/谷/平原 and Chinese ' \
      '加拉弗/山谷/平原 corroborate the region. Reuse base:1591:11 갈라포르. ' \
      'Keep the source-local Plain, Plains, Fields and Valley of Galafor ' \
      'forms in complete geographic pairs, preserving existing Korean ' \
      '평원/벌판/계곡 nouns. These are not new global aliases or separate ' \
      'place identities. Item-label parents and complete battle titles ' \
      'are excluded unchanged, even when an unpaired title needs a later ' \
      'separate review. At 10739 annotate the independent second Galafor ' \
      'only. At 44913 retain the Blessed Galafor hymn heading and annotate ' \
      'the three independent regional references. At 54525 Japanese ' \
      'ガラフォーを描いた explicitly identifies the depicted place; its ' \
      'existing short pair remains not-an-issue, unlike the base item labels.'
  }.freeze
  COMMON = <<~TEXT.chomp
    English is the identity and meaning anchor; retain every exact aligned
    English, Japanese and Chinese cell as evidence. Search all affix/base/
    default sources, not just sampled contexts. The inspected glossary and
    occurrence index have no owner for these four names, including complete
    place labels or aliases. If one appears before apply, stop for an
    existing-owner alias review rather than creating a duplicate place.
    The official Korean manual extraction/reference supplies general
    setting context but no direct entries for these four names.
    Normalize only reviewed Korean name spans, consuming existing matching
    parentheses atomically; retain complete item/battle/work titles.
    Preserve particles, other names, roles, markup, variables, wording and
    line endings. No broad alias, item identity or additional entity is
    inferred from a short geographic component. Previously terminal
    entity/key decisions and narrative holds are not reopened or recounted;
    the new ledger statuses concern these new place scopes only.
    Prepare rebuilds source/active alignment in memory, cross-checks the
    saved inventory's source evidence and writes nothing. Only an explicit
    later apply writes discovery artifacts and runs standard bounded gates.
    No PAK, PAK-derived or references/data material is used. Full residual
    discovery remains incomplete; the published release ZIP is unchanged.
  TEXT
  EXCLUDED = {
    ['base', '1262', '11'] => 'Bhaile Stone is a complete item label, not the city label.',
    ['base', '237', '11'] => 'Galafor Stone is a complete item label, not the region label.',
    ['base', '1241', '11'] => 'Painting of Galafor is a complete item label; preserve its existing text.',
    ['base', '1679', '11'] => 'Painting of Galafor is a complete item label; preserve its existing text.',
  }.merge(
    %w[2588 3916 9132 13105 24307 36017 52524 63164].to_h do |id|
      [['default', id, ''], 'Galafor occurs only inside a complete battle title; no place-span edit.']
    end
  ).freeze
  GEOGRAPHIC_LABELS = {
    '14335' => ['Valley of Galafor', '계곡'],
    '14357' => ['Galafor Fields', '벌판'],
    '21109' => ['Galafor Plain', '평원'],
    '23304' => ['Galafor Plain', '평원'],
    '26135' => ['Galafor Plain', '평원'],
    '31610' => ['Galafor Plain', '평원'],
    '34833' => ['Galafor Plains', '평원'],
    '35857' => ['Galafor Fields', '평원'],
    '40440' => ['Galafor Plain', '평원'],
    '41894' => ['Galafor Plains', '평원'],
    '44666' => ['Galafor Plains', '평원'],
    '54990' => ['Galafor Plain', '평원'],
    '58840' => ['Galafor Fields', '평원']
  }.freeze
  # Indexes refer to Korean name spans, not the surrounding title or poem.
  SKIP_SPANS = { '10739' => [0], '44913' => [1] }.freeze
  SOURCE_MENTIONS = { '1439' => 2, '10739' => 2, '44913' => 4 }.freeze
  ZH_NAME_OMISSIONS = {
    ['default', '49403', ''] =>
      ['阿琳和我会并肩作战',
       'Chinese omits Bhaile while retaining the campaign meaning; aligned Japanese explicitly says ベイル.'],
    ['default', '14873', ''] =>
      ['把这件事丢开不管',
       'Chinese paraphrases the unnamed Galafor reference; aligned Japanese explicitly says ガラフォー.']
  }.freeze

  def paths(d = D)
    %w[proper-name-discovery-definitions proper-name-discovery].map do |stem|
      File.join(__dir__, "#{stem}-D#{d}.tsv")
    end
  end

  def guard_unused!
    (D..D + 2).each do |d|
      R.ensure_unused_batch!(d)
      raise "D-#{d} discovery artifacts already exist" if paths(d).any? { |path| File.exist?(path) }
    end
  end

  def load_inventory
    rows = M::RESOURCES.flat_map do |resource|
      locales = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *locales).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end
    inventory = rows.to_h { |row| [M.key(row), row] }
    raise 'incomplete or duplicate live inventory' unless
      rows.length == 73_430 && inventory.length == rows.length
    saved = M.table(M::INVENTORY).to_h { |row| [M.key(row), row.to_h] }
    SPECS.each do |spec|
      keys(spec).each do |key|
        %w[en_texts_json ja_texts_json zh_text].each do |field|
          raise "saved/source evidence differs #{key.inspect}/#{field}" unless
            inventory.fetch(key).fetch(field) == saved.fetch(key).fetch(field)
        end
      end
    end
    inventory
  end

  def keys(spec)
    spec[4].map { |id| ['base', id, '11'] } +
      spec[5].map { |id| ['default', id, ''] }
  end

  def verify_owners!(glossary, index)
    names = Regexp.union(SPECS.map { |spec| /\b#{spec[1]}\b/i })
    owners = glossary.select do |row|
      row['category'] == 'place' &&
        [row['english_canonical'], *row['english_aliases'].to_s.split('|')].any? { |term| term.match?(names) }
    end
    raise "existing complete place owner requires alias review: #{owners.map { |row| row['entity_key'] }.join('|')}" unless owners.empty?
    raise 'place scope already indexed' if index.any? { |row| SPECS.any? { |spec| spec[0] == row['entity_key'] } }
  end

  def verify_identity!(inventory)
    [
      ['7725', 'ruins of Dellach', 'デラックの遺跡', '德拉什的废墟'],
      ['55448', 'Catacombs carved into the land below', '地下墓地', '地下墓穴'],
      ['4590', 'capital of Bhaile', '首都ベイル', '巴哈勒都城'],
      ['20291', 'Bhaile was the seat of the Winter Court', 'ベイルはウィンター・コート', '巴哈勒是冬廷'],
      ['13867', 'Galafor is the valley of the blessed', 'ガラフォーは', '加拉弗尔是被祝福的山谷'],
      ['14335', 'this Valley of Galafor', 'このガラフォー谷', '加拉弗山谷']
    ].each do |id, en, ja, zh|
      source = inventory.fetch(['default', id, ''])
      raise "identity anchor differs default:#{id}" unless
        JSON.parse(source.fetch('en_texts_json')).compact.join("\n").include?(en) &&
        JSON.parse(source.fetch('ja_texts_json')).compact.join("\n").include?(ja) &&
        source.fetch('zh_text').include?(zh)
    end
  end

  def mention_count(key, english)
    english == 'Galafor' && key[0] == 'default' ? SOURCE_MENTIONS.fetch(key[1], 1) : 1
  end

  def normalize(old, spec, key)
    return old if EXCLUDED.key?(key)
    _entity, english, korean, variants = spec
    stem = Regexp.union(variants.sort_by { |variant| -variant.length })
    if english == 'Galafor' && key[0] == 'default' && GEOGRAPHIC_LABELS.key?(key[1])
      local, noun = GEOGRAPHIC_LABELS.fetch(key[1])
      pattern = /(?<![가-힣A-Za-z])#{stem}(?:\(Galafor\))? #{noun}(?:\(#{Regexp.escape(local)}\))?/
      replacement = "#{korean} #{noun}(#{local})"
    else
      pattern = /(?<![가-힣A-Za-z])#{stem}(?:\(#{Regexp.escape(english)}\))?/
      replacement = "#{korean}(#{english})"
    end
    spans = old.to_enum(:scan, pattern).map { Regexp.last_match.dup }
    raise "Korean/source name-span counts differ #{key.inspect}" unless
      spans.length == mention_count(key, english)
    skip = english == 'Galafor' && key[0] == 'default' ? SKIP_SPANS.fetch(key[1], []) : []
    if key == ['default', '10739', '']
      raise 'mixed battle/place anchor differs' unless old[spans[0].end(0)..].start_with?(' 평원 전투')
    elsif key == ['default', '44913', '']
      raise 'hymn heading anchor differs' unless old[0...spans[1].begin(0)].end_with?('축복받은 ')
    end
    patches = spans.each_with_index.reject { |_span, ordinal| skip.include?(ordinal) }
    patches.reverse_each.reduce(old.dup) do |text, (span, _ordinal)|
      raise "unexpected existing annotation #{key.inspect}" if old[span.end(0)..].start_with?('(')
      text[span.begin(0)...span.end(0)] = replacement
      text
    end
  end

  def prepare(verbose: true)
    guard_unused!
    inventory = load_inventory
    glossary, index = M.table(R::GLOSSARY), M.table(M::INDEX)
    verify_owners!(glossary, index)
    verify_identity!(inventory)
    definitions, generated_all, reviews = [], [], []
    SPECS.each do |spec|
      entity, english, korean, variants, _base, _default, ja_pattern, zh_pattern = spec
      scope = keys(spec)
      evidence = "#{NOTES.fetch(english)}\n#{COMMON}"
      values = {
        'entity_key' => entity, 'english_canonical' => english, 'category' => 'place',
        'korean_canonical' => "#{korean}(#{english})", 'english_aliases' => '',
        'korean_variants' => variants.join('|'), 'status' => 'confirmed', 'notes' => evidence,
        'evidence_ids' => ((D..D + 2).map { |d| "D-#{d}" } +
          scope.map { |key| key.reject(&:empty?).join(':') }).join('|')
      }
      definition = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
      generated = build_occurrences(inventory.values, [definition]).map { |row| OCCURRENCE_HEADERS.zip(row).to_h }
      raise "all-resource lexical scope differs #{english}" unless generated.map { |row| M.key(row) }.sort == scope.sort
      definitions << definition
      generated_all.concat(generated)
      generated.each do |match|
        key = M.key(match)
        source = inventory.fetch(key)
        en = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        ja = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
        zh = source.fetch('zh_text')
        raise "English name count differs #{key.inspect}" unless
          en.scan(/(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])/i).length == mention_count(key, english)
        raise "Japanese place evidence missing #{key.inspect}" unless ja.match?(ja_pattern)
        if ZH_NAME_OMISSIONS.key?(key)
          marker, = ZH_NAME_OMISSIONS.fetch(key)
          raise "undocumented Chinese place omission #{key.inspect}" unless zh.include?(marker)
        else
          raise "Chinese place evidence missing #{key.inspect}" unless zh.match?(zh_pattern)
        end
        if english == 'Galafor' && key[0] == 'default' && GEOGRAPHIC_LABELS.key?(key[1])
          raise "complete geographic source label differs #{key.inspect}" unless
            en.include?(GEOGRAPHIC_LABELS.fetch(key[1])[0])
        end
        old = source.fetch('work_text')
        text = normalize(old, spec, key)
        raise "non-idempotent normalization #{key.inspect}" unless normalize(text, spec, key) == text
        raise "opaque tokens or line endings changed #{key.inspect}" unless
          old.scan(R::OPAQUE) == text.scan(R::OPAQUE) &&
          old.scan(/\r\n|\r|\n/) == text.scan(/\r\n|\r|\n/)
        status = EXCLUDED.key?(key) ? 'excluded' : old == text ? 'not-an-issue' : 'accepted'
        reviews << {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'entity_key' => entity, 'status' => status, 'old' => old, 'new' => text,
          'evidence' => [evidence, EXCLUDED[key], ZH_NAME_OMISSIONS.dig(key, 1)].compact.join("\n"),
          'english' => en, 'japanese' => ja, 'chinese' => zh,
          'entity_dispositions_json' => JSON.generate(entity => status)
        }
      end
    end
    reviews.sort_by! { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
    raise 'combined source coverage differs' unless
      reviews.length == 138 && generated_all.length == 138 &&
      reviews.map { |row| M.key(row) }.uniq.length == 138 &&
      reviews.count { |row| row['status'] == 'excluded' } == 12
    R.validate!(definitions, reviews, generated_all, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row['resource'] }.each do |resource, rows|
      edits = rows.select { |row| row['old'] != row['new'] }
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits) unless edits.empty?
    end
    if verbose
      puts "D-#{D}-D-#{D + 2}: 4 places; 138 keys/matches; 3 batches: #{reviews.each_slice(50).map(&:length).join('/')}; #{reviews.count { |row| row['old'] != row['new'] }} edits."
      definitions.each do |definition|
        rows = reviews.select { |row| row['entity_key'] == definition['entity_key'] }
        puts "#{definition['english_canonical']}: #{rows.length} keys; #{rows.group_by { |row| row['status'] }.transform_values(&:length)}"
      end
      reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'Tipo_Variante', 'status', 'old', 'new')) }
    end
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
  when [], ['prepare'] then ReviewRegionalShortLabelsD21628.prepare
  when ['apply'] then ReviewRegionalShortLabelsD21628.apply
  else abort 'usage: review-regional-short-labels-D21628.rb [prepare|apply]'
  end
end
