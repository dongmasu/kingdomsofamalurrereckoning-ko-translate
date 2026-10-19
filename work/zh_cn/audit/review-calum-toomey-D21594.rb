#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewCalumToomeyD21594
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_594
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  ENTITY = 'person:calum-toomey'
  ENGLISH = 'Calum Toomey'
  KOREAN = '칼럼 투미'
  CANONICAL = "#{KOREAN}(#{ENGLISH})"
  EXPECTED_IDS = %w[20881 33910 38218 45135].freeze
  EDIT_IDS = %w[33910 38218 45135].freeze
  CONTEXT = <<~TEXT.chomp
    English identifies Calum Toomey in four default keys; Japanese
    カルム・トーミー and Chinese 卡勒姆·图米 corroborate the established Korean
    칼럼 투미. Leave already-paired default:20881 unchanged. Pair the
    unpaired mention at 33910 and standardize the Korean spelling plus pair at
    38218 and 45135. Preserve Elwa Brond, Cape Solace, particles and all other
    source text. Do not register component aliases. The exact full name has no
    affix/base hits, and the official Korean manual files have no direct
    entry. The D-21569 release ZIP is unchanged; proper-name discovery remains
    incomplete.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    raise 'Calum Toomey entity already exists' if
      glossary.any? { |row| row['entity_key'] == ENTITY } ||
      index.any? { |row| row['entity_key'] == ENTITY }

    values = {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'korean_canonical' => CANONICAL,
      'category' => 'person',
      'english_aliases' => '',
      'korean_variants' => '칼럼 투미|캘럼 투미',
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

    korean_spans = /(?:칼럼|캘럼) 투미(?:\(Calum Toomey\))?/
    reviews = generated.sort_by { |row| row['ID_Linha'].to_i }.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      english_text = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese_text = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese_text = source.fetch('zh_text')
      raise "Japanese name evidence missing at #{key.inspect}" unless
        japanese_text.include?('カルム・トーミー')
      raise "Chinese name evidence missing at #{key.inspect}" unless
        chinese_text.include?('卡勒姆·图米')
      raise "English name evidence missing at #{key.inspect}" unless
        english_text.include?(ENGLISH)
      raise "Korean name occurrence is ambiguous at #{key.inspect}" unless
        old.scan(korean_spans).length == 1

      already_paired = old.include?(CANONICAL)
      updated = already_paired ? old : old.sub(korean_spans, CANONICAL)
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
    puts "D-#{D}: one full personal name, four keys, three Texto edits; prepare only."
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
      ### D-#{D}: Calum Toomey Full-Name Pairing

      #{CONTEXT}
      Registered Calum Toomey as one full personal name and reviewed all four
      aligned source keys. Corrected default:33910, 38218 and 45135; left
      already-paired default:20881 unchanged.
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
  when [], ['prepare'] then ReviewCalumToomeyD21594.prepare
  when ['apply'] then ReviewCalumToomeyD21594.apply
  else abort 'usage: review-calum-toomey-D21594.rb [prepare|apply]'
  end
end
