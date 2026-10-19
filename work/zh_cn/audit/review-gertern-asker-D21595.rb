#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewGerternAskerD21595
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_595
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  ENTITY = 'person:gertern-asker'
  ENGLISH = 'Gertern Asker'
  KOREAN = '게르턴 애스커'
  CANONICAL = "#{KOREAN}(#{ENGLISH})"
  EXPECTED_IDS = %w[9183 24693 32291 36923 38512 59318].freeze
  EDIT_IDS = EXPECTED_IDS
  KOREAN_SPANS = /
    (?:게르턴\s+(?:애스커|아스커)|거턴\s+애스커)
    (?:\(Gertern Asker\))?
  /x.freeze
  CONTEXT = <<~TEXT.chomp
    English identifies Gertern Asker in six default keys; Japanese
    ゲーテルン・アスカー and Chinese 戈尔滕·阿斯克尔 corroborate. Normalize
    the Korean full name to 게르턴 애스커(Gertern Asker) in all six source
    rows: default:9183, 24693, 32291, 36923, 38512 and 59318. This corrects
    local 애스커/아스커 and 거턴 variants while pairing the complete name.
    In 59318, pair the first full-name mention only and retain the later short
    given-name reference 게르턴. Preserve Bristletongue, Felltown, Asker's
    Alley, The Understyle, Jakasen and all other reviewed identities as
    separate entities. No given-name, surname, family-business or tavern
    aliases are inferred. Chinese default:38512 instead has 格特恩·阿斯特尔;
    English identity and Japanese alignment control this row. The exact full
    name has no affix/base hits. The official Korean manual files have no
    direct entry. The D-21569 release ZIP is unchanged; proper-name discovery
    remains incomplete.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    raise 'Gertern Asker entity already exists' if
      glossary.any? { |row| row['entity_key'] == ENTITY } ||
      index.any? { |row| row['entity_key'] == ENTITY }

    values = {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'korean_canonical' => CANONICAL,
      'category' => 'person',
      'english_aliases' => '',
      'korean_variants' => '게르턴 애스커|게르턴 아스커|거턴 애스커',
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
        japanese_text.include?('ゲーテルン・アスカー')
      raise "Chinese name evidence missing at #{key.inspect}" unless
        chinese_text.match?(/(?:戈尔滕·阿斯克尔|格特恩·阿斯特尔)/)
      raise "English name evidence missing at #{key.inspect}" unless
        english_text.include?(ENGLISH)
      raise "Korean name occurrence is ambiguous at #{key.inspect}" unless
        old.scan(KOREAN_SPANS).length == 1

      updated = old.sub(KOREAN_SPANS, CANONICAL)
      raise "already paired or missing edit at #{key.inspect}" if old == updated
      {
        'resource' => key[0], 'ID_Linha' => key[1],
        'Tipo_Variante' => key[2], 'entity_key' => ENTITY,
        'status' => 'accepted', 'old' => old, 'new' => updated,
        'evidence' => CONTEXT,
        'english' => english_text, 'japanese' => japanese_text,
        'chinese' => chinese_text,
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
      }
    end
    raise 'unexpected edit count' unless
      reviews.count { |row| row['old'] != row['new'] } == EDIT_IDS.length

    R.validate!([entity], reviews, generated, glossary.map(&:to_h),
                index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    edits = reviews.select { |row| row['old'] != row['new'] }
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), edits)
    puts "D-#{D}: one full personal name, six keys, six Texto edits; prepare only."
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
      ### D-#{D}: Gertern Asker Full-Name Standardization

      #{CONTEXT}
      Registered Gertern Asker as one full personal name and reviewed all six
      aligned source keys. Corrected all six. The second, short given-name
      mention in default:59318 remains unannotated.
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
  when [], ['prepare'] then ReviewGerternAskerD21595.prepare
  when ['apply'] then ReviewGerternAskerD21595.apply
  else abort 'usage: review-gertern-asker-D21595.rb [prepare|apply]'
  end
end
