#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module ElrodEdmanD21494
  extend self

  M = ReviewedNameBatches
  D = 21_494
  ENTITY = 'person:elrod-edman'
  ENGLISH = 'Elrod Edman'
  KOREAN = '엘로드 에드먼(Elrod Edman)'
  EXPECTED_IDS = %w[
    12915 20018 34937 38932 43704 48488 4944 5959 62359 7914 8652
  ].freeze
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  RESIDUALS = File.join(__dir__, "proper-name-residual-review-D#{D}.tsv")
  RESIDUAL_IDS = %w[17625 58835 60791].freeze
  RESIDUAL_HEADERS = %w[
    resource ID_Linha Tipo_Variante candidate entity_key status old new evidence
    english japanese chinese
  ].freeze
  SHARED_EVIDENCE = 'English is the identity and meaning anchor; aligned Japanese and Chinese corroborate. No global short-name alias, inferred biography, source edit, or historical translation recount. Preserve unrelated names, wording, tokens, punctuation, particles, and line breaks.'

  def definition(headers)
    values = {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'category' => 'person',
      'korean_canonical' => KOREAN,
      'english_aliases' => '',
      'korean_variants' => '엘로드 에드먼',
      'evidence_ids' => "D-#{D}|default:12915|default:38932|default:4944",
      'status' => 'confirmed',
      'notes' => 'English default:12915 explicitly identifies Elrod Edman as the leader of the refugee group; default:38932 independently identifies him as leader of the refugees from Coln and ties his request to the three-spy quest. Aligned Japanese エルロッド・エドマン and Chinese 艾尔罗德·埃德曼 corroborate the full name. Register only the exact full-name form; Elrod is not a global alias. Three isolated short Elrod rows remain separately unresolved pending a surname, quest, speaker, or scene link.'
    }
    headers.to_h { |header| [header, values.fetch(header, '')] }
  end

  def normalize(id, text)
    normalized = text.gsub(/엘로드 에드먼(?!\()/, KOREAN)
    if id == '38932'
      normalized = normalized.sub('엘로드의 말로는', '엘로드(Elrod)의 말로는')
    end
    normalized
  end

  def expected_pairs
    EXPECTED_IDS.map { |id| ['person:elrod-edman', 'default', id, ''] }
  end

  def reviews_for(inventory, generated)
    actual_pairs = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Elrod Edman exact source scope differs' unless actual_pairs.sort == expected_pairs.sort

    generated.sort_by { |row| row.fetch('ID_Linha').to_i }.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      korean = source.fetch('work_text')
      raise "English full-name evidence differs #{key.inspect}" unless
        english.match?(/(?<![A-Za-z0-9_])Elrod Edman(?![A-Za-z0-9_])/)
      raise "Japanese Elrod evidence differs #{key.inspect}" unless
        japanese.match?(/エルロッド・エドマン/)
      raise "Chinese Elrod evidence differs #{key.inspect}" unless
        chinese.match?(/艾尔罗德·埃德曼/)

      new_text = normalize(key[1], korean)
      status = new_text == korean ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => korean,
        'new' => new_text,
        'evidence' => "English identifies the same refugee leader at default:12915 and default:38932; default:38932 connects the short Elrod reference to the full-name subject in the same sentence. Reuse the established Korean reading 엘로드 에드먼 and pair only source-written Elrod Edman; do not add Elrod as a global alias. #{SHARED_EVIDENCE}",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
  end

  def residual_reviews(inventory)
    evidence = {
      '17625' => 'The line says only “call for Elrod.” Aligned Japanese and Chinese give the same given name but do not provide a surname, role, quest, or scene link to Elrod Edman. Keep the existing paired Korean unchanged until speaker/scene context or an explicit full-name cross-reference establishes identity.',
      '58835' => 'The speaker says “I bet that Elrod sent you.” The aligned Japanese and Chinese likewise provide only the given name. No surname, refugee-leader role, quest objective, or scene link is present in this exact row; keep the person link unresolved pending such a cross-reference.',
      '60791' => 'All three source locales contain only the literal label “Elrod.” The row has no surrounding identity context. Keep the existing Korean label unchanged pending a source-linked speaker, scene, surname, or quest reference.'
    }
    RESIDUAL_IDS.map do |id|
      key = ['default', id, '']
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'candidate' => 'Elrod', 'entity_key' => ENTITY, 'status' => 'uncertain',
        'old' => source.fetch('work_text'), 'new' => source.fetch('work_text'),
        'evidence' => evidence.fetch(id), 'english' => english,
        'japanese' => japanese, 'chinese' => source.fetch('zh_text')
      }
    end
  end

  def prepare
    glossary_table = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    raise 'Elrod Edman entity already registered' if
      glossary.any? { |row| row.fetch('entity_key') == ENTITY }
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'discovery outputs already exist' if
      [DEFINITIONS, REVIEWS, RESIDUALS].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    definition = definition(glossary_table.headers)
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    index = M.table(M::INDEX).map(&:to_h)
    reviews = reviews_for(inventory, generated)
    ReviewedProperNameDiscovery.validate!(
      [definition], reviews, generated, glossary, index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    residuals = residual_reviews(inventory)
    raise 'unexpected Elrod residual row keys' unless
      residuals.map { |row| M.key(row) }.sort ==
        RESIDUAL_IDS.map { |id| ['default', id, ''] }.sort

    puts "Prepared D-#{D}: #{reviews.length} full-name keys; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} Korean edits; " \
         "#{residuals.length} isolated short-name holds."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new'))
    end
    [definition, reviews, residuals]
  end

  def append_detail(path, section)
    text = File.read(path)
    return if text.include?('### D-21494: Elrod Edman')

    marker = '<!-- current-proper-name-batch:end -->'
    raise "missing current batch marker in #{path}" unless text.include?(marker)
    text.sub!(marker, "#{marker}\n\n#{section}")
    File.write(path, text)
  end

  def apply
    glossary_path = ReviewedProperNameDiscovery::GLOSSARY
    prior_glossary = M.table(glossary_path)
    prior_records = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    definition, reviews, residuals = prepare
    M.write_table(DEFINITIONS, prior_glossary.headers, [definition])
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    M.write_table(RESIDUALS, RESIDUAL_HEADERS, residuals)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])

    final_index = M.table(M::INDEX).map(&:to_h)
    final_records = final_index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    prior_records.each do |key, record|
      raise "prior occurrence changed #{key.inspect}" unless final_records[key] == record
    end
    raise 'unexpected occurrence additions' unless
      (final_records.keys - prior_records.keys).sort == expected_pairs.sort
    final_glossary = M.table(glossary_path).map(&:to_h)
    raise 'prior glossary records changed' unless
      final_glossary == prior_glossary.map(&:to_h) + [definition]

    detail = <<~TEXT.chomp
      ### D-21494: Elrod Edman

      Registered `person:elrod-edman` as `엘로드 에드먼(Elrod Edman)` from
      11 exact English full-name rows. English default:12915 self-identifies
      him as the refugee-group leader; default:38932 independently identifies
      the same leader and links the same-row short `Elrod` to that full name.
      Japanese エルロッド・エドマン and Chinese 艾尔罗德·埃德曼 corroborate.
      Six `Texto` cells were corrected; five already had the complete bilingual
      form. No global `Elrod` alias or historical translation tally was added.

      Three isolated short-name rows remain outside the confirmed entity scope:
      default:17625 (`call for Elrod`), default:58835 (`Elrod sent you`), and
      default:60791 (bare `Elrod` label). Their separate evidence and the
      exact missing identity link are recorded in
      `proper-name-residual-review-D21494.tsv`; keep them unresolved until
      source-linked speaker/scene, surname, role, or quest evidence is found.
      No CSV edit or occurrence decision was made for these three rows.
    TEXT
    [File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
     File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")].each do |path|
      File.open(path, 'a') { |file| file.write("\n\n#{detail}\n") }
    end
    M::DOCS.each { |path| append_detail(path, detail) }
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-elrod-edman-D21494.rb [prepare|apply]' if ARGV.length > 1
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then ElrodEdmanD21494.prepare
  when 'apply' then ElrodEdmanD21494.apply
  else abort 'usage: review-elrod-edman-D21494.rb [prepare|apply]'
  end
end
