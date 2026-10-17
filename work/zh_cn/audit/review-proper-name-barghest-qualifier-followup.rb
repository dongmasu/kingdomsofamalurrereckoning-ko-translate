#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module BarghestQualifierFollowup
  M = ReviewedNameBatches
  ENTITY = 'monster:barghest'
  KEY = ['default', '53407', ''].freeze
  OUT = File.join(__dir__, 'proper-name-reviewed-barghest-qualifier-followup.tsv')

  module_function

  def rewrite(old)
    from = '바게스트(고기 5개)'
    to = '바게스트(Barghest)(고기 5개)'
    raise 'unexpected Barghest qualifier span' unless old.scan(Regexp.new(Regexp.escape(from))).length == 1
    old.sub(from, to)
  end

  def run
    inventory = M.refresh_inventory
    source = inventory.fetch(KEY)
    old = source.fetch('work_text')
    new_text = rewrite(old)
    index = M.table(M::INDEX).find do |row|
      row['entity_key'] == ENTITY && M.key(row) == KEY
    end
    raise 'expected unresolved Barghest occurrence missing' unless index && index['status'] == 'uncertain'

    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    raise 'unexpected English Barghest source' unless english == 'Barghest (5 Meat)'
    raise 'unexpected Japanese Barghest source' unless japanese == 'バーゲスト(肉5)'
    raise 'unexpected Chinese Barghest source' unless chinese == '魔狼（5 块肉）'

    row = {
      'resource' => KEY[0], 'ID_Linha' => KEY[1], 'Tipo_Variante' => KEY[2],
      'entity_key' => ENTITY, 'status' => 'accepted', 'old' => old, 'new' => new_text,
      'evidence' => 'English and Japanese place the meat quantity in a separate qualifier; the Korean already translates that qualifier as 고기 5개. Insert the established species label immediately after 바게스트 and preserve the quantity exactly.',
      'english' => english, 'japanese' => japanese, 'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted')
    }
    ProperNameCellEditor.prepare(File.binread(M.csv_path(KEY[0])), [row])
    M.write_table(OUT, M::HEADERS + ['entity_dispositions_json'], [row])
    M.run(OUT, 20828, nil, review_states: ['uncertain'])
  end
end

BarghestQualifierFollowup.run if $PROGRAM_NAME == __FILE__
