#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
dry_run = ARGV.last == '--dry-run'
ARGV.pop if dry_run
abort 'usage: review-proper-name-place-gravehal-continuation.rb START_D [--dry-run]' unless ARGV.length == 1
start_d = Integer(ARGV.fetch(0))
raise 'START_D must be positive' unless start_d.positive?

glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
entity = 'place:gravehal'
english_name = 'Gravehal'
korean_name = '그레이브홀'
existing_definition = glossary.find { |row| row['entity_key'] == entity }

definition = if existing_definition
              row = existing_definition.to_h
              raise 'registered Gravehal canonical conflicts with this review' unless
                row['english_canonical'] == english_name &&
                row['korean_canonical'] == "#{korean_name}(#{english_name})"
              row
            else
              glossary.headers.zip([
                entity, english_name, 'place', "#{korean_name}(#{english_name})", '',
                '그레이브할|그레이벌|그레이홀',
                'base:42:11|base:485:11|base:619:11|base:1320:11|base:1510:11|base:4477:11|default:1067|default:13004|default:15916|default:16441|default:19348|default:21139|default:24510|default:25916|default:31946|default:32343|default:33585|default:35213|default:3698|default:36914|default:3866|default:39878|default:45997|default:57960|default:58923|default:63482',
                'confirmed',
                'English identifies Gravehal as the named Gallows End settlement/fortress; Japanese グレイバル and Chinese 格雷夫霍 corroborate across its aligned location labels. The active Korean corpus uses 그레이브홀 most often; normalize 그레이브할, 그레이벌, and 그레이홀. Complete labels such as Gravehal Keep, Library, Courtyard, Armory, Tower, Embassy, Fasting, Stone, Gallery, and Tunnels are handled atomically where the Korean row expresses the corresponding compound. Gravehal Fasting is an underground passage/fasting, corroborated by Japanese 地下通路 and Chinese 通道, not ordinary abstention. Territorial titles remain intact; no PAK or manual omission inference is used.'
              ]).to_h
            end

m.refresh_inventory
inventory = m.table(m::INVENTORY)
generated = build_occurrences(inventory, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
raise 'expected 184 aligned Gravehal source rows' unless generated.length == 184

sources = inventory.to_h { |row| [m.key(row), row.to_h] }
name_variants = [korean_name, *definition['korean_variants'].to_s.split('|')]
name_pattern = name_variants.map { |value| Regexp.escape(value) }
  .sort_by { |value| -value.length }.join('|')
particle_pattern = %w[
  에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
  에게 에서도 에서는 에까지 에서 에도 에는 으로도 으로는 으로만 으로
  로부터 로도 로는 로만 한테서 한테에게 한테 한테는 한테도 엔 처럼
  만큼 보다 행 였던 이었던 까지 부터 이라며 이라는 이라서 이라고
  이지 이야 이죠 이네 이군 이구나 이라니 이래 이잖아
  이라 라 은 는 이 가 을 를 와 과 의 에 로 도 만 들
].uniq.sort_by { |value| -value.length }
  .map { |value| Regexp.escape(value) }.join('|')

def compound_rule(english, korean, canonical)
  { english: english, korean: korean, canonical: canonical }
end

name = "(?:#{name_pattern})"
optional_label = '(?:\\s*\\((?=[^()]*Gravehal)[^()]*\\))?'
rules = [
  compound_rule(
    /(?<![A-Za-z])Gravehal\s+Keep\s+Library(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*(?:(?:요새|성채|성|킵)#{optional_label}\s*)?도서관)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀 요새 도서관(Gravehal Keep Library)'
  ),
  compound_rule(
    /(?<![A-Za-z])Gravehal\s+Keep(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*(?:요새|성채|성|킵)#{optional_label})(?!\s*도서관)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀 요새(Gravehal Keep)'
  ),
  compound_rule(
    /(?<![A-Za-z])Gravehal\s+Library(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*도서관)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀 도서관(Gravehal Library)'
  ),
  compound_rule(
    /(?<![A-Za-z])Gravehal\s+Courtyard(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*안뜰)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀 안뜰(Gravehal Courtyard)'
  ),
  compound_rule(
    /(?<![A-Za-z])Gravehal\s+Armory(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*무기고)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀 무기고(Gravehal Armory)'
  ),
  compound_rule(
    /(?<![A-Za-z])Gravehal\s+Tower(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*탑)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀 탑(Gravehal Tower)'
  ),
  compound_rule(
    /(?<![A-Za-z])Gravehal\s+Embassy(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*대사관)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀 대사관(Gravehal Embassy)'
  ),
  compound_rule(
    /(?<![A-Za-z])Gravehal\s+Stone(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*(?:의\s*)?돌)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀의 돌(Gravehal Stone)'
  ),
  compound_rule(
    /(?<![A-Za-z])Gravehal\s+Fasting(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*(?:단식|패스팅|지하\s*통로))(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀 지하 통로(Gravehal Fasting)'
  ),
  compound_rule(
    /(?<![A-Za-z])Gravehal\s+Gallery(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*(?:갤러리|미술관))(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀 미술관(Gravehal Gallery)'
  ),
  compound_rule(
    /(?<![A-Za-z])Gravehal\s+Tunnels(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*(?:지하\s*통로|터널))(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀 지하 통로(Gravehal Tunnels)'
  ),
  compound_rule(
    /(?<![A-Za-z])Gravehal\s+Paintings(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*(?:그림|회화))(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀 그림(Gravehal Paintings)'
  ),
  compound_rule(
    /(?<![A-Za-z])Gravehal\s+Restoration(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*(?:복구|복원))(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀 복구(Gravehal Restoration)'
  ),
  compound_rule(
    /(?<![A-Za-z])(?:The\s+)?Dream\s+of\s+Gravehal(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*(?:의\s*)?꿈)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀의 꿈(Dream of Gravehal)'
  ),
  compound_rule(
    /(?<![A-Za-z])(?:The\s+)?Rise\s+of\s+Gravehal(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*(?:의\s*)?부상)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀의 부상(Rise of Gravehal)'
  ),
  compound_rule(
    /(?<![A-Za-z])Gravehal['’]s\s+Might(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*의\s*힘)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀의 힘(Gravehal\'s Might)'
  ),
  compound_rule(
    /(?<![A-Za-z])Mighty\s+Lord\s+of\s+Gravehal(?![A-Za-z])/i,
    /(?<full>위대한\s+#{name}#{optional_label}\s*의\s*영주)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀의 위대한 영주(Mighty Lord of Gravehal)'
  ),
  compound_rule(
    /(?<![A-Za-z])Second\s+Lord\s+of\s+Gravehal(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*의\s*제?2?대?\s*영주)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀의 제2대 영주(Second Lord of Gravehal)'
  ),
  compound_rule(
    /(?<![A-Za-z])Lord\s+Gravehal(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*(?:의\s*)?영주)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀 영주(Lord Gravehal)'
  ),
  compound_rule(
    /(?<![A-Za-z])Lady\s+Gravehal(?![A-Za-z])/i,
    /(?<full>레이디\s+#{name}#{optional_label}|#{name}#{optional_label}\s*부인)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '레이디 그레이브홀(Lady Gravehal)'
  ),
  compound_rule(
    /(?<![A-Za-z])Lord\s+of\s+Gravehal(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*의\s*영주)(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀의 영주(Lord of Gravehal)'
  ),
  compound_rule(
    /(?<![A-Za-z])Lady\s+of\s+Gravehal(?![A-Za-z])/i,
    /(?<full>#{name}#{optional_label}\s*(?:의\s*)?(?:여주인|안주인|부인))(?<particle>#{particle_pattern})?(?![가-힣])/,
    '그레이브홀의 여주인(Lady of Gravehal)'
  )
]

generic_pattern = /(?<![가-힣])(?<name>#{name_pattern})(?:\s*\((?<label>[^()]*)\))?(?<particle>#{particle_pattern})?(?![가-힣])/
full_label_pattern = /\A\s+[\p{Hangul} ]{1,60}\((?<label>[^()]*)\)/
gravehal_pattern = /(?<![A-Za-z])Gravehal(?![A-Za-z])/i
visible_gravehal = /(?<![A-Za-z])Gravehal(?![A-Za-z])/i

reviews = generated.map do |occurrence|
  key = m.key(occurrence)
  source = sources.fetch(key)
  english_parts = JSON.parse(source.fetch('en_texts_json')).compact
  english = english_parts.join("\n")
  visible_english = english.gsub(/\$[^$]*\$/, ' ')
  old = source.fetch('work_text')
  text = old.dup
  visible_hit = visible_english.match?(visible_gravehal)
  compound_changes = []

  if visible_hit
    rules.each do |rule|
      next unless visible_english.match?(rule[:english])
      matches = text.to_enum(:scan, rule[:korean]).map { Regexp.last_match.dup }
      english_count = visible_english.scan(rule[:english]).length
      korean_name_count = text.scan(/(?<![가-힣])(?:#{name_pattern})(?![가-힣])/).length
      safe_matches = matches.select do |match|
        prior_label = match[:full].to_s[/\(([^()]*)\)\s*(?:요새|성채|성|킵|도서관|안뜰|무기고|탑|대사관|돌|단식|패스팅|지하\s*통로|갤러리|미술관|터널|그림|회화|복구|복원|꿈|부상|의\s*힘|의\s*영주|여주인|안주인|부인)/, 1]
        structural = match[:full].to_s.match?(/(?:요새|성채|성|킵|도서관|안뜰|무기고|탑|대사관|돌|단식|패스팅|지하\s*통로|갤러리|미술관|터널|그림|회화|복구|복원|꿈|부상|의\s*힘|의\s*영주|여주인|안주인|부인)/)
        annotated = prior_label && prior_label.match?(gravehal_pattern)
        structural || annotated || (english_count == korean_name_count && matches.length == english_count)
      end
      next if safe_matches.empty?

      safe_matches.reverse_each do |match|
        replacement = "#{rule[:canonical]}#{match[:particle]}"
        text[match.begin(0)...match.end(0)] = replacement
        compound_changes << rule[:english].source
      end
    end
  end

  found = false
  changed = old != text
  text.to_enum(:scan, generic_pattern).map { Regexp.last_match.dup }.reverse_each do |match|
    next unless text[0...match.begin(0)].count('(') <= text[0...match.begin(0)].count(')')
    found = true
    label = match[:label]
    particle = match[:particle].to_s
    tail = text[match.end(0)..]
    atomic_tail = tail.match(full_label_pattern)
    next if atomic_tail && atomic_tail[:label].match?(gravehal_pattern)

    replacement = if label && label.match?(gravehal_pattern)
                    "#{korean_name}(#{label})#{particle}"
                  elsif label && label.match?(/[A-Za-z]/)
                    "#{korean_name}(#{label})#{particle}"
                  else
                    "#{korean_name}(#{english_name})#{particle}"
                  end
    next if replacement == match[0]
    text[match.begin(0)...match.end(0)] = replacement
    changed = true
  end

  status = if !visible_hit
             'excluded'
           elsif !found
             'uncertain'
           elsif changed
             'accepted'
           else
             'not-an-issue'
           end
  japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
  chinese = source.fetch('zh_text')
  context_note = if english.match?(/(?<![A-Za-z])Gravehal\s+Fasting(?![A-Za-z])/i)
                   'Context exception: Gravehal Fasting is an underground passage/region, as Japanese 地下通路 and Chinese 通道 corroborate; it is not rendered as literal abstention.'
                 elsif english.match?(/(?:Lord|Lady)\s+of\s+Gravehal|Mighty\s+Lord\s+of\s+Gravehal|(?:Second\s+)?Lord\s+Gravehal|Lady\s+Gravehal/i)
                   'Context exception: Gravehal occurs inside a territorial honorific/title; the title wording and Korean particles are kept together rather than treated as a separate person name.'
                 elsif !compound_changes.empty?
                   'Compound exception: the aligned source names a complete Gravehal location/title; its Korean counterpart and full English label are kept atomic, with no nested component annotation.'
                 else
                   'English identifies the Gravehal place reference; Japanese グレイバル and Chinese 格雷夫霍 corroborate the setting name. Only the bounded Korean name span is normalized; particles, line breaks, placeholders, and surrounding prose are preserved.'
                 end
  evidence = if !visible_hit
               'The English Gravehal hit occurs only inside an opaque variable, not visible player-facing text; excluded.'
             elsif !found
               "English identifies Gravehal, but no safely bounded Korean name span was found. Japanese and Chinese were retained for follow-up. #{context_note}"
             else
               "EN primary: #{english.gsub(/\s+/, ' ')[0, 220].inspect}. JA corroboration: #{japanese.gsub(/\s+/, ' ')[0, 140].inspect}. ZH corroboration: #{chinese.to_s.gsub(/\s+/, ' ')[0, 120].inspect}. #{context_note}"
             end
  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => entity, 'status' => status, 'old' => old, 'new' => text,
    'evidence' => evidence,
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

raise 'visible Gravehal source inventory changed' unless
  reviews.count { |row| row['status'] != 'excluded' } == 184

nested_label_pattern = /그레이브홀\(Gravehal\)\s+(?:요새|성채|성|킵|도서관|안뜰|무기고|탑|대사관|돌|단식|패스팅|지하\s*통로|갤러리|미술관|터널|그림|회화|복구|복원|꿈|부상|의\s*힘|의\s*영주|여주인|안주인|부인)\s*\([^()]*Gravehal[^()]*\)/
unsafe = reviews.select do |row|
  row['status'] == 'uncertain' || row['status'] == 'excluded' ||
    row['new'].match?(nested_label_pattern)
end

if dry_run
  status_counts = reviews.group_by { |row| row['status'] }.transform_values(&:length)
  resource_counts = reviews.group_by { |row| row['resource'] }.transform_values(&:length)
  variant_patterns = {
    '그레이브홀' => /그레이브홀/,
    '그레이브할' => /그레이브할/,
    '그레이벌' => /그레이벌/,
    '그레이홀' => /그레이홀/
  }
  variant_counts = variant_patterns.transform_values do |pattern|
    reviews.count { |row| row['old'].match?(pattern) }
  end
  compound_rows = reviews.select { |row| row['evidence'].include?('Compound exception:') }
  title_rows = reviews.select { |row| row['evidence'].include?('territorial honorific/title') }
  fasting_rows = reviews.select { |row| row['evidence'].include?('Gravehal Fasting') }
  puts "Dry run only; refreshed aligned inventory rows=#{inventory.length}."
  puts "Gravehal source rows=#{reviews.length}; resources=#{resource_counts.inspect}; statuses=#{status_counts.inspect}."
  puts "Current Korean row variants=#{variant_counts.inspect}."
  puts "Atomic compound rows=#{compound_rows.length}; territorial-title rows=#{title_rows.length}; Fasting passage rows=#{fasting_rows.length}."
  puts "Unsafe or unresolved rows=#{unsafe.length}."
  unsafe.each do |row|
    puts "UNSAFE #{m.key(row).join(':')} status=#{row['status']} old=#{row['old'].inspect} new=#{row['new'].inspect}"
  end
  puts 'No glossary/index/CSV/checkpoint/manifest writes performed.'
  exit(unsafe.empty? ? 0 : 2)
end

raise 'unresolved Korean Gravehal occurrence needs focused review' if
  reviews.any? { |row| row['status'] == 'uncertain' }
raise 'unexpected excluded Gravehal source row' if
  reviews.any? { |row| row['status'] == 'excluded' }
raise 'atomic compound received a nested component annotation' if
  reviews.any? { |row| row['new'].match?(nested_label_pattern) }

index = m.table(m::INDEX)
raise 'duplicate generated Gravehal entity-row keys' unless
  generated.map { |row| m.key(row) }.uniq.length == generated.length
existing_index = index.select { |row| row['entity_key'] == entity }
existing_keys = existing_index.to_h { |row| [m.key(row), row] }
generated.each do |row|
  indexed = existing_keys[m.key(row)]
  next unless indexed
  raise "conflicting existing Gravehal index key #{m.key(row).inspect}" unless
    indexed['matched_english'].to_s.split('|').any? { |term| term.casecmp?(english_name) }
end

unless existing_definition
  m.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + [definition])
end
missing_index_rows = generated.reject { |row| existing_keys.key?(m.key(row)) }
unless missing_index_rows.empty?
  m.write_table(m::INDEX, index.headers, index.map(&:to_h) + missing_index_rows)
end

out = File.join(__dir__, 'proper-name-reviewed-gravehal-continuation.tsv')
m.write_table(out, m::HEADERS, reviews)
m.run(out, start_d, nil)
