#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module BelneArenaPeopleD20936
  extend self

  M = ReviewedNameBatches
  BELNE_PEOPLE = %w[214 1767 4422 4925 8288 8380 8506 8798 10554 11794 21983 25437
                    31717 33353 35952 36028 40656 42964 47179 47424 52000 55988 56416 63271].freeze
  HEX_CARDS = %w[15632 22272 23400 23643 27670 32376 35852 62621].freeze
  SPECS = [
    ['person:belne', 'Belne', '벨른(Belne)', 'Master Belne', '벨네|벨른',
     'default:214|default:8380|default:10554|default:11794|default:52000',
     'English identifies the Winter Fae weapon/armor craftsman Belne. Japanese ベルン and Chinese 贝尔尼 generally corroborate; reuse the established 벨른 reading, also used by the named items. Keep source-supported complete Master Belne labels atomic and preserve surrounding title wording. Complete possessive item names are excluded from this personal-name scope.'],
    ['person:onionskin', 'Onionskin', '어니언스킨(Onionskin)', '', '양파 껍질|어니언스킨',
     'default:7401|default:48132|default:64706',
     'English default 7401 explicitly describes the named fighter, his warhammer skill/appetite, and his namesake food. Default 64706 lists Onionskin among favorite fighters. The standalone English Onionskin at 48132 and Japanese オニオンスキン match that name; Chinese 洋葱皮 translates the nickname literally. This is not evidence of an onion-skin material. Keep the food item title separate.'],
    ['person:the-hex', 'The Hex', '더 헥스(The Hex)', '', '주술|더 헥스',
     'default:61945|default:64706',
     'English default 64706 explicitly lists The Hex among favorite fighters. Its Chinese 巫士 matches the standalone default 61945 label; Japanese ヘックス also matches. This identifies the fighter, not an abstract spell. Eight separate cards/draw results are homonymous sixth-card references and excluded; do not add a broad Hex alias.']
  ].freeze

  def excluded?(entity, source)
    id = source.fetch('ID_Linha')
    case entity
    when 'person:belne'
      source['resource'] != 'default' || !BELNE_PEOPLE.include?(id)
    when 'person:onionskin'
      id == '15813'
    when 'person:the-hex'
      HEX_CARDS.include?(id)
    else
      raise "unknown entity #{entity}"
    end
  end

  def transform(text, entity)
    case entity
    when 'person:belne'
      result = text.gsub(/명장 벨네\(Master Belne\)/, '명장 벨른(Master Belne)')
      result.gsub!(/마스터 (?:벨른|벨네)(?:\(Master Belne\))?/, '마스터 벨른(Master Belne)')
      result.gsub!(/(?:벨른|벨네)(?:\(Belne\))?(?!\(Master Belne\))/, '벨른(Belne)')
      {'는' => '은', '가' => '이', '를' => '을', '와' => '과', '로' => '으로'}.each do |old, replacement|
        result.gsub!(/(벨른\((?:Master )?Belne\))#{old}(?=\s|[.,!?]|$)/, "\\1#{replacement}")
      end
      result
    when 'person:onionskin'
      text.gsub('양파 껍질', '어니언스킨(Onionskin)')
    when 'person:the-hex'
      text == '주술' ? '더 헥스(The Hex)' : text
    else
      raise "unknown entity #{entity}"
    end
  end

  def run
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    definitions = SPECS.map do |key, english, korean, aliases, variants, ids, notes|
      {
        'entity_key' => key, 'english_canonical' => english, 'category' => 'person',
        'korean_canonical' => korean, 'english_aliases' => aliases,
        'korean_variants' => variants, 'evidence_ids' => "D-20936|#{ids}",
        'status' => 'confirmed',
        'notes' => "#{notes} The official Korean manual PDF pp. 1 and 7 supplies world, equipment, and quest context but no direct spelling for these people. No PAK-derived evidence."
      }
    end
    inventory = M.table(M::INVENTORY).map(&:to_h).to_h { |row| [M.key(row), row] }
    generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    expected = {'person:belne' => 30, 'person:onionskin' => 4, 'person:the-hex' => 10}
    raise 'unexpected generated source counts' unless generated.group_by { |row| row['entity_key'] }.transform_values(&:length) == expected
    entities = definitions.to_h { |row| [row.fetch('entity_key'), row] }
    reviews = generated.group_by { |row| M.key(row) }.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      text = old.dup
      evidence = []
      dispositions = {}
      matches.each do |match|
        entity = match.fetch('entity_key')
        evidence << entities.fetch(entity).fetch('notes')
        if excluded?(entity, source)
          dispositions[entity] = 'excluded'
          evidence << 'This exact occurrence is a complete named item or a card/draw result, not a standalone personal reference. Preserve its entire existing cell and any prior item/entity decisions.'
          next
        end
        replacement = transform(text, entity)
        canonical = entities.fetch(entity).fetch('korean_canonical')
        raise "no paired person label #{entity} / #{key.inspect}" unless
          replacement.include?(canonical) ||
          (entity == 'person:belne' && replacement.include?('벨른(Master Belne)'))
        dispositions[entity] = text == replacement ? 'not-an-issue' : 'accepted'
        text = replacement
      end
      if key == ['default', '63271', '']
        evidence << 'Japanese omits the explicit Belne name in this sentence. English and Chinese identify him; the Japanese name reading is established by the other aligned Belne rows, not claimed present here.'
      end
      status = if text != old
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => matches.map { |row| row.fetch('entity_key') }.join('|'),
        'status' => status, 'old' => old, 'new' => text,
        'evidence' => evidence.join(' '),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end.sort_by { |row| [row.fetch('resource'), row.fetch('ID_Linha').to_i, row['Tipo_Variante']] }
    raise 'unexpected distinct source key count' unless reviews.length == 43
    M.write_table(File.join(__dir__, 'proper-name-discovery-definitions-D20936.tsv'), glossary.headers, definitions)
    M.write_table(File.join(__dir__, 'proper-name-discovery-D20936.tsv'), M::HEADERS, reviews)
    puts "#{definitions.length} definitions; #{generated.length} occurrences; #{reviews.length} distinct rows"
    puts reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect
  end
end

BelneArenaPeopleD20936.run if $PROGRAM_NAME == __FILE__
