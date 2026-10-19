#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewEdgardBastionD21592
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_592
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  ENTITY = 'person:edgard-bastion'
  ENGLISH = 'Edgard Bastion'
  KOREAN = '에드가드 배스천'
  CANONICAL = "#{KOREAN}(#{ENGLISH})"
  EXPECTED_IDS = %w[4820 17222 21312 25567 35232 39449 42803].freeze
  EDIT_IDS = %w[21312 25567 35232 42803].freeze
  CONTEXT = <<~TEXT.chomp
    English identifies Edgard Bastion in seven default keys. Japanese
    エドガード・バスティオン and Chinese 埃德加德·巴斯蒂恩 corroborate the
    established Korean 에드가드 배스천. Pair the unpaired spans at
    default:21312, 25567 and 42803; correct the inconsistent spelling and add
    the pair at 35232. Leave already-paired 4820, 17222 and 39449 unchanged.
    Preserve the speaker's dialogue, title/action wording and adjacent names;
    do not register aliases or infer a broader identity. The exact full name
    has no affix/base hits, and the official Korean manual files have no
    direct entry. The D-21569 release ZIP is unchanged; proper-name discovery
    remains incomplete.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    raise 'Edgard Bastion entity already exists' if
      glossary.any? { |row| row['entity_key'] == ENTITY } ||
      index.any? { |row| row['entity_key'] == ENTITY }

    values = {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'korean_canonical' => CANONICAL,
      'category' => 'person',
      'english_aliases' => '',
      'korean_variants' => '에드가드 배스천|에드가드 바스티온',
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
        japanese_text.include?('エドガード・バスティオン')
      raise "Chinese name evidence missing at #{key.inspect}" unless
        chinese_text.include?('埃德加德·巴斯蒂恩')
      raise "English name evidence missing at #{key.inspect}" unless
        english_text.include?(ENGLISH)
      variants = /(?:에드가드 배스천|에드가드 바스티온)(?:\(Edgard Bastion\))?/
      raise "Korean name occurrence is ambiguous at #{key.inspect}" unless
        old.scan(variants).length == 1

      already_canonical = old.include?(CANONICAL)
      updated = if already_canonical
                  old
                else
                  old.sub(variants, CANONICAL)
                end
      raise "unexpected paired state at #{key.inspect}" unless
        already_canonical == !EDIT_IDS.include?(key[1]) &&
        (old == updated) == already_canonical

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
    puts "D-#{D}: one full personal name, seven keys, four Texto edits; prepare only."
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
      ### D-#{D}: Edgard Bastion Full-Name Pairing

      #{CONTEXT}
      Registered Edgard Bastion as one full personal name and reviewed all
      seven aligned source keys. Corrected default:21312, 25567, 35232 and
      42803; left 4820, 17222 and 39449 unchanged.
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
  when [], ['prepare'] then ReviewEdgardBastionD21592.prepare
  when ['apply'] then ReviewEdgardBastionD21592.apply
  else abort 'usage: review-edgard-bastion-D21592.rb [prepare|apply]'
  end
end
