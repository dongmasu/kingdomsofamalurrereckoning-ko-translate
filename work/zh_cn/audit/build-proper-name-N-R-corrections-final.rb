#!/usr/bin/env ruby

require 'csv'
require 'json'

module PersonNRCorrectionsFinal
  AUDIT_DIR = File.expand_path(__dir__)
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  INDEX = File.join(AUDIT_DIR, 'proper-name-occurrences.tsv')
  OUT = File.join(AUDIT_DIR, 'proper-name-reviewed-N-R-corrected-final.tsv')
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese entity_dispositions_json previous_status previous_evidence
  ].freeze

  CORRECTIONS = {
    ['default', '26405', ''] => [
      ['오머(Ommer) 보가드', '오머 보가드(Ommer Vogard)', 'Ommer Vogard']
    ],
    ['default', '33255', ''] => [
      ['오머(Ommer) 보가드', '오머 보가드(Ommer Vogard)', 'Ommer Vogard']
    ],
    ['default', '41345', ''] => [
      ['오머(Ommer) 보가드', '오머 보가드(Ommer Vogard)', 'Ommer Vogard']
    ],
    ['default', '29470', ''] => [
      ['오윈(Orwin) 던', '오윈 던(Orwin Dunn)', 'Orwin Dunn']
    ],
    ['default', '40393', ''] => [
      ['오윈(Orwin) 던', '오윈 던(Orwin Dunn)', 'Orwin Dunn']
    ],
    ['default', '41063', ''] => [
      ['오윈(Orwin) 던', '오윈 던(Orwin Dunn)', 'Orwin Dunn']
    ],
    ['default', '48066', ''] => [
      ['오윈(Orwin) 던', '오윈 던(Orwin Dunn)', 'Orwin Dunn']
    ],
    ['default', '50111', ''] => [
      ['오윈(Orwin) 던', '오윈 던(Orwin Dunn)', 'Orwin Dunn']
    ],
    ['default', '18850', ''] => [
      ['오셀(Othel) 홀른', '오셀 홀른(Othel Holn)', 'Othel Holn']
    ],
    ['default', '26925', ''] => [
      ['오르차(Orcha) 테트란', '오르차 테트란(Orcha Tetran)', 'Orcha Tetran']
    ],
    ['default', '33586', ''] => [
      ['펜리(Penri) 켈', '펜리 켈(Penri Kell)', 'Penri Kell']
    ],
    ['default', '34815', ''] => [
      ['펜리(Penri) 켈', '펜리 켈(Penri Kell)', 'Penri Kell']
    ],
    ['default', '35360', ''] => [
      ['펜리(Penri) 켈', '펜리 켈(Penri Kell)', 'Penri Kell']
    ],
    ['default', '40717', ''] => [
      ['펜리(Penri) 켈', '펜리 켈(Penri Kell)', 'Penri Kell']
    ],
    ['default', '57653', ''] => [
      ['파르웬(Parwen) 웰', '파르웬 웰(Parwen Well)', 'Parwen Well']
    ],
    ['default', '59664', ''] => [
      ['파르웬(Parwen) 웰', '파르웬 웰(Parwen Well)', 'Parwen Well']
    ],
    ['default', '24853', ''] => [
      ['우그나르 오드그레이(Odgray)', '우그나르 오드그레이(Ugnar Odgray)', 'Ugnar Odgray']
    ],
    ['default', '30497', ''] => [
      ['우그나르 오드그레이(Odgray)', '우그나르 오드그레이(Ugnar Odgray)', 'Ugnar Odgray']
    ],
    ['default', '40592', ''] => [
      ['우그나르 오드그레이(Odgray)', '우그나르 오드그레이(Ugnar Odgray)', 'Ugnar Odgray']
    ],
    ['default', '45217', ''] => [
      ['우그나르 오드그레이(Odgray)', '우그나르 오드그레이(Ugnar Odgray)', 'Ugnar Odgray']
    ],
    ['default', '49867', ''] => [
      ['셀니 펠리아드(Peliad)', '셀니 펠리아드(Selni Peliad)', 'Selni Peliad']
    ],
    ['default', '10464', ''] => [
      ['수너 폼(Pome)', '수너 폼(Suner Pome)', 'Suner Pome']
    ],
    ['default', '10866', ''] => [
      ['수너 폼(Pome)', '수너 폼(Suner Pome)', 'Suner Pome']
    ],
    ['default', '38642', ''] => [
      ['수너 폼(Pome)', '수너 폼(Suner Pome)', 'Suner Pome']
    ],
    ['default', '9284', ''] => [
      ['오르웨(Orwae)가 네스', '오르웨 네스(Orwae Nes)', 'Orwae Nes']
    ],
    ['default', '60520', ''] => [
      ['오르웨(Orwae)가,', '오르웨(Orwae),', 'Orwae']
    ],
    ['default', '20606', ''] => [
      ['페리데 오에트(Feride Ouet)', '페리드 오에트(Feride Ouet)', 'Feride Ouet']
    ],
    ['default', '23909', ''] => [
      ['페리데 오에트(Feride Ouet)', '페리드 오에트(Feride Ouet)', 'Feride Ouet']
    ],
    ['default', '24118', ''] => [
      ['페리데 오에트(Feride Ouet)', '페리드 오에트(Feride Ouet)', 'Feride Ouet']
    ],
    ['default', '30865', ''] => [
      ['페리데 오에트(Feride Ouet)', '페리드 오에트(Feride Ouet)', 'Feride Ouet']
    ],
    ['default', '46314', ''] => [
      ['페리데 오에트(Feride Ouet)', '페리드 오에트(Feride Ouet)', 'Feride Ouet']
    ],
    ['default', '54714', ''] => [
      ['페리데 오에트(Feride Ouet)', '페리드 오에트(Feride Ouet)', 'Feride Ouet']
    ],
    ['default', '62874', ''] => [
      ['페리데 오에트(Feride Ouet)', '페리드 오에트(Feride Ouet)', 'Feride Ouet']
    ],
    ['default', '63357', ''] => [
      ['페리데 오에트(Feride Ouet)', '페리드 오에트(Feride Ouet)', 'Feride Ouet']
    ],
    ['default', '38324', ''] => [
      ['아조 라에문드(Azo Raemund)', '아조 레이먼드(Azo Raemund)', 'Azo Raemund']
    ]
  }.freeze
  CORRECTED_ENTITIES = {
    ['default', '26405', ''] => %w[person:ommer],
    ['default', '33255', ''] => %w[person:ommer],
    ['default', '41345', ''] => %w[person:ommer],
    ['default', '29470', ''] => %w[person:orwin],
    ['default', '40393', ''] => %w[person:orwin],
    ['default', '41063', ''] => %w[person:orwin],
    ['default', '48066', ''] => %w[person:orwin],
    ['default', '50111', ''] => %w[person:orwin],
    ['default', '18850', ''] => %w[person:othel],
    ['default', '26925', ''] => %w[person:orcha],
    ['default', '33586', ''] => %w[person:penri],
    ['default', '34815', ''] => %w[person:penri],
    ['default', '35360', ''] => %w[person:penri],
    ['default', '40717', ''] => %w[person:penri],
    ['default', '57653', ''] => %w[person:parwen],
    ['default', '59664', ''] => %w[person:parwen],
    ['default', '24853', ''] => %w[person:odgray],
    ['default', '30497', ''] => %w[person:odgray],
    ['default', '40592', ''] => %w[person:odgray],
    ['default', '45217', ''] => %w[person:odgray],
    ['default', '26405', ''] => %w[person:vogard],
    ['default', '33255', ''] => %w[person:vogard],
    ['default', '41345', ''] => %w[person:vogard],
    ['default', '26925', ''] => %w[person:tetran],
    ['default', '24853', ''] => %w[person:ugnar],
    ['default', '30497', ''] => %w[person:ugnar],
    ['default', '40592', ''] => %w[person:ugnar],
    ['default', '45217', ''] => %w[person:ugnar],
    ['default', '49867', ''] => %w[person:peliad person:selni],
    ['default', '10464', ''] => %w[person:pome],
    ['default', '10866', ''] => %w[person:pome],
    ['default', '38642', ''] => %w[person:pome],
    ['default', '9284', ''] => %w[person:orwae],
    ['default', '60520', ''] => %w[person:orwae],
    ['default', '20606', ''] => %w[person:ouet],
    ['default', '23909', ''] => %w[person:ouet],
    ['default', '24118', ''] => %w[person:ouet],
    ['default', '30865', ''] => %w[person:ouet],
    ['default', '46314', ''] => %w[person:ouet],
    ['default', '54714', ''] => %w[person:ouet],
    ['default', '62874', ''] => %w[person:ouet],
    ['default', '63357', ''] => %w[person:ouet],
    ['default', '38324', ''] => %w[person:raemund]
  }.freeze

  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def run
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t", liberal_parsing: true)
    index = CSV.read(INDEX, headers: true, col_sep: "\t", liberal_parsing: true)
    source_by_key = inventory.to_h { |row| [key(row), row] }
    index_by_key = index.group_by { |row| key(row) }
    output = []

    CORRECTIONS.each do |row_key, replacements|
      source = source_by_key.fetch(row_key) { raise "missing current inventory row #{row_key.inspect}" }
      occurrences = index_by_key.fetch(row_key) { raise "missing occurrence index row #{row_key.inspect}" }
      old_text = source.fetch('work_text').to_s
      new_text = old_text.dup

      replacements.each do |before, after, english_anchor|
        unless source.fetch('en_texts_json').to_s.downcase.include?(english_anchor.downcase)
          raise "English anchor missing at #{row_key.inspect}: #{english_anchor}"
        end
        raise "current Korean span missing at #{row_key.inspect}: #{before}" unless new_text.include?(before)

        new_text.gsub!(before, after)
      end

      raise "correction made no change at #{row_key.inspect}" if new_text == old_text
      raise "unbalanced parentheses at #{row_key.inspect}" unless new_text.count('(') == new_text.count(')')
      raise "token change at #{row_key.inspect}" unless old_text.scan(/\{[^{}]*\}/) == new_text.scan(/\{[^{}]*\}/)
      raise "line-break change at #{row_key.inspect}" unless old_text.scan(/\r\n|\r|\n/) == new_text.scan(/\r\n|\r|\n/)

      previous_dispositions = {}
      previous_evidence = {}
      occurrences.each do |occurrence|
        entity_key = occurrence.fetch('entity_key')
        previous_dispositions[entity_key] = occurrence.fetch('status')
        previous_evidence[entity_key] = occurrence['evidence'].to_s
      end
      dispositions = previous_dispositions.dup
      CORRECTED_ENTITIES.fetch(row_key).each do |entity_key|
        raise "corrected entity missing from index at #{row_key.inspect}: #{entity_key}" unless
          dispositions.key?(entity_key)
        dispositions[entity_key] = 'accepted'
      end
      entity_keys = dispositions.keys.sort
      evidence = 'Independent row-level review against the aligned English, Japanese, and Chinese source excerpts in this record. The sources identify the complete personal name; the proposal keeps one Korean full-name label with one full English parenthetical, normalizes only the supported Korean spelling, and preserves surrounding text, titles, tokens, line breaks, and particles.'

      output << [
        *row_key,
        entity_keys.join('|'),
        'accepted',
        old_text,
        new_text,
        evidence,
        JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n---\n"),
        JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n"),
        source.fetch('zh_text').to_s,
        JSON.generate(dispositions),
        JSON.generate(previous_dispositions),
        JSON.generate(previous_evidence)
      ]
    end

    raise 'duplicate resource/ID/variant correction key' unless
      output.map { |row| row[0, 3] }.uniq.length == output.length

    output.sort_by! { |row| [row[0], row[1].to_i, row[2]] }
    CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      output.each { |row| csv << row }
    end
    puts "Wrote #{output.length} unique current-row corrections."
  end
end

PersonNRCorrectionsFinal.run if $PROGRAM_NAME == __FILE__
