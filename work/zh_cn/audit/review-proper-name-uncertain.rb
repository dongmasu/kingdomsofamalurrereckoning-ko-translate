#!/usr/bin/env ruby

require 'csv'
require 'json'

AUDIT = __dir__
ROOT = File.expand_path('../../..', AUDIT)
INDEX = File.join(AUDIT, 'proper-name-occurrences.tsv')
GLOSSARY = File.join(AUDIT, 'proper-name-glossary.tsv')
INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
OUT = File.join(AUDIT, 'proper-name-uncertain-review.tsv')
HEADERS = %w[
  resource ID_Linha Tipo_Variante entity_key status old new evidence
  english japanese chinese entity_dispositions_json previous_status
  previous_evidence
].freeze
PARTICLES = %w[
  에게서 에게까지 에게부터 에게도 에게나 에게는 에서부터 으로부터 으로써
  으로서는 으로서 이라며 이라는 이라서 이라고 라는 라며 라고 라서
  라고는 까지 부터 처럼 보다 조차 마저 라도 든지 든가 은 는 이 가 을
  를 과 와 의 에게 께 에서 으로 로 에 아 야 도 만 마다
  답네 뿐이야 였지 입니다 라오 겠지
].freeze

ALIASES = {
  'person:drewn' => %w[드루언 드레운 드윈 드륀],
  'person:esklad' => %w[에스크라드 에스클래드 에스클래드],
  'person:dyth' => %w[디스],
  'person:ealfhelm' => %w[에일프헬름 에알프헬름 이얼펠름 엘프헬름 이얼프헬름],
  'person:eswin' => %w[에즈윈],
  'person:arick' => %w[애릭],
  'person:fahrlang' => %w[파흘랑 팔랑],
  'person:arden' => %w[아덴 아르덴],
  'person:morkan' => %w[모칸],
  'person:mallion' => %w[맬리언 말리언],
  'person:atheof' => %w[에시오프],
  'person:derfel' => %w[델펠 데르펠],
  'person:einar' => %w[아이나르],
  'person:meroch' => %w[메록],
  'person:grastar' => %w[그라스타르],
  'person:cydan' => %w[시단 시던 사이던],
  'person:eilaly' => %w[에일랠리],
  'person:emundas' => %w[에먼더스],
  'person:varen' => %w[바렌],
  'person:ventrinio' => %w[벤트리니오],
  'person:donnoh' => %w[돈노],
  'person:maxen' => %w[막센],
  'person:maura' => %w[마우라 모우라],
  'person:eriad' => %w[에리앗 에리어드],
  'faction:house-of-pride' => %w[긍지]
}.freeze

FULL_NAMES = {
  ['default', '3853'] => {
    'english' => 'Eswin Ealfhelm',
    'variants' => ['에스윈 에일프헬름'],
    'korean' => '에스윈 이알프헬름'
  },
  ['default', '7013'] => {
    'english' => 'Eswin Ealfhelm',
    'variants' => ['에스윈 에알프헬름'],
    'korean' => '에스윈 이알프헬름'
  },
  ['default', '10150'] => {
    'english' => 'Esklad Teiner',
    'variants' => ['에스크라드 타이너'],
    'korean' => '에스클라드 타이너'
  },
  ['default', '19828'] => {
    'english' => 'Mattix Dace',
    'variants' => ['매틱스 데이스'],
    'korean' => '매틱스 데이스'
  },
  ['default', '21186'] => {
    'english' => 'Nanne Hanri',
    'variants' => ['난네 한리'],
    'korean' => '난네 한리'
  },
  ['default', '25517'] => {
    'english' => 'Einar Longnose',
    'variants' => ['아이나르 롱노즈'],
    'korean' => '아이너 롱노즈'
  },
  ['default', '29677'] => {
    'english' => 'Drewn Ansilla',
    'variants' => ['드루언 안실라'],
    'korean' => '드루엔 안실라'
  },
  ['default', '30335'] => {
    'english' => 'Drewn Ansilla',
    'variants' => ['드륀 안실라'],
    'korean' => '드루엔 안실라'
  },
  ['default', '30924'] => {
    'english' => 'Drewn Ansilla',
    'variants' => ['드륀 안실라'],
    'korean' => '드루엔 안실라'
  },
  ['default', '34319'] => {
    'english' => 'Drewn Ansilla',
    'variants' => ['드루언 안실라'],
    'korean' => '드루엔 안실라'
  },
  ['default', '35227'] => {
    'english' => 'Drewn Ansilla',
    'variants' => ['드루언 안실라'],
    'korean' => '드루엔 안실라'
  },
  ['default', '35376'] => {
    'english' => 'Drewn Ansilla',
    'variants' => ['드루언 안실라'],
    'korean' => '드루엔 안실라'
  },
  ['default', '38395'] => {
    'english' => 'Eswin Ealfhelm',
    'variants' => ['에스윈 이얼펠름'],
    'korean' => '에스윈 이알프헬름'
  },
  ['default', '40968'] => {
    'english' => 'Eswin Ealfhelm',
    'variants' => ['에스윈 이얼헬름'],
    'korean' => '에스윈 이알프헬름'
  },
  ['default', '42518'] => {
    'english' => 'Drewn Ansilla',
    'variants' => ['드루언 안실라'],
    'korean' => '드루엔 안실라'
  },
  ['default', '48182'] => {
    'english' => 'Eswin Ealfhelm',
    'variants' => ['에스윈 엘프헬름'],
    'korean' => '에스윈 이알프헬름'
  },
  ['default', '51982'] => {
    'english' => 'Eswin Ealfhelm',
    'variants' => ['에즈윈 이얼프헬름'],
    'korean' => '에스윈 이알프헬름'
  },
  ['default', '57166'] => {
    'english' => 'Drewn Ansilla',
    'variants' => ['드레운 안실라'],
    'korean' => '드루엔 안실라'
  },
  ['default', '57651'] => {
    'english' => 'Drewn Ansilla',
    'variants' => ['드레운 안실라'],
    'korean' => '드루엔 안실라'
  },
  ['default', '57930'] => {
    'english' => 'Eswin Ealfhelm',
    'variants' => ['에스윈 엘프헬름'],
    'korean' => '에스윈 이알프헬름'
  },
  ['default', '59946'] => {
    'english' => 'Drewn Ansilla',
    'variants' => ['드루언 안실라'],
    'korean' => '드루엔 안실라'
  },
  ['default', '61426'] => {
    'english' => 'Drewn Ansilla',
    'variants' => ['드루언 안실라'],
    'korean' => '드루엔 안실라'
  }
}

KEEP_UNCERTAIN = %w[
  person:gerald person:grastar person:jeibir person:skoria person:walen
].freeze

FULL_NAMES.merge!(
  ['default', '14888'] => {
    'english' => 'Patrick Morkan',
    'variants' => ['패트릭 모르칸'],
    'korean' => '패트릭 모르칸'
  },
  ['default', '26296'] => {
    'english' => 'Patrick Morkan',
    'variants' => ['패트릭 모르칸'],
    'korean' => '패트릭 모르칸'
  },
  ['default', '32091'] => {
    'english' => 'Patrick Morkan',
    'variants' => ['패트릭 모칸'],
    'korean' => '패트릭 모르칸'
  },
  ['default', '37370'] => {
    'english' => 'Patrick Morkan',
    'variants' => ['패트릭 모칸'],
    'korean' => '패트릭 모르칸'
  },
  ['default', '37896'] => {
    'english' => 'Patrick Morkan',
    'variants' => ['패트릭 모칸'],
    'korean' => '패트릭 모르칸'
  },
  ['default', '39071'] => {
    'english' => 'Patrick Morkan',
    'variants' => ['패트릭 모칸'],
    'korean' => '패트릭 모르칸'
  },
  ['default', '41900'] => {
    'english' => 'Patrick Morkan',
    'variants' => ['패트릭 모칸'],
    'korean' => '패트릭 모르칸'
  },
  ['default', '43815'] => {
    'english' => 'Patrick Morkan',
    'variants' => ['패트릭 모칸'],
    'korean' => '패트릭 모르칸'
  },
  ['default', '48641'] => {
    'english' => 'Patrick Morkan',
    'variants' => ['패트릭 모칸'],
    'korean' => '패트릭 모르칸'
  },
  ['default', '49534'] => {
    'english' => 'Patrick Morkan',
    'variants' => ['패트릭 모르칸'],
    'korean' => '패트릭 모르칸'
  },
  ['default', '50297'] => {
    'english' => 'Patrick Morkan',
    'variants' => ['패트릭 모칸'],
    'korean' => '패트릭 모르칸'
  },
  ['default', '9041'] => {
    'english' => 'Mattix Dace',
    'variants' => ['매틱스 데이스'],
    'korean' => '매틱스 데이스'
  },
  ['default', '30753'] => {
    'english' => 'Mattix Dace',
    'variants' => ['매틱스 데이스'],
    'korean' => '매틱스 데이스'
  },
  ['default', '34911'] => {
    'english' => 'Mattix Dace',
    'variants' => ['매틱스 데이스'],
    'korean' => '매틱스 데이스'
  },
  ['default', '38111'] => {
    'english' => 'Mattix Dace',
    'variants' => ['매틱스 데이스'],
    'korean' => '매틱스 데이스'
  },
  ['default', '38610'] => {
    'english' => 'Mattix Dace',
    'variants' => ['매틱스 데이스'],
    'korean' => '매틱스 데이스'
  },
  ['default', '39252'] => {
    'english' => 'Mattix Dace',
    'variants' => ['매틱스 데이스'],
    'korean' => '매틱스 데이스'
  },
  ['default', '40298'] => {
    'english' => 'Mattix Dace',
    'variants' => ['매틱스 데이스'],
    'korean' => '매틱스 데이스'
  },
  ['default', '43832'] => {
    'english' => 'Mattix Dace',
    'variants' => ['매틱스 데이스'],
    'korean' => '매틱스 데이스'
  },
  ['default', '9798'] => {
    'english' => 'Nanne Hanri',
    'variants' => ['난네 한리'],
    'korean' => '난네 한리'
  },
  ['default', '20779'] => {
    'english' => 'Nanne Hanri',
    'variants' => ['난네 한리'],
    'korean' => '난네 한리'
  },
  ['default', '30149'] => {
    'english' => 'Nanne Hanri',
    'variants' => ['난네 한리'],
    'korean' => '난네 한리'
  },
  ['default', '30543'] => {
    'english' => 'Nanne Hanri',
    'variants' => ['난네 한리'],
    'korean' => '난네 한리'
  },
  ['default', '31721'] => {
    'english' => 'Nanne Hanri',
    'variants' => ['난네 한리'],
    'korean' => '난네 한리'
  },
  ['default', '33659'] => {
    'english' => 'Nanne Hanri',
    'variants' => ['난네 한리'],
    'korean' => '난네 한리'
  },
  ['default', '41253'] => {
    'english' => 'Nanne Hanri',
    'variants' => ['난네 한리'],
    'korean' => '난네 한리'
  },
  ['default', '43831'] => {
    'english' => 'Nanne Hanri',
    'variants' => ['난네 한리'],
    'korean' => '난네 한리'
  },
  ['default', '30644'] => {
    'english' => 'Elbin Meroch',
    'variants' => ['엘빈 메로크'],
    'korean' => '엘빈 메로크'
  },
  ['default', '41009'] => {
    'english' => 'Elbin Meroch',
    'variants' => ['엘빈 메로크'],
    'korean' => '엘빈 메로크'
  },
  ['default', '48573'] => {
    'english' => 'Elbin Meroch',
    'variants' => ['엘빈 메로크'],
    'korean' => '엘빈 메로크'
  },
  ['default', '37358'] => {
    'english' => 'Varen Seawine',
    'variants' => ['바렌 시와인'],
    'korean' => '베런 시와인'
  },
  ['default', '38472'] => {
    'english' => 'Ventrinio Descellini',
    'variants' => ['벤트리니오 데셀리니'],
    'korean' => '벤티리니오 데셀리니'
  },
  ['default', '40575'] => {
    'english' => 'Ventrinio Descellini',
    'variants' => ['벤트리니오 데셀리니'],
    'korean' => '벤티리니오 데셀리니'
  }
)
FULL_NAMES.merge!(
  ['default', '40968'] => {
    'english' => 'Eswin Ealfhelm',
    'variants' => ['에스윈 이얼헬름', '에스윈 이얼프헬름'],
    'korean' => '에스윈 이알프헬름'
  },
  ['default', '46678'] => {
    'english' => 'Drewn Ansilla',
    'variants' => ['드루언 안실라'],
    'korean' => '드루엔 안실라'
  },
  ['default', '48573'] => {
    'english' => 'Elbin Meroch',
    'variants' => ['엘빈 메로크', '엘빈 메록'],
    'korean' => '엘빈 메로크'
  },
  ['default', '32847'] => {
    'english' => 'Eilaly Airancourt',
    'variants' => ['에일랠리 에어랑쿠르'],
    'korean' => '에일랠리 에어랑쿠르'
  },
  ['default', '20869'] => {
    'english' => 'Nareen Farm',
    'variants' => ['나린 농장'],
    'korean' => '나린 농장'
  },
  ['default', '34424'] => {
    'english' => 'Morkan House',
    'variants' => ['모르칸 가문'],
    'korean' => '모르칸 가문'
  }
)
FULL_NAMES.freeze

def key(row)
  [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
end

def outside_parentheses?(text, position)
  text[0...position].count('(') <= text[0...position].count(')')
end

def source_has?(english, term)
  english.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
end

def replacement_for(text, variant, korean, english)
  particle_pattern = PARTICLES.sort_by { |value| -value.length }
    .map { |value| Regexp.escape(value) }.join('|')
  pattern = /(?<!\p{Hangul})#{Regexp.escape(variant)}(?<particle>#{particle_pattern})?(?!\p{Hangul})/
  matches = []
  text.to_enum(:scan, pattern).each do
    match = Regexp.last_match
    next unless outside_parentheses?(text, match.begin(0))
    matches << [match.begin(0), match.end(0), match[0], match[:particle]]
  end
  return [text, false] if matches.empty?

  result = text.dup
  matches.reverse_each do |start_at, end_at, old_token, particle|
    old_name = particle ? old_token[0...-particle.length] : old_token
    tail = result[end_at..]
    if tail.match?(/\A\s+[\p{Hangul}]+\s*\([^()\r\n]*#{Regexp.escape(english)}[^()\r\n]*\)/i)
      next
    end
    label = tail.match(/\A\s*\((?<value>[^()\r\n]*)\)/)
    if label
      label_value = label[:value]
      if source_has?(label_value, english)
        result[start_at...end_at] = "#{korean}#{particle}"
      else
        result[start_at...(end_at + label.end(0))] = "#{korean}(#{english})#{particle}"
      end
    else
      result[start_at...end_at] = "#{korean}(#{english})#{particle}"
    end
    next if old_name == korean
  end
  [result, result != text]
end

index = CSV.read(INDEX, headers: true, col_sep: "\t")
glossary = CSV.read(GLOSSARY, headers: true, col_sep: "\t")
  .to_h { |row| [row.fetch('entity_key'), row.to_h] }
inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
  .to_h { |row| [key(row), row.to_h] }
uncertain = index.select { |row| row['status'] == 'uncertain' }
by_key = uncertain.group_by { |row| key(row) }

reviews = by_key.map do |row_key, entries|
  source = inventory.fetch(row_key)
  english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
  chinese = source.fetch('zh_text').to_s
  old_text = source.fetch('work_text')
  new_text = old_text.dup
  dispositions = {}
  reasons = []

  entries.map { |entry| entry['entity_key'] }.uniq.sort.each do |entity_key|
    entity = glossary.fetch(entity_key)
    canonical_english = entity.fetch('english_canonical')
    canonical_korean = entity.fetch('korean_canonical')
      .sub(/\s*\(#{Regexp.escape(canonical_english)}\)\s*\z/i, '')
    unless source_has?(english, canonical_english)
      dispositions[entity_key] = 'uncertain'
      reasons << "#{entity_key}: aligned English does not verify the indexed name."
      next
    end
    full = FULL_NAMES[row_key.first(2)]
    full_supported = full && source_has?(english, full.fetch('english'))
    full_component = full_supported &&
      full.fetch('english').split(/\s+/).include?(canonical_english)
    full_name_needs_update = full_supported &&
      full.fetch('variants').any? { |candidate| old_text.include?(candidate) } &&
      !old_text.include?("#{full.fetch('korean')}(#{full.fetch('english')})")

    if KEEP_UNCERTAIN.include?(entity_key)
      if new_text.include?("#{canonical_korean}(#{canonical_english})")
        dispositions[entity_key] = 'not-an-issue'
        reasons << "#{entity_key}: the exact row already uses the source-supported bilingual form; its unresolved broader identity/category does not alter this cell."
      else
        dispositions[entity_key] = 'uncertain'
        reasons << "#{entity_key}: identity/category ambiguity remains material after the focused English/JA/ZH row check."
      end
      next
    end

    if full_supported
      variant = full.fetch('variants').find { |candidate| new_text.include?(candidate) }
      if variant
        label_pattern = /\A\s*\(#{Regexp.escape(full.fetch('english'))}\)/
        following = new_text[new_text.index(variant) + variant.length..]
        if following.match?(label_pattern)
          replacement = "#{full.fetch('korean')}(#{full.fetch('english')})"
          new_text.sub!(variant + following.match(label_pattern)[0], replacement)
        else
          new_text.sub!(variant, "#{full.fetch('korean')}(#{full.fetch('english')})")
        end
      elsif new_text.match?(/(?<!\p{Hangul})#{Regexp.escape(full.fetch('korean'))}\(#{Regexp.escape(full.fetch('english'))}\)/)
        # Already in the selected full-name form.
      end
    end

    variants = ([canonical_korean] + entity.fetch('korean_variants', '').split('|') +
      ALIASES.fetch(entity_key, [])).reject(&:empty?).uniq
      .sort_by { |variant| -variant.length }
    before = new_text
    found = false
    variants.each do |variant|
      new_text, matched = replacement_for(new_text, variant, canonical_korean, canonical_english)
      found ||= matched
    end

    label_match = new_text.scan(/\(([^()\r\n]+)\)/).flatten.any? do |label|
      source_has?(label, canonical_english)
    end
    if found && new_text != before
      dispositions[entity_key] = 'accepted'
      reasons << "#{entity_key}: standardized to #{canonical_korean}(#{canonical_english}) using English as the identity anchor; JA pronunciation and ZH meaning checked."
    elsif full_component && full_name_needs_update
      dispositions[entity_key] = 'accepted'
      reasons << "#{entity_key}: standardized as part of the complete source-backed name #{full.fetch('korean')}(#{full.fetch('english')}); component labels are not duplicated."
    elsif label_match
      dispositions[entity_key] = 'not-an-issue'
      reasons << "#{entity_key}: the exact row already carries a source-supported English label; no text change needed."
    else
      dispositions[entity_key] = 'uncertain'
      reasons << "#{entity_key}: no safe Korean name span was found in the exact aligned row; text left unchanged."
    end
  end

  status = if new_text != old_text
             'accepted'
           elsif dispositions.value?('uncertain')
             'uncertain'
           else
             'not-an-issue'
           end
  {
    'resource' => row_key[0], 'ID_Linha' => row_key[1],
    'Tipo_Variante' => row_key[2],
    'entity_key' => entries.map { |entry| entry['entity_key'] }.uniq.sort.join('|'),
    'status' => status, 'old' => old_text, 'new' => new_text,
    'evidence' => reasons.join(' '), 'english' => english,
    'japanese' => japanese, 'chinese' => chinese,
    'entity_dispositions_json' => JSON.generate(dispositions),
    'previous_status' => JSON.generate(entries.to_h { |entry| [entry['entity_key'], entry['status']] }),
    'previous_evidence' => JSON.generate(entries.to_h { |entry| [entry['entity_key'], entry['evidence']] })
  }
end

CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
  csv << HEADERS
  reviews.sort_by { |row| [row['resource'], row['ID_Linha'].to_i, row['Tipo_Variante']] }
    .each { |row| csv << HEADERS.map { |header| row[header] } }
end

puts "Wrote #{reviews.length} distinct row keys: #{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
