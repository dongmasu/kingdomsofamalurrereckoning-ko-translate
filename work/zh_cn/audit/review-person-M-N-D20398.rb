#!/usr/bin/env ruby

require 'csv'
require 'json'

module PersonMNReview
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze
  AUDIT_DIR = File.expand_path(__dir__)
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  GLOSSARY = File.join(AUDIT_DIR, 'proper-name-glossary.tsv')
  CANDIDATES = File.join(AUDIT_DIR, 'proper-name-proposals-M-Z-D20397.tsv')
  OUT = File.join(AUDIT_DIR, 'proper-name-reviewed-M-N-D20398.tsv')

  GROUP_KEYS = %w[
    person:macit person:magessa person:magnus person:magwyr person:mal-dydyn
    person:mallion person:malthon person:mandolph person:marr person:mattix
    person:maura person:maura-chalin person:maxen person:menri-togh
    person:meroch person:meywan person:milou person:mina person:morhen
    person:morkan person:myrcyr person:myrrine person:mythany person:nameria
    person:nanne person:nareen
  ].freeze
  ANNOTATED_VARIANTS = {
    'person:macit' => { '마시트' => '마싯' },
    'person:magnus' => { '마그누스' => '매그너스' },
    'person:mallion' => { '말리언' => '말리온' },
    'person:maura' => { '마우라' => '모라', '모우라' => '모라' },
    'person:maxen' => { '맥슨' => '맥센' },
    'person:meroch' => { '메록' => '메로크' },
    'person:morhen' => { '모헨' => '모르헨' },
    'person:morkan' => { '모칸' => '모르칸' },
    'person:mythany' => { '미사니' => '미서니' }
  }.freeze
  FULL_NAME_OVERLAPS = {
    ['default', '5698', ''] => ['person:meywan', 'person:creth-meywan', 'Creth Meywan'],
    ['default', '20780', ''] => ['person:nareen', 'person:burdick-nareen', 'Burdick Nareen'],
    ['default', '64355', ''] => ['person:nareen', 'person:burdick-nareen', 'Burdick Nareen']
  }.freeze

  # These rows need a narrower disposition than the broad candidate pass.
  OVERRIDES = {
    ['default', '8625', ''] => [
      'excluded', nil,
      'Magnus is used as the Arena champion title here, not an individually identified person.'
    ],
    ['default', '15137', ''] => [
      'uncertain', nil,
      'Magnus family is a family-name use; the reviewed glossary entry identifies a person.'
    ],
    ['default', '34335', ''] => [
      'uncertain', nil,
      'The Korean repeats Magnus for an English appositive; adding annotations to both would overstate the source name.'
    ],
    ['default', '49488', ''] => [
      'uncertain', nil,
      'The source phrase is Lord Magnus; retain the full honorific-name context for review.'
    ],
    ['default', '49969', ''] => [
      'not-an-issue', nil,
      'Maura Chalin already has the complete source-supported bilingual name; Ordo is outside this batch.'
    ],
    ['default', '51049', ''] => [
      'accepted', "매그너스의 속임수(Magnus' Trickery)",
      'Canonical Korean spelling applied while preserving the complete existing bilingual title.'
    ],
    ['default', '10691', ''] => [
      'accepted', '오르도는 야심이 상당하군. 모라(Maura)의 진짜 모습을 밝혀냈다니 다행이야.',
      'Only Maura is in this batch; the out-of-scope Ordo wording is left untouched.'
    ],
    ['default', '26730', ''] => [
      'accepted', nil,
      'Mallion is normalized; the out-of-scope Wyvyrn family wording is left untouched.'
    ],
    ['default', '1250', ''] => [
      'accepted', nil,
      'Canonical Korean name spelling applied; the separate Maid title and its existing annotation are preserved.'
    ],
    ['default', '3399', ''] => [
      'accepted', nil,
      'Canonical Korean name spelling applied; the separate Maid title remains intact.'
    ],
    ['default', '6907', ''] => [
      'accepted', nil,
      'Canonical Korean name spelling applied; surrounding title and other source-supported names are preserved.'
    ],
    ['default', '138', ''] => [
      'accepted', nil,
      'Canonical Korean name spelling applied; existing complete title and name annotations are retained.'
    ],
    ['default', '56581', ''] => [
      'accepted', nil,
      'Canonical Korean name spelling and English name annotation added; the complete Maid of Windemere context remains in the sentence.'
    ]
  }.freeze

  module_function

  def row_key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def inventory_context(row)
    english = JSON.parse(row.fetch('en_texts_json') || '[]').compact.join("\n---\n")
    japanese = JSON.parse(row.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
    [english, japanese, row.fetch('zh_text').to_s, row.fetch('work_text')]
  end

  def normalize_annotated_variants(text, entity_keys, english)
    changed = false
    entity_keys.each do |entity_key|
      variants = ANNOTATED_VARIANTS[entity_key]
      next unless variants

      variants.each do |variant, canonical|
        pattern = /#{Regexp.escape(variant)}((?:[ \t]+\p{Hangul}+)*[ \t]*\([^()\r\n]*\))/
        text = text.gsub(pattern) do
          annotation = Regexp.last_match(1)
          supported = annotation.scan(/(?<![A-Za-z])[A-Za-z][A-Za-z' -]*(?![A-Za-z])/)
            .any? do |term|
              english.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i) &&
                term.match?(/(?<![A-Za-z])#{Regexp.escape(entity_key.split(':').last.gsub('-', ' '))}(?![A-Za-z])/i)
            end
          if supported
            changed = true
            "#{canonical}#{annotation}"
          else
            Regexp.last_match(0)
          end
        end
      end
    end
    [text, changed]
  end

  def build(inventory, candidates, glossary)
    source_by_key = inventory.to_h { |row| [row_key(row), row] }
    glossary_by_key = glossary.to_h { |row| [row.fetch('entity_key'), row] }
    output = {}

    candidates.each do |candidate|
      selected = candidate.fetch('entity_key').split('|') & GROUP_KEYS
      next if selected.empty?

      key = row_key(candidate)
      source = source_by_key.fetch(key) do
        raise "candidate row missing from fresh inventory: #{key.inspect}"
      end
      english, japanese, chinese, korean = inventory_context(source)
      unless [english, japanese, chinese, korean] ==
             [candidate.fetch('english'), candidate.fetch('japanese'),
              candidate.fetch('chinese'), candidate.fetch('old')]
        raise "candidate source context differs from fresh inventory: #{key.inspect}"
      end

      status = candidate.fetch('status')
      new_text = candidate.fetch('new')
      note = nil
      if (override = OVERRIDES[key])
        status, override_text, note = override
        new_text = override_text unless override_text.nil?
      end
      if key == ['default', '26730', '']
        new_text = new_text.gsub('와이번(Wyvyrn)', '와이번')
      end
      case key
      when ['default', '1250', '']
        new_text = korean.gsub('맥와이어', '마그위르')
      when ['default', '138', ''], ['default', '3399', ''], ['default', '6907', '']
        new_text = korean.gsub('마그와이어', '마그위르')
      when ['default', '56581', '']
        new_text = korean.gsub('마그와이어', '마그위르(Magwyr)')
      end
      new_text = korean unless status == 'accepted'
      if %w[accepted not-an-issue].include?(status)
        new_text, variant_changed =
          normalize_annotated_variants(new_text, selected, english)
        if variant_changed
          status = 'accepted'
          note = [note, 'Noncanonical Korean name component normalized; complete source English parenthetical preserved.']
            .compact.join(' ')
        end
      end
      unless %w[accepted not-an-issue uncertain excluded].include?(status)
        raise "invalid review status #{status.inspect} for #{key.inspect}"
      end

      source_terms = candidate.fetch('evidence')
        .split('exact English source term(s): ', 2)[1].to_s
        .split(';', 2).first.to_s
      evidence = "D-20398 bounded manual review; selected groups: #{selected.join('|')}; " \
                 "English source terms: #{source_terms}; English context read first, " \
                 "Japanese and Chinese compared, and the complete Korean row checked " \
                 "for full names, titles, particles, and collisions."
      evidence += " #{note}" if note
      if status == 'uncertain'
        original_note = candidate.fetch('evidence').split('; unresolved: ', 2)[1]
        evidence += " Unresolved: #{original_note}" if original_note
      end
      if status == 'not-an-issue'
        evidence += ' Existing Korean spelling/annotation or complete bilingual compound is retained.'
      elsif status == 'excluded' && !note
        evidence += ' Context does not identify an in-scope person.'
      elsif status == 'accepted' && !note
        evidence += ' Name spelling/annotation is normalized; existing compounds and particle context are preserved.'
      end

      row = [
        *key, selected.join('|'), status, korean, new_text, evidence,
        english, japanese, chinese
      ]
      raise "duplicate output row key #{key.inspect}" if output.key?(key)
      output[key] = row
    end

    FULL_NAME_OVERLAPS.each do |key, (primary_key, full_name_key, english_name)|
      raise "full-name overlap already represented: #{key.inspect}" if output.key?(key)
      primary = glossary_by_key.fetch(primary_key)
      full_name = glossary_by_key.fetch(full_name_key)
      unless [primary, full_name].all? { |entity| entity['status'] == 'confirmed' }
        raise "full-name overlap lacks confirmed glossary entries: #{key.inspect}"
      end
      unless full_name.fetch('english_canonical') == english_name
        raise "unexpected full-name glossary key: #{full_name_key}"
      end
      source = source_by_key.fetch(key) { raise "missing aligned source row: #{key.inspect}" }
      english, japanese, chinese, korean = inventory_context(source)
      unless english.match?(/(?<![A-Za-z])#{Regexp.escape(english_name)}(?![A-Za-z])/i) &&
             korean.match?(/\([^()\r\n]*#{Regexp.escape(english_name)}[^()\r\n]*\)/i)
        raise "full bilingual name not preserved in source row: #{key.inspect}"
      end
      evidence = "D-20398 bounded manual review; #{primary_key} occurs as the component of " \
                 "confirmed #{full_name_key}=#{english_name}; English, Japanese, Chinese, " \
                 "and complete Korean row checked; existing full bilingual name retained."
      row = [
        *key, "#{primary_key}|#{full_name_key}", 'not-an-issue', korean, korean,
        evidence, english, japanese, chinese
      ]
      output[key] = row
    end

    output.values.sort_by { |row| [row[0], row[1].to_i, row[2]] }
  end

  def run
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
    glossary = CSV.read(GLOSSARY, headers: true, col_sep: "\t")
    candidates = CSV.read(CANDIDATES, headers: true, col_sep: "\t")
    missing_groups = GROUP_KEYS - glossary.map { |row| row['entity_key'] }
    raise "missing glossary groups: #{missing_groups.join(', ')}" unless missing_groups.empty?

    rows = build(inventory, candidates, glossary)
    CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    counts = rows.map { |row| row[4] }.each_with_object(Hash.new(0)) { |status, tally| tally[status] += 1 }
    puts "Wrote #{rows.length} reviewed rows for 25 M-N groups to #{OUT}"
    puts "Inventory rows: #{inventory.length}; status counts: #{counts.inspect}"
    puts 'Primary groups: 25; full-name overlap rows added from aligned inventory: 3'
  end
end

PersonMNReview.run if $PROGRAM_NAME == __FILE__
