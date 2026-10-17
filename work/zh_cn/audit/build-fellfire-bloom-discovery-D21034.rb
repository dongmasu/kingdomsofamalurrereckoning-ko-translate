#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module FellfireBloomDiscoveryD21034
  M = ReviewedNameBatches
  AUDIT = M::AUDIT
  ENTITY = 'item:fellfire-bloom'
  ENGLISH = 'Fellfire Bloom'
  KOREAN = '펠파이어 꽃'
  DEFINITIONS_PATH = File.join(AUDIT, 'proper-name-discovery-definitions-D21034.tsv')
  REVIEW_PATH = '/private/tmp/proper-name-reviewed-D21034.tsv'
  SCOUT_PATH = '/private/tmp/proper-name-discovery-scout-D21034.tsv'
  SCOUT_HEADERS = %w[
    english_candidate source_rows spelling_variants_rows existing_full_labels
    disposition evidence
  ].freeze
  RESOURCE_ORDER = { 'affix' => 0, 'base' => 1, 'default' => 2 }.freeze
  PARTICLES = %w[
    에게서 에게까지 에게부터 에게도 에게나 에게는 에서부터 으로부터 으로써
    으로서는 으로서 이라며 이라는 이라서 이라고 라는 라며 라고 라서 만큼
    까지 부터 처럼 보다 조차 마저 라도 든지 든가 은 는 이 가 을 를 과 와
    의 에게 께 에서 으로 로 에 아 야 도 만 마다
  ].freeze
  VARIANTS = %w[
    펠파이어\ 블룸 페일파이어\ 꽃 페르파이어\ 꽃 펠파이어\ 꽃
  ].sort_by { |form| -form.length }.freeze
  NAME_PATTERN = Regexp.new(
    "(?<![가-힣])(?:#{VARIANTS.map { |form| Regexp.escape(form) }.join('|')})" \
    "(?=#{(PARTICLES + ['[^가-힣]', '$']).uniq.join('|')})"
  )

  module_function

  def texts(row, locale)
    JSON.parse(row.fetch("#{locale}_texts_json") || '[]').compact
  end

  def exact_source?(row)
    texts(row, 'en').any? do |text|
      text.match?(/(?<![A-Za-z])#{Regexp.escape(ENGLISH)}(?![A-Za-z])/i)
    end
  end

  def normalize(text)
    matches = text.to_enum(:scan, NAME_PATTERN).map do
      match = Regexp.last_match
      [match.begin(0), match.end(0), match[0]]
    end
    raise 'English source hit has no safely identifiable Korean name span' if matches.empty?

    updated = text.dup
    matches.reverse_each do |start_at, finish, old_form|
      tail = text[finish..].to_s
      paired = tail.match?(/\A[ \t]*\(Fellfire Bloom\)/i)
      replacement = paired ? KOREAN : "#{KOREAN}(#{ENGLISH})"
      updated[start_at...finish] = replacement
    end
    [updated, matches.map(&:last).uniq]
  end

  def write_table(path, headers, rows)
    CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << headers
      rows.each { |row| csv << headers.map { |header| row[header] } }
    end
  end

  def run
    [DEFINITIONS_PATH, REVIEW_PATH, SCOUT_PATH].each do |path|
      raise "output already exists: #{path}" if File.exist?(path)
    end

    inventory = M.refresh_inventory.values
    glossary = M.table(File.join(AUDIT, 'proper-name-glossary.tsv'))
    raise 'Fellfire Bloom already exists in glossary' if glossary.any? do |row|
      row['entity_key'] == ENTITY ||
        ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
          .any? { |term| term.casecmp?(ENGLISH) }
    end

    sources = inventory.select { |row| exact_source?(row) }.sort_by do |row|
      [RESOURCE_ORDER.fetch(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s]
    end
    raise "expected 24 aligned source rows, found #{sources.length}" unless sources.length == 24
    raise 'unexpected resource coverage' unless
      sources.group_by { |row| row.fetch('resource') }.transform_values(&:length) ==
        { 'base' => 2, 'default' => 22 }

    anchor = inventory.find do |row|
      row.fetch('resource') == 'default' && row.fetch('ID_Linha') == '40'
    end
    raise 'missing named-flower identity anchor' unless
      anchor && texts(anchor, 'en').join.include?('the Fellfire Bloom') &&
      texts(anchor, 'ja').join.include?('フェルファイアの花') &&
      anchor.fetch('zh_text').include?('落火花') &&
      anchor.fetch('work_text').include?('펠파이어 블룸(Fellfire Bloom)')

    definition_headers = glossary.headers
    definition = {
      'entity_key' => ENTITY,
      'english_canonical' => ENGLISH,
      'category' => 'unique item',
      'korean_canonical' => "#{KOREAN}(#{ENGLISH})",
      'english_aliases' => '',
      'korean_variants' => '펠파이어 블룸|페일파이어 꽃|페르파이어 꽃',
      'evidence_ids' => 'D-21034|default:40|base:3594|default:5096',
      'status' => 'confirmed',
      'notes' => 'The English source identifies the Fellfire Bloom as a named, distinctive flower; aligned default:40 calls it the only plant growing in the Pit. Japanese フェルファイアの花 and Chinese 落火花 corroborate the flower identity. Use the established Korean wording 펠파이어 꽃 with the English label, distinguish it from the place Fellfire Pit, and normalize observed transliteration/translation variants. This entry represents the named quest-resource plant, not every ordinary flower.'
    }.slice(*definition_headers)
    write_table(DEFINITIONS_PATH, definition_headers, [definition])

    reviews = sources.map do |source|
      old_text = source.fetch('work_text')
      new_text, matched_forms = normalize(old_text)
      english = texts(source, 'en').join("\n")
      japanese = texts(source, 'ja').join("\n---\n")
      chinese = source.fetch('zh_text')
      status = old_text == new_text ? 'not-an-issue' : 'accepted'
      evidence = [
        'English identifies the named Fellfire Bloom plant; aligned Japanese and Chinese were checked as pronunciation/meaning corroboration.',
        "Standardize observed Korean form(s) #{matched_forms.join('|')} to #{KOREAN}(#{ENGLISH}); preserve particles, sentence wording, and all other names."
      ].join(' ')
      {
        'resource' => source.fetch('resource'),
        'ID_Linha' => source.fetch('ID_Linha'),
        'Tipo_Variante' => source['Tipo_Variante'].to_s,
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old_text,
        'new' => new_text,
        'evidence' => evidence,
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end
    raise 'duplicate Fellfire Bloom source row key' unless
      reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    raise 'unexpected batch size' unless reviews.length <= 50
    write_table(REVIEW_PATH, M::HEADERS, reviews)

    changed = reviews.count { |row| row['status'] == 'accepted' }
    labels = sources.count { |row| row.fetch('work_text').include?("(#{ENGLISH})") }
    write_table(SCOUT_PATH, SCOUT_HEADERS, [{
      'english_candidate' => ENGLISH,
      'source_rows' => sources.length.to_s,
      'spelling_variants_rows' => sources.count do |row|
        row.fetch('work_text').match?(/펠파이어 블룸|페일파이어 꽃|페르파이어 꽃/)
      end.to_s,
      'existing_full_labels' => labels.to_s,
      'disposition' => 'confirmed named quest-resource plant; review all 24 exact English source rows in one focused batch',
      'evidence' => 'English default:40 calls it the only plant growing in the Fellfire Pit; Japanese フェルファイアの花 and Chinese 落火花 corroborate the flower identity. Canonical Korean follows the established 펠파이어 꽃 wording with bilingual labeling.'
    }])
    warn "Prepared #{reviews.length} rows (#{changed} edits, #{reviews.length - changed} not-an-issue)."
  end
end

FellfireBloomDiscoveryD21034.run if $PROGRAM_NAME == __FILE__
