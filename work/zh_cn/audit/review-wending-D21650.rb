#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module ReviewWendingD21650
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_650
  ENTITY = 'place:wending'
  TARGET_IDS = %w[
    2153 6817 9264 11753 14898 16247 17692 18113 18945 19280
    20279 21456 23712 29186 30867 31314 34767 36774 37211
    21611 41201 41864
  ].freeze
  EXCLUDED_KEYS = [
    ['base', '4224', '11'],
    ['default', '25028', ''],
    ['default', '44400', '']
  ].freeze
  EXPECTED_KEYS = (
    TARGET_IDS.map { |id| ['default', id, ''] } + EXCLUDED_KEYS
  ).sort.freeze
  NAME_SPAN = /(?:웬딩|윈딩)(?:\((?:The )?Wending\))?/
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:30867 explicitly identifies the Wending as the poor
    district of Rathir, extending into carved tunnels. The other reviewed
    rows refer to its residents, streets, location, and exact standalone
    label. Japanese ウェンディング and Chinese 前行之地 corroborate the
    location. Use 웬딩(Wending) in prose and retain The only on exact
    standalone source labels. Exclude default:25028's ordinary lower-case
    wending path and the separately registered atomic Wending House labels
    at base:4224:11 and default:44400. D-18695's translation-quality finding
    for default:23712 remains historical; this entity-specific pass adds the
    required bilingual place label without recounting prior global review
    totals. Do not infer a faction or merge Wending House with the place.
  TEXT

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def definition(headers)
    values = {
      'entity_key' => ENTITY,
      'english_canonical' => 'Wending',
      'category' => 'place',
      'korean_canonical' => '웬딩(Wending)',
      'english_aliases' => 'The Wending',
      'korean_variants' =>
        '웬딩|웬딩(Wending)|웬딩(The Wending)|윈딩|윈딩(Wending)',
      'evidence_ids' => "D-#{D}|default:30867|default:19280|default:20279|default:23712",
      'status' => 'confirmed',
      'notes' => NOTE
    }
    headers.to_h { |header| [header, values.fetch(header, '')] }
  end

  def normalize(source, old)
    row_key = key(source)
    return old if EXCLUDED_KEYS.include?(row_key)

    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n").strip
    if row_key == ['default', '23712', '']
      raise 'expected standalone Wending label missing at default:23712' unless old == '웬딩'
      return '웬딩(The Wending)'
    end
    if row_key == ['default', '41201', '']
      from = '굽이길 너머에 있어'
      to = '웬딩(Wending)을 막 벗어난 곳에 있어'
      raise 'expected untranslated Wending clause missing at default:41201' unless
        old.scan(from).length == 1
      return old.sub(from, to)
    end

    matches = old.scan(NAME_SPAN)
    raise "Wending Korean span count differs at #{row_key.inspect}" unless matches.length == 1
    label = english == 'The Wending' ? '웬딩(The Wending)' : '웬딩(Wending)'
    old.sub(NAME_SPAN, label)
  end

  def prepare
    inventory = M.refresh_inventory
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    entity_definition = definition(glossary.headers)
    generated = build_occurrences(inventory.values, [entity_definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    actual = generated.map { |row| key(row) }.sort
    raise "Wending source scope differs: #{actual.inspect}" unless actual == EXPECTED_KEYS

    reviews = generated.map do |match|
      source = inventory.fetch(key(match))
      old = source.fetch('work_text')
      revised = normalize(source, old)
      status = if EXCLUDED_KEYS.include?(key(match))
                 'excluded'
               elsif revised == old
                 'not-an-issue'
               else
                 'accepted'
               end
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      {
        'resource' => match.fetch('resource'),
        'ID_Linha' => match.fetch('ID_Linha'),
        'Tipo_Variante' => match.fetch('Tipo_Variante'),
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => revised,
        'evidence' => NOTE,
        'english' => english,
        'japanese' => japanese,
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }

    R.validate!([entity_definition], reviews, generated,
                glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row.fetch('resource') }.each do |resource, rows|
      changed = rows.select { |row| row['old'] != row['new'] }
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), changed) unless changed.empty?
    end
    puts "D-#{D}: Wending; #{reviews.length} source keys; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} Texto edits; " \
         "#{generated.length} entity/key occurrences."
    reviews.each do |row|
      next if row['old'] == row['new']
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new'))
    end
    [entity_definition, reviews]
  end

  def apply
    entity_definition, reviews = prepare
    definitions_path = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
    review_path = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
    raise "D-#{D} manifests already exist" if
      File.exist?(definitions_path) || File.exist?(review_path)
    M.write_table(definitions_path, M.table(R::GLOSSARY).headers, [entity_definition])
    M.write_table(review_path, M::HEADERS.take(12), reviews)
    R.run([definitions_path, review_path, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewWendingD21650.prepare
  when ['apply'] then ReviewWendingD21650.apply
  else abort 'usage: review-wending-D21650.rb [prepare|apply]'
  end
end
