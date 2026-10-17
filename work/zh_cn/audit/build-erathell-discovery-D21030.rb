#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module ErathellDiscoveryD21030
  M = ReviewedNameBatches
  AUDIT = M::AUDIT
  PLACE = 'place:erathell'
  CULT = 'faction:children-of-erathell'
  ITEM = 'item:erathells-blessing'
  DEFINITIONS_PATH = File.join(AUDIT, 'proper-name-discovery-definitions-D21030.tsv')
  SCOUT_PATH = File.join(AUDIT, 'proper-name-discovery-scout-D21030.tsv')
  REVIEW_PATH = '/private/tmp/proper-name-reviewed-D21030-v2.tsv'
  SCOUT_HEADERS = %w[
    english_candidate source_rows spelling_variants_rows existing_full_labels
    separate_children_of_erathell_rows separate_unique_item_rows disposition evidence
  ].freeze
  CULT_KOREAN = '에라셀의 자손(Children of Erathell)'
  module_function

  def texts(row, locale)
    JSON.parse(row.fetch("#{locale}_texts_json") || '[]').compact
  end

  def english_has?(row, pattern)
    texts(row, 'en').any? { |text| text.match?(pattern) }
  end

  def table(path, headers, rows)
    CSV.open(path, 'w', col_sep: "\t", row_sep: "\r\n", force_quotes: true) do |csv|
      csv << headers
      rows.each { |row| csv << headers.map { |header| row[header] } }
    end
  end

  def paired_compound?(text, finish)
    tail = text[finish..].to_s
    boundary = tail.index(/[.!?。\r\n]/)
    tail = tail[0...boundary] if boundary
    tail.match?(/\A(?:\s+[\p{Hangul}A-Za-z'-]+){0,5}\s*\([^)\r\n]*\bErathell\b[^)\r\n]*\)/i)
  end

  def normalize_place(text)
    pattern = /에라셀|에라텔/
    matches = text.to_enum(:scan, pattern).map do
      match = Regexp.last_match
      [match.begin(0), match.end(0)]
    end
    result = text.dup
    matches.reverse_each do |start, finish|
      paired = text[finish..].to_s.match?(/\A\(Erathell\)/i) ||
        paired_compound?(text, finish)
      result[start, finish - start] = paired ? '에라셀' : '에라셀(Erathell)'
    end
    result
  end

  def normalize_cult(text)
    pattern = /에라(?:셀|텔)의\s*(?:자손들?|후예)/
    matches = text.to_enum(:scan, pattern).map do
      match = Regexp.last_match
      [match.begin(0), match.end(0)]
    end
    result = text.dup
    matches.reverse_each do |start, finish|
      already_paired = text[finish..].to_s.match?(/\A\(Children of Erathell\)/i)
      result[start, finish - start] = already_paired ? '에라셀의 자손' : CULT_KOREAN
    end
    result
  end

  def definition(headers, entity:, english:, category:, korean:, ids:, notes:)
    {
      'entity_key' => entity,
      'english_canonical' => english,
      'category' => category,
      'korean_canonical' => korean,
      'english_aliases' => '',
      'korean_variants' => '',
      'evidence_ids' => ids,
      'status' => 'confirmed',
      'notes' => notes
    }.slice(*headers)
  end

  def run
    [DEFINITIONS_PATH, SCOUT_PATH, REVIEW_PATH].each do |path|
      raise "output already exists: #{path}" if File.exist?(path)
    end
    inventory_by_key = M.refresh_inventory
    inventory = inventory_by_key.values
    glossary = M.table(File.join(AUDIT, 'proper-name-glossary.tsv'))
    [PLACE, CULT, ITEM].each do |entity|
      raise "entity already registered: #{entity}" if
        glossary.any? { |row| row['entity_key'] == entity }
    end
    terms = glossary.flat_map do |row|
      [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
    end.map(&:downcase)
    raise 'Erathell canonical term already registered' if terms.include?('erathell')
    raise 'Children of Erathell term already registered' if
      terms.include?('children of erathell')
    raise 'Erathell blessing item already registered' if
      terms.include?("the erathell's blessing")

    sources = inventory.select { |row| english_has?(row, /(?<![A-Za-z])Erathell(?![A-Za-z])/i) }
      .sort_by do |row|
        [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
         row['Tipo_Variante'].to_s]
      end
    cult_sources = sources.select do |row|
      english_has?(row, /(?<![A-Za-z])Children of Erathell(?![A-Za-z])/i)
    end
    raise "expected 161 Erathell source rows, found #{sources.length}" unless sources.length == 161
    raise "expected nine cult references, found #{cult_sources.length}" unless
      cult_sources.length == 9

    anchor = inventory_by_key.fetch(['base', '3291', '11'])
    raise 'missing aligned place-name anchor' unless
      texts(anchor, 'en') == ['Erathell'] &&
      texts(anchor, 'ja').join.include?('エラセル') &&
      anchor.fetch('zh_text').include?('伊拉塞尔')
    cult_anchor = inventory_by_key.fetch(['default', '1641', ''])
    raise 'missing aligned cult anchor' unless
      texts(cult_anchor, 'en').join.include?('an extinct cult') &&
      texts(cult_anchor, 'ja').join.include?('エラセルの末裔たち') &&
      cult_anchor.fetch('zh_text').include?('伊拉塞尔之子')
    item_anchor = inventory_by_key.fetch(['default', '26115', ''])
    raise 'missing aligned unique-item anchor' unless
      texts(item_anchor, 'en') == ["The Erathell's Blessing"] &&
      texts(item_anchor, 'ja').join.include?('エラセルの祝福') &&
      item_anchor.fetch('zh_text').include?('伊拉塞尔的祝福')

    definitions = [
      definition(
        glossary.headers, entity: PLACE, english: 'Erathell', category: 'place',
        korean: '에라셀(Erathell)', ids: 'D-21030|base:3291|default:3353',
        notes: 'English identifies Erathell as a named place/region; aligned Japanese エラセル and Chinese 伊拉塞尔 corroborate. Canonical Korean follows the established 에라셀(Erathell), correcting 에라텔 variants. Keep compound Children of Erathell references scoped to their distinct cult entity.'
      ),
      definition(
        glossary.headers, entity: CULT, english: 'Children of Erathell',
        category: 'faction', korean: CULT_KOREAN,
        ids: 'D-21030|default:1641|default:28909',
        notes: 'English explicitly identifies the Children of Erathell as an extinct cult. Japanese エラセルの末裔たち and Chinese 伊拉塞尔之子 corroborate. Canonical Korean is 에라셀의 자손(Children of Erathell); keep separate from place:erathell and from the Erathi beings they worshipped.'
      ),
      definition(
        glossary.headers, entity: ITEM, english: "The Erathell's Blessing",
        category: 'unique item',
        korean: "에라셀의 축복(The Erathell's Blessing)",
        ids: "D-21030|default:26115",
        notes: "English presents The Erathell's Blessing as a standalone named item label. Japanese エラセルの祝福 and Chinese 伊拉塞尔的祝福 corroborate the reading. Keep this atomic item distinct from place:erathell."
      )
    ]
    table(DEFINITIONS_PATH, glossary.headers, definitions)

    reviews = sources.map do |source|
      english = texts(source, 'en').join("\n")
      japanese = texts(source, 'ja').join("\n---\n")
      chinese = source.fetch('zh_text')
      old_text = source.fetch('work_text')
      is_cult = english_has?(source, /(?<![A-Za-z])Children of Erathell(?![A-Za-z])/i)
      is_item = english_has?(source, /(?<![A-Za-z])The Erathell's Blessing(?![A-Za-z])/i)
      raise 'unexpected overlapping Erathell sub-entity' if is_cult && is_item
      new_text = if is_cult
                   normalize_cult(old_text)
                 elsif is_item
                   old_text == '에라셀의 축복' ? "에라셀의 축복(The Erathell's Blessing)" : old_text
                 else
                   normalize_place(old_text)
                 end
      dispositions = {}
      evidence = []
      if is_cult
        dispositions[PLACE] = 'excluded'
        evidence << 'The exact source name is the Children of Erathell cult, not the place itself; exclude this key from place:erathell.'
        dispositions[CULT] = old_text == new_text ? 'not-an-issue' : 'accepted'
        evidence << "English identifies the extinct cult; Japanese and Chinese aligned text corroborate. Standardize its Korean name to #{CULT_KOREAN} without changing the associated item or dialogue."
      elsif is_item
        dispositions[PLACE] = 'excluded'
        evidence << "The exact source is the named item The Erathell's Blessing, not a standalone place reference; exclude this key from place:erathell."
        dispositions[ITEM] = old_text == new_text ? 'not-an-issue' : 'accepted'
        evidence << "English names the item; Japanese and Chinese aligned text corroborate. Preserve the full item label atomically as 에라셀의 축복(The Erathell's Blessing)."
      else
        dispositions[PLACE] = old_text == new_text ? 'not-an-issue' : 'accepted'
        evidence << 'English names the place Erathell; Japanese エラセル and Chinese 伊拉塞尔 are corroborating evidence.'
        evidence << 'Normalize only 에라텔 to 에라셀 and add the English label when no complete bilingual Erathell compound already covers the name.'
        evidence << 'Preserve complete names such as Plains of Erathell and Erathell Arena without nested labels.'
      end
      status = if old_text != new_text
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      {
        'resource' => source.fetch('resource'),
        'ID_Linha' => source.fetch('ID_Linha'),
        'Tipo_Variante' => source['Tipo_Variante'].to_s,
        'entity_key' => dispositions.keys.join('|'),
        'status' => status,
        'old' => old_text,
        'new' => new_text,
        'evidence' => evidence.join(' '),
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    raise 'duplicate Erathell source row keys' unless
      reviews.map { |row| M.key(row) }.uniq.length == reviews.length
    raise 'expected four sequential batches' unless (reviews.length.to_f / 50).ceil == 4
    table(REVIEW_PATH, M::HEADERS, reviews)

    scout = [{
      'english_candidate' => 'Erathell',
      'source_rows' => sources.length,
      'spelling_variants_rows' => sources.count { |row| row['work_text'].include?('에라텔') },
      'existing_full_labels' => sources.count do |row|
        row['work_text'].include?('(Erathell') || row['work_text'].include?('(Plains of Erathell') ||
          row['work_text'].include?('(Erathell Arena')
      end,
      'separate_children_of_erathell_rows' => cult_sources.length,
      'separate_unique_item_rows' => sources.count do |row|
        english_has?(row, /(?<![A-Za-z])The Erathell's Blessing(?![A-Za-z])/i)
      end,
      'disposition' => 'register the named place, distinct extinct cult, and unique item; review 161 distinct row keys in four sequential batches',
      'evidence' => 'English anchors both identities and distinctions; JA エラセル / エラセルの末裔たち and ZH 伊拉塞尔 / 伊拉塞尔之子 corroborate. Erathi is separately registered and is not normalized as Erathell.'
    }]
    table(SCOUT_PATH, SCOUT_HEADERS, scout)
    warn "Prepared #{reviews.length} distinct source rows; #{cult_sources.length} also disposition the cult entity."
  end
end

ErathellDiscoveryD21030.run if $PROGRAM_NAME == __FILE__
