#!/usr/bin/env ruby

require 'csv'
require 'digest'
require 'json'

module PersonGMNextReview
  AUDIT_DIR = File.expand_path(__dir__)
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  INDEX = File.join(AUDIT_DIR, 'proper-name-occurrences.tsv')
  GLOSSARY = File.join(AUDIT_DIR, 'proper-name-glossary.tsv')
  OUT = File.join(AUDIT_DIR, 'proper-name-reviewed-G-M-next.tsv')
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze

  # Replacements are row-local and literal. Same-row entity decisions must be
  # combined into one entry, one joined entity_key, and one final Texto value.
  DECISIONS = [
    ['person:grastar', 'base', '1215', '11', 'accepted', [['타인 그라스타르(Tine Grastar)', '타인 그라스타(Tine Grastar)']], '73aabb50f7fbecbf2b3d669e28cdd25004c5ded591cacd02c1fab54a02b7e43a', 'Canonical Grastar spelling; full name Tine Grastar retained.'],
    ['person:gortan', 'base', '1702', '11', 'accepted', [['조앤 고턴(Joanne Gortan)', '조앤 고탄(Joanne Gortan)']], '480912666dfad5064e265c9ea0f29733fe919f60dcb61dc8168b8cb6627a10a5', 'Canonical Gortan spelling; full source name Joanne Gortan retained.'],
    ['person:graem', 'default', '1130', '', 'not-an-issue', [], '166a06e45549fff6c34ce9062e8ced86fd0cc0a1cc9fd14933d939139996300d', 'Existing canonical Graem annotation retained.'],
    ['person:gortan', 'default', '4440', '', 'not-an-issue', [], '4fcf85e88417dbc0d28672668b1077395232e10e321d31778b216bde0c967850', 'Existing canonical full name Vonne Gortan retained.'],
    ['person:graem', 'default', '5647', '', 'accepted', [['그라엠 헤일(Graem Haille)', '그렘 헤일(Graem Haille)']], '752f0210703bde26f01e708dd557804496af11c463fd33e9d51e216b3001a438', 'Canonical Graem spelling; full name Graem Haille retained.'],
    ['person:gorrenet', 'default', '9219', '', 'accepted', [['고레넷은', '고레넷(Gorrenet)은']], '4925b8697ec17baba2225d1e84f1faff06cf46fb753d049e127d4493e140a9bc', 'Added the source English name to the canonical Korean name.'],
    ['person:grastar', 'default', '11728', '', 'not-an-issue', [], '1e431082240522117b443f40f812d0d6f63429cfd7bf76ca282e22bf3dd1a804', 'Existing canonical full name Bera Grastar retained.'],
    ['person:gorrenet', 'default', '16614', '', 'accepted', [['고렌넷 경(Lord Gorrenet)', '고레넷 경(Lord Gorrenet)']], '2ef3dfa577b0bd5da03d2bba3d7e27e93d3537752db1ca185fb42ac02d86f5e0', 'Canonical Korean name normalized; full Lord Gorrenet annotation retained.'],
    ['person:gortan', 'default', '16770', '', 'not-an-issue', [], 'c9912c377cbb47d4d7be1e0fd67649115ff5f862980cbdc1c66442e6cb90412a', 'Existing canonical full name Joanne Gortan retained.'],
    ['person:graem', 'default', '17140', '', 'not-an-issue', [], '833a3f222f1381a3e5c58381af2449d7d1f487e47895a22021d91c10cbd91e3b', 'Existing canonical Graem annotation retained.'],
    ['person:gorrier', 'default', '18246', '', 'not-an-issue', [], '152f1d0af17cc5b2198c8240483a1d497cc940a3a02e07b896a99bb7b90537c2', 'Existing canonical Gorrier annotation retained.'],
    ['person:gorrenet', 'default', '18961', '', 'not-an-issue', [], '79984d4004836d727d9d8f68bc5dd54d231338330ba16de060f5dd7c77eb89b6', 'Existing canonical Gorrenet annotation retained.'],
    ['person:graem', 'default', '19207', '', 'accepted', [['마법사 그레임 할그', '마법사 그렘 할그(Graem Halg)']], '2dab361abc9dd6ef5bba977b625925a8bb3212af9b574c27e6da9ad629af0527', 'Canonical Graem spelling; full source name Graem Halg added.'],
    ['person:grastar', 'default', '20108', '', 'accepted', [['타인 그라스타의 무덤', '타인 그라스타(Tine Grastar)의 무덤']], '9f4f30d049b1c044ba88f7160740ebf0827660f273c36caacfeccfbbf0c06772', 'Added full source name Tine Grastar to the canonical Korean name.'],
    ['person:graem', 'default', '20700', '', 'accepted', [['그레임에게', '그렘(Graem)에게']], '5fec056b55d1fa6a31ecc28d65b236057c9fa98a484d2117c10d3f5c2186c5f2', 'Canonical Graem spelling and bilingual annotation added.'],
    ['person:graem', 'default', '21763', '', 'accepted', [['그레이엄 헤일(Graem Haille)', '그렘 헤일(Graem Haille)']], '7f35e269a1e94623f1cb82dfde8f8c1c608081dd7e5b3ffde8aa916e61582567', 'Canonical Graem spelling; full name Graem Haille retained in the multiline text.'],
    ['person:graem', 'default', '23024', '', 'accepted', [['그레임에게', '그렘(Graem)에게']], 'd5717c47fc52c1e28587040ddf620c6c64c3799ac341cfa71eadb2b68e20e233', 'Canonical Graem spelling and bilingual annotation added.'],
    ['person:gortan', 'default', '23145', '', 'accepted', [['본 고르탄(Vonne Gortan)', '본 고탄(Vonne Gortan)']], '2935ea7f72e6991686d92ed5382750571378548623853a76fd680bc20d2d5dfe', 'Canonical Gortan spelling; full name Vonne Gortan retained.'],
    ['person:grimmy', 'default', '23979', '', 'not-an-issue', [], 'a76024088d00875f71ddc51d784796ff738ca0f10157bcb4c60d80c4da03f891', 'Existing canonical Grimmy annotation retained.'],
    ['person:gortan', 'default', '24088', '', 'accepted', [['조앤 고턴(Joanne Gortan)', '조앤 고탄(Joanne Gortan)']], '6c1e93c2396601c7bc6b08e58a4eba9bd790cb4e68d92a2f93d682c3828c4674', 'Canonical Gortan spelling; full source name Joanne Gortan retained.'],
    ['person:gortan', 'default', '30115', '', 'accepted', [['고탄 씨께.', '고탄(Mstr. Gortan) 씨께.'], ['조앤 고탄이', '조앤 고탄(Joanne Gortan)이']], 'ea81171dfca95c2d0b1e55168ba93870b78c4d3829728476cc8812db82eb1dda', 'Preserved the source honorific Mstr. and the complete name Joanne Gortan.'],
    ['person:grimmy', 'default', '31315', '', 'not-an-issue', [], '960b43a85ba171cff680d6dac3e5291b0bf210000face061d5c74de64de14fa2', 'Existing canonical Grimmy annotation retained.'],
    ['person:grastar', 'default', '31969', '', 'uncertain', [], 'eec7483ea8e35947add57232c5105a3e240ddbccb69ec574207b42cf8c1cde6b', 'The row refers both to the Grastar family and to Heste Grastar; the confirmed person key does not establish whether these are the same identity. Left unchanged.'],
    ['person:graem', 'default', '34138', '', 'accepted', [['그레임에게 건네기', '그렘(Graem)에게 건네기']], 'b50229207bf765ce6bf863cfb527047212f1af3c8489eba14b338f1b79a78e21', 'Canonical Graem spelling and bilingual annotation added.'],
    ['person:gorrier', 'default', '36962', '', 'accepted', [['할아버지 고리어', '할아버지 고리어(Gorrier)']], 'afb5f307b131f5c6ca88338aa8446e02e19a561e98d1c556a8a240d6a17bbb9f', 'English and Chinese identify the grandfather Gorrier; Japanese corroborates the proper name.'],
    ['person:grastar', 'default', '37057', '', 'accepted', [['베라 그라스타르가', '베라 그라스타(Bera Grastar)가']], '0364bbd43b0e5b6cdd54a63a07d241e7057cd747da32a6130c5ae71e5f1332f2', 'Canonical Grastar spelling and complete name Bera Grastar added.'],
    ['person:graem', 'default', '39581', '', 'accepted', [['그레임에게 돌아가기', '그렘(Graem)에게 돌아가기']], '36290fa1e27d6c4cfed4b9f2c707031a9a6297b04f4be6f7ac78e97bf21276a1', 'Canonical Graem spelling and bilingual annotation added.'],
    ['person:gortan', 'default', '41539', '', 'not-an-issue', [], 'c9328ef03a15b99c752f123805b45dff738acc9b3f87a339684c2fb6b54eb41f', 'Existing canonical Gortan annotation retained.'],
    ['person:graem', 'default', '41871', '', 'accepted', [['그레임 헤일', '그렘 헤일(Graem Haille)']], '91d460e9e9313e065ec0497926f9ae57a3144a83780a326957337876683fbd8b', 'Canonical Graem spelling and full name Graem Haille added.'],
    ['person:graem', 'default', '42762', '', 'not-an-issue', [], '8d45356f668696ed8f741dd0618afc5b3962c3cb37357ae830e2bf6681727842', 'Existing canonical Graem annotation retained.'],
    ['person:graem', 'default', '43713', '', 'accepted', [['그레이엄과', '그렘(Graem)과']], '5e9b22d7c877dc2a5e1ad140be06a5bc085086da1f81b19532632b8e48e52ec0', 'Canonical Graem spelling and bilingual annotation added.'],
    ['person:gorrenet', 'default', '44797', '', 'accepted', [['고렌넷은', '고레넷(Gorrenet)은']], '22a1df0d3f3ece99d613b759c6593555abb858b6c480c22d90789339757f6d1e', 'Canonical Gorrenet spelling and bilingual annotation added.'],
    ['person:graem', 'default', '45599', '', 'not-an-issue', [], '8d45356f668696ed8f741dd0618afc5b3962c3cb37357ae830e2bf6681727842', 'Existing canonical Graem annotation retained.'],
    ['person:graem', 'default', '47702', '', 'not-an-issue', [], '8d45356f668696ed8f741dd0618afc5b3962c3cb37357ae830e2bf6681727842', 'Existing canonical Graem annotation retained.'],
    ['person:gorrenet', 'default', '48274', '', 'accepted', [['고렌넷 경', '고레넷 경(Lord Gorrenet)']], 'bb2468bffa11a1647c480a0cff4796acaf1ac92f07f88acff0d23ed989d7474d', 'Canonical Gorrenet spelling; complete Lord Gorrenet annotation added.'],
    ['person:grastar', 'default', '48858', '', 'accepted', [['베라 그라스타', '베라 그라스타(Bera Grastar)']], 'cadd96965f82f8e93ff0ce61ce56cd5d982ae8d9ddd757d0c3bdd03cc88bcf17', 'Added complete source name Bera Grastar to the canonical Korean name.'],
    ['person:gorrenet', 'default', '49547', '', 'accepted', [['페이 대마법사 고렌넷', '페이 대마법사 고레넷(High Faemage Gorrenet)']], '334939a0b692422e3dc02a1791311d740ace3c03a6a5ec249f0748971bb0fa8b', 'Canonical Gorrenet spelling; retained the complete High Faemage Gorrenet title/name compound.'],
    ['person:graem', 'default', '49881', '', 'accepted', [['그레임에게 돌아가기', '그렘(Graem)에게 돌아가기']], '36290fa1e27d6c4cfed4b9f2c707031a9a6297b04f4be6f7ac78e97bf21276a1', 'Canonical Graem spelling and bilingual annotation added.'],
    ['person:graem', 'default', '49913', '', 'accepted', [['그레임은', '그렘(Graem)은']], 'b8302596f2cf2b27c6c44da9cc08eabb1ec57e85cc8ccd9a8262fd5fb718b380', 'Canonical Graem spelling and bilingual annotation added.'],
    ['person:gorrenet', 'default', '54196', '', 'not-an-issue', [], '61465a763ac6d69f29a592dfdf8c72f40873a09989ca904acdbedeedda8c4705', 'Existing full title Grand Faemage Gorrenet and canonical Korean name retained.'],
    ['person:gorrenet', 'default', '55993', '', 'not-an-issue', [], '74e5a0eeabfc1216e952c8a308b5e76710414bc2844731bee84aeafce790b519', 'Existing full title Grand Faemage Gorrenet and canonical Korean name retained.'],
    ['person:graem', 'default', '57408', '', 'not-an-issue', [], 'c0a983baec212fd212fba84c1871bf16db5de0826f68f8247780702fa0b137d3', 'Existing canonical Graem annotation retained.'],
    ['person:grastar', 'default', '58971', '', 'accepted', [['베라 그래스터야', '베라 그라스타(Bera Grastar)야']], '88c9ab9bb8f165fa2b710ae17505436c92c75d9e1d977230cbe232f2328c8ca5', 'Canonical Grastar spelling and complete name Bera Grastar added.'],
    ['person:gortan', 'default', '59257', '', 'accepted', [['조앤 고탄', '조앤 고탄(Joanne Gortan)']], '6079ac1a0a4a71d36e7337770d571e212bedb982d16e64efe4bdee924e074799', 'Added full source name Joanne Gortan to the canonical Korean name.'],
    ['person:gorrenet', 'default', '61732', '', 'accepted', [['고레네트(Grand Faemage Gorrenet)', '고레넷(Grand Faemage Gorrenet)']], 'df9cc8ea68dc986519b32608cc7db6f828235ac2b35bfb1f6bad4477e68c823d', 'Canonical Gorrenet spelling; full title Grand Faemage Gorrenet retained.'],
    ['person:graem', 'default', '62975', '', 'not-an-issue', [], 'b533274dfb6cea9118e28c681b3f8f7e59654d8e5f62295ff4ce9f48ac80b451', 'Existing canonical Graem annotation retained.'],
    ['person:grastar', 'default', '63900', '', 'not-an-issue', [], '4cc9b9bae9926bbabf2bff26dc8965842c69565588cac9d91b9e0ed570db691b', 'Existing canonical Grastar annotation retained.'],
    ['person:gortan', 'default', '64477', '', 'accepted', [['조앤 고턴이', '조앤 고탄(Joanne Gortan)이']], '21e08586bd4b2f8cb93ccc4d14f02a1141133dc8926e60dc85881206ccaaa8bb', 'Canonical Gortan spelling and complete name Joanne Gortan added.']
  ].freeze

  module_function

  def row_key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def fingerprint(row)
    [row['en_texts_json'], row['ja_texts_json'], row['zh_text'], row['work_text']].join("\0")
  end

  def apply_replacements(old_text, replacements, key)
    new_text = old_text.dup
    replacements.each do |before, after|
      count = new_text.scan(Regexp.new(Regexp.escape(before))).length
      raise "replacement fragment count #{count} at #{key.inspect}: #{before.inspect}" unless count == 1
      new_text.sub!(before, after)
    end
    new_text
  end

  def validate_text!(old_text, new_text, status, key)
    raise "non-accepted edit at #{key.inspect}" if status != 'accepted' && old_text != new_text
    raise "accepted no-op at #{key.inspect}" if status == 'accepted' && old_text == new_text
    old_text.scan(/\([^()\r\n]*\)/).each do |annotation|
      raise "lost source parenthetical at #{key.inspect}" unless new_text.include?(annotation)
    end
    raise "token change at #{key.inspect}" unless old_text.scan(/\{[^{}]*\}/) == new_text.scan(/\{[^{}]*\}/)
    raise "line-break change at #{key.inspect}" unless old_text.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)
    raise "unbalanced parentheses at #{key.inspect}" unless new_text.count('(') == new_text.count(')')
  end

  def source_texts(source)
    english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n---\n")
    japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
    [english, japanese, source.fetch('zh_text').to_s]
  end

  def run
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
    source_by_key = {}
    inventory.each do |row|
      key = row_key(row)
      raise "duplicate inventory key #{key.inspect}" if source_by_key.key?(key)
      source_by_key[key] = row
    end
    index = CSV.foreach(INDEX, headers: true, col_sep: "\t").to_a
    pending = {}
    index.each do |row|
      pending[[row.fetch('entity_key'), row_key(row)]] = row['status'] == 'needs-context'
    end
    glossary_rows = CSV.read(GLOSSARY, headers: true, col_sep: "\t")
    glossary = {}
    glossary_rows.each { |row| glossary[row.fetch('entity_key')] = row }

    decisions = {}
    DECISIONS.each do |entry|
      entity_key, resource, id, variant, status, replacements, source_fingerprint, reason = entry
      key = [resource, id, variant]
      raise "duplicate decision key #{key.inspect}; merge same-row entity decisions" if decisions.key?(key)
      decisions[key] = [entity_key, status, replacements, source_fingerprint, reason]
    end

    rows = []
    skipped_terminal = 0
    decisions.each do |key, decision|
      entity_key, status, replacements, source_fingerprint, reason = decision
      source = source_by_key[key]
      raise "inventory row missing #{key.inspect}" unless source
      entity = glossary[entity_key]
      raise "unconfirmed/out-of-scope entity #{entity_key}" unless
        entity && entity['status'] == 'confirmed' && entity['category'] == 'person' &&
        entity_key.match?(/\Aperson:[g-m]/i) && entity_key.downcase != 'person:magnus'
      unless pending[[entity_key, key]]
        skipped_terminal += 1
        next
      end
      actual_fingerprint = Digest::SHA256.hexdigest(fingerprint(source))
      raise "stale source/context at #{key.inspect}; re-review before regeneration" unless
        actual_fingerprint == source_fingerprint
      old_text = source.fetch('work_text')
      new_text = apply_replacements(old_text, replacements, key)
      validate_text!(old_text, new_text, status, key)
      english, japanese, chinese = source_texts(source)
      evidence = "Human-reviewed exact source row for #{entity_key}. #{reason} English is the identity anchor; Japanese and Chinese were checked against the full Korean row."
      rows << [
        *key, entity_key, status, old_text, new_text, evidence,
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

PersonGMNextReview.run if $PROGRAM_NAME == __FILE__
