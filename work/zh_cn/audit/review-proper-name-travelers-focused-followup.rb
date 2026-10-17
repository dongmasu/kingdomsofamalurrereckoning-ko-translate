#!/usr/bin/env ruby

require 'csv'
require 'json'

module TravelersFocusedFollowup
  PREVIEW = '/private/tmp/factions-preview.tsv'
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  OUTPUT = '/private/tmp/travelers-followup-reviewed.tsv'
  ENTITY = 'faction:travelers'
  KOREAN_CANONICAL = '트래블러'
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    pre_edit_text english japanese chinese source_drift preview_status
    preview_evidence
  ].freeze
  OPAQUE = /\$[^$]*\$|<[^>\r\n]*>|\{[^{}\r\n]*\}/
  KOREAN_TERM = /(?<![가-힣A-Za-z0-9_])(?<variant>트래블러(?:스|즈)?|여행자단|여행자|여행객)(?<morph>들)?(?:[ \t]*\((?<label>[^()\r\n]*)\))?/i
  ENGLISH_TERM = /\bTravelers?\b/i
  ENGLISH_FACTION_CUE = /\b(?:join(?:ed|ing)?\s+(?:the\s+)?Travelers?|members?\s+of\s+(?:the\s+)?Travelers?|belong(?:s|ed|ing)?\s+to\s+(?:the\s+)?Travelers?|(?:leave|left)\s+(?:the\s+)?Travelers?|(?:the\s+)?Travelers?\s+(?:faction|guild|order|camp|rank|organization|collective)|(?:faction|guild|order|organization)\s+of\s+(?:the\s+)?Travelers?|(?:hierophant|leaders?|recruits?|ranks?)\s+of\s+(?:the\s+)?Travelers?|Travelers?\s+(?:in|at|of)\s+(?:the\s+)?(?:Star|Moon|Sun)\s+Camp|we\s+Travelers?\b|our\s+Travelers?\b|all\s+Travelers?\b|within\s+the\s+Travelers?\b|enemy\s+of\s+the\s+Travelers?|Travelers?[^.!?]{0,100}\bHierophant\b|the\s+Hierophant[^.!?]{0,100}\bTravelers?\b)\b/i
  TITLE_ONLY = /\b(?:Traveler(?:'s)? (?:Band|Caravan|Satchel|Sloop)|Travelers Tales)\b/i

  module_function

  def rows(path)
    CSV.read(path, col_sep: "\t", headers: true, encoding: 'bom|utf-8')
  end

  def key(row)
    %w[resource ID_Linha Tipo_Variante].map { |field| row[field].to_s }
  end

  def source_texts(source)
    english = JSON.parse(source['en_texts_json'].to_s.empty? ? '[]' : source['en_texts_json']).compact.join("\n")
    japanese = JSON.parse(source['ja_texts_json'].to_s.empty? ? '[]' : source['ja_texts_json']).compact.join("\n")
    [english, japanese, source['zh_text'].to_s]
  end

  def inside_parentheses?(text, position)
    depth = 0
    text[0...position].each_char do |char|
      depth += 1 if char == '('
      depth -= 1 if char == ')' && depth.positive?
    end
    depth.positive?
  end

  def matches(text, pattern)
    text.to_enum(:scan, pattern).map { Regexp.last_match.dup }
  end

  def particle_for_vowel_stem(particle)
    {
      '은' => '는',
      '는' => '는',
      '이' => '가',
      '가' => '가',
      '을' => '를',
      '를' => '를',
      '과' => '와',
      '와' => '와',
      '으로' => '로',
      '로' => '로'
    }[particle]
  end

  def source_forms(english)
    matches(english, ENGLISH_TERM).map do |match|
      match.to_s.casecmp('Traveler').zero? ? 'Traveler' : 'Travelers'
    end.uniq
  end

  def transform_korean(old, english_forms)
    found = matches(old, KOREAN_TERM)
    opaque = matches(old, OPAQUE).map { |match| [match.begin(0), match.end(0)] }
    patches = []
    notes = []

    found.each do |match|
      first = match.begin(0)
      last = match.end(0)
      next if opaque.any? { |left, right| first < right && left < last }
      next if inside_parentheses?(old, first)

      label = match[:label]
      if label
        unless label.match?(/\ATravelers?\z/i)
          notes << 'The adjacent parenthetical is not exactly Traveler or Travelers; preserve the row for manual review.'
          next
        end
        target_form = english_forms.include?(label) ? label : english_forms.first
      else
        tail = old[last..].to_s
        compound = tail.match(/\A(?<bridge>[\p{Hangul}\s,·'’\-]{0,60})\((?<full>[^()\r\n]*)\)/)
        if compound && compound[:full].match?(ENGLISH_TERM)
          notes << 'The Korean term belongs to an already labeled full compound; preserve that atomic bilingual label.'
          next
        end
        if tail.match?(/\A[ \t]*\(/)
          notes << 'An adjacent parenthetical is not a safely bounded Travelers label; no text changed.'
          next
        end
        if english_forms.length != 1
          notes << 'English contains singular and plural source forms, so this unlabeled Korean mention cannot be assigned safely.'
          next
        end
        target_form = english_forms.first
      end
      replacement = "#{KOREAN_CANONICAL}(#{target_form})#{match[:morph]}"

      patch_last = last
      unless match[:morph] == '들'
        particle = old[last..].to_s.match(/\A(?:으로|은|는|이|가|을|를|과|와|로)/)
        if particle
          replacement += particle_for_vowel_stem(particle[0])
          patch_last += particle[0].length
        end
      end
      patches << [first, patch_last, replacement]
    end

    return [old, notes, found.length] if patches.empty?

    text = old.dup
    patches.sort_by(&:first).reverse_each do |first, last, replacement|
      text[first...last] = replacement
    end
    raise 'opaque Korean text changed' unless old.scan(OPAQUE) == text.scan(OPAQUE)
    raise 'line breaks changed' unless old.scan(/\r\n|\r|\n/) == text.scan(/\r\n|\r|\n/)
    [text, notes, found.length]
  end

  def review(row, source)
    old = row.fetch('old')
    english, japanese, chinese = source_texts(source)
    drift = source['work_text'] == old ? 'no' : 'yes'
    base = {
      'resource' => row['resource'],
      'ID_Linha' => row['ID_Linha'],
      'Tipo_Variante' => row['Tipo_Variante'],
      'entity_key' => ENTITY,
      'old' => old,
      'pre_edit_text' => source['work_text'],
      'english' => english,
      'japanese' => japanese,
      'chinese' => chinese,
      'source_drift' => drift,
      'preview_status' => row['status'],
      'preview_evidence' => row['evidence']
    }

    forms = source_forms(english)
    if forms.empty?
      return base.merge(
        'status' => 'uncertain',
        'new' => old,
        'evidence' => 'The aligned English source no longer contains the Travelers term; retain the preview proposal unchanged.'
      )
    end

    japanese_faction = japanese.match?(/トラベラー/)
    japanese_ordinary = japanese.match?(/旅人/)
    if japanese_faction && japanese_ordinary
      return base.merge(
        'status' => 'uncertain',
        'new' => old,
        'evidence' => 'Japanese contains both faction-form トラベラー and ordinary 旅人; this row may mix referents, so no Korean span is changed.'
      )
    end

    if japanese_ordinary && !japanese_faction
      status = english.match?(ENGLISH_FACTION_CUE) ? 'uncertain' : 'excluded'
      reason = status == 'excluded' ?
        'Japanese uses ordinary 旅人 without faction-form トラベラー; English meaning is compatible with an ordinary traveler, so preserve Korean.' :
        'English suggests faction membership but Japanese uses ordinary 旅人; the cross-language conflict is unresolved, so preserve Korean.'
      return base.merge('status' => status, 'new' => old, 'evidence' => reason)
    end

    unless japanese_faction
      return base.merge(
        'status' => 'uncertain',
        'new' => old,
        'evidence' => 'Japanese has no decisive faction-form トラベラー or ordinary 旅人 signal; Chinese 旅行者 alone is nondiagnostic, so preserve Korean.'
      )
    end

    if english.match?(TITLE_ONLY)
      return base.merge(
        'status' => 'excluded',
        'new' => old,
        'evidence' => 'English identifies a Traveler-derived equipment/title term, not a safe standalone faction reference; preserve the existing Korean title.'
      )
    end

    proposed, notes, korean_matches = transform_korean(old, forms)
    unless notes.empty?
      return base.merge(
        'status' => 'uncertain',
        'new' => old,
        'evidence' => "Japanese faction-form トラベラー aligns with the English Travelers reference; #{notes.join(' ')}"
      )
    end
    if korean_matches.zero?
      return base.merge(
        'status' => 'uncertain',
        'new' => old,
        'evidence' => 'Japanese faction-form トラベラー and the English Travelers reference agree, but no safely bounded Korean counterpart was found.'
      )
    end

    status = proposed == old ? 'not-an-issue' : 'accepted'
    support = chinese.match?(/旅行者/) ? 'Chinese 旅行者 corroborates the referent.' : 'Chinese is not independently diagnostic.'
    source_form_note = if forms.length == 1
                         "The English source form is #{forms.first}; preserve or normalize the label to that exact form."
                       else
                         "The English source uses both #{forms.join(' and ')}; preserve source-matching labels and hold unlabeled spans."
                       end
    base.merge(
      'status' => status,
      'new' => proposed,
      'evidence' => "English context and Japanese faction-form トラベラー identify the Travelers faction; #{source_form_note} #{support} Normalize only bounded Korean faction spans to 트래블러(#{forms.length == 1 ? forms.first : 'source-matching form'}), preserving particle function with Korean allomorphy, surrounding prose, and full compound labels."
    )
  end

  def run
    preview = rows(PREVIEW).select do |row|
      row['entity_key'] == ENTITY && row['status'] == 'uncertain'
    end
    inventory = rows(INVENTORY).to_h { |row| [key(row), row] }
    raise 'duplicate uncertain Travelers preview key' unless preview.map { |row| key(row) }.uniq.length == preview.length

    reviews = preview.map do |row|
      source = inventory[key(row)]
      raise "source inventory key missing: #{key(row).inspect}" unless source
      review(row, source)
    end
    CSV.open(OUTPUT, 'wb', col_sep: "\t", write_headers: true, headers: HEADERS) do |csv|
      reviews.each { |reviewed| csv << HEADERS.map { |header| reviewed[header] } }
    end

    counts = reviews.group_by { |row| row['status'] }.transform_values(&:length)
    changed = reviews.count { |row| row['old'] != row['new'] }
    drift = reviews.count { |row| row['source_drift'] == 'yes' }
    puts "Travelers uncertain keys reviewed=#{reviews.length}; dispositions=#{counts.sort.to_h}; " \
         "proposed text changes=#{changed}; preview/source Korean drift=#{drift}; output=#{OUTPUT}"
  end
end

TravelersFocusedFollowup.run if $PROGRAM_NAME == __FILE__
