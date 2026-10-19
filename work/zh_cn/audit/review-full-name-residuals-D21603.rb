#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewFullNameResidualsD21603
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_603
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONTEXT = <<~TEXT.chomp
    English-led review of 28 complete personal names across affix/base/default:
    50 source keys, one base row and 49 default rows, no affix hits.
    Exact English, Japanese and Chinese cells are retained in the manifest.
    Preserve established paired spellings: Peta 페타 레스딕 at 51378,
    Raina 라이나 노른 at 17810/25852, Oliver 올리버 다탄 at 12764/53565,
    Dylan 딜런 그레이버너 at 37874, Gawait 게웨이트 핸드 at 11963,
    Alard 알라드 에이딕 at 18198, Gebhardt 게브하르트 함 at 7048.
    Eren uses the existing label 에렌 칼스 at 48898 instead of the isolated
    에런 케일스 in its aligned trading dialogue. Other existing Korean
    spellings remain unchanged; no new pronunciation is invented.
    Vian Cevrus is the named healer/scholar in the storage, delivery and
    dissertation rows. Preserve the full Scholar Vian Cevrus annotation at
    51882 without nested name parentheses. Chinese 维安/薇安 and the
    瑟弗路斯/切维鲁斯 variants are supporting evidence, not new identities.
    Raina's Chinese 雷纳·恩霍恩 title-row variation does not override
    English Raina Njorn and Japanese ライナ・ジョーン.
    Byrn Dodwin is not merged with Byrn Elgar or Captain Dodwyn; Will Barns
    is not Wil Donall/Donnall; Freya/Hakon Apullos and the Aedic names are
    not assigned family relationships merely from shared surnames.
    Alard's arena wager, captive objective and label retain their exact
    full-name form without inventing biography or altering wager values.
    No component aliases are inferred. The official Korean manual
    extraction/reference has no direct entries for these names. Preserve
    all other entity decisions, words, actions, ranks, particles, tokens
    and line endings. This is not a global tally or discovery-completion
    claim. The published release ZIP is unchanged.
  TEXT
  SPECS = [
    ['Faegan Osul', '페이건 오술', [], [], %w[45249], 'フェイガン・ウサル', /费根·欧萨尔/],
    ['Anora Solveig', '아노라 솔베이그', [], [], %w[47416], 'アノラ・ソルベイグ', /阿诺拉·索尔维格/],
    ['Peta Raesdic', '페타 레스딕', ['페타 레이스딕'], [], %w[47490 51378], 'ペタ・ラースディク', /派塔·雷斯迪克/],
    ['Valdur Skulsson', '발두르 스쿨손', [], [], %w[47938], 'バルダー・スカルソン', /瓦尔多·斯卡尔森/],
    ['Raina Njorn', '라이나 노른', ['레이나 니요른'], [], %w[17810 25852 47964], 'ライナ・ジョーン', /蕾娜·尼霍恩|雷纳·恩霍恩/],
    ['Cedd Gartyn', '세드 가틴', [], [], %w[48014], 'セッド・ガーティン', /赛德·加廷/],
    ['Hakon Apullos', '하콘 아풀로스', [], [], %w[21361 23234 48048], 'ハウコン・アプーロス', /哈肯·阿普罗斯/],
    ['Cedric Ives', '세드릭 아이브스', [], [], %w[48632], 'セドリック・アイブス', /塞德里克·艾维斯/],
    ['Eren Calse', '에렌 칼스', ['에런 케일스'], [], %w[48898 57842], 'エレン・キャルス', /埃仁·卡尔[斯瑟]/],
    ['Vian Cevrus', '비안 세브루스', [], %w[1787], %w[26711 44863 48953 51882 53786 61288], 'ビアン・セブラス', /维安·瑟弗路斯|薇安·(?:切维鲁斯|瑟弗路斯)/],
    ['Leanre Arleand', '린리어 알리앤드', [], [], %w[49139], 'リーンル・アーランド', /林日·阿兰德/],
    ['Aelfred Holn', '앨프레드 홀른', [], [], %w[49296], 'エルフレッド・ホルン', /埃尔夫里德·霍恩/],
    ['Winifrid Fridriksdatter', '위니프리드 프리드릭스다터', [], [], %w[49346], 'ウィニフリッド・フリドリスクダター', /温妮弗里德·弗里德里克斯德特/],
    ['Halwyn Orr', '할윈 오르', [], [], %w[49507 52916], 'ハルウィン・オー', /哈尔文·奥尔/],
    ['Kale Brendith', '케일 브렌디스', [], [], %w[49730], 'ケイル・ブレンディス', /卡莱·布伦迪斯/],
    ['Oliver Dartan', '올리버 다탄', ['올리버 다턴'], [], %w[12764 49960 53565], 'オリバー・ダータン', /奥利弗·达坦/],
    ['Hild Earan', '힐드 이란', [], [], %w[49971], 'ヒルド・イアラン', /希尔·埃兰/],
    ['Dylan Gravenor', '딜런 그레이버너', ['딜런 그레이브너'], [], %w[37874 50007], 'ディラン・グレイブノア', /迪伦·格拉文诺/],
    ['Youngvey Holvar', '영베이 홀바르', [], [], %w[50008], 'ヤングヴェイ・ホルヴァー', /扬维·霍瓦尔/],
    ['Siobhan Reen', '시오반 린', [], [], %w[1785 41724 50061], 'シボーン・リーン', /赛诺班·里恩|西沃恩·里恩/],
    ['Gawait Hand', '게웨이트 핸드', ['가웨이트 핸드'], [], %w[11963 50502], 'ガウェイト・ハンド', /加威特·汉德/],
    ['Alard Aedic', '알라드 에이딕', ['앨러드 에이딕'], [], %w[18198 47968 58318], 'アラード・エイディック', /阿拉尔德·埃迪克/],
    ['Elric Sequaning', '엘릭 시퀘이닝', [], [], %w[59456], 'エルリック・セカニング', /艾尔里克·瑟荃宁/],
    ['Bendaci Luther', '벤다시 루서', [], [], %w[59583], 'ベンダシ・ルーサー', /本达奇·路德/],
    ['Kulli Ors', '쿨리 오르스', [], [], %w[59612], 'クッリ・オルス', /克里·奥斯/],
    ['Byrn Dodwin', '번 도드윈', [], [], %w[59714], 'バーン・ドドウィン', /巴林·多德文/],
    ['Gebhardt Hamm', '게브하르트 함', ['게브하르트 햄'], [], %w[7048 63110], 'ゲブハート・ハム', /格布哈特·哈姆/],
    ['Will Barns', '윌 반스', [], [], %w[63210], 'ウィル・バーンズ', /威尔·巴恩斯/]
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
    SPECS.each do |english, korean, other_forms, base_ids, ids, ja, zh|
      variants = [korean, *other_forms]
      entity_id = "person:#{english.downcase.tr(' ', '-')}"
      expected = base_ids.map { |id| ['base', id, '11'] } +
        ids.map { |id| ['default', id, ''] }
      values = {
        'entity_key' => entity_id, 'english_canonical' => english,
        'category' => 'person', 'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '', 'korean_variants' => variants.join('|'),
        'evidence_ids' => (["D-#{D}"] + expected.map { |key| key.join(':') }).join('|'),
        'status' => 'confirmed', 'notes' => CONTEXT
      }
      definition = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
      generated = build_occurrences(inventory.values, [definition]).map do |row|
        OCCURRENCE_HEADERS.zip(row).to_h
      end
      raise "unexpected #{english} source coverage" unless
        generated.map { |row| M.key(row) }.sort == expected.sort
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
        updated = if key == ['default', '51882', '']
                    expected_label = '학자 비안 세브루스(Scholar Vian Cevrus)'
                    raise 'Scholar title annotation changed' unless old == expected_label
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
      reviews.length == 50 && reviews.count { |row| row['old'] != row['new'] } == 33
    R.validate!(definitions, reviews, all_generated, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')),
                                reviews.select { |row| row['old'] != row['new'] })
    reviews.sort_by! { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
    puts "D-#{D}: 28 full names, 50 aligned keys, 33 Texto edits; prepare only."
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'old', 'new')) if row['old'] != row['new'] }
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Twenty-Eight Further Full Personal Names

      #{CONTEXT}
      Registered 28 full-name entities, reviewed exactly 50 keys, and
      edited 33 default Texto cells. Seventeen established paired keys,
      including base:1787 and the Scholar Vian Cevrus title, remain unchanged.
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
  when [], ['prepare'] then ReviewFullNameResidualsD21603.prepare
  when ['apply'] then ReviewFullNameResidualsD21603.apply
  else abort 'usage: review-full-name-residuals-D21603.rb [prepare|apply]'
  end
end
