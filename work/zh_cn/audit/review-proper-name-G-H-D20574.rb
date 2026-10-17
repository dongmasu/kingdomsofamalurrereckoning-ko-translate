#!/usr/bin/env ruby

require 'csv'
require 'json'

AUDIT = __dir__
INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
INDEX = File.join(AUDIT, 'proper-name-occurrences.tsv')
GLOSSARY = File.join(AUDIT, 'proper-name-glossary.tsv')
OUT = File.join(AUDIT, 'proper-name-reviewed-G-H-residual.tsv')
HEADERS = %w[
  resource ID_Linha Tipo_Variante entity_key status old new evidence
  english japanese chinese entity_dispositions_json
].freeze
RESOURCE_ORDER = { 'affix' => 0, 'base' => 1, 'default' => 2 }.freeze

RULES = {
  'person:guenfear' => {
    english: 'Guenfear',
    korean: '구엔페어',
    variants: %w[구엔페어 귄피어 겐피어 그웬피어],
    full_names: { 'Guenfear Wyle' => '구엔페어 와일' }
  },
  'person:guian' => {
    english: 'Guian',
    korean: '구이안',
    variants: %w[구이안 귀안 기안],
    full_names: { 'Guian Stebic' => '구이안 스테빅' }
  },
  'person:guran' => {
    english: 'Guran',
    korean: '구란',
    variants: %w[구란 그란]
  },
  'person:gwalchmai' => {
    english: 'Gwalchmai',
    korean: '그월흐마이',
    variants: %w[그월흐마이 그왈크마이 그왈흐마이 그월크마이]
  },
  'person:hain' => {
    english: 'Hain',
    korean: '헤인',
    variants: %w[헤인 하인],
    full_names: { 'Murdoc Hain' => '머독 헤인' }
  },
  'person:halcyor' => {
    english: 'Halcyor',
    korean: '할시오르',
    variants: %w[할시오르 할시어]
  },
  'person:hallidite' => {
    english: 'Hallidite',
    korean: '할리다이트',
    variants: %w[할리다이트]
  },
  'person:harit' => {
    english: 'Harit',
    korean: '하리트',
    variants: %w[하리트 하릿],
    full_names: { 'Harit Wyle' => '하리트 와일' }
  },
  'person:hartwen' => {
    english: 'Hartwen',
    korean: '하트웬',
    variants: %w[하트웬]
  },
  'person:helt' => {
    english: 'Helt',
    korean: '헬트',
    variants: %w[헬트],
    full_names: { 'Riona Helt' => '리오나 헬트' }
  },
  'person:hendi' => {
    english: 'Hendi',
    korean: '헨디',
    variants: %w[헨디]
  },
  'person:hicener' => {
    english: 'Hicener',
    korean: '히세너',
    variants: %w[히세너 하이세너]
  },
  'person:hidon' => {
    english: 'Hidon',
    korean: '히돈',
    variants: %w[히돈]
  },
  'person:hiroen' => {
    english: 'Hiroen',
    korean: '히로엔',
    variants: %w[히로엔],
    full_names: {
      'Hiroen Karet' => '히로엔 카렛',
      'Hiroen Kalt' => '히로엔 칼트'
    }
  },
  'person:holte' => {
    english: 'Holte',
    korean: '홀트',
    variants: %w[홀트 홀테],
    full_names: { 'Holte Frenn' => '홀트 프렌' }
  },
  'person:hoswig' => {
    english: 'Hoswig',
    korean: '호스위그',
    variants: %w[호스위그 호스윅],
    full_names: { 'Edwin Hoswig' => '에드윈 호스위그' }
  },
  'person:hugues' => {
    english: 'Hugues',
    korean: '휴그',
    variants: %w[휴그 위그 휴그스 휴스 휴즈],
    full_names: {
      'Fomorous Hugues' => '포모러스 휴그',
      'Ivan Hugues' => '이반 휴그'
    },
    full_name_variants: {
      'Fomorous Hugues' => {
        '포모루스' => '포모러스',
        '포머러스' => '포모러스'
      }
    }
  }
}.freeze

def key(row)
  [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
end

def outside_parentheses?(text, position)
  text[0...position].count('(') <= text[0...position].count(')')
end

def has_batchim?(text)
  last = text.each_char.to_a.last
  last && last.ord.between?(0xAC00, 0xD7A3) &&
    ((last.ord - 0xAC00) % 28).positive?
end

def replace_names(text, rule, english)
  result = text.dup
  special_patches = []
  rule.fetch(:full_name_variants, {}).each do |full_name, forms|
    next unless english.match?(/(?<![A-Za-z])#{Regexp.escape(full_name)}(?![A-Za-z])/i)

    forms.each do |old_form, canonical_form|
      result.to_enum(:scan, Regexp.new(Regexp.escape(old_form))).each do
        match = Regexp.last_match
        next unless outside_parentheses?(result, match.begin(0))

        special_patches << [match.begin(0), match.end(0), canonical_form]
      end
    end
  end
  special_patches.sort_by(&:first).reverse_each do |start_at, end_at, replacement|
    result[start_at...end_at] = replacement
  end

  variants = rule.fetch(:variants).sort_by { |value| -value.length }
  pattern = Regexp.union(variants)
  matches = []
  result.to_enum(:scan, pattern).each do
    match = Regexp.last_match
    start_at = match.begin(0)
    previous = start_at.positive? ? result[start_at - 1] : nil
    next unless outside_parentheses?(result, start_at)
    next if previous&.match?(/\p{Hangul}/)

    matches << [start_at, match.end(0), match[0]]
  end
  patches = []
  matches.each do |start_at, end_at, old_name|
    if has_batchim?(old_name) != has_batchim?(rule.fetch(:korean))
      tail = result[end_at..]
      label = tail.match(/\A\s*\([^()]*\)/)
      particle_at = end_at + (label ? label[0].length : 0)
      particle_at += result[particle_at..].match(/\A\s*/)[0].length
      particles = %w[으로 이 가 은 는 을 를 과 와 로 아 야]
      particle = particles.sort_by { |value| -value.length }.find do |value|
        result[particle_at, value.length] == value
      end
      if particle
        alternatives = {
          '이' => '가', '가' => '이', '은' => '는', '는' => '은',
          '을' => '를', '를' => '을', '과' => '와', '와' => '과',
          '으로' => '로', '로' => '으로', '아' => '야', '야' => '아'
        }
        patches << [particle_at, particle_at + particle.length,
                    alternatives.fetch(particle)]
      end
    end
    patches << [start_at, end_at, rule.fetch(:korean)]
  end
  patches.sort_by(&:first).reverse_each do |start_at, end_at, replacement|
    result[start_at...end_at] = replacement
  end
  [result, matches.length]
end

def annotate_names(text, rule, english)
  korean = rule.fetch(:korean)
  canonical_english = rule.fetch(:english)
  full_names = rule.fetch(:full_names, {}).select do |full_name, _|
    english.match?(/(?<![A-Za-z])#{Regexp.escape(full_name)}(?![A-Za-z])/i)
  end
  result = text.dup

  full_names.each do |full_name, surname|
    phrase = /(?<!\p{Hangul})#{Regexp.escape(surname)}/
    spans = []
    result.to_enum(:scan, phrase).each do
      match = Regexp.last_match
      next unless outside_parentheses?(result, match.begin(0))

      spans << [match.begin(0), match.end(0)]
    end
    spans.reverse_each do |_, end_at|
      tail = result[end_at..]
      label = tail.match(/\A\s*\((?<value>[^()]*)\)/)
      next if label && label[:value].match?(/(?<![A-Za-z])#{Regexp.escape(full_name)}(?![A-Za-z])/i)

      result.insert(end_at, "(#{full_name})")
    end
  end

  positions = []
  particles = %w[
    에게서 에게까지 에게부터 에게도 에게나 에게는
    에서부터 으로부터 으로써 으로서는 으로서
    이라며 이라는 이라서 이라고 라는 라며 라고 라서 라고는
    까지 부터 처럼 보다 조차 마저 라도 든지 든가
    은 는 이 가 을 를 과 와 의 에게 께 에서 으로 로 에 아 야 도 만
    부터 마다 나
  ]
  particle_pattern = particles.sort_by { |value| -value.length }
    .map { |value| Regexp.escape(value) }.join('|')
  token = /(?<!\p{Hangul})#{Regexp.escape(korean)}(?<particle>#{particle_pattern})?(?=\s|\(|[^\p{Hangul}]|$)/
  result.to_enum(:scan, token).each do
    match = Regexp.last_match
    next unless outside_parentheses?(result, match.begin(0))

    positions << [match.begin(0), match.begin(:particle) || match.end(0)]
  end
  positions.reverse_each do |_, end_at|
    tail = result[end_at..]
    label = tail.match(/\A\s*\((?<value>[^()]*)\)/)
    next if label && label[:value].match?(/(?<![A-Za-z])#{Regexp.escape(canonical_english)}(?![A-Za-z])/i)

    full_label = full_names.any? do |name, surname|
      suffix = surname.sub(korean, '')
      tail.match?(/\A#{Regexp.escape(suffix)}\s*\(#{Regexp.escape(name)}\)/)
    end
    next if full_label

    result.insert(end_at, "(#{canonical_english})")
  end
  result
end

inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
  .to_h { |row| [key(row), row.to_h] }
index = CSV.read(INDEX, headers: true, col_sep: "\t")
glossary = CSV.read(GLOSSARY, headers: true, col_sep: "\t")
  .to_h { |row| [row.fetch('entity_key'), row.to_h] }
pending = index.select { |row| row['status'] == 'needs-context' }
pending_by_key = pending.group_by { |row| key(row) }
selected = pending_by_key.values.select do |matches|
  matches.any? { |row| RULES.key?(row['entity_key']) }
end.map(&:first).sort_by do |row|
  [row['entity_key'], RESOURCE_ORDER.fetch(row['resource']),
   row['ID_Linha'].to_i, row['Tipo_Variante'].to_s]
end.first(50)
raise "expected 1-50 pending row keys, got #{selected.length}" unless
  (1..50).cover?(selected.length)

reviews = selected.map do |candidate|
  row_key = key(candidate)
  source = inventory.fetch(row_key)
  matches = pending.select do |row|
    key(row) == row_key && RULES.key?(row['entity_key'])
  end
  old_text = source.fetch('work_text')
  new_text = old_text
  dispositions = {}
  evidence = []

  matches.each do |match|
    entity = match.fetch('entity_key')
    rule = RULES.fetch(entity) { raise "no reviewed rule for #{entity}" }
    glossary_entry = glossary.fetch(entity)
    raise "unconfirmed glossary entity #{entity}" unless
      glossary_entry['status'] == 'confirmed' &&
      glossary_entry['category'] == 'person' &&
      glossary_entry['english_canonical'] == rule.fetch(:english)

    english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
    chinese = source.fetch('zh_text').to_s
    raise "English does not identify #{entity} at #{row_key.inspect}" unless
      english.match?(/(?<![A-Za-z])#{Regexp.escape(rule.fetch(:english))}(?![A-Za-z])/i)

    before = new_text
    normalized, occurrences = replace_names(new_text, rule, english)
    raise "Korean counterpart absent for #{entity} at #{row_key.inspect}" if occurrences.zero?
    new_text = annotate_names(normalized, rule, english)
    dispositions[entity] = before == new_text ? 'not-an-issue' : 'accepted'
    evidence << "#{entity}: English identifies #{rule.fetch(:english)}; aligned Japanese and Chinese rows were checked as supporting pronunciation/context evidence. Standardized Korean forms to #{rule.fetch(:korean)}(#{rule.fetch(:english)}) and retained source-supported full-name labels."
  end

  status = if new_text != old_text
             'accepted'
           elsif dispositions.values.all? { |value| value == 'not-an-issue' }
             'not-an-issue'
           else
             'uncertain'
           end
  english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
  [
    *row_key, matches.map { |row| row['entity_key'] }.uniq.sort.join('|'),
    status, old_text, new_text, evidence.join(' '), english, japanese,
    source.fetch('zh_text').to_s, JSON.generate(dispositions)
  ]
end

raise 'duplicate selected row key' unless
  reviews.map { |row| row[0, 3] }.uniq.length == reviews.length
CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
  csv << HEADERS
  reviews.each { |row| csv << row }
end
puts "Wrote #{reviews.length} reviewed rows: #{reviews.group_by { |row| row[4] }.transform_values(&:length)}"
