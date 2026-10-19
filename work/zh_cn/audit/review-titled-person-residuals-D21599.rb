#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewTitledPersonResidualsD21599
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_599
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONTEXT = <<~TEXT.chomp
    English-led review of seven personal names across affix/base/default.
    Exact aligned English, Japanese and Chinese cells are retained in the
    manifest. Register no already reviewed person under a second title.
    The official Korean manual extraction/reference has no direct entries
    for these people. Preserve other entities and all existing dispositions.
    Change only the name or its directly attested epithet/annotation, not
    military-rank translations, actions, particles, tokens or line breaks.
    Complete existing English title/name labels cover their name components
    without redundant parentheses. No global translation totals are recounted;
    full proper-name discovery remains incomplete. The release ZIP is unchanged.
  TEXT
  SPECS = [
    {
      key: 'person:bromm', en: 'Bromm', ko: '브롬', aliases: [],
      ja: /ブロム/, zh: /布鲁姆/, base: [],
      ids: %w[3475 18107 34037 45625],
      variants: ['브롬'],
      note: 'English Sergeant Bromm identifies the Mel Senshir officer; Japanese ブロム and Chinese 布鲁姆 corroborate. Keep the existing 하사/병장 rank wording outside this name-only scope.',
      edits: {
        '34037' => [['브롬 병장', '브롬(Bromm) 병장']],
        '45625' => [['브롬 병장', '브롬(Bromm) 병장']]
      }
    },
    {
      key: 'person:brasken', en: 'Brasken', ko: '브라스켄', aliases: [],
      ja: /ブラスケン/, zh: /布拉斯肯/, base: [],
      ids: %w[422 12716 14340 17234 23671 38120 45504 60621],
      variants: ['브라스켄'],
      note: 'English Master/old Brasken identifies the blacksmith and mentor; Japanese ブラスケン and Chinese 布拉斯肯 corroborate. Master and old remain descriptive titles, not new aliases.',
      edits: {
        '38120' => [['브라스켄', '브라스켄(Brasken)']],
        '45504' => [['브라스켄', '브라스켄(Brasken)']]
      }
    },
    {
      key: 'person:dodwyn', en: 'Dodwyn', ko: '도드윈', aliases: [],
      ja: /ドドウィン/, zh: /多德[文温]/, base: [],
      ids: %w[182 6815 36261 52751],
      variants: ['도드윈'],
      note: 'English Captain Dodwyn is the Rathir dock captain sailing to Mel Senshir; Japanese ドドウィン and Chinese 多德文/多德温 corroborate. Existing full Captain Dodwyn pairs remain intact.',
      edits: { '36261' => [['도드윈', '도드윈(Dodwyn)']] }
    },
    {
      key: 'person:dorothy-enright', en: 'Dorothy Enright',
      ko: '도로시 엔라이트', aliases: ['Enright'],
      ja: /エンライト/, zh: /恩赖特/, base: [],
      ids: %w[192 26896 53971 56262 57868 58127 61927],
      variants: ['도로시 엔라이트', '엔라이트', '에인라이트'],
      note: 'The signed Nettie Blevins discharge certificate at default:56262 gives Captain Dorothy Enright. Default:57868 explicitly connects Captain Enright to that same signed certificate, and 26896 identifies the same Wolf Pack inquiry. Japanese エンライト/ドロシー・エンライト and Chinese 恩赖特/多罗西·恩赖特 corroborate. Pair the full name only where English supplies it; keep source-short Enright elsewhere. Normalize 에인라이트 to the established 엔라이트; subsequent same-row references need no duplicate English pair. Preserve all rank and military-organization wording.',
      edits: {
        '26896' => [
          ['에인라이트 대장', '엔라이트(Enright) 대장'],
          ['에인라이트는', '엔라이트는']
        ],
        '56262' => [['도로시 엔라이트 대위', '도로시 엔라이트(Dorothy Enright) 대위']],
        '57868' => [['엔라이트 대위가', '엔라이트(Enright) 대위가']],
        '58127' => [['엔라이트', '엔라이트(Enright)']]
      }
    },
    {
      key: 'person:farlun', en: 'Farlun', ko: '파를룬', aliases: [],
      ja: /ファーラン/, zh: /法[隆伦]/, base: %w[1139],
      ids: %w[55922 58677], variants: ['파를룬'],
      note: "English King Farlun appears in a house label and two objectives; Japanese ファーラン and Chinese 法隆/法伦 corroborate. Reuse 파를룬 and retain the source-local apostrophe in King Farlun' House. Do not create an ordinary King alias.",
      edits: { '58677' => [['파를룬', '파를룬(Farlun)']] }
    },
    {
      key: 'person:janya', en: 'Janya', ko: '잔야', aliases: [],
      ja: /ジャンヤ/, zh: /简娅|让雅/, base: %w[375],
      ids: %w[11161 23699], variants: ['잔야', '자냐'],
      note: 'English Captain Janya is the Alfar Army officer whose grave inscription invokes Lyria. Japanese ジャンヤ and Chinese 简娅/让雅 corroborate. Standardize 자냐 to the already paired base:375 잔야, keeping the complete Captain Janya annotation at default:23699 and preserving all rank wording.',
      edits: {
        '11161' => [['자냐(Janya)', '잔야(Janya)']],
        '23699' => [['자냐 대장(Captain Janya)', '잔야 대장(Captain Janya)']]
      }
    },
    {
      key: 'person:setter', en: 'Viscount Setter the Allseer',
      ko: '전지자 세터 자작', aliases: ['Lord Setter'],
      ja: /セッター/, zh: /赛特/, base: [],
      ids: %w[3374 4456 6958 7988 20185 28233 59764 63750],
      variants: ['전지자 세터 자작', '전지자 세터', '천리안 세터 자작', '모든 것을 보는 자 세터 자작', '세터 경'],
      note: 'English identifies the same royal-audience guest as Lord Setter and Viscount Setter the Allseer. Japanese セッター子爵/セッター卿 and Chinese 赛特领主/“全视者”威斯康特·赛特 corroborate. Reuse 전지자 from default:4456/59764 for Allseer and pair the complete Viscount Setter the Allseer label, not a nested shortened epithet. Preserve the already paired Lord Setter references and do not infer a global bare Setter alias.',
      edits: {
        '4456' => [['전지자 세터(Setter the Allseer) 자작', '전지자 세터 자작(Viscount Setter the Allseer)']],
        '20185' => [['천리안 세터 자작', '전지자 세터 자작(Viscount Setter the Allseer)']],
        '28233' => [['모든 것을 보는 자 세터 자작(Viscount Setter the Allseer)', '전지자 세터 자작(Viscount Setter the Allseer)']],
        '59764' => [['전지자 세터 자작', '전지자 세터 자작(Viscount Setter the Allseer)']]
      }
    }
  ].freeze

  def prepare
    R.ensure_unused_batch!(D)
    raise 'prepared discovery files already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    definitions = []
    reviews = []
    all_generated = []
    SPECS.each do |spec|
      evidence = "#{CONTEXT}\n#{spec.fetch(:note)}"
      expected = spec.fetch(:base).map { |id| ['base', id, '11'] } +
        spec.fetch(:ids).map { |id| ['default', id, ''] }
      values = {
        'entity_key' => spec.fetch(:key),
        'english_canonical' => spec.fetch(:en),
        'category' => 'person',
        'korean_canonical' => "#{spec.fetch(:ko)}(#{spec.fetch(:en)})",
        'english_aliases' => spec.fetch(:aliases).join('|'),
        'korean_variants' => spec.fetch(:variants).join('|'),
        'evidence_ids' => (["D-#{D}"] + expected.map { |key| key.join(':') }).join('|'),
        'status' => 'confirmed', 'notes' => evidence
      }
      entity = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
      generated = build_occurrences(inventory.values, [entity]).map do |row|
        OCCURRENCE_HEADERS.zip(row).to_h
      end
      raise "unexpected #{spec[:en]} source coverage" unless
        generated.map { |row| M.key(row) }.sort == expected.sort
      definitions << entity
      all_generated.concat(generated)
      generated.each do |match|
        key = M.key(match)
        source = inventory.fetch(key)
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
        chinese = source.fetch('zh_text')
        raise "missing aligned name evidence #{key.inspect}" unless
          japanese.match?(spec.fetch(:ja)) && chinese.match?(spec.fetch(:zh))
        old = source.fetch('work_text')
        updated = old.dup
        if key[0] == 'default'
          spec.fetch(:edits).fetch(key[1], []).each do |before, after|
            raise "nonunique reviewed Korean span #{key.inspect}: #{before}" unless
              updated.scan(Regexp.new(Regexp.escape(before))).length == 1
            updated = updated.sub(before, after)
          end
        end
        status = old == updated ? 'not-an-issue' : 'accepted'
        reviews << {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'entity_key' => spec.fetch(:key), 'status' => status,
          'old' => old, 'new' => updated, 'evidence' => evidence,
          'english' => english, 'japanese' => japanese, 'chinese' => chinese,
          'entity_dispositions_json' => JSON.generate(spec.fetch(:key) => status)
        }
      end
    end
    raise 'unexpected row/edit counts' unless
      reviews.length == 37 && reviews.count { |row| row['old'] != row['new'] } == 16
    R.validate!(definitions, reviews, all_generated, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    edits = reviews.select { |row| row['old'] != row['new'] }
    edits.group_by { |row| row.fetch('resource') }.each do |resource, targets|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), targets)
    end
    reviews.sort_by! { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
    puts "D-#{D}: seven people, 37 aligned keys, 16 Texto edits; prepare only."
    edits.each { |row| puts JSON.generate(row.slice('ID_Linha', 'old', 'new')) }
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Seven Titled-Person Residuals

      #{CONTEXT}
      Reviewed Bromm (4 keys), Brasken (8), Dodwyn (4), Dorothy Enright
      with source-supported Enright (7), Farlun (3), Janya (3), and
      Viscount Setter the Allseer with Lord Setter (8).
      The 37 keys include two base rows and 35 default rows, no affix hits.
      Edited 16 default Texto cells; all other cells are unchanged.
      Retained short/full source forms, complete title annotations and
      subsequent same-row short references. The old continuation script
      was not executed: its Airor/Ambyth/Harst candidates overlap existing
      title-qualified entities and must not create duplicate people.
      D-21598 residual-audit failure was a whitespace-only evidence-parser
      defect; normalizing whitespace restored recognition of the existing
      documented no-edit decision without changing any translation status.
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
  when [], ['prepare'] then ReviewTitledPersonResidualsD21599.prepare
  when ['apply'] then ReviewTitledPersonResidualsD21599.apply
  else abort 'usage: review-titled-person-residuals-D21599.rb [prepare|apply]'
  end
end
