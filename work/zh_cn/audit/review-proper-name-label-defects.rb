#!/usr/bin/env ruby

require 'csv'
require 'json'

module ProperNameLabelDefects
  ROOT = File.expand_path('../../..', __dir__)
  AUDIT = File.join(ROOT, 'work', 'zh_cn', 'audit')
  INVENTORY = '/private/tmp/proper-name-source-inventory.tsv'
  OCCURRENCES = File.join(AUDIT, 'proper-name-occurrences.tsv')
  GLOSSARY = File.join(AUDIT, 'proper-name-glossary.tsv')
  OUTPUT = File.join(AUDIT, 'proper-name-reviewed-label-defects-final.tsv')

  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese introduced_by pre_edit_text prior_entity_status
  ].freeze

  ROLE_WORDS = %w[
    adept brother oathblade pledge priestess private savant
  ].freeze

  MANUAL_CORRECTIONS = {
    'base:473:11' => [
      '검은 검은 아릭(Arick)(Black Arick) 검은 아릭(Arick)(Black Arick)(Arick) XI',
      '검은 아릭(Black Arick) XI'
    ],
    'base:1306:11' => [
      '검은 검은 아릭(Arick)(Black Arick) 검은 아릭(Arick)(Black Arick)(Arick) V',
      '검은 아릭(Black Arick) V'
    ],
    'base:3030:11' => [
      '검은 검은 아릭(Arick)(Black Arick) 검은 아릭(Arick)(Black Arick)(Arick) VII',
      '검은 아릭(Black Arick) VII'
    ],
    'default:42:' => [
      '아조 레이먼드(Azo Raemund) 아조 레이먼드(Azo Raemund) 레이먼드(Azo Raemund)가 재산 대부분을 잃었지만 아직 살아 있다는 걸 알아냈어. 이드와 위드프론드(Idwa Widfrond)에게 알려서 그의 무덤을 찾는 일을 그만두게 해야겠어.',
      '아조 레이먼드(Azo Raemund)가 재산 대부분을 잃었지만 아직 살아 있다는 걸 알아냈어. 이드와 위드프론드(Idwa Widfrond)에게 알려서 그의 무덤을 찾는 일을 그만두게 해야겠어.'
    ],
    'default:65127:' => [
      '알겠어. 먼저 금고를 살펴보는 게 좋겠군. 맹세의 칼날 그윈 안웨이(Anwy)(Gwyn 안웨이(Anwy)) 그윈 안웨이(Anwy)(Gwyn 안웨이(Anwy)) 안웨이(Anwy)(Gwyn 안웨이(Anwy))를 보내 그곳을 지키게 하겠다. 준비되면 가서 만나.',
      '알겠어. 먼저 금고를 살펴보는 게 좋겠군. 맹세의 칼날 그윈 안웨이(Gwyn Anwy)를 보내 그곳을 지키게 하겠다. 준비되면 가서 만나.'
    ]
  }.freeze

  module_function

  def row_key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def key_text(key)
    key.join(':')
  end

  def read_tsv(path)
    CSV.read(path, headers: true, col_sep: "\t", encoding: 'bom|utf-8')
  end

  def bilingual_labels(text)
    labels = []
    pattern = /(?<![가-힣])(?<ko>[가-힣]+(?:\s+[가-힣]+){0,6})\((?<en>[A-Za-z][A-Za-z .'-]{0,80})\)/
    text.to_s.to_enum(:scan, pattern).each do
      match = Regexp.last_match
      labels << [match.begin(0), match.end(0), match[:ko], match[:en].strip]
    end
    labels
  end

  def korean_inside_parenthetical_count(text)
    stack = []
    count = 0
    text.to_s.each_char.with_index do |character, index|
      if character == '('
        stack << index
      elsif character == ')' && !stack.empty?
        start_at = stack.pop
        content = text.to_s[(start_at + 1)...index]
        count += 1 if content.match?(/[가-힣]/) && content.match?(/[A-Za-z]/)
      end
    end
    count
  end

  def anomaly_counts(text)
    labels = bilingual_labels(text)
    duplicate_labels = 0
    overlapping_labels = 0
    labels.each_cons(2) do |left, right|
      gap = text.to_s[left[1]...right[0]]
      next unless gap.match?(/\A\s+\z/)

      if left[3].casecmp(right[3]).zero?
        duplicate_labels += 1
      elsif right[3].downcase.start_with?("#{left[3].downcase} ")
        overlapping_labels += 1
      end
    end
    {
      'parenthetical_chain' => text.to_s.scan(/\)\(/).length,
      'nested_korean_parenthetical' =>
        text.to_s.scan(/\([A-Za-z][^()]*\([^()]*[가-힣][^()]*\)[^()]*\)/).length,
      'korean_inside_english_parenthetical' => korean_inside_parenthetical_count(text),
      'adjacent_duplicate_label' => duplicate_labels,
      'overlapping_short_full_label' => overlapping_labels
    }
  end

  def introduced_anomalies(old_text, new_text)
    old_counts = anomaly_counts(old_text)
    new_counts = anomaly_counts(new_text)
    new_counts.each_with_object([]) do |(kind, count), found|
      found << kind if count > old_counts.fetch(kind, 0)
    end
  end

  def entity_terms(entity_keys, glossary)
    entity_keys.flat_map do |key|
      entry = glossary[key]
      next [] unless entry

      ([entry.fetch('english_canonical', '')] +
        entry.fetch('english_aliases', '').split('|'))
        .reject(&:empty?)
    end.uniq
  end

  def related_to?(candidate_text, terms)
    terms.any? do |term|
      candidate_text.to_s.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
    end
  end

  def dedupe_korean_words(text)
    text.split(/\s+/).each_with_object([]) do |word, result|
      result << word unless result.last == word
    end.join(' ')
  end

  def english_name_from_pair(first, second, terms)
    candidates = [first, second].map do |value|
      value.scan(/[A-Za-z]+(?:[.'-][A-Za-z]+)*\.?/)
           .reject { |word| ROLE_WORDS.include?(word.downcase) }
           .join(' ')
           .strip
    end.reject(&:empty?).uniq
    candidates.select! do |candidate|
      related_to?(candidate, terms) &&
        candidate.split.all? do |word|
          second.match?(/(?<![A-Za-z])#{Regexp.escape(word)}(?![A-Za-z])/i) ||
            first.match?(/(?<![A-Za-z])#{Regexp.escape(word)}(?![A-Za-z])/i)
        end
    end
    candidates.max_by { |candidate| [candidate.split.length, candidate.length] } ||
      first.scan(/[A-Za-z]+(?:[.'-][A-Za-z]+)*\.?/).join(' ')
  end

  def source_supports?(candidate, source)
    candidate && !candidate.empty? &&
      source.to_s.match?(/(?<![A-Za-z])#{Regexp.escape(candidate)}(?![A-Za-z])/i)
  end

  def repair_parenthetical_pairs(text, terms, source)
    pattern = /\((?<first>[^()]*)\)\((?<second>(?:[^()]|\([^()]*\))*)\)/
    text.gsub(pattern) do |whole|
      match = Regexp.last_match
      options = [match[:first], match[:second]].map do |value|
        value.scan(/[A-Za-z]+(?:[.'-][A-Za-z]+)*\.?/)
             .reject { |word| ROLE_WORDS.include?(word.downcase) }
             .join(' ').strip
      end.reject(&:empty?).uniq
      supported = options.select do |option|
        related_to?(option, terms) && source_supports?(option, source)
      end
      next whole if supported.empty?

      english = supported.max_by { |option| [option.split.length, option.length] }
      "(#{english})"
    end
  end

  def common_suffix(token_lists)
    suffix = []
    limit = token_lists.map(&:length).min || 0
    1.upto(limit) do |length|
      parts = token_lists.map { |tokens| tokens.last(length) }
      break unless parts.uniq.length == 1

      suffix = parts.first
    end
    suffix
  end

  def normalize_adjacent_labels(text, terms, source)
    labels = bilingual_labels(text)
    groups = []
    labels.each do |label|
      previous = groups.last
      if previous
        left = previous[:labels].last
        gap = text[left[1]...label[0]]
        same = left[3].casecmp(label[3]).zero?
        overlap = label[3].downcase.start_with?("#{left[3].downcase} ")
        related = related_to?("#{left[3]} #{label[3]}", terms)
        if gap.match?(/\A\s+\z/) && related && (same || overlap)
          previous[:labels] << label
          next
        end
      end
      groups << { labels: [label] }
    end

    replacements = []
    groups.each do |group|
      members = group[:labels]
      next if members.length < 2

      names = members.map { |label| label[3] }
      english_options = names.uniq.select { |name| source_supports?(name, source) }
      english = if english_options.empty?
                  names.max_by { |name| [name.split.length, name.length] }
                else
                  english_options.max_by { |name| [name.split.length, name.length] }
                end
      same_english = names.map(&:downcase).uniq.length == 1
      korean_options = members.map do |label|
        words = label[2].split(/\s+/)
        english_words = label[3].scan(/[A-Za-z]+/).reject do |word|
          ROLE_WORDS.include?(word.downcase)
        end.length
        words.last([english_words, words.length].min)
      end
      if same_english
        korean = korean_options.group_by(&:itself)
                               .max_by { |words, rows| [rows.length, words.length] }
                               .first
      else
        korean = korean_options.flatten
      end
      korean = dedupe_korean_words(korean.join(' '))
      next if korean.empty? || english.empty?

      first = members.first
      last = members.last
      offset = first[2].rindex(korean)
      unless offset
        first_words = first[2].split(/\s+/)
        fallback = first_words.last([english.split.length, first_words.length].min).join(' ')
        offset = first[2].rindex(fallback)
        korean = fallback
      end
      next unless offset

      start_at = first[0] + offset
      replacements << [start_at, last[1], "#{korean}(#{english})"]
    end

    replacements.reverse_each do |start_at, end_at, replacement|
      text[start_at...end_at] = replacement
    end
    text
  end

  def remove_redundant_alias_parentheticals(text, terms)
    terms.sort_by { |term| -term.length }.each do |term|
      escaped = Regexp.escape(term)
      text.gsub!(/\(([^()]*)\)\((#{escaped})\)/i) do |whole|
        full = Regexp.last_match(1)
        extra = Regexp.last_match(2)
        full_tokens = full.downcase.split
        extra_tokens = extra.downcase.split
        extra_tokens == full_tokens.last(extra_tokens.length) ? "(#{full})" : whole
      end
    end
    text
  end

  def clean_source_label(text, source, terms)
    labels = bilingual_labels(text)
    labels.any? do |label|
      source_supports?(label[3], source) && related_to?(label[3], terms)
    end
  end

  def local_label_diff?(old_text, new_text)
    old_chars = old_text.to_s.chars
    new_chars = new_text.to_s.chars
    prefix = 0
    prefix += 1 while prefix < old_chars.length &&
                      prefix < new_chars.length &&
                      old_chars[prefix] == new_chars[prefix]
    suffix = 0
    suffix += 1 while suffix < old_chars.length - prefix &&
                      suffix < new_chars.length - prefix &&
                      old_chars[-1 - suffix] == new_chars[-1 - suffix]
    old_span = old_chars[prefix, old_chars.length - prefix - suffix].join
    new_span = new_chars[prefix, new_chars.length - prefix - suffix].join
    changed = old_span + new_span

    old_span.length <= 180 && new_span.length <= 180 &&
      changed.match?(/[A-Za-z]/) && changed.match?(/[()]/) &&
      !changed.match?(/[.!?;:,，。！？；：\n\r…“”]/)
  end

  def corrupt_cluster_count(text, terms)
    labels = bilingual_labels(text)
    clusters = 0
    index = 0
    while index < labels.length
      finish = index
      while finish + 1 < labels.length
        left = labels[finish]
        right = labels[finish + 1]
        gap = text[left[1]...right[0]]
        related = related_to?("#{left[3]} #{right[3]}", terms)
        same = left[3].casecmp(right[3]).zero?
        overlap = right[3].downcase.start_with?("#{left[3].downcase} ")
        break unless gap.match?(/\A\s+\z/) && related && (same || overlap)

        finish += 1
      end
      clusters += 1 if finish > index
      index = finish + 1
    end
    clusters += 1 if text.include?(')(') && related_to?(text, terms)
    clusters
  end

  def normalize(text, terms, source, pre_edit)
    corrected = repair_parenthetical_pairs(text.dup, terms, source)
    corrected = normalize_adjacent_labels(corrected, terms, source)

    # Reuse an already-reviewed full title/name when one corruption cluster
    # is the only affected span.
    if clean_source_label(pre_edit, source, terms) &&
       corrupt_cluster_count(text, terms) == 1
      return pre_edit
    end
    corrected
  end

  def source_text(row, field)
    JSON.parse(row.fetch(field) || '[]').compact.join("\n---\n")
  end

  def build
    inventory = read_tsv(INVENTORY).map(&:to_h)
    inventory_by_key = inventory.to_h { |row| [row_key(row), row] }
    glossary = read_tsv(GLOSSARY).to_h do |row|
      [row.fetch('entity_key'), row.to_h]
    end

    pending = Hash.new { |hash, key| hash[key] = [] }
    prior_status = Hash.new { |hash, key| hash[key] = [] }
    read_tsv(OCCURRENCES).each do |row|
      key = row_key(row)
      entity = row.fetch('entity_key')
      prior_status[[key, entity]] << row.fetch('status')
      pending[key] << entity if row.fetch('status') == 'needs-context'
    end

    manifest_changed_rows = 0
    manifest_current_matches = 0
    broad_repeated_parenthetical_rows = 0
    inventory_anomaly_rows = Hash.new(0)
    pending_excluded = 0
    inventory.each do |row|
      text = row.fetch('work_text').to_s
      labels = text.scan(/\(([A-Za-z][^()]{0,80})\)/).flatten
      counts = Hash.new(0)
      labels.each { |label| counts[label] += 1 }
      broad_repeated_parenthetical_rows += 1 if counts.values.any? { |count| count > 1 }
      anomaly_counts(text).each do |kind, count|
        inventory_anomaly_rows[kind] += 1 if count.positive?
      end
    end

    candidates = {}
    Dir[File.join(AUDIT, 'proper-name-edits-*.tsv')].sort.each do |path|
      read_tsv(path).each do |manifest|
        next if manifest.fetch('old') == manifest.fetch('new')

        manifest_changed_rows += 1
        key = row_key(manifest)
        current = inventory_by_key[key]
        next unless current && current.fetch('work_text') == manifest.fetch('new')

        manifest_current_matches += 1
        anomalies = introduced_anomalies(manifest.fetch('old'), manifest.fetch('new'))
        next if anomalies.empty?

        entity_keys = manifest.fetch('entity_key', '').split('|')
        next if entity_keys.empty?
        next unless entity_keys.all? { |entity| glossary.key?(entity) }
        if (entity_keys & pending[key]).any?
          pending_excluded += 1
          next
        end

        candidates[key] ||= {
          row: current,
          manifest: manifest,
          path: path,
          entity_keys: entity_keys,
          anomalies: anomalies
        }
      end
    end

    corrections = []
    candidates.each do |key, candidate|
      row = candidate.fetch(:row)
      entity_keys = candidate.fetch(:entity_keys)
      terms = entity_terms(entity_keys, glossary)
      old = row.fetch('work_text')
      english = source_text(row, 'en_texts_json')
      pre_edit = candidate.fetch(:manifest).fetch('old')
      # Keep only rows whose exact changed manifest is the active source cell.
      raise "stale manifest at #{key_text(key)}" unless
        candidate.fetch(:manifest).fetch('new') == old
      manual = MANUAL_CORRECTIONS[key_text(key)]
      clean_prior_label = clean_source_label(pre_edit, english, terms) &&
                          corrupt_cluster_count(old, terms) == 1 &&
                          local_label_diff?(old, pre_edit)
      if manual
        expected_old, new_text = manual
        raise "manual correction source changed at #{key_text(key)}" unless old == expected_old
        raise "manual correction is not local at #{key_text(key)}" unless
          local_label_diff?(old, new_text)

        status = 'confirmed-defect'
        review_note = 'Explicitly reviewed against EN/JA/ZH; the replacement removes only the malformed name-label sequence and preserves surrounding text verbatim.'
      elsif clean_prior_label
        status = 'confirmed-defect'
        new_text = pre_edit
        review_note = 'Restores the exact pre-edit cell: its full bilingual label is source-supported and the active corruption is confined to one adjacent label cluster.'
      else
        status = 'hold-unsafe'
        new_text = ''
        review_note = 'Held: no uniquely bounded, source-backed local replacement could be established without risking Korean name text or surrounding prose; no correction guessed.'
      end

      japanese = source_text(row, 'ja_texts_json')
      entity_status = entity_keys.map do |entity|
        statuses = prior_status[[key, entity]].uniq
        "#{entity}=#{statuses.empty? ? 'not-indexed' : statuses.join(',')}"
      end.join('|')
      evidence = [
        "#{File.basename(candidate.fetch(:path))} changed pre-edit Korean to the active cell and introduced #{candidate.fetch(:anomalies).join(', ')} corruption.",
        "EN: #{english} JA: #{japanese} ZH: #{row.fetch('zh_text')}",
        review_note,
        'Prior entity dispositions remain unchanged; this is a separate corrective scope and is not a recount.'
      ].join(' ')
      corrections << [
        *key, entity_keys.join('|'), status, old, new_text, evidence,
        english, japanese, row.fetch('zh_text'), File.basename(candidate.fetch(:path)),
        candidate.fetch(:manifest).fetch('old'), entity_status
      ]
    end

    {
      inventory_rows: inventory.length,
      resources: inventory.group_by { |row| row.fetch('resource') }
                           .transform_values(&:length),
      manifest_changed_rows: manifest_changed_rows,
      manifest_current_matches: manifest_current_matches,
      broad_repeated_parenthetical_rows: broad_repeated_parenthetical_rows,
      inventory_anomaly_rows: inventory_anomaly_rows,
      structural_candidates: candidates.length,
      pending_excluded: pending_excluded,
      corrections: corrections.sort_by { |row| [row[0], row[1].to_i, row[2]] }
    }
  end

  def run(mode)
    result = build
    puts "Inventory rows: #{result[:inventory_rows]} (#{result[:resources].inspect})"
    puts "Changed manifest rows: #{result[:manifest_changed_rows]}"
    puts "Current cells matching changed manifests: #{result[:manifest_current_matches]}"
    puts "Rows with repeated parenthetical strings (broad candidate only): " \
         "#{result[:broad_repeated_parenthetical_rows]}"
    puts "Rows with active structural signatures (by kind): " \
         "#{result[:inventory_anomaly_rows].inspect}"
    puts "Provenance-backed candidates excluded for pending entities: " \
         "#{result[:pending_excluded]}"
    puts "Provenance-backed structural candidates outside pending-entity scope: " \
         "#{result[:structural_candidates]}"
    puts "Rows dispositioned: #{result[:corrections].length}"
    puts "Confirmed local corrections: " \
         "#{result[:corrections].count { |row| row[4] == 'confirmed-defect' }}"
    puts "Held as unsafe to correct: " \
         "#{result[:corrections].count { |row| row[4] == 'hold-unsafe' }}"
    return unless mode == 'write'

    CSV.open(OUTPUT, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << HEADERS
      result[:corrections].each { |row| csv << row }
    end
    puts "Wrote #{OUTPUT}"
  end
end

unless %w[scan write].include?(ARGV.fetch(0, ''))
  abort 'usage: review-proper-name-label-defects.rb scan|write'
end

ProperNameLabelDefects.run(ARGV.fetch(0))
