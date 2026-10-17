#!/usr/bin/env ruby

require 'csv'
require 'json'
require 'optparse'

module DeityProposals
  class Error < StandardError; end

  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese
  ].freeze
  RESOURCE_ORDER = %w[affix base default].freeze
  AUDIT_ROOT = File.realpath(__dir__)
  MENU_EVIDENCE = {
    'deity:ynadon' => 'default:26106',
    'deity:gaea' => 'default:15781',
    'deity:thyrdon' => 'default:42685',
    'deity:ohnshan' => 'default:48696'
  }.freeze
  ENTITIES = [
    ['deity:belen', 'Belen', '벨렌', %w[Belen],
     %w[벨렌 베렌 베이렌 베일런 베일렌]],
    ['deity:ynadon', 'Ynadon', '이나돈', %w[Ynadon],
     %w[이나돈 위나돈 이아돈 이아다논]],
    ['deity:mitharu', 'Mitharu', '미사루', %w[Mitharu],
     %w[미사루 미타루]],
    ['deity:lyria', 'Lyria', '리리아', %w[Lyria],
     %w[리리아]],
    ['deity:gaea', 'Gaea', '가이아', %w[Gaea],
     %w[가이아]],
    ['deity:ethene', 'Ethene', '에테네', %w[Ethene],
     %w[에테네 에센 에세네]],
    ['deity:aryllia', 'Aryllia', '아릴리아', %w[Aryllia],
     %w[아릴리아]],
    ['deity:njordir', 'Njordir', '뇨르디르', %w[Njordir],
     %w[뇨르디르]],
    ['deity:thyrdon', 'Thyrdon', '사이르돈', %w[Thyrdon],
     %w[사이르돈 시르돈 시어던 시어든 시어돈 티어던 티르돈 타이돈]],
    ['deity:vraekor', 'Vraekor', '브래코르', %w[Vraekor],
     %w[브래코르 브레이코르 브래이코르 브라에코르 브레이커]],
    ['deity:lopoku', 'Lopoku', '로포쿠', %w[Lopoku Lupoku],
     %w[로포쿠 루포쿠]],
    ['deity:ohnshan', 'Ohnshan', '오샨', %w[Ohnshan],
     %w[오샨 온샨 오언샨 오흔샨]]
  ].map do |key, english, korean, aliases, forms|
    { key: key, english: english, korean: korean, aliases: aliases, forms: forms }
  end.freeze

  module_function

  def english_pattern(names)
    alternatives = names.map { |name| Regexp.escape(name) }.join('|')
    Regexp.new("(?<![A-Za-z])(?:#{alternatives})(?![A-Za-z])", Regexp::IGNORECASE)
  end

  def english_hits(texts)
    ENTITIES.select do |entity|
      pattern = english_pattern(entity[:aliases])
      texts.any? { |text| text.match?(pattern) }
    end
  end

  def has_korean_reference?(text, entity)
    entity[:forms].any? { |form| text.include?(form) } ||
      text.match?(english_pattern(entity[:aliases]))
  end

  def bilingual_form_pattern(entity)
    forms = entity[:forms].sort_by { |form| -form.length }
                          .map { |form| Regexp.escape(form) }.join('|')
    aliases = entity[:aliases].map { |name| Regexp.escape(name) }.join('|')
    Regexp.new("(?:#{forms})(?:[ \\t]*\\((?:#{aliases})\\))?", Regexp::IGNORECASE)
  end

  def compound_has_name?(suffix, entity)
    return false unless suffix.match?(/\A(?:의[ \t]*|[ \t]+|\()/)
    following = suffix.match(/\A([\p{Hangul} \t·-]{0,80})\(([^()]*)\)/)
    following && following[2].match?(english_pattern(entity[:aliases]))
  end

  def transform_entity(text, entity)
    korean = entity[:korean]
    english = entity[:english]
    pattern = bilingual_form_pattern(entity)

    result = text.gsub(pattern) do |match|
      suffix = Regexp.last_match.post_match.dup
      has_full_title = compound_has_name?(suffix, entity)
      if has_full_title && !match.include?('(')
        korean
      else
        "#{korean}(#{english})"
      end
    end

    names = english_pattern(entity[:aliases])
    result = result.split(/(\([^()]*\))/).map do |part|
      if part.start_with?('(') && part.end_with?(')')
        part.gsub(names, english)
      else
        part.gsub(names, "#{korean}(#{english})")
      end
    end.join

    # Keep a complete source-title translation as the sole English parenthetical.
    complete_title = Regexp.new(
      "#{Regexp.escape(korean)}\\(#{Regexp.escape(english)}\\)" \
      "(?=(?:의[ \\t]*|[ \\t]+)[\\p{Hangul} \\t·-]{0,80}\\([^()]*#{Regexp.escape(english)}[^()]*\\))",
      Regexp::IGNORECASE
    )
    result.gsub!(complete_title, korean)
    normalize_particles(result, entity)
  end

  def normalize_particles(text, entity)
    korean = entity[:korean]
    english = entity[:english]
    last = korean[-1].ord - 0xAC00
    jongseong = last % 28
    has_batchim = jongseong != 0
    ends_in_rieul = jongseong == 8
    particles = %w[은 는 이 가 을 를 과 와 으로 로]
    pattern = Regexp.new(
      "#{Regexp.escape(korean)}(?<bilingual>\\(#{Regexp.escape(english)}\\))?" \
      "(?<particle>#{particles.join('|')})(?=[\\s.,!?;:\\[\\]{}()\"']|\\z)"
    )
    text.gsub(pattern) do
      match = Regexp.last_match
      particle = match[:particle]
      canonical = case particle
                  when '은', '는' then has_batchim ? '은' : '는'
                  when '이', '가' then has_batchim ? '이' : '가'
                  when '을', '를' then has_batchim ? '을' : '를'
                  when '과', '와' then has_batchim ? '과' : '와'
                  when '으로', '로' then has_batchim && !ends_in_rieul ? '으로' : '로'
                  end
      "#{korean}#{match[:bilingual]}#{canonical}"
    end
  end

  def read_inventory(path)
    rows = CSV.read(path, headers: true, col_sep: "\t", encoding: 'bom|utf-8')
    required = %w[resource ID_Linha Tipo_Variante en_texts_json ja_texts_json zh_text work_text]
    missing = required - (rows.headers || [])
    raise Error, "#{path}: missing columns: #{missing.join(', ')}" unless missing.empty?

    rows.map(&:to_h)
  rescue CSV::MalformedCSVError => e
    raise Error, "#{path}: malformed TSV: #{e.message}"
  end

  def evidence_for(entity, key)
    details = ['English deity-name occurrence; aligned Korean, Japanese, and Chinese context reviewed']
    menu = MENU_EVIDENCE[entity[:key]]
    details << "divine-role menu corroboration #{menu}" if menu
    if entity[:key] == 'deity:lopoku'
      details << 'Lupoku is the same Mischief deity (default:13951); Lopoku menu spelling is default:2009'
    end
    details << 'Mitharan is excluded; only the exact English name Mitharu is matched' if entity[:key] == 'deity:mitharu'
    details << 'source-aligned name mapping; guessed manual English labels are not used' if MENU_EVIDENCE.key?(entity[:key])
    details << "source key #{key.join(':')}"
    details.join('; ')
  end

  def proposal_rows(inventory)
    seen = {}
    results = []
    inventory.each do |row|
      resource = row.fetch('resource')
      id = row.fetch('ID_Linha')
      variant = row['Tipo_Variante'].to_s
      key = [resource, id, variant]
      raise Error, "duplicate inventory row key: #{key.join(':')}" if seen[key]
      seen[key] = true

      begin
        english_texts = JSON.parse(row.fetch('en_texts_json') || '[]')
        japanese_texts = JSON.parse(row.fetch('ja_texts_json') || '[]')
      rescue JSON::ParserError => e
        raise Error, "#{key.join(':')}: invalid locale JSON: #{e.message}"
      end
      unless english_texts.is_a?(Array) && japanese_texts.is_a?(Array)
        raise Error, "#{key.join(':')}: locale text fields must be JSON arrays"
      end

      entities = english_hits(english_texts.compact)
      next if entities.empty?

      old = row.fetch('work_text').to_s
      unresolved = entities.reject { |entity| has_korean_reference?(old, entity) }
      proposed = old.dup
      (entities - unresolved).each do |entity|
        proposed = transform_entity(proposed, entity)
      end
      status = if unresolved.any?
                 'uncertain'
               elsif proposed == old
                 'not-an-issue'
               else
                 'proposed'
               end
      if unresolved.any?
        proposed = old
      end

      entity_keys = entities.map { |entity| entity[:key] }.sort.join('|')
      evidence = entities.map { |entity| evidence_for(entity, key) }.join(' || ')
      if unresolved.any?
        evidence += "; uncertain: no recognizable Korean name for " \
                    "#{unresolved.map { |entity| entity[:english] }.join(', ')}; retained unchanged"
      end
      results << [
        resource, id, variant, entity_keys, status, old, proposed, evidence,
        english_texts.compact.join("\n---\n"),
        japanese_texts.compact.join("\n---\n"),
        row['zh_text'].to_s
      ]
    end

    rows_by_key = results.map { |row| row[0, 3] }
    raise Error, 'proposal row keys are not unique' unless rows_by_key.uniq.length == rows_by_key.length

    resource_order = RESOURCE_ORDER.each_with_index.to_h
    results.sort_by do |row|
      [resource_order.fetch(row[0], RESOURCE_ORDER.length), row[1].to_i, row[2]]
    end
  end

  def safe_output(path, input)
    expanded = File.expand_path(path)
    raise Error, 'output must not be a CSV or symlink' if File.extname(expanded).downcase == '.csv' || File.symlink?(expanded)

    parent = File.realpath(File.dirname(expanded))
    output = File.join(parent, File.basename(expanded))
    allowed = [File.realpath('/private/tmp'), AUDIT_ROOT]
    raise Error, 'output must be under /private/tmp or work/zh_cn/audit' unless
      allowed.any? { |root| output.start_with?("#{root}/") }
    if output == File.realpath(input) || (File.exist?(output) && File.identical?(output, input))
      raise Error, 'output must not overwrite the inventory'
    end
    if File.exist?(output) && (!File.file?(output) || File.stat(output).nlink > 1)
      raise Error, 'output must be a regular file without hard links'
    end

    output
  end

  def run(argv)
    options = {}
    parser = OptionParser.new do |opts|
      opts.banner = 'Usage: build-deity-proposals.rb --inventory PATH --out PATH'
      opts.separator 'Builds review proposals only; it never edits source or active CSV files.'
      opts.on('--inventory PATH') { |value| options[:inventory] = value }
      opts.on('--out PATH') { |value| options[:out] = value }
    end
    parser.parse!(argv)
    raise Error, 'missing --inventory PATH' unless options[:inventory]
    raise Error, 'missing --out PATH' unless options[:out]
    raise Error, "unexpected arguments: #{argv.join(' ')}" unless argv.empty?

    output = safe_output(options[:out], options[:inventory])
    rows = proposal_rows(read_inventory(options[:inventory]))
    File.open(output, 'w:UTF-8') do |file|
      csv = CSV.new(file, col_sep: "\t", row_sep: "\r\n", force_quotes: true)
      csv << HEADERS
      rows.each { |row| csv << row }
    end
    counts = rows.group_by { |row| row[4] }.transform_values(&:length)
    warn "Wrote #{rows.length} unique-row proposals to #{output} (#{counts.sort.to_h})"
    rows.length
  end
end

if $PROGRAM_NAME == __FILE__
  begin
    DeityProposals.run(ARGV)
  rescue DeityProposals::Error, OptionParser::ParseError, SystemCallError => e
    warn e.message
    exit 1
  end
end
