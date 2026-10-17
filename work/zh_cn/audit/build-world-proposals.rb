#!/usr/bin/env ruby

require 'csv'
require 'json'

module WorldNameReview
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze

  GLOSSARY_HEADERS = %w[
    entity_key english_canonical category korean_canonical english_aliases
    korean_variants evidence_ids status notes
  ].freeze

  # This batch reuses established project spellings for D-L world names.
  ENTITIES = [
    ['place:detyre', 'Detyre', 'place', '데티어(Detyre)', '', '데티르|데타이어',
     'D-20396|default:11582|default:55294|base:2413',
     'Established region spelling; preserve complete source compounds.'],
    ['place:didenhil', 'Didenhil', 'place', '다이덴힐(Didenhil)', '', '다이든힐|디든힐',
     'D-20396|D-19775|default:30025|default:18142|base:1359',
     'Established village spelling; preserve inn, prison, and other complete names.'],
    ['place:emaire', 'Emaire', 'place', '에메어(Emaire)', '', '에마이어|에마이르',
     'D-20396|D-19725|D-20226|default:57576|default:56815',
     'Use the later consistency decision 에메어; preserve complete source compounds.'],
    ['people:erathi', 'Erathi', 'people', '에라시(Erathi)', '', '에라티',
     'D-20396|D-19583|default:32305|default:34403',
     'Established people/adjectival spelling; retain the source noun and number.'],
    ['place:gorhart', 'Gorhart', 'place', '고어하트(Gorhart)', '', '고어하르트',
     'D-20396|D-19635|default:2033|default:158|default:52727',
     'Established town spelling; preserve complete named sites and titles.'],
    ['place:idylla', 'Idylla', 'place', '이디라(Idylla)', '', '이딜라|이디야',
     'D-20396|D-18904|D-19369|default:28250|default:30295',
     'Established city spelling; preserve complete source compounds.'],
    ['people:jottun', 'Jottun', 'people', '요툰(Jottun)', '', '조툰|요튼',
     'D-20396|D-19685|default:72|default:1777',
     'Established people/species spelling; distinguish named Jottun from generic giants or trolls.'],
    ['people:kollossae', 'Kollossae', 'people', '콜로사이(Kollossae)', '', '콜로새|콜로세',
     'D-20396|D-19573|default:30273|default:30485',
     'Established people/species spelling; retain surrounding source wording.']
  ].freeze

  # A Korean variant is normalized only after an exact English source hit
  # and a token-bounded Korean match; embedded substrings are left alone.
  COLLISION_RISK_CANONICALS = %w[place:sidhe].freeze
  module_function

  def source_hits?(texts, english)
    pattern = /(?<![A-Za-z])#{Regexp.escape(english)}(?![A-Za-z])/i
    texts.any? { |text| text.to_s.match?(pattern) }
  end

  def english_texts(source)
    JSON.parse(source.fetch('en_texts_json') || '[]').compact
  end

  def locale_texts(source, field)
    JSON.parse(source.fetch(field) || '[]').compact
  end

  def annotation_pattern(entity)
    english = Regexp.escape(entity[1])
    korean_forms = ([entity[3].sub(/\(.*/, '')] + entity[5].split('|'))
      .reject(&:empty?).uniq.sort_by { |form| -form.length }
    forms = korean_forms.map { |form| Regexp.escape(form) }.join('|')
    Regexp.new("(?<form>#{forms})[ \\t]*\\((?<english>#{english})\\)", Regexp::IGNORECASE)
  end

  def korean_form_pattern(form)
    particles = %w[
      은 는 이 가 을 를 의 에 에서 에게 으로 로 와 과 도 만 까지 부터
      처럼 보다 마다 들 족 족은 족이 족을 어 어로 어의 다 인 이다
      이라 이라고 이라며 이라서 입니다 이었습니다 였다
    ]
    ending = "(?:$|[^가-힣]|#{particles.join('|')})"
    Regexp.new("(?<![가-힣])#{Regexp.escape(form)}(?=#{ending})")
  end

  def found_korean_forms(text, entity)
    canonical = entity[3].sub(/\(.*/, '')
    forms = ([canonical] + entity[5].split('|')).reject(&:empty?)
    forms.select { |form| text.match?(korean_form_pattern(form)) }
  end

  def build_proposals(inventory)
    entities = ENTITIES
    rows = {}

    inventory.each do |source|
      english = english_texts(source)
      hits = entities.select { |entity| source_hits?(english, entity[1]) }
      next if hits.empty?

      key = [source.fetch('resource'), source.fetch('ID_Linha'),
             source['Tipo_Variante'].to_s]
      old = source.fetch('work_text')
      new_text = old.dup
      uncertain = []
      reasons = []

      hits.each do |entity|
        key_name = entity[0]
        canonical = entity[3].sub(/\(.*/, '')
        paired = new_text.match?(annotation_pattern(entity))

        if paired
          new_text = new_text.gsub(annotation_pattern(entity), entity[3])
          reasons << "#{key_name}: exact English annotation cross-checked"
        else
          found = found_korean_forms(new_text, entity)
          alternatives = found - [canonical]
          if !alternatives.empty?
            alternatives.sort_by { |form| -form.length }.each do |form|
              new_text = new_text.gsub(korean_form_pattern(form), canonical)
            end
            reasons << "#{key_name}: normalized token-bounded Korean variant(s) #{alternatives.join('|')} from the exact English source hit"
          elsif found.include?(canonical)
            if COLLISION_RISK_CANONICALS.include?(key_name) && !paired
              uncertain << key_name
              reasons << "#{key_name}: Korean form is collision-prone without an exact English annotation; unchanged"
            else
              reasons << "#{key_name}: Korean form retained; no exact English annotation to normalize"
            end
          else
            uncertain << key_name
            reasons << "#{key_name}: no token-bounded canonical/known Korean form; it may be omitted, paraphrased, or a compound/title; unchanged rather than inserting or guessing"
          end
        end
      end

      if !uncertain.empty?
        new_text = old
        status = 'uncertain'
      elsif new_text != old
        status = 'accepted'
      else
        status = 'not-an-issue'
      end

      evidence = [
        'Generated candidate from this exact English source hit and token-bounded Korean form; Japanese/Chinese/current Korean fields are included for review. This row has not necessarily received individual human audit.',
        "Exact source entities: #{hits.map { |entity| entity[0] }.join('|')}.",
        reasons.join('; ')
      ].join(' ')
      row = [
        *key, hits.map { |entity| entity[0] }.join('|'), status, old, new_text,
        evidence, english.join("\n---\n"),
        locale_texts(source, 'ja_texts_json').join("\n---\n"),
        source.fetch('zh_text').to_s
      ]

      if rows.key?(key)
        prior = rows.fetch(key)
        raise "conflicting duplicate key #{key.inspect}" unless prior[5..6] == row[5..6]
        prior[3] = (prior[3].split('|') | hits.map { |entity| entity[0] }).join('|')
      else
        rows[key] = row
      end
    rescue JSON::ParserError => error
      raise "invalid locale JSON at #{key.inspect}: #{error.message}"
    end

    rows.values.sort_by { |row| [row[0], row[1].to_i, row[2]] }
  end

  def build_glossary(inventory)
    ENTITIES.map do |entity|
      matching = inventory.select do |source|
        source_hits?(english_texts(source), entity[1])
      end
      evidence = entity[6].split('|') + matching.first(3).map do |source|
        "#{source.fetch('resource')}:#{source.fetch('ID_Linha')}"
      end
      note = "#{entity[7]} Exact English source matches: #{matching.length} inventory rows."
      status = 'confirmed'
      [
        entity[0], entity[1], entity[2], entity[3], entity[4], entity[5],
        evidence.uniq.join('|'), status, note
      ]
    end
  end

  def run
    inventory_path = '/private/tmp/proper-name-source-inventory.tsv'
    shared_glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    additions_path = File.join(__dir__, 'proper-name-world-additions.tsv')
    proposals_path = File.join(__dir__, 'proper-name-proposals-world.tsv')
    inventory = CSV.read(inventory_path, headers: true, col_sep: "\t")
    existing = CSV.read(shared_glossary_path, headers: true, col_sep: "\t").map(&:to_h)
    existing_keys = existing.map { |row| row.fetch('entity_key') }
    overlap = ENTITIES.map(&:first) & existing_keys
    raise "requested entity keys already exist in shared glossary: #{overlap.join(', ')}" unless overlap.empty?

    additions = build_glossary(inventory)
    proposals = build_proposals(inventory)
    CSV.open(additions_path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << GLOSSARY_HEADERS
      additions.each { |row| csv << row }
    end
    CSV.open(proposals_path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      proposals.each { |row| csv << row }
    end

    puts "Wrote #{additions.length} glossary additions to #{additions_path}"
    puts "Wrote #{proposals.length} source-enriched proposal rows to #{proposals_path}"
    puts proposals.group_by { |row| row[4] }.transform_values(&:length).inspect
    puts "Scope by resource: #{proposals.group_by { |row| row[0] }.transform_values(&:length).inspect}"
  end
end

if $PROGRAM_NAME == __FILE__
  WorldNameReview.run
end
