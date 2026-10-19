#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewRothGarverD21588
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_588
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  ENTITY = 'person:roth-garver'
  ENGLISH = 'Roth Garver'
  KOREAN = '로스 가버'
  CANONICAL = "#{KOREAN}(#{ENGLISH})"
  EXPECTED_IDS = %w[7491 20738 25864 28336 29530 53930].freeze
  EDIT_IDS = %w[20738 25864 29530].freeze
  CONTEXT = <<~TEXT.chomp
    English identifies Roth Garver in six default keys; Japanese ロス・ガーバー
    and Chinese 罗斯·加弗 corroborate the same full name. The exact full name
    has no affix or base hits. Use 로스 가버(Roth Garver), pairing only the
    three unpaired occurrences at default:20738, 25864 and 29530. The other
    three occurrences are already paired and remain unchanged. At 7491 and
    29530, assess Roth as a person independently of the previously reviewed
    Barghest keys; retain their prior entity decisions and all Night Barghest
    wording. Do not introduce given-name/surname aliases or infer relationships.
    The official Korean manual files contain no direct entry for this name.
    The D-21569 release ZIP is unchanged; proper-name discovery remains
    incomplete.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    raise 'Roth Garver entity already exists' if
      glossary.any? { |row| row['entity_key'] == ENTITY } ||
      index.any? { |row| row['entity_key'] == ENTITY }

    values = {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'korean_canonical' => CANONICAL,
      'category' => 'person',
      'english_aliases' => '',
      'korean_variants' => KOREAN,
      'evidence_ids' => "D-#{D}",
      'status' => 'confirmed',
      'notes' => "#{CONTEXT} Every source occurrence was checked against aligned English, Japanese and Chinese across affix/base/default."
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
        japanese_text.include?('ロス・ガーバー')
      raise "Chinese name evidence missing at #{key.inspect}" unless
        chinese_text.include?('罗斯·加弗')
      raise "English name evidence missing at #{key.inspect}" unless
        english_text.include?(ENGLISH)
      raise "Korean name occurrence is ambiguous at #{key.inspect}" unless
        old.scan(/로스 가버(?:\(Roth Garver\))?/).length == 1

      already_paired = old.include?(CANONICAL)
      updated = if already_paired
                  old
                else
                  old.sub(KOREAN, CANONICAL)
                end
      raise "unexpected unpaired/paired state at #{key.inspect}" unless
        (already_paired == !EDIT_IDS.include?(key[1])) &&
        (old == updated) == already_paired

      status = old == updated ? 'not-an-issue' : 'accepted'
      disposition = JSON.generate(ENTITY => status)
      {
        'resource' => key[0], 'ID_Linha' => key[1],
        'Tipo_Variante' => key[2], 'entity_key' => ENTITY,
        'status' => status, 'old' => old, 'new' => updated,
        'evidence' => CONTEXT,
        'english' => english_text, 'japanese' => japanese_text,
        'chinese' => chinese_text,
        'entity_dispositions_json' => disposition
      }
    end
    raise 'unexpected edit count' unless
      reviews.count { |row| row['old'] != row['new'] } == EDIT_IDS.length

    R.validate!([entity], reviews, generated, glossary.map(&:to_h),
                index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    edits = reviews.select { |row| row['old'] != row['new'] }
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), edits)
    puts "D-#{D}: one full personal name, six keys, three Texto edits; prepare only."
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
      ### D-#{D}: Roth Garver Full-Name Pairing

      #{CONTEXT}
      Registered one full personal name and reviewed all six aligned source
      keys. Corrected default:20738, 25864 and 29530; left the already-paired
      default:7491, 28336 and 53930 unchanged. Existing Barghest dispositions
      at 7491 and 29530 were preserved as separate entity keys.
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
  when [], ['prepare'] then ReviewRothGarverD21588.prepare
  when ['apply'] then ReviewRothGarverD21588.apply
  else abort 'usage: review-roth-garver-D21588.rb [prepare|apply]'
  end
end
