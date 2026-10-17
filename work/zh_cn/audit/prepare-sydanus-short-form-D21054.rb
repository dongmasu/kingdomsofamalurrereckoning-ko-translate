#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'

module SydanusShortFormD21054
  M = ReviewedNameBatches
  ENTITY = 'person:ciara-sydanus'
  IDS = %w[
    10039 11824 12813 22343 23076 23842 33254 37298 38100 40140
    41311 43379 50308 52467 56218 56352 56542 61989 8046
  ].freeze
  EDITS = {
    '10039' => '위험하긴 해. 하지만 시다누스(Sydanus)는 이 감옥을 역이용하고 있어. 감옥은 그녀를 가두는 동시에 우리로부터 보호해 주지.',
    '33254' => "시다누스의 힘(Sydanus' Power)",
    '37298' => '시다누스(Sydanus)가 의도한 대로 열쇠를 사용하겠다. 그녀를 풀어 주고, 내가 죽이겠어.',
    '38100' => '의식의 마법이 감옥 깊은 곳에 묻혀 있던 시다누스(Sydanus)를 실제로 찾아내리라고는 누구도 예상하지 못했다.',
    '40140' => '요즘 살아 있는 사람 중 이걸 만들 수 있는 자는 없을 거야. 시다누스(Sydanus)가 죽으면 그 비법도 사라질 테니 아쉽기까지 하군.',
    '41311' => '시다누스(Sydanus)와 그녀의 어둠의 천상계가 세상에 풀어놓은 공포를 수십 년 동안 연구해 왔소. 그대는 그녀를 처치해 우리 모두를 구했소.',
    '43379' => '돌 하나하나는 원소 마법이 물리적 형태를 띤 것이다. 시다누스(Sydanus)는 입문 시험에 참여한 이들에게 빙의해 각자를 서로 다른 장소로 이끌었다...',
    '50308' => '폭풍의 돌을 마루스 토릭스(Marus Torix)의 조각상에 놓았다. 시다누스(Sydanus)를 풀어 주려면 열쇠 두 개를 더 놓아야 한다. 대현자의 계획을 이어 가려면 엘로단 블러드굿(Elodan Bloodgood)의 조각상에 서리의 돌을 놓아야겠다.'
  }.freeze
  EXCLUDED_IDS = %w[12813].freeze
  TRIAGE = File.join(M::AUDIT, 'proper-name-discovery-scout-D21054.tsv')
  REVIEWS = '/private/tmp/proper-name-reviewed-sydanus-D21054.tsv'

  module_function

  def evidence(status, id)
    if status == 'excluded'
      'D-21054 row-scoped short form: Sydanus occurs as part of the complete named title Rage of Sydanus, not as a standalone personal-name label. The existing Korean title already pairs the full English title; exclude this key from person-name normalization.'
    elsif status == 'accepted'
      'D-21054 row-scoped short form: English uses Sydanus without Ciara in this exact row. The aligned Japanese and Chinese identify the same Dark Empyrean antagonist; the established full-name entity is Ciara Sydanus. Pair only this row-local Korean name/title span and do not register Sydanus as a global alias.'
    else
      'D-21054 row-scoped short form: English uses Sydanus without Ciara in this exact row. The aligned Japanese and Chinese identify the same Dark Empyrean antagonist; the established full-name entity is Ciara Sydanus. The current Korean already pairs the source name or complete compound title; retain it and do not register Sydanus as a global alias.'
    end
  end

  def run
    batch_paths = [
      File.join(M::AUDIT, 'named-scope-review-D21054-20261015.md'),
      File.join(M::AUDIT, 'named-scope-edit-addendum-D21054-20261015.md'),
      File.join(M::AUDIT, 'proper-name-edits-D21054.tsv'),
      '/private/tmp/ko-translate-backups/20261015/before-proper-name-D21054'
    ]
    raise 'D-21054 artifacts already exist' if batch_paths.any? { |path| File.exist?(path) }
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
    raise 'missing confirmed Ciara Sydanus glossary entity' unless
      glossary.any? { |row| row['entity_key'] == ENTITY && row['status'] == 'confirmed' }

    rows = IDS.map do |id|
      key = ['default', id, '']
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text').to_s
      raise "English candidate mismatch at #{key.inspect}" unless
        english.match?(/(?<![A-Za-z])Sydanus(?![A-Za-z])/i)
      raise "missing aligned Japanese/Chinese evidence at #{key.inspect}" if
        japanese.empty? || chinese.empty?
      raise "existing Ciara Sydanus disposition at #{key.inspect}" if
        index.any? { |row| row['entity_key'] == ENTITY && M.key(row) == key }

      old = source.fetch('work_text')
      if EDITS.key?(id)
        expected_new = EDITS.fetch(id)
        raise "stale Korean source at #{key.inspect}" unless old == expected_old(id)
        status = 'accepted'
        new_text = expected_new
      elsif EXCLUDED_IDS.include?(id)
        status = 'excluded'
        new_text = old
      else
        raise "source already has an edit classification at #{key.inspect}" unless
          old.match?(/\(Sydanus\)|\(Rage of Sydanus\)/)
        status = 'not-an-issue'
        new_text = old
      end

      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => evidence(status, id), 'english' => english,
        'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end

    indexed_keys = index.map { |row| [row['entity_key'], *M.key(row)] }.to_set
    new_occurrences = rows.map do |review|
      key = M.key(review)
      raise "duplicate existing row/entity #{key.inspect}" if indexed_keys.include?([ENTITY, *key])

      source = inventory.fetch(key)
      {
        'entity_key' => ENTITY,
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'matched_english' => 'Sydanus [row-scoped short form; referent is Ciara Sydanus]',
        'english_source' => review.fetch('english'),
        'korean_current' => review.fetch('old'),
        'status' => 'needs-context',
        'evidence' => "D-21054 candidate: verify row-scoped Sydanus reference; source inventory key #{key.join(':')}."
      }
    end
    sort_key = lambda do |row|
      [row['resource'], row['ID_Linha'].to_i, row['Tipo_Variante'].to_s, row['entity_key']]
    end
    merged_index = (index.map(&:to_h) + new_occurrences).sort_by(&sort_key)
    M.write_table(M::INDEX, index.headers, merged_index)
    M.write_table(REVIEWS, M::HEADERS, rows)

    scout_headers = %w[
      english_candidate source_rows already_indexed_rows newly_reviewed_rows
      accepted not_an_issue excluded disposition evidence_ids evidence
    ]
    scout_row = {
      'english_candidate' => 'Sydanus',
      'source_rows' => '49',
      'already_indexed_rows' => '30',
      'newly_reviewed_rows' => rows.length.to_s,
      'accepted' => rows.count { |row| row['status'] == 'accepted' }.to_s,
      'not_an_issue' => rows.count { |row| row['status'] == 'not-an-issue' }.to_s,
      'excluded' => rows.count { |row| row['status'] == 'excluded' }.to_s,
      'disposition' => 'Confirmed row-scoped references to person:ciara-sydanus; no global Sydanus alias.',
      'evidence_ids' => IDS.map { |id| "default:#{id}" }.join('|'),
      'evidence' => 'English, Japanese, and Chinese align on the Dark Empyrean antagonist in the reviewed contexts. The complete title Rage of Sydanus remains atomic and excluded from personal-name normalization.'
    }
    CSV.open(TRIAGE, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << scout_headers
      csv << scout_headers.map { |header| scout_row.fetch(header) }
    end
    puts "Prepared D-21054: #{rows.length} keys; #{rows.count { |row| row['status'] == 'accepted' }} accepted, #{rows.count { |row| row['status'] == 'not-an-issue' }} not-an-issue, #{rows.count { |row| row['status'] == 'excluded' }} excluded."
    puts "Review input: #{REVIEWS}"
    puts "Candidate triage: #{TRIAGE}"
  end

  def expected_old(id)
    {
      '10039' => '위험하긴 해. 하지만 시다누스는 이 감옥을 역이용하고 있어. 감옥은 그녀를 가두는 동시에 우리로부터 보호해 주지.',
      '33254' => '시다누스의 힘',
      '37298' => '시다누스가 의도한 대로 열쇠를 사용하겠다. 그녀를 풀어 주고, 내가 죽이겠어.',
      '38100' => '의식의 마법이 감옥 깊은 곳에 묻혀 있던 시다누스를 실제로 찾아내리라고는 누구도 예상하지 못했다.',
      '40140' => '요즘 살아 있는 사람 중 이걸 만들 수 있는 자는 없을 거야. 시다누스가 죽으면 그 비법도 사라질 테니 아쉽기까지 하군.',
      '41311' => '시다누스와 그녀의 어둠의 천상계가 세상에 풀어놓은 공포를 수십 년 동안 연구해 왔소. 그대는 그녀를 처치해 우리 모두를 구했소.',
      '43379' => '돌 하나하나는 원소 마법이 물리적 형태를 띤 것이다. 시다누스는 입문 시험에 참여한 이들에게 빙의해 각자를 서로 다른 장소로 이끌었다...',
      '50308' => '폭풍의 돌을 마루스 토릭스의 조각상에 놓았다. 시다누스를 풀어 주려면 열쇠 두 개를 더 놓아야 한다. 대현자의 계획을 이어 가려면 엘로단 블러드굿의 조각상에 서리의 돌을 놓아야겠다.'
    }.fetch(id)
  end
end

SydanusShortFormD21054.run if $PROGRAM_NAME == __FILE__
