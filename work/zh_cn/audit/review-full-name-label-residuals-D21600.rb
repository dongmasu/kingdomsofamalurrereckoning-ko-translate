#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewFullNameLabelResidualsD21600
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_600
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONTEXT = <<~TEXT.chomp
    Review 21 source-attested full personal-name labels and all their exact
    full-name occurrences across affix/base/default: 35 default keys and no
    affix/base hits. English anchors the exact name, Japanese pronunciation
    and Chinese corroborate the name boundary; the manifest preserves all
    three source cells. No alias for a component, family relationship or
    biography is inferred. In particular, Laura Tam is not merged with
    Julia/Bardan Tam, Cali Keen is not Cillian Keen, and Horace Rheese is
    not Horace Despero. Keep existing complete English names and use their
    established paired Korean spelling where available. Sunhilda uses
    existing 산힐다 from default:55565; Freya uses 프레야 from 51389;
    Morganer uses 모가너 from 12686; Cali uses 칼리 from 2193/6935.
    For Betheli use the attested 베셀리 at default:39934, supported by
    Japanese ベセリ and Chinese 贝瑟里, rather than the local 베델리/베텔리
    variants. These are working Korean spellings, not official audio claims.
    Retain the other established Korean names rather than guessing new
    pronunciations. Annotate the first full name per row and retain later
    same-row short or repeated references without duplicate parentheses.
    The official Korean manual extraction/reference has no direct entries
    for these names. Preserve all other names, quest/entity decisions,
    particles, actions, tokens, punctuation and line endings. This is a
    focused name index update, not a global translation tally or completion
    claim. The published release ZIP is unchanged.
  TEXT
  # English, reviewed Korean, all existing Korean full-name forms, exact IDs.
  SPECS = [
    ['Cali Keen', '칼리 킨', ['칼리 킨', '캘리 킨'], %w[2193 6935 8642], 'キャリ・キーン', '卡利·基恩'],
    ['Nock Pugnar', '녹 푸그나르', ['녹 푸그나르'], %w[4217 9060], 'ノック・プグナー', '诺克·普格纳尔'],
    ['Heki Hraedin', '헤키 흐레이딘', ['헤키 흐레이딘'], %w[9113], 'ヘキ・フラエディン', '赫基·赫拉丁'],
    ['Fioran Agrost', '피오란 아그로스트', ['피오란 아그로스트'], %w[14629], 'フィオラン・アグロスト', '菲奥兰·阿格罗斯特'],
    ['Jasper Talmeth', '재스퍼 탈메스', ['재스퍼 탈메스'], %w[14934], 'ジャスパー・タルメス', '贾斯珀·塔尔美斯'],
    ['Cenner Bruge', '세너 브루지', ['세너 브루지'], %w[14957], 'セナー・ブルージェ', '岑纳尔·布鲁格'],
    ['Sunhilda Lorelle', '산힐다 로렐', ['산힐다 로렐', '순힐다 로렐', '선힐다 로렐'], %w[15125 24780 26093 55565], 'サンヒルダ・ロレル', '桑希尔达·洛'],
    ['Freya Apullos', '프레야 아풀로스', ['프레야 아풀로스', '프레이아 아풀로스'], %w[15494 51389], 'フレイヤ・アプーロス', '弗雷娅·阿普罗斯'],
    ['Betheli Jons', '베셀리 존스', ['베셀리 존스', '베델리 존스', '베텔리 존스'], %w[18755 24624 39934 48490], 'ベセリ・ジョンズ', '贝瑟里·琼斯'],
    ['Laura Tam', '로라 탐', ['로라 탐'], %w[19421], 'ローラ・タム', '劳拉·塔姆'],
    ['Onfei Cather', '온페이 캐더', ['온페이 캐더'], %w[19640], 'オンフェイ・キャザー', '昂菲·凯瑟'],
    ['Morganer Rile', '모가너 라일', ['모가너 라일', '모르가너 라일'], %w[12686 19749], 'モーガナー・ライル', '莫干纳·莱尔'],
    ['Inthaels Scyld', '인새얼스 실드', ['인새얼스 실드'], %w[20072], 'インシエルズ・シルド', '因萨尔斯·斯凯德'],
    ['Mym Cid', '밈 시드', ['밈 시드'], %w[20245], 'マイム・シド', '麦姆·希德'],
    ['Zola Rumscor', '졸라 럼스코어', ['졸라 럼스코어'], %w[20485], 'ゾラ・ラムスコー', '佐拉·拉姆斯科'],
    ['Pathieu Jarian', '파티외 자리안', ['파티외 자리안'], %w[25334], 'パチュー・ジャリアン', '帕修·雅瑞安'],
    ['Horace Rheese', '호러스 리스', ['호러스 리스'], %w[25345], 'ホレス・リース', '霍拉斯·利斯'],
    ['Tobine Worick', '토바인 워릭', ['토바인 워릭'], %w[26632], 'トビン・ウォリック', '托拜因·沃里克'],
    ['Bekan Faintheart', '베컨 페인트하트', ['베컨 페인트하트'], %w[26962], 'ベカン・フェイントハート', '懦夫贝坎'],
    ['Wilma Scrivens', '윌마 스크리븐스', ['윌마 스크리븐스', '윌마 스크리번스'], %w[27057 32783 33984 37691], 'ウィルマ・スクリブンス', '威尔玛·斯克利文斯'],
    ['Yrran Stalf', '이란 스탈프', ['이란 스탈프'], %w[27059], 'イラン・スターフ', '伊然·斯塔夫']
  ].freeze

  def entity_key(english)
    "person:#{english.downcase.tr(' ', '-')}"
  end

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
      entity_id = entity_key(english)
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
        generated.map { |row| M.key(row) }.sort ==
          ids.map { |id| ['default', id, ''] }.sort
      definitions << definition
      all_generated.concat(generated)
      generated.each do |match|
        key = M.key(match)
        source = inventory.fetch(key)
        en_text = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        ja_text = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
        zh_text = source.fetch('zh_text')
        raise "aligned name evidence changed #{key.inspect}" unless
          en_text.include?(english) && ja_text.include?(ja) && zh_text.include?(zh)
        old = source.fetch('work_text')
        pattern = Regexp.new(
          "(?:#{variants.sort_by { |form| -form.length }.map { |form| Regexp.escape(form) }.join('|')})" \
          "(?:\\(#{Regexp.escape(english)}\\))?"
        )
        raise "Korean full-name coverage changed #{key.inspect}" unless
          old.scan(pattern).length == en_text.scan(Regexp.new(Regexp.escape(english))).length
        updated = old.gsub(pattern) do |span|
          span.end_with?("(#{english})") ? "#{korean}(#{english})" : korean
        end
        updated = updated.sub(korean, "#{korean}(#{english})") unless
          updated.include?("#{korean}(#{english})")
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
      reviews.length == 35 && reviews.count { |row| row['old'] != row['new'] } == 29
    R.validate!(definitions, reviews, all_generated, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')),
                                reviews.select { |row| row['old'] != row['new'] })
    reviews.sort_by! { |row| row['ID_Linha'].to_i }
    puts "D-#{D}: 21 full names, 35 aligned keys, 29 Texto edits; prepare only."
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'old', 'new')) if row['old'] != row['new'] }
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Twenty-One Full-Name Label Residuals

      #{CONTEXT}
      Registered 21 full-name entities, reviewed all 35 exact source keys
      and corrected 29 default Texto cells. Six established paired cells
      remain unchanged. No component aliases or inferred identity merges.
      Betheli's later short reference and Wilma's second same-row full-name
      occurrence remain unannotated under the existing first-mention policy.
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
  when [], ['prepare'] then ReviewFullNameLabelResidualsD21600.prepare
  when ['apply'] then ReviewFullNameLabelResidualsD21600.apply
  else abort 'usage: review-full-name-label-residuals-D21600.rb [prepare|apply]'
  end
end
