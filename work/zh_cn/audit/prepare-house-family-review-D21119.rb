#!/usr/bin/env ruby

require 'json'
require_relative 'build-proper-name-occurrences'
require_relative 'continue-proper-name-reviewed-batches'

module PrepareHouseFamilyReviewD21119
  extend self

  M = ReviewedNameBatches
  AUDIT = __dir__
  GLOSSARY_PATH = File.join(AUDIT, 'proper-name-glossary.tsv')
  INDEX_PATH = M::INDEX
  REVIEW_PATH = File.join(AUDIT, 'proper-name-discovery-D21119.tsv')
  ALIAS_PATH = File.join(AUDIT, 'proper-name-alias-expansion-D21119.tsv')
  DOCUMENTED_SOURCE_EXCLUSION =
    ['person:phasmer-humm', 'default', '13525', ''].freeze

  ALIASES = {
    'faction:house-ansilla' => [
      'Ansilla family',
      'Ansilla families',
      'Ansillas',
      'heir of Ansilla',
      'Ansilla name',
      'Ansilla and Gastyr',
      'Ansilla was once a mighty name',
      'Houses of Ansilla and Gastyr'
    ],
    'faction:house-gastyr' => [
      'Gastyr family',
      'Gastyr families',
      'Gastyr family line',
      'Gastyr lineage',
      'Gastyrs',
      'We Gastyrs',
      'royal Gastyrs',
      'Gastyr heir',
      'Gastyr name',
      'Ansilla and Gastyr',
      'Houses of Ansilla and Gastyr',
      'Gastyr court',
      'fall of Gastyr',
      'name Gastyr'
    ]
  }.freeze

  ROWS = {
    ['base', '4307'] => {
      entities: %w[faction:house-ansilla],
      probe: 'Ansilla family lock box',
      new: '안실라 가문(House Ansilla)의 자물쇠 상자'
    },
    ['default', '8358'] => {
      entities: %w[faction:house-ansilla faction:house-gastyr],
      probe: 'the Ansillas and the Gastyrs',
      new: '이 비옥한 땅은 한때 위대한 알파르(Alfar) 두 가문, 안실라 가문(House Ansilla)과 가스티르 가문(House Gastyr)의 왕령이었다. 두 혈통은 가장 강력하면서도 서로를 가장 증오하는 적이었지.'
    },
    ['default', '10576'] => {
      entities: %w[faction:house-ansilla],
      probe: 'heir of Ansilla',
      new: '돌아왔구나. 안실라 가문(House Ansilla)의 후계자여, 무슨 일로 왔느냐?'
    },
    ['default', '13816'] => {
      entities: %w[faction:house-ansilla],
      probe: 'Ansilla family lock box',
      new: '이 열쇠는 시워치(Seawatch)에 있는 안실라 가문(House Ansilla)의 요새에서 가족 보관함을 여는 열쇠다.'
    },
    ['default', '16188'] => {
      entities: %w[faction:house-gastyr],
      probe: 'Gastyrs',
      new: '가스티르 가문(House Gastyr)'
    },
    ['default', '18315'] => {
      entities: %w[faction:house-gastyr],
      probe: 'We Gastyrs',
      new: '보상은 꼭 해 주겠네, 친구. 우리 가스티르 가문(House Gastyr)은 친구와 적 모두를 오래 기억하거든...'
    },
    ['default', '20526'] => {
      entities: %w[faction:house-gastyr],
      probe: 'the royal Gastyrs',
      new: '개스티르 대위가 왕족인 가스티르 가문(House Gastyr)과 혈연관계라고 생각하는 건 아니겠지? 그럼 참 우연이겠는걸.'
    },
    ['default', '21190'] => {
      entities: %w[faction:house-ansilla faction:house-gastyr],
      probe: 'Ansilla and Gastyr families',
      new: '할머니는 잠자리에서 안실라 가문(House Ansilla)과 가스티르 가문(House Gastyr)에 관한 이야기를 들려주곤 했어. 하나같이 무서운 이야기였지.'
    },
    ['default', '21810'] => {
      entities: %w[faction:house-gastyr],
      probe: 'Gastyr heir',
      new: '가스티르 가문(House Gastyr)의 후계자가 아직 살아 있고... 군대에 있다는 소문을 들었어. 정말 대단하지 않아?'
    },
    ['default', '28718'] => {
      entities: %w[faction:house-ansilla],
      probe: 'the Ansillas',
      new: '사업가인 내 생각엔 선량한 알파르(Alfar)인 안실라 가문(House Ansilla)은 투자할 만해. 선대 영주는 괜찮은 사람이었고 자식들도 그리 나쁘진 않았거든.'
    },
    ['default', '36056'] => {
      entities: %w[faction:house-ansilla],
      probe: 'The Ansillas saved me',
      new: '안실라 가문(House Ansilla)이 날 구해 줬어. 자기 식구처럼 키워 줬지. 이 땅에서 태어난 건 아니지만, 내게 집이라고 부를 만한 곳은 여기뿐이야.'
    },
    ['default', '36669'] => {
      entities: %w[faction:house-gastyr],
      probe: 'Gastyr court',
      new: '현명하고 타당한 질문이군. 가스티르 가문(House Gastyr)의 궁정 음유시인으로서 케일드 해안(Caeled Coast)의 모든 이야기를 알고 있지. 이 위대한 땅이 어떻게 일어나고 몰락해 지금의 모습이 되었는지도 말이야.'
    },
    ['default', '37333'] => {
      entities: %w[faction:house-gastyr],
      probe: 'fall of Gastyr',
      new: '이야기에 따르면 가스티르 가문(House Gastyr)이 몰락한 뒤 브락시스가 왕실의 재산에 마법을 걸어 숨겼다고 한다. 끈기 있는 모험가만 찾아낼 수 있도록 말이지.'
    },
    ['default', '37510'] => {
      entities: %w[faction:house-gastyr],
      probe: 'Gastyr family',
      new: '물론 가스티르 가문(House Gastyr)은 늘 이 땅이 자기들 것이라고 주장했지. 우리를 내려다보는 성까지 지었어. 우리를 깔보면서 말이야!'
    },
    ['default', '38466'] => {
      entities: %w[faction:house-ansilla],
      probe: 'Ansilla was once a mighty name',
      new: '안실라 가문(House Ansilla)은 한때 이름을 떨친 위대한 명문이었어. 그런 가문은 이제 거의 남지 않았지. 적어도 료스알브(Ljosalfar)와 도크알브(Dokkalfar)가 한 핏줄이던 옛 질서의 가문은 말이야.'
    },
    ['default', '41855'] => {
      entities: %w[faction:house-ansilla],
      probe: 'restore the Ansilla name',
      new: '자네가 내 가문을 되살려 줬어. 이 위대한 유물들이 케일드 해안(Caeled Coast)에서 안실라 가문(House Ansilla)의 이름을 되찾는 데 도움이 될 거야. 보답할 만한 방법을 찾아야겠어.'
    },
    ['default', '43732'] => {
      entities: %w[faction:house-gastyr],
      probe: 'Gastyr family line',
      new: '음유시인 브룬(Brun the Bard)이 가스티르 가문(House Gastyr)의 사생아라는 걸 입증할 증거를 찾도록 도왔다. 이제 그는 누구도 자신의 비밀을 알 리 없다고 안심할 수 있겠지.'
    },
    ['default', '44051'] => {
      entities: %w[faction:house-ansilla faction:house-gastyr],
      probe: 'Houses of Ansilla and Gastyr',
      new: '살아 있는 볼간(Bolgan) 중 가장 오래되고 강력한 자로, 가드플로(Gadflow)의 군대를 이끌고 안실라 가문(House Ansilla)과 가스티르 가문(House Gastyr)을 상대로 승리를 거뒀다.'
    },
    ['default', '46380'] => {
      entities: %w[faction:house-gastyr],
      probe: 'Gastyr lineage',
      new: '브룬(Brun)이 가스티르 가문(House Gastyr)의 마지막 영주 이야기를 들려줬다. 가스티르 성(Castle Gastyr) 아래 세워진 거대한 볼간(Bolgan) 야영지를 파괴하면 다른 이야기도 해 주겠다고 했다.'
    },
    ['default', '48374'] => {
      entities: %w[faction:house-gastyr],
      probe: 'the Gastyrs invaded',
      new: '클라리 안실라(Clary Ansilla) 부인의 영지는 한때 케일드 해안(Caeled Coast)에서 북쪽의 커스우드(Cursewood)까지 뻗어 있었다. 개스티르 가문(House Gastyr)이 침략해 자기들 요새를 세우기 전까지는 말이야.'
    },
    ['default', '48969'] => {
      entities: %w[faction:house-gastyr],
      probe: 'The name Gastyr will mean something again',
      new: '칼과 싸움의 나날은 이제 지나갔어. 너 같은 이들의 도움을 받아 케일드 해안(Caeled Coast)을 재건하겠어. 가스티르 가문(House Gastyr)의 이름을 다시 세우겠어.'
    },
    ['default', '49417'] => {
      entities: %w[faction:house-gastyr],
      probe: 'Gastyr family',
      new: '어슬렁거리지 마세요. 영웅이시라 해도 여긴 가스티르 가문(House Gastyr)이 짓고 소유한 사유 요새입니다.'
    },
    ['default', '52926'] => {
      entities: %w[faction:house-ansilla],
      probe: 'restoring the Ansilla name',
      new: '하늘이시여... 칼날과 인장을 어디서 찾았지? 난 그것들 때문에 돌아왔어. 내게는 태어날 때부터 주어진 권리야. 평생을 안실라 가문(House Ansilla)의 이름을 되살리는 데 바쳤다고.'
    },
    ['default', '54203'] => {
      entities: %w[faction:house-ansilla],
      probe: 'Ansillas',
      new: '안실라 가문(House Ansilla)'
    },
    ['default', '54527'] => {
      entities: %w[faction:house-ansilla],
      probe: 'Ansilla family gems',
      new: '병사 우다 자나라(Uda Janara)가 안실라 가문(House Ansilla)의 보석이 숨겨진 비밀 장소를 나타내는 전설적인 앤실라 인형들을 찾도록 도와줬어.'
    },
    ['default', '54539'] => {
      entities: %w[faction:house-ansilla faction:house-gastyr],
      probe: 'Ansilla and Gastyr?',
      new: "정말? 우리가 어디 있는지 알잖아. 여긴 알파르(Alfar) 영주들의 땅, 케일드 해안(Caeled Coast)이야. 안실라 가문(House Ansilla)과 가스티르 가문(House Gastyr)? 남쪽 빛(Southern Lights)은? 귀부인의 자식들(Lady's Children)은?"
    },
    ['default', '60117'] => {
      entities: %w[faction:house-gastyr],
      probe: 'the Gastyrs',
      new: '읽어 보겠어. 그러면 어머니의 말이 사실이었는지 마침내 알게 되겠지. 그다음엔 없애 버릴 거야. 가스티르 가문(House Gastyr)과는 아무 관계도 맺고 싶지 않아.'
    },
    ['default', '62361'] => {
      entities: %w[faction:house-gastyr],
      probe: 'worthy of the Gastyr name',
      new: '그녀야말로 가스티르 가문(House Gastyr)이라는 이름에 진정으로 걸맞은 유일한 사람일지도 몰라. 모든 면에서 아버지보다 뛰어나지. 힐(Hill)이 기억나. 그 애와 난 안뜰에서 함께 놀곤 했어.'
    },
    ['default', '64791'] => {
      entities: %w[faction:house-ansilla],
      probe: 'heir of Ansilla',
      new: '이 가보들은 내가 안실라 가문(House Ansilla)의 정당한 후계자임을 증명해. 이것들로 우리 가문의 이름과 케일드 해안(Caeled Coast)의 옛 영광을 되찾겠어.'
    }
  }.freeze

  def index_key(row)
    [row.fetch('entity_key'), row.fetch('resource'),
     row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def source_key(resource, id)
    [resource, id, resource == 'base' ? '11' : '']
  end

  def run
    raise 'D-21119 artifacts already exist' if
      [REVIEW_PATH, ALIAS_PATH].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    glossary_table = M.table(GLOSSARY_PATH)
    glossary = glossary_table.map(&:to_h)
    entries = glossary.to_h { |row| [row.fetch('entity_key'), row] }
    raise 'missing registered family entity' unless ALIASES.keys.all? { |key| entries.key?(key) }

    alias_rows = []
    ALIASES.each do |entity, additions|
      entry = entries.fetch(entity)
      current = entry.fetch('english_aliases').to_s.split('|').reject(&:empty?)
      entry['english_aliases'] = (current + additions).uniq.join('|')
      additions.each do |alias_text|
        alias_rows << {
          'entity_key' => entity,
          'english_alias' => alias_text,
          'scope' => 'Verified family-context source phrase; not a personal-name or castle alias.',
          'evidence' => 'D-21119'
        }
      end
    end
    ROWS.each do |(resource, id), spec|
      variant = resource == 'base' ? '11' : ''
      spec.fetch(:entities).each do |entity|
        entry = entries.fetch(entity)
        reference = [resource, id, variant].reject(&:empty?).join(':')
        values = entry.fetch('evidence_ids').to_s.split('|').reject(&:empty?)
        entry['evidence_ids'] = (values + ['D-21119', reference]).uniq.join('|')
      end
    end

    proposed = ROWS.map do |(resource, id), spec|
      source = inventory.fetch(source_key(resource, id))
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      raise "source probe missing at #{resource}:#{id}" unless english.include?(spec.fetch(:probe))
      raise "empty or unchanged proposal at #{resource}:#{id}" if
        source.fetch('work_text') == spec.fetch(:new)
      {
        'resource' => resource,
        'ID_Linha' => id,
        'Tipo_Variante' => resource == 'base' ? '11' : '',
        'entity_key' => spec.fetch(:entities).join('|'),
        'status' => 'accepted',
        'old' => source.fetch('work_text'),
        'new' => spec.fetch(:new),
        'evidence' => 'English identifies the family/lineage reference; aligned Japanese supports the House or family reading and Chinese corroborates it. Applied the registered bilingual House form only to this exact source row.',
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(spec.fetch(:entities).to_h { |key| [key, 'accepted'] })
      }
    end

    raise 'duplicate physical review row' unless
      proposed.map { |row| M.key(row) }.uniq.length == proposed.length

    generated = build_occurrences(inventory.values, glossary).map do |row|
      OCCURRENCE_HEADERS.zip(row).to_h
    end
    excluded_source = generated.find do |row|
      index_key(row) == DOCUMENTED_SOURCE_EXCLUSION
    end
    if excluded_source
      raise 'documented Phasmer title exclusion changed' unless
        excluded_source.fetch('english_source') == "Phasmer's Curse"
      generated.delete(excluded_source)
    end
    generated_by_key = generated.to_h { |row| [index_key(row), row] }
    raise 'duplicate generated occurrence key' unless generated_by_key.length == generated.length

    expected_ids = {
      'faction:house-ansilla' => %w[
        4307 2707 4726 8110 8290 8358 10576 13816 17524 21190 25409
        26015 27546 28718 29187 29702 30819 35294 36056 38466 41855
        44051 45880 48426 52414 52926 54203 54527 54539 61590 61795
        64791
      ],
      'faction:house-gastyr' => %w[
        8358 16188 18315 20526 21190 21810 22808 25951 36669 37333
        37510 37810 43732 44051 46380 48374 48969 49417 54539 58586
        59603 60117 62361
      ]
    }
    expected_ids.each do |entity, ids|
      actual = generated.select { |row| row.fetch('entity_key') == entity }
                        .map { |row| row.fetch('ID_Linha') }
      raise "unexpected alias matches for #{entity}: #{actual.inspect}" unless actual == ids
    end

    active_table = M.table(INDEX_PATH)
    active = active_table.map(&:to_h)
    active_by_key = active.to_h { |row| [index_key(row), row] }
    raise 'duplicate active occurrence key' unless active_by_key.length == active.length

    review_keys = proposed.flat_map do |review|
      review.fetch('entity_key').split('|').map do |entity|
        [entity, review.fetch('resource'), review.fetch('ID_Linha'),
         review.fetch('Tipo_Variante')]
      end
    end
    additions = generated_by_key.keys - active_by_key.keys
    staged = review_keys & active_by_key.keys
    staged.each do |key|
      previous = active_by_key.fetch(key)
      raise "unexpected pre-existing review key #{key.inspect}" unless
        previous.fetch('status') == 'needs-context' &&
        previous.fetch('evidence').start_with?('Candidate hit from the English source;')
    end
    raise "new alias matches differ from exact reviewed scope: #{additions.inspect}" unless
      (additions | staged).sort == review_keys.sort

    merged = generated.map do |candidate|
      previous = active_by_key[index_key(candidate)]
      previous ? candidate.merge(
        'status' => previous.fetch('status'),
        'evidence' => previous.fetch('evidence')
      ) : candidate
    end
    absent = active_by_key.keys - generated_by_key.keys
    absent.each do |key|
      previous = active_by_key.fetch(key)
      current_text = inventory.fetch(
        [previous.fetch('resource'), previous.fetch('ID_Linha'),
         previous['Tipo_Variante'].to_s]
      ).fetch('work_text')
      raise "stale manually scoped occurrence #{key.inspect}" unless
        current_text == previous.fetch('korean_current')
      merged << previous
    end
    merged.sort_by! do |row|
      [row.fetch('resource'), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end

    M.write_table(GLOSSARY_PATH, glossary_table.headers, glossary)
    M.write_table(INDEX_PATH, active_table.headers, merged)
    M.write_table(REVIEW_PATH, M::HEADERS.take(12), proposed)
    M.write_table(ALIAS_PATH, %w[entity_key english_alias scope evidence], alias_rows)
    puts "D-21119 staged #{proposed.length} CSV rows and #{review_keys.length} family/entity keys."
    puts "Occurrence index: #{active.length} -> #{merged.length}; preserved #{absent.length} manually scoped rows."
    puts "New candidates exactly match the reviewed scope; all older dispositions were preserved."
  end
end

PrepareHouseFamilyReviewD21119.run if $PROGRAM_NAME == __FILE__
