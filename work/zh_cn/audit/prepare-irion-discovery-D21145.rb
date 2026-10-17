#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
d = 21_145
entity = 'person:irion'
glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
raise 'Irion is already registered' if glossary.any? { |row| row['entity_key'] == entity }

definition = glossary.headers.zip([
  entity,
  'Irion',
  'person',
  '이리온(Irion)',
  '',
  '',
  'D-21145|D-21146|base:4723|default:147|default:919|default:8706|default:13945|default:61750',
  'confirmed',
  'English identifies Irion as a Moon Camp leader and the King of Cups. Japanese イリオン and Chinese 艾利安 corroborate the identity where explicit. Use 이리온(Irion) for unpaired Korean first-name mentions; preserve complete Irion Tal labels, translated titles, particles, and surrounding wording. Do not reopen or recount the separate person:tal dispositions from D-20383 and D-20543-D-20555.'
]).to_h

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
raise "unexpected Irion source-match count: #{generated.length}" unless generated.length == 93
raise 'Irion matches are not unique base/default rows' unless
  generated.all? { |row| %w[base default].include?(row['resource']) } &&
  generated.map { |row| m.key(row) }.uniq.length == 93

reviewed = generated.sort_by do |row|
  [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i]
end.map do |match|
  key = m.key(match)
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
  chinese = source.fetch('zh_text')
  old = source.fetch('work_text')

  raise "English source lacks Irion at #{key.inspect}" unless english.match?(/\bIrion\b/)
  raise "missing aligned source at #{key.inspect}" if [japanese, chinese].any?(&:empty?)

  new_text = old.gsub(/이리온(?:\s+탈)?(?:\s*\(Irion[^)]*\))?/) do |match_text|
    next match_text if match_text.include?('(Irion')

    if match_text.end_with?(' 탈') && english.match?(/\bIrion Tal\b/)
      "#{match_text}(Irion Tal)"
    elsif match_text.end_with?(' 탈')
      "#{match_text.sub(/ 탈\z/, '')}(Irion) 탈"
    else
      "#{match_text}(Irion)"
    end
  end

  status = new_text == old ? 'not-an-issue' : 'accepted'
  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => entity,
    'status' => status,
    'old' => old,
    'new' => new_text,
    'evidence' => 'English identifies the Moon Camp leader Irion; aligned Japanese and Chinese source cells were checked for scene and name support. Add 이리온(Irion) only to unpaired Korean name spans. Preserve complete Irion Tal labels, translated King of Cups titles, particles, punctuation, line breaks, tokens, and surrounding text. Do not reopen or recount prior person:tal decisions. If Korean omits the name, retain the existing translation.',
    'english' => english,
    'japanese' => japanese,
    'chinese' => chinese,
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end

raise 'unexpected edit count' unless reviewed.count { |row| row['old'] != row['new'] } == 41
raise 'unexpected retained count' unless reviewed.count { |row| row['old'] == row['new'] } == 52

definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{d}.tsv")
reviews_path = File.join(__dir__, "proper-name-discovery-D#{d}-D#{d + 1}.tsv")
raise 'Irion discovery artifacts already exist' if [definitions_path, reviews_path].any? { |path| File.exist?(path) }

m.write_table(definitions_path, glossary.headers, [definition])
m.write_table(reviews_path, m::HEADERS.take(12), reviewed)
puts "D-#{d}-D-#{d + 1}: #{reviewed.length} rows; " \
     "#{reviewed.count { |row| row['old'] != row['new'] }} edits; " \
     "#{reviewed.count { |row| row['old'] == row['new'] }} retained; " \
     "slices=#{reviewed.each_slice(50).map(&:length).join('+')}"
