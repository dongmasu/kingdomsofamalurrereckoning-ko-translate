#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'review-person-M-Z-D20397'

module PersonUZFinalReview
  AUDIT = File.expand_path(__dir__)
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  INDEX = File.join(AUDIT, 'proper-name-occurrences.tsv')
  GLOSSARY = File.join(AUDIT, 'proper-name-glossary.tsv')
  OUT = File.join(AUDIT, 'proper-name-reviewed-U-Z-final.tsv')
  HEADERS = ReviewedNameBatches::HEADERS

  EXTRA_FORMS = {
    'person:ucobal' => %w[우코발],
    'person:uda' => %w[우다],
    'person:udin' => %w[우딘],
    'person:ugnar' => %w[우그나르 우그나],
    'person:unfer' => %w[언퍼],
    'person:urlik' => %w[울릭 우리크],
    'person:ursin' => %w[우르신],
    'person:varen' => %w[베런 바렌],
    'person:ventrinio' => %w[벤티리니오 벤트리니오 벤드리니오 벤투리니오],
    'person:vernt' => %w[버른트 베른트 번트 베른트],
    'person:vilsar' => %w[빌사르],
    'person:vire' => %w[비르 비어 비레 바이어],
    'person:vlaskar' => %w[블라스카르],
    'person:vogard' => %w[보가드],
    'person:vonne' => %w[본느 본],
    'person:vorm' => %w[보름 봄],
    'person:walen' => %w[웨일런 월런 월렌 와렌 워렌 웰런 왈렌 웨런 왈렌],
    'person:winred' => %w[윈레드],
    'person:wulf' => %w[울프],
    'person:wulflac' => %w[울플랙 울프랙 울플락 울프락],
    'person:wyl' => %w[윌 와일],
    'person:wyll' => %w[윌],
    'person:wylla' => %w[윌라],
    'person:wyvyrn' => %w[와이번 위번 위이번 위비른],
    'person:xeno' => %w[제노],
    'person:zoef' => %w[조프],
    'person:zotikus' => %w[조티쿠스],
    'person:zungar' => %w[중가르 준가르 즈웅가르]
  }.freeze
  FULL_NAME_ANNOTATION_REPAIRS = {
    'person:ugnar' => {
      'Ugnar Odgray' => 'Odgray'
    }
  }.freeze

  module_function

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def source_texts(row)
    en = JSON.parse(row.fetch('en_texts_json') || '[]').compact.join("\n---\n")
    ja = JSON.parse(row.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
    [en, ja, row.fetch('zh_text').to_s, row.fetch('work_text').to_s]
  end

  def english_hit?(english, term)
    english.match?(/(?<![A-Za-z0-9_])#{Regexp.escape(term)}(?![A-Za-z0-9_])/i)
  end

  def collision_reason(entity_key, english)
    case entity_key
    when 'person:vorm'
      return 'Vorm Lodge/Brothers is a place or family label, not a personal-name mention.' if
        english.match?(/\b(?:Vorm(?:\s+Lodge|\s+Brothers?|\s+family|s)|(?:the\s+)?brothers?\s+Vorm)\b/i)
    when 'person:zungar'
      return nil if english.match?(/\bFeld Zungar\b/i)
      return 'Zungar names a family, lineage, possession, or faction here, not an individual.' if
        english.match?(/\b(?:Zungar\s+(?:family|contract|shaft|key|outlaw|land|steel|boys|name|family bandits?)|Zungars|(?:like|unlike)\s+(?:the\s+)?Zungar)\b/i)
    when 'person:wyvyrn'
      return 'Wyvyrn-Gifre/Wyvyrn is used as a house or family label, not as an individual personal name.' if
        english.match?(/\bWyvyrn(?:-Gifre|s?)\b/i) &&
        !english.match?(/\b(?:Maiwen|Tanra|Ebsol)\s+Wyvyrn(?:-Gifre)?\b/i)
    when 'person:wulflac'
      return nil if english.match?(/\bCamden Wulflac\b/i)
      return 'Wulflac is used as a family surname without identifying the indexed person.' if
        english.match?(/\b(?:Ms\.?\s+Wulflac|Wulflac family|Wulflacs)\b/i)
    when 'person:vernt'
      return 'The Vernt family crest is a lineage label, not an individual mention.' if
        english.match?(/\bVernt family\b/i)
    end
    nil
  end

  def full_source_annotation?(text, english, term)
    text.scan(/\(([^()\r\n]*)\)/).flatten.any? do |annotation|
      next false unless annotation.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)

      # Preserve an annotation that covers the whole source name/compound.
      english.scan(/[A-Z][A-Za-z'-]*(?:\s+[A-Z][A-Za-z'-]*)+/).any? do |name|
        name.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i) &&
          annotation.match?(/(?<![A-Za-z])#{Regexp.escape(name)}(?![A-Za-z])/i)
      end
    end
  end

  def source_has_full_neighbor?(english, term)
    non_name_neighbors = %w[
      A An And Are As At Be But By Can Could Did Do Does For From He Here How I
      If In Is It Let May My No Not Of Oh On Or Our She So That The Then There
      They This To Was We Were What When Where Which Who Why Will With You Your
    ]
    spans = PersonMZReview.english_spans(english, term)
    spans.any? do |span|
      before = english[0...span[0]].to_s[/([A-Z][A-Za-z'-]*)\s+\z/, 1]
      after = english[span[1]..].to_s[/\A\s+([A-Z][A-Za-z'-]*)/, 1]
      [before, after].compact.any? do |neighbor|
        !non_name_neighbors.include?(neighbor)
      end
    end
  end

  def forms(entity)
    canonical = PersonMZReview.korean_base(entity)
    ([
      canonical,
      *entity['korean_variants'].to_s.split('|'),
      *EXTRA_FORMS.fetch(entity.fetch('entity_key'), [])
    ]).map { |form| form.to_s.split('(').first }
      .reject(&:empty?)
      .uniq
      .sort_by { |form| -form.length }
  end

  def scope_safe_suggestion?(suggestion)
    return false unless suggestion

    suggestion[3].to_s.split('|').all? { |entity| entity.match?(/\Aperson:[u-z]/i) }
  end

  def korean_spans(text, form)
    spans = PersonMZReview.korean_spans(text, form)
    extra_suffixes = %w[처럼 라는]
    offset = 0
    while (start_at = text.index(form, offset))
      finish = start_at + form.length
      before = start_at.zero? ? nil : text[start_at - 1]
      suffix = text[finish..].to_s
      next_suffix = extra_suffixes.find { |value| suffix.start_with?(value) }
      if next_suffix && (!before || !before.match?(/\p{Hangul}/)) &&
         text[0...start_at].count('{') <= text[0...start_at].count('}')
        spans << [start_at, finish, form, nil, finish]
      end
      offset = finish
    end
    spans.uniq.sort_by { |span| [span[0], span[1]] }
  end

  def complete_existing_full_annotation(text, entity_key, english)
    if entity_key == 'person:wulflac' &&
       english.match?(/(?<![A-Za-z])Camden Wulflac(?![A-Za-z])/i) &&
       text.include?('캠든 울프랙') &&
       !text.include?('(Camden Wulflac)')
      return text.sub('캠든 울프랙', '캠든 울프랙(Camden Wulflac)')
    end

    repairs = FULL_NAME_ANNOTATION_REPAIRS.fetch(entity_key, {})
    repairs.each do |full_name, partial_name|
      next unless english.match?(/(?<![A-Za-z])#{Regexp.escape(full_name)}(?![A-Za-z])/i)
      next unless text.match?(/\p{Hangul}+\s+\p{Hangul}+\(#{Regexp.escape(partial_name)}\)/i)

      return text.sub("(#{partial_name})", "(#{full_name})")
    end
    if entity_key == 'person:vogard' &&
       english.match?(/(?<![A-Za-z])Ommer Vogard(?![A-Za-z])/i) &&
       text.include?('오머(Ommer) 보가드')
      return text.sub('오머(Ommer) 보가드', '오머 보가드(Ommer Vogard)')
    end
    text
  end

  def normalize_bare(text, entity, term, english)
    canonical = PersonMZReview.korean_base(entity)
    updated = text.dup
    changed = false
    found = false

    forms(entity).each do |form|
      korean_spans(updated, form).reverse_each do |span|
        start_at, finish, _matched, particle, particle_end = span
        next if updated[0...start_at].count('{') > updated[0...start_at].count('}')

        found = true
        annotation = PersonMZReview.parenthetical_at(updated, finish)
        if source_has_full_neighbor?(english, term)
          next
        end
        if annotation
          annotation_text, annotation_end = annotation
          tail_particle, tail_end = PersonMZReview.particle_after(updated, annotation_end)
          particle = tail_particle if tail_particle
          particle_end = tail_end if tail_particle
          next_particle = particle && PersonMZReview.corrected_particle(particle, canonical)
          replacement = "#{canonical}#{annotation_text}#{next_particle}"
          replace_end = particle ? particle_end : annotation_end
          updated[start_at...replace_end] = replacement
        else
          next_particle = particle && PersonMZReview.corrected_particle(particle, canonical)
          replace_end = particle ? particle_end : finish
          updated[start_at...replace_end] = "#{canonical}(#{term})#{next_particle}"
        end
        changed ||= updated != text
      end
    end
    [updated, changed, found]
  end

  def reason_for(status, entity_key, english, old_text, new_text)
    case status
    when 'accepted'
      "#{entity_key}: corrected only the reviewed Korean name span; complete bilingual compounds, titles, particles, tokens, and line breaks were preserved."
    when 'not-an-issue'
      "#{entity_key}: English identity is corroborated by the aligned Japanese and Chinese context; the Korean spelling or complete bilingual name is already retained."
    when 'excluded'
      collision_reason(entity_key, english) ||
        "#{entity_key}: this source occurrence is a family/place/collective label, not the individual personal-name entity."
    else
      "#{entity_key}: the aligned source identifies the candidate, but no uniquely safe Korean span can be changed without splitting or guessing a compound name."
    end
  end

  def run
    inventory_rows = CSV.read(INVENTORY, headers: true, col_sep: "\t")
    index = CSV.read(INDEX, headers: true, col_sep: "\t")
    glossary_rows = CSV.read(GLOSSARY, headers: true, col_sep: "\t")
    glossary = glossary_rows.to_h { |row| [row.fetch('entity_key'), row.to_h] }
    source_by_key = inventory_rows.to_h { |row| [key(row), row.to_h] }

    pending = index.select do |row|
      row['status'] == 'needs-context' &&
        row['entity_key'].to_s.match?(/\Aperson:[u-z]/i)
    end
    raise 'empty U-Z scope' if pending.empty?
    grouped = pending.group_by { |row| key(row) }

    # Recompute suggestions against the current aligned inventory; the old
    # proposal TSV is never used as an approval source.
    suggestions = PersonMZReview.build(inventory_rows, glossary_rows.map(&:to_h))
      .select { |row| row[3].to_s.split('|').any? { |entity| entity.match?(/\Aperson:[u-z]/i) } }
      .to_h { |row| [[row[0], row[1], row[2].to_s], row] }

    output = []
    stale_index_text_matches = 0
    grouped.each do |row_key, occurrences|
      source = source_by_key.fetch(row_key) { raise "missing aligned inventory row #{row_key.inspect}" }
      english, japanese, chinese, old_text = source_texts(source)
      stale_index_text_matches += occurrences.count { |row| row['korean_current'] != old_text }

      suggestion = suggestions[row_key]
      suggestion = nil unless scope_safe_suggestion?(suggestion)
      proposed_new = old_text
      dispositions = {}
      evidence_parts = []

      occurrences.map { |row| row['entity_key'] }.uniq.sort.each do |entity_key|
        entity = glossary.fetch(entity_key) { raise "missing glossary row #{entity_key}" }
        matching = occurrences.select { |row| row['entity_key'] == entity_key }
        indexed_terms = matching.flat_map do |row|
          row.fetch('matched_english').to_s.split('|')
        end.uniq
        terms = indexed_terms.select { |term| english_hit?(english, term) }
        raise "source English mismatch at #{row_key.inspect} #{entity_key}" if terms.empty?
        collision = terms.map { |term| collision_reason(entity_key, english) }.compact.first

        if collision
          status = 'excluded'
          reason = collision
        elsif entity_key == 'person:wyvyrn'
          # Never split a Wyvyrn-Gifre source compound into component labels.
          full_present = english.match?(/\b(?:Maiwen|Tanra|Ebsol)\s+Wyvyrn-Gifre\b/i)
          status = full_present ? 'not-an-issue' : 'excluded'
          reason = if full_present
                     'The complete Korean personal/family compound is retained atomically; no Wyvyrn component annotation is introduced.'
                   else
                     'Wyvyrn-Gifre is a house/family compound here; protected from nested Wyvyrn and Wyvyrn-Gifre labels.'
                   end
        elsif (completed = complete_existing_full_annotation(old_text, entity_key, english)) != old_text
          status = 'accepted'
          proposed_new = completed
          reason = 'Completed the exact source-supported full-name annotation as one bilingual unit; no component annotation remains.'
        elsif full_source_annotation?(old_text, english, terms.first)
          status = 'not-an-issue'
          reason = 'The exact source-supported full-name bilingual annotation is already present; retained atomically without a component label.'
        elsif suggestion && suggestion[4] == 'uncertain'
          updated, changed, found = normalize_bare(old_text, entity, terms.first, english)
          if changed && !source_has_full_neighbor?(english, terms.first)
            status = 'accepted'
            proposed_new = updated
            reason = 'Resolved the live Korean spelling with the reviewed source form and Japanese/Chinese corroboration; kept the edit to one bare name span.'
          elsif full_source_annotation?(old_text, english, terms.first)
            status = 'not-an-issue'
            reason = 'The exact source-supported full-name bilingual annotation is already present; retained atomically without a component label.'
          elsif source_has_full_neighbor?(english, terms.first) &&
                old_text.match?(/\p{Hangul}/)
            status = 'not-an-issue'
            reason = 'The complete Korean personal-name/title span is retained; no component annotation was added to an unregistered full name.'
          else
            status = 'uncertain'
            reason = suggestion[7].to_s.sub(/\A.*?unresolved:\s*/, '')
          end
        elsif suggestion
          status = suggestion[4]
          reason = status == 'accepted' ?
            'English name occurrence was checked against the aligned Japanese and Chinese contexts; only the Korean candidate spelling/annotation was normalized.' :
            'The aligned Korean name and bilingual annotation are already correct.'
        else
          updated, changed, found = normalize_bare(old_text, entity, terms.first, english)
          if source_has_full_neighbor?(english, terms.first) && !full_source_annotation?(old_text, english, terms.first)
            status = found ? 'uncertain' : 'uncertain'
            reason = 'A full source name/title is present, but there is no safely bounded complete Korean bilingual label to normalize.'
          elsif found && changed
            status = 'accepted'
            proposed_new = updated
            reason = 'The exact English personal-name occurrence and Japanese/Chinese counterparts were checked; normalized the supported Korean form as one label.'
          elsif found
            status = 'not-an-issue'
            reason = 'The Korean form is already canonical or belongs to a complete bilingual compound; retained without component edits.'
          else
            status = 'uncertain'
            reason = 'The English identity is clear, but the Korean source row has no boundary-safe matching personal-name span.'
          end
        end

        dispositions[entity_key] = status
        evidence_parts << "#{entity_key}: #{reason}"
      end

      # Use the freshly recomputed full-row suggestion only for accepted,
      # non-overlapping edits. Every protected family compound remains exact.
      if occurrences.any? { |row| row['entity_key'] == 'person:wyvyrn' }
        proposed_new = old_text
      elsif suggestion && suggestion[4] == 'accepted' &&
            dispositions.values.any? { |status| status == 'accepted' }
        proposed_new = suggestion[6]
      end

      statuses = dispositions.values.uniq
      overall = if statuses.include?('uncertain')
                  'uncertain'
                elsif statuses.include?('accepted')
                  'accepted'
                elsif statuses.include?('not-an-issue')
                  'not-an-issue'
                else
                  'excluded'
                end
      raise "non-accepted edit at #{row_key.inspect}" if overall != 'accepted' && proposed_new != old_text
      raise "accepted no-op at #{row_key.inspect}" if overall == 'accepted' && proposed_new == old_text
      raise "changed token/line breaks at #{row_key.inspect}" unless
        old_text.scan(/\{[^{}]*\}/) == proposed_new.scan(/\{[^{}]*\}/) &&
        old_text.scan(/\r\n|\r|\n/) == proposed_new.scan(/\r\n|\r|\n/)
      raise "unbalanced parentheses at #{row_key.inspect}" unless
        proposed_new.count('(') == proposed_new.count(')')
      old_text.scan(/\([^()\r\n]*\)/).each do |annotation|
        replaced_by_full_name = annotation == '(Odgray)' &&
          row_key[0] == 'default' &&
          english.match?(/(?<![A-Za-z])Ugnar Odgray(?![A-Za-z])/i) &&
          proposed_new.include?('(Ugnar Odgray)')
        replaced_by_full_name ||= annotation == '(Ommer)' &&
          english.match?(/(?<![A-Za-z])Ommer Vogard(?![A-Za-z])/i) &&
          proposed_new.include?('(Ommer Vogard)')
        raise "lost source annotation at #{row_key.inspect}" unless
          proposed_new.include?(annotation) || replaced_by_full_name
      end
      raise "nested Wyvyrn compound annotation at #{row_key.inspect}" if
        proposed_new.match?(/와이번\s*\(Wyvyrn\)\s*-\s*기프(?:레|르)\s*\(Wyvyrn-Gifre\)/i)

      dispositions_json = JSON.generate(dispositions)
      previous = occurrences.map { |row| row['evidence'].to_s }.uniq.join(' | ')
      output << {
        'resource' => row_key[0],
        'ID_Linha' => row_key[1],
        'Tipo_Variante' => row_key[2],
        'entity_key' => dispositions.keys.sort.join('|'),
        'status' => overall,
        'old' => old_text,
        'new' => proposed_new,
        'evidence' => "D-U-Z reviewed; English anchored first; exact aligned Japanese and Chinese contexts retained for corroboration. #{evidence_parts.join(' ')}",
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => dispositions_json,
        'previous_status' => occurrences.map { |row| row['status'] }.uniq.join('|'),
        'previous_evidence' => previous
      }
    end

    keys = output.map { |row| [row['resource'], row['ID_Linha'], row['Tipo_Variante']] }
    raise 'duplicate resource/ID/variant rows' unless keys.uniq.length == keys.length
    raise 'incomplete U-Z coverage' unless output.length == grouped.length
    ReviewedNameBatches.write_table(OUT, HEADERS, output.sort_by do |row|
      [row['resource'], row['ID_Linha'].to_i, row['Tipo_Variante']]
    end)
    counts = output.group_by { |row| row['status'] }.transform_values(&:length)
    entity_count = pending.map { |row| row['entity_key'] }.uniq.length
    puts "Wrote #{output.length} unique rows for #{entity_count} U-Z entities; matches=#{pending.length}; statuses=#{counts.inspect}"
    puts "Used aligned inventory text for #{stale_index_text_matches} rows whose indexed Korean snapshot lagged."
  end
end

PersonUZFinalReview.run if $PROGRAM_NAME == __FILE__
