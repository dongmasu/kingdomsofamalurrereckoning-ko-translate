#!/usr/bin/env ruby

require 'csv'
require 'digest'
require 'json'

module PersonGMContinuation
  AUDIT_DIR = File.expand_path(__dir__)
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  INDEX = File.join(AUDIT_DIR, 'proper-name-occurrences.tsv')
  GLOSSARY = File.join(AUDIT_DIR, 'proper-name-glossary.tsv')
  OUT = File.join(AUDIT_DIR, 'proper-name-reviewed-G-M-continuation.tsv')
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze

  # Each row is one manually reviewed resource/ID/variant key. Keep same-row
  # decisions combined here with a pipe-joined entity_key and one final string.
  DECISIONS = [
    ['person:galataea', 'base', '1592', '11', 'not-an-issue', nil, 'f3cc9235d3743be087bda9bc52b01e73c9e5a00dd12ffe696b4b23882bebd759'],
    ['person:garrou', 'default', '594', '', 'not-an-issue', nil, '6553b12e4b91938ed9c632dff91ec1b12ffe50d3107a147733c735ab22fd7de6'],
    ['person:garrou', 'default', '4092', '', 'accepted', '엔서 개로우(Enser Garrou)', '8b6df5f6ce41d81b25440899a3040a80d0e842c7e6f8fa3a76ceb93c02f80311'],
    ['person:gelt', 'default', '6811', '', 'not-an-issue', nil, '66ab6200fdb2463b733df786ef83ddadf48a0010d823e2b49f47d31404674870'],
    ['person:gelt', 'default', '8782', '', 'accepted', '겔트 파(Gelt Far)', '0f511a6f3e773198894a72eb0f36c82fe2f021fc62dbac710c2e7f32ce58d185'],
    ['person:gaius', 'default', '9112', '', 'not-an-issue', nil, 'caf983e9aae011a2ec6a9319175823dab924d7d148f784264081f34402dbcb32'],
    ['person:gaius', 'default', '10277', '', 'accepted', '모두 다섯 명이야. 에니온 가이우스(Enion Gaius), 타릭 스미스, 세페드라 윌, 에이드런 티르(Aedran Tyr), 그리고 내 여동생 라그나 센.', '153c4cef812efd4a8130328d53c1cf6eb4e8ea588abd3661afd1922a968717ef'],
    ['person:gelt', 'default', '13174', '', 'not-an-issue', nil, '7a2b32d53b7b7bf315277c3b24356490042ca7437476aefce323a84864824628'],
    ['person:galataea', 'default', '14644', '', 'accepted', '내 갈라테이아(Galataea)를 찾는 일은 어떻게 됐나? 아직 소식은 없나?', 'f779570df0ff5aaec4e3ce5caf1cebdd9ce9d18949861e56ff709810d4c773ad'],
    ['person:gelt', 'default', '15110', '', 'not-an-issue', nil, '0dabe2dca8f7604729aef9b4784fbe81c83ffacc5966e73c90fad6ed0c1ba1da'],
    ['person:gonthorm', 'default', '15301', '', 'accepted', '프로스 곤토름(Fros Gonthorm) 선장', '8c55711683e32b555cd2094232647facf0b137850f9433faf12f43a56ed518fe'],
    ['person:gerald', 'default', '15331', '', 'not-an-issue', nil, '9589802be36d52230a8d3fd5815c839c406e1fa206c65a6741c666256c5c906e'],
    ['person:gelt', 'default', '17616', '', 'not-an-issue', nil, 'b0ffbf8c64a16040dd32b5bc1ebd8619e617f6001a8a79a3cc8a5e2bab8a3f91'],
    ['person:galataea', 'default', '18094', '', 'not-an-issue', nil, '52e9eeb514521fed0e6f60eb7a829376f38c4cd732f13976b44841a66013b75f'],
    ['person:galataea', 'default', '18558', '', 'not-an-issue', nil, 'b8f6facd60fc7f453ffc7b22225005c7b0573f3b9dc3371a8948801fe1fad9a2'],
    ['person:gelt', 'default', '19404', '', 'accepted', '겔트 파(Gelt Far)를 봤어? 에드윈 호스위그와 함께 다니는데. 그러고 보니 둘 다 며칠째 못 봤네.', '6cdf86ae101b1f9a7d6f00623ca344897c0f28749b4c8814b888370cab63177e'],
    ['person:galataea', 'default', '24961', '', 'not-an-issue', nil, 'bf2157074281a9c05a42d95bb2696ec48e1e8ed9b42fee3774bb9926e9aadd4b'],
    ['person:galataea', 'default', '26859', '', 'not-an-issue', nil, 'bf2157074281a9c05a42d95bb2696ec48e1e8ed9b42fee3774bb9926e9aadd4b'],
    ['person:gelt', 'default', '27254', '', 'not-an-issue', nil, '92fe293fade93b8bcd9e5eed34b4f740254e96bdbf515f376f0bd879900ad726'],
    ['person:gonthorm', 'default', '27493', '', 'accepted', '곤토름 선장(Captain Gonthorm)을 찾기', '54f5ace2a2e6e4f225118b1590b63c7d48834e8c79f97c1c5b5effb40945de95'],
    ['person:gonthorm', 'default', '27532', '', 'accepted', '곤토름 선장(Captain Gonthorm)을 찾기', '54f5ace2a2e6e4f225118b1590b63c7d48834e8c79f97c1c5b5effb40945de95'],
    ['person:gonthorm', 'default', '27682', '', 'accepted', '곤토름 선장(Captain Gonthorm)', 'd2e8a3da9693697d323712f3cdcdf6f7b3121be002475e3a2200fb85b21086ac'],
    ['person:galataea', 'default', '28041', '', 'not-an-issue', nil, '9437bacd5544f724ca643f04525d380c9ed42139cb42d2aa5c204bb8888e78ce'],
    ['person:gerald', 'default', '29868', '', 'uncertain', nil, '0df283f38a823b89773a0852a46d04a29eeb5a50a33b7be7e76160a3dae1ef67'],
    ['person:galataea', 'default', '29363', '', 'not-an-issue', nil, 'bf2157074281a9c05a42d95bb2696ec48e1e8ed9b42fee3774bb9926e9aadd4b'],
    ['person:galataea', 'default', '31732', '', 'not-an-issue', nil, 'bf2157074281a9c05a42d95bb2696ec48e1e8ed9b42fee3774bb9926e9aadd4b'],
    ['person:galataea', 'default', '32305', '', 'accepted', '그럼 그녀를 찾았군! 내 갈라테이아(Galataea)야... 아니, 그녀에게서 내게 남은 것이지. 사실... 내 아내는 몇 년 전에 죽었네, 초대받은 자여. 트롤에게 당했지.', '1d874fbfa9fb177981406b4bd86acdb187e513fb540e1d6ea5932a5ac6351a6a'],
    ['person:gaius', 'default', '38289', '', 'not-an-issue', nil, 'd93091d6c05ed4cd2cd3bb536e301efc6df37959fd498a592d250c9402c9a718'],
    ['person:galataea', 'default', '38741', '', 'accepted', '내 아내 갈라테이아(Galataea)를 찾았나?', '1e14542c79d3a6be0ed735f4831a88d7232d9ae000f12df03b8797fd8bfb767b'],
    ['person:galataea', 'default', '39385', '', 'accepted', '갈라테이아(Galataea)라는 콜로사이 여성에게 보내는 편지다.', '68147c0c2f6fa77641b06c9a85c024d7b39c28089c4be1e733d90fd91911961b'],
    ['person:galataea', 'default', '40874', '', 'accepted', '그래... 아주 특별하지. 어떤 의미에선 저 조각상이 내 갈라테이아(Galataea)야... 아니면 그녀에게서 남은 것이라고 해야 하나. 그녀는 워런에서 트롤에게 살해당했어.', 'de277e25261ebb3943180198406a70c8528b91948146e385e8e45a9dbedc0abc'],
    ['person:gonthorm', 'default', '41146', '', 'not-an-issue', nil, '15cc2e6a4f81a21ec6a6ef0b34757f38364be1d3a00787a046516ba3f62875ac'],
    ['person:garrou', 'default', '41182', '', 'not-an-issue', nil, '7445e049ac09d219ed582cd31532459be5d4f356397916997106fb9eac25b906'],
    ['person:gonthorm', 'default', '42319', '', 'accepted', '곤토름 선장(Captain Gonthorm)도 할 수만 있다면 우리를 도와줄 거야.', '2a96963484d058527877caff6f1ed0c59ad1ee51b087f416b49c6ae16da8a15f'],
    ['person:gonthorm', 'default', '42934', '', 'accepted', '파흘랑기의 우두머리 베신 경을 따라 이먼 섬으로 가야 한다. 이 일을 위해 곤토름 선장(Captain Gonthorm)의 배를 빌렸다. 내 지시에 따라 라시르 부두에서 출항할 것이다.', '3d8a182cd3c2056a564a6ec5f43ec449463675876e7bc453cb683d75b5b5690a'],
    ['person:galataea', 'default', '43475', '', 'accepted', '가장 사랑하는 갈라테이아(Galataea)에게', '3601fd264120059eb875359d10261c60612b6044387174e58da73a05065396d5'],
    ['person:gelt', 'default', '46046', '', 'not-an-issue', nil, '45453bae267581a8ddfc8722c0623571b7794b2c0fb7443220e1b5cf97728b32'],
    ['person:gonthorm', 'default', '46323', '', 'accepted', '배를 빌릴 수 있게 되면 출발하자. 부두에서 곤토름 선장(Captain Gonthorm)을 찾아. 빈 배가 있으면 우릴 태워 줄 거야.', '15ff29ca522e8ce6816708ee113e41e57a3dc545dbcec84796441dcc4f525315'],
    ['person:gelt', 'default', '48433', '', 'accepted', '알아냈군. 겔트(Gelt)가 말해 줬나? 상관없어. 그 부적은 저주받았어. 에마이어의 그 늙은 바보는 돌려받고 싶어 하지 않을 거야.', '4adb56569a9dcbbb2454b1bfe6deb3e08b234d0f0a4f58151df56380be295016'],
    ['person:gaius', 'default', '50153', '', 'accepted', '에니온 가이우스(Enion Gaius)', 'f32a403959a5779f152b521b9237c743bc05cc78a11b0fd2f1b48d59ddc138c0'],
    ['person:galataea', 'default', '53252', '', 'not-an-issue', nil, '513d900b1b3d4a2a9eaafe30aa90ad21c262a5b6cd3e4ca79d470d921f68d1b6'],
    ['person:galataea', 'default', '54005', '', 'not-an-issue', nil, 'aa2fb1371688c0790fab355945d266da6554794b2e5b25300191e13da2b213a2'],
    ['person:garrou', 'default', '54146', '', 'accepted', '엔서 개로우(Enser Garrou)', '6b57a71ff2dcab93612275c1b748d550a881488c93ca6e5d0f3d8435a78d9fbb'],
    ['person:gonthorm', 'default', '54309', '', 'accepted', '파흘랑기(Fahrlangi)의 지도자 베신 경(Lord Besin)을 따라 이몬 섬(Eamonn Isle)으로 가야 한다. 그윈 안웨이(Gwyn Anwy)는 우리의 계획을 타인 델프릭(Tine Delfric)에게 알렸다. 다음엔 라시르 부두에서 곤토름 선장(Captain Gonthorm)의 도움을 구해야겠다.', 'f488d8a2ca7e510cb48186958e1eb5fd8019641a276539d8b7010ba78233e58f'],
    ['person:gaius', 'default', '55418', '', 'not-an-issue', nil, '40704810ef7a277e7b5cc67fbc92616bd7e72deab526d241c00e4b8d250c9976'],
    ['person:garrou', 'default', '56593', '', 'accepted', '엔서 개로우(Enser Garrou)', '0ec9bb276b0e88a92aef4be346ab91f0fab81b3565fc1524772d86638b248c6c'],
    ['person:galataea', 'default', '58466', '', 'accepted', '저 조각상은 내 아내 갈라테이아(Galataea)야... 말하자면 그렇다는 거지. 사실 아내는 죽었어. 몇 년 전에 커른(Kurn)이라는 끔찍한 트롤에게 살해당했지.', 'ecfc1937c32706d096d1ddd9d1978fb224691ef50e9289e2d92cba603eeffa32'],
    ['person:gonthorm', 'default', '59380', '', 'accepted', '이 도시에 아는 선장이 있어. 곤토름 선장(Captain Gonthorm)이 아직 고용되지 않았으면 좋겠군.', '047aff10081ac72085246f3a617b72ba339d97cf04f795d4b6b12517f394d04b'],
    ['person:gonthorm', 'default', '59871', '', 'accepted', '프로스 곤토름(Fros Gonthorm)과 대화하기', 'aef086ba1dd983154fddb618ffc53350aef64faac10d436fa4f07863c40d8292'],
    ['person:gaius', 'default', '61480', '', 'not-an-issue', nil, 'ba14c246caaf6dca9c0b79275704149eef16a0ad4f9194a757ebe36ff0234711']
  ].freeze

  module_function

  def row_key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def fingerprint(row)
    [
      row['en_texts_json'], row['ja_texts_json'], row['zh_text'], row['work_text']
    ].join("\0")
  end

  def safe_parentheticals?(old_text, new_text)
    old_text.scan(/\([^()\r\n]*\)/).each do |annotation|
      return false unless new_text.include?(annotation)
    end
    true
  end

  def validate_text!(old_text, new_text, status, key)
    raise "non-accepted edit at #{key.inspect}" if status != 'accepted' && old_text != new_text
    raise "accepted no-op at #{key.inspect}" if status == 'accepted' && old_text == new_text
    raise "lost source parenthetical at #{key.inspect}" unless safe_parentheticals?(old_text, new_text)
    old_tokens = old_text.scan(/\{[^{}]*\}/)
    new_tokens = new_text.scan(/\{[^{}]*\}/)
    raise "token change at #{key.inspect}" unless old_tokens == new_tokens
    old_breaks = old_text.scan(/\r\n|\r|\n/)
    new_breaks = new_text.scan(/\r\n|\r|\n/)
    raise "line-break change at #{key.inspect}" unless old_breaks == new_breaks
    raise "unbalanced parentheses at #{key.inspect}" unless new_text.count('(') == new_text.count(')')
  end

  def source_texts(source)
    english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n---\n")
    japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
    [english, japanese, source.fetch('zh_text').to_s]
  end

  def evidence_for(entity_key, status, english, japanese, chinese)
    term = english.strip.gsub(/\s+/, ' ')
    if status == 'uncertain'
      "Human-reviewed source leaves the identity tentative; English offers Gerald/Gefroy/Gregor and says the speaker cannot recall. Japanese and Chinese preserve the same uncertainty; unchanged."
    elsif status == 'accepted'
      "Human-reviewed exact source row for #{entity_key}; English anchors the identity, Japanese and Chinese corroborate the name/context. Canonical Korean spelling or annotation added while retaining the complete source English name/title."
    else
      "Human-reviewed exact source row for #{entity_key}; English anchors the identity, Japanese and Chinese corroborate the name/context. Existing canonical Korean spelling and complete bilingual annotation retained."
    end
  end

  def run
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
    source_by_key = {}
    inventory.each do |row|
      key = row_key(row)
      raise "duplicate inventory key #{key.inspect}" if source_by_key.key?(key)
      source_by_key[key] = row
    end

    index = CSV.read(INDEX, headers: true, col_sep: "\t")
    index_by_entity_key = {}
    index.each do |row|
      index_by_entity_key[[row.fetch('entity_key'), row_key(row)]] = row
    end
    glossary_rows = CSV.read(GLOSSARY, headers: true, col_sep: "\t")
    glossary = {}
    glossary_rows.each { |row| glossary[row.fetch('entity_key')] = row }

    grouped = {}
    DECISIONS.each do |entry|
      entity_key, resource, id, variant, status, new_text, expected_fingerprint = entry
      key = [resource, id, variant]
      group = (grouped[key] ||= {
        'entity_keys' => [], 'status' => status, 'new' => new_text,
        'fingerprint' => expected_fingerprint
      })
      raise "conflicting same-row decision #{key.inspect}" unless
        group['status'] == status && group['new'] == new_text &&
        group['fingerprint'] == expected_fingerprint
      group['entity_keys'] << entity_key unless group['entity_keys'].include?(entity_key)
    end

    rows = []
    skipped_terminal = 0
    grouped.each do |key, decision|
      source = source_by_key[key]
      raise "inventory row missing #{key.inspect}" unless source
      entity_keys = decision.fetch('entity_keys').sort
      target_entities = entity_keys.map do |entity_key|
        entity = glossary[entity_key]
        raise "unconfirmed/out-of-scope entity #{entity_key}" unless
          entity && entity['status'] == 'confirmed' && entity['category'] == 'person' &&
          entity_key.match?(/\Aperson:[g-m]/i) && entity_key.downcase != 'person:magnus'
        entity
      end
      pending = entity_keys.any? do |entity_key|
        row = index_by_entity_key[[entity_key, key]]
        row && row['status'] == 'needs-context'
      end
      unless pending
        skipped_terminal += 1
        next
      end

      actual_fingerprint = Digest::SHA256.hexdigest(fingerprint(source))
      raise "stale source/context at #{key.inspect}; re-review before regeneration" unless
        actual_fingerprint == decision.fetch('fingerprint')
      old_text = source.fetch('work_text')
      new_text = decision['new'] || old_text
      validate_text!(old_text, new_text, decision.fetch('status'), key)
      english, japanese, chinese = source_texts(source)
      keys = entity_keys.join('|')
      evidence = evidence_for(keys, decision.fetch('status'), english, japanese, chinese)
      rows << [
        *key, keys, decision.fetch('status'), old_text, new_text, evidence,
        english, japanese, chinese
      ]
    end

    row_keys = rows.map { |row| row[0, 3] }
    raise 'duplicate reviewed resource/ID/variant key' unless row_keys.uniq.length == rows.length
    rows.sort_by! { |row| [row[0], row[1].to_i, row[2]] }
    CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    counts = {}
    rows.each { |row| counts[row[4]] = (counts[row[4]] || 0) + 1 }
    puts "Wrote #{rows.length} reviewed rows to #{OUT}; statuses=#{counts.inspect}; already-terminal skipped=#{skipped_terminal}"
  end
end

PersonGMContinuation.run if $PROGRAM_NAME == __FILE__
