#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
terms = {
  'people:erathi' => ['Erathi', '에라시', %w[에라트리 에라시 에라티]],
  'people:jottun' => ['Jottun', '요툰', %w[요툰 조툰 요튼]],
  'people:kollossae' => ['Kollossae', '콜로사이', %w[콜로사이 콜로새 콜로세]]
}
requested = ARGV
abort 'specify reviewed entity keys' if requested.empty? || (requested - terms.keys).any?
inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
index = m.table(m::INDEX)
selected = index.select { |row| row['status'] == 'needs-context' && requested.include?(row['entity_key']) }
reviews = selected.group_by { |row| m.key(row) }.map do |row_key, matches|
  source = inventory.fetch(row_key)
  english = JSON.parse(source['en_texts_json']).compact.join("\n")
  visible = english.gsub(/\$[^$]*\$/, '')
  old = source['work_text']
  replacement = old.dup
  decisions = {}
  evidence = []
  matches.each do |match|
    entity = match['entity_key']
    term, korean, variants = terms.fetch(entity)
    unless visible.match?(/\b#{term}\b/i)
      decisions[entity] = 'excluded'
      evidence << "#{entity}: lexical match is only in an opaque variable identifier; preserve its bytes."
      next
    end
    if entity == 'people:kollossae' && row_key == ['default', '9956', '']
      replacement.sub!('Kollossae', '콜로사이(Kollossae)')
    end
    pattern = variants.sort_by { |form| -form.length }.map { |form| Regexp.escape(form) }.join('|')
    protected = []
    replacement.gsub!(/(?:#{pattern})(?<suffix>족|인|어)?(?<tail>[^().,\r\n]{0,35})\((?<title>[^)]*\b#{term}\b[^)]*)\)/i) do
      protected << "#{korean}#{Regexp.last_match[:suffix]}#{Regexp.last_match[:tail]}(#{Regexp.last_match[:title]})"
      "\x01#{protected.length - 1}\x02"
    end
    replacement.gsub!(/(?:#{pattern})(?<suffix>족|인|어)?(?:\(#{term}\))?/i) do
      "#{korean}#{Regexp.last_match[:suffix]}(#{term})"
    end
    replacement.gsub!(/\x01(\d+)\x02/) { protected.fetch(Regexp.last_match(1).to_i) }
    raise "unknown counterpart needs focused re-review #{entity} #{row_key.inspect}" unless replacement.include?(korean)
    evidence << case entity
                when 'people:erathi'
                  'English identifies the ancient Erathi beings, patrons, relics or species-derived ruins. Japanese エラシ and Chinese 埃拉西 corroborate; standardize 에라시(Erathi), preserving existing grammatical 족/인 suffixes and complete bilingual artifact/title forms.'
                when 'people:jottun'
                  'English Jottun identifies the named giant people/creatures rather than an ungrounded generic giant substitution. Japanese ジョタン and Chinese 约坦 corroborate; standardize 요툰(Jottun), preserving compound titles and grammatical suffixes.'
                when 'people:kollossae'
                  'English Kollossae identifies the giant people of the Teeth of Naros, not a personal name. Japanese カロッサエ/カロシー and Chinese 克勒塞 corroborate; reuse established 콜로사이(Kollossae), preserving grammatical 족/인 and complete source-named titles. The ACT test label at default:9956 retains its debug qualifier while pairing the species name.'
                end
  end
  status = old == replacement ? 'not-an-issue' : 'accepted'
  matches.each { |row| decisions[row['entity_key']] ||= status }
  status = 'excluded' if decisions.values.all? { |value| value == 'excluded' }
  {
    'resource' => row_key[0], 'ID_Linha' => row_key[1], 'Tipo_Variante' => row_key[2],
    'entity_key' => matches.map { |row| row['entity_key'] }.sort.join('|'),
    'old' => old, 'new' => replacement, 'status' => status,
    'entity_dispositions_json' => JSON.generate(decisions),
    'evidence' => evidence.join(' ') + ' Official-manual peoples/setting context is background; its four playable peoples are not an exhaustive catalogue of these ancient or DLC peoples.',
    'english' => english,
    'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
    'chinese' => source['zh_text']
  }
end
path = File.join(__dir__, "proper-name-reviewed-#{requested.map { |key| key.split(':').last }.join('-')}-continuation.tsv")
m.write_table(path, m::HEADERS, reviews)
puts "#{path}: #{reviews.length} keys; #{reviews.group_by { |r| r['status'] }.transform_values(&:length).inspect}"
