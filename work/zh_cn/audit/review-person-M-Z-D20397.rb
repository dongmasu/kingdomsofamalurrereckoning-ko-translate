#!/usr/bin/env ruby

require 'csv'
require 'json'

module PersonMZReview
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  AUDIT_DIR = File.expand_path(__dir__)
  GLOSSARY = File.join(AUDIT_DIR, 'proper-name-glossary.tsv')
  OUT = File.join(AUDIT_DIR, 'proper-name-proposals-M-Z-D20397.tsv')
  PARTICLES = {
    '이' => %w[이 가], '은' => %w[은 는], '을' => %w[을 를],
    '과' => %w[과 와], '으로' => %w[으로 로]
  }.freeze
  KOREAN_SUFFIXES = %w[
    으로부터 으로는 으로도 으로만 으로서 으로써
    에게서 에게는 에게도 에게만 에게 에서부터
    한테서 한테는 한테도 한테
    에서는 에서도 에서만 에서부터 에서
    까지부터 부터까지 까지는 까지도 까지만 까지
    조차마저 마저 조차 밖에 만큼처럼 처럼보다 보다
    이라도 라도 이나 나 은 는 이 가 을 를 의 에 로
    도 만 과 와 아 야 께서 께
  ].freeze
  REVIEWED_KOREAN_FORMS = {
    'person:quay' => %w[키]
  }.freeze

  module_function

  def terms(entity)
    [entity.fetch('english_canonical'), *entity['english_aliases'].to_s.split('|')]
      .reject(&:empty?).uniq
  end

  def english_spans(text, term)
    pattern = Regexp.new("(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])", Regexp::IGNORECASE)
    text.to_enum(:scan, pattern).map do
      match = Regexp.last_match
      [match.begin(0), match.end(0), match[0]]
    end
  end

  def korean_base(entity)
    entity.fetch('korean_canonical').split('(').first
  end

  def korean_forms(entity)
    ([korean_base(entity)] + entity['korean_variants'].to_s.split('|') +
      REVIEWED_KOREAN_FORMS.fetch(entity['entity_key'], []))
      .map { |form| form.split('(').first }
      .select { |form| form.match?(/\p{Hangul}/) && !form.empty? }
      .reject { |form| entity['entity_key'] == 'person:quay' && form == '부두' }
      .uniq
      .sort_by { |form| -form.length }
  end

  def coda?(form)
    last = form.each_char.to_a.last
    return false unless last && last.ord.between?(0xAC00, 0xD7A3)

    ((last.ord - 0xAC00) % 28) != 0
  end

  def particle_after(text, finish)
    PARTICLES.values.flatten.uniq.sort_by { |particle| -particle.length }.each do |particle|
      return [particle, finish + particle.length] if text[finish, particle.length] == particle
    end
    [nil, finish]
  end

  def corrected_particle(particle, base)
    if %w[으로 로].include?(particle)
      final = base.each_char.to_a.last
      has_coda = coda?(base)
      rieul = final && final.ord.between?(0xAC00, 0xD7A3) &&
              ((final.ord - 0xAC00) % 28) == 8
      has_coda && !rieul ? '으로' : '로'
    else
      pair = PARTICLES.values.find { |alternatives| alternatives.include?(particle) }
      coda?(base) ? pair[0] : pair[1]
    end
  end

  def korean_spans(text, form)
    spans = []
    offset = 0
    while (index = text.index(form, offset))
      finish = index + form.length
      before = index.zero? ? nil : text[index - 1]
      after = text[finish]
      particle, particle_end = particle_after(text, finish)
      left_ok = !before || !before.match?(/\p{Hangul}/)
      suffix = text[finish..].to_s
      known_suffix = KOREAN_SUFFIXES.any? { |ending| suffix.start_with?(ending) }
      right_ok = !after || !after.match?(/\p{Hangul}/) || particle || known_suffix
      unless text[0...index].count('{') > text[0...index].count('}') ||
             !left_ok || !right_ok
        spans << [index, finish, form, particle, particle_end]
      end
      offset = finish
    end
    spans
  end

  def parenthetical_at(text, finish)
    tail = text[finish..].to_s
    match = /\A([ \t]*\([^()\r\n]*\))/.match(tail)
    match && [match[1], finish + match[1].length]
  end

  def source_term_at(text, annotation, target_terms)
    return false unless annotation

    target_terms.any? do |term|
      annotation.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
    end
  end

  def proper_neighbor?(text, start_at, end_at)
    before = text[0...start_at].to_s[/([A-Z][A-Za-z'-]*)\s+\z/, 1]
    after = text[end_at..].to_s[/\A\s+([A-Z][A-Za-z'-]*)/, 1]
    [before, after].compact.any?
  end

  def generic_collision?(entity, term, text, span)
    key = entity.fetch('entity_key')
    tail = text[span[1]..].to_s
    return true if key == 'person:quay' && term.casecmp('Quay').zero? &&
                   tail.match?(/\A-side\b/i)
    return true if key == 'person:togh' && term.casecmp('Togh').zero? &&
                   tail.match?(/\A\s+farm\b/i)
    if key == 'person:skoria'
      prefix = text[0...span[0]].to_s
      return true if tail.match?(/\A\s+(?:family|men|land|property|mine|heirloom)\b/i)
      return true if prefix.match?(/\b(?:go to|access to|trespassing in|enter(?:ing)?|in)\s+\z/i)
    end
    if key == 'person:tirin' && tail.match?(/\A(?:'s|’s)\s+(?:Rest|Tree|Secret)\b/i)
      return true
    end

    false
  end

  def covered_possessive_compound?(hit, korean_text)
    tail = hit[:text][hit[:span][1]..].to_s
    match = /\A(?:'s|’s)\s+([A-Z][A-Za-z'-]*)/.match(tail)
    return false unless match

    compound = "#{hit[:term]}#{match[0]}"
    korean_text.match?(/\([^()]*#{Regexp.escape(compound)}[^()]*\)/i)
  end

  def component_covered?(text, span, full_spans)
    full_spans.any? do |full|
      full[:text].equal?(text) && full[:start] <= span[0] && full[:finish] >= span[1] &&
        !(full[:start] == span[0] && full[:finish] == span[1])
    end
  end

  def replace_titled_name(text, entity, source_term)
    forms = korean_forms(entity)
    title_forms = if source_term.match?(/\ASir\b/i)
                    forms.flat_map { |form| ["#{form} 경", "경 #{form}"] }
                  else
                    forms.flat_map { |form| ["#{form} 부인", "레이디 #{form}"] }
                  end.uniq.sort_by { |form| -form.length }
    hits = title_forms.flat_map { |form| korean_spans(text, form) }
      .sort_by { |span| [-span[0], -(span[1] - span[0])] }
    hits = hits.each_with_object([]) do |hit, chosen|
      chosen << hit unless chosen.any? { |prior| hit[0] < prior[1] && prior[0] < hit[1] }
    end
    return [text, false, "titled Korean form absent for #{source_term}"] if hits.empty?

    updated = text.dup
    changed = false
    hits.each do |start_at, finish, _form, particle, particle_end|
      annotation = parenthetical_at(updated, finish)
      if annotation && !source_term_at(updated, annotation[0], [source_term])
        return [text, false, "unrelated title parenthetical after #{source_term}"]
      end
      next if annotation

      suffix = particle ? corrected_particle(particle, korean_base(entity)) : nil
      ending = particle ? particle_end : finish
      updated[start_at...ending] = "#{updated[start_at...finish]}(#{source_term})#{suffix}"
      changed = true
    end
    [updated, changed, nil]
  end

  def replace_entity(text, entity, source_term, full_source_term: false)
    base = korean_base(entity)
    forms = korean_forms(entity)
    hits = forms.flat_map { |form| korean_spans(text, form) }
    return [text, false, 'no boundary-safe Korean form in work text'] if hits.empty?
    if full_source_term && entity['english_canonical'].to_s !~ /\s/
      annotated = hits.all? do |_start, finish, form, _particle, _particle_end|
        annotation = parenthetical_at(text, finish)
        source_term_at(text, annotation && annotation[0], [source_term]) ||
          form == base && annotation.nil?
      end
      return [text, false, 'full-name alias Korean form lacks matching annotation'] unless annotated
      return [text, false, nil]
    end
    hits.sort_by! { |hit| [hit[0], -(hit[1] - hit[0])] }
    hits = hits.each_with_object([]) do |hit, chosen|
      chosen << hit unless chosen.any? { |prior| hit[0] < prior[1] && prior[0] < hit[1] }
    end
    title_aliases = terms(entity).select { |term| term.match?(/\A(?:Sir|Lady)\s/i) }
    if title_aliases.any?
      hits.reject! do |_start, finish, _form, _particle, _particle_end|
        title_words = title_aliases.map { |term| term.match?(/\ASir\b/i) ? '경' : '부인' }
        text[finish..].to_s.match?(/\A\s*(?:#{title_words.join('|')})(?:\s|\()/)
      end
      return [text, false, 'only title-adjacent Korean form found'] if hits.empty?
    end
    updated = text.dup
    changed = false
    hits.sort_by { |hit| -hit[0] }.each do |start_at, finish, form, particle, particle_end|
      annotation = parenthetical_at(updated, finish)
      annotation_text = annotation && annotation[0]
      annotation_end = annotation ? annotation[1] : finish
      particle, particle_end = particle_after(updated, annotation_end) if annotation
      target_terms = [source_term, *terms(entity)]
      if annotation_text && !source_term_at(updated, annotation_text, target_terms)
        return [text, false, "unrelated parenthetical after #{form}"]
      end
      if proper_neighbor?(updated, start_at, finish) && !annotation_text
        return [text, false, "unregistered full-name context around #{source_term}"]
      end

      # Preserve an existing full source name/title in parentheses verbatim.
      replacement_annotation = if annotation_text
                                 annotation_text
                               else
                                 "(#{source_term})"
                               end
      next_particle = particle && corrected_particle(particle, base)
      replacement = "#{base}#{replacement_annotation}#{next_particle}"
      replace_end = particle ? particle_end : annotation_end
      updated[start_at...replace_end] = replacement
      changed ||= updated != text
    end
    [updated, changed, nil]
  end

  def build(inventory, glossary)
    selected = glossary.select do |entity|
      entity['status'] == 'confirmed' && entity['category'] == 'person' &&
        entity['english_canonical'].to_s.match?(/\A[M-Z]/i)
    end

    all_people = glossary.select { |entity| entity['status'] == 'confirmed' && entity['category'] == 'person' }
    rows = {}
    inventory.each do |source|
      english_texts = JSON.parse(source.fetch('en_texts_json') || '[]').compact
      english = english_texts.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text').to_s

      found = selected.flat_map do |entity|
        terms(entity).flat_map do |term|
          english_texts.flat_map do |text|
            english_spans(text, term).map do |span|
              { entity: entity, term: term, text: text, span: span }
            end
          end
        end
      end
      next if found.empty?

      old = source.fetch('work_text')
      all_full_spans = all_people.flat_map do |entity|
        terms(entity).select { |term| term.match?(/\s/) }.flat_map do |term|
          english_texts.flat_map do |text|
            english_spans(text, term).map do |span|
              { start: span[0], finish: span[1], text: text, entity: entity, term: term }
            end
          end
        end
      end
      relevant = []
      excluded = []
      covered_compounds = []
      found.each do |hit|
        if generic_collision?(hit[:entity], hit[:term], hit[:text], hit[:span])
          excluded << hit
        elsif component_covered?(hit[:text], hit[:span], all_full_spans)
          next
        elsif covered_possessive_compound?(hit, old)
          covered_compounds << hit
        else
          relevant << hit
        end
      end
      next if relevant.empty? && excluded.empty? && covered_compounds.empty?

      key = [source.fetch('resource'), source.fetch('ID_Linha'), source['Tipo_Variante'].to_s]
      new_text = old.dup
      unresolved = []
      matched_keys = []
      relevant.group_by { |hit| hit[:entity]['entity_key'] }.each_value do |hits|
        entity = hits.first.fetch(:entity)
        matched_keys << entity.fetch('entity_key')
        title_hits, ordinary_hits = hits.partition { |hit| hit[:term].match?(/\A(?:Sir|Lady)\s/i) }
        ordinary_hits.reject! { |hit| covered_possessive_compound?(hit, old) }
        title_hits.map { |hit| hit[:term] }.uniq.each do |term|
          result, _changed, error = replace_titled_name(new_text, entity, term)
          if error
            unresolved << "#{entity['entity_key']}: #{error}"
          else
            new_text = result
          end
        end
        next if ordinary_hits.empty?

        # A selected component inside an unregistered multiword name is not independently respelled.
        source_terms = ordinary_hits.map { |hit| hit[:term] }.uniq
        compound_hits = ordinary_hits.select do |hit|
          proper_neighbor?(hit[:text], hit[:span][0], hit[:span][1])
        end
        compound_terms = compound_hits.map { |hit| hit[:term] }.uniq
        unregistered = compound_terms.reject do |term|
          old.match?(/\([^()]*#{Regexp.escape(term)}[^()]*\)/i)
        end
        unresolved << "#{entity['entity_key']}: unregistered full-name occurrence" unless unregistered.empty?

        # An already bilingual compound is preserved; independent bare mentions still get reviewed.
        bare_terms = ordinary_hits.reject { |hit| compound_hits.include?(hit) }
          .map { |hit| hit[:term] }.uniq
        bare_terms.each do |term|
          result, changed, error = replace_entity(new_text, entity, term, full_source_term: term.match?(/\s/))
          if error
            unresolved << "#{entity['entity_key']}: #{error}"
          else
            new_text = result
          end
        end
      end

      status = if !unresolved.empty?
                 new_text = old
                 'uncertain'
               elsif relevant.empty? && !excluded.empty? && covered_compounds.empty?
                 'excluded'
               elsif new_text == old
                 'not-an-issue'
               else
                 'accepted'
               end
      matched_keys.concat((excluded + covered_compounds).map { |hit| hit[:entity]['entity_key'] })
      matched_keys.uniq!
      evidence = "D-20397 row review; exact English source term(s): " +
                 (relevant + excluded + covered_compounds)
                   .map { |hit| "#{hit[:entity]['entity_key']}=#{hit[:term]}" }.uniq.join('|')
      evidence += '; Japanese and Chinese source contexts retained for cross-locale comparison'
      evidence += '; Korean candidate forms checked with Hangul boundaries and particles'
      evidence += '; whole-name overlaps resolved before components; independent mentions retained'
      evidence += '; existing complete possessive bilingual compounds preserved' unless covered_compounds.empty?
      evidence += "; unresolved: #{unresolved.uniq.join('|')}" unless unresolved.empty?
      evidence += '; generic noun/place compound collision excluded' unless excluded.empty?
      row = [
        *key, matched_keys.join('|'), status, old, new_text, evidence,
        english_texts.join("\n---\n"), japanese, chinese
      ]
      raise "duplicate output key #{key.inspect}" if rows.key?(key)
      rows[key] = row
    rescue JSON::ParserError => error
      raise "invalid locale JSON at #{key.inspect}: #{error.message}"
    end
    rows.values.sort_by { |row| [row[0], row[1].to_i, row[2]] }
  end

  def run
    inventory = CSV.read(INVENTORY, headers: true, col_sep: "\t")
    glossary = CSV.read(GLOSSARY, headers: true, col_sep: "\t").map(&:to_h)
    rows = build(inventory, glossary)
    CSV.open(OUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    puts "Wrote #{rows.length} reviewed M-Z candidate rows to #{OUT}"
    puts rows.group_by { |row| row[4] }.transform_values(&:length).inspect
  end
end

PersonMZReview.run if $PROGRAM_NAME == __FILE__
