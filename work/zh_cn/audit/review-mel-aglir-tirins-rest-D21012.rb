#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module MelAglirTirinsRestD21012
  extend self
  M = ReviewedNameBatches
  MEL = 'place:mel-aglir'
  TIRIN = 'place:tirins-rest'
  CITIZEN = 'title:mel-aglir-citizen'
  HYMNAL = 'work:tirins-rest-hymnal'
  CHARTER = 'work:tirins-rest-village-charter'
  MILITIA = 'organization:tirins-rest-militia'
  MEL_LABEL = '멜 아글리르(Mel Aglir)'
  TIRIN_LABEL = "티린의 안식처(Tirin's Rest)"
  MEL_PATTERN = '멜\s*아글리르(?:\s*\(Mel Aglir\))?'
  TIRIN_PATTERN = "[티틸]린의\\s*(?:안식처|쉼터)(?:\\s*\\(Tirin's Rest\\))?"
  SPECS = [
    [MEL, 'Mel Aglir', 'place', MEL_LABEL, '멜 아글리르',
     'base:4564:11|default:10044|default:48338',
     'Named Kandrian village, corroborated by Japanese メル・アグリア/メル・アグラー and Chinese 梅尔阿格里尔. Retain established 멜 아글리르, pairing every direct place reference.'],
    [TIRIN, "Tirin's Rest", 'place', TIRIN_LABEL, '틸린의 안식처|티린의 쉼터|티린의 안식처',
     'base:4790:11|default:3463|default:13898|default:35333',
     'Named village, corroborated by Japanese ティリンの宿場町/ティリンの休憩所 and Chinese 提林栖所. Standardize 티린의 안식처, not 틸린의 안식처 or 티린의 쉼터. The lower-case rest at default 35333 still identifies this village.'],
    [CITIZEN, 'Mel Aglir Citizen', 'title', '멜 아글리르 시민(Mel Aglir Citizen)', '멜 아글리르 시민',
     'default:58114',
     'Complete standalone citizen/role label; Japanese メル・アグリアの民 and Chinese 梅尔阿格里尔市民 agree. Title records this NPC label without asserting a unique personal identity.'],
    [HYMNAL, "Tirin's Rest Hymnal", 'named work', "티린의 안식처 찬송가집(Tirin's Rest Hymnal)",
     '틸린의 안식처 찬송가집|티린의 안식처 성가집',
     'base:4279:11|default:31966|default:29948',
     'Complete hymnal title shared by base and default; Japanese 讃美歌集 and Chinese 赞美诗集 corroborate. Use 찬송가집 for this work. The generic description church hymnal from the village at 29948 retains an ordinary place reference, not an invented full title.'],
    [CHARTER, "Tirin's Rest: Village Charter", 'named work',
     "티린의 안식처: 마을 헌장(Tirin's Rest: Village Charter)", '티린의 안식처: 마을 헌장',
     'default:16340|default:40159',
     'Exact standalone charter title, corroborated by Japanese 村の勅許状 and Chinese 村宪章. Pair the complete document title atomically, retaining its colon. The descriptive legal-charter wording at 40159 is not forcibly expanded to a title.'],
    [MILITIA, "Tirin's Rest Militia", 'organization',
     "티린의 안식처 민병대(Tirin's Rest Militia)", '티린의 안식처 민병대',
     'default:61652',
     'Complete named village militia label, corroborated by Japanese ティリンの宿場町民兵 and Chinese 提林栖所民兵. Keep the group name atomic rather than nesting its village component.']
  ].freeze

  def definitions
    SPECS.map do |entity, english, category, korean, variants, ids, note|
      {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => category, 'korean_canonical' => korean,
        'english_aliases' => '', 'korean_variants' => variants,
        'evidence_ids' => "D-21012-D-21015|#{ids}", 'status' => 'confirmed',
        'notes' => "#{note} English anchors identity; all aligned locale text is retained per row. Official Korean manual PDF pp. 1 and 7 gives world/quest background, not a direct spelling for these villages or works. Preserve Korean particles and unrelated wording."
      }
    end
  end

  def transform(old, english, key)
    text = old.dup
    states = {}
    if english == 'Mel Aglir Citizen'
      updated = text.sub(/#{MEL_PATTERN}\s+시민(?:\s*\(Mel Aglir Citizen\))?/,
                         '멜 아글리르 시민(Mel Aglir Citizen)')
      raise 'missing complete citizen label' unless updated.include?('멜 아글리르 시민(Mel Aglir Citizen)')
      states[CITIZEN] = updated == text ? 'not-an-issue' : 'accepted'
      states[MEL] = 'excluded'
      return [updated, states]
    end
    if english == "Tirin's Rest Hymnal"
      label = "티린의 안식처 찬송가집(Tirin's Rest Hymnal)"
      updated = text.sub(/#{TIRIN_PATTERN}\s+(?:찬송가집|성가집)(?:\s*\(Tirin's Rest Hymnal\))?/, label)
      raise 'missing complete hymnal title' unless updated == label
      states[HYMNAL] = updated == text ? 'not-an-issue' : 'accepted'
      states[TIRIN] = 'excluded'
      return [updated, states]
    end
    if english == "Tirin's Rest: Village Charter"
      label = "티린의 안식처: 마을 헌장(Tirin's Rest: Village Charter)"
      updated = text.sub(/#{TIRIN_PATTERN}:\s*마을 헌장(?:\s*\(Tirin's Rest: Village Charter\))?/, label)
      raise 'missing complete charter title' unless updated == label
      states[CHARTER] = updated == text ? 'not-an-issue' : 'accepted'
      states[TIRIN] = 'excluded'
      return [updated, states]
    end
    if english == "Tirin's Rest Militia"
      label = "티린의 안식처 민병대(Tirin's Rest Militia)"
      updated = text.sub(/#{TIRIN_PATTERN}\s+민병대(?:\s*\(Tirin's Rest Militia\))?/, label)
      raise 'missing complete militia label' unless updated == label
      states[MILITIA] = updated == text ? 'not-an-issue' : 'accepted'
      states[TIRIN] = 'excluded'
      return [updated, states]
    end
    if english.match?(/\bMel Aglir\b/i)
      updated = text.gsub(/#{MEL_PATTERN}/, MEL_LABEL)
      raise "missing Mel Aglir #{key.inspect}" unless updated.include?(MEL_LABEL)
      states[MEL] = updated == text ? 'not-an-issue' : 'accepted'
      text = updated
    end
    if english.match?(/\bTirin's Rest\b/i)
      updated = text.gsub(/#{TIRIN_PATTERN}/, TIRIN_LABEL)
      raise "missing Tirin's Rest #{key.inspect}" unless updated.include?(TIRIN_LABEL)
      states[TIRIN] = updated == text ? 'not-an-issue' : 'accepted'
      text = updated
    end
    [text, states]
  end

  def run(mode)
    inventory = M.refresh_inventory
    defs = definitions
    generated = build_occurrences(inventory.values, defs).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    grouped = generated.group_by { |row| M.key(row) }
    raise "village source scope changed #{grouped.length}" unless grouped.length == 155
    reviews = grouped.map do |key, matches|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      updated, states = transform(old, english, key)
      entities = matches.map { |row| row.fetch('entity_key') }
      raise "unreviewed village compound #{key.inspect}" unless states.keys.sort == entities.sort
      status = updated == old ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entities.join('|'), 'status' => status,
        'old' => old, 'new' => updated,
        'evidence' => 'English identifies the village or exact standalone work/group/NPC label; aligned Japanese and Chinese corroborate identity. Retain established 멜 아글리르, normalize 틸린/티린 and 쉼터/안식처 to 티린의 안식처, and pair full names. The Hymnal, Village Charter, Militia and Citizen labels are complete atomic compounds; exclude their component-only village matches. Ordinary descriptions of a hymnal/charter from the village retain place-name pairing without inventing a full document title. Preserve surrounding Korean, particles, formatting and game markers.',
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(states),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
    definition_path = File.join(__dir__, 'proper-name-discovery-definitions-D21012.tsv')
    review_path = File.join(__dir__, 'proper-name-discovery-D21012.tsv')
    M.write_table(definition_path, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, defs)
    M.write_table(review_path, M::HEADERS, reviews)
    puts "Mel Aglir / Tirin's Rest: #{reviews.length} rows / #{generated.length} entity matches; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
    if mode == 'apply'
      ReviewedProperNameDiscovery.run([definition_path, review_path, '21012'])
    elsif mode != 'prepare'
      abort 'usage: review-mel-aglir-tirins-rest-D21012.rb [prepare|apply]'
    end
  end
end

MelAglirTirinsRestD21012.run(ARGV.fetch(0, 'prepare')) if $PROGRAM_NAME == __FILE__
