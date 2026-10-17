#!/usr/bin/env ruby

require 'csv'
require 'json'

module PersonCReview
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze

  SINGLE_KEYS = %w[
    person:cadoroc person:cady person:caelrod person:caerwyn
    person:caledus person:callidus person:calovar person:carowyn
    person:casmaran person:catrin person:cemble person:chalin
    person:cirys person:cleas person:codgan person:colet
    person:colliane person:conni person:connovar person:corelon
    person:coriana person:courdan person:creth person:crilgarin
    person:cryamor person:Jubal person:phinneas person:sari
    person:astor person:meywan person:dydyn person:nerenne
    person:togh person:olwy person:lollyrs person:brit
    person:passant
  ].freeze

  FULL_KEYS = %w[
    person:cady-dydyn person:Jubal-Caledus person:phinneas-callidus
    person:carowyn-togh person:catrin-olwy person:sari-cemble
    person:maura-chalin person:cirys-lollyrs person:cleas-nerenne
    person:brit-codgan person:astor-colliane person:aurela-corelon
    person:coriana-anwon person:courdan-passant person:creth-meywan
    person:aara-lollyrs person:brit-hagni person:scholar-nerenne
    person:mal-dydyn person:menri-togh person:eimer-togh
    person:kelleri-togh person:gwin-olwy
  ].freeze

  OTHER_KEYS = %w[
    unique_item:cryamor organization:colet-and-the-echoes
    person:cornaic-corelon unique_item:the-jubilant-jubal
    unique_item:cornaic-corelon-spell-book place:togh-farm
    place:lollyrs-home faction:house-anwon
    unique_item:calovars-relic unique_item:caerwyns-tome
  ].freeze

  CONTEXT_VERDICTS = {
    ['base', '1930'] => ['accepted', '안원 가문(House Anwon)'],
    ['base', '2488'] => ['accepted', '케어윈의 서(Caerwyn\'s Tome)'],
    ['base', '3845'] => ['accepted', '롤리스의 집(Lollyrs Home)'],
    ['base', '4636'] => ['accepted', '칼로바르의 유물(Calovar\'s Relic)'],
    ['default', '877'] => ['accepted', nil],
    ['default', '3186'] => ['accepted', nil],
    ['default', '4038'] => ['accepted', nil],
    ['default', '4611'] => ['accepted', nil],
    ['default', '11651'] => ['accepted', '케어윈의 서(Caerwyn\'s Tome)'],
    ['default', '16723'] => ['accepted', nil],
    ['default', '21973'] => ['accepted', nil],
    ['default', '28647'] => ['accepted', '학자 네렌(Scholar Nerenne)의 실험을 수행할 수 없다.'],
    ['default', '51070'] => ['accepted', nil],
    ['default', '56231'] => ['accepted', nil],
    ['default', '61213'] => ['not-an-issue', nil]
  }.freeze

  module_function

  def terms(entity)
    [entity.fetch('english_canonical'), *entity['english_aliases'].to_s.split('|')]
      .reject(&:empty?).uniq
  end

  def source_hits?(texts, entity)
    @matchers ||= {}
    key = [entity['english_canonical'], entity['english_aliases']]
    patterns = @matchers[key] ||= terms(entity).map do |term|
      Regexp.new("(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])",
                 Regexp::IGNORECASE)
    end
    patterns.any? do |pattern|
      texts.any? { |text| text && text.match?(pattern) }
    end
  end

  def korean_forms(entity)
    canonical = entity.fetch('korean_canonical').split('(').first
    ([canonical] + entity['korean_variants'].to_s.split('|'))
      .map { |form| form.gsub(/\([A-Za-z][^)]*\)/, '').gsub(/\s+/, ' ').strip }
      .select { |form| form.match?(/\p{Hangul}/) }
      .reject(&:empty?).uniq.sort_by { |form| -form.length }
  end

  def replace_forms(text, forms, entity, full_entities = [])
    canonical = entity.fetch('korean_canonical').split('(').first
    english = entity.fetch('english_canonical')
    alternatives = forms.sort_by { |form| -form.length }.map { |form| Regexp.escape(form) }
    pattern = Regexp.new(
      "(?<name>#{alternatives.join('|')})(?<annotation>[ \\t]*\\([^()\\r\\n]*\\))?(?<question>\\?)?"
    )
    text.gsub(pattern) do
      match = Regexp.last_match
      remainder = text[match.end(0)..].to_s
      if entity['entity_key'] == 'organization:colet-and-the-echoes' &&
         match[:annotation].to_s.strip.casecmp?('(Colet)')
        next match[0]
      end
      if entity['entity_key'] == 'organization:colet-and-the-echoes' &&
         match[:annotation].to_s.strip.casecmp?('(The Echoes)')
        next "#{canonical}(#{english})#{match[:question]}"
      end
      component_of_full_name = full_entities.any? do |full|
        full_english = full.fetch('english_canonical')
        entity_name = entity.fetch('english_canonical')
        full_english.match?(/(?<![A-Za-z])#{Regexp.escape(entity_name)}(?![A-Za-z])/i) &&
          remainder.match?(/\A(?:\s+[가-힣]+){1,3}\s*\((?:(?:Archsage|Lord|Sir|Lady) )?#{Regexp.escape(full_english)}\)/i)
      end
      next match[0] if component_of_full_name

      annotation = match[:annotation].to_s
      if !annotation.empty? &&
         annotation.match?(/(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])/i) &&
         !terms(entity).any? { |term| annotation.strip.casecmp?("(#{term})") }
        next "#{canonical}#{annotation}#{match[:question]}"
      end
      known = terms(entity).any? { |term| annotation.strip.casecmp?("(#{term})") }
      known ||= entity['entity_key'] == 'person:scholar-nerenne' &&
                annotation.strip == '(Nerenne)'
      known ||= entity['entity_key'] == 'organization:colet-and-the-echoes' &&
                annotation.strip.match?(/\A\((?:The )?Echos\)\z/i)
      if !annotation.empty? && !known
        next "#{canonical}(#{english})#{annotation}#{match[:question]}"
      end
      annotation = "(#{english})"
      "#{canonical}#{annotation}#{match[:question]}"
    end
  end

  def replace_titled_name(text, entity, title)
    english = title
    pattern, korean = if title == 'Lady Coriana'
                        [/(?:레이디\s+코리아나|코리아나(?:\s*\([^()\r\n]*\))?\s*부인)(?:\s*\([^()\r\n]*\))?/, '코리아나 부인']
                      else
                        [/(?:크레스|크레쓰|크레트)(?:\s*\([^()\r\n]*\))?\s*경(?:\s*\([^()\r\n]*\))?|로드 크레쓰(?:\s*\([^()\r\n]*\))?|(?:서|세이르|경)\s*(?:크레스|크레쓰|크레트)(?:\s*\([^()\r\n]*\))?/, '크레스 경']
                      end
    return nil unless text.match?(pattern)

    text.gsub(pattern) { "#{korean}(#{english})" }
  end

  def full_name_covers?(full_entities, entity, source_texts)
    english = entity.fetch('english_canonical')
    full_entities.any? do |full|
      full.fetch('entity_key') != entity.fetch('entity_key') &&
        source_hits?(source_texts, full) &&
        full.fetch('english_canonical').match?(
          /(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])/i
        )
    end
  end

  def build(inventory, glossary)
    all_keys = SINGLE_KEYS + FULL_KEYS + OTHER_KEYS
    entities = glossary.to_h { |entity| [entity.fetch('entity_key'), entity] }
    selected = all_keys.map { |key| entities.fetch(key) }
    full_keys = FULL_KEYS + %w[
      organization:colet-and-the-echoes unique_item:the-jubilant-jubal
      unique_item:cornaic-corelon-spell-book place:togh-farm place:lollyrs-home
      faction:house-anwon unique_item:calovars-relic unique_item:caerwyns-tome
    ]
    full_entities = full_keys.map { |key| entities.fetch(key) }
    rows = {}

    inventory.each do |source|
      english_texts = JSON.parse(source.fetch('en_texts_json') || '[]').compact
      hits = selected.select { |entity| source_hits?(english_texts, entity) }
      pet_sword = english_texts.any? { |text| text.match?(/pet sword Cryamor/i) }
      hits.reject! do |entity|
        (entity['entity_key'] == 'unique_item:cryamor' && !pet_sword) ||
          (entity['entity_key'] == 'person:cryamor' && pet_sword)
      end
      next if hits.empty?

      key = [source.fetch('resource'), source.fetch('ID_Linha'),
             source['Tipo_Variante'].to_s]
      old = source.fetch('work_text')
      new_text = old.dup
      unresolved = []
      excluded = []

      if hits.any? { |entity| entity['entity_key'] == 'person:cornaic-corelon' }
        excluded << 'person:cornaic-corelon'
      end

      if hits.any? { |entity| entity['entity_key'] == 'person:cemble' } &&
         english_texts.any? { |text| text.match?(/(?<![A-Za-z])Cemble's(?![A-Za-z])/i) } &&
         !english_texts.any? { |text| text.match?(/(?<![A-Za-z])Sari Cemble(?![A-Za-z])/i) }
        excluded << 'person:cemble'
      end

      applicable = hits.reject do |entity|
        key_name = entity.fetch('entity_key')
          excluded.include?(key_name) ||
          (key_name == 'person:cornaic-corelon') ||
          (key_name == 'person:Jubal' &&
           english_texts.any? { |text| text.match?(/The Jubilant Jubal/i) }) ||
          (key_name == 'person:cryamor' &&
           hits.any? { |other| other['entity_key'] == 'unique_item:cryamor' }) ||
          false
      end

      ensemble = applicable.find { |entity| entity['entity_key'] == 'organization:colet-and-the-echoes' }
      if ensemble
        korean_forms(ensemble).sort_by { |form| -form.length }.each do |form|
          new_text = new_text.gsub(form, ensemble.fetch('korean_canonical'))
        end
      end

      applicable.sort_by do |entity|
        -entity['english_canonical'].length
      end.each do |entity|
        entity_key = entity.fetch('entity_key')
        if entity_key == 'organization:colet-and-the-echoes'
          new_text = new_text.gsub(/콜렛\(Colet\)(?=과 에코)/, '콜렛')
        end
        titles = case entity_key
                 when 'person:creth'
                   english_texts.flat_map { |text| text.to_s.scan(/(?:Sir|Lord) Creth/i) }.uniq
                 when 'person:coriana'
                   english_texts.flat_map { |text| text.to_s.scan(/Lady Coriana/i) }.uniq
                 else
                   []
                 end
        unless titles.empty?
          titles.each do |title|
            replacement = replace_titled_name(new_text, entity, title)
            if replacement
              new_text = replacement
            else
              unresolved << entity_key
            end
          end
          next
        end

        forms = korean_forms(entity)
        if %w[person:creth person:coriana].include?(entity_key)
          forms = forms.reject { |form| form.match?(/(?: 경| 부인|로드 |서 |세이르 |경 )/) }
        end
        found = forms.any? { |form| new_text.include?(form) }
        if found
          new_text = replace_forms(new_text, forms, entity, full_entities)
        else
          unresolved << entity.fetch('entity_key')
        end
      end

      # Only reviewed names whose final sound changed need particle repair.
      new_text = new_text.gsub(/카도로크\(Cadoroc\)이(?=\s|[.!?,]|$)/, '카도로크(Cadoroc)가')
                         .gsub('카도로크(Cadoroc)은', '카도로크(Cadoroc)는')
                         .gsub('카도로크(Cadoroc)을', '카도로크(Cadoroc)를')
                         .gsub('카도로크(Cadoroc)과', '카도로크(Cadoroc)와')
                         .gsub('카도로크(Cadoroc)이라', '카도로크(Cadoroc)라')
                         .gsub(/크레스 경\((Sir|Lord) Creth\)와/, '크레스 경(\1 Creth)과')
                         .gsub('학자 네렌(Scholar Nerenne)를', '학자 네렌(Scholar Nerenne)을')
                         .gsub('학자 네렌(Scholar Nerenne)와', '학자 네렌(Scholar Nerenne)과')
                         .gsub("에코즈(Colet and the Echoes)'이라는", "에코즈(Colet and the Echoes)'라는")
      new_text = new_text.gsub(
        /콜렛(?:\(Colet\))?과 에코즈(?:\([^()]*\))*/,
        '콜렛과 에코즈(Colet and the Echoes)'
      ).gsub(")'이라는", ")'라는")
      if hits.any? { |entity| entity['entity_key'] == 'organization:colet-and-the-echoes' }
        new_text = new_text.gsub(/콜렛(?!과 에코즈|\()/, '콜렛(Colet)')
      end
      verdict = CONTEXT_VERDICTS[[key[0], key[1]]]
      if verdict
        status_override, exact_text = verdict
        if status_override == 'not-an-issue'
          new_text = old
        elsif exact_text
          new_text = exact_text
        else
          new_text = new_text.gsub('안원(Anwon) 가문', '안원 가문(House Anwon)')
          new_text = new_text.gsub('코리아나(Coriana) 부인', '코리아나 부인(Lady Coriana)')
          new_text = new_text.gsub('토그(Togh) 농장', '토그 농장(Togh Farm)')
          new_text = new_text.gsub('칼로바르(Calovar)의 유물', '칼로바르의 유물(Calovar\'s Relic)')
          new_text = new_text.gsub('코렛(Colet)과 에코즈(The Echoes)', '콜렛과 에코즈(Colet and the Echoes)')
        end
      end

      status = if verdict
                 verdict[0]
               elsif !unresolved.empty?
                 new_text = old
                 'uncertain'
               elsif !excluded.empty? && applicable.empty?
                 'excluded'
               elsif new_text == old
                 'not-an-issue'
               else
                 'accepted'
               end
      matched_keys = (hits.map { |entity| entity.fetch('entity_key') } +
                      excluded + unresolved).uniq
      evidence = 'English source is primary; Japanese pronunciation and Chinese spelling corroborate; '
      evidence += "matched entities #{matched_keys.join('|')}"
      evidence += '; focused full-name/title cross-check establishes this exact bilingual item/place/faction form.' if verdict
      evidence += "; no recognized Korean counterpart for #{unresolved.uniq.join('|')}" unless unresolved.empty?
      evidence += '; Cemble\'s is a shop/business reference, not an identified personal-name occurrence.' unless excluded.empty?
      row = [
        *key, matched_keys.join('|'), status, old, new_text, evidence,
        english_texts.join("\n---\n"),
        JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
        source.fetch('zh_text').to_s
      ]
      if rows.key?(key)
        prior = rows.fetch(key)
        raise "conflicting duplicate key #{key.inspect}" unless prior[5..6] == row[5..6]
        prior[3] = (prior[3].split('|') | matched_keys).join('|')
      else
        rows[key] = row
      end
    rescue JSON::ParserError => error
      raise "invalid locale JSON at #{key.inspect}: #{error.message}"
    end

    rows.values.sort_by { |row| [row[0], row[1].to_i, row[2]] }
  end

  def run
    root = File.expand_path('../../..', __dir__)
    inventory_path = '/private/tmp/proper-name-source-inventory.tsv'
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    out = File.join(__dir__, 'proper-name-proposals-C-D20395.tsv')
    inventory = CSV.read(inventory_path, headers: true, col_sep: "\t")
    glossary = CSV.read(glossary_path, headers: true, col_sep: "\t").map(&:to_h)
    rows = build(inventory, glossary)
    CSV.open(out, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    puts "Wrote #{rows.length} reviewed row candidates to #{out}"
    puts rows.group_by { |row| row[4] }.transform_values(&:length).inspect
  end
end

if $PROGRAM_NAME == __FILE__
  PersonCReview.run
end
