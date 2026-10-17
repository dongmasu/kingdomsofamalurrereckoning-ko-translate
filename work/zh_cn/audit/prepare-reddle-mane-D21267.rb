#!/usr/bin/env ruby

require 'csv'
require 'json'

ROOT = File.expand_path('../../..', __dir__)
AUDIT = __dir__
RESOURCES = %w[base default].freeze
LOCALES = %w[en_us ja_jp zh_cn].freeze
ENTITY = 'person:reddle-mane'
CANONICAL = '레들 메인(Reddle Mane)'
EVIDENCE = <<~TEXT.strip
  English identifies Reddle Mane as the individual leading the humans and
  Alfar in Adessa and managing the Hospitalis Quarters. Japanese レドル・メイン
  and Chinese 瑞德尔·迈恩 corroborate the personal name. Reuse the consistent
  Korean form 레들 메인(Reddle Mane). Preserve source-local roles and
  relationships; the metonymic references at default:36838 and default:38329
  do not establish a separate faction or organization.
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

reviews = RESOURCES.flat_map do |resource|
  source.fetch(['en_us', resource]).each_with_object([]) do |(row_key, row), found|
    next unless row['Texto'].to_s.match?(/(?<![A-Za-z])Reddle Mane(?![A-Za-z])/i)

    refs = LOCALES.to_h do |locale|
      [locale, source.fetch([locale, resource]).fetch(row_key).fetch('Texto')]
    end
    current = work.fetch(resource).fetch(row_key).fetch('Texto')
    raise "noncanonical Korean name at #{resource}:#{row_key.join(':')}" unless
      current.include?(CANONICAL)

    found << {
      'resource' => resource,
      'ID_Linha' => row_key[0],
      'Tipo_Variante' => row_key[1],
      'entity_key' => ENTITY,
      'status' => 'not-an-issue',
      'old' => current,
      'new' => current,
      'evidence' => EVIDENCE,
      'english' => refs.fetch('en_us'),
      'japanese' => refs.fetch('ja_jp'),
      'chinese' => refs.fetch('zh_cn'),
      'entity_dispositions_json' => JSON.generate(ENTITY => 'not-an-issue')
    }
  end
end

reviews.sort_by! do |row|
  [RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i, row.fetch('Tipo_Variante')]
end
raise "expected 20 distinct source keys, got #{reviews.length}" unless reviews.length == 20
raise 'duplicate source row key' unless reviews.map { |row| [row['resource'], row['ID_Linha'], row['Tipo_Variante']] }.uniq.length == reviews.length
raise 'incomplete trilingual source coverage' unless reviews.all? do |row|
  %w[english japanese chinese].all? { |field| !row.fetch(field).to_s.empty? }
end

entity_ids = reviews.map { |row| "#{row['resource']}:#{row['ID_Linha']}" }
definition = {
  'entity_key' => ENTITY,
  'english_canonical' => 'Reddle Mane',
  'category' => 'person',
  'korean_canonical' => CANONICAL,
  'english_aliases' => '',
  'korean_variants' => '',
  'evidence_ids' => (['D-21267'] + entity_ids).join('|'),
  'status' => 'confirmed',
  'notes' => 'English identifies the individual as an unofficial leader in Adessa who manages the Hospitalis Quarters. Japanese レドル・メイン and Chinese 瑞德尔·迈恩 corroborate the name. Reuse 레들 메인(Reddle Mane). The metonymic references to his followers and petition board do not establish a separate faction or organization; the official Korean manual has no direct entry for this NPC.'
}

write_tsv(
  File.join(AUDIT, 'proper-name-discovery-D21267.tsv'),
  definition.keys,
  [definition]
)
write_tsv(
  File.join(AUDIT, 'proper-name-reviewed-D21267.tsv'),
  reviews.first.keys,
  reviews
)
puts "Prepared #{reviews.length} keys; all current Korean labels are already canonical."
