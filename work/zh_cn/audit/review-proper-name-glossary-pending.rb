#!/usr/bin/env ruby

require 'csv'
require 'json'

AUDIT = __dir__
INDEX = File.join(AUDIT, 'proper-name-occurrences.tsv')
GLOSSARY = File.join(AUDIT, 'proper-name-glossary.tsv')
INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
PENDING_OUT = File.join(AUDIT, 'proper-name-reviewed-glossary-pending.tsv')
RESIDUAL_IN = File.join(AUDIT, 'proper-name-residual-missing-bilingual-final.tsv')
RESIDUAL_OUT = File.join(AUDIT, 'proper-name-reviewed-bilingual-residual.tsv')
HEADERS = %w[
  resource ID_Linha Tipo_Variante entity_key status old new evidence
  english japanese chinese entity_dispositions_json
].freeze
RESOURCE_ORDER = { 'affix' => 0, 'base' => 1, 'default' => 2 }.freeze
FULL_NAMES = {
  ['default', '16702', ''] => ['재닉 자매', 'Janick Sisters', /재닉(?:\(Janick\))?\s+자매/],
  ['default', '9314', ''] => ['잔느 조리엘', 'Jeanne Jorielle', /잔느\s+조리엘(?:\([^()]*\))?/],
  ['default', '40130', ''] => ['조컬 팽가드', 'Jokull Fangard', /조컬(?:\(Jokull\))?\s+팽가드(?:\([^()]*\))?/],
  ['default', '41084', ''] => ['아릭 나린', 'Arick Nareen', /아릭(?:\(Arick\))?\s+나린(?:\([^()]*\))?/],
  ['default', '9328', ''] => ['시트릭 보름', 'Sihtric Vorm', /시트릭\s+보름(?:\([^()]*\))?/],
  ['default', '20414', ''] => ['아르하우스 보름', 'Arhaus Vorm', /아(?:르)?하우스\s+보름(?:\([^()]*\))?/],
  ['default', '24727', ''] => ['시트릭 보름', 'Sihtric Vorm', /시트릭\s+보름(?:\([^()]*\))?/],
  ['default', '25890', ''] => ['아르하우스 보름', 'Arhaus Vorm', /아(?:르)?하우스\s+보름(?:\([^()]*\))?/],
  ['default', '26810', ''] => ['아르하우스 보름', 'Arhaus Vorm', /아(?:르)?하우스\s+보름(?:\([^()]*\))?/],
  ['default', '30114', ''] => ['아르하우스 보름', 'Arhaus Vorm', /아(?:르)?하우스\s+보름(?:\([^()]*\))?/],
  ['default', '30386', ''] => ['아르하우스 보름', 'Arhaus Vorm', /아(?:르)?하우스\s+보름(?:\([^()]*\))?/],
  ['default', '31927', ''] => ['시트릭 보름', 'Sihtric Vorm', /시트릭\s+보름(?:\([^()]*\))?/],
  ['default', '31952', ''] => ['시트릭 보름', 'Sihtric Vorm', /시트릭\s+보름(?:\([^()]*\))?/],
  ['default', '34791', ''] => ['시트릭 보름', 'Sihtric Vorm', /시트릭\s+보름(?:\([^()]*\))?/],
  ['default', '35838', ''] => ['아르하우스 보름', 'Arhaus Vorm', /아(?:르)?하우스\s+보름(?:\([^()]*\))?/],
  ['default', '46910', ''] => ['아르하우스 보름', 'Arhaus Vorm', /아(?:르)?하우스\s+보름(?:\([^()]*\))?/],
  ['default', '44207', ''] => ['시트릭 보름', 'Sihtric Vorm', /시트릭\s+보름(?:\([^()]*\))?/],
  ['default', '20866', ''] => ['우다 자나라', 'Uda Janara', /우다(?:\(Uda\))?\s+자나라(?:\([^()]*\))?/],
  ['default', '26104', ''] => ['베런 시와인', 'Varen Seawine', /베런(?:\(Varen\))?\s+시와인(?:\([^()]*\))?/],
  ['default', '31755', ''] => ['아풀레 비르', 'Apule Vire', /(?:아풀레|아퓰|아풀)(?:\([^()]*\))?\s+비(?:레|르)(?:\([^()]*\))?/],
  ['default', '34320', ''] => ['아풀레 비르', 'Apule Vire', /(?:아풀레|아퓰|아풀)(?:\([^()]*\))?\s+비(?:레|르)(?:\([^()]*\))?/],
  ['default', '47203', ''] => ['아풀레 비르', 'Apule Vire', /(?:아풀레|아퓰|아풀)(?:\([^()]*\))?\s+비(?:레|르)(?:\([^()]*\))?/],
  ['default', '48526', ''] => ['아풀레 비르', 'Apule Vire', /(?:아풀레|아퓰|아풀)(?:\([^()]*\))?\s+비(?:레|르)(?:\([^()]*\))?/],
  ['default', '19543', ''] => ['웨일런 포스티드', 'Walen Forstid', /(?:웨일런|월런)(?:\(Walen\))?\s+포스티드(?:\([^()]*\))?/],
  ['default', '31223', ''] => ['웨일런 포스티드', 'Walen Forstid', /(?:웨일런|월런)(?:\(Walen\))?\s+포스티드(?:\([^()]*\))?/],
  ['default', '35765', ''] => ['웨일런 포스티드', 'Walen Forstid', /(?:웨일런|월런)(?:\(Walen\))?\s+포스티드(?:\([^()]*\))?/],
  ['default', '36220', ''] => ['웨일런 포스티드', 'Walen Forstid', /(?:웨일런|월런)(?:\(Walen\))?\s+포스티드(?:\([^()]*\))?/],
  ['default', '10277', ''] => ['세페드라 윌', 'Sephedra Wyll', /세페드라\s+윌(?:\(Wyll\))?/],
  ['default', '42337', ''] => ['세페드라 윌', 'Sephedra Wyll', /세페드라\s+윌(?:\(Wyll\))?/],
  ['default', '15158', ''] => ['울프 고드프리', 'Wulf Godfrey', /울프(?:\(Wulf\))?\s+고드프리(?:\([^()]*\))?/],
  ['default', '19244', ''] => ['울프 고드프리', 'Wulf Godfrey', /울프(?:\(Wulf\))?\s+고드프리(?:\([^()]*\))?/],
  ['default', '19993', ''] => ['울프 고드프리', 'Wulf Godfrey', /울프(?:\(Wulf\))?\s+고드프리(?:\([^()]*\))?/],
  ['default', '29978', ''] => ['울프 고드프리', 'Wulf Godfrey', /울프(?:\(Wulf\))?\s+고드프리(?:\([^()]*\))?/],
  ['default', '31120', ''] => ['울프 고드프리', 'Wulf Godfrey', /울프(?:\(Wulf\))?\s+고드프리(?:\([^()]*\))?/],
  ['default', '37656', ''] => ['울프 고드프리', 'Wulf Godfrey', /울프(?:\(Wulf\))?\s+고드프리(?:\([^()]*\))?/],
  ['default', '40206', ''] => ['울프 고드프리', 'Wulf Godfrey', /울프(?:\(Wulf\))?\s+고드프리(?:\([^()]*\))?/],
  ['default', '48778', ''] => ['울프 고드프리', 'Wulf Godfrey', /울프(?:\(Wulf\))?\s+고드프리(?:\([^()]*\))?/],
  ['default', '10434', ''] => ['캠든 울플랙', 'Camden Wulflac', /캠든\s+울플랙(?:\(Wulflac\))?/],
  ['default', '33437', ''] => ['기젤라 울플랙', 'Gizela Wulflac', /기젤라\s+울플랙(?:\(Wulflac\))?/],
  ['default', '41963', ''] => ['캠든 울플랙', 'Camden Wulflac', /캠(?:든|던)\s+울플랙(?:\(Wulflac\))?/],
  ['default', '43074', ''] => ['캠든 울플랙', 'Camden Wulflac', /캠던?\s+울플랙(?:\(Wulflac\))?/],
  ['default', '48625', ''] => ['기젤라 울플랙', 'Gizela Wulflac', /기젤라\s+울플랙(?:\(Wulflac\))?/],
  ['default', '50208', ''] => ['캠든 울플랙', 'Camden Wulflac', /캠든\s+울플랙(?:\(Wulflac\))?/],
  ['default', '34099', ''] => ['윌 웨레너', 'Wyl Werrenir', /윌(?:\(Wyl\))?\s+웨레너(?:\([^()]*\))?/],
  ['default', '35006', ''] => ['윌 렌디그', 'Wyl Rendig', /윌(?:\(Wyl\))?\s+렌디그(?:\([^()]*\))?/],
  ['default', '37549', ''] => ['윌 렌딕', 'Wyl Rendig', /윌(?:\(Wyl\))?\s+렌딕(?:\([^()]*\))?/],
  ['default', '37720', ''] => ['윌 렌딕', 'Wyl Rendig', /윌(?:\(Wyl\))?\s+렌딕(?:\([^()]*\))?/],
  ['default', '48767', ''] => ['오레인 빌사르', 'Oreyn Vilsar', /오레인\s+빌사르(?:\([^()]*\))?/],
  ['default', '40856', ''] => ['흐린디 중가르', 'Hrindi Zungar', /흐린디\s+중가르(?:\(Zungar\))?/],
  ['default', '44328', ''] => ['흐린디 중가르', 'Hrindi Zungar', /흐린디\s+중가르(?:\(Zungar\))?/],
  ['default', '44960', ''] => ['흐린디 중가르', 'Hrindi Zungar', /흐린디\s+중가르(?:\(Zungar\))?/],
  ['default', '25475', ''] => ['맹세방패 조티쿠스', 'Oathshield Zotikus', /맹세방패\s+조티쿠스(?:\(Zotikus\))?/]
}.freeze
PARTICLES = %w[
  에게서 에게까지 에게부터 에게도 에게나 에게는 에서부터 으로부터 으로써
  으로서는 으로서 이라며 이라는 이라서 이라고 라는 라며 라고 라서 만큼
  라고는 까지 부터 처럼 보다 조차 마저 라도 든지 든가 은 는 이 가 을
  를 과 와 의 에게 께 에서 으로 로 에 아 야 도 만 부터 마다 나
].freeze

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

def canonical_pair(entry)
  english = entry.fetch('english_canonical')
  korean = entry.fetch('korean_canonical')
    .sub(/\s*\(#{Regexp.escape(english)}\)\s*\z/i, '')
  [korean, english]
end

def particle_after(text, position)
  tail = text[position..]
  whitespace = tail.match(/\A\s*/)[0]
  offset = position + whitespace.length
  particle = PARTICLES.sort_by { |value| -value.length }.find do |value|
    text[offset, value.length] == value
  end
  [particle, offset]
end

def replacement_particle(old_name, new_name, particle)
  return particle unless particle && has_batchim?(old_name) != has_batchim?(new_name)

  {
    '이' => '가', '가' => '이', '은' => '는', '는' => '은',
    '을' => '를', '를' => '을', '과' => '와', '와' => '과',
    '으로' => '로', '로' => '으로', '아' => '야', '야' => '아'
  }.fetch(particle, particle)
end

def edit_entity(text, entry)
  korean, english = canonical_pair(entry)
  variants = (entry.fetch('korean_variants', '').split('|') + [korean, english])
    .reject(&:empty?).uniq.sort_by { |value| -value.length }
  result = text.dup
  found = false

  variants.each do |variant|
    korean_variant = variant.match?(/\p{Hangul}/)
    pattern = if korean_variant
                particle_pattern = PARTICLES.sort_by { |value| -value.length }
                  .map { |value| Regexp.escape(value) }.join('|')
                /(?<!\p{Hangul})#{Regexp.escape(variant)}(?<particle>#{particle_pattern})?(?!\p{Hangul})/
              else
                /(?<![A-Za-z])#{Regexp.escape(variant)}(?![A-Za-z])/i
              end
    matches = []
    result.to_enum(:scan, pattern).each do
      match = Regexp.last_match
      next unless outside_parentheses?(result, match.begin(0))

      matches << [match.begin(0), match.end(0), match[0],
                  match.names.include?('particle') ? match[:particle] : nil]
    end
    next if matches.empty?

    found = true
    matches.reverse_each do |start_at, end_at, old_token, captured_particle|
      old_name = captured_particle ? old_token[0...-captured_particle.length] : old_token
      tail = result[end_at..]
      label = tail.match(/\A\s*\((?<value>[^()]*)\)/)
      full_label = tail.match(/\A(?:\s+[\p{Hangul}]+){1,2}\s*\((?<value>[^()]*)\)/)
      canonical_in_label = lambda do |value|
        value.match?(/(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])/i)
      end
      if label && label[:value].match?(/\A[A-Za-z][A-Za-z '’-]*\z/)
        label_end = end_at + label.end(0)
        suffix = canonical_in_label.call(label[:value]) ? label[0] : "(#{english})"
        result[start_at...label_end] = "#{korean}#{suffix}"
      elsif full_label && canonical_in_label.call(full_label[:value])
        particle = replacement_particle(old_name, korean, captured_particle)
        result[start_at...end_at] = "#{korean}#{particle}"
      else
        particle = replacement_particle(old_name, korean, captured_particle)
        suffix = "(#{english})"
        result[start_at...end_at] = "#{korean}#{suffix}#{particle}"
      end
    end
  end
  [result, found]
end

def edit_full_name(text, korean, english, pattern)
  result = text.dup
  text.to_enum(:scan, pattern).each do
    match = Regexp.last_match
    next unless outside_parentheses?(text, match.begin(0))

    finish = match.end(0)
    # Legacy patterns may consume only the Korean span or a surname label.
    trailing_label = text[finish..].match(/\A\s*\(#{Regexp.escape(english)}\)/i)
    finish += trailing_label.end(0) if trailing_label
    result[match.begin(0)...finish] = "#{korean}(#{english})"
    break
  end
  result
end

def write_table(path, rows)
  CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
    csv << HEADERS
    rows.each { |row| csv << HEADERS.map { |header| row[header] } }
  end
end

index = CSV.read(INDEX, headers: true, col_sep: "\t")
glossary = CSV.read(GLOSSARY, headers: true, col_sep: "\t")
  .to_h { |row| [row.fetch('entity_key'), row.to_h] }
inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
  .to_h { |row| [key(row), row.to_h] }
residual_mode = ARGV.delete('--residual')
candidate_rows = if residual_mode
                   CSV.read(RESIDUAL_IN, headers: true, col_sep: "\t")
                 else
                   index.select { |row| row['status'] == 'needs-context' }
                 end
pending_by_key = candidate_rows.group_by { |row| key(row) }
selected = pending_by_key.values.map(&:first).sort_by do |row|
  [row['entity_key'], RESOURCE_ORDER.fetch(row['resource']),
   row['ID_Linha'].to_i, row['Tipo_Variante'].to_s]
end

reviews = selected.map do |candidate|
  row_key = key(candidate)
  source = inventory.fetch(row_key)
  english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
  chinese = source.fetch('zh_text').to_s
  old_text = source.fetch('work_text')
  new_text = old_text.dup
  dispositions = {}
  evidence = []

  pending_by_key.fetch(row_key).map { |row| row['entity_key'] }.uniq.sort.each do |entity|
    entry = glossary.fetch(entity) { raise "missing glossary entity #{entity}" }
    raise "unconfirmed glossary entity #{entity}" unless
      entry['status'] == 'confirmed' && entry['category'] == 'person'
    korean, canonical_english = canonical_pair(entry)
    source_match = english.match?(
      /(?<![A-Za-z])#{Regexp.escape(canonical_english)}(?![A-Za-z])/i
    )
    before = new_text
    new_text, found = edit_entity(new_text, entry) if source_match
    if !source_match || !found
      dispositions[entity] = 'uncertain'
      evidence << "#{entity}: the confirmed English-indexed glossary form is #{korean}(#{canonical_english}), but this aligned source/Korean row does not establish a safe in-place occurrence to normalize; left unchanged."
    else
      dispositions[entity] = before == new_text ? 'not-an-issue' : 'accepted'
      evidence << "#{entity}: English identifies #{canonical_english}; the confirmed glossary canonical form was applied to this aligned row, with Japanese checked for pronunciation and Chinese used only as supporting evidence."
    end
  end
  if (full_name = FULL_NAMES[row_key])
    korean_full, english_full, korean_pattern = full_name
    if english.match?(/(?<![A-Za-z])#{Regexp.escape(english_full)}(?![A-Za-z])/i)
      before_full_name = new_text.dup
      new_text = edit_full_name(new_text, korean_full, english_full, korean_pattern)
      if new_text != before_full_name
        pending_by_key.fetch(row_key).map { |row| row['entity_key'] }.uniq.each do |entity|
          dispositions[entity] = 'accepted'
        end
        evidence << "Standardized the complete Korean personal-name span to #{korean_full}(#{english_full}); the aligned English, Japanese, and Chinese rows were checked together."
      end
    end
  end

  status = if new_text != old_text
             'accepted'
           elsif dispositions.value?('uncertain')
             'uncertain'
           else
             'not-an-issue'
           end
  [
    *row_key, pending_by_key.fetch(row_key).map { |row| row['entity_key'] }.uniq.sort.join('|'),
    status, old_text, new_text, evidence.join(' '), english, japanese, chinese,
    JSON.generate(dispositions)
  ].zip(HEADERS).to_h { |value, header| [header, value] }
end

raise 'duplicate proposed row key' unless reviews.map { |row| key(row) }.uniq.length == reviews.length
write_table(residual_mode ? RESIDUAL_OUT : PENDING_OUT, reviews)
puts "Wrote #{reviews.length} reviewed row keys: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
