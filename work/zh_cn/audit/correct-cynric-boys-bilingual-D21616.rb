#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

module CorrectCynricBoysBilingualD21616
  extend self
  M = ReviewedNameBatches
  D = 21_616
  KEY = ['default', '39662', ''].freeze
  PATH = File.join(__dir__, "proper-name-correction-D#{D}.tsv")
  EVIDENCE = <<~TEXT.chomp
    Corrective proper-name bilingual-label audit. D-21614 registered
    default:39662 as a Cynric family occurrence but left its Korean
    name-only span unchanged. English "Cynric boys", Japanese
    シンリックの少年たち, and Chinese 辛瑞克男孩 all identify the group
    collectively; none establishes an individual named Cynric. Add the
    source-aligned family label and English form, preserving the sentence,
    all other names and line breaks. Keep the existing family:cynric entity
    and row key; this corrects the prior not-an-issue disposition without
    adding or recounting a new occurrence. No PAK-derived material was used.
  TEXT

  def apply
    raise 'D-21616 artifact already exists' if File.exist?(PATH) ||
      File.exist?(File.join(__dir__, "proper-name-edits-D#{D}.tsv"))
    inventory = M.refresh_inventory
    source = inventory.fetch(KEY)
    old = source.fetch('work_text')
    from = '신릭 소년들에게'
    to = '신릭 가문(Cynric family)의 소년들에게'
    raise 'unexpected Korean source span' unless old.scan(from).length == 1
    index = M.table(M::INDEX)
    occurrence = index.find do |row|
      row['entity_key'] == 'family:cynric' && M.key(row) == KEY
    end
    raise 'expected prior not-an-issue family occurrence' unless
      occurrence && occurrence['status'] == 'not-an-issue' &&
      occurrence['evidence'].start_with?('D-21614:')
    review = {
      'resource' => KEY[0], 'ID_Linha' => KEY[1], 'Tipo_Variante' => KEY[2],
      'entity_key' => 'family:cynric', 'status' => 'accepted',
      'old' => old, 'new' => old.sub(from, to), 'evidence' => EVIDENCE,
      'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
      'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
      'chinese' => source.fetch('zh_text'),
      'entity_dispositions_json' => JSON.generate('family:cynric' => 'accepted')
    }
    M.write_table(PATH, M::HEADERS.take(12), [review])
    M.run(PATH, D, nil, review_states: ['not-an-issue'])
  end
end

CorrectCynricBoysBilingualD21616.apply if $PROGRAM_NAME == __FILE__
