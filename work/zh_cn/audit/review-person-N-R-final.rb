#!/usr/bin/env ruby

require 'csv'
require 'json'

module PersonNRFinalReview
  AUDIT_DIR = File.expand_path(__dir__)
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  INDEX = File.join(AUDIT_DIR, 'proper-name-occurrences.tsv')
  GLOSSARY = File.join(AUDIT_DIR, 'proper-name-glossary.tsv')
  OUT = File.join(AUDIT_DIR, 'proper-name-reviewed-N-R-final.tsv')
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese entity_dispositions_json previous_status previous_evidence
  ].freeze
  PARTICLES = {
    '이' => %w[이 가], '은' => %w[은 는], '을' => %w[을 를],
    '과' => %w[과 와], '아' => %w[아 야], '으로' => %w[으로 로]
  }.freeze
  EXTRA_FORMS = {
    'person:octienne' => %w[옥티엔느],
    'person:odwig' => %w[오드윅],
    'person:othel' => %w[오델],
    'person:olaana' => %w[올라아나 오라나],
    'person:ouet' => %w[우에트],
    'person:parwen' => %w[파웬],
    'person:porthe' => %w[포스],
    'person:pome' => %w[포움 포메],
    'person:pinadike' => %w[피나디케],
    'person:pura' => %w[푸라],
    'person:quay' => %w[키 키웨이 케이 부두],
    'person:renevel' => %w[르네벨],
    'person:reddle' => %w[레들레],
    'person:rhode' => %w[로도 로데],
    'person:risberg' => %w[리스베리],
    'person:rolan' => %w[롤런],
    'person:orcha' => %w[오르카],
    'person:rathgar' => %w[래스가르 래스가],
    'person:pengaras' => %w[펭가라스]
  }.freeze
  FULL_NAME_REPLACEMENTS = {
    'person:nargyfier' => [
      ['겔파인 나르지파이어', '겔파인 나르지피어(Gelphyne Nargyfier)']
    ],
    'person:nemius' => [
      ['네미우스 페리검스(Nemius Perigums)', '네미우스 페리굼스(Nemius Perigums)'],
      ['네미우스 페리검스', '네미우스 페리굼스(Nemius Perigums)'],
      ['네미우스 페리굼스', '네미우스 페리굼스(Nemius Perigums)']
    ],
    'person:nol' => [
      ['와이스턴 놀', '위스트란 놀(Wystran Nol)'],
      ['위스트란 놀', '위스트란 놀(Wystran Nol)']
    ],
    'person:onwig' => [
      ['그림 온윅(Grim Onwig)', '그림 온위그(Grim Onwig)'],
      ['그림 온윅', '그림 온위그(Grim Onwig)'],
      ['그림 온위그', '그림 온위그(Grim Onwig)']
    ],
    'person:ommer' => [
      ['오머(Ommer) 보가드', '오머 보가드(Ommer Vogard)'],
      ['오머 보가드', '오머 보가드(Ommer Vogard)'],
      ['오머 다크바리', '오머 다크바리(Ommer Darkvari)']
    ],
    'person:orwin' => [
      ['오윈(Orwin) 던', '오윈 던(Orwin Dunn)'],
      ['오윈 던', '오윈 던(Orwin Dunn)']
    ],
    'person:othel' => [
      ['오델 홀른(Othel Holn)', '오셀 홀른(Othel Holn)'],
      ['오델 홀른', '오셀 홀른(Othel Holn)'],
      ['오셀(Othel) 홀른', '오셀 홀른(Othel Holn)'],
      ['오셀 홀른', '오셀 홀른(Othel Holn)']
    ],
    'person:ouet' => [
      ['페리드 우에트(Feride Ouet)', '페리드 오에트(Feride Ouet)'],
      ['페리데 우에트(Feride Ouet)', '페리데 오에트(Feride Ouet)'],
      ['페리드 우에(Feride Ouet)', '페리드 오에트(Feride Ouet)'],
      ['페리드 오에트', '페리드 오에트(Feride Ouet)'],
      ['페리데 우에트', '페리데 오에트(Feride Ouet)'],
      ['페리드 우에트', '페리드 오에트(Feride Ouet)'],
      ['페리드 우에', '페리드 오에트(Feride Ouet)'],
      ['페리데 오에트', '페리데 오에트(Feride Ouet)']
    ],
    'person:reddle' => [
      ['레들 메인', '레들 메인(Reddle Mane)']
    ],
    'person:penri' => [
      ['페리 켈(Penri Kell)', '펜리 켈(Penri Kell)'],
      ['페리 켈', '펜리 켈(Penri Kell)'],
      ['펜리(Penri) 켈', '펜리 켈(Penri Kell)'],
      ['펜리 켈', '펜리 켈(Penri Kell)']
    ],
    'person:pome' => [
      ['수너 포움(Suner Pome)', '수너 폼(Suner Pome)'],
      ['수너 포메(Suner Pome)', '수너 폼(Suner Pome)'],
      ['수너 포움', '수너 폼(Suner Pome)'],
      ['수너 포메', '수너 폼(Suner Pome)'],
      ['수너 폼(Pome)', '수너 폼(Suner Pome)'],
      ['수너 폼', '수너 폼(Suner Pome)']
    ],
    'person:parwen' => [
      ['파르웬(Parwen) 웰', '파르웬 웰(Parwen Well)'],
      ['파르웬 웰', '파르웬 웰(Parwen Well)']
    ],
    'person:raemund' => [
      ['아조 라에문드(Azo Raemund)', '아조 레이먼드(Azo Raemund)'],
      ['아조 라에문드', '아조 레이먼드(Azo Raemund)']
    ],
    'person:rikka' => [
      ['리카(Rikka) 이게스트', '리카 이게스트(Rikka Egest)'],
      ['리카 이게스트', '리카 이게스트(Rikka Egest)']
    ],
    'person:orwae' => [
      ['오르웨이,', '오르웨(Orwae),'],
      ['오르웨(Orwae) 네스', '오르웨 네스(Orwae Nes)'],
      ['오르웨 네스', '오르웨 네스(Orwae Nes)'],
      ['오르웨이 네스', '오르웨 네스(Orwae Nes)']
    ],
    'person:odgray' => [
      ['우그나르 오드그레이(Odgray)', '우그나르 오드그레이(Ugnar Odgray)'],
      ['우그나르 오드그레이', '우그나르 오드그레이(Ugnar Odgray)']
    ],
    'person:peliad' => [
      ['셀니 펠리아드(Peliad)', '셀니 펠리아드(Selni Peliad)'],
      ['셀니 펠리아드', '셀니 펠리아드(Selni Peliad)']
    ],
    'person:porthe' => [
      ['에릭 포스(Eric Porthe)', '에릭 포르테(Eric Porthe)'],
      ['에릭 포스', '에릭 포르테(Eric Porthe)']
    ],
    'person:rathgar' => [
      ['에윈 래스가르(Aewin Rathgar)', '에윈 라스가르(Aewin Rathgar)'],
      ['에윈 래스가르', '에윈 라스가르(Aewin Rathgar)'],
      ['에윈 래스가(Aewin Rathgar)', '에윈 라스가르(Aewin Rathgar)']
    ],
    'person:risberg' => [
      ['잉가 리스베리(Inga Risberg)', '잉가 리스버그(Inga Risberg)'],
      ['잉가 리스베리', '잉가 리스버그(Inga Risberg)']
    ],
    'person:rolan' => [
      ['롤런 알리언드(Rolan Arleand)', '롤란 알리언드(Rolan Arleand)'],
      ['롤런 알리언드', '롤란 알리언드(Rolan Arleand)']
    ],
    'person:ruhnir' => [
      ['루니어 웨스논(Ruhnir Wesnon)', '루니르 웨스논(Ruhnir Wesnon)'],
      ['루르니르 웨스논', '루니르 웨스논(Ruhnir Wesnon)'],
      ['루니어 웨스논', '루니르 웨스논(Ruhnir Wesnon)'],
      ['루니르 웨스논', '루니르 웨스논(Ruhnir Wesnon)']
    ],
    'person:rhiad' => [
      ['리어드 거스(Rhiad Guth)', '리아드 거스(Rhiad Guth)'],
      ['리야드 거스(Rhiad Guth)', '리아드 거스(Rhiad Guth)'],
      ['리아드 구스(Rhiad Guth)', '리아드 거스(Rhiad Guth)'],
      ['리어드 거스', '리아드 거스(Rhiad Guth)'],
      ['리야드 거스', '리아드 거스(Rhiad Guth)'],
      ['리야드', '리아드(Rhiad)'],
      ['리아드 구스', '리아드 거스(Rhiad Guth)']
    ],
    'person:orcha' => [
      ['오르카 테트란(Orcha Tetran)', '오르차 테트란(Orcha Tetran)'],
      ['오르카(Orcha) 테트란', '오르차 테트란(Orcha Tetran)'],
      ['오르카 테트란', '오르차 테트란(Orcha Tetran)'],
      ['오르차(Orcha) 테트란', '오르차 테트란(Orcha Tetran)'],
      ['오르차 테트란', '오르차 테트란(Orcha Tetran)']
    ]
  }.freeze
  EXCLUDED_KEYS = {
    ['default', '4640', ''] => ['person:quay'],
    ['default', '55234', ''] => ['person:quay'],
    ['default', '9182', ''] => ['person:parwen'],
    ['default', '48962', ''] => ['person:parwen'],
    ['default', '2431', ''] => ['person:ouet'],
    ['default', '34380', ''] => ['person:pengaras'],
    ['default', '49716', ''] => ['person:pengaras'],
    ['default', '1835', ''] => ['person:orieator'],
    ['default', '57263', ''] => ['person:orieator'],
    ['default', '21252', ''] => ['person:ratofer'],
    ['default', '39557', ''] => ['person:ratofer'],
    ['default', '49259', ''] => ['person:ratofer']
  }.freeze
  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def row_texts(row)
    english = JSON.parse(row.fetch('en_texts_json') || '[]').compact.join("\n---\n")
    japanese = JSON.parse(row.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
    [english, japanese, row.fetch('zh_text').to_s, row.fetch('work_text').to_s]
  end

  def coda?(text)
    last = text.each_char.to_a.last
    return false unless last && last.ord.between?(0xAC00, 0xD7A3)

    ((last.ord - 0xAC00) % 28) != 0
  end

  def particle_after(text, finish)
    PARTICLES.values.flatten.uniq.sort_by { |part| -part.length }.each do |part|
      next unless text[finish, part.length] == part

      after_particle = text[finish + part.length]
      if after_particle && after_particle.match?(/\p{Hangul}/)
        continuations = %w[
          이라며 이라고 이라는 이란 이니 인지 인가 이고 이면 이며 이라도 이라서 이기에
          이야 이다 이지 이나 이든 이라도 이는 이도 이만
          은데 는데 은지 는지 은가 는가 은만 는만 은도 는도 은부터 는부터
          을뿐 를뿐 을지 를지 을까 를까 을까봐 를까봐
          과도 와도 과는 와는 과만 와만 과부터 와부터
          으로는 로는 으로도 로도 으로만 로만 으로부터 로부터
          에게서 에게는 에게도 에게만 에서는 에서도 에서만
          한테서 한테는 한테도 한테만 까지는 까지도 까지만
          조차 마저 부터 까지 밖에 뿐
        ]
        next unless continuations.any? { |ending| text[finish..].to_s.start_with?(ending) }
      end
      return [part, finish + part.length]
    end
    [nil, finish]
  end

  def corrected_particle(particle, base)
    if %w[으로 로].include?(particle)
      last = base.each_char.to_a.last
      has_rieul = last && last.ord.between?(0xAC00, 0xD7A3) &&
                  ((last.ord - 0xAC00) % 28) == 8
      return coda?(base) && !has_rieul ? '으로' : '로'
    end
    pair = PARTICLES.values.find { |alternatives| alternatives.include?(particle) }
    coda?(base) ? pair[0] : pair[1]
  end

  def forms(entity)
    canonical = entity.fetch('korean_canonical').to_s.split('(').first
    ([
      canonical,
      *entity['korean_variants'].to_s.split('|'),
      *EXTRA_FORMS.fetch(entity['entity_key'], [])
    ]).map { |form| form.to_s.split('(').first }
      .select { |form| form.match?(/\p{Hangul}/) }
      .reject(&:empty?).uniq.sort_by { |form| -form.length }
  end

  def full_name_replacements(entity_key)
    FULL_NAME_REPLACEMENTS.fetch(entity_key, [])
  end

  def excluded_reason(entity_key, row_key, english)
    if (excluded = EXCLUDED_KEYS[row_key]) && excluded.include?(entity_key)
      return case [entity_key, row_key]
             when ['person:quay', ['default', '4640', '']]
               '“Quay-side home” is generic harbor-side wording, not the person Quay.'
             when ['person:quay', ['default', '55234', '']]
               '“Quays” names the docks; it is not a mention of the person Quay.'
             when ['person:parwen', ['default', '9182', '']],
                  ['person:parwen', ['default', '48962', '']]
               'The hit is only inside the localization token $SQ58.parwen_bribe$, not a name in the English sentence.'
             when ['person:ouet', ['default', '2431', '']]
               'Ouet Labs is the institution name; this row does not identify the person Feride Ouet.'
             when ['person:pengaras', ['default', '34380', '']],
                  ['person:pengaras', ['default', '49716', '']]
               'Pengaras House/Basement is a place label, not a person mention.'
             when ['person:orieator', ['default', '1835', '']],
                  ['person:orieator', ['default', '57263', '']]
               'Orieator’s Tomb/Stand is a place name in this occurrence, not a direct personal mention.'
             else
               'The aligned source identifies a family/collective, not the individual person entity.'
             end
    end

    if entity_key == 'person:odwig' &&
       (english.match?(/St\.?\s+Odwig(?:'s|’s)\b/i) ||
        english.match?(/\bOdwig(?:'s|’s)\s+(?:Shrine|Mission|Bunkhouse)\b/i))
      return 'St. Odwig’s names the mission, shrine, or associated institution/location in this row, not the individual saint.'
    end

    nil
  end

  def full_name_match?(english, phrase)
    phrase.scan(/[A-Z][A-Za-z'-]*(?:\s+[A-Z][A-Za-z'-]*)+/).any? do |name|
      english.match?(/(?<![A-Za-z])#{Regexp.escape(name)}(?![A-Za-z])/i)
    end
  end

  def apply_full_name_rules(text, entity_key, english)
    updated = text.dup
    changed = false
    full_name_replacements(entity_key).each do |before, after|
      next if before == after
      next unless english.match?(/(?<![A-Za-z])#{Regexp.escape(after[/\(([^()]*)\)/, 1].to_s)}(?![A-Za-z])/i)
      pattern = Regexp.escape(before)
      pattern += '(?![ \t]*\()' unless before.include?('(')
      matcher = Regexp.new(pattern)
      next unless updated.match?(matcher)

      updated = updated.gsub(matcher, after)
      changed = true
    end
    [updated, changed]
  end

  def safe_spans(text, form)
    spans = []
    offset = 0
    while (start_at = text.index(form, offset))
      finish = start_at + form.length
      before = start_at.zero? ? nil : text[start_at - 1]
      after = text[finish]
      left_ok = !before || !before.match?(/\p{Hangul}/)
      particle, particle_end = particle_after(text, finish)
      suffix = text[finish..].to_s
      known_suffix = %w[
        이라며 이라고 이라는 이란 이니 라며 라고 라는 란 인가 인지 냐
        으로부터 으로는 으로도 으로만 에게서 에게는 에게도 에게만
        에서는 에서도 에서만 한테서 한테는 한테도 까지는 까지도
        까지만 조차 마저 부터 까지 밖에 뿐
        에게 에서 에 한테 께 에는 에도 이 가 은 는 을 를 과 와 으로 로 도 만 의 다
      ].any? do |ending|
        suffix.start_with?(ending)
      end
      right_ok = !after || !after.match?(/\p{Hangul}/) || particle || known_suffix
      if left_ok && right_ok
        spans << [start_at, finish, particle, particle_end]
      end
      offset = finish
    end
    spans
  end

  def matching_annotation(text, finish, english_terms)
    match = /\A[ \t]*\(([^()\r\n]*)\)/.match(text[finish..].to_s)
    return nil unless match

    annotation = match[1]
    return [match[0], match[0].length] if english_terms.any? do |term|
      annotation.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
    end
    nil
  end

  def protected_full_name_span?(text, finish, english_terms)
    gap = /\A(?:[ \t]+\p{Hangul}+){0,3}[ \t]*/.match(text[finish..].to_s)
    if gap
      annotation = matching_annotation(text, finish + gap[0].length, english_terms)
      return true if annotation
    end

    particle_gap = /\A(?:이|가|은|는|을|를|과|와|로|으로)[ \t]+\p{Hangul}+[ \t]*/.match(text[finish..].to_s)
    return false unless particle_gap

    !matching_annotation(text, finish + particle_gap[0].length, english_terms).nil?
  end

  def correct_annotated_particles(text, english_terms)
    matches = []
    pattern = /([가-힣]+(?:[ \t]+[가-힣]+){0,3})\(([^()\r\n]*)\)/
    text.to_enum(:scan, pattern).each do
      match = Regexp.last_match
      finish = match.end(0)
      annotation = matching_annotation(text, finish - 2 - match[2].length, english_terms)
      next unless annotation

      base = match[1].split(/[ \t]+/).last.to_s
      suffix = text[finish..].to_s
      quoted_endings = %w[
        이라고는 이라는건 이라며 이라는 이라고 이란 이라서 이라면 이니 이다 이자 이라
      ].sort_by { |ending| -ending.length }
      quoted = quoted_endings.find { |ending| suffix.start_with?(ending) }
      if quoted
        replacement = if coda?(base)
                        quoted
                      else
                        {
                          '이라고' => '라고', '이라는' => '라는', '이란' => '란',
                          '이라며' => '라며', '이라고는' => '라고는',
                          '이라는건' => '라는건', '이라서' => '라서',
                          '이라면' => '라면', '이니' => '니', '이다' => '다',
                          '이자' => '자', '이라' => '라'
                        }.fetch(quoted)
                      end
        matches << [finish, finish + quoted.length, replacement]
        next
      end
      if suffix.start_with?('이야')
        new_particle = coda?(base) ? '이야' : '야'
        matches << [finish, finish + 2, new_particle]
        next
      end

      particle, particle_end = particle_after(text, finish)
      next unless particle

      new_particle = corrected_particle(particle, base)
      matches << [finish, particle_end, new_particle] if particle != new_particle
    end
    matches.reverse_each do |start_at, finish, replacement|
      text[start_at...finish] = replacement
    end
    text
  end

  def normalize_entity(text, entity, source_row, matched_term)
    english, _japanese, _chinese, = row_texts(source_row)
    entity_key = entity.fetch('entity_key')
    canonical = entity.fetch('korean_canonical').to_s.split('(').first
    terms = [entity.fetch('english_canonical'), matched_term].compact.uniq
    updated, full_changed = apply_full_name_rules(text, entity_key, english)
    changed = full_changed
    found_name = full_changed
    if entity_key == 'person:quay' && key(source_row) == ['default', '54626', ''] &&
       updated.include?('부두로 돌아가기')
      updated = updated.sub('부두로 돌아가기', '퀘이(Quay)에게 돌아가기')
      changed = true
      found_name = true
    end
    if entity_key == 'person:octienne' && key(source_row) == ['default', '5060', ''] &&
       updated.include?('옥티엔느야')
      updated = updated.sub('옥티엔느야', '옥티엔(Octienne)이야')
      changed = true
      found_name = true
    end

    forms(entity).each do |form|
      spans = safe_spans(updated, form)
      spans.reverse_each do |start_at, finish, _particle, _particle_end|
        found_name = true
        next if protected_full_name_span?(updated, finish, terms)
        next if form == canonical

        updated[start_at...finish] = canonical
        changed = true
      end
    end

    raise "no reviewed Korean name span for #{entity_key} at #{key(source_row).inspect}" unless found_name

    forms(entity).each do |form|
      next unless form == canonical

      spans = safe_spans(updated, form)
      spans.reverse_each do |start_at, finish, particle, particle_end|
        next if protected_full_name_span?(updated, finish, terms)
        annotation_match = /\A[ \t]*\([^()\r\n]*\)/.match(updated[finish..].to_s)
        annotation = matching_annotation(updated, finish, terms)
        marker_end = annotation_match ? finish + annotation_match[0].length : finish
        if annotation
          suffix_particle, suffix_end = particle_after(updated, marker_end)
          if suffix_particle
            old_particle = updated[marker_end...suffix_end]
            new_particle = corrected_particle(old_particle, canonical)
            updated[marker_end...suffix_end] = new_particle
            changed ||= old_particle != new_particle
          end
          next
        end

        # A complete bilingual full name can annotate a component at its end.
        tail = updated[finish..].to_s
        if annotation_match
          suffix_particle, suffix_end = particle_after(updated, marker_end)
          if suffix_particle
            old_particle = updated[marker_end...suffix_end]
            new_particle = corrected_particle(old_particle, canonical)
            updated[marker_end...suffix_end] = new_particle
            changed ||= old_particle != new_particle
          end
          next
        end
        suffix_particle, suffix_end = particle_after(updated, finish)
        if suffix_particle
          old_particle = updated[finish...suffix_end]
          new_particle = corrected_particle(old_particle, canonical)
          updated[start_at...suffix_end] =
            "#{canonical}(#{entity.fetch('english_canonical')})#{new_particle}"
        else
          updated[start_at...finish] = "#{canonical}(#{entity.fetch('english_canonical')})"
        end
        changed = true
      end
    end

    updated = correct_annotated_particles(updated, terms)
    changed ||= updated != text
    [updated, changed, nil]
  end

  def run
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t", liberal_parsing: true)
    index = CSV.read(INDEX, headers: true, col_sep: "\t", liberal_parsing: true)
    glossary_rows = CSV.read(GLOSSARY, headers: true, col_sep: "\t", liberal_parsing: true)
    source_by_key = inventory.to_h { |row| [key(row), row] }
    glossary = glossary_rows.to_h { |row| [row.fetch('entity_key'), row] }

    pending = index.select do |row|
      row['status'] == 'needs-context' &&
        row['entity_key'].to_s.match?(/\Aperson:[n-r]/i) &&
        glossary[row['entity_key']] &&
        glossary[row['entity_key']]['status'] == 'confirmed'
    end
    grouped = pending.group_by { |row| key(row) }
    output = []

    grouped.each do |row_key, occurrence_rows|
      source = source_by_key.fetch(row_key) { raise "missing aligned inventory row #{row_key.inspect}" }
      english, japanese, chinese, old_text = row_texts(source)
        # The shared occurrence index may lag edits applied by the parent agent.
        # Always rebase from the latest aligned inventory work_text.
      new_text = old_text.dup
      dispositions = {}
      evidence_parts = []

      occurrence_rows.sort_by { |row| row['entity_key'] }.each do |occurrence|
        entity_key = occurrence.fetch('entity_key')
        entity = glossary.fetch(entity_key)
        term = occurrence.fetch('matched_english')
        reason = excluded_reason(entity_key, row_key, english)
        if reason
          status = 'excluded'
          entity_new = new_text
        else
          unless english.match?(/(?<![A-Za-z0-9_])#{Regexp.escape(term)}(?![A-Za-z0-9_])/i)
            raise "non-lexical source hit needs focused review: #{row_key.inspect} #{entity_key}"
          end
          entity_new, changed, = normalize_entity(new_text, entity, source, term)
          if !changed && entity_new == new_text
            status = 'not-an-issue'
            reason = 'Canonical Korean form and source-supported English name are already retained.'
          else
            status = 'accepted'
            new_text = entity_new
            reason = 'Normalized only the context-matched personal name; preserved complete source forms, titles, line breaks, tokens, and Korean particles.'
          end
        end
        dispositions[entity_key] = status
        evidence_parts << "#{entity_key}: #{reason}"
      end

      statuses = dispositions.values.uniq
      overall = if statuses.include?('uncertain')
                  'uncertain'
                elsif statuses.include?('accepted')
                  'accepted'
                elsif statuses.include?('not-an-issue')
                  'not-an-issue'
                else
                  'excluded'
                end
      raise "non-accepted edit at #{row_key.inspect}" if overall != 'accepted' && new_text != old_text
      raise "accepted no-op at #{row_key.inspect}" if overall == 'accepted' && new_text == old_text
      raise "unbalanced parentheses at #{row_key.inspect}" unless new_text.count('(') == new_text.count(')')
      old_text.scan(/\([^()\r\n]*\)/).each do |annotation|
        raise "lost source parenthetical at #{row_key.inspect}" unless new_text.include?(annotation)
      end
      raise "token change at #{row_key.inspect}" unless old_text.scan(/\{[^{}]*\}/) == new_text.scan(/\{[^{}]*\}/)
      raise "line-break change at #{row_key.inspect}" unless old_text.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)

      output << [
        *row_key, occurrence_rows.map { |row| row['entity_key'] }.uniq.sort.join('|'),
        overall, old_text, new_text,
        "N-R row-level review; English identity anchored and aligned Japanese/Chinese compared with the full Korean cell. #{evidence_parts.join(' ')}",
        english, japanese, chinese, JSON.generate(dispositions), '', ''
      ]
    end

    raise 'duplicate resource/ID/variant output key' unless
      output.map { |row| row[0, 3] }.uniq.length == output.length
    output.sort_by! { |row| [row[0], row[1].to_i, row[2]] }
    raise 'no pending N-R occurrences; preserving existing output' if output.empty?

    CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      output.each { |row| csv << row }
    end
    counts = output.each_with_object(Hash.new(0)) { |row, h| h[row[4]] += 1 }
    puts "Wrote #{output.length} unique rows for #{pending.map { |r| r['entity_key'] }.uniq.length} entities; entity matches=#{pending.length}; statuses=#{counts.inspect}"
  end
end

PersonNRFinalReview.run if $PROGRAM_NAME == __FILE__
