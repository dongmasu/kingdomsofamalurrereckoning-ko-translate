#!/usr/bin/env ruby

require 'csv'
require 'digest'
require 'json'

module PersonGMGadflow03
  AUDIT_DIR = File.expand_path(__dir__)
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  INDEX = File.join(AUDIT_DIR, 'proper-name-occurrences.tsv')
  GLOSSARY = File.join(AUDIT_DIR, 'proper-name-glossary.tsv')
  OUT = File.join(AUDIT_DIR, 'proper-name-reviewed-G-M-gadflow-03.tsv')
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze

  # default:8202 is covered by the existing peoples proposal for Almain/Varani.
  DECISIONS = [
    ['default', '7422', '', '6ea75cf4c67082cef34b57864ef92c0428c698e182ca69eeda16d3d99d9b366f'],
    ['default', '7711', '', 'ac701a23f0ee3007a8310d10a83bb03447bf7d1ed6da454a8edd0a2b5644c01c'],
    ['default', '7772', '', 'f312154d18cf3d099b5a3b6fd5c6ec84ec5df73f241c5215082589b23f55a2ac'],
    ['default', '7821', '', '0b96bcfd267f8cfde9a3d27e8047715ce97c4cf14ec0cd106c5db784253c8631'],
    ['default', '7983', '', '2b531c87b3dd0c3dd3520dc7bf6b29812e2ec7a9d95e48526bf9989c601e0cb3'],
    ['default', '8165', '', 'e82d6ace285016de3d911d472265386d90cd9b577112a3e1d5d5971fce2f7821'],
    ['default', '8183', '', '31ed96679e073e0100f384d2c6a7d72f7f1b1c14f3e09dfa1c261b1ed73afbc0']
  ].freeze

  module_function

  def row_key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def fingerprint(row)
    [row['en_texts_json'], row['ja_texts_json'], row['zh_text'], row['work_text']].join("\0")
  end

  def source_texts(source)
    english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n---\n")
    japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
    [english, japanese, source.fetch('zh_text').to_s]
  end

  def run
    source_by_key = {}
    CSV.foreach(INVENTORY, headers: true, col_sep: "\t") do |row|
      key = row_key(row)
      raise "duplicate inventory key #{key.inspect}" if source_by_key.key?(key)
      source_by_key[key] = row
    end

    pending = {}
    CSV.foreach(INDEX, headers: true, col_sep: "\t") do |row|
      pending[[row.fetch('entity_key'), row_key(row)]] = row['status'] == 'needs-context'
    end
    gadflow = CSV.foreach(GLOSSARY, headers: true, col_sep: "\t").find do |row|
      row['entity_key'] == 'person:gadflow'
    end
    raise 'Gadflow is not confirmed as a person' unless
      gadflow && gadflow['category'] == 'person' && gadflow['status'] == 'confirmed'

    rows = []
    seen_keys = {}
    DECISIONS.each do |resource, id, variant, expected_fingerprint|
      key = [resource, id, variant]
      raise "duplicate decision key #{key.inspect}" if seen_keys[key]
      seen_keys[key] = true
      source = source_by_key[key]
      raise "inventory row missing #{key.inspect}" unless source
      raise "not pending Gadflow at #{key.inspect}" unless pending[['person:gadflow', key]]
      actual_fingerprint = Digest::SHA256.hexdigest(fingerprint(source))
      raise "stale source/context at #{key.inspect}; re-review before regeneration" unless
        actual_fingerprint == expected_fingerprint

      text = source.fetch('work_text')
      english, japanese, chinese = source_texts(source)
      evidence = 'Human-reviewed exact source row for person:gadflow. English anchors the name; Japanese and Chinese corroborate it. The full Korean row and existing bilingual compound were checked; no edit is needed.'
      rows << [
        *key, 'person:gadflow', 'not-an-issue', text, text, evidence,
        english, japanese, chinese
      ]
    end

    row_keys = rows.map { |row| row[0, 3] }
    raise 'duplicate reviewed resource/ID/variant key' unless row_keys.uniq.length == rows.length
    rows.sort_by! { |row| [row[0], row[1].to_i, row[2]] }
    CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    puts "Wrote #{rows.length} reviewed rows to #{OUT}; statuses={\"not-an-issue\"=>#{rows.length}}"
  end
end

PersonGMGadflow03.run if $PROGRAM_NAME == __FILE__
