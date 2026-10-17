#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module MagwyrWindemereAliasResidualD21016
  extend self
  M = ReviewedNameBatches
  ENTITY = 'person:magwyr'
  TARGETS = {
    '10037' => {
      'old' => '배신자 윈드미어의 시녀가 꾸민 짓이다.',
      'new' => '배신자 윈더미어의 시녀(Maid of Windemere)가 꾸민 짓이다.'
    },
    '27815' => {
      'old' => '윈더미어의 배신한 시녀가 꾸민 짓.',
      'new' => '윈더미어의 배신한 시녀(Maid of Windemere)가 꾸민 짓.'
    }
  }.freeze
  MANIFEST = File.join(__dir__, 'proper-name-edits-D21016.tsv')

  def run
    raise 'D-21016 already recorded' if File.exist?(
      File.join(__dir__, 'named-scope-review-D21016-20261015.md')
    )
    raise 'D-21016 manifest already exists' if File.exist?(MANIFEST)

    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    entity = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'Magwyr glossary entry missing' unless entity
    raise 'Maid Windemere is not a registered exact alias' unless
      entity['english_aliases'].to_s.split('|').include?('Maid Windemere')
    raise 'unexpected Magwyr canonical form' unless
      entity['korean_canonical'] == '마그위르(Magwyr)'

    index = M.table(M::INDEX)
    rows = TARGETS.map do |id, texts|
      key = ['default', id, '']
      raise "source key already indexed #{key.inspect}" if
        index.any? { |row| row['entity_key'] == ENTITY && M.key(row) == key }
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      chinese = source.fetch('zh_text').to_s
      current = source.fetch('work_text')
      raise "English alias/context changed at #{id}" unless
        english.match?(/The treacherous Maid Windemere at play/i)
      raise "Japanese context changed at #{id}" unless
        japanese.match?(/ウィンダメアの烈女/)
      raise "Chinese context changed at #{id}" unless
        chinese.match?(/温德米尔的少女/)
      raise "Korean source changed at #{id}" unless current.include?(texts.fetch('old'))
      updated = current.sub(texts.fetch('old'), texts.fetch('new'))
      raise "Korean span is not unique at #{id}" if updated == current ||
        current.scan(Regexp.new(Regexp.escape(texts.fetch('old')))).length != 1
      raise "canonical label missing at #{id}" unless
        updated.include?('시녀(Maid of Windemere)')
      {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'entity_key' => ENTITY, 'status' => 'accepted',
        'old' => current, 'new' => updated,
        'evidence' => 'English source has the exact registered alias Maid Windemere in a quoted Windemere ballad fragment; aligned Japanese ウィンダメアの烈女 and Chinese 温德米尔的少女 independently identify the same named Windemere antagonist. Reuse the established full title 윈더미어의 시녀(Maid of Windemere), correcting the source spelling 윈드미어 at default:10037. The Korean descriptor 배신자/배신한 and the poem wording are otherwise preserved. This is an exact contextual occurrence addition, not a global Maid alias.',
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end

    _prepared, row_count = ProperNameCellEditor.prepare(
      File.binread(M.csv_path('default')), rows
    )
    raise 'unexpected prepared row count' unless row_count == 65_135

    additions = rows.map do |review|
      {
        'entity_key' => ENTITY, 'resource' => review['resource'],
        'ID_Linha' => review['ID_Linha'],
        'Tipo_Variante' => review['Tipo_Variante'],
        'matched_english' => 'Maid Windemere',
        'english_source' => review['english'],
        'korean_current' => review['old'], 'status' => 'needs-context',
        'evidence' => 'D-21016 candidate: exact registered Maid Windemere source alias discovered in a Windemere ballad fragment; cross-locale review required before application.'
      }
    end
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + additions)
    M.write_table(MANIFEST, M::HEADERS, rows)
    M.run(MANIFEST, 21016, nil)
  end
end

MagwyrWindemereAliasResidualD21016.run if $PROGRAM_NAME == __FILE__
