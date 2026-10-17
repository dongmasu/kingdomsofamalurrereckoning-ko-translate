#!/usr/bin/env ruby

require 'json'
require_relative 'build-proper-name-occurrences'
require_relative 'continue-proper-name-reviewed-batches'

audit = __dir__
definitions_path = File.join(audit, 'proper-name-discovery-definitions-D21118.tsv')
reviews_path = File.join(audit, 'proper-name-discovery-D21118.tsv')
raise 'D-21118 discovery artifacts already exist' if
  [definitions_path, reviews_path].any? { |path| File.exist?(path) }

definitions = [
  {
    'entity_key' => 'faction:house-ansilla',
    'english_canonical' => 'House Ansilla',
    'category' => 'faction',
    'korean_canonical' => '안실라 가문(House Ansilla)',
    'english_aliases' => 'House of Ansilla',
    'korean_variants' => '앤실라 가문|안실라(Ansilla) 가문|안실라 왕가',
    'status' => 'confirmed',
    'notes' => 'Alfar royal/noble family line. English identifies the same House across standalone labels, household references, and historical descriptions; Japanese アンシラ家 and Chinese 安西拉家族 corroborate the family reading. Keep distinct from Lady/Captain Ansilla, individual Ansilla surnames, and Castle Ansilla. Use 안실라 가문(House Ansilla), preserving 왕가 when English explicitly identifies the royal House.'
  },
  {
    'entity_key' => 'faction:house-gastyr',
    'english_canonical' => 'House Gastyr',
    'category' => 'faction',
    'korean_canonical' => '가스티르 가문(House Gastyr)',
    'english_aliases' => 'House of Gastyr',
    'korean_variants' => '개스티르 가문|가스티르 가문',
    'status' => 'confirmed',
    'notes' => 'Alfar noble family line and Hillared Gastyr’s House. English directly identifies the family; Japanese ガスティア家 and Chinese 加斯提尔家族 corroborate the family reading. Keep distinct from Hillared Gastyr and Castle Gastyr. Use 가스티르 가문(House Gastyr).'
  }
].freeze

changes = {
  ['faction:house-ansilla', '2707'] => ['안실라(Ansilla) 가문', '안실라 가문(House Ansilla)'],
  ['faction:house-ansilla', '4726'] => ['안실라(Ansilla) 가문', '안실라 가문(House Ansilla)'],
  ['faction:house-ansilla', '8110'] => ['안실라 가문의', '안실라 가문(House Ansilla)의'],
  ['faction:house-ansilla', '17524'] => ['안실라 가문', '안실라 가문(House Ansilla)'],
  ['faction:house-ansilla', '25409'] => ['안실라 가문', '안실라 가문(House Ansilla)'],
  ['faction:house-ansilla', '26015'] => ['안실라 가문의', '안실라 가문(House Ansilla)의'],
  ['faction:house-ansilla', '29702'] => ['앤실라 가문', '안실라 가문(House Ansilla)'],
  ['faction:house-ansilla', '30819'] => ['안실라 가문', '안실라 가문(House Ansilla)'],
  ['faction:house-ansilla', '35294'] => ['안실라 가문', '안실라 가문(House Ansilla)'],
  ['faction:house-ansilla', '45880'] => ['안실라 가문의', '안실라 가문(House Ansilla)의'],
  ['faction:house-ansilla', '48426'] => ['안실라 가문의', '안실라 가문(House Ansilla)의'],
  ['faction:house-ansilla', '61590'] => ['안실라 왕가(House of Ansilla)', '안실라 왕가(House Ansilla)'],
  ['faction:house-gastyr', '25951'] => ['개스티르 가문의', '가스티르 가문(House Gastyr)의'],
  ['faction:house-gastyr', '37810'] => ['가스티르 가문의', '가스티르 가문(House Gastyr)의'],
  ['faction:house-gastyr', '58586'] => ['가스티르 가문의', '가스티르 가문(House Gastyr)의'],
  ['faction:house-gastyr', '59603'] => ['개스티르 가문을', '가스티르 가문(House Gastyr)을']
}.freeze

inventory_rows = ReviewedNameBatches.table(ReviewedNameBatches::INVENTORY).map(&:to_h)
inventory = inventory_rows.to_h { |row| [ReviewedNameBatches.key(row), row] }
generated = build_occurrences(inventory_rows, definitions)
expected = {
  'faction:house-ansilla' => %w[2707 4726 8110 8290 17524 25409 26015 27546 29187 29702 30819 35294 45880 48426 52414 61590 61795],
  'faction:house-gastyr' => %w[22808 25951 37810 58586 59603]
}
actual = generated.group_by { |row| row[0] }.transform_values do |rows|
  rows.map { |row| row[2] }.sort_by(&:to_i)
end
raise "Unexpected discovery keys: #{actual.inspect}" unless actual == expected
raise 'Change map does not match reviewed source hits' unless
  changes.keys.sort == generated.select { |row| changes.key?([row[0], row[2]]) }
                                .map { |row| [row[0], row[2]] }.uniq.sort

reviews = generated.map do |entity, resource, id, variant, _matched, _english_source, korean, _status, _candidate_evidence|
  before_after = changes[[entity, id]]
  updated = korean.dup
  if before_after
    old_span, new_span = before_after
    raise "Expected one exact span at #{resource}:#{id}" unless updated.scan(old_span).length == 1
    updated.sub!(old_span, new_span)
  end
  status = updated == korean ? 'not-an-issue' : 'accepted'
  source = inventory.fetch([resource, id, variant])
  english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
  japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
  chinese = source.fetch('zh_text')
  raise "Missing aligned source evidence at #{resource}:#{id}" if [english, japanese, chinese].any?(&:empty?)
  rationale = if entity == 'faction:house-ansilla'
                'English identifies House Ansilla as the same Alfar family/royal line; aligned Japanese アンシラ家 and Chinese 安西拉家族 corroborate the family reading. Standardize the source-present House name as 안실라 가문(House Ansilla), retaining 왕가 where the row explicitly says royal House. Distinguish this family from Lady/Captain Ansilla, individual Ansilla surnames, and Castle Ansilla; do not alter those separate names.'
              else
                'English identifies House Gastyr as Hillared’s Alfar family line; aligned Japanese ガスティア家 and Chinese 加斯提尔家族 corroborate the family reading. Standardize the source-present House name as 가스티르 가문(House Gastyr), distinct from Hillared Gastyr and Castle Gastyr.'
              end
  rationale += ' Apply only to this exact source row; prior sequential dispositions and global tallies are not reopened or recounted.'
  {
    'resource' => resource,
    'ID_Linha' => id,
    'Tipo_Variante' => variant,
    'entity_key' => entity,
    'status' => status,
    'old' => korean,
    'new' => updated,
    'evidence' => rationale,
    'english' => english,
    'japanese' => japanese,
    'chinese' => chinese,
    'entity_dispositions_json' => JSON.generate(entity => status)
  }
end.sort_by { |row| [row['resource'], row['ID_Linha'].to_i, row['entity_key']] }

definitions.each do |definition|
  ids = reviews.select { |row| row['entity_key'] == definition['entity_key'] }
               .map { |row| "#{row['resource']}:#{row['ID_Linha']}" }
  definition['evidence_ids'] = (['D-21118'] + ids).join('|')
end

ReviewedNameBatches.write_table(definitions_path, definitions.first.keys, definitions)
ReviewedNameBatches.write_table(reviews_path, ReviewedNameBatches::HEADERS.take(12), reviews)
puts "Generated #{definitions.length} family definitions and #{reviews.length} exact-row reviews."
puts "Dispositions: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
