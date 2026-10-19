#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewMemoirAndDiaryLabelsD21582
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_582
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  DATA = [
    ['magnus-memoirs-i', "Magnus' Memoirs, Part I", '매그너스의 회고록 제1부',
     '매그너스(Magnus)의 회고록 제1부', 1],
    ['magnus-memoirs-ii', "Magnus' Memoirs Part II", '매그너스의 회고록 제2부',
     '매그너스(Magnus)의 회고록 제2부', 1],
    ['magnus-memoirs-iii', "Magnus' Memoirs Part III", '매그너스의 회고록 제3부',
     '매그너스(Magnus) 회고록 제3부', 1],
    ['magnus-memoirs-iv', "Magnus' Memoirs Part IV", '매그너스의 회고록 제4부',
     '매그너스(Magnus)의 회고록 제4부', 1],
    ['tyr-magnus-hroth-memoirs-i', 'The Memoirs of Tyr Magnus: Hroth Magnus Part I',
     '티르 매그너스의 회고록: 흐로스 매그너스 제1부',
     '티르 매그너스(Tyr Magnus)의 회고록: 흐로스 매그너스(Hroth Magnus) 1부', 1],
    ['tyr-magnus-hroth-memoirs-ii', 'The Memoirs of Tyr Magnus: Hroth Magnus Part II',
     '티르 매그너스의 회고록: 흐로스 매그너스 제2부',
     '티르 매그너스(Tyr Magnus) 회고록: 흐로스 매그너스(Hroth Magnus) 2부', 1],
    ['tyr-magnus-hroth-memoirs-iii', 'The Memoirs of Tyr Magnus: Hroth Magnus Part III',
     '티르 매그너스의 회고록: 흐로스 매그너스 제3부',
     '티르 매그너스(Tyr Magnus) 회고록: 흐로스 매그너스(Hroth Magnus) 제3부', 1],
    ['tyr-magnus-hroth-memoirs-iv', 'The Memoirs of Tyr Magnus: Hroth Magnus Part IV',
     '티르 매그너스의 회고록: 흐로스 매그너스 제4부',
     '티르 매그너스(Tyr Magnus) 회고록: 흐로스 매그너스(Hroth Magnus) 제4부', 1],
    ['tyr-magnus-memoirs-prologue', 'The Memoirs of Tyr Magnus: Prologue',
     '티르 매그너스의 회고록: 서장', '티르 매그너스(Tyr Magnus)의 회고록: 서장', 1],
    ['journal-of-tyr-magnus', 'Journal of Tyr Magnus', '티르 매그너스의 일지',
     '티르 매그너스(Tyr Magnus)의 일지', 1],
    ['kallas-notes', "Kallas' Notes", '칼라스의 기록',
     '칼라스(Kallas)의 쪽지|칼라스(Kallas)의 기록', 2],
    ['mcleod-notes', 'McLeod‘s Notes', '맥클라우드의 기록',
     '맥클라우드(McLeod)의 기록', 1],
    ['wulf-diary-label', 'Wulf‘s Diary', '울프의 일기', '울프(Wulf)의 일기', 1],
    ['wulf-godfrey-apprentice-diary', "Diary of Wulf Godfrey, Blacksmith's Apprentice",
     '대장장이 수습공 울프 고드프리의 일기', '대장장이 수습공 울프 고드프리(Wulf Godfrey)의 일기', 1],
    ['journal-on-organs', 'Journal on Organs', '장기에 관한 일지', '장기에 관한 일지', 2]
  ].freeze
  CONTEXT = <<~TEXT.chomp
    Review 15 complete memoir/diary/notes labels across affix/base/default:
    17 keys/matches, seven base and ten default, with no affix hits.
    English defines the exact label; aligned Japanese/Chinese corroborate
    the names, work types and volume numbers. Reuse established 매그너스,
    티르 매그너스, 흐로스 매그너스, 칼라스, 맥클라우드 and 울프 고드프리.
    Standardize the Magnus numbered labels to 의 회고록 and 제1-4부
    without changing any volume's number. Keep source-short Magnus labels
    short, and full Tyr/Hroth labels complete. Record these source labels
    independently: do not infer from ordinal numbers alone which physical
    manuscript or edition they denote, or invent a global Magnus alias.
    Likewise, preserve each source-local Wulf diary label without inferring
    new relationships or reopening the existing Wulf person decision.
    Keep the exact English punctuation, including the source left-curly
    apostrophes in McLeod‘s and Wulf‘s. Kallas' Notes uses 기록 consistently,
    supported by Japanese メモ and Chinese 笔记; do not infer document length.
    Journal on Organs is explicitly quoted as a cover title at default:1717,
    so pair that title inside its description as well as base:1895.
    Base:1661 Memoirs Prologue has no named author; leave it outside this
    named-work scope rather than assigning it to Tyr or another memoirist.
    The non-exhaustive official Korean manual has no direct title entries.
    No owner-person dispositions, unresolved holds or historical totals are
    reopened. Preserve other entities, dates, descriptions, tokens and line
    endings. Full discovery remains incomplete; release ZIP is unchanged.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    entities = DATA.map do |slug, english, korean, _old, _count|
      values = {
        'entity_key' => "named work:#{slug}", 'english_canonical' => english,
        'korean_canonical' => "#{korean}(#{english})", 'category' => 'named work',
        'english_aliases' => '', 'korean_variants' => korean,
        'evidence_ids' => "D-#{D}", 'status' => 'confirmed', 'notes' => CONTEXT
      }
      glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    end
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, entities).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    counts = generated.group_by { |row| row.fetch('entity_key') }.transform_values(&:length)
    raise "source counts differ: #{counts.inspect}" unless
      counts == DATA.to_h { |row| ["named work:#{row[0]}", row[4]] }
    reviews = generated.sort_by do |row|
      key = M.key(row)
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      data = DATA.find { |row| "named work:#{row[0]}" == match['entity_key'] }
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      paired = "#{data[2]}(#{data[1]})"
      if key == ['default', '1717', '']
        raise 'unexpected Organs description source' unless
          english == 'This book looks like most others. On the cover is written "Journal on Organs".'
        raise 'unexpected Organs description translation' unless
          old == '여느 책과 다를 바 없어 보인다. 표지에는 장기에 관한 일지라고 적혀 있다.'
        updated = old.sub('장기에 관한 일지', paired)
      else
        raise "unexpected title source #{key.inspect}" unless english == data[1]
        raise "unexpected old title #{key.inspect}" unless data[3].split('|').include?(old)
        updated = paired
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => match.fetch('entity_key'), 'status' => 'accepted',
        'old' => old, 'new' => updated, 'evidence' => CONTEXT, 'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(match.fetch('entity_key') => 'accepted')
      }
    end
    raise 'expected 17 keys/edits' unless reviews.length == 17
    R.validate!(entities, reviews, generated, glossary.map(&:to_h),
                M.table(M::INDEX).map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row['resource'] }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    puts "D-#{D}: 15 work labels, 17 keys/edits; prepare only."
    [glossary.headers, entities, reviews]
  end

  def apply
    headers, entities, reviews = prepare
    M.write_table(DEFINITIONS, headers, entities)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Memoir Volumes And Source-Local Diary Labels

      #{CONTEXT}
      Corrected 17 complete-title annotations, seven base and ten default;
      registered 15 source-label entries. Standardized the Magnus volume
      formatting and Kallas' Notes wording. All literal English apostrophes,
      author-name lengths, volume numbers and cover-description text are
      preserved. Generic Memoirs Prologue remains unassigned and unchanged.
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
  when [], ['prepare'] then ReviewMemoirAndDiaryLabelsD21582.prepare
  when ['apply'] then ReviewMemoirAndDiaryLabelsD21582.apply
  else abort 'usage: review-memoir-and-diary-labels-D21582.rb [prepare|apply]'
  end
end
