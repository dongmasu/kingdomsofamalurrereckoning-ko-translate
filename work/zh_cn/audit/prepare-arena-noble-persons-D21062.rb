#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ArenaNoblePersonsD21062
  M = ReviewedNameBatches
  DEFINITIONS = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21062.tsv')
  REVIEWS = File.join(M::AUDIT, 'proper-name-discovery-D21062.tsv')
  ORDINARY_VIGOR = %w[1377 10019 13306 20690 22654].freeze
  NAMES = [
    ['bodine-borgue', 'Bodine Borgue', '보딘 보르그',
     'Bodine Borgues|Bodine|Borgue', '보다인 보르그|보딘 보그|보딘 보르그스',
     'default:2627|default:54413|default:185|default:26217',
     'English identifies the researcher and Arena opponent and names him as the missing apothecary\'s contact. Japanese ボダイン・ボーグ and Chinese 伯丁·博格/博格斯 corroborate. Normalize the established 보딘 보르그, but preserve the local English alternate Bodine Borgues in those three contract rows. Short Bodine and Borgue refer to this opponent. Cedric of Alserund at default:22478 is a real source discrepancy in all three locales, not an alias; preserve it.'],
    ['ealfwig-grilricas', 'Ealfwig Grilricas', '이얼프위그 그릴리카스',
     'Ealfwig', '엘프윅 그릴리카스|에올프위그 그릴리카스|이얼프윅 그릴리카스',
     'default:21899|default:17679|default:56371',
     'English identifies the Didenhil noble and medallion owner. Japanese イールフウィグ・グリルリカス and Chinese 埃夫维格·格瑞里加斯 corroborate. Reuse the dominant already-paired 이얼프위그 그릴리카스. Do not globally alias Grilricas: the surname also names a household and a complete Medallion item, while the standalone surname label is already bilingual.'],
    ['vigor-broadshield', 'Vigor Broadshield', '비거 브로드실드',
     'Vigor', '비고 브로드실드|바이거 브로드실드|비고르 브로드실드',
     'default:1363|default:58534|default:29042',
     'English identifies the Crows veteran swordsman; Japanese ビゴー・ブロードシールド and Chinese 威格尔·阔盾 corroborate. Reuse the existing dominant 비거 브로드실드 and short 비거. Five ordinary vitality/energy uses of vigor are excluded, not transliterated. Alma Broadshield is a different person, so Broadshield is not a global alias. The correct 비거(Vigor) at default:29042, previously handled by D-19763, is retained without reopening that disposition or recounting a global translation decision.'],
    ['helga-swanwhite', 'Helga Swanwhite', '헬가 스완화이트',
     'Helga|Swanwhite', '헬가 스완화이트',
     'default:1363|default:7798|default:64286|default:62126',
     'English identifies the Crows former Scholia Arcana mage. Japanese ヘルガ・スワンホワイト and Chinese 海尔格·斯旺怀特 corroborate. Preserve the consistent Korean spelling, adding missing full or short labels only. Swanwhite has a standalone surname label. The Helga of the Barelegs Sisters story at default:49084 is a different woman and is excluded from this person scope.'],
    ['alma-broadshield', 'Alma Broadshield', '앨마 브로드실드',
     '', '앨마 브로드실드', 'default:28715',
     'A separate complete personal label, Japanese アルマ・ブロードシールド and Chinese 阿尔玛巨盾. Retain the already-correct 앨마 브로드실드(Alma Broadshield), without equating this person with Vigor or inferring a family relationship.']
  ].freeze

  module_function

  def definitions
    NAMES.map do |slug, en, ko, aliases, variants, ids, notes|
      {
        'entity_key' => "person:#{slug}", 'english_canonical' => en,
        'category' => 'person', 'korean_canonical' => "#{ko}(#{en})",
        'english_aliases' => aliases, 'korean_variants' => variants,
        'evidence_ids' => "D-21062-D-21063|#{ids}", 'status' => 'confirmed',
        'notes' => notes
      }
    end
  end

  def excluded?(entity, source)
    return false unless source['resource'] == 'default'
    (entity == 'person:vigor-broadshield' && ORDINARY_VIGOR.include?(source['ID_Linha'])) ||
      (entity == 'person:helga-swanwhite' && source['ID_Linha'] == '49084')
  end

  def edit_name(text, entity, english)
    case entity
    when 'person:bodine-borgue'
      full = english.include?('Bodine Borgues') ? 'Bodine Borgues' : 'Bodine Borgue'
      text = text.gsub(/(?:보딘|보다인) (?:보르그스|보르그|보그)(?:\(Bodine Borgues?\))?/, "보딘 보르그(#{full})")
      text = text.gsub(/(?:보딘|보다인)(?:\(Bodine\))?/) do |name|
        Regexp.last_match.post_match.start_with?(' 보르그') ? name : '보딘(Bodine)'
      end
      text = text.gsub(/(?<!보딘 )(?:보르그스|보르그|보그)(?:\(Borgue\))?/, '보르그(Borgue)')
    when 'person:ealfwig-grilricas'
      text = text.gsub(/(?:이얼프위그|이얼프윅|엘프윅|에올프위그) 그릴리카스(?:\(Ealfwig Grilricas\))?/, '이얼프위그 그릴리카스(Ealfwig Grilricas)')
      text = text.gsub(/(?:이얼프위그|이얼프윅|엘프윅|에올프위그)(?:\(Ealfwig\))?/) do |name|
        Regexp.last_match.post_match.start_with?(' 그릴리카스') ? name : '이얼프위그(Ealfwig)'
      end
    when 'person:vigor-broadshield'
      text = text.gsub(/(?:비고르|바이거|비거|비고) 브로드실드(?:\(Vigor Broadshield\))?/, '비거 브로드실드(Vigor Broadshield)')
      text = text.gsub(/(?:비고르|바이거|비거|비고)(?:\(Vigor\))?/) do |name|
        Regexp.last_match.post_match.start_with?(' 브로드실드') ? name : '비거(Vigor)'
      end
    when 'person:helga-swanwhite'
      text = text.gsub(/헬가 스완화이트(?:\(Helga Swanwhite\))?/, '헬가 스완화이트(Helga Swanwhite)')
      text = text.gsub(/헬가(?! 스완화이트|\(Helga\))/, '헬가(Helga)')
    when 'person:alma-broadshield'
      raise 'stale Alma label' unless text.include?('앨마 브로드실드(Alma Broadshield)')
    else
      raise "unclassified entity #{entity}"
    end
    text
  end

  def run
    defs = definitions
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, defs).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      new_text = old.dup
      dispositions = {}
      notes = []
      matches.each do |match|
        entity = match.fetch('entity_key')
        notes << defs.find { |row| row['entity_key'] == entity }.fetch('notes')
        if excluded?(entity, source)
          dispositions[entity] = 'excluded'
        else
          before = new_text.dup
          new_text = edit_name(new_text, entity, english)
          dispositions[entity] = before == new_text ? 'not-an-issue' : 'accepted'
        end
      end
      status = if new_text != old
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.join('|'), 'status' => status,
        'old' => old, 'new' => new_text,
        'evidence' => "D-21062-D-21063 English-led personal-name discovery. #{notes.join(' ')} Exact aligned Japanese and Chinese are in the source columns. Official manual setting context does not supply this character roster; its omission is not uncertainty. Prior other-entity and sequential dispositions remain unchanged and are not added to global totals.",
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    ReviewedProperNameDiscovery.validate!(defs, reviews, generated, glossary.map(&:to_h), index.map(&:to_h))
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    M.write_table(DEFINITIONS, glossary.headers, defs)
    M.write_table(REVIEWS, M::HEADERS, reviews)
    puts "Prepared #{defs.length} people; #{reviews.length} rows, #{generated.length} entity matches: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

ArenaNoblePersonsD21062.run if $PROGRAM_NAME == __FILE__
