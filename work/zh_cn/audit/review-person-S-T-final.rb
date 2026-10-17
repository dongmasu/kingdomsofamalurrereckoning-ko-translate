#!/usr/bin/env ruby
require 'csv'
require 'json'
require_relative 'review-person-N-R-final'
require_relative 'continue-proper-name-reviewed-batches'

module PersonSTFinalReview
  AUDIT = __dir__
  OUTPUT = File.join(AUDIT, 'proper-name-reviewed-S-T-final.tsv')
  EXTRA = {
    'sammoc' => %w[새먹 삼목 사목], 'skoria' => %w[스콜리아],
    'straton' => %w[스트래턴], 'taibreah' => %w[타이브리어 타이브레아 테이브리아 태브리아],
    'talibor' => %w[탈리보어 타리보르], 'tari' => %w[티리],
    'teiner' => %w[테이너], 'tenhwa' => %w[텐와],
    'thaddeus' => %w[태디우스], 'thelgood' => %w[텔굿 델굿],
    'tilera' => %w[티레라 티레이라], 'trav' => %w[트래브]
  }.freeze
  # These exact compound counterparts were read in the aligned S-T rows.
  COMPOUNDS = {
    'Marga Sammoc' => ['마르가 새목', '마르가 새먹', '마르가 삼목', '마르가 사목'],
    'Driadore Sele' => ['드리아도레 셀레', '드리아도르 셀레', '드리아도어 셀레'],
    'Selni Peliad' => ['셀니 펠리아드', '셀니 펠리아드(Peliad)'],
    'Sinon Carrag' => ['시논 카라그', '시논 캐랙'],
    'Sorli Golgoti' => ['솔리 골고티'],
    'Stella Collins' => ['스텔라 콜린스'],
    'Sverri Kura' => ['스베리 쿠라'],
    'Tak Edstar' => ['탁 에드스타', '탁 에드스타(Edstar)'],
    'Tal Cathan' => ['탈 카탄'],
    'Irion Tal' => ['이리온 탈'],
    'Tanra Wyvyrn-Gifre' => ['탄라 와이번-기프레'],
    'Tanra Wyvyrn' => ['탄라 와이번'],
    'Tanra Gifre' => ['탄라 기프르'],
    'Tarca Hymn-Herald' => ['타르카 힘-헤럴드'],
    'Azariah Teague' => ['아자리아 티그'],
    'Ergrith Teague' => ['에르그리스 티그'],
    'Esklad Teiner' => ['에스클라드(Esklad) 타이너', '에스클라드 타이너', '에스크라드 타이너'],
    'Winred Teiner' => ['윈레드 타이너'],
    'Eli Tems' => ['엘리 템스', '에리 템스'],
    'Francois Tennes' => ['프랑수아 테네스'],
    'Orcha Tetran' => ['오르차(Orcha) 테트란', '오르차 테트란'],
    'Han Tetran' => ['한 테트란'],
    'Thaddeus Holn' => ['태디어스 홀른', '태디우스 홀른', '새디어스 홀른'],
    'Tari Holstig' => ['타리 홀스티그', '티리 홀스티그'],
    'Thelgood Skoria' => ['셀굿 스코리아', '텔굿 스코리아', '델굿 스코리아'],
    'Adath Skoria' => ['아다스 스코리아', '아다스 스콜리아', '애더스 스코리아'],
    'Hama Skoria' => ['하마 스코리아'],
    'Red Thombrum' => ['레드 톰브럼'],
    'Bayala Tirin' => ['바얄라 티린'],
    'Tefroy Tarion' => ['테프로이 타리온'],
    'T. Tarion' => ['T. 타리온'],
    'Eriad Talibor' => ['에리아드(Eriad) 탈리보르', '에리아드 탈리보르',
                        '에리앗 탈리보르', '에리어드 탈리보르'],
    'Desiderus Trav' => ['데시데루스(Desiderus) 트라브', '데시데루스 트라브', '데시데루스 트래브'],
    'General Tilera ap Gwydion' => ['틸레라 아프 그위디온 장군'],
    'General Tilera' => ['틸레라 장군', '틸레라(Tilera) 장군',
                         '티레라 장군', '티레라(Tilera) 장군',
                         '티레이라 장군'],
    'High King Titarion' => ['대왕 티타리온', '최고왕 티타리온', '지고왕 티타리온',
                            '하이 킹 티타리온', '티타리온 대왕', '티타리온 고왕',
                            '대왕 티타리온(Titarion)', '최고왕 티타리온(Titarion)',
                            '티타리온(Titarion) 대왕'],
    'King Titarion' => ['티타리온 왕', '티타리온(Titarion) 왕'],
    'Lord Saramer' => ['사라머(Saramer) 경'],
    'Sir Tarca' => ['타르카 경'],
    'Head Gaoler Tennes' => ['수석 간수 테네스'],
    'Savant Red Thombrum' => ['사반트 레드 톰브럼'],
    'Captain Desiderus Trav' => ['데시데루스(Desiderus) 트라브 선장'],
    'Master Straton' => ['스트래턴 사부', '스트라톤 선생']
  }.freeze
  SKORIA_NONPERSON = %w[
    3578 3701 7110 9555 9853 12639 16854 17112 17466 18909 21534 22573
    25040 27471 27539 28182 30033 33318 36696 37352 37934 38092 38817
    38986 39106 40598 40943 41236 41554 43328 45744 47405 47939 49420
    49427 54225 55666 56178 60387 60729 62507 64266 64282
  ].freeze
  OTHER_NONPERSON = {
    ['base', '1854'] => 'Thelgood Inn is a named inn, not a direct person reference.',
    ['base', '4629'] => 'Teiner Home is a household/place label, not an individual.',
    ['base', '2185'] => 'Tenhwa Library is a place label.',
    ['base', '3445'] => 'Tenhwa Library is a place label.',
    ['default', '39444'] => "Sele's Emporium Alchemical is a shop/institution label.",
    ['default', '61626'] => "Secandra's Camp is a camp/location label.",
    ['default', '45391'] => 'Tilera Redeemed is a complete quest-title label.',
    ['default', '64761'] => 'Tilera Condemned is a complete quest-title label.',
    ['default', '11936'] => "Sagrell's Wile is a complete named work/title.",
    ['default', '53471'] => 'The Song of Sir Sagrell is a complete song title.'
  }.freeze
  JA_STEMS = {
    'sagrell' => %w[サグレル], 'sammoc' => %w[サモック], 'saramer' => %w[サラマー],
    'secandra' => %w[セカンドラ], 'sele' => %w[セレ], 'selni' => %w[セルニ],
    'seterlu' => %w[セタール], 'shirin' => %w[シリン], 'sinon' => %w[シノン],
    'skoria' => %w[スコーリア], 'sorli' => %w[ソルリ], 'stella' => %w[ステラ],
    'straton' => %w[ストラトン], 'sverri' => %w[スヴェリ], 'taibreah' => %w[タイブリー],
    'tak' => %w[タク], 'tal' => %w[タール], 'talibor' => %w[タリボー],
    'tanra' => %w[タンラ], 'tarca' => %w[ターカ], 'tari' => %w[タリ],
    'tarion' => %w[タリオン], 'teague' => %w[ティーグ], 'teiner' => %w[テイナー],
    'tems' => %w[テムス], 'tenhwa' => %w[テンワ], 'tennes' => %w[テネス],
    'terenia' => %w[テレニア], 'tetran' => %w[テトラン], 'thaddeus' => %w[サディアス],
    'thelgood' => %w[セルグッド], 'thombrum' => %w[ソンブラム],
    'tilera' => %w[ティレイラ], 'tirin' => %w[ティリン], 'titarion' => %w[ティタリオン],
    'trav' => %w[トラブ], 'tyr' => %w[ティア]
  }.freeze
  module_function

  def load_scope
    index = CSV.read(File.join(AUDIT, 'proper-name-occurrences.tsv'), headers: true, col_sep: "\t")
    inventory = CSV.read('/private/tmp/proper-name-source-inventory.tsv', headers: true, col_sep: "\t")
    glossary = CSV.read(File.join(AUDIT, 'proper-name-glossary.tsv'), headers: true, col_sep: "\t")
    pending = index.select { |r| r['status'] == 'needs-context' && r['entity_key'].match?(/\Aperson:[st]/i) }
    [pending, inventory.to_h { |r| [PersonNRFinalReview.key(r), r] },
     glossary.to_h { |r| [r['entity_key'], r] }]
  end

  def excerpts(text, pattern, width = 95)
    hits = []
    text.to_enum(:scan, pattern).each do
      m = Regexp.last_match
      a = [0, m.begin(0) - width].max
      b = [text.length, m.end(0) + width].min
      next if hits.any? { |x| a >= x[0] && b <= x[1] }
      hits << [a, b]
    end
    return text[0, width * 2] if hits.empty?
    hits.map { |a, b| text[a...b] }.join(' ... ')
  end

  def inspect_scope
    pending, sources, glossary = load_scope
    groups = pending.group_by { |r| r['entity_key'] }.sort
    selected = ARGV[1].to_s.split(',')
    groups.each do |entity_key, rows|
      next unless selected.empty? || selected.include?(entity_key.sub('person:', ''))
      entity = glossary.fetch(entity_key)
      puts "\n#{entity_key} #{rows.length} #{entity['korean_canonical']}"
      rows = rows.drop(ARGV[2].to_i)
      rows = rows.take(ARGV[3].to_i) if ARGV[3]
      rows.each do |o|
        s = sources.fetch(PersonNRFinalReview.key(o))
        en, ja, zh, ko = PersonNRFinalReview.row_texts(s)
        term = entity.fetch('english_canonical')
        pattern = /(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i
        ko_pattern = /#{Regexp.union(PersonNRFinalReview.forms(entity))}/
        puts [s['resource'], s['ID_Linha'], excerpts(en, pattern, 60),
              ja[0, 65], zh[0, 65], excerpts(ko, ko_pattern, 70)].to_json
      end
    end
  end

  def forms(entity)
    short = entity['entity_key'].sub('person:', '')
    (PersonNRFinalReview.forms(entity) + EXTRA.fetch(short, [])).uniq.sort_by { |f| -f.length }
  end

  def excluded_reason(entity, source, english)
    short = entity['entity_key'].sub('person:', '')
    r, id, = PersonNRFinalReview.key(source)
    if short == 'skoria'
      return 'The aligned base label identifies the family, mine, deed, or mine door, not an individual.' if
        r == 'base' && %w[340 1091 1526 2331].include?(id)
      return 'EN identifies Skoria as the mine, family, family member/collective, land, or property; JA/ZH context confirms non-individual usage.' if
        r == 'default' && SKORIA_NONPERSON.include?(id)
    end
    if short == 'tirin'
      personal = english.gsub(/\bTirin(?:'s|’s)\s+(?:Rest|Sanctuary|Tree|Secret|Bloody Unrest)\b/i, '')
      return 'Every EN Tirin hit belongs to the complete place/institution/quest-title compound; retain Korean and any existing full bilingual label atomically.' unless
        personal.match?(/\bTirin\b/i)
    end
    OTHER_NONPERSON[[r, id]]
  end

  def lexical?(text, term)
    text.match?(/(?<![A-Za-z0-9_])#{Regexp.escape(term)}(?![A-Za-z0-9_])/i)
  end

  def label_spans(text, term)
    spans = []
    text.to_enum(:scan, /(?:[가-힣]+(?:[ \t-]+[가-힣]+){0,5}|T\.[ \t]+[가-힣]+)\([^()\r\n]+\)/).each do
      m = Regexp.last_match
      annotation = m[0][/\(([^()]*)\)/, 1]
      spans << [m.begin(0), m.end(0), annotation] if lexical?(annotation, term)
    end
    spans
  end

  def normalize(text, entity, source, english)
    short = entity['entity_key'].sub('person:', '')
    canonical = entity['korean_canonical'].split('(').first
    term = entity['english_canonical']
    updated = text.dup
    found = false

    # Preserve complete labels, including non-person compounds in mixed rows.
    protected = []
    COMPOUNDS.sort_by { |en, _| -en.length }.each do |en, counterparts|
      next unless lexical?(en, term) && lexical?(english, en)
      counterparts.sort_by { |ko| -ko.length }.each do |ko|
        complete_labels = label_spans(updated, term)
        matcher = /#{Regexp.escape(ko)}(?:[ \t]*\(([^()\r\n]*)\))?/
        updated = updated.gsub(matcher) do |hit|
          m = Regexp.last_match
          existing = m[1]
          next hit if existing && !lexical?(existing, term)
          next hit if !ko.include?('(') && complete_labels.any? { |a, b, _label| m.begin(0) >= a && m.end(0) <= b }
          # A complete existing source title stays complete; only redundant
          # component labels preceding it are folded into that same label.
          label = existing || en
          next hit if existing && !ko.include?('(')
          found = true
          plain = hit.gsub(/\([^()]*\)/, '')
          forms(entity).each { |f| plain = plain.gsub(f, canonical) }
          "#{plain}(#{label})"
        end
      end
    end

    if short == 'tilera'
      updated = updated.gsub(/\{\*1(?:틸레라|티레라) 장군\}/) do |token|
        found = true
        '{*1틸레라 장군(General Tilera)}'
      end
    end

    # An annotation covers its whole Korean compound, not just its last word.
    protected = label_spans(updated, term)
    found ||= !protected.empty?
    replacements = []
    forms(entity).each do |f|
      spans = PersonNRFinalReview.safe_spans(updated, f)
      updated.to_enum(:scan, /(?<![가-힣])#{Regexp.escape(f)}(?=라면|여[, .]|야말로|입니다)/).each do
        m = Regexp.last_match
        spans << [m.begin(0), m.end(0), nil, m.end(0)]
      end
      spans.uniq.each do |a, b, _p, _q|
        next if replacements.any? { |x| a < x[1] && x[0] < b }
        prefix = updated[0...a]
        next if prefix.count('(') > prefix.count(')') || prefix.count('{') > prefix.count('}')
        if short == 'tirin' && updated[b..].match?(/\A의[ \t]+(?:안식처|쉼터|성소|성역|나무|비밀|피비린내)/)
          next
        end
        if short == 'skoria' && updated[b..].match?(/\A[ \t]+(?:광산|가문)/)
          next
        end
        found = true
        inside = protected.find { |x| a >= x[0] && b <= x[1] }
        if inside
          next if f == canonical
          replacements << [a, b, canonical]
          next
        end
        annotation = /\A[ \t]*\([^()\r\n]*\)/.match(updated[b..])
        return [text, "Unmatched Korean parenthetical after #{f}; full counterpart needs separate confirmation."] if
          annotation && !lexical?(annotation[0], term)
        finish = annotation ? b + annotation[0].length : b
        particle, particle_end = PersonNRFinalReview.particle_after(updated, finish)
        ending = particle ? PersonNRFinalReview.corrected_particle(particle, canonical) : ''
        label = annotation ? annotation[0] : "(#{term})"
        replacements << [a, particle_end, "#{canonical}#{label}#{ending}"]
      end
    end
    replacements.sort_by { |a, _b, _t| -a }.each { |a, b, value| updated[a...b] = value }
    return [text, 'EN personal reference is clear, but no reviewed Korean counterpart is present; no translation invented.'] unless found
    [updated, nil]
  end

  def corroboration(entity, ja, zh)
    short = entity['entity_key'].sub('person:', '')
    term = entity['english_canonical']
    ja_match = JA_STEMS.fetch(short).find { |stem| ja.include?(stem) }
    ja_match ||= term if lexical?(ja, term)
    detail = ja_match ? "JA contains #{ja_match.inspect}" : 'JA has no matching name (omission/misalignment); EN remains primary'
    "#{detail}; aligned ZH=#{zh.inspect}."
  end

  def build
    pending, sources, glossary = load_scope
    raise 'scope changed unexpectedly' unless pending.length == 1093 && pending.group_by { |r| PersonNRFinalReview.key(r) }.length == 1084
    output = []
    pending.group_by { |r| PersonNRFinalReview.key(r) }.each do |key, occurrences|
      source = sources.fetch(key)
      en, ja, zh, old = PersonNRFinalReview.row_texts(source)
      new_text = old.dup
      dispositions = {}
      evidence = []
      occurrences.sort_by { |r| r['entity_key'] }.each do |o|
        entity = glossary.fetch(o['entity_key'])
        raise 'unconfirmed entity' unless entity['status'] == 'confirmed'
        entity_key = o['entity_key']
        reason = excluded_reason(entity, source, en)
        if reason
          status = 'excluded'
        elsif entity_key == 'person:skoria' && en.strip.casecmp('Skoria').zero?
          status = 'uncertain'
          reason = 'The isolated EN/JA/ZH Skoria topic/name label supplies no individual-versus-family/mine referent. Korean counterpart exists and is already paired, but personal-entity classification remains unconfirmed; retain exact text.'
        elsif entity_key == 'person:sagrell'
          raise "Sagrell prior review no longer matches #{key}" unless old.include?('사그렐') && old.match?(/\([^()]*Sagrell[^()]*\)/i)
          status = 'not-an-issue'
          reason = 'D-20387 already reviewed this aligned row; canonical Sagrell and the full name/title label are retained without component insertion.'
        elsif !lexical?(en, entity['english_canonical'])
          status = 'excluded'
          reason = 'The index hit is not a lexical personal name in the aligned EN text.'
        else
          proposed, problem = normalize(new_text, entity, source, en)
          if problem
            status = 'uncertain'
            reason = problem
          elsif proposed == new_text
            status = 'not-an-issue'
            reason = 'Context identifies the individual; Korean canonical form and complete source-supported bilingual label are already present.'
          else
            status = 'accepted'
            reason = 'Context identifies the individual; normalize reviewed Korean variants and pair unannotated names/full compounds atomically, preserving existing full labels.'
            new_text = proposed
          end
        end
        dispositions[entity_key] = status
        evidence << "#{entity_key}: #{reason} EN=#{excerpts(en, /#{Regexp.escape(entity['english_canonical'])}/i, 90).inspect}; #{corroboration(entity, ja, zh)}"
      end
      if key == ['default', '32891', '']
        evidence << 'Existing malformed Gwyn Anwy labels are outside S-T scope and are retained byte-for-byte; this decision covers Sverri only.'
      end
      if %w[17783 20582 53913].include?(key[1])
        evidence << 'The {*1...} span contains translated display text, not an opaque placeholder; retain its style code while normalizing the whole General Tilera label.'
      end
      statuses = dispositions.values
      overall = if statuses.include?('accepted')
                  'accepted'
                elsif statuses.include?('uncertain')
                  'uncertain'
                elsif statuses.include?('not-an-issue')
                  'not-an-issue'
                else
                  'excluded'
                end
      raise "token change #{key}" unless ProperNameCellEditor.tokens(old) == ProperNameCellEditor.tokens(new_text)
      raise "line breaks changed #{key}" unless old.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)
      raise "accepted no-op #{key}" if overall == 'accepted' && old == new_text
      raise "unexpected edit #{key}" if overall != 'accepted' && old != new_text
      output << ReviewedNameBatches::HEADERS.zip([
        *key, dispositions.keys.sort.join('|'), overall, old, new_text,
        "S-T aligned row review #{key.join(':')}. #{evidence.join(' ')}",
        en, ja, zh, JSON.generate(dispositions), '', ''
      ]).to_h
    end
    output.sort_by { |r| [r['resource'], r['ID_Linha'].to_i, r['Tipo_Variante']] }
  end

  def run
    rows = build
    if ARGV.first == '--format'
      # apply_patch normalizes physical patch lines. Restore CSV record and
      # embedded source line endings without changing any reviewed content.
      patched = CSV.read(OUTPUT, headers: true, col_sep: "\t")
      raise 'formatting changed schema/count' unless patched.headers == ReviewedNameBatches::HEADERS && patched.length == rows.length
      patched.each_with_index do |r, i|
        ReviewedNameBatches::HEADERS.each do |h|
          raise "content changed before format #{i} #{h}" unless
            r[h].to_s.gsub("\r\n", "\n") == rows[i][h].to_s.gsub("\r\n", "\n")
        end
      end
      ReviewedNameBatches.write_table(OUTPUT, ReviewedNameBatches::HEADERS, rows)
      puts 'Restored only exact source/CSV line-ending serialization.'
    elsif ARGV.first == '--patch'
      require 'stringio'
      buffer = StringIO.new
      csv = CSV.new(buffer, col_sep: "\t", row_sep: "\n", force_quotes: true)
      csv << ReviewedNameBatches::HEADERS
      rows.each { |r| csv << ReviewedNameBatches::HEADERS.map { |h| r[h] } }
      puts "*** Begin Patch\n*** Add File: #{OUTPUT}"
      buffer.string.each_line { |line| print "+#{line}" }
      puts '*** End Patch'
    else
      puts "rows=#{rows.length} entities=#{rows.flat_map { |r| r['entity_key'].split('|') }.uniq.length}"
      puts "row_statuses=#{rows.group_by { |r| r['status'] }.transform_values(&:length)}"
      puts "entity_statuses=#{rows.flat_map { |r| JSON.parse(r['entity_dispositions_json']).values }.group_by { |s| s }.transform_values(&:length)}"
      rows.each do |r|
        next unless r['status'] == 'uncertain' || ARGV.first == '--changes' && r['old'] != r['new']
        puts [r['resource'], r['ID_Linha'], r['entity_key'], r['status'], r['old'], r['new'], r['evidence']].to_json
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  ARGV.first == '--inspect' ? PersonSTFinalReview.inspect_scope : PersonSTFinalReview.run
end
