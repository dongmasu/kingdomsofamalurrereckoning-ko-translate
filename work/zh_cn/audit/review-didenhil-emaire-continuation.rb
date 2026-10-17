#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

m = ReviewedNameBatches
terms = {
  'place:didenhil' => ['Didenhil', '다이덴힐', %w[다이덴힐 다이든힐 디든힐 디덴힐 데이든힐]],
  'place:emaire' => ['Emaire', '에메어', %w[에메어 에마이어 에마이르 에마이레]]
}
inventory = m.table(m::INVENTORY).to_h { |row| [m.key(row), row.to_h] }
index = m.table(m::INDEX)
selected = index.select { |row| row['status'] == 'needs-context' && terms.key?(row['entity_key']) }
reviews = selected.group_by { |row| m.key(row) }.map do |row_key, matches|
  source = inventory.fetch(row_key)
  old = source['work_text']
  replacement = old.dup
  visible_english = JSON.parse(source['en_texts_json']).compact.join("\n").gsub(/\$[^$]*\$/, '')
  opaque_only = matches.all? { |match| !visible_english.match?(/\b#{terms.fetch(match['entity_key'])[0]}\b/i) }
  if opaque_only
    next {
      'resource' => row_key[0], 'ID_Linha' => row_key[1], 'Tipo_Variante' => row_key[2],
      'entity_key' => matches.map { |row| row['entity_key'] }.sort.join('|'),
      'old' => old, 'new' => old, 'status' => 'excluded',
      'evidence' => 'The name is only part of an opaque dollar-delimited game-variable identifier, not displayed geographical prose. English/Japanese/Chinese preserve this token. Exclude the lexical false positive; do not translate or annotate variable bytes.',
      'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
      'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
      'chinese' => source['zh_text']
    }
  end
  matches.each do |match|
    english, korean, variants = terms.fetch(match['entity_key'])
    pattern = variants.sort_by { |v| -v.length }.map { |v| Regexp.escape(v) }.join('|')
    # A region already inside a complete bilingual title must not acquire a
    # second, nested annotation on its component.
    protected = []
    replacement.gsub!(/(?:#{pattern})(?<tail>[^().,\r\n]{0,35})\((?<title>[^)]*\b#{english}\b[^)]*)\)/i) do
      protected << "#{korean}#{Regexp.last_match[:tail]}(#{Regexp.last_match[:title]})"
      "\x01#{protected.length - 1}\x02"
    end
    replacement.gsub!(/(?:#{pattern})(?:\(#{english}\))?/, "#{korean}(#{english})")
    replacement.gsub!(/\x01(\d+)\x02/) { protected.fetch(Regexp.last_match(1).to_i) }
  end
  replacement.gsub!(/(?:작은|리틀) 다이덴힐(?:\(Didenhil\))?(?:\(Little Didenhil\))?/, '작은 다이덴힐(Little Didenhil)')
  replacement.gsub!(/(?:새|뉴) 다이덴힐(?:\(Didenhil\))?(?:\(New Didenhil\))?/, '새 다이덴힐(New Didenhil)')
  evidence = matches.map do |match|
    if match['entity_key'] == 'place:didenhil'
      'English identifies the Didenhil village, its residents/routes or source-named compounds. Japanese ダイデンヒル and Chinese 迪登希尔 corroborate. Standardize the region spelling as 다이덴힐(Didenhil), preserve complete-title pairing, and distinguish Little/New/Greater Didenhil rather than merging the places.'
    else
      'English identifies Emaire village or its residents/routes. Japanese エマイア and Chinese 伊梅尔 corroborate. Reuse the established 에메어(Emaire), including 에마이레/에마이어/에마이르 variants, and retain full Emaire Jail title pairing.'
    end
  end.join(' ')
  raise "recognized region missing #{row_key.inspect}" unless terms.values.any? { |_e, k, _v| replacement.include?(k) }
  {
    'resource' => row_key[0], 'ID_Linha' => row_key[1], 'Tipo_Variante' => row_key[2],
    'entity_key' => matches.map { |row| row['entity_key'] }.sort.join('|'),
    'old' => old, 'new' => replacement, 'status' => old == replacement ? 'not-an-issue' : 'accepted',
    'evidence' => evidence + ' The official manual gives overall setting context, not a conflicting village spelling.',
    'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
    'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
    'chinese' => source['zh_text']
  }
end
glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
terms.each do |entity, values|
  glossary.find { |entry| entry['entity_key'] == entity }['korean_variants'] = (values[2] - [values[1]]).join('|')
end
m.write_table(glossary_path, glossary.headers, glossary)
m.write_table(File.join(__dir__, 'proper-name-reviewed-didenhil-emaire-continuation.tsv'), m::HEADERS, reviews)
puts "#{reviews.length} unique keys; #{selected.length} entity matches; #{reviews.group_by { |r| r['status'] }.transform_values(&:length).inspect}"
