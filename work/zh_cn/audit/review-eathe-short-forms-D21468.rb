#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module EatheShortFormsD21468
  extend self
  M = ReviewedNameBatches
  D = 21_468
  PERSON = 'person:eathe-dunbert'
  REVIEW = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  SPECS = {
    ['base', '407', '11'] => [],
    ['default', '5617', ''] => [['이드(Eathe)', '이스(Eathe)']],
    ['default', '5794', ''] => [['이드(Eathe)', '이스(Eathe)']],
    ['default', '5823', ''] => [['이드의', '이스(Eathe)의']],
    ['default', '8897', ''] => [['이시(Eathe)', '이스(Eathe)'], ['이시와', '이스와']],
    ['default', '31387', ''] => [['도적 이스를', '도적 이스(Eathe)를']],
    ['default', '31683', ''] => [['이스를', '이스(Eathe)를']],
    ['default', '35865', ''] => [['이서가', '이스(Eathe)가']],
    ['default', '37779', ''] => [['이드는', '이스(Eathe)는'], ['블랙 이드라고', '블랙 이스(Black Eathe)라고']],
    ['default', '55119', ''] => [['에이시(Eathe)', '이스(Eathe)']],
    ['default', '58027', ''] => [['에이시가', '이스(Eathe)가']],
    ['default', '62105', ''] => [['이세 덤버트(Eathe Dumbert)', '이스 던버트(Eathe Dumbert)']],
    ['default', '65120', ''] => [['이스와', '이스(Eathe)와']]
  }.freeze
  NOTE = 'English full-name default:55470 identifies Eathe Dunbert as the Red Marches rogue seeking revenge against Belen\'s Testament through the cistern in the Tomb of Fyragnos; default:50790 and the alternative companion-choice journals connect the short Eathe to that same person. Japanese イース and Chinese 伊瑟 corroborate. Reuse the established 이스 stem, pair only locally written English names, and preserve Korean pronoun-expansion mentions without inventing English references. Exact row-scoped short form; no global Eathe/Black Eathe/Dumbert alias or family identity is added. Preserve all other names, wording, tokens, line breaks and historical decisions.'

  def normalize(text, key)
    SPECS.fetch(key).reduce(text) do |value, (old, new)|
      next value if value.include?(new)
      raise "Korean Eathe span differs #{key.inspect}: #{old}" unless value.scan(old).length == 1
      value.sub(old, new)
    end
  end

  def build_reviews(inventory, index)
    previous = index.select { |row| row['entity_key'] == PERSON }.map { |row| M.key(row) }
    candidates = inventory.values.select do |row|
      JSON.parse(row.fetch('en_texts_json')).compact.any? { |text| text.match?(/\bEathe\b/i) }
    end.reject { |row| previous.include?(M.key(row)) }
    raise 'Eathe source scope differs' unless candidates.map { |row| M.key(row) }.sort == SPECS.keys.sort
    candidates.map do |source|
      key = M.key(source)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "Eathe cross-locale evidence differs #{key.inspect}" unless
        japanese.include?('イース') && chinese.include?('伊瑟')
      old = source.fetch('work_text')
      proposed = normalize(old, key)
      raise 'Eathe normalization not idempotent' unless normalize(proposed, key) == proposed
      status = key[0] == 'base' ? 'excluded' : (old == proposed ? 'not-an-issue' : 'accepted')
      detail = if key[0] == 'base'
                 ' Eathe Doll is an independently named item. Its possessive Japanese and Chinese label do not establish the person identity; exclude only this person-candidate link and retain the item text unchanged.'
               elsif key[1] == '62105'
                 ' English label spells the surname Dumbert, unlike seven Dunbert rows. Japanese イース・ダンバート and Chinese 伊瑟·顿伯特 exactly match the established full-name labels. Normalize only the Korean name to 이스 던버트 while retaining this row\'s literal English Eathe Dumbert in parentheses; do not change the source or register the spelling globally.'
               else
                 ' The Black Eathe self-introduction is paired in its complete local nickname form, not nested as a separate person.'
               end
      raise 'Eathe changed opaque tokens or line endings' unless
        old.scan(ReviewedProperNameDiscovery::OPAQUE) == proposed.scan(ReviewedProperNameDiscovery::OPAQUE) &&
        old.scan(/\r\n|\r|\n/) == proposed.scan(/\r\n|\r|\n/)
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => PERSON, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => NOTE + detail, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese, 'entity_dispositions_json' => JSON.generate(PERSON => status)
      }
    end.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
  end

  def run
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    person = glossary.find { |row| row['entity_key'] == PERSON }
    raise 'Eathe canonical differs' unless person &&
      person['korean_canonical'] == '이스 던버트(Eathe Dunbert)' && person['english_aliases'].to_s.empty?
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    reviews = build_reviews(inventory, index)
    raise 'Eathe reviewed counts differ' unless reviews.group_by { |row| row['status'] }.transform_values(&:length) ==
      { 'excluded' => 1, 'accepted' => 12 }
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    edits = reviews.select { |row| row['old'] != row['new'] }
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), edits)
    new_rows = reviews.map do |row|
      {
        'entity_key' => PERSON, 'resource' => row['resource'], 'ID_Linha' => row['ID_Linha'],
        'Tipo_Variante' => row['Tipo_Variante'], 'matched_english' => row['ID_Linha'] == '62105' ? 'Eathe Dumbert' : 'Eathe',
        'english_source' => row['english'], 'korean_current' => row['old'],
        'status' => 'needs-context', 'evidence' => 'Candidate hit from English; exact row identity reviewed before application.'
      }
    end
    M.write_table(REVIEW, M::HEADERS.take(12), reviews)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + new_rows)
    M.run(REVIEW, D, 1)
    final = M.table(M::INDEX).to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    index.each do |row|
      raise 'prior Eathe-run disposition changed' unless
        row.to_h.reject { |field, _| field == 'korean_current' } ==
          final.fetch([row['entity_key'], *M.key(row)]).reject { |field, _| field == 'korean_current' }
    end
    raise 'Eathe glossary or aliases changed' unless M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h) == glossary
  end
end

EatheShortFormsD21468.run if $PROGRAM_NAME == __FILE__
