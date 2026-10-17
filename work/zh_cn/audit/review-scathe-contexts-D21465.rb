#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module ScatheContextsD21465
  extend self

  M = ReviewedNameBatches
  D = 21_465
  PERSON = 'person:corialia-scathe'
  ITEM = 'item:scathe'
  PERSON_IDS = %w[27452 35226].freeze
  ITEM_KEY = ['base', '4596', '11'].freeze
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  ITEM_KO = '스케이스(Scathe)'
  NOTE = 'English and aligned Japanese/Chinese identify the two exact Mistress Scathe references as the already registered surgeon Corialia Scathe. ' \
         'Use the established 스케이스 spelling and preserve Mistress as the source-local title; no global Scathe person alias is added. ' \
         'The separate base:4596 item label Scathe is reviewed as item:scathe solely from its item-resource source; no link to the person is inferred. ' \
         'Preserve all other entity decisions, surrounding wording, particles, tokens, and line breaks.'

  ITEM_DEFINITION = {
    'entity_key' => ITEM, 'english_canonical' => 'Scathe', 'category' => 'item',
    'korean_canonical' => ITEM_KO, 'english_aliases' => '',
    'korean_variants' => ITEM_KO,
    'evidence_ids' => "D-#{D}|base:4596:11", 'status' => 'confirmed',
    'notes' => 'A standalone item-resource name, distinct from person:corialia-scathe. ' \
               'English is primary; aligned Japanese スケイズ and Chinese 斯卡瑟 corroborate the source rendering. ' \
               'No person/surname relationship, uniqueness tier, or global alias is inferred.'
  }.freeze

  def definitions_for(headers)
    [headers.to_h { |header| [header, ITEM_DEFINITION.fetch(header, '')] }]
  end

  def normalize(text, id)
    case id
    when '27452'
      raise 'Scathe row 27452 source drift' unless
        text.include?('스케이스 여사(Mistress Scathe)')
      text
    when '35226'
      old = '스케이스 여의사는'
      new = '스케이스 여사(Mistress Scathe)는'
      return text if text.scan(new).length == 1
      raise 'Scathe row 35226 source drift' unless text.scan(old).length == 1
      text.sub(old, new)
    when '4596'
      raise 'Scathe item label drift' unless text == ITEM_KO
      text
    else
      raise "unreviewed Scathe key #{id}"
    end
  end

  def source_texts(source)
    [
      JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
      JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
      source.fetch('zh_text')
    ]
  end

  def build_reviews(inventory, person_matches, item_match)
    person_rows = person_matches.select do |row|
      M.key(row)[0] == 'default' && PERSON_IDS.include?(M.key(row)[1])
    end
    raise 'row-scoped Mistress Scathe coverage differs' unless
      person_rows.map { |row| M.key(row) }.sort ==
        PERSON_IDS.map { |id| ['default', id, ''] }.sort
    raise 'Scathe item source scope differs' unless M.key(item_match) == ITEM_KEY

    target_rows = person_rows + [item_match]
    target_rows.sort_by { |row| [M::RESOURCES.index(M.key(row)[0]), M.key(row)[1].to_i] }.map do |match|
      key = M.key(match)
      id = key[1]
      entity = id == '4596' ? ITEM : PERSON
      source = inventory.fetch(key)
      english, japanese, chinese = source_texts(source)
      if entity == PERSON
        raise "Corialia short-name source differs #{key.inspect}" unless
          english.include?('Mistress Scathe') &&
          japanese.include?('スケイズ女史') && chinese.include?('斯卡') &&
          !english.include?('Corialia Scathe')
      else
        raise 'standalone Scathe item evidence differs' unless
          english == 'Scathe' && japanese == 'スケイズ' && chinese == '斯卡瑟'
      end
      old = source.fetch('work_text')
      proposed = normalize(old, id)
      raise 'Scathe cell normalization not idempotent' unless normalize(proposed, id) == proposed
      raise 'Scathe changed opaque tokens or line endings' unless
        old.scan(ReviewedProperNameDiscovery::OPAQUE) == proposed.scan(ReviewedProperNameDiscovery::OPAQUE) &&
        old.scan(/\r\n|\r|\n/) == proposed.scan(/\r\n|\r|\n/)
      status = old == proposed ? 'not-an-issue' : 'accepted'
      evidence = if entity == PERSON
                   "#{NOTE} This exact title-form reference belongs to the surgeon already established by full-name rows."
                 else
                   "#{NOTE} The item entry is independent of the person entry despite sharing the English word Scathe."
                 end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => evidence, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese, 'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'D-21465 outputs already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    person_definition = glossary.find { |row| row['entity_key'] == PERSON }
    raise 'existing Corialia Scathe glossary entry differs' unless
      person_definition && person_definition['english_canonical'] == 'Corialia Scathe' &&
      person_definition['english_aliases'].to_s.empty?
    raise 'Scathe item glossary entry already exists' if glossary.any? { |row| row['entity_key'] == ITEM }

    inventory = M.refresh_inventory
    temporary_person = person_definition.to_h.merge('english_aliases' => 'Mistress Scathe')
    person_matches = build_occurrences(inventory.values, [temporary_person]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    item_definition = definitions_for(glossary.headers).first
    item_matches = build_occurrences(inventory.values, [item_definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'Scathe term source scope differs' unless
      item_matches.map { |row| M.key(row) }.sort ==
        (person_matches.map { |row| M.key(row) } + [ITEM_KEY]).sort
    item_match = item_matches.find { |row| M.key(row) == ITEM_KEY }
    raise 'standalone Scathe item source missing' unless item_match
    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    indexed = index.to_h { |row| [[row['entity_key'], *M.key(row)], row] }
    person_keys = person_matches.map { |row| [PERSON, *M.key(row)] }
    existing_person_keys = person_keys.select { |key| indexed.key?(key) }
    raise 'pre-existing Corialia source scope differs' unless existing_person_keys.length == 19
    raise 'short Mistress Scathe keys already indexed' if
      (PERSON_IDS.map { |id| [PERSON, 'default', id, ''] } & indexed.keys).any?
    new_person_matches = person_matches.reject { |row| indexed.key?([PERSON, *M.key(row)]) }
    raise 'unexpected Corialia short-name matches' unless
      new_person_matches.map { |row| M.key(row) }.sort ==
        PERSON_IDS.map { |id| ['default', id, ''] }.sort
    raise 'Scathe item already indexed' if indexed.key?([ITEM, *ITEM_KEY])

    reviews = build_reviews(inventory, person_matches, item_match)
    raise 'D-21465 target row scope differs' unless reviews.length == 3
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.select { |row| row['old'] != row['new'] }.group_by { |row| row['resource'] }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    puts "Prepared D-#{D}: 2 row-scoped person keys and one separate item key; " \
         "#{reviews.count { |row| row['status'] == 'accepted' }} edit, " \
         "#{reviews.count { |row| row['status'] == 'not-an-issue' }} unchanged."
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'Tipo_Variante', 'entity_key', 'status', 'old', 'new')) }
    [glossary, index, item_definition, reviews]
  end

  def apply
    glossary, index, item_definition, reviews = prepare
    index_headers = M.table(M::INDEX).headers
    person = glossary.find { |row| row['entity_key'] == PERSON }.to_h
    updated_person = person.merge(
      'evidence_ids' => "#{person['evidence_ids']}|D-#{D}|default:27452|default:35226",
      'notes' => "#{person['notes']} D-#{D}: reviewed only the exact Mistress Scathe title rows; no global Scathe alias."
    )
    updated_glossary = glossary.map do |row|
      row['entity_key'] == PERSON ? updated_person : row.to_h
    end + [item_definition]
    new_index_rows = reviews.map do |review|
      {
        'entity_key' => review.fetch('entity_key'), 'resource' => review.fetch('resource'),
        'ID_Linha' => review.fetch('ID_Linha'), 'Tipo_Variante' => review.fetch('Tipo_Variante'),
        'matched_english' => review.fetch('entity_key') == PERSON ? 'Mistress Scathe' : 'Scathe',
        'english_source' => review.fetch('english'), 'korean_current' => review.fetch('old'),
        'status' => 'needs-context',
        'evidence' => 'Candidate hit from the English source; verify this occurrence in context.'
      }
    end
    target_keys = reviews.map { |review| [review.fetch('entity_key'), *M.key(review)] }.to_set
    previous_index = index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.to_h.reject { |field, _| field == 'korean_current' }]
    end.reject { |key, _| target_keys.include?(key) }
    M.write_table(DEFINITIONS, glossary.headers, [item_definition])
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    M.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers, updated_glossary)
    M.write_table(M::INDEX, index_headers, index + new_index_rows)
    M.run(REVIEWS, D, 1)
    final_index = M.table(M::INDEX).map(&:to_h)
    final_by_key = final_index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    previous_index.each do |key, row|
      raise "prior Scathe-overlap disposition changed #{key.inspect}" unless final_by_key[key] == row
    end
    final_glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    raise 'Scathe glossary edit differs' unless final_glossary == updated_glossary
    raise 'Corialia canonical or aliases changed' unless
      final_glossary.find { |row| row['entity_key'] == PERSON }.values_at(
        'english_canonical', 'korean_canonical', 'english_aliases'
      ) == person.values_at('english_canonical', 'korean_canonical', 'english_aliases')
    raise 'Scathe item definition missing' unless final_glossary.any? { |row| row['entity_key'] == ITEM }
  end

  def resume_partial_apply
    backup_dir = "/private/tmp/ko-translate-backups/#{M::RUN_DATE_COMPACT}/before-proper-name-D#{D}"
    raise 'D-21465 recovery outputs already exist' if
      [File.join(__dir__, "proper-name-edits-D#{D}.tsv"),
       File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
       File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
       backup_dir].any? { |path| File.exist?(path) } ||
      Dir.glob(File.join(__dir__, "named-scope-*-D#{D}-*.md")).any?

    definitions = M.table(DEFINITIONS).map(&:to_h)
    reviews = M.table(REVIEWS).map(&:to_h)
    raise 'partial D-21465 discovery definitions differ' unless
      definitions == [ITEM_DEFINITION]
    raise 'partial D-21465 review scope differs' unless
      reviews.map { |row| [row['entity_key'], *M.key(row)] }.sort ==
        [[ITEM, 'base', '4596', '11'], [PERSON, 'default', '27452', ''],
         [PERSON, 'default', '35226', '']].sort
    raise 'partial D-21465 review dispositions differ' unless
      reviews.map { |row| [row['entity_key'], *M.key(row), row['status']] }.sort ==
        [[ITEM, 'base', '4596', '11', 'not-an-issue'],
         [PERSON, 'default', '27452', '', 'not-an-issue'],
         [PERSON, 'default', '35226', '', 'accepted']].sort

    glossary_table = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    glossary = glossary_table.map(&:to_h)
    person_rows = glossary.select { |row| row['entity_key'] == PERSON }
    item_rows = glossary.select { |row| row['entity_key'] == ITEM }
    raise 'partial D-21465 person glossary update differs' unless
      person_rows.length == 1 &&
      person_rows.first.values_at('english_canonical', 'korean_canonical', 'english_aliases') ==
        ['Corialia Scathe', '코리알리아 스케이스(Corialia Scathe)', ''] &&
      person_rows.first.fetch('evidence_ids').scan("D-#{D}").length == 1 &&
      person_rows.first.fetch('notes').scan("D-#{D}").length == 1
    raise 'partial D-21465 item glossary update differs' unless item_rows == definitions

    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    target_keys = reviews.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    indexed_keys = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'partial D-21465 occurrence index already contains target rows' unless
      (target_keys & indexed_keys).empty?

    inventory = M.refresh_inventory
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.each do |review|
      source = inventory.fetch(M.key(review))
      raise "partial D-21465 Korean source differs #{M.key(review).inspect}" unless
        source.fetch('work_text') == review.fetch('old')
      raise "partial D-21465 text decision differs #{M.key(review).inspect}" unless
        normalize(review.fetch('old'), review.fetch('ID_Linha')) == review.fetch('new')
    end

    previous_index = index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)],
       row.reject { |field, _| field == 'korean_current' }]
    end
    new_index_rows = reviews.map do |review|
      {
        'entity_key' => review.fetch('entity_key'), 'resource' => review.fetch('resource'),
        'ID_Linha' => review.fetch('ID_Linha'), 'Tipo_Variante' => review.fetch('Tipo_Variante'),
        'matched_english' => review.fetch('entity_key') == PERSON ? 'Mistress Scathe' : 'Scathe',
        'english_source' => review.fetch('english'), 'korean_current' => review.fetch('old'),
        'status' => 'needs-context',
        'evidence' => 'Candidate hit from the English source; verify this occurrence in context.'
      }
    end
    M.write_table(M::INDEX, index_table.headers, index + new_index_rows)
    M.run(REVIEWS, D, 1)

    final_index = M.table(M::INDEX).map(&:to_h)
    final_by_key = final_index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)],
       row.reject { |field, _| field == 'korean_current' }]
    end
    previous_index.each do |key, row|
      raise "prior Scathe-overlap disposition changed #{key.inspect}" unless final_by_key[key] == row
    end
    final_glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    raise 'partial D-21465 glossary recovery differs' unless final_glossary == glossary
    raise 'D-21465 CSV backup missing or not byte-identical' unless
      File.binread(File.join(backup_dir, File.basename(M.csv_path('default')))) ==
        File.binread(M.csv_path('default')).sub(
          '스케이스 여사(Mistress Scathe)는 우리 수석 외과의야.'.b,
          '스케이스 여의사는 우리 수석 외과의야.'.b
        )
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then ScatheContextsD21465.prepare
  when 'apply' then ScatheContextsD21465.apply
  when 'resume' then ScatheContextsD21465.resume_partial_apply
  else abort 'usage: review-scathe-contexts-D21465.rb [prepare|apply|resume]'
  end
end
