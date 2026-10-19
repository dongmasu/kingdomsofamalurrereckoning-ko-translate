#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewResidualFullPersonNamesD21586
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_586
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  DATA = [
    ['tormin-sagard', 'Tormin Sagard', '토르민 사가드', '토르민 사가드|토민 사가드', 2,
     'Japanese トーミン・サガード and Chinese 托尔敏·萨加尔德 corroborate both exact full-name labels. Reuse existing 토르민 사가드 at default:30892 and correct the omitted 르 at 57659.'],
    ['brill-tilgard', 'Brill Tilgard', '브릴 틸가드', '브릴 틸가드', 1,
     'Japanese ブリル・ティルガード and Chinese 布里尔·提尔加德 corroborate default:59216. Preserve the existing Korean name.'],
    ['turin-ayle', 'Turin Ayle', '투린 아일', '튜린 아일|투린 아일|투린 에일', 3,
     'The identical English labels at default:39795/41308/43787 have identical Japanese トゥリン・アイル and Chinese 都灵·艾尔. Use existing default:41308 투린 아일; Japanese トゥリン rather than チュリン supports 투린, and アイル supports 아일 rather than 에일.'],
    ['brok-almar', 'Brok Almar', '브록 알마르', '브록 알마르|브록 알마', 2,
     'Japanese ブロク・アルマー and Chinese 布洛克·阿尔玛 corroborate the two exact full-name labels. Reuse existing default:18758 브록 알마르 and correct the truncated surname at 26975, retaining the English final r in the shared Korean spelling.'],
    ['halina-poss', 'Halina Poss', '할리나 포스', '할리나 포스', 1,
     'Japanese ハリナ・ポス and Chinese 哈里那·波斯 corroborate default:18801. Preserve the existing Korean full name.'],
    ['jote-parth', 'Jote Parth', '조트 파스', '조트 파스', 1,
     'Japanese ジョート・パース and Chinese 乔特·帕尔斯 corroborate default:58111. Preserve the existing Korean full name.'],
    ['daverie-fourcound', 'Daverie Fourcound', '데이버리 포카운드', '데이버리 포카운드', 1,
     'Japanese ダヴェリー・フォアカウンド and Chinese 戴夫雷·弗尔康德 corroborate default:58180. Preserve existing 데이버리 포카운드; neither secondary language overrides the explicit English identity or establishes an official Korean romanization.'],
    ['heod-raedric', 'Heod Raedric', '히오드 래드릭', '히오드 래드릭', 1,
     'Japanese エオド・ラドリック and Chinese 赫欧德·莱德里克 corroborate default:57823. Preserve existing 히오드 래드릭 rather than inventing an otherwise unsupported Korean pronunciation.'],
    ['fenn-attwater', 'Fenn Attwater', '펜 애트워터', '펜 애트워터', 3,
     'Japanese フェン・アトウォーター and Chinese 芬恩·阿特沃特 corroborate two display labels and the race-again objective at default:56862. Preserve consistent 펜 애트워터, the particle 와 and all action wording. Other people use Fenn or Attwater; no component alias is introduced.'],
    ['narit-wyle', 'Narit Wyle', '나릿 와일', '나릿 와일', 3,
     'Japanese ナリット・ワイル and Chinese 纳瑞特·怀勒 corroborate two display labels and default:32386, which identifies this person as teaching lockpicking for coin. Preserve 나릿 와일 and the explanatory sentence, including its existing particle.']
  ].freeze
  CONTEXT = <<~TEXT.chomp
    Independently discovered full personal-name residuals, checked against
    English/Japanese/Chinese across affix/base/default. All 18 exact source
    keys are default; no affix/base hits for the ten full names. Register
    the full English names only, without global given-name/surname aliases,
    inferred relationships or biographical details absent from the source.
    Reuse established Korean full-name spellings, resolving the directly
    attested Tormin, Turin and Brok variants with source evidence above.
    Add one complete Korean(English) pair to each name span and retain
    particles/actions in the two longer objective/explanatory cells.
    The non-exhaustive official Korean manual has no direct entry for these
    names. None of these full-name entity keys has an existing terminal
    occurrence decision; do not reopen component-name dispositions or
    count historical translation totals again. Preserve every unrelated
    name, word, token, punctuation mark and line break. Full proper-name
    discovery remains incomplete; the D-21569 release ZIP is unchanged.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    entities = DATA.map do |slug, english, korean, variants, _count, notes|
      values = {
        'entity_key' => "person:#{slug}", 'english_canonical' => english,
        'korean_canonical' => "#{korean}(#{english})", 'category' => 'person',
        'english_aliases' => '', 'korean_variants' => variants,
        'evidence_ids' => "D-#{D}", 'status' => 'confirmed',
        'notes' => "#{notes} #{CONTEXT}"
      }
      glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    end
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, entities).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    counts = generated.group_by { |row| row.fetch('entity_key') }.transform_values(&:length)
    raise "source coverage differs: #{counts.inspect}" unless
      counts == DATA.to_h { |row| ["person:#{row[0]}", row[4]] }
    reviews = generated.sort_by do |row|
      [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
    end.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      entity = entities.find { |row| row['entity_key'] == match['entity_key'] }
      data = DATA.find { |row| "person:#{row[0]}" == match['entity_key'] }
      old = source.fetch('work_text')
      variants = data[3].split('|').sort_by { |text| -text.length }
      pattern = Regexp.union(variants)
      raise "unexpected Korean name occurrence count #{key.inspect}" unless old.scan(pattern).length == 1
      updated = old.sub(pattern, entity.fetch('korean_canonical'))
      raise "source outside reviewed default scope #{key.inspect}" unless key[0] == 'default'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity.fetch('entity_key'), 'status' => 'accepted',
        'old' => old, 'new' => updated, 'evidence' => entity.fetch('notes'),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity.fetch('entity_key') => 'accepted')
      }
    end
    raise 'expected 18 distinct row keys' unless reviews.length == 18 &&
      reviews.map { |row| M.key(row) }.uniq.length == 18
    R.validate!(entities, reviews, generated, glossary.map(&:to_h),
                M.table(M::INDEX).map(&:to_h))
    R.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), reviews)
    puts "D-#{D}: ten full names, 18 keys/edits; prepare only."
    [glossary.headers, entities, reviews]
  end

  def apply
    headers, entities, reviews = prepare
    M.write_table(DEFINITIONS, headers, entities)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Ten Unannotated Full Personal Names

      #{CONTEXT}
      Registered ten full-name entries and corrected 18 default Texto
      cells. Unified 토르민 사가드(Tormin Sagard), 투린 아일(Turin Ayle)
      and 브록 알마르(Brok Almar); paired the other seven existing Korean
      names. No source-short component aliases or prior-decision recount.
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
  when [], ['prepare'] then ReviewResidualFullPersonNamesD21586.prepare
  when ['apply'] then ReviewResidualFullPersonNamesD21586.apply
  else abort 'usage: review-residual-full-person-names-D21586.rb [prepare|apply]'
  end
end
