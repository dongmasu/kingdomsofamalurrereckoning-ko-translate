#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

M = ReviewedProperNameDiscovery::M
AUDIT = File.dirname(__FILE__)
CANDIDATES = File.join(AUDIT, 'proper-name-candidates.tsv')
DEFINITIONS = File.join(AUDIT, 'proper-name-definitions-sidhe-D21297.tsv')
REVIEWS = File.join(AUDIT, 'proper-name-review-sidhe-D21297.tsv')

definition = {
  'entity_key' => 'lore:sidhe',
  'english_canonical' => 'Sidhe',
  'category' => 'lore term',
  'korean_canonical' => '시드(Sidhe)',
  'english_aliases' => '',
  'korean_variants' => '시데|시드헤|시드|시드들',
  'evidence_ids' => 'D-21297-D-21299|D-19793|D-19795|D-19896|default:18225',
  'status' => 'confirmed',
  'notes' => 'English default:18225 identifies the Sidhe as the living wood and heart of the Fae lands; the Architect passages at default:21446, 30351, 56251, 56878, 59459, and 9763 reinforce the named setting. Japanese シー corroborates the form and Chinese 仙境 supports the setting reading. The term can be used metonymically, so this glossary entry standardizes the lexical name without asserting that every occurrence denotes only a region, realm, or people. Use 시드(Sidhe), preserve surrounding syntax and complete compound labels, and exclude opaque variable-only hits. The official Korean manual has no Sidhe entry; no-hit is not treated as evidence. Earlier D-19793, D-19795, and D-19896 row decisions are retained and not recounted.'
}

def candidate_label(row)
  parts = [row.fetch('resource'), row.fetch('ID_Linha')]
  parts << row['Tipo_Variante'].to_s if row.fetch('resource') == 'base'
  parts.join(':')
end

def normalize_korean(text, key)
  return text.sub('시드들을 만나 보니 어때?', '시드(Sidhe)는 어때?') if key == ['default', '63419', '']
  return text.sub('시드 사람들만큼이나', '시드(Sidhe)만큼이나') if key == ['default', '44561', '']
  if key == ['default', '59459', '']
    text = text.sub('시드들을 빚어냈다', '시드(Sidhe)를 빚어냈다')
  end

  text = text.gsub(/시드헤(?:\s*\((?:The )?Sidhe\))?/, '시드(Sidhe)')
  text = text.gsub(/시데(?:\s*\((?:The )?Sidhe\))?/, '시드(Sidhe)')
  text = text.gsub(/시드\s*\((?:The )?Sidhe\)/, '시드(Sidhe)')
  text.gsub(/시드(?!\(Sidhe\))/, '시드(Sidhe)')
end

if File.exist?(DEFINITIONS)
  existing = M.table(DEFINITIONS)
  raise 'refusing to replace unrelated definition output' unless
    existing.length == 1 && existing.first['entity_key'] == 'lore:sidhe'
end
if File.exist?(REVIEWS)
  existing = M.table(REVIEWS)
  raise 'refusing to replace unrelated review output' unless
    existing.length == 127 && existing.all? { |row| row['entity_key'] == 'lore:sidhe' }
end

candidate = M.table(CANDIDATES).find { |row| row['candidate_key'] == 'candidate:sidhe' }
raise 'candidate:sidhe missing' unless candidate
candidate_keys = candidate.fetch('source_context_keys').split('|')
raise "expected 127 source context keys, got #{candidate_keys.length}" unless candidate_keys.length == 127
raise 'duplicate source context key' unless candidate_keys.uniq.length == candidate_keys.length

inventory = M.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
generated_by_key = generated.to_h { |row| [M.key(row), row] }
generated_labels = generated.map { |row| candidate_label(row) }
raise 'candidate/source matcher coverage differs' unless generated_labels.sort == candidate_keys.sort
raise 'duplicate generated source key' unless generated_labels.uniq.length == generated_labels.length

ordered_reviews = candidate_keys.map do |label|
  parts = label.split(':')
  key = parts.length == 3 ? parts : [parts[0], parts[1], '']
  generated_row = generated_by_key.fetch(key)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  excluded = %w[default:12329 default:14836].include?(label)
  new_text = excluded ? old : normalize_korean(old, key)
  raise "no canonical label in #{label}" unless excluded || new_text.include?('시드(Sidhe)')

  status = if excluded
             'excluded'
           elsif old == new_text
             'not-an-issue'
           else
             'accepted'
           end
  row_evidence = case label
                 when 'default:12329', 'default:14836'
                   'The English matcher hit only the opaque $Sidhe_NQD.m_inn_cost$ variable; no visible Sidhe name occurs. Exclude this token from the lore:sidhe label scope and preserve it byte-for-byte.'
                 when 'default:63419'
                   'English asks how the speaker is finding the Sidhe; Japanese and Chinese also frame this as a place/experience question, not meeting Sidhe people. Replace the unsupported plural-person reading with the neutral question 시드(Sidhe)는 어때?'
                 when 'default:44561'
                   'English compares the fish with the Sidhe; aligned Japanese and Chinese support a setting comparison, not a named group of people. Remove the unsupported 사람들 referent while preserving the comparison.'
                 when 'default:59459'
                   'English says the Architect finished crafting the singular Sidhe; Japanese and Chinese also use a singular setting. Correct Korean 시드들을 to 시드(Sidhe)를 without changing the surrounding poem.'
                 else
                   'English anchors the named Sidhe term; aligned Japanese シー and Chinese 仙境 corroborate the setting/name. Standardize only its Korean lexical span to 시드(Sidhe), preserving the row wording, particles, placeholders, and line breaks. Where earlier D-19793, D-19795, or D-19896 decisions apply, retain them without recounting.'
                 end
  review = generated_row.merge(
    'status' => status,
    'old' => old,
    'new' => new_text,
    'evidence' => row_evidence,
    'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
    'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
    'chinese' => source.fetch('zh_text'),
    'entity_dispositions_json' => JSON.generate('lore:sidhe' => status),
    'previous_status' => '',
    'previous_evidence' => ''
  )
  review
end

ReviewedProperNameDiscovery.validate!(
  [definition], ordered_reviews, generated,
  M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).map(&:to_h),
  M.table(M::INDEX).map(&:to_h)
)
ReviewedProperNameDiscovery.validate_sources!(ordered_reviews, inventory)
ordered_reviews.group_by { |row| row.fetch('resource') }.each do |resource, rows|
  targets = rows.select { |row| row['old'] != row['new'] }
  next if targets.empty?

  ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), targets)
end

M.write_table(DEFINITIONS, M.table(File.join(AUDIT, 'proper-name-glossary.tsv')).headers, [definition])
M.write_table(REVIEWS, M::HEADERS, ordered_reviews)
puts "PASS lore:sidhe: #{generated.length} exact source matches; #{ordered_reviews.count { |row| row['status'] == 'accepted' }} edits; #{ordered_reviews.count { |row| row['status'] == 'not-an-issue' }} unchanged; #{ordered_reviews.count { |row| row['status'] == 'excluded' }} opaque-token exclusions."
puts "Wrote #{DEFINITIONS} and #{REVIEWS}"
