#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
abort 'usage: review-proper-name-monster-plurals-continuation.rb START_D' unless ARGV.length == 1
start_d = Integer(ARGV.fetch(0))
raise 'START_D must be positive' unless start_d.positive?

SPECS = [
  {
    entity: 'monster:boggart', plural: 'Boggarts', canonical: 'Boggart',
    korean: '보가트', variants: %w[보가트 보거트 보기트]
  },
  {
    entity: 'monster:ettin', plural: 'Ettins', canonical: 'Ettin',
    korean: '에틴', variants: %w[에틴]
  },
  {
    entity: 'monster:banshaen', plural: 'Banshaens', canonical: 'Banshaen',
    korean: '밴션', variants: %w[밴션 밴셴 밴시엔 밴시언 밴샤엔 반셰인 반샤엔 반시엔]
  },
  {
    entity: 'monster:balor', plural: 'Balors', canonical: 'Balor',
    korean: '발로르', variants: %w[발로르 발로 발러 베일러 베이러]
  },
  {
    entity: 'people:jottun', plural: 'Jottuns', canonical: 'Jottun',
    korean: '요툰', variants: %w[요툰 조툰 요튼]
  },
  {
    entity: 'monster:thresh', plural: 'Threshes', canonical: 'Thresh',
    korean: '스레시', variants: %w[스레시 쓰레시 쓰레쉬 스레쉬]
  },
  {
    entity: 'monster:niskaru', plural: 'Niskarus', canonical: 'Niskaru',
    korean: '니스카루', variants: %w[니스카루]
  }
].freeze

def visible_english(source)
  JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
    .gsub(/\$[^$]*\$/, ' ')
end

def source_has?(text, term)
  text.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
end

def excerpt(text, pattern, limit)
  text = text.to_s.gsub(/\s+/, ' ').strip
  match = pattern && pattern.match(text)
  return text[0, limit] unless match

  start = [match.begin(0) - limit / 3, 0].max
  text[start, limit]
end

def source_supported_compound?(label, english, spec)
  return false unless label && source_has?(english, label)
  return false if [spec[:canonical], spec[:plural]].any? { |name| label.casecmp?(name) }

  source_has?(label, spec[:canonical]) || source_has?(label, spec[:plural])
end

PARTICLES = %w[
  에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
  에게 에서도 에서는 에까지 에서 에도 에는 으로도 으로는 으로만 으로
  로부터 로도 로는 로만 한테서 한테에게 한테 한테는 한테도 엔 처럼 만큼
  보다 행 였던 이었던 까지 부터 이라며 이라는 이라서 이라고 이지 이야
  이죠 이네 이군 이구나 이라니 이래 이잖아 이라 라 은 는 이 가 을 를
  와 과 의 에 로 도 만 들 족 족은 족이 족을 어 어로 어의
].uniq.sort_by { |value| -value.length }.freeze

def review_plural(spec, source, current_text)
  english = visible_english(source)
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n")
  chinese = source.fetch('zh_text').to_s
  old = source.fetch('work_text')
  evidence = lambda do |note|
    "EN primary: #{excerpt(english, /(?<![A-Za-z])#{Regexp.escape(spec[:plural])}(?![A-Za-z])/i, 210).inspect}; " \
      "JA corroboration: #{excerpt(japanese, nil, 150).inspect}; " \
      "ZH corroboration: #{excerpt(chinese, nil, 130).inspect}; " \
      "KO context: #{excerpt(old, nil, 150).inspect}. #{note}"
  end

  plural_pattern = /(?<![A-Za-z])#{Regexp.escape(spec[:plural])}(?![A-Za-z])/i
  unless english.match?(plural_pattern)
    return ['excluded', current_text, evidence.call('No visible English plural hit remains; excluded from this plural-alias pass.')]
  end
  if japanese.empty? || chinese.empty?
    return ['uncertain', current_text, evidence.call('Aligned JA or ZH corroboration is missing; left unchanged for source review.')]
  end

  text = current_text.dup
  exception = nil
  if spec[:entity] == 'monster:ettin' && source_has?(english, 'Ettinmere')
    # Ettinmere is a place name, not an Ettin species span.
    if text.gsub!(/(?<![가-힣])에틴\s*\(Ettin\)(?=미어)/, '에틴')
      exception = 'Restored 에틴미어 as the Ettinmere place-name span; EN Ettinmere, JA エティンメア, and ZH 艾丁米尔 distinguish it from the Ettins species mention.'
    end
  end

  variants = spec[:variants].sort_by { |value| -value.length }
    .map { |value| Regexp.escape(value) }.join('|')
  particles = PARTICLES.map { |value| Regexp.escape(value) }.join('|')
  pattern = Regexp.new(
    "(?<![가-힣])(?<root>#{variants})(?:\\s*\\((?<label>[^()]*)\\))?" \
    "(?<particle>#{particles})?(?![가-힣])"
  )
  found = false
  text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
    next if text[0...match.begin(0)].count('(') > text[0...match.begin(0)].count(')')

    found = true
    label = match[:label]
    particle = match[:particle].to_s
    next if source_supported_compound?(label, english, spec)

    tail = text[match.end(0)..]
    atomic_tail = tail.match(
      /\A\s+[\p{Hangul}\s·'’\-]{1,100}\s*\((?<label>[^()]*)\)/
    )
    if atomic_tail && source_supported_compound?(atomic_tail[:label], english, spec)
      next
    end

    replacement = "#{spec[:korean]}(#{spec[:canonical]})#{particle}"
    next if replacement == match[0]

    text[match.begin(0)...match.end(0)] = replacement
  end

  note = if !found && text == old
           'The English plural names the registered entity, but no safely bounded recognized Korean counterpart was found; left unchanged and marked uncertain rather than inventing a translation.'
         elsif text == old
           'The canonical Korean name or complete source-supported bilingual compound is already present; retained without nested annotation.'
         else
           'Normalized only source-matched bounded Korean name spans to the registered singular canonical label; complete bilingual compounds, particles, line breaks, placeholders, and surrounding text remain intact.'
         end
  note = "#{exception} #{note}" if exception
  [!found ? 'uncertain' : (text == old ? 'not-an-issue' : 'accepted'), text, evidence.call(note)]
end

inventory = m.refresh_inventory
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
definitions = glossary.to_h { |row| [row['entity_key'], row.to_h] }
sources = inventory
plural_rows = {}

SPECS.each do |spec|
  rows = inventory.values.select { |source| source_has?(visible_english(source), spec[:plural]) }
  plural_rows[spec[:entity]] = rows
  next if rows.empty?

  definition = definitions[spec[:entity]]
  raise "plural source exists before entity registration: #{spec[:entity]}" unless definition
  raise "canonical mismatch for #{spec[:entity]}" unless
    definition['english_canonical'] == spec[:canonical] &&
    definition['korean_canonical'] == "#{spec[:korean]}(#{spec[:canonical]})" &&
    definition['status'] == 'confirmed'

  existing_aliases = definition['english_aliases'].to_s.split('|').reject(&:empty?)
  unless existing_aliases.any? { |alias_name| alias_name.casecmp?(spec[:plural]) }
    definition['english_aliases'] = (existing_aliases + [spec[:plural].downcase]).join('|')
  end
end

active_specs = SPECS.select { |spec| plural_rows.fetch(spec[:entity]).any? }
target_definitions = active_specs.map { |spec| definitions.fetch(spec[:entity]) }
generated = build_occurrences(inventory.values, target_definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end.select do |occurrence|
  plural_rows.fetch(occurrence['entity_key']).any? do |source|
    m.key(source) == m.key(occurrence)
  end
end

raise 'duplicate generated plural entity-row keys' unless
  generated.map { |row| [row['entity_key'], *m.key(row)] }.uniq.length == generated.length

index_table = m.table(m::INDEX)
index_headers = index_table.headers
index = index_table.map(&:to_h)
index_by_key = {}
index.each do |row|
  key = [row['entity_key'], *m.key(row)]
  raise "duplicate existing index key #{key.inspect}" if index_by_key.key?(key)

  index_by_key[key] = row
end

missing_index = generated.reject do |row|
  index_by_key.key?([row['entity_key'], *m.key(row)])
end
newly_pending = missing_index.select { |row| row['status'] == 'needs-context' }
missing_index.each do |row|
  index_by_key[[row['entity_key'], *m.key(row)]] = row
end
unless missing_index.empty?
  missing_index.each { |row| index << row }
end

reviewable = generated.select do |row|
  indexed = index_by_key.fetch([row['entity_key'], *m.key(row)])
  indexed['status'] == 'needs-context'
end
grouped = reviewable.group_by { |row| m.key(row) }
reviews = grouped.map do |key, occurrences|
  source = sources.fetch(key)
  original = source.fetch('work_text')
  text = original.dup
  dispositions = {}
  evidence = []
  occurrences.each do |occurrence|
    spec = SPECS.find { |candidate| candidate[:entity] == occurrence['entity_key'] }
    status, text, note = review_plural(spec, source, text)
    dispositions[spec[:entity]] = status
    evidence << "#{spec[:entity]}: #{note}"
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
    'old' => original, 'new' => text, 'evidence' => evidence.join(' || '),
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end.sort_by do |row|
  [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
end

raise 'duplicate row-level plural proposal' unless reviews.map { |row| m.key(row) }.uniq.length == reviews.length
raise 'non-accepted plural proposal changes Korean text' if reviews.any? do |row|
  row['status'] != 'accepted' && row['old'] != row['new']
end

unless definitions.values.all? { |definition| glossary.any? { |row| row['entity_key'] == definition['entity_key'] } }
  raise 'glossary definition lookup changed'
end
updated_glossary = glossary.map do |row|
  definitions.fetch(row['entity_key'])
end
m.write_table(glossary_path, glossary.headers, updated_glossary) if active_specs.any?
unless missing_index.empty?
  m.write_table(m::INDEX, index_headers, index)
end

out = File.join(__dir__, "proper-name-reviewed-monster-plurals-D#{start_d}.tsv")
m.write_table(out, m::HEADERS, reviews) unless reviews.empty?
source_counts = SPECS.to_h { |spec| [spec[:entity], plural_rows.fetch(spec[:entity]).length] }
terminal_counts = SPECS.to_h do |spec|
  terminal = plural_rows.fetch(spec[:entity]).count do |source|
    indexed = index_by_key[[spec[:entity], *m.key(source)]]
    indexed && %w[accepted not-an-issue excluded].include?(indexed['status'])
  end
  [spec[:entity], terminal]
end
puts "Visible plural source rows: #{source_counts.inspect}"
puts "Preserved terminal plural row keys: #{terminal_counts.inspect}"
puts "New needs-context index entries: #{newly_pending.length}"
puts "Plural review rows: #{reviews.length}; dispositions=#{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
puts "Review manifest: #{out}" unless reviews.empty?
m.run(out, start_d, nil) unless reviews.empty?
