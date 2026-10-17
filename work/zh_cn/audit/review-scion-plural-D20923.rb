#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module ReviewScionPluralD20923
  extend self

  M = ReviewedNameBatches
  OUTPUT = File.join(__dir__, 'proper-name-edits-D20923.tsv')
  ENTITY = 'title:scion'
  EXPECTED = {
    '25013' => [
      '갤로우스 엔드(Gallows End)의 모든 사이온이 착용하는 고대 부적이다. 고대 에라시(Erathi) 룬이 새겨져 있으며 아카라의 축복을 받았다고 한다.',
      '갤로우스 엔드(Gallows End)의 모든 사이온(Scion)이 착용하는 고대 부적이다. 고대 에라시(Erathi) 룬이 새겨져 있으며 아카라의 축복을 받았다고 한다.'
    ],
    '25348' => [
      '이 부적을 그녀에게 전해. 필요할 거야. 사이온은 모두 의식 때 이걸 착용해.',
      '이 부적을 그녀에게 전해. 필요할 거야. 사이온(Scion)은 모두 의식 때 이걸 착용해.'
    ],
    '52422' => [
      '몰랐어. 내가 어떻게 알았겠어? 사이온들은 모두 멀어지니까.',
      '몰랐어. 내가 어떻게 알았겠어? 사이온(Scion)들은 모두 멀어지니까.'
    ],
    '53845' => [
      '그녀가 이상하게 행동하기 시작한 걸 알아챘어. 음식을 거부하고 혼잣말을 했지. 대부분의 후계자(Scion)는 가끔... 이해하기 어려운 순간을 겪지만, 이번엔 달랐어.',
      '그녀가 이상하게 행동하기 시작한 걸 알아챘어. 음식을 거부하고 혼잣말을 했지. 대부분의 사이온(Scion)은 가끔... 이해하기 어려운 순간을 겪지만, 이번엔 달랐어.'
    ],
    '8415' => [
      '모든 사이온(Scion)이 아카라(Akara)의 형언할 수 없는 축복을 마주할 준비를 하는 폐허야. 선택받은 이들 중에도 그 강렬함을 견디지 못한 자가 많았어.',
      '모든 사이온(Scion)이 아카라(Akara)의 형언할 수 없는 축복을 마주할 준비를 하는 폐허야. 선택받은 이들 중에도 그 강렬함을 견디지 못한 자가 많았어.'
    ],
    '9675' => [
      '모든 사이온처럼 그녀도 평범한 여자, 우리와 같은 사람이었어. 이름이 선택되어 아카라에게 바쳐지기 전까지는.',
      '모든 사이온(Scion)처럼 그녀도 평범한 여자, 우리와 같은 사람이었어. 이름이 선택되어 아카라에게 바쳐지기 전까지는.'
    ]
  }.freeze

  def run
    inventory = M.refresh_inventory
    rows = inventory.values.select do |row|
      row['resource'] == 'default' && EXPECTED.key?(row['ID_Linha'])
    end
    raise "expected six source rows, got #{rows.length}" unless rows.length == EXPECTED.length

    reviews = rows.sort_by { |row| row.fetch('ID_Linha').to_i }.map do |source|
      id = source.fetch('ID_Linha')
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      old, new_text = EXPECTED.fetch(id)
      raise "stale Korean text at default:#{id}" unless source.fetch('work_text') == old
      raise "missing Scions source at default:#{id}" unless english.match?(/\bScions\b/)
      raise "missing Japanese title rendering at default:#{id}" unless japanese.include?('サイオン')

      context =
        case id
        when '8415'
          'All Scions prepare to face Akara’s blessing at the ruin; current Korean already uses the canonical bilingual title.'
        when '9675'
          'Like all Scions, the named woman was ordinary until selected and offered to Akara; make the office title bilingual.'
        when '25013'
          'The English says every Gallows End Scion wears the amulet; Japanese identifies the same group as サイオン and Korean already names Gallows End and Erathi.'
        when '25348'
          'English says all Scions wear the amulet during the ceremony; Japanese サイオン confirms the officeholders, not generic descendants.'
        when '52422'
          'The speaker generalizes about all Scions becoming distant; Japanese サイオン confirms the formal office plural.'
        when '53845'
          'Most Scions experience moments of opacity; Japanese サイオン and Chinese 赛恩 identify officeholders, so replace generic 후계자 with the canonical title.'
        end
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => 'default',
        'ID_Linha' => id,
        'Tipo_Variante' => source['Tipo_Variante'].to_s,
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => "#{context} `Scions` is the regular plural of the religious office `Scion`; standardize as 사이온(Scion). Earlier unrelated row-level dispositions are preserved and not recounted.",
        'english' => english,
        'japanese' => japanese,
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end

    headers = M::HEADERS
    M.write_table(OUTPUT, headers, reviews)
    puts "Wrote #{reviews.length} reviewed Scions rows to #{OUTPUT}"
    puts reviews.group_by { |row| row.fetch('status') }.transform_values(&:length).inspect
    puts "Accepted edits: #{reviews.count { |row| row['status'] == 'accepted' }}"
  end
end

ReviewScionPluralD20923.run if $PROGRAM_NAME == __FILE__
