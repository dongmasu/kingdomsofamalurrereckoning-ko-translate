#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewMichaelaVogelD21596
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_596
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  ENTITY = 'person:michaela-vogel'
  ENGLISH = 'Michaela Vogel'
  KOREAN = '미카엘라 포겔'
  CANONICAL = "#{KOREAN}(#{ENGLISH})"
  SOURCE_LOCAL_ALIAS = 'Michael Vogel'
  EXPECTED_IDS = %w[10131 20080 23667 28098 33250 49928].freeze
  EDIT_IDS = %w[10131 20080 33250 49928].freeze
  KOREAN_SPANS = /
    (?:마이클\s+보겔|미카엘라\s+포겔)
    (?:\((?:Michaela|Michael)\s+Vogel\))?
  /x.freeze
  CONTEXT = <<~TEXT.chomp
    English identifies Michaela Vogel in default:20080, 23667, 28098,
    33250 and 49928. Default:10131 alone says Michael Vogel, in the
    completion text for returning to the farmer after closing the Chaos
    Rifts and resolving the Critter problem. The aligned Japanese and
    Chinese use ミカエラ・ヴォーゲル and 米凯拉·沃格尔 at all six keys,
    and the surrounding quest context ties the reward to the same farmer.
    Treat Michael Vogel as a source-local English spelling variant of
    Michaela Vogel, not a separate person. Standardize Korean to
    미카엘라 포겔(Michaela Vogel) where English says Michaela, and use
    미카엘라 포겔(Michael Vogel) at default:10131 to preserve that row's
    exact English spelling. The already paired mentions at 23667 and
    28098 remain unchanged. The name is not present in the official Korean
    manual reference. D-6245's grouped historical uncertainty at 20080 is
    not reopened as a translation defect; D-18272 separately found its
    local content aligned, while this batch records the personal-name
    pairing and transliteration scope. Preserve the established,
    independent Mitharan and Preordained decisions at 28098.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    raise 'Michaela Vogel entity already exists' if
      glossary.any? { |row| row['entity_key'] == ENTITY } ||
      index.any? { |row| row['entity_key'] == ENTITY }

    values = {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'korean_canonical' => CANONICAL,
      'category' => 'person',
      'english_aliases' => SOURCE_LOCAL_ALIAS,
      'korean_variants' => '마이클 보겔|미카엘라 포겔',
      'evidence_ids' => "D-#{D}|default:10131|default:20080|default:23667|default:28098|default:33250|default:49928",
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
      expected_english = key[1] == '10131' ? SOURCE_LOCAL_ALIAS : ENGLISH
      raise "English identity evidence missing at #{key.inspect}" unless
        english_text.include?(expected_english)
      raise "Japanese name evidence missing at #{key.inspect}" unless
        japanese_text.include?('ミカエラ・ヴォーゲル')
      raise "Chinese name evidence missing at #{key.inspect}" unless
        chinese_text.include?('米凯拉·沃格尔')
      raise "Korean name occurrence is ambiguous at #{key.inspect}" unless
        old.scan(KOREAN_SPANS).length == 1

      korean_form = key[1] == '10131' ? "#{KOREAN}(#{SOURCE_LOCAL_ALIAS})" : CANONICAL
      updated = old.sub(KOREAN_SPANS, korean_form)
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
    puts "D-#{D}: one personal name, six aligned keys, four Texto edits; prepare only."
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
      ### D-#{D}: Michaela Vogel And Source-Local Michael Variant

      #{CONTEXT}
      Registered Michaela Vogel as one person with the directly attested
      source-local alias Michael Vogel. Reviewed all six aligned source keys.
      Corrected default:10131, 20080, 33250 and 49928; left the already-paired
      23667 and 28098 unchanged. The D-6245 grouped historical uncertainty is
      retained as history and is not counted as a new translation finding.
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
  when [], ['prepare'] then ReviewMichaelaVogelD21596.prepare
  when ['apply'] then ReviewMichaelaVogelD21596.apply
  else abort 'usage: review-michaela-vogel-D21596.rb [prepare|apply]'
  end
end
