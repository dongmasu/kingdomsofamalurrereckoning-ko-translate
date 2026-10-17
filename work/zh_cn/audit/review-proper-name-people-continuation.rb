#!/usr/bin/env ruby
# encoding: UTF-8

require 'digest'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

# The main runner may execute this after its other serial batches finish.
# Loading this file does not register names, refresh inventory, or apply edits.
module PeopleContinuationReview
  SOURCE_SHA256 = 'd4539fd354600b51a7bd2c67ca7a7bfecde6edf69d253680a61fb68f22ec8e7b'.freeze
  SOURCE_MATCHES = 623
  SOURCE_ROWS = 603

  def self.unit(english, korean, forms = [], source_terms = nil)
    {
      english: english, korean: korean, forms: ([korean] + forms).uniq,
      source_terms: source_terms || [english]
    }
  end

  SPECS = [
    {
      key: 'person:egan', english: 'Egan', korean: '에간',
      units: [unit('Egan', '에간', %w[이건 에건])],
      evidence: 'default:10878|default:4751|default:44623',
      identity: 'Brother Egan, the missing Gorhart monk; Japanese イーガン and Chinese 伊根 corroborate. The user explicitly selected 에간(Egan), not the Korean pronoun 이건.'
    },
    {
      key: 'person:wencen', english: 'Wencen', korean: '웬센',
      units: [unit('Wencen', '웬센', [], %w[Wencen Wencens])],
      evidence: 'default:38175|default:25244|default:22629',
      identity: 'King Wencen; Japanese ウェンセン and Chinese 文森 corroborate. Historical/acting Wencens are bearers of the named Fae role, not an ordinary noun; no claim of one historical individual is made.'
    },
    {
      key: 'person:etair', english: 'Etair', korean: '에테어',
      units: [unit('Etair', '에테어', %w[에타이르 에타이어])],
      evidence: 'base:1466|default:47890|default:38665',
      identity: 'Father Etair, Mitharu priest and alchemist; Japanese エタイア and Chinese 埃泰尔 corroborate. Retain the existing recurring Korean 에테어 spelling and all clergy titles.'
    },
    {
      key: 'person:canwen', english: 'Canwen', korean: '캔웬',
      units: [unit('Canwen', '캔웬', %w[카언웬])],
      evidence: 'default:26650|default:12606|default:25632',
      identity: 'Captain Canwen, Camp Moondown commander; Japanese カンウェン and Chinese 坎文 corroborate. Captain, military rank, and unrelated unit/place names are not retranslated.'
    },
    {
      key: 'person:rast-brattigan', english: 'Rast Brattigan', korean: '라스트 브래티건',
      units: [
        unit('Rast Brattigan', '라스트 브래티건'),
        unit('Brattigan', '브래티건'), unit('Rast', '라스트')
      ],
      evidence: 'default:45716|default:30586|default:5884',
      identity: 'Captain Rast Brattigan; Japanese ラスタ・ブラティガン and Chinese 拉斯特/拉丝特·布拉提甘 corroborate. Full name, surname, and familiar first-name references identify the same sailor.'
    },
    {
      key: 'person:farrara', english: 'Farrara', korean: '파라라',
      units: [unit('Farrara', '파라라', %w[패라라 패러라], %w[Farrara Farrarra])],
      evidence: 'default:21218|default:3664|default:61455',
      identity: 'Sir/Lord Farrara; Japanese ファララ and Chinese 法拉拉 corroborate. Source Farrarra at default:3664 is a spelling variant; retain that complete existing English annotation rather than silently shortening it.'
    },
    {
      key: 'person:airmer', english: 'Airmer', korean: '에어머',
      units: [unit('Airmer', '에어머')],
      evidence: 'default:39796|default:24246|default:61776',
      identity: 'Sir/Lord Airmer, the knight paired with Creth; Japanese エアマー and Chinese 艾尔梅尔 corroborate. Airmer the Pure and other complete title/name annotations remain atomic.'
    },
    {
      key: 'person:dynwel', english: 'Dynwel', korean: '딘웰',
      units: [unit('Dynwel', '딘웰', %w[다인웰 던웰 디뉴엘])],
      evidence: 'default:4997|default:44623|default:12769',
      identity: 'Father Dynwel, Egan guardian and Gorhart priest; Japanese ディンウェル and Chinese 丁维尔/迪恩维尔 corroborate. Retain the recurring Korean 딘웰 spelling.'
    },
    {
      key: 'person:zelda', english: 'Zelda', korean: '젤다',
      units: [unit('Zelda', '젤다')],
      evidence: 'default:750|default:59891|default:61561',
      identity: 'Sister Zelda, the would-be female Mitharu monk; Japanese ゼルダ and Chinese 塞尔达 corroborate. Preserve Crazy Sister Zelda as an existing complete label.'
    },
    {
      key: 'person:eilaly', english: 'Eilaly Airancourt', korean: '에일랄리 에어랑쿠르',
      units: [
        unit('Eilaly Airancourt', '에일랄리 에어랑쿠르', ['에일랠리 에어랑쿠르']),
        unit('Airancourt', '에어랑쿠르', %w[에어런코트 에어랑쿠르트 에어랭코트 에어랜코트 에랑쿠르 아이런코트 에어랜쿠르]),
        unit('Eilaly', '에일랄리', %w[에일랠리])
      ],
      evidence: 'default:6896|default:32847|default:63644|default:59857',
      identity: 'Scholar Eilaly Airancourt; Japanese イーラリー・アイランコート and Chinese 艾莱丽·埃兰库特 corroborate. Reuse registered person:eilaly; surname-only rows retain Airancourt, not an invented full-name expansion. Full-name Korean spelling follows the already reviewed default:6896.'
    },
    {
      key: 'person:abelyra-seranon', english: 'Abelyra Seranon', korean: '아벨리라 세라논',
      units: [
        unit('Abelyra Seranon', '아벨리라 세라논'),
        unit('Seranon', '세라논'), unit('Abelyra', '아벨리라')
      ],
      evidence: 'default:33118|default:48306|default:15348',
      identity: 'Priestess Abelyra Seranon; Japanese アベリラ・セラノン and Chinese 阿比莉拉·塞拉农 corroborate. The current priestess is the ninety-fourth office holder; do not infer that every historical priestess shared her identity.'
    },
    {
      key: 'person:holt', english: 'Holt', korean: '홀트',
      units: [unit('Holt', '홀트')],
      evidence: 'default:57741|default:39195|default:47365',
      identity: 'Brother Holt, Padric friend; Japanese ホルト and Chinese 霍特/霍尔特 corroborate. Repeated names within one journal/quest row are independently retained and labeled.'
    },
    {
      key: 'person:ceanna', english: 'Ceanna', korean: '세안나',
      units: [unit('Ceanna', '세안나', %w[씨애나 시안나])],
      evidence: 'default:12933|default:55444|base:556',
      identity: 'Sister Ceanna, Jacinda shipwreck companion; Japanese セアンナ and Chinese 切安娜 corroborate. Normalize only the personal name, including the signed letter and corpse/note references.'
    },
    {
      key: 'person:rask', english: 'Rask', korean: '라스크',
      units: [unit('Rask', '라스크')],
      evidence: 'default:31863|default:4146|default:29912',
      identity: 'Warden Rask of Crownhold; Japanese ラスク and Chinese 拉斯克 corroborate. Preserve the existing Korean warden/title translations and all unrelated bounty-target names.'
    },
    {
      key: 'person:padric', english: 'Padric', korean: '패드릭',
      units: [unit('Padric', '패드릭')],
      evidence: 'default:21092|default:39195|base:2032',
      identity: 'Brother Padric, the Splitrock explorer; Japanese パドリック and Chinese 帕德里克/帕迪克 corroborate. The corpse, travel notes, and repeated narrative mentions refer to the named monk.'
    },
    {
      key: 'person:oleyn', english: 'Oleyn', korean: '올레인',
      units: [unit('Oleyn', '올레인', %w[올린 오레인])],
      evidence: 'default:35383|default:34912|default:61776',
      identity: 'Lady/Dame Oleyn, the Cureseeker; Japanese オレイン/オリン and Chinese 奥蕾因 corroborate. Preserve complete Oleyn the Kind, Lady Oleyn, and Oleyn\'s Will annotations.'
    },
    {
      key: 'person:owaiglyn', english: 'Owaiglyn', korean: '오웨이글린',
      units: [unit('Owaiglyn', '오웨이글린', %w[오와이글린])],
      evidence: 'default:36401|default:54398|default:64322',
      identity: 'Commander Owaiglyn at Mel Senshir; Japanese オウェイグリン and Chinese 欧瓦格林 corroborate the recurring Korean 오웨이글린 spelling.'
    },
    {
      key: 'person:jacinda', english: 'Jacinda', korean: '자신다',
      units: [unit('Jacinda', '자신다')],
      evidence: 'default:4025|default:54247|default:55444',
      identity: 'Priestess Jacinda, Ceanna fellow Lyria devotee; Japanese ジャシンダ and Chinese 雅辛达/贾辛达 corroborate. Korean 자신다 here is the explicitly named priestess, not a generic verb.'
    },
    {
      key: 'person:clary-ansilla', english: 'Clary Ansilla', korean: '클라리 안실라',
      units: [
        unit('Clary Ansilla', '클라리 안실라', ['클래리 안실라', '클레리 안실라']),
        unit('Clary', '클라리', %w[클래리 클레리 클러리])
      ],
      evidence: 'default:4644|default:30924|default:52784',
      identity: 'Clary Ansilla; Japanese クラリー・アンシラ and Chinese 克莱里/克拉里·安西拉 corroborate. English distinguishes the first Clary from later family history; no global Lady/Lord/House/Castle Ansilla alias is assigned. Mistress Clary is excluded, and Old Lady Clary remains uncertain.'
    },
    {
      key: 'person:drewn', english: 'Drewn Ansilla', korean: '드루엔 안실라',
      units: [
        unit('Drewn Ansilla', '드루엔 안실라'), unit('Drewn', '드루엔'),
        unit('Captain Ansilla', '안실라 대위', ['앤실라 대위', '앤실라(Ansilla) 대위']),
        unit('Captain Ansilla', '안실라 대장', ['앤실라 대장'])
      ],
      evidence: 'default:30335|default:30924|default:35376|default:23893',
      identity: 'Captain Drewn Ansilla; Japanese ドリューン・アンシラ and Chinese 德鲁温/德鲁恩·安西拉 corroborate. Reuse registered person:drewn. Captain Ansilla is his reviewed military reference; Lord Ansilla, Lady Ansilla, House Ansilla, and Castle Ansilla are not aliases.'
    }
  ].freeze

  SUFFIX = /
    (?:
      이(?:라고|라는|라며|라면|라서|라도|라니|었던|에요|었|야|다|지|니|면|며|고|나|든|란|라)?
      |였던|였다|예요|은|는|을|를|가|과|와|의|에게서|에게|한테|께서|께
      |에서|에서는|에서도|에|으로부터|으로서|으로써|으로|로부터|로서|로
      |처럼|보다|만큼|까지|부터|조차|마저|밖에|뿐|도|만|들
    )*
  /x

  module_function

  def english_hit?(text, term)
    text.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
  end

  def terms(spec)
    spec.fetch(:units).flat_map { |part| part.fetch(:source_terms) }.uniq
  end

  def glossary_terms(row)
    [row.fetch('english_canonical'), *row['english_aliases'].to_s.split('|')]
  end

  def register_definition(spec, glossary)
    owners = glossary.select do |row|
      row['entity_key'] == spec[:key] ||
        glossary_terms(row).any? { |term| term.casecmp?(spec[:english]) }
    end
    raise "multiple glossary owners for #{spec[:english]}" if owners.length > 1

    owner = owners.first
    existing_key = owner ? owner.fetch('entity_key') : spec.fetch(:key)
    glossary.each do |row|
      next if row['entity_key'] == existing_key
      overlap = glossary_terms(row).map(&:downcase) & terms(spec).map(&:downcase)
      raise "alias collision #{spec[:english]} / #{row['entity_key']}: #{overlap.inspect}" unless overlap.empty?
    end
    if owner
      raise "unconfirmed/non-person owner #{existing_key}" unless
        owner['category'] == 'person' && owner['status'] == 'confirmed'
      canonical = spec[:units].find { |part| part[:english].casecmp?(owner['english_canonical']) }
      raise "unreviewed registered canonical #{existing_key}" unless canonical &&
        owner['korean_canonical'] == "#{canonical[:korean]}(#{owner['english_canonical']})"
    end
    definition = owner ? owner.dup : glossary.first.keys.zip(Array.new(glossary.first.keys.length, '')).to_h
    definition.merge!(
      'entity_key' => existing_key,
      'english_canonical' => owner ? owner['english_canonical'] : spec[:english],
      'category' => 'person',
      'korean_canonical' => owner ? owner['korean_canonical'] : "#{spec[:korean]}(#{spec[:english]})",
      'status' => 'confirmed'
    )
    definition['english_aliases'] = ([
      *definition['english_aliases'].to_s.split('|'), *terms(spec)
    ]).uniq.reject { |value| value.casecmp?(definition['english_canonical']) }.join('|')
    definition['korean_variants'] = ([
      *definition['korean_variants'].to_s.split('|'),
      *spec[:units].flat_map { |part| part[:forms] }.reject { |form| form.include?('(') }
    ]).reject(&:empty?).uniq.join('|')
    definition['evidence_ids'] = ([*definition['evidence_ids'].to_s.split('|'), *spec[:evidence].split('|')])
      .reject(&:empty?).uniq.join('|')
    note = "People continuation context review: #{spec[:identity]}"
    definition['notes'] = [definition['notes'].to_s, note].reject(&:empty?).uniq.join(' ')
    [definition, spec.merge(key: existing_key)]
  end

  def source_texts(row)
    [
      JSON.parse(row.fetch('en_texts_json')).compact.join("\n"),
      JSON.parse(row.fetch('ja_texts_json')).compact.join("\n"),
      row.fetch('zh_text').to_s
    ]
  end

  def source_guard!(generated, sources)
    keys = generated.map { |row| ReviewedNameBatches.key(row) }.uniq.sort_by { |r, id, v| [r, id.to_i, v] }
    values = keys.map do |key|
      source = sources.fetch(key)
      [key, JSON.parse(source.fetch('en_texts_json')).compact,
       JSON.parse(source.fetch('ja_texts_json')).compact, source.fetch('zh_text').to_s]
    end
    raise 'reviewed people source scope changed; inspect new contexts before continuing' unless
      generated.length == SOURCE_MATCHES && keys.length == SOURCE_ROWS &&
      Digest::SHA256.hexdigest(JSON.generate(values)) == SOURCE_SHA256
  end

  def inside_markup?(text, position)
    prefix = text[0...position]
    prefix.count('(') > prefix.count(')') || prefix.count('{') > prefix.count('}') ||
      prefix.count('$').odd?
  end

  def overlaps?(a, b)
    a[0] < b[1] && b[0] < a[1]
  end

  def normalize_quotes(text)
    text.tr("\u2018\u2019", "''").downcase
  end

  def supported_label?(label, english, part)
    part[:source_terms].any? { |term| english_hit?(label, term) } &&
      (normalize_quotes(english).include?(normalize_quotes(label)) ||
       normalize_quotes(label) == normalize_quotes(part[:english]))
  end

  def protected_full_names(text, glossary, spec)
    glossary.flat_map do |row|
      next [] if row['entity_key'] == spec[:key]
      next [] unless glossary_terms(row).any? { |term| term.include?(' ') }
      forms = [row['korean_canonical'].to_s.split('(').first,
               *row['korean_variants'].to_s.split('|')].compact
      forms.select { |form| form.include?(' ') && !form.include?('(') }.flat_map do |form|
        pattern = /(?<![가-힣])#{Regexp.escape(form)}(?=#{SUFFIX}(?![가-힣]))/
        text.to_enum(:scan, pattern).map { [Regexp.last_match.begin(0), Regexp.last_match.end(0)] }
      end
    end
  end

  def normalize(text, english, spec, row_key, glossary)
    if spec[:key] == 'person:clary-ansilla'
      return [text, 'excluded', 'Mistress Clary names a different orphanage proprietor; English/JA/ZH do not identify her as Clary Ansilla.'] if
        row_key == ['base', '3637', '11']
      return [text, 'uncertain', 'Old Lady Clary is the last bride of House Ansilla, whereas the full-name rows include the first Clary Ansilla. JA/ZH do not resolve which historical bearer this is; do not conflate identities.'] if
        row_key == ['default', '35294', '']
    end
    visible = english.gsub(/\$[^$]*\$|\{[^{}]*\}/, ' ')
    return [text, 'excluded', 'Only an opaque English token matches; no visible personal-name mention.'] unless
      terms(spec).any? { |term| english_hit?(visible, term) }

    old = text
    text = text.dup
    notes = []
    if spec[:key] == 'person:egan' && row_key == ['default', '7961', '']
      before = '이건 형제 이건(Brother Egan)이오.'
      after = '에간 형제(Brother Egan)이오.'
      return [old, 'uncertain', 'The reviewed duplicated Egan label changed; focused re-review is required.'] unless
        text == before || text == after
      text = after
      notes << 'Removed the duplicated name in the standalone Brother Egan label; retained the full English title/name.'
    elsif spec[:key] == 'person:egan' && row_key == ['default', '34437', '']
      if text.include?('게건 그저')
        text = text.sub('게건 그저', '에간(Egan)은 그저')
        notes << 'Repaired the reviewed 게건 typo in the clause explicitly naming Egan as a tool.'
      end
    end

    occupied = protected_full_names(text, glossary, spec)
    patches = []
    found = false
    unsafe = false
    matched_units = []
    spec[:units].sort_by { |part| -part[:korean].length }.each do |part|
      next unless part[:source_terms].any? { |term| english_hit?(visible, term) } ||
        (part[:english] == spec[:english] && visible.match?(/[A-Za-z]/))
      alternatives = part[:forms].sort_by { |form| -form.length }.map { |form| Regexp.escape(form) }.join('|')
      pattern = /(?<![가-힣])(?:#{alternatives})(?=#{SUFFIX}(?![가-힣]))/
      text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.each do |match|
        start_at, finish = match.begin(0), match.end(0)
        next if inside_markup?(text, start_at) || occupied.any? { |span| overlaps?(span, [start_at, finish]) }
        # In this sentence only the later 에간 is a name; initial 이건 is "this".
        next if spec[:key] == 'person:egan' && row_key == ['default', '41033', ''] &&
          match[0] == '이건' && start_at.zero?

        tail = text[finish..].to_s
        immediate = tail.match(/\A[ \t]*\((?<label>[^()\r\n]*)\)/)
        bridge = tail.match(/\A(?<bridge>[가-힣 \t]{1,60})\((?<label>[^()\r\n]*)\)/)
        replacement = part[:korean]
        if immediate
          unless supported_label?(immediate[:label], visible, part)
            unsafe = true
            next
          end
          finish += immediate.end(0)
          replacement += immediate[0]
        elsif bridge && supported_label?(bridge[:label], visible, part) &&
              !bridge[:bridge].match?(pattern)
          # Edit the spelling only. The later annotation covers the whole
          # title/possessive compound, but cannot cover another repeated name.
          notes << "Retained complete bilingual compound (#{bridge[:label]})."
        elsif tail.start_with?('(')
          unsafe = true
          next
        else
          replacement += "(#{part[:english]})"
        end
        occupied << [start_at, finish]
        patches << [start_at, finish, replacement]
        matched_units << part[:english]
        found = true
      end
    end
    if spec[:english].include?(' ') && english_hit?(visible, spec[:english]) &&
       !matched_units.include?(spec[:english])
      unsafe = true
      notes << 'A complete source personal name lacks a safely matched complete Korean name; do not label its components instead.'
    end
    if unsafe || (!found && text == old)
      return [old, 'uncertain', (notes + ['The reviewed identity is supported, but a Korean name span or its adjacent annotation cannot be safely resolved; leave this entity unchanged.']).join(' ')]
    end
    patches.sort_by { |start_at, _finish, _value| -start_at }.each do |start_at, finish, value|
      text[start_at...finish] = value
    end
    status = text == old ? 'not-an-issue' : 'accepted'
    [text, status, notes.uniq.join(' ')]
  end

  def token_skeleton(text)
    text.scan(/\{[^{}]*\}|\$[^$]*\$/)
  end

  def run(start_d)
    raise 'START_D must be positive' unless start_d.positive?
    m = ReviewedNameBatches
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary_table = m.table(glossary_path)
    glossary = glossary_table.map(&:to_h)
    resolved = SPECS.map { |spec| register_definition(spec, glossary) }
    definitions = resolved.map(&:first)
    specs = resolved.map(&:last).to_h { |spec| [spec[:key], spec] }
    raise 'duplicate resolved people identities' unless specs.length == SPECS.length
    registered_keys = definitions.map { |row| row['entity_key'] }
    updated_glossary = glossary.reject { |row| registered_keys.include?(row['entity_key']) } + definitions

    inventory = m.refresh_inventory.values
    sources = inventory.to_h { |row| [m.key(row), row.to_h] }
    generated = build_occurrences(inventory, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    raise 'duplicate generated entity/row keys' unless
      generated.map { |row| [row['entity_key'], *m.key(row)] }.uniq.length == generated.length
    source_guard!(generated, sources)

    index_table = m.table(m::INDEX)
    index = index_table.map(&:to_h)
    indexed = index.to_h { |row| [[row.fetch('entity_key'), *m.key(row)], row] }
    raise 'duplicate indexed entity/row keys' unless indexed.length == index.length
    additions = generated.reject { |row| indexed.key?([row['entity_key'], *m.key(row)]) }
    pending = generated.select do |row|
      existing = indexed[[row['entity_key'], *m.key(row)]]
      !existing || existing['status'] == 'needs-context'
    end

    reviews = pending.group_by { |row| m.key(row) }.map do |row_key, occurrences|
      source = sources.fetch(row_key)
      english, japanese, chinese = source_texts(source)
      raise "missing aligned JA/ZH at #{row_key.inspect}" if japanese.empty? || chinese.empty?
      old = source.fetch('work_text')
      text = old.dup
      dispositions = {}
      evidence = []
      occurrences.sort_by { |row| row['entity_key'] }.each do |occurrence|
        entity = occurrence.fetch('entity_key')
        spec = specs.fetch(entity)
        text, status, detail = normalize(text, english, spec, row_key, updated_glossary)
        dispositions[entity] = status
        evidence << "#{entity} / #{row_key.join(':')}: #{spec[:identity]} #{detail}"
      end
      raise "changed tokens/line breaks at #{row_key.inspect}" unless
        token_skeleton(old) == token_skeleton(text) && old.scan(/\r\n|\r|\n/) == text.scan(/\r\n|\r|\n/)
      status = if text != old
                 'accepted'
               elsif dispositions.value?('uncertain')
                 'uncertain'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      {
        'resource' => row_key[0], 'ID_Linha' => row_key[1], 'Tipo_Variante' => row_key[2],
        'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
        'old' => old, 'new' => text, 'evidence' => evidence.join(' '),
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
    raise 'duplicate reviewed row keys' unless reviews.map { |row| m.key(row) }.uniq.length == reviews.length
    raise 'non-accepted edit' unless reviews.all? { |row| row['status'] == 'accepted' || row['old'] == row['new'] }

    # All registration and application is deferred until the main runner invokes
    # this script. Existing terminal dispositions are never reopened here.
    m.write_table(glossary_path, glossary_table.headers, updated_glossary)
    m.write_table(m::INDEX, index_table.headers, index + additions)
    out = File.join(__dir__, 'proper-name-reviewed-people-continuation.tsv')
    m.write_table(out, m::HEADERS, reviews)
    puts "People: #{SPECS.length} identities; source matches=#{generated.length}, source rows=#{SOURCE_ROWS}; pending matches=#{pending.length}, pending rows=#{reviews.length}; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
    m.run(out, start_d, 50) unless reviews.empty?
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-proper-name-people-continuation.rb START_D' unless ARGV.length == 1
  PeopleContinuationReview.run(Integer(ARGV.fetch(0)))
end
