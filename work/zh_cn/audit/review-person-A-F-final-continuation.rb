#!/usr/bin/env ruby

require 'csv'
require 'json'

module PersonAFFinalReview
  ROOT = File.expand_path('../../..', __dir__)
  AUDIT = __dir__
  INDEX = File.join(AUDIT, 'proper-name-occurrences.tsv')
  GLOSSARY = File.join(AUDIT, 'proper-name-glossary.tsv')
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  OUTPUT = File.join(AUDIT, 'proper-name-reviewed-A-F-final-continuation.tsv')
  EXCLUDED_KEYS = %w[person:anokatos person:anru person:anwon].freeze
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze

  # These source-supported complete forms are not separate glossary entities,
  # but replacing only the indexed surname/given-name fragment would lose identity.
  EXTRA_FORMS = {
    'person:anwy' => [
      ['Gwyn Anwy', '그윈 안웨이', %w[그윈 안웨이 그윈 앤위 그윈 안위]],
      ['Ena Anwy', '에나 안웨이', %w[에나 안웨이 에나 안위]]
    ],
    'person:arick' => [
      ['Arick Nareen', '아릭 나린', %w[아릭 나린 애릭 나린 아릭 나레인]],
      ['Black Arick', '검은 아릭', %w[검은 아릭 블랙 아릭 블랙 애릭]]
    ],
    'person:arnick' => [
      ['Arnick Arduna', '아르닉 아르두나', %w[아르닉 아르두나 아닉 아르두나]]
    ],
    'person:arigal' => [
      ['Maeve Arigal', '메이브 아리갈', %w[메이브 아리갈]]
    ],
    'person:atheof' => [
      ['Atheof Cergren', '아테오프 세르그렌',
       %w[아테오프 세르그렌 아세오프 세르그렌 아시오프 세르그렌 아테오프 서그렌 아시오프 서그렌 아세오프 서그렌 에시프 세르그렌 에시오프 세르그렌]]
    ],
    'person:azo' => [
      ['Azo Raemund', '아조 레이먼드',
       %w[아조 레이먼드 아조 레이문드 아조 라에문드 아조 래먼드]]
    ]
  }.freeze

  EXCLUDED_CONTEXTS = {
    'person:anwy' => [
      /\bEna Anwy's Corpse\b/i
    ],
    'person:arawyn' => [
      /\bArawyn Trade Writ\b/i
    ],
    'person:arba' => [
      /\bBreath of Arba\b/i
    ],
    'person:arkes' => [
      /\b(?:Circlet|Crypt|Tomb) of Arkes\b/i,
      /\bArkes['’]s? (?:Circlet|circlet)\b/i
    ],
    'person:arden' => [
      /\bArden['’]s Hut\b/i
    ],
    'person:darkvari' => [
      /\bDarkvari (?:Key|Colliery|Treasure Map|contract|Mine|Outlaw)\b/i
    ],
    'person:azo' => [
      /\bAzo['’]s (?:Wealth|Wish|Wisdom)\b/i
    ],
    'person:aurenda' => [
      /\b(?:Find|Return|And) Aurenda['’]s (?:Light|lamp)\b/i
    ],
    'person:cryamor' => [
      /\b(?:pet )?sword Cryamor\b/i
    ]
  }.freeze

  module_function

  def read_tsv(path)
    CSV.read(path, headers: true, col_sep: "\t", liberal_parsing: true).map(&:to_h)
  end

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def decode(source, field)
    JSON.parse(source[field] || '[]').compact
  end

  def aligned(source)
    [
      source.fetch('work_text'),
      decode(source, 'en_texts_json').join("\n"),
      decode(source, 'ja_texts_json').join("\n---\n"),
      source['zh_text'].to_s
    ]
  end

  def person_key?(entity)
    entity.start_with?('person:') &&
      ('a'..'f').cover?(entity.delete_prefix('person:')[0].to_s.downcase) &&
      !EXCLUDED_KEYS.include?(entity)
  end

  def english_present?(text, phrase)
    text.match?(/(?<![[:alnum:]])#{Regexp.escape(phrase)}(?![[:alnum:]])/i)
  end

  def relevant_full_glossary_forms(entity, english)
    @glossary.values.select do |candidate|
      next false unless candidate['entity_key'].start_with?('person:')
      full = candidate['english_canonical'].to_s
      words = full.split
      words.length > 1 && words.any? { |word| word.casecmp(entity['english_canonical'].to_s).zero? } &&
        english_present?(english, full)
    end.sort_by { |candidate| -candidate['english_canonical'].to_s.length }
  end

  def forms_for(entity_key, entity, english, source)
    forms = []
    relevant_full_glossary_forms(entity, english).each do |full|
      forms << [
        full['english_canonical'],
        full['korean_canonical'].to_s.split('(').first,
        full['korean_variants'].to_s.split('|')
      ]
    end
    (EXTRA_FORMS[entity_key] || []).each do |form|
      forms << form if english_present?(english, form[0])
    end

    english_form = entity['english_canonical'].to_s
    if english_present?(english, english_form)
      surfaces = entity['korean_variants'].to_s.split('|')
      surfaces << entity['korean_canonical'].to_s.split('(').first
      forms << [english_form, entity['korean_canonical'].to_s.split('(').first, surfaces]
    end

    if forms.empty?
      forms << [english_form, entity['korean_canonical'].to_s.split('(').first,
                entity['korean_variants'].to_s.split('|')]
    end
    forms.uniq { |form| [form[0], form[1]] }.sort_by { |form| -form[0].length }
  end

  def exclusion_reason(entity_key, source, english)
    (EXCLUDED_CONTEXTS[entity_key] || []).each do |pattern|
      next unless english.match?(pattern)
      if entity_key == 'person:arkes' &&
         english.match?(/\bArkes\b.*\b(?:was|is|master|Primos|told|said|spoke|died|found|met)\b/i)
        return ['uncertain', 'The row contains both a person-context mention and a named circlet/crypt reference; their Korean spans cannot be separated confidently without a row-focused edit.']
      end
      if entity_key == 'person:arba' &&
         english.match?(/\b(?:mage|sorcerer|summoner|named|work of|studying the work of|since)\s+Arba\b/i)
        return ['uncertain', 'The row mixes the named Breath of Arba item with a direct Arba person reference; preserved it pending occurrence-level separation.']
      end
      if entity_key == 'person:anwy' && pattern.source.include?('Ena Anwy') &&
         source['resource'] != 'base'
        next
      end
      return ['excluded', 'The English occurrence names an object, location, or item rather than a person; Japanese/Chinese aligned labels support that reading.']
    end

    if entity_key == 'person:darkvari' &&
       english.match?(/\b(?:Darkvari family|Darkvari clan|the Darkvari|Darkvari people|Darkvaris)\b/i) &&
       !english.match?(/\b[A-Z][a-z]+\s+Darkvari\b/)
      return ['excluded', 'The aligned English refers to the Darkvari family/people collectively, not an individual; Japanese and Chinese retain the collective reading.']
    end
    nil
  end

  def surface_regex(surface, english_form)
    escaped = Regexp.escape(surface)
    paired_english = Regexp.escape(english_form).gsub('\\ ', '\\s+')
    Regexp.new(
      "#{escaped}(?:\\(#{paired_english}\\))?" \
      "(?=(?:이|가|을|를|은|는|의|에게|한테|께|와|과|도|만|에|에서|로|으로|부터|까지|처럼|보다|라고|이라는|라는|이란|란|로서|으로서|에겐|이여|아|야|[[:punct:][:space:]]|$))"
    )
  end

  def review_one(index_row, source, entity)
    old, english, japanese, chinese = aligned(source)
    entity_key = index_row.fetch('entity_key')
    excluded = exclusion_reason(entity_key, source, english)
    if excluded
      return [excluded[0], old, excluded[1]]
    end

    forms = forms_for(entity_key, entity, english, source)
    updated = old.dup
    changed = []
    recognized = false

    forms.each do |english_form, korean_target, surfaces|
      next if korean_target.to_s.empty? || !english_present?(english, english_form)
      surfaces = surfaces.compact.map(&:strip).reject(&:empty?).uniq
        .sort_by { |surface| -surface.length }
      surfaces.each do |surface|
        pattern = surface_regex(surface, english_form)
        next unless updated.match?(pattern)
        recognized = true
        replacement = "#{korean_target}(#{english_form})"
        updated = updated.gsub(pattern) do |matched|
          offset = Regexp.last_match.begin(0)
          covered_by_full_name = forms.any? do |other_english, other_korean, _other_surfaces|
            next false unless other_korean.to_s.length > korean_target.to_s.length &&
                              other_korean.start_with?("#{surface} ")
            updated[offset, "#{other_korean}(#{other_english})".length] ==
              "#{other_korean}(#{other_english})"
          end
          next matched if covered_by_full_name
          next matched if matched == replacement
          changed << "#{surface}=>#{replacement}"
          replacement
        end
      end
    end

    if updated != old
      ['accepted', updated, "Person-context reviewed against the English identity/meaning anchor and aligned Japanese/Chinese; normalized only recognized Korean name spans (#{changed.uniq.join('; ')}), preserving surrounding prose and particles."]
    elsif recognized
      ['not-an-issue', old, 'Person-context reviewed against English and aligned Japanese/Chinese; the recognized Korean name is already correctly paired with its canonical bilingual form.']
    else
      ['uncertain', old, 'The aligned source identifies a candidate person mention, but no bounded Korean name span from the confirmed glossary/row form could be safely matched; preserved the entire cell pending focused review.']
    end
  end

  def combine(index_rows, source)
    old, english, japanese, chinese = aligned(source)
    updated = old.dup
    decisions = index_rows.map do |index_row|
      entity_key = index_row.fetch('entity_key')
      entity = @glossary[entity_key]
      raise "missing glossary entity #{entity_key}" unless entity
      current_source = source.merge('work_text' => updated)
      status, proposed, evidence = review_one(index_row, current_source, entity)
      updated = proposed if status == 'accepted'
      [entity_key, status, proposed, evidence]
    end

    accepted = decisions.select { |decision| decision[1] == 'accepted' }
    mixed_exclusion = accepted.any? &&
      decisions.any? { |decision| %w[excluded uncertain].include?(decision[1]) }
    conflicts = mixed_exclusion || (accepted.empty? &&
      decisions.select { |decision| decision[1] != 'accepted' }
        .any? { |decision| decision[2] != old })
    if conflicts
      status = 'uncertain'
      new_text = old
      evidence = 'Same-row entity decisions conflict; preserved the source cell rather than merging an unsafe transformation. ' +
        decisions.map { |decision| "#{decision[0]}: #{decision[3]}" }.join(' | ')
    else
      status = if accepted.any?
        'accepted'
      elsif decisions.any? { |decision| decision[1] == 'uncertain' }
        'uncertain'
      elsif decisions.any? { |decision| decision[1] == 'not-an-issue' }
        'not-an-issue'
      else
        'excluded'
      end

      new_text = accepted.empty? ? old : updated
      evidence = decisions.map { |decision| "#{decision[0]}: #{decision[3]}" }.join(' | ')
    end

    {
      'resource' => source.fetch('resource'),
      'ID_Linha' => source.fetch('ID_Linha'),
      'Tipo_Variante' => source['Tipo_Variante'].to_s,
      'entity_key' => decisions.map(&:first).uniq.sort.join('|'),
      'status' => status,
      'old' => old,
      'new' => new_text,
      'evidence' => evidence,
      'english' => english,
      'japanese' => japanese,
      'chinese' => chinese
    }
  end

  def run
    index = read_tsv(INDEX).select do |row|
      row['status'] == 'needs-context' && person_key?(row['entity_key'])
    end
    inventory = read_tsv(INVENTORY).to_h { |row| [key(row), row] }
    @glossary = read_tsv(GLOSSARY).select { |row| row['category'] == 'person' }
      .to_h { |row| [row.fetch('entity_key'), row] }

    groups = index.group_by { |row| key(row) }
    rows = groups.map do |row_key, decisions|
      source = inventory.fetch(row_key) { raise "missing current source #{row_key.inspect}" }
      combined = combine(decisions, source)
      [row_key, combined]
    end.sort_by do |row_key, _row|
      [row_key[0], row_key[1].to_i, row_key[2]]
    end.map(&:last)

    raise 'duplicate output occurrence key' unless
      rows.map { |row| [row['resource'], row['ID_Linha'], row['Tipo_Variante']] }.uniq.length == rows.length
    rows.each do |row|
      if row['status'] != 'accepted' && row['old'] != row['new']
        raise "non-accepted transformation #{key(row).inspect}"
      end
      if row['status'] == 'accepted' && row['old'] == row['new']
        raise "accepted no-op #{key(row).inspect}"
      end
    end

    CSV.open(OUTPUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << HEADERS.map { |header| row[header] } }
    end
    puts "pending entity-occurrences=#{index.length}; unique row keys=#{rows.length}"
    puts rows.group_by { |row| row['status'] }.transform_values(&:length).sort.map { |status, count| "#{status}=#{count}" }.join(' ')
    puts "output=#{OUTPUT}"
  end
end

PersonAFFinalReview.run if $PROGRAM_NAME == __FILE__
