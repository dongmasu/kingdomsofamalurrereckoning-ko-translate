#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewIdrisTheonenD21593
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_593
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  ENTITY = 'person:idris-theonen'
  ENGLISH = 'Idris Theonen'
  SOURCE_ALIAS = 'Idiris Theonen'
  KOREAN = '이드리스 테오넨'
  CANONICAL = "#{KOREAN}(#{ENGLISH})"
  EXPECTED_IDS = %w[4426 8984 14100 29544 35267 36609 45216 59745 60012].freeze
  EDIT_IDS = %w[4426 8984 29544 35267 36609 45216 59745 60012].freeze
  KOREAN_SPANS = /
    (?:이드리스\s+(?:테오넨|시오넨)|이디리스\s+테오넨)
    (?:\((?:Idris|Idiris)\s+Theonen\))?
  /x.freeze
  CONTEXT = <<~TEXT.chomp
    English identifies Idris Theonen, librarian of the Scholia Arcana, across
    seven exact-name keys. Japanese イドリス・セオネン and Chinese 伊德里斯·西欧恩
    corroborate the identity. A separate source-local spelling, "Idiris
    Theonen" at default:4426 and 60012, is confirmed as the same librarian by
    its role, the Omnibus Arcana objective, and aligned Japanese/Chinese names;
    retain that exact English spelling in each Korean parenthetical, but
    normalize the Korean name to 이드리스 테오넨. Pair the five unpaired
    canonical-name occurrences at default:8984, 29544, 35267, 36609 and 45216,
    normalize the two paired source-local spellings, and pair the final
    reference at 59745. Leave already-paired default:14100 unchanged. At 59745,
    inspect the whole lesson:
    the Korean text includes the concluding instruction and can safely receive
    only the missing name pair. Preserve its prior Scholia Arcana, Tuatha,
    Kandrian and Mel Aglir decisions. Do not create aliases for given names,
    titles or organizations. The exact full-name scope has no affix/base hits.
    The official Korean manual files have no direct entry. The D-21569 release
    ZIP is unchanged; proper-name discovery remains incomplete.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    raise 'Idris Theonen entity already exists' if
      glossary.any? { |row| row['entity_key'] == ENTITY } ||
      index.any? { |row| row['entity_key'] == ENTITY }

    values = {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'korean_canonical' => CANONICAL,
      'category' => 'person',
      'english_aliases' => SOURCE_ALIAS,
      'korean_variants' => '이드리스 테오넨|이드리스 시오넨|이디리스 테오넨',
      'evidence_ids' => "D-#{D}",
      'status' => 'confirmed',
      'notes' => "#{CONTEXT} Every occurrence was checked against aligned English, Japanese and Chinese across affix/base/default."
    }
    entity = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [entity]).map do |row|
      OCCURRENCE_HEADERS.zip(row).to_h
    end
    keys = generated.map { |row| M.key(row) }
    expected = EXPECTED_IDS.map { |id| ['default', id, ''] }
    raise "unexpected source keys: #{keys.inspect}" unless keys.sort == expected.sort
    raise 'unexpected non-default source hit' unless
      generated.all? { |row| row['resource'] == 'default' }

    reviews = generated.sort_by { |row| row['ID_Linha'].to_i }.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      english_text = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese_text = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese_text = source.fetch('zh_text')
      raise "Japanese name evidence missing at #{key.inspect}" unless
        japanese_text.include?('イドリス・セオネン')
      raise "Chinese name evidence missing at #{key.inspect}" unless
        chinese_text.match?(/伊德里斯·西(?:奥宁|欧恩)/)
      source_name = match.fetch('matched_english')
      raise "English name evidence missing at #{key.inspect}" unless
        english_text.include?(source_name)
      raise "unexpected English source spelling at #{key.inspect}" unless
        [ENGLISH, SOURCE_ALIAS].include?(source_name)
      raise "Korean name occurrence is ambiguous at #{key.inspect}" unless
        old.scan(KOREAN_SPANS).length == 1

      expected_pair = "#{KOREAN}(#{source_name})"
      already_paired = old.include?(expected_pair)
      updated = already_paired ? old : old.sub(KOREAN_SPANS, expected_pair)
      raise "unexpected paired state at #{key.inspect}" unless
        already_paired == !EDIT_IDS.include?(key[1]) &&
        (old == updated) == already_paired

      status = old == updated ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1],
        'Tipo_Variante' => key[2], 'entity_key' => ENTITY,
        'status' => status, 'old' => old, 'new' => updated,
        'evidence' => CONTEXT,
        'english' => english_text, 'japanese' => japanese_text,
        'chinese' => chinese_text,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    raise 'unexpected edit count' unless
      reviews.count { |row| row['old'] != row['new'] } == EDIT_IDS.length

    R.validate!([entity], reviews, generated, glossary.map(&:to_h),
                index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    edits = reviews.select { |row| row['old'] != row['new'] }
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), edits)
    puts "D-#{D}: Idris/Idiris source forms, nine keys, eight Texto edits; prepare only."
    [glossary.headers, entity, reviews]
  end

  def apply
    if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
      raise 'only one prepared discovery artifact exists' unless
        [DEFINITIONS, REVIEWS].all? { |path| File.exist?(path) }
      headers = M.table(DEFINITIONS).headers
      entity = M.table(DEFINITIONS).map(&:to_h)
      reviews = M.table(REVIEWS).map(&:to_h)
    else
      headers, entity, reviews = prepare
      M.write_table(DEFINITIONS, headers, [entity])
      M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    end
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Idris Theonen And Source-Local Idiris Variant

      #{CONTEXT}
      Registered one person entity with the directly attested source-local
      alias "Idiris Theonen"; reviewed nine aligned keys. Corrected
      default:4426, 8984, 29544, 35267, 36609, 45216, 59745 and 60012; left
      the already-paired default:14100 unchanged. The previously recorded
      non-person entity dispositions at default:59745 remain intact.
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
  when [], ['prepare'] then ReviewIdrisTheonenD21593.prepare
  when ['apply'] then ReviewIdrisTheonenD21593.apply
  else abort 'usage: review-idris-theonen-D21593.rb [prepare|apply]'
  end
end
