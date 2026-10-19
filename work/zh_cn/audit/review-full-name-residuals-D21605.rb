#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewFullNameResidualsD21605
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_605
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONTEXT = <<~TEXT.chomp
    English-led review of 17 exact personal-name entities and all 50
    distinct affix/base/default source rows containing those full names.
    Exact English labels and contextual references were checked against
    aligned Japanese pronunciation/register and Chinese supporting text.
    Reuse established Korean name components, normalize each complete
    name to one non-nested Korean (English full-name) annotation, and
    leave short-name references outside the full-name span unchanged.
    Existing component-entity dispositions are preserved and not
    recounted; the full-name scopes are newly indexed. Source-local
    pronunciation variants are resolved only where the corpus provides
    a consistent form: Erion Raff uses 라프; Cyf Cadyr uses 카디르;
    Vulgar Donnoh uses the complete-label form 벌거 도노. No family
    relationship, biography, or role is inferred from a name label alone.
    The official Korean manual extraction/reference has no direct entry
    for these names. Preserve all unrelated text, tokens and line endings.
    Full discovery/residual validation remains incomplete.
  TEXT
  SPECS = [
    {
      english: 'Borri Kura', korean: '보리 쿠라',
      ids: { 'base' => [['4747', '11']], 'default' => %w[8724 37869 40003] },
      variants: ['보리 쿠라(Borri Kura)', '보리 쿠라(Kura)']
    },
    {
      english: 'Aryn Kest', korean: '아린 케스트',
      ids: { 'default' => %w[8700 15196] },
      variants: ['아린 케스트(Aryn Kest)', '아린 케스트(Kest)']
    },
    {
      english: 'Erion Raff', korean: '에리온 라프',
      ids: { 'default' => %w[10849 15216 18612 46060] },
      variants: [
        '에리온 라프(Erion Raff)', '에리온 래프(Erion Raff)',
        '에리온(Erion) 라프', '에리온(Erion) 래프', '에리온 래프'
      ]
    },
    {
      english: 'Lenero Faust', korean: '레네로 파우스트',
      ids: { 'default' => %w[15482 33359] },
      variants: ['레네로 파우스트(Lenero Faust)', '레네로(Lenero) 파우스트']
    },
    {
      english: 'Eselette Rier', korean: '에셀레트 리어',
      ids: { 'default' => %w[5256 19166] },
      variants: ['에셀레트 리어(Eselette Rier)', '에셀레트(Eselette) 리어']
    },
    {
      english: 'Edwin Leodwald', korean: '에드윈 레오드월드',
      ids: { 'default' => %w[19546 29982] },
      variants: [
        '에드윈 레오드월드(Edwin Leodwald)',
        '에드윈 레오드월드(Leodwald)'
      ]
    },
    {
      english: 'Lanus Davril', korean: '라누스 다브릴',
      ids: { 'default' => %w[8104 10950 19625 26948 39382 44879 56944] },
      variants: [
        '라누스 다브릴(Lanus Davril)',
        '라누스(Lanus) 다브릴(Davril)', '라누스 다브릴'
      ]
    },
    {
      english: 'Molly Janick', korean: '몰리 재닉',
      ids: { 'default' => %w[26285 30837 41941 43070] },
      variants: ['몰리 재닉(Molly Janick)', '몰리 재닉(Janick)']
    },
    {
      english: 'Arny Schnegar', korean: '아니 슈네거',
      ids: { 'default' => %w[29860] },
      variants: [
        '아니 슈네거(Arny Schnegar)', '아니(Arny) 슈네거(Schnegar)'
      ]
    },
    {
      english: 'Fridi Edstar', korean: '프리디 에드스타',
      ids: { 'default' => %w[10639 30930 60434] },
      variants: [
        '프리디 에드스타(Fridi Edstar)', '프리디(Fridi) 에드스타(Edstar)',
        '프리디 에드스타'
      ]
    },
    {
      english: 'Remy Kallas', korean: '레미 칼라스',
      ids: { 'default' => %w[33735] },
      variants: ['레미 칼라스(Remy Kallas)', '레미 칼라스(Kallas)']
    },
    {
      english: 'Jeibir Calurin', korean: '제이버 칼루린',
      ids: { 'default' => %w[35798 54154] },
      variants: [
        '제이버 칼루린(Jeibir Calurin)', '제이버(Jeibir) 칼루린'
      ]
    },
    {
      english: 'Idwa Widfrond', korean: '이드와 위드프론드',
      ids: { 'default' => %w[42 19422 32355 35880 42321 44802 62215] },
      variants: [
        '이드와 위드프론드(Idwa Widfrond)',
        '이드와(Idwa) 위드프론드', '이드와 위드프론드'
      ]
    },
    {
      english: 'Vulgar Donnoh', korean: '벌거 도노',
      ids: { 'default' => %w[19557 41024 49554 64445] },
      variants: [
        '벌거 도노(Vulgar Donnoh)', '불가르 도노(Donnoh)',
        '불가 도노(Donnoh)', '벌가 도노(Donnoh)'
      ]
    },
    {
      english: 'Cyf Cadyr', korean: '시프 카디르',
      ids: { 'default' => %w[8371 42847] },
      variants: [
        '시프 카디르(Cyf Cadyr)', '시프 캐디르(Cyf Cadyr)',
        '시프(Cyf) 카디르'
      ]
    },
    {
      english: 'Tynri Kalt', korean: '틴리 칼트',
      ids: { 'default' => %w[44015] },
      variants: ['틴리 칼트(Tynri Kalt)', '틴리 칼트(Kalt)']
    },
    {
      english: 'Einar Longnose', korean: '아이너 롱노즈',
      ids: { 'default' => %w[25517 47468] },
      variants: [
        '아이너 롱노즈(Einar Longnose)', '아이너(Einar) 롱노즈'
      ]
    }
  ].freeze

  def entity_key(english)
    "person:#{english.downcase.tr(' ', '-')}"
  end

  def expected_keys(spec)
    spec.fetch(:ids).flat_map do |resource, ids|
      ids.map do |item|
        id, variant = item.is_a?(Array) ? item : [item, '']
        [resource, id, variant.to_s]
      end
    end.sort
  end

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    definitions = []
    reviews = []
    generated_all = []

    SPECS.each do |spec|
      english = spec.fetch(:english)
      korean = spec.fetch(:korean)
      entity = entity_key(english)
      definition_values = {
        'entity_key' => entity,
        'english_canonical' => english,
        'category' => 'person',
        'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '',
        'korean_variants' => spec.fetch(:variants).join('|'),
        'evidence_ids' => (["D-#{D}"] + expected_keys(spec).map do |resource, id, variant|
          [resource, id, variant].reject(&:empty?).join(':')
        end).join('|'),
        'status' => 'confirmed',
        'notes' => CONTEXT
      }
      definition = glossary.headers.to_h do |header|
        [header, definition_values.fetch(header, '')]
      end
      entity_rows = build_occurrences(inventory.values, [definition]).map do |values|
        OCCURRENCE_HEADERS.zip(values).to_h
      end
      actual_keys = entity_rows.map { |row| M.key(row) }.sort
      raise "unexpected exact-name source coverage for #{english}: #{actual_keys.inspect}" unless
        actual_keys == expected_keys(spec)

      definitions << definition
      generated_all.concat(entity_rows)
      entity_rows.each do |match|
        key = M.key(match)
        source = inventory.fetch(key)
        en_text = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        ja_text = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
        zh_text = source.fetch('zh_text')
        name_pattern = Regexp.new(
          "(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])",
          Regexp::IGNORECASE
        )
        name_count = en_text.scan(name_pattern).length
        raise "no exact English full-name mention #{english} at #{key.inspect}" if name_count.zero?
        raise "missing aligned JA/ZH evidence at #{key.inspect}" if
          ja_text.strip.empty? || zh_text.to_s.strip.empty?

        alternatives = spec.fetch(:variants)
          .sort_by { |value| -value.length }
          .map { |value| Regexp.escape(value) }
          .join('|')
        korean_pattern = Regexp.new("(?:#{alternatives})")
        old = source.fetch('work_text')
        occurrences = old.scan(korean_pattern)
        raise "Korean full-name coverage mismatch #{english} at #{key.inspect}: #{occurrences.length}/#{name_count}" unless
          occurrences.length == name_count
        updated = old.gsub(korean_pattern, "#{korean}(#{english})")
        status = updated == old ? 'not-an-issue' : 'accepted'
        reviews << {
          'resource' => key[0],
          'ID_Linha' => key[1],
          'Tipo_Variante' => key[2],
          'entity_key' => entity,
          'status' => status,
          'old' => old,
          'new' => updated,
          'evidence' => CONTEXT,
          'english' => en_text,
          'japanese' => ja_text,
          'chinese' => zh_text,
          'entity_dispositions_json' => JSON.generate(entity => status)
        }
      end
    end

    row_keys = reviews.map { |row| M.key(row) }.uniq
    raise "expected 50 distinct reviewed source rows, got #{row_keys.length}" unless
      row_keys.length == 50
    raise 'duplicate reviewed row key' unless reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    R.validate!(definitions, reviews, generated_all, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(
      File.binread(M.csv_path('default')),
      reviews.select { |row| row['resource'] == 'default' && row['old'] != row['new'] }
    )
    ProperNameCellEditor.prepare(
      File.binread(M.csv_path('base')),
      reviews.select { |row| row['resource'] == 'base' && row['old'] != row['new'] }
    )
    reviews.sort_by! do |row|
      [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i]
    end
    puts "D-#{D}: #{definitions.length} full names, 50 distinct rows, " \
         "#{reviews.count { |row| row['old'] != row['new'] }} edits; prepare only."
    reviews.each do |row|
      next if row['old'] == row['new']
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'old', 'new'))
    end
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Fifty Full-Name Source Rows

      #{CONTEXT}
      Registered 17 complete personal-name entities and reviewed 50
      distinct source row keys: one base and 49 default. The full-name
      scopes are new; previously terminal given-name, surname, place and
      other entity decisions were preserved and not recounted. Existing
      complete full-name pairs remain unchanged. Applied only the reviewed
      name-span corrections; no unrelated text or resources were changed.
    TEXT
    report = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    [*M::DOCS, report, addendum].each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      if text.include?(marker)
        text.sub!(marker, "#{marker}\n\n#{detail}")
      else
        text << "\n\n#{detail}\n"
      end
      File.write(path, text)
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewFullNameResidualsD21605.prepare
  when ['apply'] then ReviewFullNameResidualsD21605.apply
  else abort 'usage: review-full-name-residuals-D21605.rb [prepare|apply]'
  end
end
