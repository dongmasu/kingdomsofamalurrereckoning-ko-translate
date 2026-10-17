#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module FourItemLabelsD21425
  extend self

  M = ReviewedNameBatches
  D = 21_425
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  ITEMS = [
    ['unique_item:crown-of-kreios', 'Crown of Kreios', '크레이오스의 왕관',
     '크레이오스(Kreios)의 왕관', %w[137 2660], 'クレイオスの王冠', '克雷欧斯之冠'],
    ['unique_item:fist-of-kreios', 'Fist of Kreios', '크레이오스의 주먹',
     '크레이오스(Kreios)의 주먹', %w[1694], 'クレイオスの拳', '克雷欧斯之拳'],
    ['unique_item:chain-of-kreios', 'Chain of Kreios', '크레이오스의 사슬',
     '크레이오스(Kreios)의 사슬', %w[3190], 'クレイオスの鎖', '克雷欧斯之链'],
    ['unique_item:mr-hoochs-magic-box', "Mr. Hooch's Magic Box", '후치 씨의 마법 상자',
     '후치 씨(Mr. Hooch)의 마법 상자', %w[2565], 'フーチ氏の魔法の箱', '胡奇先生的魔法盒']
  ].freeze

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'prepared outputs already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    definitions = ITEMS.map do |entity, english, korean, old, _ids, _ja, _zh|
      fields = {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => 'unique item', 'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '', 'korean_variants' => "#{old}|#{korean}",
        'evidence_ids' => "D-#{D}", 'status' => 'confirmed',
        'notes' => 'Source-local complete named item label, independently corroborated by aligned Japanese and Chinese. Pair the whole English title atomically, retaining the established Korean component spelling. This entry does not infer item rarity, owner identity, a global owner alias, or equivalence to another owner-derived item.'
      }
      glossary.headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'item source scope differs' unless generated.length == 5
    reviews = generated.map do |occurrence|
      item = ITEMS.find { |entry| entry[0] == occurrence['entity_key'] }
      entity, english_title, korean, expected_old, ids, ja, zh = item
      key = M.key(occurrence)
      raise "unexpected item key #{key.inspect}" unless
        key[0] == 'base' && key[2] == '11' && ids.include?(key[1])
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "item evidence changed #{key.inspect}" unless
        english == english_title && japanese == ja && chinese == zh &&
        source.fetch('work_text') == expected_old
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => 'accepted', 'old' => expected_old,
        'new' => "#{korean}(#{english_title})",
        'evidence' => "English gives the complete named item label #{english_title}; Japanese #{ja} and Chinese #{zh} corroborate each component. Replace only the partial owner annotation with a complete atomic Korean/English label. Preserve 크레이오스/후치 spelling. No separate owner identity, rarity, global alias, or item equivalence is inferred; prior unrelated dispositions and historical totals are preserved.",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(entity => 'accepted')
      }
    end
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('base')), reviews)
    puts "Prepared D-#{D}: four complete item titles, five base keys/Texto edits."
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'old', 'new')) }
    [definitions, reviews]
  end

  def apply
    definitions, reviews = prepare
    M.write_table(DEFINITIONS, M.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers,
                  definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then FourItemLabelsD21425.prepare
  when 'apply' then FourItemLabelsD21425.apply
  else abort 'usage: review-four-item-labels-D21425.rb [prepare|apply]'
  end
end
