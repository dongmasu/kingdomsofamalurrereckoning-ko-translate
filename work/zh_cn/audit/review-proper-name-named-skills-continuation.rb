#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

preview = ARGV.delete('--preview')
abort 'usage: review-proper-name-named-skills-continuation.rb START_D [--preview]' unless ARGV.length == 1

m = ReviewedNameBatches
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
glossary_headers = glossary.headers.dup

manual_context = 'Official Korean manual PDF pp. 4-5 distinguishes general skills from combat abilities and explains the Might/Finesse/Sorcery ability trees; it does not list this individual name, so no individual spelling is inferred from the manual.'

specs = [
  {
    entity: 'skill:adrenaline-surge',
    english: 'Adrenaline Surge',
    korean: '아드레날린 분출',
    variants: ['아드레날린 쇄도', '아드레날린 파동', '아드레날린 폭주'],
    japanese: 'アドレナリンサージ',
    chinese: '肾上腺素',
    anchors: [
      ['default', '40948', '', 'Adrenaline Surge', 'アドレナリンサージ', '肾上腺素']
    ],
    approved: [
      ['default', '15363', ''], ['default', '15523', ''], ['default', '24739', ''],
      ['default', '24931', ''], ['default', '26263', ''], ['default', '28719', ''],
      ['default', '35062', ''], ['default', '39752', ''], ['default', '40948', ''],
      ['default', '54273', '']
    ],
    notes: 'The exact ability-menu label and its critical-hit effect/upgrade descriptions identify the named ability. Canonical Korean follows the menu and most current descriptions; normalize 쇄도, 파동, and 폭주.'
  },
  {
    entity: 'skill:conservative-casting',
    english: 'Conservative Casting',
    korean: '마나 절약 시전',
    variants: [],
    japanese: 'コンサバティブキャスト',
    chinese: '节能施法',
    anchors: [
      ['default', '37639', '', 'Conservative Casting', 'コンサバティブキャスト', '节能施法']
    ],
    approved: [['default', '37639', '']],
    notes: 'The exact ability-menu label is corroborated by Japanese transliteration and Chinese semantic translation. Retain the existing source-supported Korean menu translation.'
  },
  {
    entity: 'skill:chain-lightning',
    english: 'Chain Lightning',
    korean: '연쇄 번개',
    variants: [],
    japanese: 'チェインライトニング',
    chinese: '连锁雷电',
    anchors: [
      ['default', '15245', '', 'Chain Lightning', 'チェインライトニング', '连锁雷电']
    ],
    approved: [['default', '15245', '']],
    notes: 'The exact ability-menu label is corroborated by Japanese and Chinese. The Korean phrase is also ordinary-language compatible, so annotate it only at this explicitly named ability row.'
  },
  {
    entity: 'skill:frost-trap',
    english: 'Frost Trap',
    korean: '서리 덫',
    variants: ['서리 함정', '얼음 덫'],
    japanese: 'フロストトラップ',
    chinese: '冰霜陷阱',
    anchors: [
      ['base', '1847', '11', 'Frost Trap', 'フロストトラップ', '冰霜陷阱'],
      ['default', '30150', '', 'Frost Trap', 'フロストトラップ', '冰霜陷阱']
    ],
    approved: [
      ['base', '1847', '11'], ['default', '1015', ''], ['default', '14166', ''],
      ['default', '14990', ''], ['default', '15077', ''], ['default', '23906', ''],
      ['default', '28707', ''], ['default', '29672', ''], ['default', '30150', ''],
      ['default', '34934', ''], ['default', '45656', ''], ['default', '52037', ''],
      ['default', '52886', ''], ['default', '59552', ''], ['default', '59970', ''],
      ['default', '63046', ''], ['default', '63309', '']
    ],
    notes: 'Exact menu labels and ability damage, upgrade, and active-use descriptions establish the named skill. Japanese and Chinese align across the rows. Normalize 서리 함정 and 얼음 덫 to the common menu-supported 서리 덫; keep each full English label atomic.'
  },
  {
    entity: 'skill:lunge',
    english: 'Lunge',
    korean: '돌진',
    variants: [],
    japanese: 'ランジ',
    chinese: '猛冲',
    anchors: [
      ['base', '4189', '11', 'Lunge', 'ランジ', '猛冲'],
      ['default', '38243', '', 'Lunge', 'ランジ', '猛冲']
    ],
    approved: [
      ['base', '4189', '11'], ['default', '61', ''], ['default', '38243', '']
    ],
    uncertain: [
      ['default', '18345', ''], ['default', '52503', '']
    ],
    excluded: [
      ['default', '5742', '']
    ],
    notes: 'The ability-menu labels and the Combo Point bonus identify the skill. The two active-description rows describe the Lunge maneuver, but Korean omits a bounded name span; leave those cells unchanged. Lunge Combo is a separate full label and is excluded.'
  },
  {
    entity: 'skill:smoke-bomb',
    english: 'Smoke Bomb',
    korean: '연막탄',
    variants: [],
    japanese: 'スモークボム',
    chinese: '烟雾弹',
    anchors: [
      ['base', '4767', '11', 'Smoke Bomb', 'スモークボム', '烟雾弹'],
      ['default', '33483', '', 'Smoke Bomb', 'スモークボム', '烟雾弹']
    ],
    approved: [
      ['base', '4767', '11'], ['default', '1798', ''], ['default', '5248', ''],
      ['default', '8831', ''], ['default', '9323', ''], ['default', '14329', ''],
      ['default', '14985', ''], ['default', '15652', ''], ['default', '20978', ''],
      ['default', '33483', ''], ['default', '37813', ''], ['default', '41047', ''],
      ['default', '47507', ''], ['default', '49718', ''], ['default', '63481', '']
    ],
    notes: 'Exact menu labels and aligned damage, cooldown, poison-upgrade, and concealment descriptions identify the named ability. Normalize only rows in this reviewed skill context; do not globally annotate ordinary smoke-bomb mentions.'
  },
  {
    entity: "skill:assassin's-art",
    english: "Assassin's Art",
    korean: '암살자의 예술',
    variants: ['암살자의 기술'],
    japanese: 'アサシンアート',
    chinese: '刺客的艺术',
    anchors: [
      ['default', '40360', '', "Assassin's Art", 'アサシンアート', '刺客的艺术']
    ],
    approved: [
      ['default', '40360', ''], ['default', '51888', '']
    ],
    notes: 'The exact ability-menu label and Finesse-tree ability sentence establish the named skill. Japanese アート and Chinese 艺术 support 예술 over the isolated menu translation 기술; preserve the following Korean noun such as 능력.'
  },
  {
    entity: 'skill:gambit',
    english: 'Gambit',
    korean: '갬빗',
    variants: ['책략'],
    japanese: 'ガンビット',
    chinese: '甘贝特',
    anchors: [
      ['base', '1428', '11', 'Gambit', 'ガンビット', '甘贝特'],
      ['default', '20551', '', 'Gambit', 'ガンビット', '甘贝特']
    ],
    approved: [
      ['base', '1428', '11'], ['default', '20551', ''], ['default', '57599', '']
    ],
    excluded: [
      ['default', '20836', ''], ['default', '26371', ''], ['default', '34336', ''],
      ['default', '39956', ''], ['default', '41652', ''], ['default', '52524', '']
    ],
    notes: 'The exact ability-menu labels and detonation/evasion mechanics identify this skill; Japanese transliteration and Chinese phonetic rendering corroborate it. The old Korean skill-menu label 책략 at base:1428 is a contextual variant, not a global replacement rule for ordinary tactics. Exclude Gambit Trap/Small and Gambit Combo as separate full labels, and Varlaine/Caerwyn historical Gambit titles as unrelated compounds.'
  }
].freeze

definitions = specs.map do |spec|
  values = [
    spec.fetch(:entity), spec.fetch(:english), 'skill',
    "#{spec.fetch(:korean)}(#{spec.fetch(:english)})", '',
    spec.fetch(:variants).join('|'),
    spec.fetch(:anchors).map { |anchor| "#{anchor[0]}:#{anchor[1]}" }.join('|'),
    'confirmed',
    "#{spec.fetch(:notes)} #{manual_context}"
  ]
  glossary.headers.zip(values).to_h
end

raise 'duplicate target skill definition' unless
  definitions.map { |row| row.fetch('entity_key') }.uniq.length == definitions.length

definitions.each do |definition|
  existing = glossary.select { |row| row['entity_key'] == definition.fetch('entity_key') }
  raise "duplicate glossary definition for #{definition['entity_key']}" if existing.length > 1
  next if existing.empty?
  row = existing.first
  raise "conflicting glossary definition for #{definition['entity_key']}" unless
    row['english_canonical'] == definition['english_canonical'] &&
    row['category'] == definition['category'] &&
    row['korean_canonical'] == definition['korean_canonical']
end

inventory = m.refresh_inventory.values
sources = inventory.to_h { |row| [m.key(row), row.to_h] }

specs.each do |spec|
  spec.fetch(:anchors).each do |resource, id, variant, english, japanese, chinese|
    source = sources.fetch([resource, id, variant])
    english_texts = JSON.parse(source.fetch('en_texts_json') || '[]').compact
    japanese_texts = JSON.parse(source.fetch('ja_texts_json') || '[]').compact
    raise "English label anchor changed for #{spec[:entity]} #{resource}:#{id}" unless
      english_texts.include?(english)
    raise "Japanese anchor mismatch for #{spec[:entity]} #{resource}:#{id}" unless
      japanese_texts.join("\n").include?(japanese)
    raise "Chinese anchor mismatch for #{spec[:entity]} #{resource}:#{id}" unless
      source.fetch('zh_text').to_s.include?(chinese)
  end
end

generated = build_occurrences(inventory, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
spec_by_entity = specs.to_h { |spec| [spec.fetch(:entity), spec] }

expected_keys = specs.to_h do |spec|
  keys = (spec.fetch(:approved) + spec.fetch(:uncertain, []) + spec.fetch(:excluded, []))
    .map { |resource, id, variant| [resource, id, variant] }
  raise "duplicate reviewed source key for #{spec[:entity]}" unless keys.uniq.length == keys.length
  [spec.fetch(:entity), keys.sort]
end
actual_keys = generated.group_by { |row| row.fetch('entity_key') }.transform_values do |rows|
  rows.map { |row| m.key(row) }.sort
end
raise 'candidate source-key scope changed; re-review before proceeding' unless actual_keys == expected_keys

particle_pattern = %w[
  에서부터 으로부터 으로써 으로서는 으로서 에게서는 에게서 에게도 에게는
  에게 에서도 에서는 에까지 에서 에도 에는 으로도 으로는 으로만 으로
  로부터 로도 로는 로만 처럼 만큼 보다 행 였던 이었던 까지 부터
  이라며 이라는 이라서 이라고 이라 라고 라며 라 은 는 이 가 을 를 와 과 의
  에 로 도 만 들
].uniq.sort_by { |value| -value.length }.map { |value| Regexp.escape(value) }.join('|')

def source_hit_count(english_texts, english)
  pattern = /(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])/i
  english_texts.sum { |text| text.to_s.scan(pattern).length }
end

def skill_particle_for(particle, korean)
  final = (korean[-1].ord - 0xAC00) % 28
  pairs = [%w[은 는], %w[이 가], %w[을 를], %w[과 와],
           %w[이라는 라는], %w[이라며 라며], %w[이라서 라서],
           %w[이라고 라고], %w[이라 라], %w[이었던 였던]]
  pair = pairs.find { |values| values.include?(particle) }
  return pair[final.zero? ? 1 : 0] if pair
  return particle.sub(/\A(?:으로|로)/, final.zero? || final == 8 ? '로' : '으로') if
    particle.match?(/\A(?:으로|로)/)

  particle
end

def rewrite_skill_span(text, spec, particle_pattern, english_texts)
  english = spec.fetch(:english)
  variants = ([spec.fetch(:korean)] + spec.fetch(:variants)).uniq
    .sort_by { |value| -value.length }
    .map { |value| Regexp.escape(value) }.join('|')
  pattern = /(?<![가-힣])(?:#{variants})(?:\s*\(#{Regexp.escape(english)}\))?(?<particle>#{particle_pattern})?(?![가-힣])/
  matches = text.to_enum(:scan, pattern).map { Regexp.last_match.dup }
  return [text, 'uncertain', 'No bounded Korean skill span matched the aligned English mention; left unchanged.'] if matches.empty?

  matches.each do |match|
    before = text[0...match.begin(0)]
    after = text[match.end(0)..].to_s
    return [text, 'uncertain', 'A candidate Korean span is inside another label or followed by an unrelated parenthetical; left the cell unchanged.'] if
      before.count('(') > before.count(')') || after.match?(/\A\s*\(/)
  end

  english_count = source_hit_count(english_texts, english)
  return [text, 'uncertain', 'English and Korean mention counts do not align one-to-one; left unchanged.'] unless
    english_count == matches.length

  rewritten = text.dup
  matches.reverse_each do |match|
    particle = skill_particle_for(match[:particle].to_s, spec.fetch(:korean))
    replacement = "#{spec.fetch(:korean)}(#{english})#{particle}"
    rewritten[match.begin(0)...match.end(0)] = replacement
  end
  status = rewritten == text ? 'not-an-issue' : 'accepted'
  [rewritten, status, "Normalized only the reviewed Korean span to #{spec.fetch(:korean)}(#{english}); matched the particle to the Korean ending and preserved surrounding source text."]
end

reviews = generated.group_by { |row| m.key(row) }.map do |key, occurrences|
  source = sources.fetch(key)
  english_texts = JSON.parse(source.fetch('en_texts_json') || '[]').compact
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n")
  chinese = source.fetch('zh_text').to_s
  raise "missing aligned Japanese/Chinese evidence for #{key.inspect}" if japanese.empty? || chinese.empty?

  old = source.fetch('work_text')
  text = old.dup
  dispositions = {}
  evidence = []

  occurrences.each do |occurrence|
    entity = occurrence.fetch('entity_key')
    spec = spec_by_entity.fetch(entity)
    approved = spec.fetch(:approved).map { |parts| parts.map(&:to_s) }.include?(key)
    uncertain = spec.fetch(:uncertain, []).map { |parts| parts.map(&:to_s) }.include?(key)
    excluded = spec.fetch(:excluded, []).map { |parts| parts.map(&:to_s) }.include?(key)

    if excluded
      dispositions[entity] = 'excluded'
      reason = case [entity, key]
               when ['skill:lunge', ['default', '5742', '']]
                 'Lunge Combo is a distinct full English/Japanese/Chinese compound label; preserve its complete Korean label.'
               when ['skill:gambit', ['default', '20836', '']]
                 'Gambit Trap Small is a distinct compound ability label, not the standalone Gambit skill.'
               when ['skill:gambit', ['default', '26371', '']]
                 'Gambit Combo is a distinct compound ability label, not the standalone Gambit skill.'
               when ['skill:gambit', ['default', '39956', '']]
                 'Gambit Trap is a distinct compound ability label, not the standalone Gambit skill.'
               else
                 "The English Gambit mention belongs to a complete historical title or named maneuver, corroborated by Japanese and Chinese; preserve the full title and do not annotate its component."
               end
      evidence << "#{entity}: #{reason}"
      next
    end

    if uncertain
      dispositions[entity] = 'uncertain'
      evidence << "#{entity}: English, Japanese, and Chinese describe the Lunge ability, but the Korean sentence translates the action without a bounded name span. Left unchanged rather than inject a new name."
      next
    end

    raise "unclassified source key #{entity} #{key.inspect}" unless approved
    text, disposition, reason = rewrite_skill_span(text, spec, particle_pattern, english_texts)
    dispositions[entity] = disposition
    evidence << "#{entity}: English #{english_texts.join(' / ')}; Japanese #{japanese}; Chinese #{chinese}. #{reason}"
  end

  status = if text != old
             'accepted'
           elsif dispositions.values.include?('uncertain')
             'uncertain'
           elsif dispositions.values.include?('not-an-issue')
             'not-an-issue'
           else
             'excluded'
           end
  raise "non-accepted skill row changed #{key.inspect}" if status != 'accepted' && text != old
  raise "line breaks or placeholders changed #{key.inspect}" unless
    old.count("\n") == text.count("\n") &&
    old.scan(/\{[^}]*\}/) == text.scan(/\{[^}]*\}/)

  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => occurrences.map { |row| row.fetch('entity_key') }.sort.join('|'),
    'status' => status, 'old' => old, 'new' => text,
    'evidence' => evidence.join(' '),
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

raise 'duplicate reviewed row keys' unless
  reviews.map { |row| m.key(row) }.uniq.length == reviews.length

index_table = m.table(m::INDEX)
index_headers = index_table.headers.dup
index = index_table.map(&:to_h)
indexed_keys = index.map { |row| [row.fetch('entity_key'), *m.key(row)] }
generated.each do |occurrence|
  next if indexed_keys.include?([occurrence.fetch('entity_key'), *m.key(occurrence)])
  source = sources.fetch(m.key(occurrence))
  occurrence['korean_current'] = source.fetch('work_text')
  index << occurrence
end

glossary_by_key = glossary.map(&:to_h)
definitions.each do |definition|
  glossary_by_key << definition unless glossary.any? { |row| row['entity_key'] == definition['entity_key'] }
end
start_d = Integer(ARGV.fetch(0))
reviews.each_slice(50).with_index do |_batch, ordinal|
  d = start_d + ordinal
  raise "D-#{d} already recorded; nothing registered" if
    File.exist?(File.join(__dir__, "named-scope-review-D#{d}-20261015.md"))
end
unless preview
  m.write_table(glossary_path, glossary_headers, glossary_by_key)
  m.write_table(m::INDEX, index_headers, index)
end

out = preview ? '/private/tmp/named-skills-preview.tsv' :
  File.join(__dir__, 'proper-name-reviewed-named-skills-continuation.tsv')
m.write_table(out, m::HEADERS, reviews)
puts "Named skills: #{definitions.length}; occurrence rows: #{generated.length}; reviewed row keys: #{reviews.length}; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
m.run(out, start_d, nil) unless preview
