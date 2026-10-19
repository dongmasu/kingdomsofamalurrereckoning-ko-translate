#!/usr/bin/env ruby
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

glossary = ReviewedNameBatches.table(File.join(__dir__, 'proper-name-glossary.tsv'))
entities = glossary.to_h { |r| [r['entity_key'], r.to_h] }
inventory = ReviewedNameBatches.table(ReviewedNameBatches::INVENTORY)
index = ReviewedNameBatches.table(ReviewedNameBatches::INDEX)
contextual_maid_keys = %w[20978 20979 20980].flat_map do |d|
  path = File.join(__dir__, "proper-name-edits-D#{d}.tsv")
  raise "missing reviewed contextual Maid manifest: #{path}" unless File.file?(path)

  ReviewedNameBatches.table(path).map do |row|
    next unless row['entity_key'].to_s.split('|').include?('person:magwyr')
    evidence = [row['evidence'], row['previous_evidence']].compact.join(' ')
    next unless evidence.include?('contextual title reference') ||
      evidence.include?('This exact ID is allowlisted; no global Maid/The Maid alias is registered')

    ['person:magwyr', *ReviewedNameBatches.key(row)]
  end.compact
end.uniq
expected = build_occurrences(inventory, glossary.map(&:to_h))
expected_keys = expected.map { |r| r.values_at(0, 1, 2, 3) }.sort
actual_keys = index.map { |r| [r['entity_key'], *ReviewedNameBatches.key(r)] }.sort
absent = expected_keys - actual_keys
extras = actual_keys - expected_keys
documented_exclusions = [
  # D-21079 explicitly excludes the standalone title Phasmer's Curse from the
  # person's short-name alias, though the lexical matcher sees "Phasmer".
  ['person:phasmer-humm', 'default', '13525', '']
]
documented_missing = absent & documented_exclusions
undocumented_missing = absent - documented_exclusions
anwon_keys = %w[10747 27523 42674 49434 57733].map do |id|
  ['faction:house-anwon', 'default', id, '']
end
gwyn_manifest = File.join(__dir__, 'proper-name-edits-D21024.tsv')
contextual_gwyn_keys = if File.file?(gwyn_manifest)
                         ReviewedNameBatches.table(gwyn_manifest).map do |row|
                           next unless row['entity_key'] == 'person:gwyn-anwy' &&
                             row['evidence'].include?('row-scoped short form') &&
                             row['english'].match?(/(?<![A-Za-z])Gwyn(?![A-Za-z])/i) &&
                             !row['english'].match?(/\bGwyn Anwy\b/i)

                           ['person:gwyn-anwy', row['resource'], row['ID_Linha'],
                            row['Tipo_Variante'].to_s]
                         end.compact
                       else
                         []
                       end
contextual_sydanus_manifest = File.join(__dir__, 'proper-name-edits-D21054.tsv')
contextual_sydanus_keys = if File.file?(contextual_sydanus_manifest)
                            ReviewedNameBatches.table(contextual_sydanus_manifest).map do |row|
                              next unless row['entity_key'] == 'person:ciara-sydanus' &&
                                row['evidence'].include?('row-scoped short form') &&
                                row['english'].match?(/(?<![A-Za-z])Sydanus(?![A-Za-z])/i) &&
                                !row['english'].match?(/\bCiara Sydanus\b/i)

                              ['person:ciara-sydanus', row['resource'], row['ID_Linha'],
                               row['Tipo_Variante'].to_s]
                            end.compact
                          else
                            []
                          end
tine_manifest = File.join(__dir__, 'proper-name-edits-D21055.tsv')
contextual_tine_keys = if File.file?(tine_manifest)
                         ReviewedNameBatches.table(tine_manifest).map do |row|
                           next unless row['entity_key'] == 'person:tine-delfric' &&
                             row['evidence'].include?('row-scoped short form') &&
                             row['english'].match?(/(?<![A-Za-z])Tine(?![A-Za-z])/i) &&
                             !row['english'].match?(/\bTine Delfric\b/i)

                           ['person:tine-delfric', row['resource'], row['ID_Linha'],
                            row['Tipo_Variante'].to_s]
                         end.compact
                       else
                         []
                       end
oleyn_source_typo = ReviewedNameBatches.table(
  File.join(__dir__, 'proper-name-edits-D21023.tsv')
).select do |row|
  row['entity_key'] == 'person:oleyn' &&
    row['resource'] == 'default' &&
    row['ID_Linha'] == '27211' &&
    row['Tipo_Variante'].to_s.empty? &&
    row['status'] == 'accepted' &&
    row['english'].match?(/\Aleyn the Pure,/i) &&
    row['new'].include?('Oleyn the Pure')
end.map do |row|
  ['person:oleyn', row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s]
end
short_form_entities = {
  'faction:scholia-arcana' => 'Scholia',
  'place:shieldring-keep' => 'Shieldring'
}.freeze
short_form_manifest = File.join(__dir__, 'proper-name-edits-D21084.tsv')
contextual_short_form_rows = ReviewedNameBatches.table(short_form_manifest).each_with_object([]) do |row, result|
  term = short_form_entities[row['entity_key']]
  next unless term && row['english'].match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)

  result << [row['entity_key'], *ReviewedNameBatches.key(row), term]
end
contextual_short_form_keys = contextual_short_form_rows.map { |row| row.first(4) }
contextual_motus_rows = %w[21085 21086].flat_map do |d|
  path = File.join(__dir__, "proper-name-edits-D#{d}.tsv")
  next [] unless File.file?(path)

  ReviewedNameBatches.table(path).map do |row|
    next unless row['entity_key'] == 'organization:motus-mining' &&
      row['english'].match?(/(?<![A-Za-z])Motus(?![A-Za-z])/i) &&
      !row['english'].match?(/\bMotus Mining\b/i)

    [row['entity_key'], *ReviewedNameBatches.key(row), 'Motus']
  end.compact
end
contextual_short_form_rows.concat(contextual_motus_rows)
contextual_short_form_keys.concat(contextual_motus_rows.map { |row| row.first(4) })
walls_short_manifest = File.join(__dir__, 'proper-name-edits-D21460.tsv')
contextual_walls_rows = ReviewedNameBatches.table(walls_short_manifest).select do |row|
  row['entity_key'] == 'place:the-walls' &&
    row['resource'] == 'default' &&
    %w[5678 22108 25637 44158 45848 59610 60038].include?(row['ID_Linha']) &&
    row['Tipo_Variante'].to_s.empty? &&
    row['status'] == 'accepted' &&
    row['new'].include?('(Walls)') &&
    row['english'].match?(/(?<![A-Za-z])Walls(?![A-Za-z])/)
end
raise 'source-local Walls label coverage differs' unless contextual_walls_rows.length == 7
contextual_walls_keys = contextual_walls_rows.map do |row|
  [row['entity_key'], *ReviewedNameBatches.key(row), 'Walls']
end
contextual_short_form_rows.concat(contextual_walls_keys)
contextual_short_form_keys.concat(contextual_walls_keys.map { |row| row.first(4) })
mine_short_manifest = File.join(__dir__, 'proper-name-edits-D21241.tsv')
if File.file?(mine_short_manifest)
  mine_short_rows = ReviewedNameBatches.table(mine_short_manifest).select do |row|
    row['entity_key'] == 'place:tearscotter-mines' &&
      row['resource'] == 'default' &&
      %w[28142 48270 61410].include?(row['ID_Linha']) &&
      row['Tipo_Variante'].to_s.empty? &&
      row['english'].match?(/\bTearscotter\b/) &&
      !row['english'].match?(/\bTearscotter Mine/i)
  end.map { |row| [row['entity_key'], *ReviewedNameBatches.key(row), 'Tearscotter'] }
  raise 'scoped mine manifest coverage differs' unless mine_short_rows.length == 3

  contextual_short_form_rows.concat(mine_short_rows)
  contextual_short_form_keys.concat(mine_short_rows.map { |row| row.first(4) })
end
shattertier_scope_manifest = File.join(__dir__, 'proper-name-edits-D21243.tsv')
if File.file?(shattertier_scope_manifest)
  scoped_shattertier_rows = ReviewedNameBatches.table(shattertier_scope_manifest).select do |row|
    row['entity_key'] == 'place:shattertier-mine' &&
      row['resource'] == 'default' &&
      %w[20829 26529].include?(row['ID_Linha']) &&
      row['Tipo_Variante'].to_s.empty? &&
      row['english'].match?(/\bShattertier\b/) &&
      !row['english'].match?(/\bShattertier Mine/i)
  end.map { |row| [row['entity_key'], *ReviewedNameBatches.key(row), 'Shattertier'] }
  raise 'scoped Shattertier manifest coverage differs' unless scoped_shattertier_rows.length == 2

  contextual_short_form_rows.concat(scoped_shattertier_rows)
  contextual_short_form_keys.concat(scoped_shattertier_rows.map { |row| row.first(4) })
end
artifact_ellipsis_manifest = File.join(__dir__, 'proper-name-discovery-D21262.tsv')
artifact_short_terms = {
  'unique item:sun-stone' => 'Sun',
  'item:frost-stone' => 'Frost'
}.freeze
artifact_ellipsis_rows = if File.file?(artifact_ellipsis_manifest)
                           rows = ReviewedNameBatches.table(artifact_ellipsis_manifest).flat_map do |row|
                             row['entity_key'].to_s.split('|').map do |entity|
                               term = artifact_short_terms[entity]
                               next unless term &&
                                 row['evidence'].include?('row-scoped short artifact form') &&
                                 row['english'].match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/) &&
                                 !row['english'].match?(/(?<![A-Za-z])#{Regexp.escape(term)}\s+Stone(?![A-Za-z])/i)

                               [entity, *ReviewedNameBatches.key(row), term]
                             end.compact
                           end
                           expected = [
                             ['unique item:sun-stone', 'default', '7472', ''],
                             ['unique item:sun-stone', 'default', '27929', ''],
                             ['unique item:sun-stone', 'default', '37217', ''],
                             ['item:frost-stone', 'default', '37217', '']
                           ].sort
                           raise 'artifact short-form coverage differs' unless
                             rows.map { |row| row.first(4) }.sort == expected
                           rows
                         else
                           []
                         end
artifact_ellipsis_keys = artifact_ellipsis_rows.map { |row| row.first(4) }
contextual_short_form_rows.concat(artifact_ellipsis_rows)
contextual_short_form_keys.concat(artifact_ellipsis_keys)
caeled_manifest = File.join(__dir__, 'proper-name-edits-D21117.tsv')
contextual_caeled_rows = if File.file?(caeled_manifest)
                           ReviewedNameBatches.table(caeled_manifest).select do |row|
                             row['entity_key'] == 'place:caeled-coast' &&
                               row['evidence'].include?('exact row-scoped Caeled occurrence') &&
                               row['english'].match?(/(?<![A-Za-z])Caeled(?![A-Za-z])/)
                           end
                         else
                           []
                         end
contextual_caeled_keys = contextual_caeled_rows.map do |row|
  [row['entity_key'], *ReviewedNameBatches.key(row)]
end
hall_manifest = File.join(__dir__, 'proper-name-edits-D21089.tsv')
contextual_hall_rows = if File.file?(hall_manifest)
                         ReviewedNameBatches.table(hall_manifest).select do |row|
                           row['entity_key'] == 'place:hall-of-the-firstsworn' &&
                             row['resource'] == 'default' &&
                             %w[40118 44231].include?(row['ID_Linha']) &&
                             row['Tipo_Variante'].to_s.empty?
                         end
                       else
                         []
                       end
contextual_hall_keys = contextual_hall_rows.map do |row|
  [row['entity_key'], *ReviewedNameBatches.key(row)]
end
person_discovery_batches = (21100..21109).to_a +
  [21132, 21133, 21145, 21146, 21158, 21159, 21160] +
  (21596..21598).to_a
person_discovery_rows = person_discovery_batches.flat_map do |number|
  d = number.to_s
  path = File.join(__dir__, "proper-name-edits-D#{d}.tsv")
  next [] unless File.file?(path)

  ReviewedNameBatches.table(path).flat_map do |row|
    row['entity_key'].to_s.split('|').map do |entity|
      [entity, *ReviewedNameBatches.key(row), row] if entity.start_with?('person:')
    end.compact
  end
end
person_discovery_keys = person_discovery_rows.map { |entity, resource, id, variant, _row|
  [entity, resource, id, variant]
}
contextual_person_keys = extras & person_discovery_keys
documented_extras = (contextual_maid_keys + anwon_keys + contextual_gwyn_keys +
  contextual_sydanus_keys + contextual_tine_keys + oleyn_source_typo +
  contextual_short_form_keys + contextual_caeled_keys + contextual_hall_keys +
  contextual_person_keys).uniq

# The original allowlist predates later reviewed row-scoped additions. Accept
# an extra only when its current terminal disposition and evidence exactly
# match the manifest event that is recorded on the active index row.
manifest_paths = Dir.glob(File.join(__dir__, 'proper-name-edits-D*.tsv')) +
  %w[
    proper-name-site-identity-limits-D21243.tsv
    proper-name-site-hold-evidence-D21247.tsv
  ].map { |name| File.join(__dir__, name) }.select { |path| File.file?(path) }
manifest_events = {}
manifest_paths.sort_by { |path| path[/D(\d+)/, 1].to_i }.each do |path|
  batch = path[/D(\d+)/, 1].to_i
  ReviewedNameBatches.table(path).each do |review|
    dispositions = review['entity_dispositions_json'].to_s.empty? ? {} :
      JSON.parse(review['entity_dispositions_json'])
    review['entity_key'].split('|').each do |entity|
      key = [entity, *ReviewedNameBatches.key(review)]
      manifest_events[key] = [
        batch, dispositions.fetch(entity, review['status']), review['evidence']
      ]
    end
  end
end
indexed_by_key = index.to_h do |row|
  [[row['entity_key'], *ReviewedNameBatches.key(row)], row.to_h]
end
manifest_backed_extras = extras.select do |key|
  row = indexed_by_key.fetch(key)
  event = manifest_events[key]
  batch = row['evidence'].to_s[/\AD-(\d+):/, 1]&.to_i
  event && event[0] == batch && event[1] == row['status'] &&
    row['evidence'] == "D-#{event[0]}: #{event[2]}"
end

# Syl is a person at one row and a place in explicit Hollow-of-Syl rows.
# These eight place matches intentionally remain row-scoped and therefore
# are not produced by the global Syl Hollow canonical/alias matcher.
syl_manifest = ReviewedNameBatches.table(
  File.join(__dir__, 'proper-name-edits-D21637.tsv')
).select do |row|
  row['entity_key'].to_s.split('|').include?('place:syl-hollow') &&
    row['scope'] == 'row-scoped-homonym'
end
expected_syl_place_ids = %w[9918 17547 24765 30641 43207 47222 55176 59101]
raise 'row-scoped Syl place review scope differs' unless
  syl_manifest.map { |row| row['ID_Linha'] }.sort == expected_syl_place_ids.sort &&
  syl_manifest.map { |row| row['ID_Linha'] }.uniq.length == expected_syl_place_ids.length
syl_scoped_extras = syl_manifest.map do |row|
  ['place:syl-hollow', *ReviewedNameBatches.key(row)]
end & extras
expected_syl_place_extras = expected_syl_place_ids.map do |id|
  ['place:syl-hollow', 'default', id, '']
end
raise 'row-scoped Syl place index coverage differs' unless
  syl_scoped_extras.sort == expected_syl_place_extras.sort
expected_syl_place_ids.each do |id|
  review = syl_manifest.find { |row| row['ID_Linha'] == id }
  indexed = indexed_by_key.fetch(['place:syl-hollow', 'default', id, ''])
  dispositions = JSON.parse(review.fetch('entity_dispositions_json'))
  raise "Syl place disposition differs at #{id}" unless
    indexed['status'] == dispositions.fetch('place:syl-hollow') &&
    indexed['matched_english'] == 'Syl' &&
    indexed['evidence'].start_with?('D-21637:') &&
    indexed['korean_current'] == review['new']
end
documented_extras = (documented_extras + manifest_backed_extras +
  syl_scoped_extras).uniq
unaccounted_extras = extras - documented_extras
puts "Source/index key differences: missing=#{absent.length}, documented exclusions=#{documented_missing.length}, contextual extras=#{extras.length}, undocumented extras=#{unaccounted_extras.length}"
undocumented_missing.first(30).each { |key| puts "MISSING #{key.inspect}" }
documented_missing.each { |key| puts "DOCUMENTED EXCLUSION #{key.inspect}" }
unaccounted_extras.first(30).each { |key| puts "UNDOCUMENTED EXTRA #{key.inspect}" }
raise 'source/index has missing or undocumented keys' unless
  undocumented_missing.empty? && unaccounted_extras.empty?

missing = []
idiomatic_nonlabels = []
documented_invocation_phrases = []
descriptive_nonlabels = []
descriptive_cave_reviews = ReviewedNameBatches.table(
  File.join(__dir__, 'proper-name-edits-D21309.tsv')
).select do |review|
  review['entity_key'] == 'place:flooded-cavern' &&
    review['resource'] == 'default' &&
    %w[10917 11306 40606 57689].include?(review['ID_Linha']) &&
    review['Tipo_Variante'].to_s.empty? &&
    review['status'] == 'not-an-issue' &&
    review['old'] == review['new'] &&
    review['english'].include?('flooded cavern') &&
    !review['english'].include?('Flooded Cavern') &&
    review['evidence'].include?('remain descriptive and unchanged')
end.to_h { |review| [ReviewedNameBatches.key(review), review] }
raise 'documented lowercase cave scope differs' unless descriptive_cave_reviews.length == 4
ysa_rank_review = ReviewedNameBatches.table(
  File.join(__dir__, 'proper-name-edits-D21426.tsv')
).find do |review|
  review['entity_key'] == 'person:king-ysa' &&
    ReviewedNameBatches.key(review) == ['default', '12727', ''] &&
    review['status'] == 'not-an-issue' &&
    review['english'].include?('the Summer king Ysa') &&
    review['japanese'].include?('サマー・フェイのイーサ王') &&
    review['chinese'].include?('夏王伊萨') &&
    review['new'] == '500년 전, 여름의 왕 이사(Ysa)와 겨울의 군주 오운(Ohn)은 그 순환을 깨고 바로 이 평원에서 전투를 벌였어. 땅엔 아직도 그 상흔이 남아 있지.' &&
    review['evidence'].include?('Preserve source-local ranks') &&
    review['evidence'].include?('이사(Ysa)')
end
raise 'documented King Ysa rank translation differs' unless ysa_rank_review
documented_ranked_translations = []
documented_syl_place_labels = []
mercy_invocation_keys = [
  ['default', '7681', ''], ['default', '22205', ''],
  ['default', '29324', '']
].freeze
index.each do |row|
  next unless %w[accepted not-an-issue].include?(row['status'])
  entity = entities.fetch(row['entity_key'])
  labels = row['korean_current'].scan(/\(([^()\r\n]+)\)/).flatten
  terms = [entity['english_canonical'], *entity['english_aliases'].to_s.split('|')]
  covered = terms.any? do |term|
    labels.any? { |label| label.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i) }
  end
  # D-20413 permits the source-shortened Anwon family label without inventing
  # "House" in a row that names only the bloodline or family.
  covered ||= row['entity_key'] == 'faction:house-anwon' &&
    labels.include?('Anwon') && row['english_source'].match?(/\bAnwon\b/)
  contextual_key = ['person:magwyr', *ReviewedNameBatches.key(row)]
  covered ||= contextual_maid_keys.include?(contextual_key) &&
    row['english_source'].match?(/\bMaid\b/i) &&
    labels.any? { |label| label.match?(/\A(?:The )?Maid\z/i) }
  gwyn_key = ['person:gwyn-anwy', *ReviewedNameBatches.key(row)]
  covered ||= contextual_gwyn_keys.include?(gwyn_key) &&
    row['english_source'].match?(/(?<![A-Za-z])Gwyn(?![A-Za-z])/i) &&
    !row['english_source'].match?(/\bGwyn Anwy\b/i) &&
    labels.include?('Gwyn')
  sydanus_key = ['person:ciara-sydanus', *ReviewedNameBatches.key(row)]
  covered ||= contextual_sydanus_keys.include?(sydanus_key) &&
    row['english_source'].match?(/(?<![A-Za-z])Sydanus(?![A-Za-z])/i) &&
    !row['english_source'].match?(/\bCiara Sydanus\b/i) &&
    labels.any? { |label| label.match?(/(?<![A-Za-z])Sydanus(?![A-Za-z])/i) }
  tine_key = ['person:tine-delfric', *ReviewedNameBatches.key(row)]
  covered ||= contextual_tine_keys.include?(tine_key) &&
    row['english_source'].match?(/(?<![A-Za-z])Tine(?![A-Za-z])/i) &&
    !row['english_source'].match?(/\bTine Delfric\b/i) &&
    labels.include?('Tine')
  short_form = contextual_short_form_rows.find do |entity, resource, id, variant, term|
    entity == row['entity_key'] &&
      [resource, id, variant] == ReviewedNameBatches.key(row) &&
      row['english_source'].match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
  end
  covered ||= short_form && labels.any? do |label|
    label.match?(/(?<![A-Za-z])#{Regexp.escape(short_form.last)}(?![A-Za-z])/i)
  end
  caeled_key = ['place:caeled-coast', *ReviewedNameBatches.key(row)]
  contextual_caeled = contextual_caeled_rows.find do |review|
    review['entity_key'] == row['entity_key'] &&
      ReviewedNameBatches.key(review) == ReviewedNameBatches.key(row)
  end
  covered ||= contextual_caeled && contextual_caeled_keys.include?(caeled_key) &&
    row['english_source'].match?(/(?<![A-Za-z])Caeled(?![A-Za-z])/i) &&
    labels.include?('Caeled')
  covered ||= contextual_hall_rows.any? do |review|
    review['entity_key'] == row['entity_key'] &&
      ReviewedNameBatches.key(review) == ReviewedNameBatches.key(row) &&
      review['english'] == row['english_source'] &&
      labels.include?('Halls of the Firstsworn')
  end
  person_review = person_discovery_rows.reverse.find do |entity, resource, id, variant, _review|
    entity == row['entity_key'] &&
      [resource, id, variant] == ReviewedNameBatches.key(row)
  end&.last
  if person_review && %w[accepted not-an-issue].include?(person_review['status'])
    name_parts = entity['english_canonical'].scan(/[A-Za-z]+/).uniq
    exact_pair = labels.any? do |label|
      name_parts.any? do |part|
        label.match?(/(?<![A-Za-z])#{Regexp.escape(part)}(?![A-Za-z])/i) &&
          row['english_source'].match?(/(?<![A-Za-z])#{Regexp.escape(part)}(?![A-Za-z])/i)
      end
    end
    explicit_omission = person_review['status'] == 'not-an-issue' &&
      person_review['evidence'].gsub(/\s+/, ' ').match?(
        /If Korean omits (?:the English full-name parenthetical|the name), retain the existing translation\./
      )
    covered ||= exact_pair
    covered ||= person_review['new'] == row['korean_current'] &&
      explicit_omission
  end
  key = [row['entity_key'], *ReviewedNameBatches.key(row)]
  manifest_event = manifest_events[key]
  manifest_evidence_matches = manifest_event &&
    row['evidence'] == "D-#{manifest_event[0]}: #{manifest_event[2]}" &&
    row['status'] == manifest_event[1]
  if manifest_evidence_matches
    row_terms = row['matched_english'].to_s.split('|').map do |term|
      term.sub(/\s+\[[^\]]*\]\z/, '').sub(/\s+\([^)]*\)\z/, '').strip
    end.reject(&:empty?)
    covered ||= row_terms.any? do |term|
      row['english_source'].match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i) &&
        labels.any? { |label| label.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i) }
    end
  end
  family_label_tokens = {
    'family:darkvari' => 'Darkvari',
    'family:cynric' => 'Cynric',
    'family:skoria' => 'Skoria',
    'family:zungar' => 'Zungar'
  }
  family_token = family_label_tokens[row['entity_key']]
  covered ||= family_token &&
    row['english_source'].match?(/(?<![A-Za-z])#{family_token}(?![A-Za-z])/i) &&
    labels.any? { |label| label.match?(/(?<![A-Za-z])#{family_token}(?![A-Za-z])/i) }
  documented_ysa_rank_translation =
    row['entity_key'] == 'person:king-ysa' &&
    ReviewedNameBatches.key(row) == ['default', '12727', ''] &&
    row['status'] == 'not-an-issue' &&
    row['matched_english'] == 'King Ysa' &&
    row['english_source'] == ysa_rank_review['english'] &&
    row['korean_current'] == ysa_rank_review['new'] &&
    row['evidence'] == "D-21426: #{ysa_rank_review['evidence']}"
  if documented_ysa_rank_translation
    documented_ranked_translations << row
    covered = true
  end
  syl_place_context = row['entity_key'] == 'place:syl-hollow' &&
    %w[9918 17547 30641 55176 59101].include?(row['ID_Linha']) &&
    row['matched_english'] == 'Syl' &&
    row['status'] == (row['ID_Linha'] == '17547' || row['ID_Linha'] == '55176' ?
      'not-an-issue' : 'accepted') &&
    row['english_source'].match?(/(?:hollow of Syl|Fae Hollow known as Syl)/i) &&
    labels.include?('Syl') &&
    row['korean_current'].match?(/실\(Syl\)/)
  if syl_place_context
    documented_syl_place_labels << row
    covered = true
  end
  next if covered
  documented_idiom = row['entity_key'] == 'monster:crudok' &&
    ReviewedNameBatches.key(row) == ['default', '3851', ''] &&
    row['english_source'].match?(/I'm a Crudok's arse/i) &&
    row['korean_current'].include?('내 손에 장을 지지') &&
    row['evidence'].include?('Preserved the intentional idiomatic translation')
  if documented_idiom
    idiomatic_nonlabels << row
    next
  end
  documented_invocation = row['entity_key'] == 'person:the-widow' &&
    mercy_invocation_keys.include?(ReviewedNameBatches.key(row)) &&
    row['status'] == 'accepted' &&
    row['english_source'].match?(/\bby the Widow's mercy\b/i) &&
    row['korean_current'].include?("위도우의 자비(Widow's mercy)") &&
    row['evidence'].include?('established invocation') &&
    row['evidence'].include?('complete English phrase')
  if documented_invocation
    documented_invocation_phrases << row
    next
  end
  # These four reviewed descriptions are not missing proper-name labels.
  description = descriptive_cave_reviews[ReviewedNameBatches.key(row)]
  if row['entity_key'] == 'place:flooded-cavern' &&
     row['status'] == 'not-an-issue' && manifest_evidence_matches &&
     description && row['english_source'] == description['english']
    descriptive_nonlabels << row
    next
  end
  missing << row.to_h
end
path = File.join(__dir__, 'proper-name-residual-missing-bilingual-final.tsv')
ReviewedNameBatches.write_table(path, index.headers, missing)
puts "Source/occurrence comparison: #{expected_keys.length} source matches, #{index.length} indexed matches, #{inventory.length} CSV rows"
puts "Terminal matches without a covering bilingual English label: #{missing.length}"
puts "Documented idiomatic non-labels: #{idiomatic_nonlabels.length}"
puts "Documented invocation-phrase exceptions: #{documented_invocation_phrases.length}"
puts "Documented lowercase descriptive non-labels: #{descriptive_nonlabels.length}"
puts "Documented source-local rank translations: #{documented_ranked_translations.length}"
puts "Documented row-scoped Syl place labels: #{documented_syl_place_labels.length}"
puts "Documented source-local Walls labels: #{contextual_walls_rows.length}"
raise 'row-scoped Syl place labels differ' unless documented_syl_place_labels.length == 5
missing.each do |row|
  puts JSON.generate(row.slice('entity_key', 'resource', 'ID_Linha', 'korean_current', 'evidence'))
end
raise 'terminal proper-name rows have missing bilingual labels' unless missing.empty?
