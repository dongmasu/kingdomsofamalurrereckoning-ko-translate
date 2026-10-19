#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module ReviewHorsaTreodicD21653
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_653
  ENTITY = 'person:horsa-treodic'
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English names Horsa Treodic in the grave label and explicitly identifies
    her and her unborn child in the epitaph, confirming a person rather than
    merely a place/title substring. Japanese ホーサ・トレオディック and
    Chinese 霍萨·特雷欧迪克/霍萨·崔欧蒂克 corroborate the same English-led
    name; retain the established Korean 호르사 트레오딕. Pair the exact full
    personal name at each source occurrence. Horsa Treodic is distinct from
    the separately registered Horsa Bynothas; no relationship is inferred.
    Preserve the existing organization:motus-mining and place:snaketail-river
    dispositions at default:49509 without recounting them.
  TEXT

  SPECS = {
    ['base', '2056', '11'] => {
      english: 'Grave of Horsa Treodic',
      japanese: 'ホーサ・トレオディックの墓',
      chinese: '霍萨·特雷欧迪克之墓',
      old: '호르사 트레오딕(Horsa Treodic)의 무덤',
      new: '호르사 트레오딕(Horsa Treodic)의 무덤'
    },
    ['default', '42929', ''] => {
      english: 'Grave of Horsa Treodic',
      japanese: 'ホーサ・トレオディックの墓',
      chinese: '霍萨·特雷欧迪克之墓',
      old: '호르사 트레오딕의 무덤',
      new: '호르사 트레오딕(Horsa Treodic)의 무덤'
    },
    ['default', '49509', ''] => {
      english: 'Here rests Horsa Treodic and her unborn child, victims of the poisonous Snaketail River. Damn you, Motus!',
      japanese: 'スネークテイル川の毒の犠牲になったホーサ・トレオディック、お腹の中の我が子と共にここに眠る。モータスのクソどもめ！',
      chinese: '霍萨·崔欧蒂克与她未出世的孩子在这里安息，他们是蛇尾河投毒案的受害者。该死的莫图斯！',
      old: '독이 든 스네이크테일 강(Snaketail River)의 희생자 호르사 트레오딕과 태어나지 못한 아이가 여기 잠들다. 모투스(Motus), 저주받을 놈들!',
      new: '독이 든 스네이크테일 강(Snaketail River)의 희생자 호르사 트레오딕(Horsa Treodic)과 태어나지 못한 아이가 여기 잠들다. 모투스(Motus), 저주받을 놈들!'
    }
  }.freeze

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def definition(headers)
    values = {
      'entity_key' => ENTITY,
      'english_canonical' => 'Horsa Treodic',
      'category' => 'person',
      'korean_canonical' => '호르사 트레오딕(Horsa Treodic)',
      'english_aliases' => '',
      'korean_variants' => '호르사 트레오딕',
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
    raise 'Horsa Treodic already registered' if
      glossary.any? { |row| row['entity_key'] == ENTITY }
    existing_person = glossary.find { |row| row['entity_key'] == 'person:horsa-bynothas' }
    raise 'separate Horsa Bynothas glossary entry changed' unless
      existing_person && existing_person['english_canonical'] == 'Horsa Bynothas'

    entity_definition = definition(glossary.headers)
    generated = build_occurrences(inventory.values, [entity_definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = SPECS.keys.sort
    actual = generated.map { |row| key(row) }.sort
    raise "Horsa Treodic source scope differs: #{actual.inspect}" unless actual == expected

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
      raise "existing Horsa occurrence at #{row_key.inspect}" if
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
    definition, reviews = ReviewHorsaTreodicD21653.prepare
    puts "D-21653: #{definition.fetch('entity_key')}; #{reviews.length} source keys; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} Texto edits."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new'))
    end
  when ['apply']
    ReviewHorsaTreodicD21653.apply
  else
    abort 'usage: review-horsa-treodic-D21653.rb [prepare|apply]'
  end
end
