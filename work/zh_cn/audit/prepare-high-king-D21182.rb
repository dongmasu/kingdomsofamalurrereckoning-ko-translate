#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

m = ReviewedNameBatches
ReviewedProperNameDiscovery.ensure_unused_batch!(21_182)

glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
definitions = [
  [
    'title:high-king', 'High King', 'title', '지고왕(High King)', '',
    '대왕|최고왕|고왕|하이 킹|하이킹|왕중왕|지고왕',
    'D-21182|default:35|default:23978|default:46085',
    'confirmed',
    'Formal Fae royal title used for multiple holders, including Titarion and Mathon. English is primary; Japanese 至高王 and Chinese 至高王/大君 corroborate the role. Standardize Korean title wording as 지고왕 and keep personal-name compounds atomic, such as 지고왕 티타리온(High King Titarion). This entry does not merge the office with any ruler as a person.'
  ],
  [
    'person:mathon', 'Mathon', 'person', '마톤(Mathon)', '',
    '마손|마톤',
    'D-21182|default:12253|default:16018|default:26705|default:26955',
    'confirmed',
    'English identifies Mathon as the former Winter Court ruler and as the holder of the crown later taken by Gadflow. Japanese マトン and Chinese 玛颂 corroborate the name. Standardize Korean variants 마손/마톤 as 마톤(Mathon); keep Mathon distinct from the High King title and from Mathon’s Court as an institution.'
  ]
].map { |values| glossary.headers.zip(values).to_h }

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, definitions).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
counts = generated.group_by { |row| row.fetch('entity_key') }
  .transform_values(&:length)
raise "unexpected source coverage: #{counts.inspect}" unless
  counts == { 'title:high-king' => 103, 'person:mathon' => 6 }

def canonicalize_high_king(text, english)
  result = text.dup

  if english.match?(/(?<![A-Za-z])High King Titarion(?![A-Za-z])/i)
    result.gsub!(
      /(?:(?:티타리온\s+(?:대왕|최고왕|고왕|하이\s*킹))|(?:(?:대왕|최고왕|고왕|하이\s*킹|지고왕)\s+티타리온))(?:\s*\((?:High King Titarion|Titarion)\))?/i,
      '지고왕 티타리온(High King Titarion)'
    )
  end
  if english.match?(/(?<![A-Za-z])High King Mathon(?![A-Za-z])/i)
    result.gsub!(
      /(?:(?:(?:대왕|최고왕|고왕|하이\s*킹|지고왕)\s+(?:마손|마톤))|(?:(?:마손|마톤)\s+(?:대왕|최고왕|고왕|하이\s*킹)))(?:\s*\((?:High King Mathon|Mathon)\))?/i
    ) do
      "지고왕 마톤(High King Mathon)"
    end
  end

  result.gsub!(
    /(?<![가-힣])(?:하이\s*킹|최고왕|대왕|고왕|왕중왕|지고왕)(?!국)(?<label>\s*\((?:High King(?:\s+(?:Titarion|Mathon))?|Titarion|Mathon)\))?(?!\s+(?:티타리온|마톤)\s*\(High King\s+(?:Titarion|Mathon)\))/i
  ) do
    "지고왕#{Regexp.last_match[:label] || '(High King)'}"
  end
  result
end

def canonicalize_mathon(text, english)
  return text unless english.match?(/(?<![A-Za-z])Mathon(?![A-Za-z])/i)

  result = text.dup
  result.gsub!(
    /(?<![가-힣])마손\s*\((?:Mathon|High King Mathon)\)/,
    '마톤(Mathon)'
  )
  result.gsub!(
    /(?<![가-힣])마손/,
    '마톤'
  )
  result.gsub!(
    /(?<![가-힣])마톤(?!\s*\((?:Mathon|High King Mathon|Mathon's Court)\))(?!\s+궁정\s*\(Mathon's Court\))/,
    '마톤(Mathon)'
  )
  result
end

raise 'kingdom regression' unless
  canonicalize_high_king('여름 대왕국. 새로 즉위한 대왕은', 'High King') ==
    '여름 대왕국. 새로 즉위한 지고왕(High King)은'
raise 'atomic title regression' unless
  canonicalize_high_king('티타리온 대왕(High King Titarion)', 'High King Titarion') ==
    '지고왕 티타리온(High King Titarion)'
raise 'Mathon particle regression' unless
  canonicalize_mathon('마톤의 머리와 마손(Mathon)은', 'Mathon') ==
    '마톤(Mathon)의 머리와 마톤(Mathon)은'
raise 'Mathon court regression' unless
  canonicalize_mathon("마톤 궁정(Mathon's Court)", "Mathon's Court") ==
    "마톤 궁정(Mathon's Court)"

reviews = generated.group_by { |row| m.key(row) }.map do |key, matches|
  source = inventory.fetch(key)
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
  chinese = source.fetch('zh_text')
  old = source.fetch('work_text')
  after_title = canonicalize_high_king(old, english)
  new_text = canonicalize_mathon(after_title, english)

  dispositions = matches.to_h do |match|
    entity = match.fetch('entity_key')
    changed = case entity
              when 'title:high-king'
                after_title != old
              when 'person:mathon'
                new_text != after_title ||
                  (old.match?(/마손|마톤(?!\s*\((?:Mathon|High King Mathon|Mathon's Court)\))(?!\s+궁정\s*\(Mathon's Court\))/) &&
                   new_text != old)
              else
                raise "unexpected entity #{entity}"
              end
    status = changed ? 'accepted' : 'not-an-issue'
    [entity, status]
  end

  {
    'resource' => key[0],
    'ID_Linha' => key[1],
    'Tipo_Variante' => key[2],
    'entity_key' => matches.map { |row| row.fetch('entity_key') }.uniq.sort.join('|'),
    'status' => dispositions.value?('accepted') ? 'accepted' : 'not-an-issue',
    'old' => old,
    'new' => new_text,
    'evidence' => matches.map do |row|
      row.fetch('entity_key') == 'title:high-king' ?
        'High King: ' + 'The aligned English text identifies a formal Fae royal title; Japanese 至高王 and Chinese royal-title wording corroborate. Canonical Korean: 지고왕(High King).' :
        'Mathon: English identifies the person; Japanese マトン and Chinese 玛颂 corroborate. Canonical Korean: 마톤(Mathon).'
    end.uniq.join(' '),
    'english' => english,
    'japanese' => japanese,
    'chinese' => chinese,
    'entity_dispositions_json' => JSON.generate(dispositions)
  }
end.sort_by do |row|
  [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']]
end

raise "expected 107 distinct source rows, got #{reviews.length}" unless reviews.length == 107
raise 'more than 50 row keys in a generated slice' if reviews.each_slice(50).any? { |slice| slice.length > 50 }
raise 'line breaks changed' unless reviews.all? do |row|
  row['old'].scan(/\r\n|\r|\n/) == row['new'].scan(/\r\n|\r|\n/)
end

definitions_path = File.join(__dir__, 'proper-name-discovery-definitions-D21182.tsv')
reviews_path = File.join(__dir__, 'proper-name-discovery-D21182.tsv')
raise 'preparation output already exists' if
  [definitions_path, reviews_path].any? { |path| File.exist?(path) } &&
  ARGV != ['--replace-draft']
m.write_table(definitions_path, glossary.headers, definitions)
m.write_table(reviews_path, m::HEADERS.take(12), reviews)

puts "D-21182 preparation: #{reviews.length} distinct row keys; #{counts.inspect}"
puts "Disposition: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
reviews.select { |row| row['old'] != row['new'] }.each do |row|
  puts "#{row['resource']}:#{row['ID_Linha']}: #{row['old'].inspect} -> #{row['new'].inspect}"
end
