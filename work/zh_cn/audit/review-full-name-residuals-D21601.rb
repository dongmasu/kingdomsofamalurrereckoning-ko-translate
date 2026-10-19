#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewFullNameResidualsD21601
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_601
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONTEXT = <<~TEXT.chomp
    English-led review of 20 complete personal names across all three
    resources: 39 default source keys, no affix/base hits. Exact English,
    Japanese and Chinese evidence is retained per row. Keep complete names
    atomic, without inferring given-name/surname aliases or family links.
    Reen Quiller is not Cadoc/Goyen Reen; shared name components do not
    establish identity. Use established paired Korean full names, retaining
    existing unpaired spellings where no stronger pronunciation evidence
    exists. Mallory and Reed retain their paired forms from 28625/29202;
    Freynold from 53633; Urthan from 64067; Conrad from 52169.
    Luethar De Groot is the murdered Alfar veteran, corroborated by
    Japanese ルーサー・デグルート and Chinese 略萨·德·格鲁特.
    Normalize 루서 데그루트 and 루에타르 드 흐로트 to the already paired
    루에타르 드 그루트 at default:15614, but keep the source-local
    lowercase de in the corpse label's English parentheses at 63922.
    Do not relabel the corpse as a different person or expand the final
    short Luethar reference at 57868. Conrad's 크론베르크 at 57647 becomes
    the already paired 크론버그; preserve his quest actions and Angharad,
    Dead Kel and Mudhold Fasting decisions. No manual spelling is asserted:
    the official Korean manual extraction/reference has no direct entries.
    Change only reviewed full-name spans/annotations, preserving all other
    entities, tokens, punctuation, particles, ranks and line endings.
    Existing entity-specific terminal decisions remain unchanged; this is
    not a global translation tally or completion claim. Release ZIP unchanged.
  TEXT
  SPECS = [
    ['Mallory Grieves', '맬러리 그리브스', ['맬러리 그리브스'], %w[28625 31851], 'マロリー・グリーブス', '马洛里·格里夫斯'],
    ['Reed Buckley', '리드 버클리', ['리드 버클리'], %w[21510 29202 35378], 'リード・バックリー', '里德·巴克利'],
    ['Athad Gruferth', '아사드 그루퍼스', ['아사드 그루퍼스'], %w[29865], 'アサード・グルファース', '阿萨德·格鲁菲斯'],
    ['Teithi Rhin', '테이티 린', ['테이티 린'], %w[29938], 'テイシ・リン', '忒提·瑞因'],
    ['Dreid Cadyr', '드레이드 케이더', ['드레이드 케이더'], %w[30212], 'ドレイド・カディア', '德雷德·卡迪尔'],
    ['Enger Loren', '엥거 로렌', ['엥거 로렌'], %w[30515], 'エンガー・ロレン', '恩格尔·洛伦'],
    ['Birgette Steen', '비르제트 스틴', ['비르제트 스틴'], %w[30591], 'ブリジッテ・スティーン', '柏吉特·斯蒂恩'],
    ['Isaac Tarn', '아이작 탄', ['아이작 탄'], %w[30651], 'アイザック・ターン', '艾萨克·塔恩'],
    ['Lia Talwist', '리아 탈위스트', ['리아 탈위스트'], %w[30673], 'リア・タルウィスト', '莉亚·塔尔维斯特'],
    ['Reen Quiller', '린 퀼러', ['린 퀼러'], %w[30783], 'リーン・キュラー', '里恩·奎勒'],
    ['Freynold Korrast', '프레이놀드 코라스트', ['프레이놀드 코라스트'], %w[30888 53633], 'フレイノルド・コラスト', '弗雷诺尔德·科拉斯特'],
    ['Dulac Lasien', '둘락 라시엔', ['둘락 라시엔'], %w[30958], 'デュラック・ラシアン', '杜拉克·雷森'],
    ['Manon Souris', '마농 수리', ['마농 수리'], %w[31087 31425], 'マノン・サウリス', '马侬·苏里斯'],
    ['Luethar De Groot', '루에타르 드 그루트', ['루에타르 드 그루트', '루서 데그루트', '루에타르 드 흐로트'], %w[10038 15614 26896 31603 48702 57029 57868 63922], 'ルーサー・デグルート', '略萨·德·格鲁特'],
    ['Ney Csalan', '네이 살란', ['네이 살란'], %w[33879], 'ネイ・カスラン', '奈伊·萨兰'],
    ['Kenway Wolsey', '켄웨이 울시', ['켄웨이 울시'], %w[34061], 'ケンウェイ・ウォルシー', '肯维·沃尔西'],
    ['Urthan Nara', '우르탄 나라', ['우르탄 나라'], %w[9793 34646 36666 64067], 'ウルザン・ナーラ', '尤桑·纳拉'],
    ['Gregor Reese', '그레고르 리스', ['그레고르 리스'], %w[35146], 'グレゴー・リース', '格雷戈尔·里斯'],
    ['Conrad Cronberg', '콘래드 크론버그', ['콘래드 크론버그', '콘래드 크론베르크'], %w[24220 35537 36805 52169 57647], 'コンラッド・クロンバーグ', '康拉德·科隆伯格'],
    ['Jon Aaron', '존 애런', ['존 애런'], %w[37672], 'ジョン・アーロン', '琼·亚伦']
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
    SPECS.each do |english, korean, variants, ids, ja, zh|
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
        en_pattern = Regexp.new(Regexp.escape(english), Regexp::IGNORECASE)
        local_english = en_text[en_pattern]
        raise "aligned name evidence changed #{key.inspect}" unless
          local_english && ja_text.include?(ja) && zh_text.include?(zh)
        old = source.fetch('work_text')
        pattern = Regexp.new(
          "(?:#{variants.sort_by { |form| -form.length }.map { |form| Regexp.escape(form) }.join('|')})" \
          "(?:\\(#{Regexp.escape(english)}\\))?", Regexp::IGNORECASE
        )
        raise "Korean full-name coverage changed #{key.inspect}" unless
          old.scan(pattern).length == en_text.scan(en_pattern).length
        pair = "#{korean}(#{local_english})"
        updated = old.sub(pattern, pair)
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
      reviews.length == 39 && reviews.count { |row| row['old'] != row['new'] } == 32
    R.validate!(definitions, reviews, all_generated, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')),
                                reviews.select { |row| row['old'] != row['new'] })
    reviews.sort_by! { |row| row['ID_Linha'].to_i }
    puts "D-#{D}: 20 full names, 39 aligned keys, 32 Texto edits; prepare only."
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'old', 'new')) if row['old'] != row['new'] }
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Twenty Further Full Personal Names

      #{CONTEXT}
      Registered 20 full-name entities and reviewed 39 default keys.
      Edited 32 Texto cells; seven established pairs remain unchanged.
      D-21599's separate Enright dispositions at 26896/57868 are preserved
      while adding the previously unregistered Luethar full-name scope.
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
  when [], ['prepare'] then ReviewFullNameResidualsD21601.prepare
  when ['apply'] then ReviewFullNameResidualsD21601.apply
  else abort 'usage: review-full-name-residuals-D21601.rb [prepare|apply]'
  end
end
