#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
abort 'usage: review-proper-name-monsters-continuation.rb START_D' unless ARGV.length == 1
start_d = Integer(ARGV.fetch(0))
raise 'START_D must be positive' unless start_d.positive?

definitions = [
  {
    'entity_key' => 'monster:boggart', 'english_canonical' => 'Boggart',
    'category' => 'monster', 'korean_canonical' => '보가트(Boggart)',
    'english_aliases' => '', 'korean_variants' => '보거트|보기트',
    'status' => 'confirmed',
    'notes' => 'EN identifies the named Boggart creature; JA ボガート and ZH 博格特 corroborate. Normalize only source-matched Korean forms 보가트/보거트/보기트. Source-supported full compounds such as Boggart Plaguebearer are paired atomically; preserve existing full compound labels and particles.'
  },
  {
    'entity_key' => 'people:jottun', 'english_canonical' => 'Jottun',
    'category' => 'people', 'korean_canonical' => '요툰(Jottun)',
    'english_aliases' => '', 'korean_variants' => '조툰|요튼',
    'status' => 'confirmed',
    'notes' => 'Reuse the existing confirmed people:jottun definition and completed 306-row review; do not duplicate or reopen its terminal occurrence decisions. Jottun language derivatives such as 요툰어(Jottun) remain valid.'
  },
  {
    'entity_key' => 'monster:balor', 'english_canonical' => 'Balor',
    'category' => 'monster', 'korean_canonical' => '발로르(Balor)',
    'english_aliases' => '', 'korean_variants' => '발로|발러|베일러|베이러',
    'status' => 'confirmed',
    'notes' => 'EN identifies Balor; JA ベイラー and ZH 巴洛尔 corroborate the monster name. Existing accepted rows establish 발로르(Balor). Keep Greater Niskaru, Balor and Niskaru Lord Balor as source-specific atomic compounds; Balor’s Crossing is a place label and is not classified as the monster.'
  },
  {
    'entity_key' => 'monster:ettin', 'english_canonical' => 'Ettin',
    'category' => 'monster', 'korean_canonical' => '에틴(Ettin)',
    'english_aliases' => '', 'korean_variants' => '',
    'status' => 'confirmed',
    'notes' => 'EN identifies the named Ettin creature; JA エティン and ZH 双头魔 corroborate. Normalize source-matched Korean 에틴 spans and preserve complete role/title compounds, particles, and existing bilingual labels.'
  },
  {
    'entity_key' => 'monster:banshaen', 'english_canonical' => 'Banshaen',
    'category' => 'monster', 'korean_canonical' => '밴션(Banshaen)',
    'english_aliases' => '', 'korean_variants' => '밴셴|밴시엔|밴시언|밴샤엔|반셰인|반샤엔|반시엔',
    'status' => 'confirmed',
    'notes' => 'EN identifies the named Banshaen creature; JA バンシェン and ZH 蛇妖 corroborate. Normalize only source-matched Korean variants to 밴션(Banshaen), preserving complete Priestess/Queen/Cave Banshaen labels and particles.'
  }
].freeze

expected_source_rows = {
  'monster:boggart' => 58,
  'people:jottun' => 306,
  'monster:balor' => 87,
  'monster:ettin' => 99,
  'monster:banshaen' => 45
}.freeze

root_variants = {
  'monster:boggart' => %w[보가트 보거트 보기트],
  'people:jottun' => %w[요툰 조툰 요튼],
  'monster:balor' => %w[발로르 발로 발러 베일러 베이러],
  'monster:ettin' => %w[에틴],
  'monster:banshaen' => %w[밴션 밴셴 밴시엔 밴시언 밴샤엔 반셰인 반샤엔 반시엔]
}.freeze

particle_pattern = %w[
  에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
  에게 에서도 에서는 에까지 에서 에도 에는 으로도 으로는 으로만 으로
  로부터 로도 로는 로만 한테서 한테에게 한테 한테는 한테도 엔 처럼 만큼
  보다 행 였던 이었던 까지 부터 이라며 이라는 이라서 이라고 이지 이야
  이죠 이네 이군 이구나 이라니 이래 이잖아 이라 라 은 는 이 가 을 를
  와 과 의 에 로 도 만 들 족 족은 족이 족을 어 어로 어의
].uniq.sort_by { |value| -value.length }
  .map { |value| Regexp.escape(value) }.join('|')

root_patterns = root_variants.transform_values do |values|
  values.sort_by { |value| -value.length }.map { |value| Regexp.escape(value) }.join('|')
end

compound_rules = [
  {
    entity: 'monster:boggart',
    english: /(?<![A-Za-z])Boggart\s+Plaguebearer(?![A-Za-z])/i,
    korean: /(?<![가-힣])(?:보가트|보거트|보기트)\s+역병\s*전파자(?:\s*\([^()]*\))?/,
    canonical: '보가트 역병 전파자(Boggart Plaguebearer)'
  },
  {
    entity: 'monster:boggart',
    english: /(?<![A-Za-z])Boggart\s+Zealot(?![A-Za-z])/i,
    korean: /(?<![가-힣])(?:보가트|보거트|보기트)\s+광신도(?:\s*\([^()]*\))?/,
    canonical: '보가트 광신도(Boggart Zealot)'
  },
  {
    entity: 'monster:boggart',
    english: /(?<![A-Za-z])Boggart\s+Tumbler(?![A-Za-z])/i,
    korean: /(?<![가-힣])(?:보가트|보거트|보기트)\s+텀블러(?:\s*\([^()]*\))?/,
    canonical: '보가트 텀블러(Boggart Tumbler)'
  },
  {
    entity: 'monster:boggart',
    english: /(?<![A-Za-z])Boggart\s+Mask(?![A-Za-z])/i,
    korean: /(?<![가-힣])(?:보가트|보거트|보기트)\s+가면(?:\s*\([^()]*\))?/,
    canonical: '보가트 가면(Boggart Mask)'
  },
  {
    entity: 'monster:ettin',
    english: /(?<![A-Za-z])Ettin\s+Shaman(?![A-Za-z])/i,
    korean: /(?<![가-힣])에틴\s+주술사(?:\s*\([^()]*\))?/,
    canonical: '에틴 주술사(Ettin Shaman)'
  },
  {
    entity: 'monster:ettin',
    english: /(?<![A-Za-z])Ettin\s+WarPriest(?![A-Za-z])/i,
    korean: /(?<![가-힣])에틴\s+전쟁\s*사제(?:\s*\([^()]*\))?/,
    canonical: '에틴 전쟁 사제(Ettin WarPriest)'
  },
  {
    entity: 'monster:ettin',
    english: /(?<![A-Za-z])Ettin\s+Brute(?![A-Za-z])/i,
    korean: /(?<![가-힣])에틴\s+덩치(?:\s*\([^()]*\))?/,
    canonical: '에틴 덩치(Ettin Brute)'
  },
  {
    entity: 'monster:ettin',
    english: /(?<![A-Za-z])Ettin\s+Chief(?![A-Za-z])/i,
    korean: /(?<![가-힣])에틴\s+우두머리(?:\s*\([^()]*\))?/,
    canonical: '에틴 우두머리(Ettin Chief)'
  },
  {
    entity: 'monster:ettin',
    english: /(?<![A-Za-z])Ettin\s+Slave(?![A-Za-z])/i,
    korean: /(?<![가-힣])에틴\s+노예(?:\s*\([^()]*\))?/,
    canonical: '에틴 노예(Ettin Slave)'
  },
  {
    entity: 'monster:banshaen',
    english: /(?<![A-Za-z])Banshaen\s+Priestess(?![A-Za-z])/i,
    korean: /(?<![가-힣])(?:밴션|밴셴|밴시엔|밴시언|밴샤엔|반셰인|반샤엔|반시엔)\s+여사제(?:\s*\([^()]*\))?/,
    canonical: '밴션 여사제(Banshaen Priestess)'
  },
  {
    entity: 'monster:banshaen',
    english: /(?<![A-Za-z])Banshaen\s+Queen(?![A-Za-z])/i,
    korean: /(?<![가-힣])(?:밴션|밴셴|밴시엔|밴시언|밴샤엔|반셰인|반샤엔|반시엔)\s+여왕(?:\s*\([^()]*\))?/,
    canonical: '밴션 여왕(Banshaen Queen)'
  },
  {
    entity: 'monster:banshaen',
    english: /(?<![A-Za-z])Cave\s+Banshaen(?![A-Za-z])/i,
    korean: /(?<![가-힣])동굴\s+(?:밴션|밴셴|밴시엔|밴시언|밴샤엔|반셰인|반샤엔|반시엔)(?:\s*\([^()]*\))?/,
    canonical: '동굴 밴션(Cave Banshaen)'
  },
  {
    entity: 'monster:balor',
    english: /(?<![A-Za-z])Niskaru\s+Lord\s+Balor(?![A-Za-z])/i,
    korean: /(?<![가-힣])니스카루(?:\s*\(Niskaru\))?\s+군주\s+(?:발로르|발로|발러|베일러|베이러)(?:\s*\([^()]*\))?/,
    canonical: '니스카루 군주 발로르(Niskaru Lord Balor)'
  },
  {
    entity: 'monster:balor',
    english: /(?<![A-Za-z])Greater\s+Niskaru,\s*Balor(?![A-Za-z])/i,
    korean: /(?<![가-힣])상급\s+니스카루(?:\s*\(Niskaru\))?\s+(?:발로르|발로|발러|베일러|베이러)(?:\s*\([^()]*\))?/,
    canonical: '상급 니스카루 발로르(Greater Niskaru, Balor)'
  },
  {
    entity: 'monster:balor',
    english: /(?<![A-Za-z])Balor\s+Head(?![A-Za-z])/i,
    korean: /(?<![가-힣])(?:발로르|발로|발러|베일러|베이러)(?:\s*\(Balor\))?\s*의\s*머리(?:\s*\([^()]*\))?/,
    canonical: '발로르의 머리(Balor Head)'
  },
  {
    entity: 'monster:balor',
    english: /(?<![A-Za-z])Balor\s+Left\s+Arm(?![A-Za-z])/i,
    korean: /(?<![가-힣])(?:발로르|발로|발러|베일러|베이러)(?:\s*\(Balor\))?\s*의\s*왼팔(?:\s*\([^()]*\))?/,
    canonical: '발로르의 왼팔(Balor Left Arm)'
  },
  {
    entity: 'monster:balor',
    english: /(?<![A-Za-z])Balor\s+Right\s+Arm(?![A-Za-z])/i,
    korean: /(?<![가-힣])(?:발로르|발로|발러|베일러|베이러)(?:\s*\(Balor\))?\s*의\s*오른팔(?:\s*\([^()]*\))?/,
    canonical: '발로르의 오른팔(Balor Right Arm)'
  }
].freeze

def source_visible_text(source)
  JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
    .gsub(/\$[^$]*\$/, ' ')
end

def exact_english_label?(visible_english, label)
  return false if label.to_s.empty?

  visible_english.match?(/(?<![A-Za-z])#{Regexp.escape(label)}(?![A-Za-z])/i)
end

def review_entity(entity, source, old, current_text, definition, root_patterns,
                  compound_rules, particle_pattern)
  visible_english = source_visible_text(source)
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n")
  chinese = source.fetch('zh_text').to_s
  canonical_ko = definition.fetch('korean_canonical').sub(/\(.+\)\z/, '')
  canonical_english = definition.fetch('english_canonical')
  entity_hit = visible_english.match?(
    /(?<![A-Za-z])#{Regexp.escape(canonical_english)}(?![A-Za-z])/i
  )
  context = lambda do |note|
    "EN primary: #{visible_english.gsub(/\s+/, ' ')[0, 220].inspect}; " \
      "JA corroboration: #{japanese.gsub(/\s+/, ' ')[0, 140].inspect}; " \
      "ZH corroboration: #{chinese.gsub(/\s+/, ' ')[0, 120].inspect}; " \
      "KO context: #{old.gsub(/\s+/, ' ')[0, 150].inspect}. #{note}"
  end

  unless entity_hit
    return ['excluded', current_text,
            context.call('The English hit is not visible outside an opaque variable; excluded from the named-monster review.')]
  end

  if entity == 'monster:balor' &&
     visible_english.match?(/(?<![A-Za-z])Balor['’]s\s+Crossing(?![A-Za-z])/i)
    return ['excluded', current_text,
            context.call("Balor's Crossing is a place/route label in this source row, not a monster reference; excluded from monster:balor.")]
  end

  text = current_text.dup
  compound_rules.select { |rule| rule[:entity] == entity }.each do |rule|
    next unless visible_english.match?(rule[:english])

    korean_pattern = Regexp.new(
      "(?<compound>#{rule[:korean].source})(?<particle>#{particle_pattern})?"
    )
    text.to_enum(:scan, korean_pattern).map { Regexp.last_match.dup }.reverse_each do |match|
      replacement = "#{rule[:canonical]}#{match[:particle]}"
      text[match.begin(0)...match.end(0)] = replacement
    end
  end

  names = root_patterns.fetch(entity)
  korean_pattern = Regexp.new(
    "(?<![가-힣])(?<name>#{names})(?:\\s*\\((?<label>[^()]*)\\))?" \
    "(?<particle>#{particle_pattern})?(?![가-힣])"
  )
  found = false
  text.to_enum(:scan, korean_pattern).map { Regexp.last_match.dup }.reverse_each do |match|
    next unless text[0...match.begin(0)].count('(') <= text[0...match.begin(0)].count(')')

    found = true
    label = match[:label]
    particle = match[:particle].to_s
    tail = text[match.end(0)..]
    atomic_tail = tail.match(
      /\A\s+[\p{Hangul}\s·'’\-]{1,80}\s*\((?<full_label>[^()]*)\)/
    )
    if atomic_tail &&
       exact_english_label?(visible_english, atomic_tail[:full_label]) &&
       atomic_tail[:full_label].match?(
         /(?<![A-Za-z])#{Regexp.escape(canonical_english)}(?![A-Za-z])/i
       )
      next
    end

    if label && exact_english_label?(visible_english, label)
      replacement = "#{canonical_ko}(#{label})#{particle}"
    elsif label && label.match?(/[A-Za-z]/)
      replacement = "#{canonical_ko}(#{label})#{particle}"
    else
      replacement = "#{canonical_ko}(#{canonical_english})#{particle}"
    end
    next if replacement == match[0]

    text[match.begin(0)...match.end(0)] = replacement
  end

  status = if !found
             'uncertain'
           elsif text == old
             'not-an-issue'
           else
             'accepted'
           end
  note = if found && text != old
           'Normalized only bounded Korean spans supported by the aligned English source; JA/ZH corroborate. Complete source-supported compounds and existing full bilingual labels remain atomic; particles, placeholders, line breaks, and surrounding text are preserved.'
         elsif found
           'The canonical Korean name or a complete source-supported bilingual compound is already present; retained without nested annotation.'
         else
           'The English source identifies this entity, but no safely bounded recognized Korean counterpart was found; left unchanged and recorded as uncertain rather than inventing a translation.'
         end
  [status, text, context.call(note)]
end

glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
by_entity = glossary.to_h { |row| [row['entity_key'], row.to_h] }
definitions.each do |definition|
  existing = by_entity[definition.fetch('entity_key')]
  if existing
    raise "conflicting canonical for #{definition['entity_key']}" unless
      existing['english_canonical'] == definition['english_canonical'] &&
      existing['korean_canonical'] == definition['korean_canonical'] &&
      existing['status'] == 'confirmed'
    definition.replace(existing)
  end
end

m.refresh_inventory
inventory = m.table(m::INVENTORY)
generated = build_occurrences(inventory, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
generated_counts = generated.group_by { |row| row.fetch('entity_key') }
  .transform_values(&:length)
expected_source_rows.each do |entity, count|
  raise "aligned source row count changed for #{entity}" unless generated_counts[entity] == count
end

new_definitions = definitions.reject { |definition| by_entity.key?(definition['entity_key']) }
new_definitions.each do |definition|
  matches = generated.select { |row| row['entity_key'] == definition['entity_key'] }
  definition['source_rows'] = matches.map do |row|
    [row['resource'], row['ID_Linha'], row['Tipo_Variante']].reject(&:empty?).join(':')
  end.join('|')
  definition['evidence_ids'] = definition['source_rows']
  definition['notes'] += " Reviewed against refreshed aligned inventory; #{matches.length} EN source rows with corresponding JA/ZH context."
end

index = m.table(m::INDEX)
index_by_entity_key = {}
index.each do |row|
  key = [row['entity_key'], *m.key(row)]
  raise "duplicate existing index key #{key.inspect}" if index_by_entity_key.key?(key)

  index_by_entity_key[key] = row
end
generated.each do |row|
  key = [row['entity_key'], *m.key(row)]
  next unless index_by_entity_key.key?(key)

  indexed = index_by_entity_key.fetch(key)
  raise "conflicting existing matched-English row #{key.inspect}" unless
    indexed['matched_english'].to_s.split('|').any? do |term|
      term.casecmp?(row['matched_english'].to_s.split('|').first.to_s)
    end
end

unless new_definitions.empty?
  m.write_table(
    glossary_path, glossary.headers,
    glossary.map(&:to_h) + new_definitions
  )
end
missing_index = generated.reject do |row|
  index_by_entity_key.key?([row['entity_key'], *m.key(row)])
end
unless missing_index.empty?
  m.write_table(m::INDEX, index.headers, index.map(&:to_h) + missing_index)
end

pending = m.table(m::INDEX).select { |row| row['status'] == 'needs-context' }
  .to_h { |row| [[row['entity_key'], *m.key(row)], row] }
active_occurrences = generated.select do |row|
  pending.key?([row['entity_key'], *m.key(row)])
end
sources = inventory.to_h { |row| [m.key(row), row.to_h] }
grouped = active_occurrences.group_by { |row| m.key(row) }

reviews = grouped.map do |key, occurrences|
  source = sources.fetch(key)
  old = source.fetch('work_text')
  text = old.dup
  dispositions = {}
  evidence = []
  occurrences.sort_by { |row| definitions.index { |d| d['entity_key'] == row['entity_key'] } }
    .each do |occurrence|
      entity = occurrence.fetch('entity_key')
      definition = definitions.find { |row| row['entity_key'] == entity }
      status, text, entity_evidence = review_entity(
        entity, source, old, text, definition, root_patterns,
        compound_rules, particle_pattern
      )
      dispositions[entity] = status
      evidence << "#{entity}: #{entity_evidence}"
    end
  statuses = dispositions.values
  row_status = if statuses.include?('accepted')
                 'accepted'
               elsif statuses.include?('uncertain')
                 'uncertain'
               elsif statuses.all?('excluded')
                 'excluded'
               else
                 'not-an-issue'
               end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => dispositions.keys.join('|'), 'status' => row_status,
    'old' => old, 'new' => text, 'evidence' => evidence.join(' || '),
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end.sort_by do |row|
  [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
end

raise 'duplicate row-level proposal' unless reviews.map { |row| m.key(row) }.uniq.length == reviews.length
raise 'a non-accepted disposition proposes a text edit' if reviews.any? do |row|
  row['old'] != row['new'] && row['status'] != 'accepted'
end

out = File.join(__dir__, 'proper-name-reviewed-monsters-continuation.tsv')
m.write_table(out, m::HEADERS, reviews)
puts "Reviewed source rows: #{generated_counts.inspect}"
puts "Pending row-level manifest keys: #{reviews.length}"
puts "Row dispositions: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
puts "Existing Jottun rows retained as already reviewed: #{generated_counts.fetch('people:jottun')}."
m.run(out, start_d, nil)
