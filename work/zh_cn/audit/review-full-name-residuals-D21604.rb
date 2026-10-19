#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewFullNameResidualsD21604
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_604
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONTEXT = <<~TEXT.chomp
    English-led review of four exact personal-name labels across
    affix/base/default, five default keys and no affix/base hits.
    Preserve existing Korean spellings and add the English full name
    where absent. Steve Trainer and Sean Andrew Murray are source name
    labels only: no NPC, developer-credit role or biography is inferred
    from their shuffled location. Japanese/Chinese transliterate the
    same complete names. Fargill Enfries reuses the paired 파길 엔프리스
    at default:16430. Do not infer a global Fargill alias from the
    separate healer's short-name dialogue. Frama Foswig is not Frama
    Aedic, as already established in D-21275; the unassigned Frama's
    Husband label at default:48893 is not linked to either person.
    The official Korean manual extraction/reference gives no direct
    entry for these names. Preserve other text, source-local labels,
    tokens, particles and line endings. No prior terminal person key is
    recounted, and the published release ZIP is unchanged.
    The residual Eyrie Peak/Eryie Peak labels are not resolved by this
    batch. Their referent type and equivalence remain unestablished;
    do not merge them or replace 봉우리 with a personal surname by
    Japanese/Chinese phonetic formatting alone. Full discovery remains
    incomplete, including short-name/title/partial-pair and other-category
    residuals; this bounded scan is not an overall completion claim.
  TEXT
  SPECS = [
    ['Steve Trainer', '스티브 트레이너', %w[17997], 'スティーブ・トレーナー', '史蒂夫·特雷纳'],
    ['Sean Andrew Murray', '션 앤드루 머리', %w[20162], 'ショーン・アンドリュー・マレー', '肖恩·安德鲁·默里'],
    ['Fargill Enfries', '파길 엔프리스', %w[16430 30760], 'ファーギル・エンフリーズ', '法吉尔·恩弗里斯'],
    ['Frama Foswig', '프라마 포스윅', %w[39968], 'フラマ・フォスウィグ', '法拉玛·佛斯维格']
  ].freeze

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    definitions, reviews, all_generated = [], [], []
    SPECS.each do |english, korean, ids, ja, zh|
      entity_id = "person:#{english.downcase.tr(' ', '-')}"
      values = {
        'entity_key' => entity_id, 'english_canonical' => english,
        'category' => 'person', 'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '', 'korean_variants' => korean,
        'evidence_ids' => (["D-#{D}"] + ids.map { |id| "default:#{id}" }).join('|'),
        'status' => 'confirmed', 'notes' => CONTEXT
      }
      definition = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
      generated = build_occurrences(inventory.values, [definition]).map do |row|
        OCCURRENCE_HEADERS.zip(row).to_h
      end
      raise "unexpected #{english} coverage" unless
        generated.map { |row| M.key(row) }.sort == ids.map { |id| ['default', id, ''] }.sort
      definitions << definition
      all_generated.concat(generated)
      generated.each do |match|
        key = M.key(match)
        source = inventory.fetch(key)
        en_text = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        ja_text = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
        zh_text = source.fetch('zh_text')
        raise "source label evidence changed #{key.inspect}" unless
          en_text == english && ja_text == ja && zh_text == zh
        old = source.fetch('work_text')
        pair = "#{korean}(#{english})"
        raise "Korean name label changed #{key.inspect}" unless [korean, pair].include?(old)
        status = old == pair ? 'not-an-issue' : 'accepted'
        reviews << {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'entity_key' => entity_id, 'status' => status, 'old' => old, 'new' => pair,
          'evidence' => CONTEXT, 'english' => en_text, 'japanese' => ja_text,
          'chinese' => zh_text,
          'entity_dispositions_json' => JSON.generate(entity_id => status)
        }
      end
    end
    raise 'unexpected review/edit counts' unless
      reviews.length == 5 && reviews.count { |row| row['old'] != row['new'] } == 4
    R.validate!(definitions, reviews, all_generated, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')),
                                reviews.select { |row| row['old'] != row['new'] })
    reviews.sort_by! { |row| row['ID_Linha'].to_i }
    puts "D-#{D}: four full names, five aligned keys, four Texto edits; prepare only."
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Four Remaining Clear Full-Name Labels

      #{CONTEXT}
      Registered four full-name entities, reviewed five keys, and edited
      four default Texto cells. The established Fargill pair remains
      unchanged. Eyrie Peak/Eryie Peak is a documented discovery hold
      outside the indexed 96 holds; it has no newly accepted translation,
      identity classification or CSV edit.
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
  when [], ['prepare'] then ReviewFullNameResidualsD21604.prepare
  when ['apply'] then ReviewFullNameResidualsD21604.apply
  else abort 'usage: review-full-name-residuals-D21604.rb [prepare|apply]'
  end
end
