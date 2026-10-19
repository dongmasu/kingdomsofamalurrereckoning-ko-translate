#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'

module PrepareHorrinoxMonsterResidualD21850
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_850
  ENTITY = 'monster:horrinox'
  DEFINITIONS = File.join(__dir__, 'proper-name-discovery-definitions-D21850.tsv')
  REVIEWS = File.join(__dir__, 'proper-name-discovery-D21850.tsv')
  DEFINITION_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze
  TARGETS = {
    '4763' => [
      '니스카루(Niskaru) 호리녹스(Niskaru Horrinox)',
      '니스카루 호리녹스(Niskaru Horrinox)'
    ],
    '7735' => ['Horrinox', '호리녹스(Horrinox)'],
    '20062' => ['니스카루(Niskaru) 호리녹스', '니스카루 호리녹스(Niskaru Horrinox)'],
    '26275' => ['호리녹스를', '호리녹스(Horrinox)를'],
    '26329' => [
      '공포의 니스카루(Niskaru) 호리녹스 엔파마니르(Enfamanir)',
      '공포의 니스카루 호리녹스(Niskaru Horrinox) 엔파마니르(Enfamanir)'
    ],
    '39576' => [
      '혼돈의 니스카루(Niskaru) 호리녹스',
      '혼돈의 니스카루 호리녹스(Chaos Niskaru Horrinox)'
    ],
    '41645' => ['니스카루(Niskaru) 호리녹스 처치', '니스카루 호리녹스(Niskaru Horrinox) 처치'],
    '63355' => ['호리녹스를', '호리녹스(Horrinox)를']
  }.freeze
  NOTE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English uses Horrinox as the beast/subtype name; default:4763 and
    default:20062 explicitly identify a Niskaru Horrinox, while 39576 gives
    its Chaos-qualified source form. Japanese ホリノックス/ニスカル・ホリノックス
    corroborates the name, and Chinese 恐怖暴君 supports the same creature
    context. Register the creature type as monster:horrinox without merging
    it with monster:niskaru or the named individual Enfamanir. Use one
    complete Korean (English source form) label per occurrence. Preserve all
    existing unrelated entity dispositions on overlapping dialogue rows.
    In default:26329, also correct the directly adjacent subject particle
    after the consonant-final Korean title 경 from 가 to 이.
  TEXT

  def definition
    {
      'entity_key' => ENTITY,
      'english_canonical' => 'Horrinox',
      'category' => 'monster',
      'korean_canonical' => '호리녹스(Horrinox)',
      'english_aliases' => 'Niskaru Horrinox|Chaos Niskaru Horrinox',
      'korean_variants' => '',
      'evidence_ids' => 'D-21850|' + TARGETS.keys.map { |id| "default:#{id}" }.join('|'),
      'status' => 'confirmed',
      'notes' => NOTE
    }
  end

  def run(apply: false)
    [DEFINITIONS, REVIEWS, File.join(__dir__, 'proper-name-edits-D21850.tsv'),
     File.join(__dir__, 'named-scope-review-D21850-20261019.md'),
     File.join(__dir__, 'named-scope-edit-addendum-D21850-20261019.md')].each do |path|
      raise "refusing to overwrite #{path}" if File.exist?(path)
    end
    R.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    definition = definition()
    glossary_table = M.table(R::GLOSSARY)
    glossary = glossary_table.map(&:to_h)
    raise 'Horrinox entity or exact English term already registered' if glossary.any? do |row|
      row['entity_key'] == ENTITY ||
        [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
          .any? { |term| [definition['english_canonical'], *definition['english_aliases'].split('|')].any? { |candidate| term.casecmp?(candidate) } }
    end
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected_keys = TARGETS.keys.map { |id| ['default', id, ''] }.sort
    raise "source scope differs: #{generated.map { |row| M.key(row) }.inspect}" unless
      generated.map { |row| M.key(row) }.sort == expected_keys
    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    existing = index.map { |row| [row['entity_key'], M.key(row)] }.to_set
    raise 'Horrinox owner/source key already indexed' if
      generated.any? { |row| existing.include?([ENTITY, M.key(row)]) }

    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "English Horrinox evidence missing at #{key}" unless english.match?(/\bHorrinox\b/)
      raise "Japanese Horrinox evidence missing at #{key}" unless japanese.match?(/ホリノックス|Horrinox/)
      raise "Chinese creature evidence missing at #{key}" unless
        chinese.match?(/恐怖暴君|尼斯卡鲁/) || chinese == 'Horrinox'
      old = source.fetch('work_text')
      before, after = TARGETS.fetch(key[1])
      raise "Korean target span differs at #{key}" unless old.scan(before).length == 1
      new_text = old.sub(before, after)
      if key == ['default', '26329', '']
        raise 'Sir Farrara subject phrase differs' unless
          new_text.scan('파라라 경(Sir Farrara)가').length == 1
        new_text.sub!('파라라 경(Sir Farrara)가', '파라라 경(Sir Farrara)이')
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => 'accepted', 'old' => old, 'new' => new_text,
        'evidence' => NOTE, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
      }
    end
    raise 'expected eight Horrinox Texto edits' unless reviews.count { |row| row['old'] != row['new'] } == 8
    R.validate_sources!(reviews, inventory)
    R.validate!([definition], reviews, generated, glossary, index)
    if apply
      M.write_table(R::GLOSSARY, glossary_table.headers, glossary + [definition])
      generated.each { |row| row['status'] = 'needs-context'; row['evidence'] = "New monster match reviewed in D-#{D}." }
      M.write_table(M::INDEX, index_table.headers, index + generated)
      M.write_table(DEFINITIONS, DEFINITION_HEADERS, [definition])
      M.write_table(REVIEWS, M::HEADERS, reviews)
      M.run(REVIEWS, D, 1)
    else
      ProperNameCellEditor.prepare(
        File.binread(M.csv_path('default')), reviews
      )
    end
    puts "D-#{D} #{apply ? 'applied' : 'prepared'}: one monster type, eight source keys."
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'old', 'new')) }
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then PrepareHorrinoxMonsterResidualD21850.run
  when ['apply'] then PrepareHorrinoxMonsterResidualD21850.run(apply: true)
  else abort 'usage: prepare-horrinox-monster-residual-D21850.rb [prepare|apply]'
  end
end
