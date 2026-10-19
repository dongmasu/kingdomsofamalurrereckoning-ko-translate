#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

# Read-only review of isolated English labels; no entity owners are created.
module ReviewSourceLabelsD21633
  extend self
  M = ReviewedNameBatches
  D = 21_633
  SPECS = [
    ['Teria', %w[15237], {'15237' => '테리아'}, '테리아', 'テリア', '特瑞亚'],
    ['Lanta', %w[5944 19180], {'5944' => '란타', '19180' => '란타'}, '란타', 'ランタ', '兰塔'],
    ['Julian', %w[19987], {'19987' => '줄리안'}, '줄리안', 'ジュリアン', '朱利安'],
    ['Oslach', %w[24411], {'24411' => '오슬라흐'}, '오슬라흐', 'オスラッチ', '奥斯拉赫'],
    ['Neassa', %w[25443], {'25443' => '네아사'}, '네아사', 'ネアッサ', '尼萨'],
    ['Mathlon', %w[26822], {'26822' => '마슬론'}, '마슬론', 'マスロン', '马瑟隆'],
    ['Simonides', %w[30214], {'30214' => '시모니데스'}, '시모니데스', 'シモニデス', '西蒙尼戴斯'],
    ['Lamarra', %w[30619 40719], {'30619' => '라마라', '40719' => '라마라'}, '라마라', 'ラマーラ', '拉马拉'],
    ['Dybnaeuin', %w[30986], {'30986' => '디브나에윈'}, '디브나에윈', 'ディブニューン', '迪比那尤因'],
    ['Gralor', %w[31091], {'31091' => '그랄로르'}, '그랄로르', 'グラロー', '吉拉洛尔'],
    ['Banocles', %w[31859], {'31859' => '바노클레스'}, '바노클레스', 'バノクレス', '巴诺克勒斯'],
    ['Tilancar', %w[34001], {'34001' => '틸란카르'}, '틸란카르', 'ティランカー', '提兰卡尔'],
    ['Harken', %w[34395], {'34395' => '하르켄'}, '하르켄', 'ハーケン', '哈尔肯'],
    ['Beahda', %w[34550], {'34550' => '베아다'}, '베아다', 'ビーダ', '比达'],
    ['Barr', %w[35980], {'35980' => '바'}, '바', 'バー', '巴尔'],
    ['Platon', %w[17118 36733], {'17118' => '플라톤', '36733' => '플라톤'}, '플라톤', 'プラトン', '普拉登'],
    ['Pele', %w[39753], {'39753' => '펠레'}, '펠레', 'ペレ', '佩莱'],
    ['Sheridon', %w[39955], {'39955' => '셰리던'}, '셰리던', 'シェリドン', '谢里东'],
    ['Daeges', %w[22713 40862], {'22713' => '데이게스', '40862' => '데이거스'}, '데이제스', 'デイジェス', '戴吉斯'],
    ['Elpis', %w[40976 53123], {'40976' => '엘피스', '53123' => '엘피스'}, '엘피스', 'エルピス', '艾尔皮斯'],
    ['Genlise', %w[42476 56127], {'42476' => '젠리스', '56127' => '젠리스'}, '젠리스', 'ジェンリース', '詹里瑟'],
    ['Scuttlecrab', %w[43592], {'43592' => '스커틀크랩'}, '스커틀크랩', 'スカトルクラブ', '龟蟹'],
    ['Lysandros', %w[43835], {'43835' => '리산드로스'}, '리산드로스', 'ライサンドロス', '莱山德罗斯'],
    ['Merchta', %w[48749], {'48749' => '머크타'}, '머크타', 'マーチタ', '梅查'],
    ['Primorida', %w[49789], {'49789' => '프리모리다'}, '프리모리다', 'プリモリダ', '普瑞莫瑞达'],
    ['Ciaran', %w[50518], {'50518' => '시아란'}, '시아란', 'シアラン', '希亚兰'],
    ['Tirbolg', %w[57575], {'57575' => '티르볼그'}, '티르볼그', 'ティルボルグ', '提尔伯格'],
    ['Ticnerani', %w[21570 59082], {'21570' => '틱네라니', '59082' => '틱네라니'}, '틱네라니', 'ティクネラニ', '提克涅拉尼']
  ].freeze
  SPACING_HOLD = {
    'candidate' => 'Mendeller Birt',
    'actual_english' => 'MendellerBirt',
    'key' => ['default', '32170', ''],
    'korean' => '멘델러 버트',
    'japanese' => 'メンデラー・バート',
    'chinese' => '孟德勒尔伯特'
  }.freeze
  SOURCE_LABEL_NOTE = <<~TEXT.chomp
    Source-local annotation only. English is the exact source label; aligned
    Japanese and Chinese provide the displayed pronunciation/identity support.
    Preserve the existing Korean spelling and append only this exact English
    label. No person, creature, faction, category, alias, glossary owner or
    occurrence-index entry is inferred. Existing bilingual labels remain
    unchanged. This is a row decision only and does not reopen or recount
    unrelated historical decisions.
  TEXT

  def key(resource, id, variant = '')
    [resource, id, variant.to_s]
  end

  def expected_keys
    SPECS.flat_map { |_name, ids, *_rest| ids.map { |id| key('default', id) } }.uniq
  end

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

    saved = M.table(M::INVENTORY).to_h { |row| [M.key(row), row.to_h] }
    (expected_keys + [SPACING_HOLD.fetch('key')]).uniq.each do |source_key|
      live, cached = inventory.fetch(source_key), saved.fetch(source_key)
      %w[en_texts_json ja_texts_json zh_text].each do |field|
        raise "saved/source alignment differs #{source_key.inspect}/#{field}" unless
          live.fetch(field) == cached.fetch(field)
      end
    end
    inventory
  end

  def find_english_hits(inventory, term)
    pattern = /(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i
    inventory.each_with_object([]) do |(source_key, row), hits|
      english = JSON.parse(row.fetch('en_texts_json')).compact.join("\n")
      hits << source_key if english.match?(pattern)
    end
  end

  def review_row(inventory, term, id, korean, target_korean, japanese, chinese)
    source_key = key('default', id)
    source = inventory.fetch(source_key)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    ja = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    zh = source.fetch('zh_text')
    raise "English label mismatch #{source_key.inspect}" unless
      english.scan(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i).length == 1
    raise "Japanese label evidence mismatch #{source_key.inspect}" unless ja.scan(japanese).length == 1
    raise "Chinese label evidence mismatch #{source_key.inspect}" unless zh.scan(chinese).length == 1

    old = source.fetch('work_text')
    existing_pair = "#{korean}(#{term})"
    target_pair = "#{target_korean}(#{term})"
    if korean == target_korean && old.scan(Regexp.new(Regexp.escape(target_pair))).length == 1
      revised = old
      status = 'not-an-issue'
    else
      source_span = if old.scan(Regexp.new(Regexp.escape(existing_pair))).length == 1
                      existing_pair
                    else
                      raise "unexpected pre-existing English annotation #{source_key.inspect}" if old.include?("(#{term})")
                      raise "Korean span mismatch #{source_key.inspect}" unless old.scan(korean).length == 1
                      korean
                    end
      revised = old.sub(source_span, target_pair)
      raise "non-name text changed #{source_key.inspect}" unless
        revised.sub(target_pair, '') == old.sub(source_span, '')
      raise "non-idempotent target annotation #{source_key.inspect}" unless
        revised.scan(Regexp.new(Regexp.escape(target_pair))).length == 1
      status = 'accepted'
    end

    {
      'resource' => source_key[0], 'ID_Linha' => source_key[1],
      'Tipo_Variante' => source_key[2], 'term' => term, 'status' => status,
      'old' => old, 'new' => revised, 'evidence' => SOURCE_LABEL_NOTE,
      'english' => english, 'japanese' => ja, 'chinese' => zh
    }
  end

  def spacing_hold(inventory)
    source = inventory.fetch(SPACING_HOLD.fetch('key'))
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    raise 'expected candidate spelling unexpectedly matches' if
      english.match?(/(?<![A-Za-z])Mendeller Birt(?![A-Za-z])/i)
    raise 'actual concatenated English label changed' unless english == 'MendellerBirt'
    raise 'spacing-hold Japanese evidence differs' unless japanese.include?(SPACING_HOLD.fetch('japanese'))
    raise 'spacing-hold Chinese evidence differs' unless chinese.include?(SPACING_HOLD.fetch('chinese'))
    raise 'spacing-hold Korean text differs' unless source.fetch('work_text') == SPACING_HOLD.fetch('korean')

    {
      'resource' => SPACING_HOLD.fetch('key')[0],
      'ID_Linha' => SPACING_HOLD.fetch('key')[1],
      'Tipo_Variante' => SPACING_HOLD.fetch('key')[2],
      'term' => SPACING_HOLD.fetch('candidate'), 'status' => 'hold',
      'old' => source.fetch('work_text'), 'new' => source.fetch('work_text'),
      'evidence' =>
        'Candidate is “Mendeller Birt”, but the exact English source is “MendellerBirt” with no space. ' \
        'Japanese メンデラー・バート and Chinese 孟德勒尔伯特 corroborate the source label; ' \
        'defer rather than invent a spaced alias or canonical reading.',
      'english' => english, 'japanese' => japanese, 'chinese' => chinese
    }
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    inventory = live_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    terms = SPECS.map(&:first) +
      [SPACING_HOLD.fetch('candidate'), SPACING_HOLD.fetch('actual_english')]
    owner_hits = glossary.select do |row|
      ([row['english_canonical']] + row['english_aliases'].to_s.split('|')).any? do |name|
        terms.any? { |term| name.to_s.casecmp?(term) }
      end
    end
    raise "existing exact English owner(s): #{owner_hits.map { |row| row['entity_key'] }.join('|')}" unless owner_hits.empty?
    source_keys = (expected_keys + [SPACING_HOLD.fetch('key')]).uniq
    indexed = index.select { |row| source_keys.include?(M.key(row)) }
    raise "existing occurrence-index owners at candidate rows: #{indexed.map { |row| [row['entity_key'], *M.key(row)].join(':') }.join('|')}" unless indexed.empty?

    reviews = []
    SPECS.each do |term, ids, korean_by_id, target_korean, ja_name, zh_name|
      expected = ids.map { |id| key('default', id) }.sort
      actual = find_english_hits(inventory, term).sort
      raise "all-resource English scope differs for #{term}: #{actual.inspect}" unless actual == expected
      ids.each do |id|
        reviews << review_row(inventory, term, id, korean_by_id.fetch(id), target_korean,
                              Regexp.new(Regexp.escape(ja_name)),
                              Regexp.new(Regexp.escape(zh_name)))
      end
    end
    raise 'candidate with a space unexpectedly has an exact English hit' unless
      find_english_hits(inventory, SPACING_HOLD.fetch('candidate')).empty?
    raise 'concatenated hold label has unexpected all-resource scope' unless
      find_english_hits(inventory, SPACING_HOLD.fetch('actual_english')) ==
        [SPACING_HOLD.fetch('key')]
    reviews << spacing_hold(inventory)

    reviews.sort_by! { |row| [row['ID_Linha'].to_i, row['term']] }
    exact = reviews.reject { |row| row['status'] == 'hold' }
    raise 'unexpected distinct source-key count' unless
      exact.map { |row| M.key(row) }.uniq.length == 35 &&
      reviews.map { |row| M.key(row) }.uniq.length == 36
    raise 'unexpected already-paired count' unless exact.count { |row| row['status'] == 'not-an-issue' } == 5

    puts "D-#{D}: read-only source-label review; #{exact.length} exact source keys; " \
         "#{exact.count { |row| row['status'] == 'accepted' }} proposed annotations; " \
         "#{exact.count { |row| row['status'] == 'not-an-issue' }} already paired; " \
         "#{reviews.count { |row| row['status'] == 'hold' }} spacing hold; one batch."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'Tipo_Variante',
                                   'term', 'status', 'old', 'new'))
    end
    reviews
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-source-labels-D21633.rb [prepare]' unless ARGV.empty? || ARGV == ['prepare']
  ReviewSourceLabelsD21633.prepare
end
