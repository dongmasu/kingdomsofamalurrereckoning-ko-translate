#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewSimeonCroweD21597
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_597
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  ENTITY = 'person:simeon-crowe'
  ENGLISH = 'Simeon Crowe'
  SHORT_ALIAS = 'Simeon'
  KOREAN = '시미언 크로'
  CANONICAL = "#{KOREAN}(#{ENGLISH})"
  EXPECTED_IDS = %w[8970 9804 43122 57087 61092].freeze
  EDIT_IDS = %w[8970 9804 43122].freeze
  KOREAN_SPANS = /
    (?:시미언\s+크로|시메온\s+크로우|시메온)
    (?:\((?:Simeon\s+Crowe|Simeon)\))?
  /x.freeze
  CONTEXT = <<~TEXT.chomp
    English names Simeon Crowe in default:8970, 9804, 43122 and 57087.
    The first is his fate-reading introduction; 9804 identifies him as the
    speaker's fateweaving teacher. Japanese シメオン・クロウ and Chinese
    西米恩·克罗 corroborate the same full name. Use the established paired
    form 시미언 크로(Simeon Crowe), standardizing the unpaired spellings at
    8970, 9804 and 43122. Default:57087 is already paired and remains
    unchanged. At default:61092, the objective says “Talk to Sverri or
    Simeon”; Japanese スヴェリかシメオン and Chinese 斯维里或者西米恩 align
    the short name, and the paired Korean 시메온(Simeon) is already correct.
    Register Simeon as this person's directly supported short-name alias.
    The surname-only label Crowe at default:33404 has no context linking it
    to Simeon; do not infer that it is the same person. D-13190 at
    default:43122 and D-2793 at default:9804 were grouped historical
    uncertainties; this batch resolves only the Simeon Crowe name-form
    question. Preserve the other findings in those decisions, including
    fateweaving terminology at 9804.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    raise 'Simeon Crowe entity already exists' if
      glossary.any? { |row| row['entity_key'] == ENTITY } ||
      index.any? { |row| row['entity_key'] == ENTITY }

    values = {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'korean_canonical' => CANONICAL,
      'category' => 'person',
      'english_aliases' => SHORT_ALIAS,
      'korean_variants' => '시미언 크로|시메온 크로우|시메온',
      'evidence_ids' => "D-#{D}|default:8970|default:9804|default:43122|default:57087|default:61092",
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
      expected_english = key[1] == '61092' ? SHORT_ALIAS : ENGLISH
      raise "English identity evidence missing at #{key.inspect}" unless
        english_text.include?(expected_english)
      if key[1] == '61092'
        raise "Japanese short-name evidence missing at #{key.inspect}" unless
          japanese_text.include?('シメオン')
        raise "Chinese short-name evidence missing at #{key.inspect}" unless
          chinese_text.include?('西米恩')
      else
        raise "Japanese full-name evidence missing at #{key.inspect}" unless
          japanese_text.include?('シメオン・クロウ')
        raise "Chinese full-name evidence missing at #{key.inspect}" unless
          chinese_text.include?('西米恩·克罗')
      end
      raise "Korean name occurrence is ambiguous at #{key.inspect}" unless
        old.scan(KOREAN_SPANS).length == 1

      updated = if key[1] == '61092' || key[1] == '57087'
                  old
                else
                  old.sub(KOREAN_SPANS, CANONICAL)
                end
      changed = old != updated
      if EDIT_IDS.include?(key[1])
        raise "expected pairing/spelling edit missing at #{key.inspect}" unless changed
      else
        raise "unexpected edit at already-paired key #{key.inspect}" if changed
      end
      status = changed ? 'accepted' : 'not-an-issue'
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
    puts "D-#{D}: one personal name, five aligned keys, three Texto edits; prepare only."
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
      ### D-#{D}: Simeon Crowe Full Name And Short Reference

      #{CONTEXT}
      Registered Simeon Crowe and the directly supported short-name alias
      Simeon. Reviewed all five aligned source keys. Corrected default:8970,
      9804 and 43122; left already-paired 57087 and 61092 unchanged. The
      unrelated surname-only Crowe label at default:33404 was not merged.
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
  when [], ['prepare'] then ReviewSimeonCroweD21597.prepare
  when ['apply'] then ReviewSimeonCroweD21597.apply
  else abort 'usage: review-simeon-crowe-D21597.rb [prepare|apply]'
  end
end
