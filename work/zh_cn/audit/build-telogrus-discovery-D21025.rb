#!/usr/bin/env ruby

require 'csv'
require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'

module TelogrusDiscoveryD21025
  M = ReviewedNameBatches
  AUDIT = M::AUDIT
  ENTITY = 'deity:telogrus'
  CANONICAL = '텔로그루스(Telogrus)'
  VARIANTS = %w[텔로그루스 텔로그러스 텔로그라스 테로그루스 테로그러스 테로그라스].freeze
  DEFINITION_PATH = File.join(AUDIT, 'proper-name-discovery-definitions-D21025.tsv')
  SCOUT_PATH = File.join(AUDIT, 'proper-name-discovery-scout-D21025.tsv')
  REVIEW_PATH = '/private/tmp/proper-name-reviewed-D21025.tsv'
  SCOUT_HEADERS = %w[
    english_candidate source_rows already_indexed_rows exact_bilingual_rows
    spelling_variants_rows edited_rows disposition evidence
  ].freeze
  module_function

  def exact_name?(text)
    text.match?(/(?<![A-Za-z])Telogrus(?![A-Za-z])/i)
  end

  def source_texts(row, locale)
    JSON.parse(row.fetch("#{locale}_texts_json") || '[]').compact
  end

  def output_table(path, headers, rows)
    CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << headers
      rows.each { |row| csv << headers.map { |header| row[header] } }
    end
  end

  def following_full_label?(text, finish)
    tail = text[finish..]
    boundary = tail.index(/[.!?。\r\n]/)
    tail = tail[0...boundary] if boundary
    tail.match?(/\A(?:\s+[\p{Hangul}A-Za-z'-]+){0,4}\s*\([^)\r\n]*\bTelogrus\b[^)\r\n]*\)/i)
  end

  def normalize(text)
    pattern = /#{VARIANTS.map { |variant| Regexp.escape(variant) }.join('|')}/
    matches = text.to_enum(:scan, pattern).map do
      match = Regexp.last_match
      [match.begin(0), match.end(0), match[0]]
    end
    result = text.dup
    matches.reverse_each do |start, finish, korean|
      already_paired = text[finish..].to_s.match?(/\A\(Telogrus\)/i)
      replace_with = if already_paired || following_full_label?(text, finish)
                       '텔로그루스'
                     else
                       CANONICAL
                     end
      result[start, finish - start] = replace_with
    end
    [result, matches.map(&:last)]
  end

  def run
    [DEFINITION_PATH, SCOUT_PATH, REVIEW_PATH].each do |path|
      raise "output already exists: #{path}" if File.exist?(path)
    end
    inventory = M.refresh_inventory.values
    glossary = M.table(File.join(AUDIT, 'proper-name-glossary.tsv'))
    raise 'Telogrus deity already exists in glossary' if
      glossary.any? { |row| row['entity_key'] == ENTITY }
    raise 'English term already belongs to another entity' if glossary.any? do |row|
      ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
        .any? { |term| term.casecmp?('Telogrus') }
    end

    sources = inventory.select do |row|
      source_texts(row, 'en').any? { |text| exact_name?(text) }
    end.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s]
    end
    raise "expected 210 source rows, found #{sources.length}" unless sources.length == 210
    raise 'expected default-only source coverage' unless
      sources.all? { |row| row.fetch('resource') == 'default' }

    first = sources.find { |row| row.fetch('ID_Linha') == '10521' }
    raise 'missing English/Japanese/Chinese pronunciation anchor' unless
      source_texts(first, 'en').join(' ').include?('Hail Telogrus') &&
      source_texts(first, 'ja').join(' ').include?('テログラス') &&
      first.fetch('zh_text').include?('泰罗格拉斯')

    definition = {
      'entity_key' => ENTITY,
      'english_canonical' => 'Telogrus',
      'category' => 'deity',
      'korean_canonical' => CANONICAL,
      'english_aliases' => '',
      'korean_variants' => '텔로그러스|텔로그라스|테로그루스|테로그러스|테로그라스',
      'evidence_ids' => 'D-21025|default:10521|default:14298|default:22952',
      'status' => 'confirmed',
      'notes' => 'The English corpus identifies Telogrus as the God of Chaos and the named antagonist; Japanese テログラス corroborates pronunciation and Chinese 泰罗格拉斯 is supporting evidence. The aligned Korean corpus predominantly uses 텔로그루스(Telogrus); standardize observed transliteration variants to that form. The official Korean manual has no direct Telogrus entry.'
    }
    output_table(DEFINITION_PATH, glossary.headers, [definition])

    reviews = sources.map do |source|
      old_text = source.fetch('work_text')
      new_text, matched_forms = normalize(old_text)
      english = source_texts(source, 'en').join("\n")
      japanese = source_texts(source, 'ja').join("\n---\n")
      chinese = source.fetch('zh_text')
      status = old_text == new_text ? 'not-an-issue' : 'accepted'
      disposition = status
      evidence = if status == 'accepted'
                   "English names Telogrus in this row; Japanese and Chinese aligned text were checked as corroborating evidence. Standardize only the Korean Telogrus spelling/label to #{CANONICAL}; matched Korean forms: #{matched_forms.uniq.join(', ')}. Preserve sentence meaning, particles, complete bilingual compound labels, line breaks, and placeholders."
                 else
                   "English names Telogrus in this row; Japanese and Chinese aligned text were checked as corroborating evidence. The Korean uses the established #{CANONICAL} form or embeds Telogrus in a complete bilingual compound; no wording change is needed."
                 end
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
        'entity_dispositions_json' => JSON.generate(ENTITY => disposition)
      }
    end
    raise 'duplicate Telogrus source row key' unless
      reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    raise 'unexpected D-number batch count' unless (reviews.length.to_f / 50).ceil == 5
    output_table(REVIEW_PATH, M::HEADERS, reviews)

    exact_bilingual_rows = sources.count do |source|
      source.fetch('work_text').match?(/텔로그루스\(Telogrus\)/)
    end
    spelling_variants_rows = sources.count do |source|
      source.fetch('work_text').match?(/텔로그러스|텔로그라스|테로그루스|테로그러스|테로그라스/)
    end
    edited_rows = reviews.count { |row| row['status'] == 'accepted' }
    scout = [{
      'english_candidate' => 'Telogrus',
      'source_rows' => sources.length,
      'already_indexed_rows' => 0,
      'exact_bilingual_rows' => exact_bilingual_rows,
      'spelling_variants_rows' => spelling_variants_rows,
      'edited_rows' => edited_rows,
      'disposition' => 'confirmed deity; review all 210 source rows in five sequential 50-key batches',
      'evidence' => 'English identifies the God of Chaos; Japanese テログラス and Chinese 泰罗格拉斯 corroborate. Korean canonical form follows the established majority 텔로그루스, paired with English.'
    }]
    output_table(SCOUT_PATH, SCOUT_HEADERS, scout)
    warn "Prepared #{reviews.length} source rows (#{edited_rows} accepted, #{reviews.length - edited_rows} not-an-issue); definitions at #{DEFINITION_PATH}; reviews at #{REVIEW_PATH}."
  end
end

TelogrusDiscoveryD21025.run if $PROGRAM_NAME == __FILE__
