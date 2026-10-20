#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'

module PrepareDrefanTitleResidualD21858
  module_function

  def run
    batches = ReviewedNameBatches
    output = File.join(__dir__, 'proper-name-review-input-D21858.tsv')
    raise 'D-21858 review already exists' if File.exist?(output)

    inventory = batches.table(batches::INVENTORY).to_h do |row|
      [batches.key(row), row.to_h]
    end
    index = batches.table(batches::INDEX).to_h do |row|
      [[row['entity_key'], *batches.key(row)], row.to_h]
    end
    targets = {
      '29992' => ['드레판(Drefan) 대위', '드레판 대장(Captain Drefan)'],
      '44108' => ['드레판(Drefan) 선장', '드레판 대장(Captain Drefan)'],
      '62581' => ['드레판(Drefan) 선장', '드레판 대장(Captain Drefan)']
    }
    evidence = <<~TEXT.gsub(/\s+/, ' ').strip
      Focused source-local title correction following D-21857: English names
      Captain Drefan, Japanese uses ドレファン隊長, and Chinese uses
      德雷凡队长. English default:14071 explicitly says Drefan runs the
      Ariad and is an officer; default:34277 says he leads an advance force
      into Klurikon. These are military-command, not ship-command references.
      Reuse the established 드레판 대장(Captain Drefan) display and correct
      the residual 선장/대위 renderings only in these three reviewed rows.
      The source-local Lieutenant Drefan rows default:25150 and 37299 retain
      중위: do not collapse different English titles or infer promotion,
      biography, or additional identity. Preserve existing person:drefan
      ownership and all unrelated Korean prose. No alias is added.
    TEXT
    reviews = targets.map do |id, (old_span, new_span)|
      key = ['default', id, '']
      source = inventory.fetch(key)
      previous = index.fetch(['person:drefan', *key])
      english = JSON.parse(source.fetch('en_texts_json')).compact
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact
      raise "unexpected English at #{id}" unless english.all? { |text| text.include?('Captain Drefan') }
      raise "unexpected Japanese at #{id}" unless japanese.all? { |text| text.include?('ドレファン隊長') }
      raise "unexpected Chinese at #{id}" unless source.fetch('zh_text').include?('德雷凡队长')
      raise "terminal hold at #{id}" unless %w[accepted not-an-issue].include?(previous.fetch('status'))
      old = source.fetch('work_text')
      raise "unexpected Korean span at #{id}" unless old.scan(old_span).length == 1

      {
        'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
        'entity_key' => 'person:drefan', 'status' => 'accepted',
        'old' => old, 'new' => old.sub(old_span, new_span),
        'evidence' => evidence, 'english' => english.join("\n"),
        'japanese' => japanese.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate('person:drefan' => 'accepted')
      }
    end
    batches.write_table(output, batches::HEADERS, reviews)
    puts output
  end
end

PrepareDrefanTitleResidualD21858.run if $PROGRAM_NAME == __FILE__
