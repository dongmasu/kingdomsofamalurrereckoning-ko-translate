#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

m = ReviewedNameBatches
expected_hashes = {
  'affix' => 'a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586',
  'base' => '2cbf0bd3aa648ca8af62e3a26aa3cf98f43d43dc74bd530798354842e3346cb5',
  'default' => '08e9a15fedd235308f81d74593c7dfbb8e3a2642a0fdd9b3c26d7abfc5a80ce3'
}.freeze
raise 'active CSV hashes changed' unless m.hashes == expected_hashes

glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
glossary = m.table(glossary_path)
index = m.table(m::INDEX)
entity_key = 'person:grim'
raise 'D-20896 artifacts already exist' if
  File.exist?(File.join(__dir__, 'named-scope-review-D20896-20261015.md')) ||
  File.exist?(File.join(__dir__, 'proper-name-edits-D20896.tsv'))

definition = glossary.headers.zip([
  entity_key, 'Grim', 'person', '그림(Grim)', '', '그림',
  'D-20895|default:627|default:8975|default:9968', 'confirmed',
  'Given-name/short-name component of Grim Onwig, whose surname is registered as person:onwig. English identifies the Travelers leader; Japanese グリム and Chinese 格里姆 corroborate. Do not merge Grimmy, Grimshaw, Grimstaad, or Grima; exclude ordinary adjective uses such as “grim times/days.”'
]).to_h

inventory = m.refresh_inventory
generated = build_occurrences(inventory.values, [definition]).map do |values|
  OCCURRENCE_HEADERS.zip(values).to_h
end
raise 'duplicate generated source keys' unless generated.map { |row| m.key(row) }.uniq.length == generated.length
existing = index.map { |row| [row['entity_key'], *m.key(row)] }
raise 'unexpected small Grim source scope' unless generated.length.between?(150, 300)

generated.each do |row|
  english = row.fetch('english_source')
  proper_case_hit = english.match?(/(?<![A-Za-z])Grim(?![A-Za-z])/)
  paired = row.fetch('korean_current').match?(/그림(?: 온위그)?\(Grim(?: Onwig)?\)/)
  row['status'] = if !proper_case_hit
                    'excluded'
                  elsif paired
                    'not-an-issue'
                  else
                    'needs-context'
                  end
  row['evidence'] = if !proper_case_hit
                      'English uses lowercase grim as an ordinary adjective, not the character name; excluded from the personal-name glossary.'
                    elsif paired
                      'Existing Korean text already pairs the English source-name span with 그림(Grim) or the full 그림 온위그(Grim Onwig); retained without a repeated CSV edit.'
                    else
                      'English source contains the exact candidate Grim; inspect aligned dialogue/title context to distinguish the named person from adjective and compound-name homonyms.'
                    end
end

glossary_entry = glossary.find { |row| row['entity_key'] == entity_key }
raise 'person:grim definition differs' unless glossary_entry&.to_h == definition
existing_rows = index.select { |row| row['entity_key'] == entity_key }
expected_keys = generated.map { |row| m.key(row) }.sort
raise 'existing person:grim index scope differs' unless existing_rows.map { |row| m.key(row) }.sort == expected_keys
raise 'unexpected prior Grim dispositions' unless
  existing_rows.all? { |row| %w[accepted excluded needs-context not-an-issue uncertain].include?(row['status']) }

by_key = generated.to_h { |row| [m.key(row), row] }
index.each do |row|
  next unless row['entity_key'] == entity_key
  expected = by_key.fetch(m.key(row))
  row['korean_current'] = expected['korean_current']
  next if row['evidence'].start_with?('D-')
  row['status'] = expected['status']
  row['evidence'] = expected['evidence']
end
m.write_table(m::INDEX, index.headers, index)

unpaired = index.select do |row|
  row['entity_key'] == entity_key && row['status'] == 'needs-context'
end
  .sort_by { |row| [m::RESOURCES.index(row['resource']), row['ID_Linha'].to_i, row['Tipo_Variante']] }
raise "expected 50 unpaired candidate rows, got #{unpaired.length}" unless unpaired.length == 50
batch = unpaired
raise 'unexpected D-20896 batch boundary' unless batch.last['ID_Linha'] == '64837'

dispositions = {
  '44458' => ['excluded', '“Grim tidings” is the idiom “bad/ominous news,” not a reference to the person. Japanese 残念 and Chinese 坏消息 support the English idiomatic reading; the Korean already says 안 좋은 소식.'],
  '54120' => ['uncertain', 'Retain the unresolved D-16402 finding: “Grim Harvest” may be a named event/title or a descriptive phrase. Japanese 悲しい収穫 and Chinese 格里姆的收获 do not settle the English ambiguity; do not turn this into a Grim Onwig reference.']
}.freeze

particle_or_boundary = '(?:은|는|이|가|을|를|의|와|과|도|만|에게|한테|으로|로|에|에서|부터|까지|처럼|이란|이라고|이라면|이었다|께|말로|같은|[[:space:][:punct:]]|\\z)'
name_pattern = /그림(?!\(Grim\))(?=#{particle_or_boundary})/

reviews = batch.map do |occurrence|
  key = m.key(occurrence)
  source = inventory.fetch(key)
  old = source.fetch('work_text')
  disposition = dispositions[key[1]]
  if disposition
    status, reason = disposition
    {
      'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
      'entity_key' => entity_key, 'status' => status,
      'old' => old, 'new' => old, 'evidence' => reason,
      'entity_dispositions_json' => JSON.generate(entity_key => status)
    }
  else
    text = old.gsub(/그라임(?:\(Grim\))?/, '그림(Grim)')
      .gsub(name_pattern, '그림(Grim)')
    raise "no bounded Korean Grim span for #{key.inspect}" if text == old
    {
      'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
      'entity_key' => entity_key, 'status' => 'accepted',
      'old' => old, 'new' => text,
      'evidence' => 'English context identifies Grim, the Travelers leader; aligned Japanese グリム and Chinese 格里姆 corroborate. Standardized only bounded Korean personal-name mentions to 그림(Grim), correcting the already-paired misspelling 그라임(Grim) at default:51959. Ordinary idioms and the unresolved Grim Harvest label remain excluded/held.',
      'entity_dispositions_json' => JSON.generate(entity_key => 'accepted')
    }
  end
end
expected_statuses = { 'accepted' => 48, 'excluded' => 1, 'uncertain' => 1 }
raise "unexpected D-20896 outcomes: #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}" unless
  reviews.group_by { |row| row['status'] }.transform_values(&:length) == expected_statuses

review_path = '/private/tmp/proper-name-grim-D20896-reviewed.tsv'
m.write_table(review_path, m::HEADERS, reviews)
m.run(review_path, 20896, 1)
