#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewFullNameResidualsD21602
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_602
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONTEXT = <<~TEXT.chomp
    Review 23 complete personal names in exactly 50 source row keys across
    affix/base/default. All exact full-name hits are default rows, with
    no affix/base hits. English anchors identity and spelling; exact
    Japanese and Chinese cells are retained as pronunciation/context
    checks. Singleton full-name labels are registered as source labels,
    not assigned invented biography, locations or relationships.
    Reuse existing paired Korean forms where present; Klang uses
    클랭 태리칙 at default:57369 rather than 태리치크. No unsupported
    pronunciation changes to other existing Korean names.
    At default:12865 retain the complete 숙련자 모티크룸 애들러
    (Adept Morticrum Addler) annotation without inserting a nested name pair.
    Chinese Elya varies 艾尔亚·麦德米尔/埃莉娅·玛德迈尔; English and
    Japanese エリヤ・マドミア agree, so retain established 엘리아 매드미어.
    Chinese Gordan at 36861 has 戈丹丹 rather than 戈丹; do not override
    English Gordan Lot or Japanese ゴーダン・ロット with that variation.
    Seila's Chinese 赛拉/塞拉 variation likewise does not define a new
    identity; English Seila Twayn and Japanese セリア・トゥワイン anchor
    the existing 세일라 트웨인. Rota's introductory Jansen and Gordan's
    later short reference remain source-short and unexpanded.
    No person component aliases, shared-surname mergers, changed ranks
    or new title/entity dispositions are inferred. Preserve previously
    reviewed quest, faction, place and other-name decisions in each row.
    The official Korean manual extraction/reference gives no direct
    spellings for these people. Preserve tokens, particles, line endings
    and non-target bytes. This does not recount global translation totals
    or establish discovery completion. The published release ZIP is unchanged.
  TEXT
  SPECS = [
    ['Curran Crand', '커런 크랜드', [], %w[39770], 'カラン・クランド', /柯伦·克兰德/],
    ['Cod Aelfgar', '코드 앨프가르', [], %w[40180], 'コッド・エフガー', /柯德·埃尔夫加尔/],
    ['Raf Klyr', '라프 클라이르', [], %w[40495], 'ラフィ・クリル', /拉夫·凯勒/],
    ['Osen Ridan', '오센 리단', [], %w[41384], 'オセン・リダン', /奥森·瑞丹/],
    ['Ilmo Grimstaad', '일모 그림스타드', [], %w[17071 41427], 'イルモ・グリムスタード', /伊尔莫·格里姆斯塔德/],
    ['Grygal Apopal', '그리갈 아포팔', [], %w[41728], 'グリガル・アポパル', /格雷加尔·阿珀帕尔/],
    ['Klang Tarrycheek', '클랭 태리칙', ['클랭 태리치크'], %w[41915 57369], 'クラング・タリーチーク', /克朗·泰瑞奇克/],
    ['Osa Aeldhelm', '오사 엘드헬름', [], %w[42012], 'オーサ・エルドヘルム', /奥萨·阿尔德海姆/],
    ['Gham Bleur', '감 블뢰르', [], %w[42069], 'ガム・ブルー', /加姆·布莱尔/],
    ['Gordan Lot', '고든 롯', [], %w[8156 28472 36861 42410], 'ゴーダン・ロット', /戈丹(?:丹)?·洛特/],
    ['Ragna Senn', '라그나 센', [], %w[10277 30251 42612 44505 48322 49083], 'ラグナ・セン', /拉格纳·塞恩/],
    ['Beatrice Beck', '비어트리스 벡', [], %w[42680 45260], 'ベアトリス・ベック', /比阿特丽斯·贝克/],
    ['Isak Thorn', '아이작 손', [], %w[24051 39233 43085], 'アイザック・ソーン', /伊萨克·索恩/],
    ['Elya Madmyr', '엘리아 매드미어', [], %w[23837 43731 47482], 'エリヤ・マドミア', /艾尔亚·麦德米尔|埃莉娅·玛德迈尔/],
    ['Galeena Strout', '갈리나 스트라우트', [], %w[18590 43847 49021 59805], 'ガレーナ・ストラウト', /加莱娜·斯特劳特/],
    ['Grald Ullard', '그랄드 울라드', [], %w[43948], 'グラルド・ウラルド', /吉拉德·乌尔拉德/],
    ['Rota Jansen', '로타 얀센', [], %w[9334 20595 34365 44008 47629], 'ロタ・ジャンセン', /罗塔·詹森/],
    ['Shalarein Forstid', '샬라레인 포스티드', [], %w[44147], 'シャラレイン・フォースティッド', /莎拉琳·弗斯提德/],
    ['Morticrum Addler', '모티크룸 애들러', [], %w[12865 44173], 'モーティクルム・アドラー', /莫提克朗姆·阿德勒/],
    ['Dramil Frink', '드라밀 프링크', [], %w[27656 44246], 'ドラミル・フリンク', /德拉米尔·弗林克/],
    ['Waera Logue', '웨라 로그', [], %w[44547], 'ワエラ・ローグ', /瓦拉·洛格/],
    ['Pell Grandy', '펠 그랜디', [], %w[22254 36525 44761], 'ペル・グランディー', /佩尔·格兰迪/],
    ['Seila Twayn', '세일라 트웨인', [], %w[9894 45021], 'セリア・トゥワイン', /[赛塞]拉·特韦恩/]
  ].freeze

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery files already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    definitions = []
    reviews = []
    all_generated = []
    SPECS.each do |english, korean, other_forms, ids, ja, zh|
      variants = [korean, *other_forms]
      entity_id = "person:#{english.downcase.tr(' ', '-')}"
      values = {
        'entity_key' => entity_id, 'english_canonical' => english,
        'category' => 'person', 'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '', 'korean_variants' => variants.join('|'),
        'evidence_ids' => (["D-#{D}"] + ids.map { |id| "default:#{id}" }).join('|'),
        'status' => 'confirmed', 'notes' => CONTEXT
      }
      definition = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
      generated = build_occurrences(inventory.values, [definition]).map do |row|
        OCCURRENCE_HEADERS.zip(row).to_h
      end
      raise "unexpected #{english} source coverage" unless
        generated.map { |row| M.key(row) }.sort == ids.map { |id| ['default', id, ''] }.sort
      definitions << definition
      all_generated.concat(generated)
      generated.each do |match|
        key = M.key(match)
        source = inventory.fetch(key)
        en_text = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        ja_text = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
        zh_text = source.fetch('zh_text')
        raise "aligned name evidence changed #{key.inspect}" unless
          en_text.include?(english) && ja_text.include?(ja) && zh_text.match?(zh)
        old = source.fetch('work_text')
        pattern = Regexp.new(
          "(?:#{variants.sort_by { |form| -form.length }.map { |form| Regexp.escape(form) }.join('|')})" \
          "(?:\\(#{Regexp.escape(english)}\\))?"
        )
        raise "Korean full-name coverage changed #{key.inspect}" unless
          old.scan(pattern).length == en_text.scan(Regexp.new(Regexp.escape(english))).length
        updated = if key[1] == '12865'
                    expected = '숙련자 모티크룸 애들러(Adept Morticrum Addler)'
                    raise 'complete Adept title annotation changed' unless old == expected
                    old
                  else
                    old.sub(pattern, "#{korean}(#{english})")
                  end
        status = updated == old ? 'not-an-issue' : 'accepted'
        reviews << {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'entity_key' => entity_id, 'status' => status, 'old' => old, 'new' => updated,
          'evidence' => CONTEXT, 'english' => en_text, 'japanese' => ja_text,
          'chinese' => zh_text,
          'entity_dispositions_json' => JSON.generate(entity_id => status)
        }
      end
    end
    raise 'unexpected review/edit counts' unless
      reviews.length == 50 && reviews.count { |row| row['old'] != row['new'] } == 39
    R.validate!(definitions, reviews, all_generated, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')),
                                reviews.select { |row| row['old'] != row['new'] })
    reviews.sort_by! { |row| row['ID_Linha'].to_i }
    puts "D-#{D}: 23 full names, 50 aligned keys, 39 Texto edits; prepare only."
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'old', 'new')) if row['old'] != row['new'] }
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Fifty Full-Name Source Keys

      #{CONTEXT}
      Registered 23 full-name entities, reviewed exactly 50 default keys,
      and edited 39 Texto cells. Eleven existing pairs, including the
      complete Adept Morticrum Addler title, remain unchanged.
    TEXT
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{detail}"))
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewFullNameResidualsD21602.prepare
  when ['apply'] then ReviewFullNameResidualsD21602.apply
  else abort 'usage: review-full-name-residuals-D21602.rb [prepare|apply]'
  end
end
