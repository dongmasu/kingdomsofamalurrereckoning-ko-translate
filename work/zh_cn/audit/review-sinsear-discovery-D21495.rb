#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module SinsearDiscoveryD21495
  extend self

  M = ReviewedNameBatches
  D = 21_495
  ENTITY = 'place:sinsear'
  ENGLISH = 'Sinsear'
  KOREAN = '신시어(Sinsear)'
  IDS = %w[
    base:3822:11
    default:2008: default:2091: default:3278: default:3645: default:3981:
    default:4842: default:5200: default:14542: default:14576: default:14702:
    default:17697: default:20193: default:22055: default:25077: default:25171:
    default:26251: default:27280: default:28710: default:33338: default:34291:
    default:34690: default:39474: default:40242: default:40724: default:41434:
    default:42623: default:43083: default:43404: default:43585: default:43926:
    default:45143: default:50049: default:54886: default:55150: default:63068:
    default:63204:
  ].freeze
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")

  SHARED_EVIDENCE = 'English identifies Sinsear as a named ancient place in Klurikon and as a Hollow; aligned Japanese and Chinese refer to the same location. Register only Sinsear as a place. Do not infer a separate Sinsear Hollow alias or merge the Weeping King, House of Sorrows, Hollow, Crying Eyes, or Sorrows entries. No source edit or historical translation recount.'

  def definition(headers)
    values = {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'category' => 'place',
      'korean_canonical' => KOREAN,
      'english_aliases' => '',
      'korean_variants' => '신세어|신세어(Sinsear)|신시어',
      'evidence_ids' => "D-#{D}|default:55150|default:63068|base:3822:11",
      'status' => 'confirmed',
      'notes' => 'English default:55150 explicitly identifies Sinsear as an ancient place in Klurikon and calls it a Hollow; default:63068 locates it in southern Klurikon and names the Hollow of the Weeping King. Aligned Japanese シンシアー and Chinese 业火之地 corroborate the same location across the exact rows. Register only place:sinsear with canonical 신시어(Sinsear); retain Hollow, the Weeping King, House of Sorrows, Crying Eyes, and Sorrows as separate existing terms. Do not add a global short-name alias or historical translation recount.'
    }
    headers.to_h { |header| [header, values.fetch(header, '')] }
  end

  def normalize(text)
    text.gsub(/신세어(?:\(Sinsear\))?/, KOREAN)
        .gsub(/신시어(?!\(Sinsear\))/, KOREAN)
  end

  def expected_pairs
    IDS.map do |entry|
      resource, id, variant = entry.split(':', 3)
      [resource, id, variant.to_s]
    end
  end

  def reviews_for(inventory, generated)
    actual_pairs = generated.map { |row| M.key(row) }
    raise 'Sinsear exact source scope differs' unless actual_pairs.sort == expected_pairs.sort

    generated.sort_by { |row| [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i, row['Tipo_Variante'].to_s] }.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      korean = source.fetch('work_text')
      raise "English Sinsear evidence differs #{key.inspect}" unless
        english.match?(/(?<![A-Za-z0-9_])Sinsear(?![A-Za-z0-9_])/)

      new_text = normalize(korean)
      status = new_text == korean ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => korean,
        'new' => new_text,
        'evidence' => "English names the exact place Sinsear; Japanese and Chinese corroborate the aligned location. Reuse 신시어(Sinsear), correcting only the source-matched name span, including the local 신세어 misspelling. Preserve separate Hollow and Weeping King terms, all other wording, tokens, particles, punctuation, and line breaks. #{SHARED_EVIDENCE}",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
  end

  def prepare
    glossary_table = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    raise 'Sinsear entity already registered' if
      glossary.any? { |row| row.fetch('entity_key') == ENTITY }
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'discovery outputs already exist' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    definition_row = definition(glossary_table.headers)
    generated = build_occurrences(inventory.values, [definition_row]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    index = M.table(M::INDEX).map(&:to_h)
    reviews = reviews_for(inventory, generated)
    ReviewedProperNameDiscovery.validate!(
      [definition_row], reviews, generated, glossary, index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)

    puts "Prepared D-#{D}: #{reviews.length} exact Sinsear keys; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} Korean edits."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'Tipo_Variante', 'status', 'old', 'new'))
    end
    [definition_row, reviews]
  end

  def append_detail(path, section)
    text = File.read(path)
    return if text.include?('### D-21495: Sinsear')

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
    definition_row, reviews = prepare
    M.write_table(DEFINITIONS, prior_glossary.headers, [definition_row])
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])

    final_index = M.table(M::INDEX).map(&:to_h)
    final_records = final_index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    prior_records.each do |key, record|
      raise "prior occurrence changed #{key.inspect}" unless final_records[key] == record
    end
    raise 'unexpected occurrence additions' unless
      (final_records.keys - prior_records.keys).sort ==
        expected_pairs.map { |key| [ENTITY, *key] }.sort
    final_glossary = M.table(glossary_path).map(&:to_h)
    raise 'prior glossary records changed' unless
      final_glossary == prior_glossary.map(&:to_h) + [definition_row]

    detail = <<~TEXT.chomp
      ### D-21495: Sinsear

      Registered `place:sinsear` as `신시어(Sinsear)` after reviewing all
      #{expected_pairs.length} exact source keys across `base` and `default`.
      English default:55150 calls it an ancient place in Klurikon and a Hollow;
      default:63068 places it in southern Klurikon and identifies it as the
      Hollow of the Weeping King. Aligned Japanese シンシアー and Chinese
      业火之地 corroborate the same place. The established spelling was applied
      only to these exact Sinsear source rows, including correction of
      `신세어(Sinsear)`. Other entities and historical totals were not reopened.
    TEXT
    [File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
     File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")].each do |path|
      File.open(path, 'a') { |file| file.write("\n\n#{detail}\n") }
    end
    M::DOCS.each { |path| append_detail(path, detail) }
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-sinsear-discovery-D21495.rb [prepare|apply]' if ARGV.length > 1
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then SinsearDiscoveryD21495.prepare
  when 'apply' then SinsearDiscoveryD21495.apply
  else abort 'usage: review-sinsear-discovery-D21495.rb [prepare|apply]'
  end
end
