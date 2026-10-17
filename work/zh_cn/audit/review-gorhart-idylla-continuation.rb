#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
terms = {
  'place:gorhart' => ['Gorhart', '고어하트', %w[고어하트 고어하르트 고하트 고르하트]],
  'place:idylla' => ['Idylla', '이디라', %w[아이딜라 이디라 이딜라 이디야]]
}
inventory = m.table(m::INVENTORY)
sources = inventory.to_h { |row| [m.key(row), row.to_h] }
index = m.table(m::INDEX)
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
addition = glossary.headers.zip([
  'person:alden-gorhart', 'Alden Gorhart', 'person', '알든 고어하트(Alden Gorhart)',
  '', '올든 고어하트|알덴 고어하트|앨든 고어하트', 'default:19464|default:22876|default:62300|base:1042',
  'confirmed', 'English identifies the founder of the inn as a person, not the Gorhart settlement. Japanese アルデン・ゴーハート and Chinese 埃尔登·郭哈特 corroborate. Reuse the already paired 알든 고어하트 form.'
]).to_h
already_registered = glossary.any? { |entry| entry['entity_key'] == addition['entity_key'] }
generated = already_registered ? [] : build_occurrences(inventory, [addition]).map { |row| OCCURRENCE_HEADERS.zip(row).to_h }
combined_index = index.map(&:to_h) + generated
matches_by_key = combined_index.select do |row|
  row['status'] == 'needs-context' && (terms.key?(row['entity_key']) || row['entity_key'] == addition['entity_key'])
end.group_by { |row| m.key(row) }
reviews = matches_by_key.map do |row_key, matches|
  source = sources.fetch(row_key)
  english = JSON.parse(source['en_texts_json']).compact.join("\n")
  visible = english.gsub(/\$[^$]*\$/, '')
  old = source['work_text']
  replacement = old.dup
  entity_status = {}
  evidence = []
  if matches.any? { |row| row['entity_key'] == addition['entity_key'] }
    replacement.gsub!(/(?:알든|올든|알덴|앨든)\s+고어하트(?:\(Alden Gorhart\))?/, addition['korean_canonical'])
    evidence << addition['notes']
  end
  terms.each do |entity, (term, korean, variants)|
    next unless matches.any? { |row| row['entity_key'] == entity }
    visible_term = entity == 'place:gorhart' ? visible.gsub(/\bAlden Gorhart\b/i, '') : visible
    unless visible_term.match?(/\b#{term}\b/i)
      entity_status[entity] = 'excluded'
      evidence << "#{entity}: source hit occurs only in an opaque variable or the personal surname Alden Gorhart, not geographical prose. Preserve those distinctions."
      next
    end
    pattern = variants.sort_by { |form| -form.length }.map { |form| Regexp.escape(form) }.join('|')
    protected = []
    replacement.gsub!(/(?:#{pattern})(?<tail>[^().,\r\n]{0,35})\((?<title>[^)]*\b#{term}\b[^)]*)\)/i) do
      protected << "#{korean}#{Regexp.last_match[:tail]}(#{Regexp.last_match[:title]})"
      "\x01#{protected.length - 1}\x02"
    end
    replacement.gsub!(/(?:#{pattern})(?:\(#{term}\))?/, "#{korean}(#{term})")
    replacement.gsub!(/\x01(\d+)\x02/) { protected.fetch(Regexp.last_match(1).to_i) }
    evidence << if entity == 'place:gorhart'
                  'English village/route/resident context identifies Gorhart; Japanese ゴーハート and Chinese 郭哈特 corroborate. Standardize all reviewed visible mentions as 고어하트(Gorhart), keeping complete Village/Inn/Jail and personal-name bilingual pairs intact.'
                else
                  'English identifies the floating Kollossae city Idylla; Japanese アイデラ/イディラ and Chinese 伊迪拉 corroborate. Reuse established 이디라(Idylla), including repeated prose mentions, without nesting annotations inside complete bilingual place/title forms.'
                end
    raise "missing visible region #{row_key.inspect}" unless replacement.include?(korean)
  end
  status = replacement == old ? 'not-an-issue' : 'accepted'
  matches.each { |row| entity_status[row['entity_key']] ||= status }
  status = 'excluded' if entity_status.values.all? { |value| value == 'excluded' }
  {
    'resource' => row_key[0], 'ID_Linha' => row_key[1], 'Tipo_Variante' => row_key[2],
    'entity_key' => matches.map { |row| row['entity_key'] }.sort.join('|'),
    'old' => old, 'new' => replacement, 'status' => status,
    'entity_dispositions_json' => JSON.generate(entity_status),
    'evidence' => evidence.join(' ') + ' Official-manual setting context is used; it does not establish a conflicting spelling for these specific settlements or this inn founder.',
    'english' => english,
    'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
    'chinese' => source['zh_text']
  }
end
terms.each do |entity, (_english, korean, variants)|
  glossary.find { |row| row['entity_key'] == entity }['korean_variants'] = (variants - [korean]).join('|')
end
glossary_rows = glossary.map(&:to_h).reject { |entry| entry['entity_key'] == addition['entity_key'] }
m.write_table(glossary_path, glossary.headers, glossary_rows + [addition])
m.write_table(m::INDEX, index.headers, combined_index)
m.write_table(File.join(__dir__, 'proper-name-reviewed-gorhart-idylla-continuation.tsv'), m::HEADERS, reviews)
puts "#{reviews.length} unique keys; registered #{generated.length} full-name matches; #{reviews.group_by { |r| r['status'] }.transform_values(&:length).inspect}"
