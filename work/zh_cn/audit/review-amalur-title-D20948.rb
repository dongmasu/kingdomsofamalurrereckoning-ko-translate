#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module AmalurTitleD20948
  extend self

  M = ReviewedNameBatches
  ENTITY = 'game:kingdoms-of-amalur-re-reckoning'
  TITLE = 'Kingdoms of Amalur: Re-Reckoning'
  KOREAN = '킹덤 오브 아말러: 리레코닝(Kingdoms of Amalur: Re-Reckoning)'
  EXCLUDED = {
    '26352' => 'Untranslated copyright/legal attribution is preserved verbatim across locales.',
    '30090' => 'Standalone centered game logo/title is intentionally displayed as the official English brand across locales.',
    '41940' => 'Untranslated copyright/legal attribution is preserved verbatim across locales.'
  }.freeze

  DEFINITION = {
    'entity_key' => ENTITY,
    'english_canonical' => TITLE,
    'category' => 'title',
    'korean_canonical' => KOREAN,
    'english_aliases' => '',
    'korean_variants' => '킹덤 오브 아말러 레코닝|킹덤 오브 아말루르: 리레코닝|킹덤 오브 아말루르: 리-레코닝|킹덤스 오브 아말루르: 리-레코닝|아말루르 왕국: 리레코닝',
    'evidence_ids' => 'D-20948|official-manual:PDF1|official-manual:PDF3|official-korean-manual-reference.md',
    'status' => 'confirmed',
    'notes' => 'Complete remaster game title, distinct from the world-name entity Amalur. The official Korean manual renders the original game title as 킹덤 오브 아말러 레코닝; use the adapted remaster form 킹덤 오브 아말러: 리레코닝(Kingdoms of Amalur: Re-Reckoning). Preserve exact English branding for standalone logo and untranslated copyright/legal notices.'
  }.freeze

  def transform(text, id)
    return [text, 'excluded', EXCLUDED.fetch(id)] if EXCLUDED.key?(id)

    changed = text.dup
    title_pattern = /Kingdoms of Amalur: Re-Reckoning/
    title_count = changed.scan(title_pattern).length
    changed.gsub!(title_pattern, KOREAN)

    localized_pattern =
      /(?:킹덤(?:스)?\s*오브\s*)?(?:아말루르|아말러)(?:\s*왕국)?\s*[:：]?\s*리-?레코닝/
    localized_count = changed.scan(localized_pattern).length
    changed.gsub!(localized_pattern, KOREAN)

    raise "no game-title span found at #{id}" if title_count + localized_count == 0
    status = changed == text ? 'not-an-issue' : 'accepted'
    evidence = 'English explicitly names Kingdoms of Amalur: Re-Reckoning. Japanese preserves the official English title and Chinese supplies the localized title 阿玛拉王国：惩罚. The official Korean manual uses 킹덤 오브 아말러 레코닝 for the original game; standardize the remaster name as 킹덤 오브 아말러: 리레코닝(Kingdoms of Amalur: Re-Reckoning), preserving all formatting tokens and surrounding text.'
    [changed, status, evidence]
  end

  def run
    inventory = M.refresh_inventory
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    glossary = M.table(glossary_path)
    proposals = File.join(__dir__, 'proper-name-proposals-D20948.tsv')
    if glossary.any? { |row| row['entity_key'] == ENTITY }
      raise 'registered game title has no recovery proposal file' unless File.exist?(proposals)
      indexed_count = M.table(M::INDEX).count { |row| row['entity_key'] == ENTITY }
      raise "partial game-title registration has #{indexed_count} index keys, expected 33" unless
        indexed_count == 33
      return M.run(proposals, 20_948, nil)
    end

    generated = build_occurrences(inventory.values, [DEFINITION]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end.select { |row| row['resource'] == 'default' }
    raise "expected 33 game-title source keys, got #{generated.length}" unless generated.length == 33
    raise 'required source title is missing' unless
      generated.all? { |row| row['matched_english'] == TITLE }

    reviews = generated.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      new_text, status, evidence = transform(source.fetch('work_text'), key[1])
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => source.fetch('work_text'),
        'new' => new_text,
        'evidence' => evidence,
        'english' => english.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end.sort_by { |row| row['ID_Linha'].to_i }
    raise 'unexpected legal/logo exclusions' unless
      reviews.select { |row| row['status'] == 'excluded' }.map { |row| row['ID_Linha'] }.sort ==
      EXCLUDED.keys.sort

    index_path = M::INDEX
    index = M.table(index_path)
    existing_keys = index.map { |row| [row['entity_key'], *M.key(row)] }
    raise 'game-title candidate key already indexed' if
      reviews.any? { |row| existing_keys.include?([ENTITY, *M.key(row)]) }

    M.write_table(glossary_path, glossary.headers, glossary.map(&:to_h) + [DEFINITION])
    rows = index.map(&:to_h)
    rows.concat(generated)
    rows.sort_by! do |row|
      [row['resource'], row['ID_Linha'].to_i, row['Tipo_Variante'].to_s, row['entity_key']]
    end
    M.write_table(index_path, index.headers, rows)

    M.write_table(proposals, M::HEADERS, reviews)
    M.run(proposals, 20_948, nil)
    puts "D-20948 registered #{ENTITY}; reviewed #{reviews.length} source keys; exclusions=#{EXCLUDED.keys.join(',')}."
  end
end

AmalurTitleD20948.run if $PROGRAM_NAME == __FILE__
