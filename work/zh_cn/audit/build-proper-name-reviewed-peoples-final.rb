#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module ReviewedPeoplesFinal
  include ReviewedNameBatches

  ENTITIES = {
    'people:jottun' => {
      english: 'Jottun',
      korean: '요툰',
      aliases: %w[요툰 조툰 요튼],
      japanese: /ジョタン|Jottun/i,
      chinese: /约坦|Jottun/i,
      korean_pattern: /요툰|조툰|요튼/
    },
    'people:kollossae' => {
      english: 'Kollossae',
      korean: '콜로사이',
      aliases: %w[콜로사이 콜로새 콜로세],
      japanese: /カロッサエ|カロシー|カロッシー|Kollossae/i,
      chinese: /克勒塞|Kollossae/i,
      korean_pattern: /콜로사이|콜로새|콜로세/
    }
  }.freeze
  ENTITY_KEYS = ENTITIES.keys.freeze
  OUTPUT = File.join(ReviewedNameBatches::AUDIT, 'proper-name-reviewed-peoples-final.tsv')
  PENDING_COUNTS = { 'people:jottun' => 306, 'people:kollossae' => 303 }.freeze
  ACT_TEST_MALE_KEY = ['default', '9956', ''].freeze
  ACT_TEST_FEMALE_KEY = ['default', '32', ''].freeze
  ACT_TEST_MALE_KOREAN = '콜로사이(Kollossae) - 동작 테스트 - 남성'.freeze
  ACT_TEST_FEMALE_SOURCE = {
    'work_text' => '콜로세(Kollossae) - 동작 테스트 - 여성',
    'en_texts_json' => ['Kollossae - ACT Test - Female'],
    'ja_texts_json' => ['カロッサエの女性: 動作試験'],
    'zh_text' => '克勒塞 - 动作测试 - 女性'
  }.freeze
  ACT_TEST_MALE_SOURCE = {
    'en_texts_json' => ['Kollossae - ACT Test - Male'],
    'ja_texts_json' => ['カロッサエの男性: 動作試験'],
    'zh_text' => '克勒塞 - 动作测试 - 男性'
  }.freeze

  module_function

  def entity_pattern(entity)
    names = ENTITIES.fetch(entity).fetch(:aliases)
    suffixes = %w[족 인 어]
    /(?:#{names.sort_by { |name| -name.length }.map { |name| Regexp.escape(name) }.join('|')})(?:#{suffixes.join('|')})?/
  end

  def protected_title_offsets(text, entity)
    english = Regexp.escape(ENTITIES.fetch(entity).fetch(:english))
    name_pattern = entity_pattern(entity)
    title_pattern = /\((?<title>[^()\r\n]*\b#{english}\b[^()\r\n]*)\)/i
    offsets = []

    text.to_enum(:scan, title_pattern).each do
      title_match = Regexp.last_match
      opening = title_match.begin(0)
      lower = [opening - 120, 0].max
      boundary = text.rindex(/[.!?。！？\n]/, opening - 1)
      lower = [lower, boundary + 1].max if boundary
      prefix = text[lower...opening]
      prefix.to_enum(:scan, name_pattern).each do
        offsets << lower + Regexp.last_match.begin(0)
      end
    end

    offsets.uniq
  end

  def normalize_and_pair(text, entity)
    definition = ENTITIES.fetch(entity)
    english = definition.fetch(:english)
    korean = definition.fetch(:korean)
    aliases = definition.fetch(:aliases).sort_by { |name| -name.length }
    alias_pattern = aliases.map { |name| Regexp.escape(name) }.join('|')
    suffix_pattern = '(?:족|인|어)?'
    english_pattern = Regexp.escape(english)
    result = text.dup

    # Move a language/demonym suffix before an existing English label.
    nested_suffix = /(?<name>#{alias_pattern})\s*\((?<label>#{english_pattern})\)(?<suffix>족|인|어)/i
    result.gsub!(nested_suffix) do
      "#{korean}#{Regexp.last_match[:suffix]}(#{Regexp.last_match[:label]})"
    end

    name_pattern = /(?<name>#{alias_pattern})(?<suffix>#{suffix_pattern})/
    protected = protected_title_offsets(result, entity)
    result.gsub!(name_pattern) do |match|
      start = Regexp.last_match.begin(0)
      suffix = Regexp.last_match[:suffix].to_s
      following = result[Regexp.last_match.end(0)..]
      direct_label = following.match(/\A(\s*)\((?<label>[^)]*\b#{english_pattern}\b[^)]*)\)/i)

      if protected.include?(start)
        "#{korean}#{suffix}"
      elsif direct_label
        "#{korean}#{suffix}#{direct_label[1]}(#{direct_label[:label]})"
      else
        "#{korean}#{suffix}(#{english})"
      end
    end
    result
  end

  def excerpt(text, pattern, before: 50, after: 75, limit: 145)
    flat = text.to_s.gsub(/\s+/, ' ').strip
    match = pattern.match(flat)
    return flat[0, limit] unless match

    start = [match.begin(0) - before, 0].max
    finish = [match.end(0) + after, flat.length].min
    value = flat[start...finish]
    value = "...#{value}" if start.positive?
    value = "#{value}..." if finish < flat.length
    value
  end

  def evidence_quote(text)
    text.to_s.gsub(/["\\]/) { |character| "\\#{character}" }
  end

  def evidence_for(entity, index_row, source, old, new, disposition)
    definition = ENTITIES.fetch(entity)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    japanese_has_name = definition.fetch(:japanese).match?(japanese)
    chinese_has_name = definition.fetch(:chinese).match?(chinese)
    en_excerpt = excerpt(english, /\b#{Regexp.escape(definition.fetch(:english))}\b/i)
    ja_excerpt = excerpt(japanese, definition.fetch(:japanese))
    zh_excerpt = excerpt(chinese, definition.fetch(:chinese))
    ko_excerpt = excerpt(old, definition.fetch(:korean_pattern), before: 35, after: 45, limit: 110)

    reading_note =
      if entity == 'people:kollossae' && ReviewedNameBatches.key(index_row) == ACT_TEST_MALE_KEY
        'Cross-check default:32: EN "Kollossae - ACT Test - Female"; JA "カロッサエの女性: 動作試験"; ZH "克勒塞 - 动作测试 - 女性"; Korean "콜로세(Kollossae) - 동작 테스트 - 여성". The current EN/JA/ZH independently identify Male/男性/男性, so use the parallel Korean label 남성 and retain the established 동작 테스트 wording.'
      elsif entity == 'people:jottun' && english.match?(/\b(?:tongue|language|word)\b/i)
        'The English explicitly describes a Jottun-language reference; preserve Korean 요툰어(Jottun) rather than inventing a separate language name.'
      elsif entity == 'people:kollossae' && english.match?(/\b(?:language|word)\b/i)
        'The English explicitly describes Kollossae language/word usage; retain the literal Korean construction with 콜로사이(Kollossae), without inventing a separate language label.'
      elsif entity == 'people:jottun' && english.match?(/mistaken for a Troll or Jottun/i)
        'The source says the subject is mistaken for a Jottun; this does not identify the subject as Jottun or reclassify generic trolls.'
      else
        'The English reference names the confirmed people/ethnonym in this row; it does not license converting unrelated generic giants or trolls into that people.'
      end

    decision_note =
      if entity == 'people:kollossae' && ReviewedNameBatches.key(index_row) == ACT_TEST_MALE_KEY
        "Apply the corroborated parallel label as #{ACT_TEST_MALE_KOREAN}; retain the established Korean actor-test wording."
      elsif disposition == 'not-an-issue'
        'The existing canonical bilingual form or complete bilingual compound title is retained; no nested label is added.'
      else
        "Normalize the recognized Korean form to #{definition.fetch(:korean)}(#{definition.fetch(:english)}), preserving suffixes and complete bilingual compound titles."
      end

    manual_note = 'Official Korean manual reference p.1 enumerates four peoples for playable-race context; that list is not an exhaustive catalogue and its omission does not contradict the source-named Jottun/Kollossae, including DLC peoples.'
    ja_note = japanese_has_name ? '' : ' The aligned Japanese cell does not repeat the English people-name; its quoted text is context only, not direct name-form corroboration.'
    zh_note = chinese_has_name ? '' : ' The aligned Chinese cell does not repeat the English people-name; its quoted text is context only, not direct name-form corroboration.'

    ja_label = japanese_has_name ? 'JA corroboration' : 'JA context (name omitted)'
    zh_label = chinese_has_name ? 'ZH corroboration' : 'ZH context (name omitted)'
    "#{entity}: EN primary \"#{evidence_quote(en_excerpt)}\"; #{ja_label} \"#{evidence_quote(ja_excerpt)}\"; #{zh_label} \"#{evidence_quote(zh_excerpt)}\". Korean context: \"#{evidence_quote(ko_excerpt)}\". #{reading_note}#{ja_note}#{zh_note} #{decision_note} #{manual_note}"
  end

  def validate_act_test_counterpart!(inventory, male_source)
    female = inventory.fetch(ACT_TEST_FEMALE_KEY)
    ACT_TEST_FEMALE_SOURCE.each do |field, expected|
      actual = field.end_with?('_json') ? JSON.parse(female.fetch(field)) : female.fetch(field)
      raise "default:32 ACT-test counterpart mismatch for #{field}" unless actual == expected
    end
    ACT_TEST_MALE_SOURCE.each do |field, expected|
      actual = field.end_with?('_json') ? JSON.parse(male_source.fetch(field)) : male_source.fetch(field)
      raise "default:9956 ACT-test source mismatch for #{field}" unless actual == expected
    end
    raise 'ACT-test male source text mismatch' unless
      male_source.fetch('work_text') == 'Kollossae - ACT Test - Male'
  end

  def glossary_check!
    glossary = ReviewedNameBatches.table(File.join(ReviewedNameBatches::AUDIT, 'proper-name-glossary.tsv'))
    expected = {
      'people:jottun' => ['Jottun', '요툰(Jottun)'],
      'people:kollossae' => ['Kollossae', '콜로사이(Kollossae)']
    }
    expected.each do |entity, (english, korean)|
      row = glossary.find { |candidate| candidate['entity_key'] == entity }
      raise "missing confirmed glossary entry #{entity}" unless row
      raise "glossary canonical mismatch #{entity}" unless
        row['english_canonical'] == english &&
        row['korean_canonical'] == korean &&
        row['status'] == 'confirmed'
    end
  end

  def run
    glossary_check!
    index = ReviewedNameBatches.table(ReviewedNameBatches::INDEX)
    selected = index.select do |row|
      row['status'] == 'needs-context' && ENTITY_KEYS.include?(row['entity_key'])
    end
    counts = selected.group_by { |row| row['entity_key'] }.transform_values(&:length)
    raise "pending count mismatch: #{counts.inspect}" unless counts == PENDING_COUNTS

    inventory = ReviewedNameBatches.table(ReviewedNameBatches::INVENTORY)
      .to_h { |row| [ReviewedNameBatches.key(row), row.to_h] }
    grouped = selected.group_by { |row| ReviewedNameBatches.key(row) }
    raise 'unexpected distinct source-key count' unless grouped.length == 590
    raise 'duplicate entity/key occurrence' unless
      selected.map { |row| [row['entity_key'], *ReviewedNameBatches.key(row)] }.uniq.length == selected.length

    reviews = grouped.map do |source_key, matches|
      source = inventory.fetch(source_key)
      old = source.fetch('work_text')
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      korean = old.dup
      dispositions = {}
      evidence = []

      matches.sort_by { |row| row['entity_key'] }.each do |row|
        entity = row.fetch('entity_key')
        if entity == 'people:kollossae' && source_key == ACT_TEST_MALE_KEY
          validate_act_test_counterpart!(inventory, source)
          korean = ACT_TEST_MALE_KOREAN
          dispositions[entity] = 'accepted'
          evidence << evidence_for(entity, row, source, old, korean, 'accepted')
          next
        end

        english_name = ENTITIES.fetch(entity).fetch(:english)
        unless english.match?(/\b#{Regexp.escape(english_name)}\b/i)
          raise "English primary does not contain #{english_name}: #{source_key.inspect}"
        end
        unless ENTITIES.fetch(entity).fetch(:korean_pattern).match?(korean)
          raise "missing Korean counterpart needs focused review: #{entity} #{source_key.inspect}"
        end

        before_entity = korean.dup
        korean = normalize_and_pair(korean, entity)
        disposition = before_entity == korean ? 'not-an-issue' : 'accepted'
        dispositions[entity] = disposition
        evidence << evidence_for(entity, row, source, old, korean, disposition)
      end

      # Every pending entity must have an explicit row-level disposition.
      raise 'missing entity disposition' unless dispositions.keys.sort == matches.map { |row| row['entity_key'] }.uniq.sort
      raise 'unreviewed counterpart remains' if dispositions.values.none? { |status| status == 'uncertain' } &&
        matches.any? { |row| !ENTITIES.fetch(row['entity_key']).fetch(:korean_pattern).match?(korean) }
      raise 'nested Jottun suffix label' if korean.match?(/요툰\(Jottun\)(?:족|인|어)/)
      raise 'nested Kollossae suffix label' if korean.match?(/콜로사이\(Kollossae\)(?:족|인|어)/)

      status =
        if dispositions.value?('uncertain')
          'uncertain'
        elsif dispositions.value?('accepted')
          'accepted'
        else
          'not-an-issue'
        end

      {
        'resource' => source_key[0],
        'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2],
        'entity_key' => dispositions.keys.sort.join('|'),
        'status' => status,
        'old' => old,
        'new' => korean,
        'evidence' => evidence.join(' '),
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions.sort.to_h)
      }
    end

    raise 'output keys are not unique' unless reviews.map { |row| ReviewedNameBatches.key(row) }.uniq.length == reviews.length
    raise 'not all 609 occurrences covered' unless
      reviews.sum { |row| JSON.parse(row.fetch('entity_dispositions_json')).length } == 609
    raise 'invalid disposition' unless reviews.all? do |row|
      row.fetch('entity_key').split('|').all? do |entity|
        %w[accepted not-an-issue uncertain].include?(
          JSON.parse(row.fetch('entity_dispositions_json')).fetch(entity)
        )
      end
    end

    ReviewedNameBatches.write_table(OUTPUT, ReviewedNameBatches::HEADERS, reviews)
    status_counts = reviews.group_by { |row| row.fetch('status') }.transform_values(&:length)
    entity_status_counts = reviews.each_with_object(Hash.new(0)) do |row, counts_by_entity|
      JSON.parse(row.fetch('entity_dispositions_json')).each do |entity, disposition|
        counts_by_entity[[entity, disposition]] += 1
      end
    end
    exceptions = reviews.select { |row| row.fetch('status') == 'uncertain' }
      .map { |row| "#{row['resource']}:#{row['ID_Linha']}:#{row['Tipo_Variante']}" }
    puts "#{OUTPUT}: #{reviews.length} source keys, 609 entity occurrences"
    puts "row statuses: #{status_counts.inspect}"
    puts "entity dispositions: #{entity_status_counts.sort.to_h.inspect}"
    puts "uncertain exceptions: #{exceptions.inspect}"
  end
end

ReviewedPeoplesFinal.run if $PROGRAM_NAME == __FILE__
