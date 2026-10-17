#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'apply-reviewed-proper-name-discovery'

module AstridShortFormsD21466
  extend self

  M = ReviewedNameBatches
  D = 21_466
  PERSON = 'person:astrid-frisk'
  REVIEW = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  EXPECTED_IDS = %w[9891 10835 17981 35645 39703 42875 47275 49084 55054].freeze
  CHANGE_IDS = %w[9891 10835 35645 39703 42875 47275].freeze
  ENTITY_EVIDENCE = 'English identifies the short-form Astrid in the Didenhil Plagueshield storyline as the already registered healer Astrid Frisk; aligned Japanese アストリッド and Chinese 阿斯特丽德 corroborate. Pair the Korean short name only in these exact source rows. Keep the canonical Astrid Frisk entry and add no global Astrid alias because default:49084 refers to the distinct Astrid of the Barelegs Sisters.'
  HOMONYM_EVIDENCE = 'The English context identifies Astrid as one of the Barelegs Sisters, not the Didenhil healer Astrid Frisk. Aligned Japanese アストリッド and Chinese 阿斯特丽德 refer to the same separate lore character. Exclude this row from person:astrid-frisk; do not infer or add a global first-name alias.'

  def normalize(text, id)
    if id == '49084'
      raise 'Barelegs sister source drift' unless text.include?('맨다리 자매(Barelegs Sisters)')
      return text
    end

    raise "unreviewed Astrid key #{id}" unless EXPECTED_IDS.include?(id)
    raise "Astrid source name missing at #{id}" unless text.match?(/아스트리드/)
    return text if text.include?('아스트리드(Astrid)')
    raise "ambiguous Korean Astrid span at #{id}" unless text.scan('아스트리드').length == 1

    text.sub('아스트리드', '아스트리드(Astrid)')
  end

  def build_reviews(inventory, index)
    indexed_person_keys = index.select { |row| row['entity_key'] == PERSON }
      .map { |row| M.key(row) }
    candidates = inventory.values.select do |source|
      JSON.parse(source.fetch('en_texts_json')).compact.any? { |text| text.match?(/\bAstrid\b/i) }
    end
    new_candidates = candidates.reject { |source| indexed_person_keys.include?(M.key(source)) }
    raise 'D-21466 Astrid source scope differs' unless
      new_candidates.map { |source| M.key(source) }.sort ==
        EXPECTED_IDS.map { |id| ['default', id, ''] }.sort

    new_candidates.map do |source|
      key = M.key(source)
      id = key[1]
      english_texts = JSON.parse(source.fetch('en_texts_json')).compact
      japanese_texts = JSON.parse(source.fetch('ja_texts_json')).compact
      english = english_texts.join("\n")
      japanese = japanese_texts.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      raise "Astrid English evidence missing at #{key.inspect}" unless
        english_texts.any? { |text| text.match?(/\bAstrid\b/i) }
      raise "Astrid Japanese evidence missing at #{key.inspect}" unless japanese.include?('アストリッド')
      raise "Astrid Chinese evidence missing at #{key.inspect}" unless chinese.include?('阿斯特丽德')

      new_text = normalize(old, id)
      status = if id == '49084'
                 'excluded'
               elsif new_text == old
                 'not-an-issue'
               else
                 'accepted'
               end
      evidence = id == '49084' ? HOMONYM_EVIDENCE : ENTITY_EVIDENCE
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => PERSON, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => evidence, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese, 'entity_dispositions_json' => JSON.generate(PERSON => status)
      }
    end.sort_by { |row| [row['ID_Linha'].to_i, row['Tipo_Variante']] }
  end

  def run
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    person = glossary.find { |row| row['entity_key'] == PERSON }
    raise 'Astrid Frisk glossary entry differs' unless
      person && person['english_canonical'] == 'Astrid Frisk' &&
      person['korean_canonical'] == '아스트리드 프리스크(Astrid Frisk)' &&
      person['english_aliases'].to_s.empty?

    inventory = M.refresh_inventory
    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    reviews = build_reviews(inventory, index)
    raise 'D-21466 review dispositions differ' unless
      reviews.group_by { |row| row['status'] }.transform_values(&:length) ==
        { 'accepted' => 6, 'not-an-issue' => 2, 'excluded' => 1 }
    target_keys = reviews.map { |row| [PERSON, *M.key(row)] }
    indexed_keys = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'D-21466 contains an already indexed person occurrence' unless
      (target_keys & indexed_keys).empty?
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.select { |row| row['old'] != row['new'] }.each do |review|
      ProperNameCellEditor.prepare(
        File.binread(M.csv_path(review.fetch('resource'))), [review]
      )
    end

    previous_index = index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)],
       row.reject { |field, _| field == 'korean_current' }]
    end
    new_index_rows = reviews.map do |review|
      {
        'entity_key' => PERSON, 'resource' => review.fetch('resource'),
        'ID_Linha' => review.fetch('ID_Linha'),
        'Tipo_Variante' => review.fetch('Tipo_Variante'),
        'matched_english' => 'Astrid', 'english_source' => review.fetch('english'),
        'korean_current' => review.fetch('old'), 'status' => 'needs-context',
        'evidence' => 'Candidate hit from the English source; verify this occurrence in context.'
      }
    end
    M.write_table(REVIEW, M::HEADERS.take(12), reviews)
    M.write_table(M::INDEX, index_table.headers, index + new_index_rows)
    M.run(REVIEW, D, 1)

    final_index = M.table(M::INDEX).map(&:to_h)
    final_by_key = final_index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)],
       row.reject { |field, _| field == 'korean_current' }]
    end
    previous_index.each do |key, row|
      raise "prior Astrid disposition changed #{key.inspect}" unless final_by_key[key] == row
    end
    final_glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    raise 'Astrid global alias or glossary change detected' unless
      final_glossary == glossary.map(&:to_h)
    puts "D-#{D}: reviewed #{reviews.length} Astrid short-form rows; " \
         "#{reviews.count { |row| row['status'] == 'accepted' }} edits; " \
         "kept Barelegs Sisters Astrid separate."
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-astrid-short-forms-D21466.rb' unless ARGV.empty?
  AstridShortFormsD21466.run
end
