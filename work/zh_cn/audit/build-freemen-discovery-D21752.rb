#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require 'digest'
require 'fileutils'

module FreemenDiscoveryD21752
  extend self
  M = ReviewedNameBatches
  DEFINITION_PATH = File.join(__dir__, 'proper-name-discovery-definitions-D21752.tsv')
  OUTPUT_PATH = File.join(__dir__, 'proper-name-discovery-D21752.tsv')
  REJECTED_OUTPUT_PATH = File.join(__dir__, 'proper-name-discovery-D21752-rejected.tsv')
  INVALID_OUTPUT_SHA256 = '306c0664a9aae4859c5a2b213f666c6f9189bba440173f505b36cbe5d886e57a'
  INTERMEDIATE_OUTPUT_SHA256 = 'e2250c5d73bafbd868fa4419140700264451599f7c845cd1d815979a4165e70a'
  HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese entity_dispositions_json
  ].freeze
  EXCLUDED = [].to_set.freeze
  UNCERTAIN = [['default', '41621', '']].to_set.freeze
  COLLECTIVE_SINGULAR_KEYS = %w[27038 32758 38141 59671].to_set.freeze

  def source_term(english, key)
    return 'Freemen' if english.match?(/\bFreemen\b/i)
    return 'Freemen' if key.first == 'default' &&
      COLLECTIVE_SINGULAR_KEYS.include?(key[1])
    return 'Freeman' if english.match?(/\bFreeman\b/i)

    raise "Freeman source term missing: #{english[0, 100]}"
  end

  def canonicalize(korean, term, key)
    display = term == 'Freemen' ? '프리맨(Freemen)' : '프리맨(Freeman)'
    korean.gsub(/(?:자유민|프리맨|프리먼)(들)?(?:\((?:Freemen|Freeman)\))?(들)?/) do |match|
      suffix = Regexp.last_match(1) || Regexp.last_match(2)
      "#{display}#{suffix}"
    end
  end

  def evidence(status, term, key)
    return 'Preserve the historical uncertainty at default:41621. English “For Vonn Freeman!” can address a person or invoke the faction; Japanese フリーマン団 does not settle the referent for this exact line.' if status == 'uncertain'

    "English identifies the Freemen faction or a member/descriptor of it; aligned Japanese フリーマン団 corroborates the faction reading and Chinese is supplementary. Use 프리맨(Freemen) for the group and 프리맨(Freeman) for a singular member, including faction compounds; pair only this component and do not infer a separately named item or enemy entity. Preserve unrelated names, prior row dispositions, and all source meaning. Exact source term: #{term}; reviewed key: #{key.join(':')}."
  end

  def build
    if File.exist?(OUTPUT_PATH)
      actual = Digest::SHA256.file(OUTPUT_PATH).hexdigest
      if actual == INVALID_OUTPUT_SHA256
        if File.exist?(REJECTED_OUTPUT_PATH)
          raise 'rejected draft archive already exists; preserve both artifacts'
        end
        FileUtils.cp(OUTPUT_PATH, REJECTED_OUTPUT_PATH)
      elsif actual != INTERMEDIATE_OUTPUT_SHA256
        raise "existing output changed since the reviewed intermediate: #{actual}"
      end
    end
    definitions = M.table(DEFINITION_PATH).map(&:to_h)
    raise 'expected one confirmed Freemen definition' unless
      definitions.length == 1 &&
      definitions.first['entity_key'] == 'faction:freemen' &&
      definitions.first['status'] == 'confirmed'

    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "expected 80 exact source keys, got #{generated.length}" unless generated.length == 80
    raise 'duplicate generated row key' unless generated.map { |row| M.key(row) }.uniq.length == generated.length

    rows = generated.map do |hit|
      key = M.key(hit)
      source = inventory.fetch(key)
      term = source_term(hit.fetch('english_source'), key)
      if EXCLUDED.include?(key)
        status = 'excluded'
        new_text = source.fetch('work_text')
      elsif UNCERTAIN.include?(key)
        status = 'uncertain'
        new_text = source.fetch('work_text')
      else
        new_text = canonicalize(source.fetch('work_text'), term, key)
        status = new_text == source.fetch('work_text') ? 'not-an-issue' : 'accepted'
        raise "could not identify a Korean target span for #{key.inspect}" if
          status == 'accepted' && new_text == source.fetch('work_text')
      end
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => 'faction:freemen',
        'status' => status,
        'old' => source.fetch('work_text'),
        'new' => new_text,
        'evidence' => evidence(status, term, key),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate('faction:freemen' => status)
      }
    end

    M.write_table(OUTPUT_PATH, HEADERS, rows)
    counts = rows.group_by { |row| row.fetch('status') }.transform_values(&:length)
    puts "Wrote #{rows.length} source keys: #{counts.inspect} to #{OUTPUT_PATH}"
  end
end

FreemenDiscoveryD21752.build if $PROGRAM_NAME == __FILE__
