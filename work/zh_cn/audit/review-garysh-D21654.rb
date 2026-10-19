#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module ReviewGaryshD21654
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_654
  ENTITY = 'person:garysh'
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English identifies Garysh as a person in two exact Private Garysh labels
    and in the Faelands permit dialogue. Japanese 兵卒ギャリッシュ and
    Chinese 列兵加里什 corroborate the same English-led name. Use 게리시(Garysh)
    for the personal name. At default:11517, preserve D-3363's separate
    uncertainty about translating the Private rank; the Faelands entity
    disposition from D-20956 is unchanged. Do not infer additional biography.
  TEXT

  SPECS = {
    ['default', '11517', ''] => {
      english: "The army's looking to tighten security all across the Faelands. If you're looking for region permits, check with Private Garysh.",
      japanese: '軍はフェイランド全域の防備を固めようとしています。通行証が必要なら、兵卒ギャリッシュと話してください',
      chinese: '军队计划加强灵族大陆的安保措施。要是你需要地区通行证的话，可以去找列兵加里什。',
      old: '군대는 패란즈(Faelands) 전역의 경비를 강화하려 해. 지역 통행증이 필요하면 게리시(Garysh) 일병에게 물어봐.',
      new: '군대는 패란즈(Faelands) 전역의 경비를 강화하려 해. 지역 통행증이 필요하면 게리시(Garysh) 일병에게 물어봐.'
    },
    ['default', '23479', ''] => {
      english: 'Private Garysh',
      japanese: '兵卒ギャリッシュ',
      chinese: '列兵加里什',
      old: '게리시 이병(Private Garysh)',
      new: '게리시(Garysh) 이병(Private)'
    },
    ['default', '32236', ''] => {
      english: 'Private Garysh',
      japanese: '兵卒ギャリッシュ',
      chinese: '列兵加里什',
      old: '일병 개리시',
      new: '일병 게리시(Garysh)'
    }
  }.freeze

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def definition(headers)
    values = {
      'entity_key' => ENTITY,
      'english_canonical' => 'Garysh',
      'category' => 'person',
      'korean_canonical' => '게리시(Garysh)',
      'english_aliases' => '',
      'korean_variants' => '개리시|게리시',
      'evidence_ids' => (["D-#{D}"] + SPECS.keys.map { |k| k.reject(&:empty?).join(':') }).join('|'),
      'status' => 'confirmed',
      'notes' => NOTE
    }
    headers.to_h { |header| [header, values.fetch(header, '')] }
  end

  def prepare
    inventory = M.refresh_inventory
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    raise 'Garysh already registered' if glossary.any? { |row| row['entity_key'] == ENTITY }
    entity_definition = definition(glossary.headers)
    generated = build_occurrences(inventory.values, [entity_definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = SPECS.keys.sort
    actual = generated.map { |row| key(row) }.sort
    raise "Garysh source scope differs: #{actual.inspect}" unless actual == expected

    reviews = generated.map do |match|
      row_key = key(match)
      source = inventory.fetch(row_key)
      spec = SPECS.fetch(row_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      raise "English changed at #{row_key.inspect}" unless english == spec.fetch(:english)
      raise "Japanese changed at #{row_key.inspect}" unless japanese == spec.fetch(:japanese)
      raise "Chinese changed at #{row_key.inspect}" unless chinese == spec.fetch(:chinese)
      raise "Korean changed at #{row_key.inspect}" unless old == spec.fetch(:old)
      raise "existing Garysh occurrence at #{row_key.inspect}" if
        index.any? { |row| row['entity_key'] == ENTITY && key(row) == row_key }

      status = spec.fetch(:new) == old ? 'not-an-issue' : 'accepted'
      {
        'resource' => row_key[0],
        'ID_Linha' => row_key[1],
        'Tipo_Variante' => row_key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => spec.fetch(:new),
        'evidence' => NOTE,
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }

    R.validate!([entity_definition], reviews, generated,
                glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row.fetch('resource') }.each do |resource, rows|
      edits = rows.select { |row| row['old'] != row['new'] }
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits) unless edits.empty?
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
  when [], ['prepare']
    definition, reviews = ReviewGaryshD21654.prepare
    puts "D-21654: #{definition.fetch('entity_key')}; #{reviews.length} source keys; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} Texto edits."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new'))
    end
  when ['apply']
    ReviewGaryshD21654.apply
  else
    abort 'usage: review-garysh-D21654.rb [prepare|apply]'
  end
end
