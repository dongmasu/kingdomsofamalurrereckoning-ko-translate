#!/usr/bin/env ruby

require 'json'
require 'set'
require 'digest'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

if $PROGRAM_NAME == __FILE__
  m = ReviewedNameBatches
  preview = ARGV.delete('--preview')
  abort 'usage: review-proper-name-monsters-other-continuation.rb START_D [--preview]' unless ARGV.length == 1
  start_d = Integer(ARGV.fetch(0))
  raise 'START_D must be positive' unless start_d.positive?
end

SPECS = [
  {
    entity_key: 'monster:troll', english_canonical: 'Troll',
    category: 'monster', korean_canonical: '트롤(Troll)',
    english_aliases: 'Trolls', korean_variants: '',
    roots: %w[트롤],
    identity: 'EN identifies the Troll creature/species; JA トロール and ZH 巨魔 corroborate. Trolls is an attested English plural alias. Preserve the full Two Knights and a Troll book title and the Trolls (Exhibition) team label atomically.'
  },
  {
    entity_key: 'monster:bolgan', english_canonical: 'Bolgan',
    category: 'monster', korean_canonical: '볼간(Bolgan)',
    english_aliases: 'Bolgans', korean_variants: '볼건',
    roots: %w[볼간 볼건],
    identity: 'EN identifies the Bolgan creature/species; JA ボルガン and ZH 波尔干 corroborate. Bolgans is an attested English plural alias. Preserve source-supported full enemy, rank, and item labels atomically.'
  },
  {
    entity_key: 'monster:crudok', english_canonical: 'Crudok',
    category: 'monster', korean_canonical: '크루독(Crudok)',
    english_aliases: 'Crudoks', korean_variants: '',
    roots: %w[크루독],
    identity: 'EN identifies the Crudok creature/species; JA クルドック and ZH 克鲁多克 corroborate. Crudoks is an attested English plural alias. The idiomatic Crudok’s arse line is intentionally not expanded in Korean; technical IDs remain unchanged unless a bounded Korean name is already present.'
  },
  {
    entity_key: 'monster:murghan', english_canonical: 'Murghan',
    category: 'monster', korean_canonical: '머건(Murghan)',
    english_aliases: '', korean_variants: '머간|무르간|머르간|머르건',
    roots: %w[머건 머간 무르간 머르간 머르건],
    identity: 'EN identifies Murghan as water/shore creatures; JA マーガン corroborates the name and ZH 鱼怪/蜥人 corroborates the creature identity. English uses invariant Murghan; no plural alias is invented. Preserve complete source-supported Murghan rank/item labels atomically.'
  },
  {
    entity_key: 'monster:barghest', english_canonical: 'Barghest',
    category: 'monster', korean_canonical: '바게스트(Barghest)',
    english_aliases: 'Barghests',
    korean_variants: '바르게스트|바그헤스트|바르그헤스트|바르그스트',
    roots: %w[바게스트 바르게스트 바그헤스트 바르그헤스트 바르그스트],
    identity: 'EN identifies the Barghest creature/species; JA バーゲスト and ZH 魔狼/魔兽 corroborate. Barghests is an attested English plural alias. Normalize observed Korean spellings only in source-matched rows and preserve full Barghest rank/item labels atomically.'
  },
  {
    entity_key: 'monster:leanashe', english_canonical: 'Leanashe',
    category: 'monster', korean_canonical: '리아네시(Leanashe)',
    english_aliases: '', korean_variants: '리어나시|레아나시|리아나시|리안셰|리안시|레아나셰',
    roots: %w[리아네시 리어나시 레아나시 리아나시 리안셰 리안시 레아나셰],
    identity: 'EN identifies Leanashe as a creature/species; JA リアンシー/リャナンシー and ZH 蛇身女妖 corroborate. No distinct English plural is attested. Reuses the accepted Korean form 리아네시(Leanashe) at default:23115; in Meathgra contexts, Leanashe is the species descriptor and Meathgra remains a separate full personal name.'
  },
  {
    entity_key: 'monster:kobold', english_canonical: 'Kobold',
    category: 'monster', korean_canonical: '코볼트(Kobold)',
    english_aliases: 'Kobolds', korean_variants: '코볼드',
    roots: %w[코볼트 코볼드],
    identity: 'EN identifies the Kobold creature/species; JA コボルド and ZH 狗头人 corroborate. Kobolds is an attested English plural alias. Preserve complete source-supported Kobold rank/item labels atomically; the untranslated Trigger Kobolds 2 label remains uncertain.'
  }
].freeze

EXPECTED_SOURCE_ROWS = {
  'monster:troll' => 225,
  'monster:bolgan' => 115,
  'monster:crudok' => 86,
  'monster:murghan' => 89,
  'monster:barghest' => 102,
  'monster:leanashe' => 22,
  'monster:kobold' => 94
}.freeze

EXPECTED_SOURCE_HASHES = {
  'monster:troll' => '091e08019a09f63f85855e920047def42fa39254bd366af463ccdb0c977ee98a',
  'monster:bolgan' => '133cdf48506eac28cfef77f29754000f04da6e73ee5ba0e8e3145101d2e9e02c',
  'monster:crudok' => '191bfde74d2ac1d340f906f35e75180347b788298370b7d7fa17039ac6366adf',
  'monster:murghan' => 'd98bf9fe849f848829c1f807f29cbf5a1a38f995ae5704a6ab9b3d3a5118eb7f',
  'monster:barghest' => '2fa14894245c713ad88d2b1af13e4e42f8abe30bdc6a43520e5e257f1f4f2c1a',
  'monster:leanashe' => 'c868ee3d0905821bfe5a763dc32e096000c1c4a762b954f7cfb6d579c8a66a9f',
  'monster:kobold' => '6bb2335e6ef23714ebbc75c09b6c8d6d9da4ae8d55a34874287e63bfa3db57d9'
}.freeze

PARTICLES = %w[
  에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
  에게 에서도 에서는 에까지 에서 에도 에는 으로도 으로는 으로만 으로
  로부터 로도 로는 로만 한테서 한테에게 한테 한테는 한테도 엔 처럼 만큼
  에게까지 한테서도 께서는 께서 께도 께는 께 까지 부터 조차 마저 밖에
  뿐이나 뿐만 이라며 이라는 이라서 이라고 이지 이야 이죠 이네 이군 이구나
  이라니 이래 이잖아 이라 이란 이며 이므로 이라도 이면서 이지만 이라면
  이었으며 이었지만 이었는데 이었고 이었다 이었어 이었지 이었을 이었을까
  였으며 였지만 였는데 였고 였다 였어 였지 였을 예요 이에요 입니다 인지는
  이었고도 이었으나 였으나 이기에 이어서 여서 일 인 행 였던 이었던
  들에서부터 들로부터 들에게서 들에게 들에서는 들에서도 들까지 들부터
  들처럼 들보다 들이 들은 들을 들과 들의 들에 들도 들만 들로 들조차
  들이야 들이여 이겠지 이겠군 이었겠지 이나 이고 이라니 라니 라고 라면
  라서 라는 야 로군 로구나 였군 보다 쯤은 쯤도 쯤이 쯤 이여 여 일지도
  은 는 이 가 을 를 와 과 의 에 로 도 만 들 족 족은 족이 족을 어 어로 어의
].uniq.sort_by { |value| -value.length }.freeze

ATOMIC_COMPOUNDS = [
  {
    entity_key: 'monster:troll',
    english: /(?<![A-Za-z])Two Knights and a Troll(?:,\s*Part\s+[IVX]+)?(?![A-Za-z])/i,
    korean: /두 기사와 트롤(?:,\s*제\s*[0-9]+부)?/
  },
  {
    entity_key: 'monster:troll',
    english: /(?<![A-Za-z])Trolls\s+\(Exhibition\)(?![A-Za-z])/i,
    korean: /트롤\(시범 경기\)/
  }
].freeze

TECHNICAL_HOLDS = {
  ['monster:crudok', 'default', '4833'] =>
    'Crudok2 is a technical identifier; EN/JA/ZH identify the species, but Korean has no safely separable counterpart. Left unchanged as uncertain.',
  ['monster:kobold', 'default', '45012'] =>
    'Trigger Kobolds 2 is an untranslated technical label; JA/ZH corroborate the Kobold identity, but no Korean counterpart exists in this cell. Left unchanged as uncertain.'
}.freeze

def source_texts(source)
  english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
    .gsub(/\$[^$]*\$/, ' ')
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n")
  chinese = source.fetch('zh_text').to_s
  [english, japanese, chinese]
end

def excerpt(text, pattern, limit)
  text = text.to_s.gsub(/\s+/, ' ').strip
  match = pattern && pattern.match(text)
  return text[0, limit] unless match

  start_at = [match.begin(0) - limit / 3, 0].max
  text[start_at, limit]
end

def exact_source_label?(english, label)
  return false if label.to_s.empty?

  english.match?(/(?<![A-Za-z])#{Regexp.escape(label)}(?![A-Za-z])/i)
end

def source_has_species?(english, label, spec)
  terms = [spec.fetch(:english_canonical)] + spec.fetch(:english_aliases).split('|')
  exact_source_label?(english, label) &&
    terms.any? { |term| exact_source_label?(label, term) }
end

def protected_compound_ranges(entity_key, english, text)
  ATOMIC_COMPOUNDS.map do |rule|
    next unless rule[:entity_key] == entity_key && english.match?(rule[:english])

    text.to_enum(:scan, rule[:korean]).map do
      match = Regexp.last_match
      [match.begin(0), match.end(0)]
    end
  end.compact.flatten(1)
end

def review_species(spec, source, row_key, current_text)
  english, japanese, chinese = source_texts(source)
  canonical = spec.fetch(:english_canonical)
  aliases = spec.fetch(:english_aliases).split('|').reject(&:empty?)
  source_terms = [canonical] + aliases
  hit_pattern = Regexp.new(
    "(?<![A-Za-z])(?:#{source_terms.map { |term| Regexp.escape(term) }.join('|')})(?![A-Za-z])",
    Regexp::IGNORECASE
  )
  excerpts = lambda do |note|
    "EN primary: #{excerpt(english, hit_pattern, 190).inspect}; " \
      "JA corroboration: #{excerpt(japanese, nil, 120).inspect}; " \
      "ZH corroboration: #{excerpt(chinese, nil, 110).inspect}; " \
      "KO context: #{excerpt(current_text, Regexp.new(spec.fetch(:roots).map { |root| Regexp.escape(root) }.join('|')), 130).inspect}. " \
      "#{note}"
  end

  unless english.match?(hit_pattern)
    return ['excluded', current_text, excerpts.call('No exact English species token is visible; excluded from this source-bounded review.')]
  end
  if japanese.empty? || chinese.empty?
    return ['uncertain', current_text, excerpts.call('Aligned JA or ZH corroboration is missing; left unchanged.')]
  end

  if spec[:entity_key] == 'monster:troll' &&
     row_key[0] == 'default' && row_key[1] == '18198'
    raise 'reviewed exhibition-score context changed' unless
      english.include?('The Crows vs. Trolls (Exhibition)')
    return ['excluded', current_text, excerpts.call(
      'All Trolls mentions in this exact score sheet denote the exhibition opponent, including its shortened score-table alias. Preserve the complete team context rather than classify that alias as a standalone species mention.'
    )]
  end

  without_compounds = ATOMIC_COMPOUNDS.reduce(english) do |text, rule|
    rule[:entity_key] == spec[:entity_key] ? text.gsub(rule[:english], ' ') : text
  end
  unless without_compounds.match?(hit_pattern)
    return ['excluded', current_text, excerpts.call(
      'Every species token is part of a complete ballad/book or exhibition-team title, not a standalone species reference. Preserve the complete Korean title for a separate full-name review.'
    )]
  end

  technical_note = TECHNICAL_HOLDS[[spec[:entity_key], row_key[0], row_key[1]]]
  if technical_note
    return ['uncertain', current_text, excerpts.call(technical_note)]
  end

  if spec[:entity_key] == 'monster:crudok' &&
     row_key[0] == 'default' && row_key[1] == '3851'
    return ['not-an-issue', current_text, excerpts.call(
      'EN uses the idiom “I’m a Crudok’s arse,” JA omits the name, ZH renders it literally, and Korean uses the equivalent idiom “내 손에 장을 지지.” Preserved the intentional idiomatic translation rather than inserting a species name.'
    )]
  end

  if spec[:entity_key] == 'monster:crudok' &&
     row_key[0] == 'default' && row_key[1] == '27928'
    if current_text == 'Crudok 트리거 1'
      replacement = '크루독(Crudok) 트리거 1'
      return ['accepted', replacement, excerpts.call(
        'This exact technical trigger label is source-attested in EN, JA, and ZH. Localized only the standalone source-matched Crudok token; retained the established Korean technical label and numeric suffix.'
      )]
    end
    return ['uncertain', current_text, excerpts.call(
      'The trigger label differs from the reviewed source text; no automated technical-label edit was proposed.'
    )]
  end

  text = current_text.dup
  roots = spec.fetch(:roots).sort_by { |value| -value.length }
    .map { |value| Regexp.escape(value) }.join('|')
  particles = PARTICLES.map { |value| Regexp.escape(value) }.join('|')
  pattern = Regexp.new(
    "(?<![가-힣])(?<root>#{roots})" \
    "(?:[ \\t]*\\((?<label>[^()]*)\\)|(?![ \\t]*\\())" \
    "(?<particle>#{particles})?(?![가-힣])"
  )
  protected_ranges = protected_compound_ranges(spec[:entity_key], english, text)
  found = false
  held = false
  text.to_enum(:scan, pattern).map { Regexp.last_match.dup }.reverse_each do |match|
    next if text[0...match.begin(0)].count('(') > text[0...match.begin(0)].count(')')
    next if protected_ranges.any? do |left, right|
      left <= match.begin(0) && match.end(0) <= right
    end

    found = true
    label = match[:label]
    particle = match[:particle].to_s
    tail = text[match.end(0)..].to_s
    atomic_tail = tail.match(
      /\A\s+[\p{Hangul}\s0-9·'’\-]{1,80}\s*\((?<full_label>[^()]*(?:\([^()]*\)[^()]*)*)\)/
    )
    if atomic_tail && source_has_species?(english, atomic_tail[:full_label], spec)
      next
    end

    if label && source_has_species?(english, label, spec) &&
       !label.casecmp?(canonical) && !aliases.any? { |alias_name| label.casecmp?(alias_name) }
      next
    end
    if label &&
       !label.casecmp?(canonical) && !aliases.any? { |alias_name| label.casecmp?(alias_name) }
      held = true
      next
    end
    replacement = "#{spec.fetch(:korean_canonical).sub(/\(.+\)\z/, '')}(#{canonical})#{particle}"
    text[match.begin(0)...match.end(0)] = replacement
  end

  if held
    return ['uncertain', current_text, excerpts.call(
      'A bounded Korean name has an adjacent label or qualifier that is not an exact source-supported full compound or known species alias; left the row unchanged, preserving meaningful Korean qualifiers.'
    )]
  end
  unless found
    return ['uncertain', current_text, excerpts.call(
      'The aligned English source identifies this species, but no safely bounded Korean counterpart was found; left unchanged rather than inventing a translation.'
    )]
  end

  status = text == current_text ? 'not-an-issue' : 'accepted'
  note = if text == current_text
           'The canonical Korean form or a source-supported full bilingual compound is already present; preserved it atomically without nested species labels.'
         else
           'Normalized only bounded, source-matched Korean species spans. Existing full bilingual compounds/titles, particles, placeholders, line breaks, and surrounding text are preserved.'
         end
  [status, text, excerpts.call(note)]
end

def token_skeleton(text)
  text.scan(/\{[^{}]*\}|\$[^$]*\$/)
end

if $PROGRAM_NAME == __FILE__
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary_table = m.table(glossary_path)
glossary_headers = glossary_table.headers.dup
glossary_rows = glossary_table.map(&:to_h)
by_key = glossary_rows.to_h { |row| [row.fetch('entity_key'), row] }

SPECS.each do |spec|
  key = spec.fetch(:entity_key)
  current = by_key[key]
  if current
    raise "conflicting canonical for #{key}" unless
      current['english_canonical'] == spec[:english_canonical] &&
      current['category'] == spec[:category] &&
      current['korean_canonical'] == spec[:korean_canonical] &&
      current['status'] == 'confirmed'
    existing_aliases = current['english_aliases'].to_s.split('|').reject(&:empty?)
    expected_aliases = spec[:english_aliases].split('|').reject(&:empty?)
    raise "conflicting English aliases for #{key}" unless (expected_aliases - existing_aliases).empty?
    spec[:english_aliases] = existing_aliases.join('|')
  end
end

inventory = m.refresh_inventory.values
generated = build_occurrences(inventory, SPECS.map do |spec|
  {
    'entity_key' => spec.fetch(:entity_key),
    'english_canonical' => spec.fetch(:english_canonical),
    'english_aliases' => spec.fetch(:english_aliases),
    'category' => spec.fetch(:category),
    'korean_canonical' => spec.fetch(:korean_canonical),
    'korean_variants' => spec.fetch(:korean_variants),
    'evidence_ids' => '',
    'status' => 'confirmed',
    'notes' => spec.fetch(:identity)
  }
end).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }

counts = generated.group_by { |row| row.fetch('entity_key') }
  .transform_values(&:length)
EXPECTED_SOURCE_ROWS.each do |key, expected|
  raise "aligned source-row count changed for #{key}: #{counts[key]}" unless counts[key] == expected
end
raise 'duplicate generated entity/row keys' unless
  generated.map { |row| [row.fetch('entity_key'), *m.key(row)] }.uniq.length == generated.length

generated_by_entity = generated.group_by { |row| row.fetch('entity_key') }
sources = inventory.to_h { |row| [m.key(row), row.to_h] }
generated_by_entity.each do |entity, rows|
  ordered = rows.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
  values = ordered.map do |row|
    source = sources.fetch(m.key(row))
    %w[resource ID_Linha Tipo_Variante en_texts_json ja_texts_json zh_text].map { |field| source[field].to_s }
  end
  actual = Digest::SHA256.hexdigest(JSON.generate(values))
  raise "aligned source-key/content scope changed for #{entity}" unless actual == EXPECTED_SOURCE_HASHES.fetch(entity)
end
SPECS.each do |spec|
  key = spec.fetch(:entity_key)
  rows = generated_by_entity.fetch(key)
  plural_alias = spec.fetch(:english_aliases)
  evidence_ids = rows.map do |row|
    [row['resource'], row['ID_Linha'], row['Tipo_Variante']].reject(&:empty?).join(':')
  end.join('|')
  definition = {
    'entity_key' => key,
    'english_canonical' => spec.fetch(:english_canonical),
    'category' => spec.fetch(:category),
    'korean_canonical' => spec.fetch(:korean_canonical),
    'english_aliases' => plural_alias,
    'korean_variants' => spec.fetch(:korean_variants),
    'evidence_ids' => evidence_ids,
    'status' => 'confirmed',
    'notes' => "#{spec.fetch(:identity)} Reviewed all #{rows.length} aligned EN source rows with JA/ZH corroboration."
  }
  current = by_key[key]
  if current
    current['english_aliases'] = plural_alias
    current['korean_variants'] = spec.fetch(:korean_variants)
    current['evidence_ids'] = evidence_ids
    current['notes'] = definition['notes']
  else
    glossary_rows << definition
  end
end

terms = SPECS.flat_map do |spec|
  [spec.fetch(:english_canonical)] + spec.fetch(:english_aliases).split('|').reject(&:empty?)
end
terms.group_by(&:downcase).each do |term, duplicates|
  raise "duplicate source term registration: #{term}" if duplicates.length > 1
end
SPECS.each do |spec|
  terms_for_entity = [spec.fetch(:english_canonical)] +
    spec.fetch(:english_aliases).split('|').reject(&:empty?)
  conflicts = glossary_rows.reject { |row| row['entity_key'] == spec[:entity_key] }.select do |row|
    existing_terms = [row['english_canonical']] + row['english_aliases'].to_s.split('|')
    existing_terms.any? { |term| terms_for_entity.any? { |wanted| term.casecmp?(wanted) } }
  end
  raise "English canonical/alias already registered: #{spec[:entity_key]} conflicts with #{conflicts.map { |row| row['entity_key'] }.join(',')}" unless conflicts.empty?
end

index_table = m.table(m::INDEX)
index_headers = index_table.headers.dup
index_rows = index_table.map(&:to_h)
indexed = index_rows.to_h do |row|
  [[row.fetch('entity_key'), *m.key(row)], row]
end
raise 'duplicate existing index keys' unless indexed.length == index_rows.length

generated.each do |row|
  key = [row.fetch('entity_key'), *m.key(row)]
  existing = indexed[key]
  next unless existing

  old_terms = existing.fetch('matched_english').to_s.split('|')
  new_terms = row.fetch('matched_english').to_s.split('|')
  raise "conflicting existing English hit #{key.inspect}" if (old_terms & new_terms).empty?
end

missing_index = generated.reject do |row|
  indexed.key?([row.fetch('entity_key'), *m.key(row)])
end
index_rows += missing_index
pending = index_rows.select do |row|
  row['status'] == 'needs-context' &&
    SPECS.any? { |spec| spec[:entity_key] == row['entity_key'] }
end.to_h { |row| [[row.fetch('entity_key'), *m.key(row)], row] }
active = generated.select do |row|
  pending.key?([row.fetch('entity_key'), *m.key(row)])
end
grouped = active.group_by { |row| m.key(row) }

reviews = grouped.map do |row_key, occurrences|
  source = sources.fetch(row_key)
  old = source.fetch('work_text')
  text = old.dup
  dispositions = {}
  evidence = []
  occurrences.sort_by { |row| SPECS.index { |spec| spec[:entity_key] == row['entity_key'] } }
    .each do |occurrence|
      entity = occurrence.fetch('entity_key')
      spec = SPECS.find { |item| item[:entity_key] == entity }
      status, text, detail = review_species(spec, source, row_key, text)
      dispositions[entity] = status
      evidence << "#{entity} / #{row_key.join(':')}: #{detail}"
    end

  raise "changed token/placeholder skeleton at #{row_key.inspect}" unless
    token_skeleton(old) == token_skeleton(text)
  raise "changed line endings at #{row_key.inspect}" unless
    old.scan(/\r\n|\r|\n/) == text.scan(/\r\n|\r|\n/)

  row_status = if dispositions.values.include?('accepted')
                 'accepted'
               elsif dispositions.values.include?('uncertain')
                 'uncertain'
               elsif dispositions.values.all?('excluded')
                 'excluded'
               else
                 'not-an-issue'
               end
  {
    'resource' => row_key[0],
    'ID_Linha' => row_key[1],
    'Tipo_Variante' => row_key[2],
    'entity_key' => dispositions.keys.join('|'),
    'status' => row_status,
    'old' => old,
    'new' => text,
    'evidence' => evidence.join(' || '),
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end.sort_by do |row|
  [ReviewedNameBatches::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
end

raise 'duplicate row-level proposal' unless reviews.map { |row| m.key(row) }.uniq.length == reviews.length
raise 'non-accepted disposition proposes a text edit' if reviews.any? do |row|
  row['old'] != row['new'] && row['status'] != 'accepted'
end

reviews.each_slice(50).with_index do |_batch, ordinal|
  d = start_d + ordinal
  raise "D-#{d} already recorded; nothing registered" if
    File.exist?(File.join(__dir__, "named-scope-review-D#{d}-20261015.md"))
end

unless preview
  m.write_table(glossary_path, glossary_headers, glossary_rows)
  m.write_table(m::INDEX, index_headers, index_rows) unless missing_index.empty?
end
out = preview ? '/private/tmp/monsters-other-preview.tsv' :
  File.join(__dir__, 'proper-name-reviewed-monsters-other-continuation.tsv')
m.write_table(out, m::HEADERS, reviews)

puts "Reviewed source rows by entity: #{counts.inspect}"
puts "Plural aliases: #{SPECS.map { |spec| "#{spec[:english_canonical]}=#{spec[:english_aliases].empty? ? '(invariant)' : spec[:english_aliases]}" }.join(', ')}"
puts "Pending grouped manifest rows: #{reviews.length}"
puts "Manifest row dispositions: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
puts "Entity dispositions: #{reviews.flat_map { |row| JSON.parse(row['entity_dispositions_json']).to_a }.group_by(&:first).transform_values { |pairs| pairs.group_by(&:last).transform_values(&:length) }.inspect}"
m.run(out, start_d, 50) unless preview || reviews.empty?
end
