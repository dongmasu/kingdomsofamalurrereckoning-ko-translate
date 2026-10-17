#!/usr/bin/env ruby

require 'csv'
require 'digest'
require 'json'
require 'set'

ROOT = File.expand_path('../../..', __dir__)
AUDIT = File.join(ROOT, 'work/zh_cn/audit')
INVENTORY_PATH = '/private/tmp/proper-name-source-inventory.tsv'
GLOSSARY_PATH = File.join(AUDIT, 'proper-name-glossary.tsv')
OCCURRENCES_PATH = File.join(AUDIT, 'proper-name-occurrences.tsv')

CSV_HASHES = {
  'affix' => 'a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586',
  'base' => '07d2a2f469521ea7798aec83edadd94a84c6703418b789841dd699fdf2fc0136',
  'default' => 'b2e0d95632c82982e585470e23820f70eb23074a106f5f99b8354d4241fd0446'
}.freeze

GLOSSARY_HEADERS = %w[
  entity_key english_canonical category korean_canonical english_aliases
  korean_variants evidence_ids status notes
].freeze
OCCURRENCE_HEADERS = %w[
  entity_key resource ID_Linha Tipo_Variante matched_english english_source
  korean_current status evidence
].freeze
REVIEW_HEADERS = %w[
  resource ID_Linha Tipo_Variante entity_key status old new evidence english
  japanese chinese entity_dispositions_json previous_status previous_evidence
].freeze

DEFINITIONS = [
  {
    'entity_key' => 'faction:great-house-abergawein',
    'english_canonical' => 'Great House Abergawein',
    'category' => 'faction',
    'korean_canonical' => '아베르가웨인 대가문(Great House Abergawein)',
    'english_aliases' => '',
    'korean_variants' => '대가문 아베르가웨인',
    'evidence_ids' => 'D-21268|base:4236:11',
    'status' => 'confirmed',
    'notes' => 'English identifies a named noble Great House; Japanese 有力一族・アバーガウェイン and Chinese 高等阿贝加文家族 corroborate the family/faction reading. Pair the complete compound at base:4236. The official Korean manual gives general faction context but no Abergawein entry. Do not add Great House - Abergawein as an alias or re-open default:36549, which D-19840 already closed.'
  },
  {
    'entity_key' => 'place:abergawein-residence',
    'english_canonical' => 'Abergawein Residence',
    'category' => 'place',
    'korean_canonical' => '아베르가웨인 거주지(Abergawein Residence)',
    'english_aliases' => '',
    'korean_variants' => '아버게인 저택',
    'evidence_ids' => 'D-21268|default:13598',
    'status' => 'confirmed',
    'notes' => 'English names the residence; Japanese アバーガウェイン居住地 and Chinese 阿贝加文居所 support the neutral 거주지 rather than the narrower 저택. Reuse the source-supported Abergawein spelling while keeping this place distinct from faction:great-house-abergawein. Resolves the prior default:13598 uncertainty in D-4036.'
  }
].freeze

TARGETS = [
  {
    'resource' => 'base',
    'ID_Linha' => '4236',
    'Tipo_Variante' => '11',
    'entity_key' => 'faction:great-house-abergawein',
    'old' => '대가문 아베르가웨인(Abergawein)',
    'new' => '아베르가웨인 대가문(Great House Abergawein)',
    'evidence' => 'English names the Great House Abergawein as a noble family. Japanese 有力一族・アバーガウェイン and Chinese 高等阿贝加文家族 corroborate the faction/family identity. Pair the entire source compound and reuse its Korean name form in the separately scoped Residence label. The official Korean manual has no direct Abergawein entry.'
  },
  {
    'resource' => 'default',
    'ID_Linha' => '13598',
    'Tipo_Variante' => '',
    'entity_key' => 'place:abergawein-residence',
    'old' => '아버게인 저택',
    'new' => '아베르가웨인 거주지(Abergawein Residence)',
    'evidence' => 'English names Abergawein Residence; Japanese アバーガウェイン居住地 and Chinese 阿贝加文居所 support a residence without establishing a mansion. Correct the unsupported 저택 narrowing, standardize the proper-name spelling to 아베르가웨인, and pair the complete place label. Resolves D-4036 for this exact uncertain key.'
  }
].freeze

def read_tsv(path)
  CSV.read(path, headers: true, col_sep: "\t", encoding: 'bom|utf-8')
end

def write_tsv(path, headers, rows)
  temp = "#{path}.D21268.tmp"
  CSV.open(temp, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
    csv << headers
    rows.each { |row| csv << headers.map { |header| row[header] } }
  end
  File.rename(temp, path)
end

def source_row(inventory, resource, id, variant)
  inventory.find do |row|
    row['resource'] == resource && row['ID_Linha'] == id &&
      row['Tipo_Variante'].to_s == variant
  end || raise("missing aligned source key #{resource}:#{id}:#{variant}")
end

CSV_HASHES.each do |resource, expected|
  path = File.join(ROOT, "work/zh_cn/locatexts_zh_cn.koalocatext_#{resource}.csv")
  actual = Digest::SHA256.file(path).hexdigest
  raise "#{resource} hash changed: #{actual}" unless actual == expected
end

inventory = read_tsv(INVENTORY_PATH)
glossary_table = read_tsv(GLOSSARY_PATH)
occurrence_table = read_tsv(OCCURRENCES_PATH)
raise 'unexpected glossary schema' unless glossary_table.headers == GLOSSARY_HEADERS
raise 'unexpected occurrence schema' unless occurrence_table.headers == OCCURRENCE_HEADERS
glossary = glossary_table.map(&:to_h)
occurrences = occurrence_table.map(&:to_h)

existing_entities = glossary.map { |row| row['entity_key'] }.to_set
raise 'D-21268 entity already exists' if
  DEFINITIONS.any? { |definition| existing_entities.include?(definition['entity_key']) }
glossary_rows = glossary.map(&:to_h) + DEFINITIONS

existing_pairs = occurrences.map do |row|
  [row['entity_key'], row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s]
end.to_set
review_rows = TARGETS.map do |target|
  row = source_row(inventory, target['resource'], target['ID_Linha'], target['Tipo_Variante'])
  pair = [target['entity_key'], target['resource'], target['ID_Linha'], target['Tipo_Variante']]
  raise "occurrence already exists: #{pair.inspect}" if existing_pairs.include?(pair)
  raise "active text changed for #{pair.inspect}" unless row['work_text'] == target['old']

  english = JSON.parse(row.fetch('en_texts_json')).compact.join("\n---\n")
  japanese = JSON.parse(row.fetch('ja_texts_json')).compact.join("\n---\n")
  occurrence_evidence = "D-21268 candidate: #{target['evidence']}"
  occurrences << {
    'entity_key' => target['entity_key'],
    'resource' => target['resource'],
    'ID_Linha' => target['ID_Linha'],
    'Tipo_Variante' => target['Tipo_Variante'],
    'matched_english' => DEFINITIONS.find { |definition| definition['entity_key'] == target['entity_key'] }.fetch('english_canonical'),
    'english_source' => english,
    'korean_current' => row['work_text'],
    'status' => 'needs-context',
    'evidence' => 'Candidate hit from the English source; verify this occurrence in context.'
  }
  {
    'resource' => target['resource'],
    'ID_Linha' => target['ID_Linha'],
    'Tipo_Variante' => target['Tipo_Variante'],
    'entity_key' => target['entity_key'],
    'status' => 'accepted',
    'old' => target['old'],
    'new' => target['new'],
    'evidence' => target['evidence'],
    'english' => english,
    'japanese' => japanese,
    'chinese' => row['zh_text'],
    'entity_dispositions_json' => JSON.generate(target['entity_key'] => 'accepted'),
    'previous_status' => '',
    'previous_evidence' => ''
  }
end

resource_order = %w[affix base default]
occurrences.sort_by! do |row|
  [resource_order.index(row['resource']), row['ID_Linha'].to_i,
   row['Tipo_Variante'].to_s, row['entity_key']]
end
write_tsv(GLOSSARY_PATH, GLOSSARY_HEADERS, glossary_rows)
write_tsv(OCCURRENCES_PATH, OCCURRENCE_HEADERS, occurrences)

definitions_path = File.join(AUDIT, 'proper-name-discovery-definitions-D21268.tsv')
write_tsv(definitions_path, GLOSSARY_HEADERS, DEFINITIONS)
review_path = '/private/tmp/proper-name-review-D21268.tsv'
write_tsv(review_path, REVIEW_HEADERS, review_rows)

puts "Registered #{DEFINITIONS.length} scoped definitions and #{review_rows.length} pending occurrence keys."
puts "Review proposal: #{review_path}"
