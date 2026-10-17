#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

module SplitrockParticlesD21036
  M = ReviewedNameBatches
  ENTITY = 'place:splitrock-depths'
  TARGETS = {
    '14182' => ['스플릿록 심층부(Splitrock Depths)으로', '스플릿록 심층부(Splitrock Depths)로'],
    '57331' => ['스플릿록 심층부(Splitrock Depths)으로', '스플릿록 심층부(Splitrock Depths)로'],
    '19228' => ['스플릿록 심층부(Splitrock Depths)을', '스플릿록 심층부(Splitrock Depths)를'],
    '39195' => ['스플릿록 심층부(Splitrock Depths)을', '스플릿록 심층부(Splitrock Depths)를']
  }.freeze

  module_function

  def run
    path = '/private/tmp/proper-name-reviewed-D21036.tsv'
    raise "already exists: #{path}" if File.exist?(path)
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    reviews = TARGETS.sort_by { |id, _| id.to_i }.map do |id, (old_span, new_span)|
      key = ['default', id, '']
      source = inventory.fetch(key)
      occurrence = index.select { |row| row['entity_key'] == ENTITY && M.key(row) == key }
      raise "expected an accepted existing key: #{id}" unless
        occurrence.length == 1 && occurrence.first['status'] == 'accepted'
      old = source.fetch('work_text')
      raise "unexpected correction span count: #{id}" unless old.scan(old_span).length == 1
      {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'entity_key' => ENTITY, 'status' => 'accepted',
        'old' => old, 'new' => old.sub(old_span, new_span),
        'evidence' => 'Corrective grammar-only follow-up to D-21010/D-21011: the confirmed Korean place name ends in vowel-final 부, so use 로 rather than 으로 and 를 rather than 을 after its bilingual label. Keep the existing entity identity and accepted row disposition; this is not a new entity/row review or a historical tally addition. Aligned English, Japanese and Chinese were checked for the same location; all other text and labels are preserved.',
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => 'accepted'),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    M.write_table(path, M::HEADERS, reviews)
    puts "Prepared #{reviews.length} corrective Texto cells; no new index keys."
  end
end

SplitrockParticlesD21036.run if $PROGRAM_NAME == __FILE__
