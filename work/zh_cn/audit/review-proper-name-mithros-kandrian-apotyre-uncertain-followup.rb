#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

abort 'usage: review-proper-name-mithros-kandrian-apotyre-uncertain-followup.rb START_D' unless ARGV.length == 1

m = ReviewedNameBatches
prior_path = File.join(__dir__, 'proper-name-reviewed-mithros-kandrian-apotyre-continuation.tsv')
out_path = File.join(__dir__, 'proper-name-reviewed-mithros-kandrian-apotyre-uncertain-followup.tsv')
prior = m.table(prior_path)
inventory = m.refresh_inventory.values
sources = inventory.to_h { |row| [m.key(row), row.to_h] }

entities = {
  'place:mithros' => ['Mithros', '미스로스(Mithros)'],
  'place:kandrian' => ['Kandrian', '칸드리안(Kandrian)'],
  'place:apotyre' => ['Apotyre', '아포타이어(Apotyre)']
}.freeze
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))

checks = {
  ['default', '9402', ''] => {
    entity: 'place:kandrian', disposition: 'exclude',
    english: ['The Kings of Kandrian', 'Kandrian kings'],
    japanese: ['カンドリアン王家'],
    chinese: ['坎德利安国王'],
    reason: 'The English source is a lorebook title/subtitle about the line of Kandrian kings, not a place mention. Japanese 王家 and Chinese 王室 corroborate the dynasty/title context. Excluded from the place entity; no person or dynasty entity is inferred.'
  },
  ['default', '11887', ''] => {
    entity: 'place:mithros', disposition: 'already-paired',
    english: ['in Mithros'],
    japanese: ['ミスロス'],
    chinese: ['米萨罗斯'],
    korean: '미스로스(Mithros)에선',
    reason: 'The English sentence identifies the region, corroborated by Japanese and Chinese. The Korean place name already carries its complete English label and the attached 에선 particle; no change is needed.'
  },
  ['default', '15961', ''] => {
    entity: 'place:mithros', disposition: 'replace',
    english: ['Mithros Arena'],
    japanese: ['ミスロス闘技場'],
    chinese: ['米萨罗斯竞技场'],
    korean_old: '미스로스 경기장',
    korean_new: '미스로스 경기장(Mithros Arena)',
    reason: 'The English, Japanese, and Chinese name the full Mithros Arena compound. Pair the complete English compound with the Korean label and preserve 경기장 and any following particle.'
  },
  ['default', '19904', ''] => {
    entity: 'place:kandrian', disposition: 'replace',
    english: ['Kandrian Jail'],
    japanese: ['カンドリアン監獄'],
    chinese: ['坎德利安监狱'],
    korean_old: '칸드리안 감옥',
    korean_new: '칸드리안 감옥(Kandrian Jail)',
    reason: 'The English, Japanese, and Chinese name the complete Kandrian Jail compound. Pair the full label and preserve the Korean copula 이다 and all surrounding text.'
  },
  ['default', '19996', ''] => {
    entity: 'place:apotyre', disposition: 'replace',
    english: ['Isn\'t that the way of Apotyre?'],
    japanese: ['アポティア'],
    chinese: ['阿波泰尔'],
    korean_old: '아포티어',
    korean_new: '아포타이어(Apotyre)',
    reason: 'English asks about the way of Apotyre; Japanese and Chinese identify the same region. Normalize only the place span and preserve the attached 에선 particle, line breaks, and the rest of this letter.'
  },
  ['default', '33052', ''] => {
    entity: 'place:mithros', disposition: 'replace',
    english: ['in Mithros'],
    japanese: ['ミスロス'],
    chinese: ['米萨罗斯'],
    korean_old: '미스로스',
    korean_new: '미스로스(Mithros)',
    reason: 'English identifies the region, corroborated by Japanese and Chinese. Add the bilingual place label and preserve 에선 and the remainder of the sentence.'
  },
  ['default', '33570', ''] => {
    entity: 'place:mithros', disposition: 'replace',
    english: ['why Mithros'],
    japanese: ['このミスロス'],
    chinese: ['为什么是米萨罗斯'],
    korean_old: '미스로스',
    korean_new: '미스로스(Mithros)',
    reason: 'The repeated English question explicitly names the region, corroborated by Japanese and Chinese. Add the label and preserve the Korean question particle 인가.'
  },
  ['default', '44665', ''] => {
    entity: 'place:kandrian', disposition: 'exclude',
    english: ['How do I kill Kandrian?'],
    japanese: ['カンドリアンを殺す'],
    chinese: ['怎样才能杀死坎德利安'],
    reason: 'English, Japanese, and Chinese frame Kandrian as a singular kill target, not a location. Excluded from the place entity; no person entity or full personal name is guessed.'
  },
  ['default', '45500', ''] => {
    entity: 'place:mithros', disposition: 'already-paired',
    english: ['in Mithros'],
    japanese: ['ミスロス'],
    chinese: ['米萨罗斯'],
    korean: '미스로스(Mithros)에선',
    reason: 'The English sentence identifies the region, corroborated by Japanese and Chinese. The Korean place name already carries its complete English label and the attached 에선 particle; no change is needed.'
  },
  ['default', '48419', ''] => {
    entity: 'place:kandrian', disposition: 'exclude',
    english: ['Kandrian\'s as good as dead'],
    japanese: ['カンドリアンは死んだも同然'],
    chinese: ['坎德利安死定了'],
    reason: 'The English idiom and aligned Japanese/Chinese describe a singular person as effectively dead, not a place. Excluded from the place entity; no person entity or full personal name is guessed.'
  },
  ['default', '50221', ''] => {
    entity: 'place:apotyre', disposition: 'replace',
    english: ['Apotyre mining family'],
    japanese: ['アポティアの有名な鉱山ファミリー'],
    chinese: ['阿波泰尔内', '著名矿业家族'],
    korean_old: '아포티르',
    korean_new: '아포타이어(Apotyre)',
    reason: 'The English explicitly makes Apotyre the regional modifier of a mining family; Japanese の and Chinese 内 independently support that place relationship. Pair only the regional component, preserving the complete mining-family phrase and personal name.'
  },
  ['default', '52089', ''] => {
    entity: 'place:apotyre', disposition: 'already-paired',
    english: ['in Apotyre'],
    japanese: ['アポティア'],
    chinese: ['阿波泰尔'],
    korean: '아포타이어(Apotyre)에선',
    reason: 'The English sentence identifies the region, corroborated by Japanese and Chinese. The Korean place name already carries its complete English label and the attached 에선 particle; no change is needed.'
  }
}.freeze

raise 'expected exactly twelve focused uncertain rows' unless checks.length == 12
prior_by_key = prior.group_by { |row| m.key(row) }
raise 'duplicate row key in prior Mithros review file' if prior_by_key.any? { |_key, rows| rows.length != 1 }

checks.each do |key, spec|
  matches = prior_by_key.fetch(key) { raise "missing prior reviewed row #{key.inspect}" }
  previous = matches.first
  raise "unexpected prior entity for #{key.inspect}" unless previous['entity_key'] == spec.fetch(:entity)
  raise "row is not an unchanged uncertain hold #{key.inspect}" unless
    previous['status'] == 'uncertain' && previous['old'] == previous['new']
  english, korean = entities.fetch(spec.fetch(:entity))
  definitions = glossary.select { |row| row['entity_key'] == spec.fetch(:entity) }
  raise "conflicting registered place entity #{spec[:entity]}" unless
    definitions.length == 1 &&
    definitions.first['english_canonical'] == english &&
    definitions.first['korean_canonical'] == korean
end

raise 'prior review file contains unexpected uncertain rows in this focused scope' unless
  prior.select { |row| checks.key?(m.key(row)) && row['status'] == 'uncertain' }.length == checks.length

index = m.table(m::INDEX)
indexed_by_key = index.group_by { |row| [row.fetch('entity_key'), *m.key(row)] }
checks.each do |key, spec|
  matches = indexed_by_key.fetch([spec.fetch(:entity), *key], [])
  raise "index entry is not a single uncertain hold #{key.inspect}" unless
    matches.length == 1 && matches.first['status'] == 'uncertain'
end

def require_source_evidence(source, key, spec)
  english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n")
  chinese = source.fetch('zh_text').to_s
  raise "English context mismatch for #{key.inspect}" unless spec.fetch(:english).all? { |needle| english.include?(needle) }
  raise "Japanese corroboration mismatch for #{key.inspect}" unless spec.fetch(:japanese).all? { |needle| japanese.include?(needle) }
  raise "Chinese corroboration mismatch for #{key.inspect}" unless spec.fetch(:chinese).all? { |needle| chinese.include?(needle) }
  [english, japanese, chinese]
end

def replace_unique_or_hold(text, old, replacement)
  if text.include?(replacement)
    return [text, 'not-an-issue', 'The reviewed bilingual target is already present; retained it unchanged.']
  end
  if text.include?("#{old}(") || text.include?("#{old} (")
    return [text, 'uncertain', 'The Korean span has an unrelated parenthetical; retained the entire cell unchanged.']
  end
  count = text.scan(Regexp.new(Regexp.escape(old))).length
  return [text, 'uncertain', "Expected one bounded Korean span, found #{count}; retained the entire cell unchanged."] unless count == 1
  [text.sub(old, replacement), 'accepted', nil]
end

reviews = checks.map do |key, spec|
  source = sources.fetch(key) { raise "source row missing from aligned inventory #{key.inspect}" }
  english, japanese, chinese = require_source_evidence(source, key, spec)
  old = source.fetch('work_text')
  text = old.dup
  disposition = spec.fetch(:disposition)

  case disposition
  when 'already-paired'
    target = spec.fetch(:korean)
    unless text.scan(Regexp.new(Regexp.escape(target))).length == 1
      disposition = 'uncertain'
      reason = 'The previously reviewed bilingual place label or particle layout has changed; retained the cell unchanged for focused re-review.'
    else
      reason = spec.fetch(:reason)
    end
  when 'replace'
    text, disposition, fallback = replace_unique_or_hold(
      text, spec.fetch(:korean_old), spec.fetch(:korean_new)
    )
    reason = fallback || spec.fetch(:reason)
  when 'exclude'
    reason = spec.fetch(:reason)
  else
    raise "unsupported disposition #{disposition.inspect}"
  end

  disposition = { 'already-paired' => 'not-an-issue', 'exclude' => 'excluded' }
    .fetch(disposition, disposition)
  raise "non-accepted follow-up changed #{key.inspect}" if disposition != 'accepted' && text != old
  raise "line breaks or placeholders changed #{key.inspect}" unless
    old.count("\n") == text.count("\n") &&
    old.scan(/\{[^}]*\}/) == text.scan(/\{[^}]*\}/)

  {
    'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
    'entity_key' => spec.fetch(:entity), 'status' => disposition,
    'old' => old, 'new' => text,
    'evidence' => "#{spec.fetch(:entity)}: #{reason} English: #{english} Japanese: #{japanese} Chinese: #{chinese}",
    'entity_dispositions_json' => JSON.generate(spec.fetch(:entity) => disposition)
  }
end.sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }

raise 'follow-up row count changed' unless reviews.length == 12
raise 'duplicate follow-up row keys' unless reviews.map { |row| m.key(row) }.uniq.length == reviews.length

m.write_table(out_path, m::HEADERS, reviews)
puts "Mithros/Kandrian/Apotyre uncertain follow-up: #{reviews.length} rows; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
m.run(out_path, Integer(ARGV.fetch(0)), nil, review_states: ['uncertain'])
