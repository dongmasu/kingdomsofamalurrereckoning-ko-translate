#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

# Produce source-aligned proposals only; registration/application is a separate pass.
module VictoryGamesRelatedD20927
  extend self

  M = ReviewedNameBatches
  GLOSSARY = File.join(__dir__, 'proper-name-glossary.tsv')
  DEFINITIONS = File.join(__dir__, 'proper-name-discovery-definitions-D20927.tsv')
  REVIEWS = File.join(__dir__, 'proper-name-discovery-D20927.tsv')
  SPECS = [
    ['title:vox-victorium', 'Vox Victorium', 'title', '복스 빅토리움(Vox Victorium)', '',
     '복스 빅토리엄|복스 빅토리움',
     'default:1360|default:12938|default:34598',
     'The English self-introduction identifies Janis as the appointed host and master of ceremonies bearing this title. Japanese transliterates ヴォクス・ヴィクトリウム and Chinese translates 胜利之声. Keep the established majority 복스 빅토리움; do not recast the title as a faction or merge Janis into it.'],
    ['person:janis', 'Janis', 'person', '재니스(Janis)', '', '재니스',
     'default:1360',
     'English explicitly introduces the speaker as Janis, the Vox Victorium. Japanese ジャニス and Chinese 贾尼斯 support the personal identity; preserve the existing 재니스 reading and keep the office separate.'],
    ['person:voss-deviant', 'Voss Deviant', 'person', '보스 디비언트(Voss Deviant)', 'Deviant',
     '보스 데비언트|보스 디비언트|디비언트',
     'default:31498|default:58557|default:64706',
     'English identifies a local fighter after whom a beer is named and lists him among favorite fighters. Japanese ヴォス・ディビアント and Chinese 沃斯·狄梵特 corroborate. Retain the established 디비언트 over the isolated 데비언트; the shortened surname Deviant occurs only in the same biographical paragraph and is paired as 디비언트(Deviant), not expanded to the full name.'],
    ['place:mithros-arena', 'Mithros Arena', 'place', '미스로스 투기장(Mithros Arena)', '',
     '미스로스 경기장|미스로스 투기장',
     'default:3239|default:15961|default:20791|default:40251',
     'English identifies the named western arena and gives travel/meeting instructions. Japanese ミスロス闘技場 and Chinese 米萨罗斯竞技场 agree. Reuse the established 미스로스 regional spelling but pair the whole arena name atomically; generic arenas and the region alone are outside scope.'],
    ['place:erathell-arena', 'Erathell Arena', 'place', '에라셀 투기장(Erathell Arena)', '',
     '에라셀 경기장|에라셀 투기장',
     'default:11006|default:18091|default:31282|default:33770|default:61987',
     'English identifies the named arena in the northeast Faelands and meeting instructions. Japanese エラセル闘技場 and Chinese 伊拉塞尔竞技场 agree. Reuse the established 에라셀 place spelling and 투기장 venue noun, pairing the full venue atomically rather than just Erathell.']
  ].freeze

  def transform(text, entity)
    case entity
    when 'title:vox-victorium'
      text.gsub(/복스 빅토리[움엄](?:\(Vox Victorium\))?/, '복스 빅토리움(Vox Victorium)')
    when 'person:janis'
      text.gsub(/재니스(?:\(Janis\))?/, '재니스(Janis)')
    when 'person:voss-deviant'
      text = text.gsub(/보스 (?:데비언트|디비언트)(?:\(Voss Deviant\))?/, '보스 디비언트(Voss Deviant)')
      text.gsub(/(?<!보스 )디비언트(?!\()/, '디비언트(Deviant)')
    when 'place:mithros-arena'
      text.gsub(/미스로스(?:\(Mithros\))? (?:경기장|투기장)(?:\(Mithros Arena\))?/, '미스로스 투기장(Mithros Arena)')
    when 'place:erathell-arena'
      text.gsub(/에라셀(?:\(Erathell\))? (?:경기장|투기장)(?:\(Erathell Arena\))?/, '에라셀 투기장(Erathell Arena)')
    else
      raise "unexpected entity #{entity}"
    end
  end

  def run
    glossary = M.table(GLOSSARY)
    definitions = SPECS.map do |key, english, category, korean, aliases, variants, ids, evidence|
      {
        'entity_key' => key, 'english_canonical' => english, 'category' => category,
        'korean_canonical' => korean, 'english_aliases' => aliases,
        'korean_variants' => variants, 'evidence_ids' => "D-20927|#{ids}",
        'status' => 'confirmed',
        'notes' => "#{evidence} Official Korean manual PDF pp. 1 and 7 provides setting/faction context but does not establish a direct spelling for this name. No PAK-derived evidence."
      }
    end
    inventory = M.table(M::INVENTORY).map(&:to_h).to_h { |row| [M.key(row), row] }
    generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    by_entity = definitions.to_h { |row| [row.fetch('entity_key'), row] }
    raise 'unexpected related-name source counts' unless
      generated.group_by { |row| row['entity_key'] }.transform_values(&:length) ==
        {'title:vox-victorium' => 12, 'person:janis' => 1, 'person:voss-deviant' => 3,
         'place:mithros-arena' => 4, 'place:erathell-arena' => 5}

    reviews = generated.group_by { |row| M.key(row) }.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      text = old.dup
      dispositions = {}
      matches.each do |match|
        entity = match.fetch('entity_key')
        transformed = transform(text, entity)
        canonical = by_entity.fetch(entity).fetch('korean_canonical')
        raise "unmatched name #{entity} / #{key.inspect}" unless transformed.include?(canonical)
        dispositions[entity] = transformed == text ? 'not-an-issue' : 'accepted'
        text = transformed
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => matches.map { |row| row.fetch('entity_key') }.join('|'),
        'status' => old == text ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => text,
        'evidence' => matches.map { |row| by_entity.fetch(row['entity_key']).fetch('notes') }.join(' '),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end.sort_by { |row| [row.fetch('resource'), row.fetch('ID_Linha').to_i, row['Tipo_Variante']] }
    raise 'unexpected related-name distinct row count' unless reviews.length == 24
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS, reviews)
    puts "#{definitions.length} definitions; #{generated.length} occurrence keys; #{reviews.length} CSV rows"
    puts reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect
  end
end

VictoryGamesRelatedD20927.run if $PROGRAM_NAME == __FILE__
