#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module ReviewThreeNamedCreaturesD21627
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_627
  SPECS = [
    ['person:faldranafari', 'Faldranafari', '팔드라나파리', 'person',
     %w[4510 18257 20152 42927 43679 46220],
     ['ファルドラナファリ', 'Faldranafari'],
     ['法尔德兰那法里', '法尔德拉纳法里', 'Faldranafari']],
    ['creature:peaches', 'Peaches', '피치스', 'creature',
     %w[1588 5513 19284 26486 28181 46811 50045 55115 56061 56506 59415 62885],
     ['ピーチズ'], ['桃子']],
    ['creature:blackshriek', 'Blackshriek', '블랙슈리크', 'creature',
     %w[25108 29598 49929 50987 63022 64223],
     ['ブラックシュリーク', 'Blackshriek'], ['黑色尖啸', 'Blackshriek']]
  ].freeze
  NOTES = {
    'person:faldranafari' =>
      'English default:43679 explicitly identifies an old mage named Faldranafari; ' \
      'default:46220 supplies another personal action. Japanese ファルドラナファリ ' \
      'and Chinese 法尔德兰那法里/法尔德拉纳法里 support the same English name. ' \
      'Keep the consistent Korean 팔드라나파리 stem, not a pronunciation inferred from Japanese.',
    'creature:peaches' =>
      'English default:50045 explicitly identifies Peaches as a Cliff Barghest ' \
      'rescued as a pup, with Japanese ピーチズ/クリフ・バーゲスト and Chinese ' \
      '桃子/悬崖魔狼 corroboration. Register the named individual, not another ' \
      'Barghest species entry; preserve monster:barghest ownership and its translation.',
    'creature:blackshriek' =>
      'English default:50987 calls Blackshriek a deadly kobold Nightblade; ' \
      'default:63022 lists the named kobolds and default:64223 describes the individual. ' \
      'Japanese ブラックシュリーク and Chinese 黑色尖啸 corroborate identity. ' \
      'Register the named creature separately from monster:kobold and preserve ' \
      'Rotclaw, King Fang, Niahm and all other existing owners.'
  }.freeze
  COMMON = <<~TEXT.chomp
    English is the semantic and identity anchor; every reviewed row carries
    its exact aligned English, Japanese and Chinese evidence. The complete
    affix/base/default lexical search yields 6/12/6 rows respectively, all
    in default, with one written source name per row. No generic homonym,
    item/work title, or other complete atomic title occurs in these source
    hits, so there are no homonym or nested-title exclusions in this batch.
    No broad aliases, new species identities, rarity or inventory role are
    inferred. Annotate only existing Korean name spans, consuming an
    already-correct English pair atomically. Retain later pronouns,
    particles, all other names, wording, opaque markers and line endings.
    Existing entity dispositions and evidence remain separate and are not
    superseded or recounted. The per-row accepted/not-an-issue decision
    concerns only the new entity scope. No PAK or reference material is
    used. Prepare builds the aligned inventory in memory and writes nothing;
    only an explicit later apply may write registration artifacts.
  TEXT

  def load_inventory
    rows = M::RESOURCES.flat_map do |resource|
      locales = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *locales).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end
    raise 'incomplete or duplicate aligned inventory' unless
      rows.length == 73_430 && rows.map { |row| M.key(row) }.uniq.length == rows.length

    rows.to_h { |row| [M.key(row), row] }
  end

  def verify_identity!(inventory)
    assertions = [
      ['43679', 'one daft old mage named Faldranafari',
       'ファルドラナファリという頭の変な老魔道士', '名叫法尔德拉纳法里的愚蠢老法师'],
      ['50045', 'he is a Cliff Barghest, a friend. I rescued him many years ago when he was a pup.',
       'クリフ・バーゲスト', '他是一条悬崖魔狼'],
      ['50987', 'Blackshriek, a deadly kobold Nightblade',
       '恐ろしいナイトブレードのブラックシュリーク', '黑色尖啸，一个强大的狗头人夜刃']
    ]
    assertions.each do |id, en, ja, zh|
      source = inventory.fetch(['default', id, ''])
      raise "identity evidence differs default:#{id}" unless
        JSON.parse(source.fetch('en_texts_json')).compact.join("\n").include?(en) &&
        JSON.parse(source.fetch('ja_texts_json')).compact.join("\n").include?(ja) &&
        source.fetch('zh_text').include?(zh)
    end
  end

  def normalize_name(old, korean, english)
    canonical = "#{korean}(#{english})"
    pattern = /(?<![가-힣A-Za-z])#{Regexp.escape(korean)}(?:\(#{Regexp.escape(english)}\))?/
    raise "missing or repeated Korean name #{english}" unless old.scan(pattern).length == 1
    revised = old.sub(pattern, canonical)
    raise "unexpected or duplicate annotation #{english}" if
      revised.include?("#{canonical}(") ||
      revised.scan("(#{english})").length != 1
    raise "non-name wording changed #{english}" unless
      old.sub(pattern, '') == revised.sub(canonical, '')
    revised
  end

  def prepare
    R.ensure_unused_batch!(D)
    paths = %w[proper-name-discovery-definitions proper-name-discovery].map do |stem|
      File.join(__dir__, "#{stem}-D#{D}.tsv")
    end
    raise 'discovery manifests already exist' if paths.any? { |path| File.exist?(path) }
    inventory = load_inventory
    verify_identity!(inventory)
    glossary, index = M.table(R::GLOSSARY), M.table(M::INDEX)
    definitions, generated_all, reviews = [], [], []
    SPECS.each do |entity, english, korean, category, ids, ja_terms, zh_terms|
      keys = ids.map { |id| ['default', id, ''] }
      evidence = "#{NOTES.fetch(entity)} #{COMMON}"
      values = {
        'entity_key' => entity, 'english_canonical' => english,
        'korean_canonical' => "#{korean}(#{english})", 'category' => category,
        'english_aliases' => '', 'korean_variants' => korean,
        'status' => 'confirmed', 'notes' => evidence,
        'evidence_ids' => (["D-#{D}"] + keys.map { |key| key.reject(&:empty?).join(':') }).join('|')
      }
      definition = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
      generated = build_occurrences(inventory.values, [definition]).map do |row|
        OCCURRENCE_HEADERS.zip(row).to_h
      end
      raise "unexpected all-resource source scope #{english}" unless
        generated.map { |row| M.key(row) }.sort == keys.sort
      definitions << definition
      generated_all.concat(generated)
      generated.each do |match|
        key = M.key(match)
        source = inventory.fetch(key)
        en = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        ja = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
        zh = source.fetch('zh_text')
        raise "source name count differs #{key.inspect}" unless
          en.scan(/(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])/i).length == 1
        raise "aligned source name differs #{key.inspect}" unless
          ja_terms.sum { |term| ja.scan(term).length } == 1 &&
          zh_terms.sum { |term| zh.scan(term).length } == 1
        old = source.fetch('work_text')
        revised = normalize_name(old, korean, english)
        raise "non-idempotent name annotation #{key.inspect}" unless
          normalize_name(revised, korean, english) == revised
        raise "opaque tokens or line breaks differ #{key.inspect}" unless
          old.scan(R::OPAQUE) == revised.scan(R::OPAQUE) &&
          old.scan(/\r\n|\r|\n/) == revised.scan(/\r\n|\r|\n/)
        status = old == revised ? 'not-an-issue' : 'accepted'
        reviews << {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'entity_key' => entity, 'status' => status,
          'old' => old, 'new' => revised, 'evidence' => evidence,
          'english' => en, 'japanese' => ja, 'chinese' => zh,
          'entity_dispositions_json' => JSON.generate(entity => status)
        }
      end
    end
    reviews.sort_by! { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
    raise 'unexpected distinct source scope' unless
      reviews.length == 24 && generated_all.length == 24 &&
      reviews.map { |row| M.key(row) }.uniq.length == 24
    R.validate!(definitions, reviews, generated_all, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)),
                                  rows.select { |row| row['old'] != row['new'] })
    end
    edits = reviews.count { |row| row['old'] != row['new'] }
    puts "D-#{D}: 3 entities, 24 keys/matches (6/12/6); #{edits} edits, #{reviews.length - edits} unchanged; no exclusions."
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new')) }
    [paths, glossary.headers, definitions, reviews]
  end

  def apply
    paths, headers, definitions, reviews = prepare
    M.write_table(paths[0], headers, definitions)
    M.write_table(paths[1], M::HEADERS.take(12), reviews)
    R.run([*paths, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewThreeNamedCreaturesD21627.prepare
  when ['apply'] then ReviewThreeNamedCreaturesD21627.apply
  else abort 'usage: review-three-named-creatures-D21627.rb [prepare|apply]'
  end
end
