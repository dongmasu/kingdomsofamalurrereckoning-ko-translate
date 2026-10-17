#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module PersonDiscoveryD21058
  M = ReviewedNameBatches
  DEFINITIONS = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21058.tsv')
  REVIEWS = File.join(M::AUDIT, 'proper-name-discovery-D21058.tsv')
  NAMES = [
    ['gunnar-frode', 'Gunnar Frode', '거너 프로드', 'Frode',
     '거너 프로드|가너 프로드|군나르 프로데', 'base:1902|default:81|default:37828',
     'The owner of Draug\'s Toothpicks at Vorm Lodge. Japanese ガナー・フロード and Chinese 冈纳·弗劳德 corroborate the complete name. Reuse 거너 프로드 from the existing key label and paired quest wording. Frode occurs only with this full name or as its standalone surname label; Gunnar is not a global alias because Ani, Gray, and Esme Gunnar are distinct people.'],
    ['keurig-shaster', 'Keurig Shaster', '케우리그 샤스터', 'Keurig',
     '큐리그 샤스터|쿼리그 샤스터|큐릭 샤스터|키릭 샤스터|케우리그 셰스터|큐리그 셰스터',
     'default:62322|default:9041|default:38111|default:55076',
     'English identifies the former Oathblade hired by Mattix Dace to kill Derfel. Japanese ケウリグ・シャスター and Chinese 寇里格·沙斯特 corroborate identity. All short Keurig references in the source corpus concern this same feud; pair the local short form without inventing the surname.'],
    ['eldric-orhelm', 'Eldric Orhelm', '엘드릭 오헬름', 'Eldric',
     '엘드릭 오르헬름|엘드릭 오렐름|엘드릭 오름', 'default:185|default:56920|default:63884',
     'The missing Whitestone apothecary identified by his walking staff. Japanese エルドリック・オーヘルム and Chinese 埃尔德里奇·奥海姆 corroborate. Reuse the established paired 엘드릭 오헬름; preserve each row\'s differing Bodine/Cedric story wording in this name-only pass. Orhelm is not a global alias because Hera Orhelm is a different person; the same-row short Orhelm at default:63884 is explicit.'],
    ['odwald-bynothas', 'Odwald Bynothas', '오드월드 바이노타스', 'Odwald',
     '오드월드 비노타스|오드왈드 바이노타스', 'default:10373|default:19390|default:47094',
     'The Emaire scholar, scribe and named author. English identifies his role across quest updates and book credits; Japanese オドワルド・ビノーサス and Chinese 奥德沃德·比诺萨斯 corroborate. Reuse the dominant paired 오드월드 바이노타스. Do not register Bynothas as his global alias because Horsa Bynothas is separately named.'],
    ['hera-orhelm', 'Hera Orhelm', '헤라 오헬름', '',
     '헤라 오르헬름', 'default:56859|default:12725|default:48235',
     'English identifies the keeper of the Bone Wall bounty board. Japanese ヘラ・オーヘルム and Chinese 赫拉·奥赫尔姆 corroborate. Reuse the established 헤라 오헬름 and the same Orhelm surname spelling as Eldric, without treating them as one person or inventing a family relationship. Hera Edithing is a different full name.'],
    ['horsa-bynothas', 'Horsa Bynothas', '호르사 바이노타스', '',
     '호르사 비노타스', 'default:43932',
     'Standalone complete personal label Horsa Bynothas, Japanese ホーサ・ビノーサス and Chinese 霍萨·比诺萨斯. Preserve the existing Korean given name 호르사 and align the shared English surname spelling with 바이노타스. Do not infer a relationship to Odwald.'],
    ['ani-gunnar', 'Ani Gunnar', '애니 거너', '',
     '애니 거너', 'default:45122',
     'Standalone complete personal label Ani Gunnar, Japanese アニ・ガナー and Chinese 阿尼·冈纳. Preserve the existing 애니 거너 and add the complete English label; do not equate the Gunnar surname with Gunnar Frode.'],
    ['gray-gunnar', 'Gray Gunnar', '그레이 거너', '',
     '그레이 거너', 'default:45649|default:48023',
     'The complete label and a sickness dialogue identify Gray Gunnar; Japanese グレイ・ガナー and Chinese 格雷·冈纳 corroborate. The existing Korean spelling and bilingual labels are already consistent. No global Gunnar alias is inferred.'],
    ['esme-gunnar', 'Esme Gunnar', '에스메 거너', '',
     '에스메 거너', 'default:54730',
     'Standalone complete personal label Esme Gunnar, Japanese エズメイ・ガナー and Chinese 埃斯梅·冈纳. Preserve the existing 에스메 거너 and complete label; no global Gunnar alias is inferred.']
  ].freeze

  module_function

  def definitions
    NAMES.map do |slug, en, ko, aliases, variants, ids, notes|
      {
        'entity_key' => "person:#{slug}", 'english_canonical' => en,
        'category' => 'person', 'korean_canonical' => "#{ko}(#{en})",
        'english_aliases' => aliases, 'korean_variants' => variants,
        'evidence_ids' => "D-21058-D-21059|#{ids}", 'status' => 'confirmed',
        'notes' => notes
      }
    end
  end

  def edit_name(text, entity, source)
    case entity
    when 'person:gunnar-frode'
      text = text.gsub(/(?:거너 프로드|가너 프로드|군나르 프로데)(?:\(Gunnar Frode\))?/, '거너 프로드(Gunnar Frode)')
      text = '프로드(Frode)' if M.key(source) == ['default', '54680', '']
    when 'person:keurig-shaster'
      text = text.gsub(/(?:케우리그|큐리그|쿼리그|큐릭|키릭) (?:샤스터|셰스터)(?:\(Keurig Shaster\))?/, '케우리그 샤스터(Keurig Shaster)')
      text = text.gsub(/(?:케우리그|큐리그|쿼리그|큐릭|키릭)(?! (?:샤스터|셰스터)|\(Keurig\))/, '케우리그(Keurig)')
      text = text.gsub('케우리그(Keurig)은', '케우리그(Keurig)는')
    when 'person:eldric-orhelm'
      text = text.gsub(/엘드릭 (?:오르헬름|오헬름|오렐름|오름)(?:\(Eldric Orhelm\))?/, '엘드릭 오헬름(Eldric Orhelm)')
      text = text.gsub(/엘드릭(?! 오헬름|\(Eldric\))/, '엘드릭(Eldric)')
      if M.key(source) == ['default', '63884', '']
        text = text.gsub(/(?<!엘드릭 )오헬름(?!\(Orhelm\))/, '오헬름(Orhelm)')
      end
    when 'person:odwald-bynothas'
      text = text.gsub(/(?:오드월드|오드왈드) (?:바이노타스|비노타스)(?:\(Odwald Bynothas\))?/, '오드월드 바이노타스(Odwald Bynothas)')
      text = text.gsub(/(?:오드월드|오드왈드)(?! 바이노타스|\(Odwald\))/, '오드월드(Odwald)')
    when 'person:hera-orhelm'
      text = text.gsub(/헤라 (?:오르헬름|오헬름)(?:\(Hera Orhelm\))?/, '헤라 오헬름(Hera Orhelm)')
    when 'person:horsa-bynothas'
      text = text.gsub(/호르사 (?:비노타스|바이노타스)(?:\(Horsa Bynothas\))?/, '호르사 바이노타스(Horsa Bynothas)')
    when 'person:ani-gunnar'
      text = text.gsub(/애니 거너(?:\(Ani Gunnar\))?/, '애니 거너(Ani Gunnar)')
    when 'person:gray-gunnar', 'person:esme-gunnar'
      # These complete labels already match their source names exactly.
    else
      raise "unclassified person #{entity}"
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
      old = source.fetch('work_text')
      new_text = old.dup
      dispositions = {}
      notes = []
      matches.each do |match|
        entity = match.fetch('entity_key')
        before = new_text.dup
        new_text = edit_name(new_text, entity, source)
        dispositions[entity] = before == new_text ? 'not-an-issue' : 'accepted'
        notes << defs.find { |row| row['entity_key'] == entity }.fetch('notes')
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.join('|'),
        'status' => new_text == old ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => new_text,
        'evidence' => "D-21058-D-21059 English-led personal-name discovery. #{notes.join(' ')} The exact aligned Japanese and Chinese are retained in this manifest. Official manual setting context does not provide this character roster. Existing other-entity dispositions on these rows are preserved and are not counted as these new person decisions.",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
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
    puts "Prepared #{defs.length} entities, #{reviews.length} distinct rows, #{generated.length} matches: #{reviews.group_by { |r| r['status'] }.transform_values(&:length)}"
    puts "Definitions: #{DEFINITIONS}"
    puts "Review: #{REVIEWS}"
  end
end

PersonDiscoveryD21058.run if $PROGRAM_NAME == __FILE__
