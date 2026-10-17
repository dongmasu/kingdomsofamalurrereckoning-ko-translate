#!/usr/bin/env ruby

require 'csv'
require 'json'

ROOT = File.expand_path('../../..', __dir__)
AUDIT = __dir__
RESOURCES = %w[base default].freeze
LOCALES = %w[en_us ja_jp zh_cn].freeze
ENTITY = 'place:madding-wind'
CANONICAL = '매딩 윈드(Madding Wind)'
PRISON = '매딩 윈드 감옥(Madding Wind Prison)'
EVIDENCE = <<~TEXT.strip
  English identifies Madding Wind as the named ruin/prison and distinguishes
  the standalone title Madding Wind Prison from sentence-level references to
  a Madding Wind prison. Japanese マディング・ウィンド
  corroborates the established Korean transliteration; Chinese 狂风牢 supports
  the prison/place context. Standardize the place as 매딩 윈드(Madding Wind),
  the standalone title as 매딩 윈드 감옥(Madding Wind Prison), and generic
  sentence-level prison references as 매딩 윈드(Madding Wind) 감옥.
  Preserve each row's item, facility, dialogue, and grammatical context.
TEXT

def read_csv(path)
  CSV.read(path, headers: true, col_sep: ';', encoding: 'bom|utf-8')
end

def write_tsv(path, headers, rows)
  CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
    csv << headers
    rows.each { |row| csv << headers.map { |header| row[header] } }
  end
end

def key(row)
  [row['ID_Linha'], row['Tipo_Variante'].to_s]
end

source = {}
LOCALES.each do |locale|
  RESOURCES.each do |resource|
    path = File.join(ROOT, 'src/csv', locale, "locatexts_#{locale}.koalocatext_#{resource}.csv")
    source[[locale, resource]] = read_csv(path).to_h { |row| [key(row), row] }
  end
end

work = RESOURCES.to_h do |resource|
  path = File.join(ROOT, 'work/zh_cn', "locatexts_zh_cn.koalocatext_#{resource}.csv")
  [resource, read_csv(path).to_h { |row| [key(row), row] }]
end

matches = RESOURCES.flat_map do |resource|
  source.fetch(['en_us', resource]).each_with_object([]) do |(row_key, row), found|
    next unless row['Texto'].to_s.match?(/Madding Wind/i)

    refs = LOCALES.to_h do |locale|
      [locale, source.fetch([locale, resource]).fetch(row_key).fetch('Texto')]
    end
    current = work.fetch(resource).fetch(row_key).fetch('Texto')
    proposed = current.dup

    if row['Texto'].include?('Madding Wind Prison')
      proposed.gsub!(
        /광풍 감옥\(Madding Wind Prison\)|매딩 윈드(?:\(Madding Wind\))? (?:감옥|교도소)(?:\(Madding Wind Prison\))?/,
        PRISON
      )
    elsif row['Texto'].match?(/Madding Wind prison/)
      proposed.gsub!(
        /매딩 윈드(?:\(Madding Wind\))? (?:감옥|교도소)(?:\(Madding Wind Prison\))?/,
        "#{CANONICAL} 감옥"
      )
    end
    proposed.gsub!('광기의 바람', '매딩 윈드')
    proposed.gsub!(/매딩 윈드(?!\(Madding Wind\)| 감옥\(Madding Wind Prison\))/, CANONICAL)

    status = proposed == current ? 'not-an-issue' : 'accepted'
    found << {
      'resource' => resource,
      'ID_Linha' => row_key[0],
      'Tipo_Variante' => row_key[1],
      'entity_key' => ENTITY,
      'status' => status,
      'old' => current,
      'new' => proposed,
      'evidence' => EVIDENCE,
      'english' => refs.fetch('en_us'),
      'japanese' => refs.fetch('ja_jp'),
      'chinese' => refs.fetch('zh_cn'),
      'entity_dispositions_json' => JSON.generate(ENTITY => status)
    }
  end
end

matches.sort_by! do |row|
  [RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i, row.fetch('Tipo_Variante')]
end
raise "expected 46 distinct source keys, got #{matches.length}" unless matches.length == 46
raise 'duplicate source row key' unless matches.map { |row| [row['resource'], row['ID_Linha'], row['Tipo_Variante']] }.uniq.length == matches.length
raise 'incomplete trilingual source coverage' unless matches.all? do |row|
  %w[english japanese chinese].all? { |field| !row.fetch(field).to_s.empty? }
end
raise 'unresolved Korean Madding Wind form in reviewed scope' if matches.any? do |row|
  row.fetch('new').match?(/광기의 바람|광풍 감옥|매딩 윈드(?!\(Madding Wind\)| 감옥\(Madding Wind Prison\)|\(Madding Wind\) 감옥)/)
end

entity_ids = matches.map { |row| "#{row['resource']}:#{row['ID_Linha']}" }
definition = {
  'entity_key' => ENTITY,
  'english_canonical' => 'Madding Wind',
  'category' => 'place',
  'korean_canonical' => CANONICAL,
  'english_aliases' => '',
  'korean_variants' => '매딩 윈드|광기의 바람|광풍 감옥|매딩 윈드 교도소|매딩 윈드 감옥',
  'evidence_ids' => (['D-21266'] + entity_ids).join('|'),
  'status' => 'confirmed',
  'notes' => 'Named ruin/prison. Use 매딩 윈드(Madding Wind) for the place name. Only the standalone English title Madding Wind Prison is rendered 매딩 윈드 감옥(Madding Wind Prison); sentence-level lower-case prison references use 매딩 윈드(Madding Wind) 감옥. Japanese transliteration and Chinese prison-name rendering corroborate the referent. Official Korean manual search found no direct Madding Wind entry.'
}

write_tsv(
  File.join(AUDIT, 'proper-name-discovery-D21266.tsv'),
  definition.keys,
  [definition]
)
write_tsv(
  File.join(AUDIT, 'proper-name-reviewed-D21266.tsv'),
  matches.first.keys,
  matches
)
puts "Prepared #{matches.length} keys: #{matches.group_by { |row| row['status'] }.transform_values(&:length)}"
