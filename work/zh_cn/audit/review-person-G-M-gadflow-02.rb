#!/usr/bin/env ruby

require 'csv'
require 'digest'
require 'json'

module PersonGMGadflow02
  AUDIT_DIR = File.expand_path(__dir__)
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  INDEX = File.join(AUDIT_DIR, 'proper-name-occurrences.tsv')
  GLOSSARY = File.join(AUDIT_DIR, 'proper-name-glossary.tsv')
  OUT = File.join(AUDIT_DIR, 'proper-name-reviewed-G-M-gadflow-02.tsv')
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze

  # default:3899 is intentionally omitted because the M-Z review already
  # contains that row key for Titarion; its Gadflow annotation is also correct.
  DECISIONS = [
    ['default', '3275', '', '28053de116fab4a5b8a16a078fb59ed91de625a4df0f703ef25d8d49e51d57c7'],
    ['default', '3623', '', 'abceb3704a5fe0180a43bffcf4b17879ccef73529a01d4b40ca25faf86f01e62'],
    ['default', '4124', '', 'd182925d5887c66d013cfb1c6cafd2235f8f2d271d1a87f53a08d48f164d8294'],
    ['default', '4151', '', '8efdbcea5172c6562db285ea879d3db003fb3f2fc50b4afd9e9a81b97ff94865'],
    ['default', '4780', '', '2611ec9e526081ef9c52a6fd4b3d8a619699cb414aeed5e2a67f3784abbbd235'],
    ['default', '5272', '', '78c18f4dcf2ae996adef199c060e8d4d7a5089c09f28a99e22a1fa586ce565c6'],
    ['default', '5579', '', '2950eff8bf49b4c6e610d4ebfb03f1fd28943d3e53a569d95edc4bb06918005f']
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

PersonGMGadflow02.run if $PROGRAM_NAME == __FILE__
