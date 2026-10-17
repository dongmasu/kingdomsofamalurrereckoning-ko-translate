#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module KhleranAergaseD21496
  extend self

  M = ReviewedNameBatches
  D = 21_496
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  SHARED = 'English is the identity anchor; aligned Japanese and Chinese corroborate through transliteration or preserved English name labels. No global short-name alias, inferred biography, source edit, or historical translation recount. Preserve unrelated names, wording, tokens, punctuation, particles, and line breaks.'
  ENTITIES = {
    'person:khleran' => {
      'english' => 'Khleran',
      'korean' => '클레란(Khleran)',
      'category' => 'person',
      'korean_variants' => '클레란|마녀 기사 클레란|마녀기사 클레란',
      'ids' => %w[
        1631 18204 21938 22550 26929 29888 31424 32159 32988 38241 39410
        53592 55409 56951 5835 58815 61040 62187 62893 63526 7492 9332 9468
      ],
      'extra_keys' => [
        ['base', '767', '11'],
        ['base', '4447', '11'],
        ['default', '46078', '']
      ],
      'japanese' => /クレラン/,
      'chinese' => /(?:克)?勒兰/,
      'note' => 'English default:21938 explicitly identifies the individual as the Witch Knight Khleran and locates him in Ghennig; the repeated objectives identify the same target. English base:767 and base:4447 name Khleran in the Sceptre and Key entries, and default:46078 names his tower. Aligned Japanese クレラン and Chinese 克勒兰 corroborate. Normalize only the personal name to 클레란(Khleran). Preserve the already-complete Witch Knight Khleran label atomically; do not add a global role/title alias.'
    },
    'person:aergase' => {
      'english' => 'Aergase',
      'korean' => '에어가스(Aergase)',
      'category' => 'person',
      'korean_variants' => '에어가세|아에르가세|에르가세|에르가스|에어가스',
      'ids' => %w[
        20691 21124 25846 31391 3267 33419 45470 48329 49579 58154 64033
        8649 9498
      ],
      'extra_keys' => [
        ['default', '26883', '']
      ],
      'japanese' => /エアガス/,
      'chinese' => /埃尔加瑟/,
      'note' => 'English default:21124 identifies Aergase as the Lord of the Hunt’s Herald; default:64033 and default:9498 give the complete role label Aergase, Hunting Herald; default:26883 independently names Aergase in a body-search objective. Aligned Japanese エアガス and Chinese 埃尔加瑟 corroborate. Standardize the personal name as 에어가스(Aergase), correcting only source-matched variants. Preserve the complete Hunting Herald title atomically and add no global role alias.'
    }
  }.freeze

  def source_keys(values)
    values.fetch('ids').map { |id| ['default', id, ''] } +
      values.fetch('extra_keys', [])
  end

  def definition(entity_key, values, headers)
    evidence_ids = source_keys(values).map do |resource, id, variant|
      [resource, id, variant].reject(&:empty?).join(':')
    end
    fields = {
      'entity_key' => entity_key,
      'english_canonical' => values.fetch('english'),
      'category' => values.fetch('category'),
      'korean_canonical' => values.fetch('korean'),
      'english_aliases' => '',
      'korean_variants' => values.fetch('korean_variants'),
      'evidence_ids' => "D-#{D}|#{evidence_ids.join('|')}",
      'status' => 'confirmed',
      'notes' => values.fetch('note')
    }
    headers.to_h { |header| [header, fields.fetch(header, '')] }
  end

  def definitions(headers)
    ENTITIES.map { |entity, values| definition(entity, values, headers) }
  end

  def expected_pairs
    ENTITIES.flat_map do |entity, values|
      source_keys(values).map { |key| [entity, *key] }
    end
  end

  def normalize(entity_key, text)
    case entity_key
    when 'person:khleran'
      text.gsub(/클레란(?!\([^)]*(?:Khleran|Witch Knight Khleran)[^)]*\))/, '클레란(Khleran)')
    when 'person:aergase'
      text.gsub(/(?:아에르가세|에어가세|에르가세|에르가스)(?:\(Aergase\))?/, '에어가스(Aergase)')
          .gsub(/에어가스(?!\([^)]*(?:Aergase|Aergase, Hunting Herald)[^)]*\))/, '에어가스(Aergase)')
    else
      raise "unknown entity #{entity_key}"
    end
  end

  def locale_name_match?(text, pattern, english)
    literal_english = /(?<![A-Za-z0-9_])#{Regexp.escape(english)}(?![A-Za-z0-9_])/i
    text.match?(pattern) || text.match?(literal_english)
  end

  def reviews_for(inventory, generated)
    actual_pairs = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Khleran/Aergase exact source scope differs' unless
      actual_pairs.sort == expected_pairs.sort

    generated.sort_by do |row|
      [row.fetch('entity_key'), M::RESOURCES.index(row.fetch('resource')),
       row.fetch('ID_Linha').to_i, row['Tipo_Variante'].to_s]
    end.map do |occurrence|
      key = M.key(occurrence)
      entity_key = occurrence.fetch('entity_key')
      values = ENTITIES.fetch(entity_key)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      korean = source.fetch('work_text')
      raise "English name evidence differs #{entity_key} #{key.inspect}" unless
        english.match?(/(?<![A-Za-z0-9_])#{Regexp.escape(values.fetch('english'))}(?![A-Za-z0-9_])/)
      raise "Japanese corroboration differs #{entity_key} #{key.inspect}" unless
        locale_name_match?(japanese, values.fetch('japanese'), values.fetch('english'))
      raise "Chinese corroboration differs #{entity_key} #{key.inspect}" unless
        locale_name_match?(chinese, values.fetch('chinese'), values.fetch('english'))

      new_text = normalize(entity_key, korean)
      status = new_text == korean ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity_key, 'status' => status, 'old' => korean,
        'new' => new_text,
        'evidence' => "#{values.fetch('note')} #{SHARED}",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(entity_key => status)
      }
    end
  end

  def prepare
    glossary_table = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    registered = glossary.map { |row| row.fetch('entity_key') }
    duplicate = ENTITIES.keys & registered
    raise "entity already registered #{duplicate.join(', ')}" unless duplicate.empty?
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'discovery outputs already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    new_definitions = definitions(glossary_table.headers)
    generated = build_occurrences(inventory.values, new_definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    index = M.table(M::INDEX).map(&:to_h)
    reviews = reviews_for(inventory, generated)
    ReviewedProperNameDiscovery.validate!(
      new_definitions, reviews, generated, glossary, index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)

    groups = reviews.group_by { |row| row.fetch('entity_key') }
    puts "Prepared D-#{D}: #{reviews.length} keys; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} Korean edits."
    groups.each do |entity, rows|
      puts "#{entity}: #{rows.length} keys; " \
           "#{rows.count { |row| row['old'] != row['new'] }} edits."
    end
    reviews.each do |row|
      puts JSON.generate(row.slice('entity_key', 'resource', 'ID_Linha', 'status', 'old', 'new'))
    end
    [new_definitions, reviews]
  end

  def append_detail(path, section)
    text = File.read(path)
    return if text.include?('### D-21496: Khleran and Aergase')

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
    new_definitions, reviews = prepare
    M.write_table(DEFINITIONS, prior_glossary.headers, new_definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])

    final_index = M.table(M::INDEX).map(&:to_h)
    final_records = final_index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    prior_records.each do |key, record|
      raise "prior occurrence changed #{key.inspect}" unless final_records[key] == record
    end
    expected_additions = expected_pairs
    raise 'unexpected occurrence additions' unless
      (final_records.keys - prior_records.keys).sort == expected_additions.sort
    final_glossary = M.table(glossary_path).map(&:to_h)
    raise 'prior glossary records changed' unless
      final_glossary == prior_glossary.map(&:to_h) + new_definitions

    detail = <<~TEXT.chomp
      ### D-21496: Khleran and Aergase

      Registered `person:khleran` as `클레란(Khleran)` and
      `person:aergase` as `에어가스(Aergase)`. Reviewed all 26 exact Khleran
      source keys and all 14 Aergase keys against English, aligned Japanese,
      Chinese, and current Korean. English identifies Khleran as the Witch
      Knight at default:21938; base:767 and base:4447 name his Sceptre and Key,
      and default:46078 names his tower. Default:21124 identifies Aergase as
      the Lord of the Hunt's Herald, while default:26883 names him in a
      body-search objective. Complete role labels remain atomic; no global
      short-name or role aliases, historical recount, or unrelated entity
      changes were added.
    TEXT
    [File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
     File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")].each do |path|
      File.open(path, 'a') { |file| file.write("\n\n#{detail}\n") }
    end
    M::DOCS.each { |path| append_detail(path, detail) }
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-khleran-aergase-D21496.rb [prepare|apply]' if ARGV.length > 1
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then KhleranAergaseD21496.prepare
  when 'apply' then KhleranAergaseD21496.apply
  else abort 'usage: review-khleran-aergase-D21496.rb [prepare|apply]'
  end
end
