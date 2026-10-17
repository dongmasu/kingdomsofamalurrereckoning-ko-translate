#!/usr/bin/env ruby

require 'csv'
require 'json'

module PersonAFContinuation
  ROOT = File.expand_path('../../..', __dir__)
  AUDIT = File.join(ROOT, 'work/zh_cn/audit')
  INDEX = File.join(AUDIT, 'proper-name-occurrences.tsv')
  GLOSSARY = File.join(AUDIT, 'proper-name-glossary.tsv')
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  OUTPUT = File.join(AUDIT, 'proper-name-reviewed-A-F-continuation.tsv')
  PRIOR_D_L = File.join(AUDIT, 'proper-name-proposals-D-L-D20396.tsv')
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze
  EXCLUDED = %w[person:anokatos person:anru person:anwon].freeze
  EXTRA_REVIEWED = {
    ['default', '55520', ''] => [
      'person:daltan', 'accepted',
      '달탄 이임스(Daltan Eames)',
      'English identifies Daltan Eames in the duel; Japanese ダルタン・イームス and Chinese 达尔坦·埃美斯 corroborate the full name. Corrected the surname spelling and retained one complete bilingual name.'
    ]
  }.freeze
  MANUAL_GROUPS = {
    ['base', '553', '11'] => [
      'person:arawyn', 'excluded', nil,
      'The aligned label is “Arawyn Trade Writ,” a named trade document rather than a personal-name mention; Japanese and Chinese likewise identify a trade record.'
    ],
    ['base', '4016', '11'] => [
      'person:arba', 'excluded', nil,
      'English, Japanese アーバの息吹, and Chinese 阿尔巴之息 identify the named item “Breath of Arba,” not a mention of the sorcerer.'
    ],
    ['default', '7279', ''] => [
      'person:anwyr', 'not-an-issue', nil,
      'The full name Anwyr Hedef is already paired once with 안위르 헤데프; Japanese アンウィル・ヘデフ and Chinese 安维尔·赫德夫 corroborate it.'
    ],
    ['default', '50510', ''] => [
      'person:anwyr', 'not-an-issue', nil,
      'Standalone Anwyr is already 안위르(Anwyr); English, Japanese, and Chinese all show the same name.'
    ],
    ['default', '57001', ''] => [
      'person:anwyr', 'not-an-issue', nil,
      'The full name Anwyr Hedef is already paired once with 안위르 헤데프; Japanese アンウィル・ヘデフ and Chinese 安维尔·赫德夫 corroborate it.'
    ],
    ['default', '8096', ''] => [
      'person:arawyn', 'accepted',
      '오래 묵은 메이브린 와인(Maybryn Wine) 덕분에 카라스타 아라윈(Carasta Arawyn)을 대신해 상인 그왈흐마이(Gwalchmai)와 아주 좋은 거래를 성사시켰다. 카라스타 아라윈(Carasta Arawyn)은 그 일로 내게 후하게 보상했다.',
      'English, Japanese キャラスタ・アラウィン, and Chinese 卡拉斯塔·阿拉文 identify Carasta Arawyn; annotate the second full-name mention without nesting.'
    ],
    ['default', '19076', ''] => [
      'person:arawyn', 'accepted',
      '라시르 프라이데리에 있는 상인 그왈크마이와 거래를 성사시키도록 카라스타 아라윈(Carasta Arawyn)을 돕기로 했다. 이 메이브린 와인을 건네면 그가 마시고 더 후하게 굴 것이다. 다른 메이브린 와인도 찾으면 가져다주라고 카라스타가 말했다.',
      'English, Japanese キャラスタ・アラウィン, and Chinese 卡拉斯塔·阿拉文 identify the unannotated full-name mention.'
    ],
    ['default', '25618', ''] => [
      'person:arawyn', 'accepted', '카라스타 아라윈(Carasta Arawyn)',
      'The standalone label denotes Carasta Arawyn; Japanese キャラスタ・アラウィン and Chinese 卡拉斯塔·阿拉文 corroborate the full name.'
    ],
    ['default', '27324', ''] => [
      'person:arawyn', 'not-an-issue', nil,
      'Carasta Arawyn is already paired with the full English name; Japanese キャラスタ・アラウィン and Chinese 卡拉斯塔·阿拉文 agree.'
    ],
    ['default', '28871', ''] => [
      'person:arawyn', 'not-an-issue', nil,
      'Carasta Arawyn is already paired with the full English name; Japanese キャラスタ・アラウィン and Chinese 卡拉斯塔·阿拉文 agree.'
    ],
    ['default', '31084', ''] => [
      'person:arawyn', 'accepted', '카라스타 아라윈(Carasta Arawyn)',
      'The standalone label denotes Carasta Arawyn; Japanese キャラスタ・アラウィン and Chinese 卡拉斯塔·阿拉文 corroborate the full name.'
    ],
    ['default', '41999', ''] => [
      'person:arawyn', 'accepted',
      '카라스타 아라윈(Carasta Arawyn)과 갈렌 그왈흐마이 사이에 맺은 거래 계약. 최종 수치와 서명까지 기입되어 있다.',
      'The trade agreement names Carasta Arawyn; Japanese キャラスタ・アラウィン and Chinese 卡拉斯塔·阿拉文 corroborate the full name.'
    ],
    ['default', '42836', ''] => [
      'person:arawyn', 'accepted',
      '오래 묵은 메이브린 와인의 도움으로 카라스타 아라윈(Carasta Arawyn)을 대신해 상인 그왈흐마이와 거래를 맺었다. 약속대로 금화를 보상으로 받았다.',
      'English, Japanese キャラスタ・アラウィン, and Chinese 卡拉斯塔·阿拉文 identify the unannotated full-name mention.'
    ],
    ['default', '49885', ''] => [
      'person:arawyn', 'not-an-issue', nil,
      'Standalone Arawyn is already paired with 아라윈; the aligned Japanese and Chinese fields retain the same proper-name label.'
    ],
    ['default', '52349', ''] => [
      'person:arawyn', 'not-an-issue', nil,
      'Carasta Arawyn is already paired with the full English name; Japanese キャラスタ・アラウィン and Chinese 卡拉斯塔·阿拉文 agree.'
    ],
    ['default', '58434', ''] => [
      'person:arawyn', 'accepted',
      '카라스타 아라윈(Carasta Arawyn)과 갈렌 그월흐마이 사이에 체결할 무역 계약서다. 최종 금액과 서명란은 아직 비어 있어.',
      'The trade document names Carasta Arawyn; Japanese キャラスタ・アラウィン and Chinese 卡拉斯塔·阿拉文 corroborate the full name.'
    ],
    ['default', '58806', ''] => [
      'person:arawyn', 'accepted',
      '브래드와 세르그렌 상회\\n\\n라시어의 카라스타 아라윈(Carasta Arawyn)\\n\\n라시어산 탤로우 왁스 800통에 관한 계약을 취소한다. 사전 협상을 했음에도 금화로 합의할 만한 가격에 이르지 못했다. 제공된 핵시 목재도 구매자 마음에 들지 않았으므로, 본 거래는 무효로 한다.',
      'The letter heading identifies Carasta Arawyn; Japanese キャラスタ・アラウィン and Chinese 卡拉斯塔·阿拉文 corroborate the full name.'
    ],
    ['default', '2849', ''] => [
      'person:arba', 'excluded', nil,
      'The occurrence is only in the named item Breath of Arba; Japanese and Chinese likewise name the item, not the mage.'
    ],
    ['default', '2892', ''] => [
      'person:arba', 'not-an-issue', nil,
      'The Dokkalfar mage is explicitly named and already rendered 아르바(Arba); Japanese アーバ and Chinese 阿尔巴 corroborate.'
    ],
    ['default', '10455', ''] => [
      'person:arba', 'excluded', nil,
      'The occurrence is only in the named item Breath of Arba; Japanese and Chinese likewise name the item, not the mage.'
    ],
    ['default', '14679', ''] => [
      'person:arba', 'accepted',
      '아르바(Arba)의 업적을 여러 달 연구해 왔어. 지금 살아 있는 사람 중 그의 무기를 제대로 다룰 수 있는 건 나뿐이야.',
      'The English sentence refers to the historical sorcerer Arba and his weapon; Japanese アーバ and Chinese 阿尔巴 corroborate the name.'
    ],
    ['default', '17782', ''] => [
      'person:arba', 'excluded', nil,
      'The name occurs only inside the named item Breath of Arba; Japanese and Chinese likewise identify the item.'
    ],
    ['default', '20287', ''] => [
      'person:arba', 'excluded', nil,
      'The source refers only to obtaining the named item Breath of Arba; Japanese and Chinese likewise identify the item.'
    ],
    ['default', '21369', ''] => [
      'person:arba', 'excluded', nil,
      'The source refers only to the named staff/item Breath of Arba; Japanese and Chinese likewise identify the item.'
    ],
    ['default', '21585', ''] => [
      'person:arba', 'not-an-issue', nil,
      'The Dokkalfar mage is explicitly named and already rendered 아르바(Arba); Japanese アーバ and Chinese 阿尔巴 corroborate.'
    ],
    ['default', '33403', ''] => [
      'person:arba', 'excluded', nil,
      'Both source mentions refer to the named staff/item Breath of Arba, not to the mage as a person.'
    ],
    ['default', '36264', ''] => [
      'person:arba', 'excluded', nil,
      'The source refers only to the named item Breath of Arba; Japanese and Chinese likewise identify the item.'
    ],
    ['default', '39363', ''] => [
      'person:arba', 'excluded', nil,
      'The question asks about the named item Breath of Arba; Japanese and Chinese likewise identify the item.'
    ],
    ['default', '48555', ''] => [
      'person:arba', 'not-an-issue', nil,
      'Standalone Arba is already paired with 아르바; Japanese アーバ and Chinese 阿尔巴 corroborate.'
    ],
    ['default', '58270', ''] => [
      'person:arba', 'accepted',
      '아넬라는 위대한 도크알브(Dokkalfar) 마법사 아르바(Arba)의 비밀 은신처인 이 동굴을 준비하는 데 몇 달을 쏟았다. 강력한 지팡이가 보관된 곳이기도 하다. 아넬라는 지팡이를 차지하고 싶어 하지만, 지팡이를 지키는 투아사 경비병을 막으려면 내 도움이 필요하다.',
      'The full source calls Arba a great Dokkalfar sorcerer; Japanese アーバ and Chinese 阿尔巴 corroborate the personal name.'
    ],
    ['default', '60211', ''] => [
      'person:arba', 'excluded', nil,
      'The occurrence is only in the named item Breath of Arba; Japanese and Chinese likewise identify the item.'
    ],
    ['default', '62065', ''] => [
      'person:arba', 'not-an-issue', nil,
      'The historical sorcerer Arba is already rendered 아르바(Arba); Japanese アーバ and Chinese 阿尔巴 corroborate.'
    ],
    ['default', '63230', ''] => [
      'person:arba', 'accepted',
      '아무 소환사나 말하는 게 아니야. 아르바(Arba) 이후 최고의 소환사라는 거지.',
      'The comparison names the historical sorcerer Arba; Japanese アーバ and Chinese 阿尔巴 corroborate.'
    ],
    ['default', '2746', ''] => [
      'person:finna', 'not-an-issue', nil,
      'Finna is already paired with 핀나; Japanese フィンナ and Chinese 芬那 corroborate.'
    ],
    ['default', '4230', ''] => [
      'person:arbos|person:finna', 'accepted',
      '도적 쌍둥이 핀나(Finna)와 아르보스(Arbos)에게 셀키의 장막(Selkie Veil)을 넘길 순 없어. 그걸 지키려면 쌍둥이와 죽을 때까지 싸워야 해.',
      'English, Japanese フィンナとアルボス, and Chinese 芬那和阿波斯 identify both bandit twins. Corrected 피나 to glossary 핀나 and retained both separate bilingual names.'
    ],
    ['default', '7579', ''] => [
      'person:arbos|person:finna', 'not-an-issue', nil,
      'Both twins are individually paired with their canonical names; Japanese アルボスとフィンナ and Chinese 阿波斯和芬那 agree.'
    ],
    ['default', '12927', ''] => [
      'person:arbos|person:finna', 'not-an-issue', nil,
      'Both twins are individually paired with their canonical names; Japanese フィンナとアルボス and Chinese 芬那和阿波斯 agree.'
    ],
    ['default', '15323', ''] => [
      'person:arbos|person:finna', 'accepted',
      '핀나(Finna)와 아르보스(Arbos)는 누구지?',
      'English asks about both named twins; Japanese フィンナとアルボス and Chinese 芬那和阿波斯 corroborate both names.'
    ],
    ['default', '25093', ''] => [
      'person:arbos|person:finna', 'accepted',
      '핀나(Finna)와 아르보스(Arbos)',
      'The source names the pair Finna and Arbos; Japanese フィンナとアルボス and Chinese 芬那和阿波斯 support separate glossary pairings.'
    ],
    ['default', '27889', ''] => [
      'person:arbos', 'not-an-issue', nil,
      'Standalone Arbos is already paired with 아르보스; Japanese アルボス and Chinese 阿波斯 corroborate.'
    ],
    ['default', '29241', ''] => [
      'person:arbos|person:finna', 'not-an-issue', nil,
      'Both twins are individually paired with their canonical names; Japanese フィンナとアルボス and Chinese 芬那和阿波斯 agree.'
    ],
    ['default', '37357', ''] => [
      'person:arbos|person:finna', 'accepted',
      '셀키의 베일을 되찾았으니, 이건(Egan)과 함께 페이 친구들에게 가져다줘야 한다. 핀나(Finna)와 아르보스(Arbos)라는 이들이 고어하트 마을 북쪽에 야영지를 꾸리고 있다.',
      'English explicitly names both Fae friends; Japanese フィンナとアルボス and Chinese 芬那和阿波斯 corroborate. Added separate annotations before the Korean naming clause.'
    ],
    ['default', '36776', ''] => [
      'person:finna', 'not-an-issue', nil,
      'Standalone Finna is already paired with 핀나; Japanese フィンナ and Chinese 芬那 corroborate.'
    ],
    ['default', '37316', ''] => [
      'person:finna', 'accepted',
      '그것은 셀키의 장막이라 불리며, 착용자가 원하는 모습으로 변신할 수 있는 힘이 있다고 한다. 핀나(Finna)의 말로는 페이의 물건인데 도둑맞았다고 해.',
      'The clause attributes the statement to Finna; Japanese フィンナ and Chinese 芬那 identify the same person.'
    ],
    ['default', '44151', ''] => [
      'person:finna', 'not-an-issue', nil,
      'Standalone Finna is already paired with 핀나; Japanese フィンナ and Chinese 芬那 corroborate.'
    ],
    ['default', '46506', ''] => [
      'person:arbos', 'accepted',
      '우린 베일을 가지러 왔고, 반드시 손에 넣을 거야. 아르보스(Arbos), 자, 협상하지.',
      'Direct address names Arbos; Japanese アルボス and Chinese 阿波斯 corroborate.'
    ],
    ['default', '54283', ''] => [
      'person:arbos|person:finna', 'not-an-issue', nil,
      'Both twins are individually paired with their canonical names; Japanese フィンナとアルボス and Chinese 芬那と阿波斯 agree.'
    ],
    ['default', '58646', ''] => [
      'person:arbos', 'not-an-issue', nil,
      'Standalone Arbos is already paired with 아르보스; Japanese and Chinese retain the same proper name.'
    ],
    ['default', '58911', ''] => [
      'person:arbos|person:finna', 'accepted',
      '핀나(Finna)와 아르보스(Arbos)',
      'The source names both twins; Japanese フィンナとアルボス and Chinese 芬那和阿波斯 support separate glossary pairings.'
    ],
    ['default', '59336', ''] => [
      'person:arbos|person:finna', 'accepted',
      '그들의 이름은 핀나(Finna)와 아르보스(Arbos)야. 비밀을 나누고 진정한 마법을 선물하겠다고 맹세했어.',
      'English explicitly names both twins; Japanese フィンナとアルボス and Chinese 芬那和阿波斯 corroborate.'
    ],
    ['default', '59782', ''] => [
      'person:arbos|person:finna', 'accepted',
      '디뉴엘 신부와 다른 이들은 바보야. 그들의 어리석은 선교소는 쇠락해 무너질 거야. 핀나(Finna)와 아르보스(Arbos)가 모든 것을 꿰뚫어 보는 눈으로 이미 보았지.',
      'English names both twins as the seers; Japanese フィンナとアルボス and Chinese 芬那和阿波斯 corroborate.'
    ],
    ['default', '60151', ''] => [
      'person:arbos', 'not-an-issue', nil,
      'Arbos is already paired with 아르보스; Japanese アルボス and Chinese 阿波斯 corroborate.'
    ],
    ['default', '60833', ''] => [
      'person:arbos|person:finna', 'accepted',
      '핀나(Finna)와 아르보스(Arbos)',
      'The source names both twins; Japanese フィンナとアルボス and Chinese 芬那和阿波斯 support separate glossary pairings.'
    ],
    ['default', '62139', ''] => [
      'person:arbos|person:finna', 'not-an-issue', nil,
      'Both twins are individually paired with their canonical names; Japanese フィンナとアルボス and Chinese 芬那和阿波斯 agree.'
    ]
  }.freeze

  module_function

  def read_tsv(path)
    CSV.read(path, headers: true, col_sep: "\t")
  end

  def row_key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def selected?(row)
    key = row.fetch('entity_key')
    return false unless key.start_with?('person:')
    return false if EXCLUDED.include?(key)

    first = key.delete_prefix('person:')[0].to_s.downcase
    ('a'..'f').cover?(first)
  end

  def load_data
    index = read_tsv(INDEX).select do |row|
      row['status'] == 'needs-context' && selected?(row)
    end
    inventory = read_tsv(INVENTORY).to_h { |row| [row_key(row), row.to_h] }
    glossary = read_tsv(GLOSSARY).to_h { |row| [row.fetch('entity_key'), row.to_h] }
    [index, inventory, glossary]
  end

  def excerpt(value, limit)
    value.to_s.gsub(/\r?\n/, ' / ').gsub(/\s+/, ' ').strip[0, limit]
  end

  def inspect_rows(keys, unique, brief, needs_annotation)
    index, inventory, glossary = load_data
    index.select! { |row| keys.empty? || keys.include?(row['entity_key']) }
    seen = {}
    index.each do |row|
      source = inventory.fetch(row_key(row))
      entity = glossary[row['entity_key']]
      canonical = entity ? entity['korean_canonical'].to_s.split('(').first : ''
      annotated = !canonical.empty? &&
                  source['work_text'].to_s.include?("#{canonical}(#{entity['english_canonical']})")
      next if needs_annotation && annotated
      signature = [row['entity_key'], source['en_texts_json'], source['ja_texts_json'],
                   source['zh_text'], source['work_text']]
      next if unique && seen[signature]
      seen[signature] = true
      english = JSON.parse(source['en_texts_json'] || '[]').compact.join(' / ')
      japanese = JSON.parse(source['ja_texts_json'] || '[]').compact.join(' / ')
      fields = [
        row['entity_key'], row['resource'], row['ID_Linha'],
        row['Tipo_Variante'], row['matched_english'], source['work_text'],
        english, japanese, source['zh_text']
      ]
      if brief
        fields[5] = excerpt(fields[5], 180)
        fields[6] = excerpt(fields[6], 180)
        fields[7] = excerpt(fields[7], 120)
        fields[8] = excerpt(fields[8], 120)
      end
      puts fields.join("\t")
    end
  end

  def summary
    index, inventory, = load_data
    grouped = index.group_by { |row| row['entity_key'] }
    grouped.sort.each do |entity, rows|
      unique = rows.map do |row|
        source = inventory.fetch(row_key(row))
        [source['en_texts_json'], source['ja_texts_json'], source['zh_text'],
         source['work_text']]
      end.uniq.length
      puts [entity, rows.length, unique].join("\t")
    end
    puts "TOTAL\t#{index.length}\t#{grouped.values.map { |rows| rows.length }.inject(0, :+)}"
  end

  def write_tsv(path, rows)
    CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << HEADERS.map { |header| row[header] } }
    end
  end

  def seed_prior_daltan_darkvari
    index, inventory, = load_data
    pending = index.select do |row|
      %w[person:daltan person:darkvari].include?(row['entity_key'])
    end
    pending_keys = pending.map do |row|
      [row['entity_key'], *row_key(row)]
    end
    prior = read_tsv(PRIOR_D_L).map(&:to_h).select do |row|
      %w[person:daltan person:darkvari].include?(row['entity_key']) &&
        pending_keys.include?([row['entity_key'], row['resource'], row['ID_Linha'],
                               row['Tipo_Variante'].to_s])
    end

    prior.each do |row|
      source = inventory.fetch(row_key(row))
      english = JSON.parse(source['en_texts_json'] || '[]').compact.join("\n")
      japanese = JSON.parse(source['ja_texts_json'] || '[]').compact.join("\n---\n")
      checks = [
        source['work_text'] == row['old'],
        english == row['english'],
        japanese == row['japanese'],
        source['zh_text'] == row['chinese']
      ]
      raise "stale prior disposition #{row_key(row).inspect}" unless checks.all?
    end

    extras = EXTRA_REVIEWED.map do |key, decision|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      row = {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => decision[0], 'status' => decision[1], 'old' => old,
        'new' => decision[2], 'evidence' => decision[3],
        'english' => JSON.parse(source['en_texts_json'] || '[]').compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json'] || '[]').compact.join("\n---\n"),
        'chinese' => source['zh_text']
      }
      raise "non-accepted extra changes text #{key.inspect}" if
        row['status'] != 'accepted' && row['new'] != row['old']
      row
    end

    grouped = (prior + extras).group_by { |row| row_key(row) }
    raise 'prior same-row transformations conflict' if grouped.any? do |_key, rows|
      rows.map { |row| [row['old'], row['new'], row['status']] }.uniq.length > 1
    end
    rows = grouped.map do |_key, decisions|
      row = decisions.first
      row['entity_key'] = decisions.map { |decision| decision['entity_key'] }.uniq.sort.join('|')
      row
    end
    raise 'duplicate seeded resource/ID/variant row' unless
      rows.map { |row| row_key(row) }.uniq.length == rows.length
    write_tsv(OUTPUT, rows)

    found = prior.map do |row|
      [row['entity_key'], row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s]
    end + extras.map do |row|
      [row['entity_key'], row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s]
    end
    missing = pending_keys - found
    puts "seeded=#{rows.length} reviewed entity-rows=#{found.length} missing=#{missing.length}"
    missing.each { |key| puts "pending-review\t#{key.join(':')}" }
    puts "output=#{OUTPUT}"
  end

  def usage
    abort <<~TEXT
      Usage:
        ruby review-person-A-F-continuation.rb --summary
        ruby review-person-A-F-continuation.rb --inspect [--unique] [--brief] [--needs-annotation] [person:key ...]
        ruby review-person-A-F-continuation.rb --seed-prior
      --inspect prints exact aligned source rows from the refreshed inventory.
    TEXT
  end
end

if $PROGRAM_NAME == __FILE__
  if ARGV.first == '--summary'
    PersonAFContinuation.summary
  elsif ARGV.first == '--seed-prior'
    PersonAFContinuation.seed_prior_daltan_darkvari
  elsif ARGV.first == '--inspect'
    unique = ARGV.delete('--unique')
    brief = ARGV.delete('--brief')
    needs_annotation = ARGV.delete('--needs-annotation')
    PersonAFContinuation.inspect_rows(ARGV.drop(1), unique, brief, needs_annotation)
  else
    PersonAFContinuation.usage
  end
end
