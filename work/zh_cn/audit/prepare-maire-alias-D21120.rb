#!/usr/bin/env ruby

require 'json'
require_relative 'build-proper-name-occurrences'
require_relative 'continue-proper-name-reviewed-batches'

module PrepareMaireAliasD21120
  extend self

  M = ReviewedNameBatches
  AUDIT = __dir__
  ENTITY = 'person:maire-ganan'
  GLOSSARY_PATH = File.join(AUDIT, 'proper-name-glossary.tsv')
  INDEX_PATH = M::INDEX
  REVIEW_PATH = File.join(AUDIT, 'proper-name-discovery-D21120.tsv')
  ALIAS_PATH = File.join(AUDIT, 'proper-name-alias-expansion-D21120.tsv')
  EXISTING_IDS = %w[24558 39693 50710 56623 61750 62274].freeze
  KOREAN_NAME = /
    (?:메이어|메이르|마이르|마이어|마이레|메이레|메이아|메어|마이아|마에르)
    (?:\(Maire(?:,\s*Queen\ of\ Cups)?\))?
  /x

  def index_key(row)
    [row.fetch('entity_key'), row.fetch('resource'),
     row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def source_key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'),
     row['Tipo_Variante'].to_s]
  end

  def run
    raise 'D-21120 artifacts already exist' if
      [REVIEW_PATH, ALIAS_PATH].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    glossary_table = M.table(GLOSSARY_PATH)
    glossary = glossary_table.map(&:to_h)
    entry = glossary.find { |row| row.fetch('entity_key') == ENTITY }
    raise 'confirmed Maire Ganan glossary entry missing' unless entry
    aliases = entry.fetch('english_aliases').to_s.split('|').reject(&:empty?)
    raise 'Maire alias already registered' if aliases.any? { |term| term.casecmp('Maire').zero? }
    entry['english_aliases'] = (aliases + ['Maire']).join('|')
    variants = entry.fetch('korean_variants').to_s.split('|').reject(&:empty?)
    entry['korean_variants'] =
      (variants + %w[메어 메이어 메이르 메이아 마이어 마이레 마이르 메이레 마에르]).uniq.join('|')
    entry['evidence_ids'] =
      (entry.fetch('evidence_ids').to_s.split('|').reject(&:empty?) + ['D-21120']).uniq.join('|')
    entry['notes'] +=
      ' D-21120 registers the English short-form alias Maire after aligned narrative context confirms it is the same person as Maire Ganan; standalone Korean uses the existing canonical name component 메어(Maire).'

    terms = ([entry.fetch('english_canonical')] + entry['english_aliases'].split('|'))
      .map(&:downcase)
    collisions = glossary.flat_map do |row|
      ([row.fetch('english_canonical')] + row.fetch('english_aliases').to_s.split('|'))
        .reject(&:empty?).map { |term| [term.downcase, row.fetch('entity_key')] }
    end.group_by(&:first).select do |term, owners|
      terms.include?(term) && owners.map(&:last).uniq != [ENTITY]
    end
    raise "Maire alias collides with another glossary entity: #{collisions.inspect}" unless collisions.empty?

    all_candidates = build_occurrences(inventory.values, glossary)
      .map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
      .select { |row| row.fetch('entity_key') == ENTITY }
    raise "expected 73 exact Maire source rows, got #{all_candidates.length}" unless
      all_candidates.length == 73
    previous_index = M.table(INDEX_PATH).map(&:to_h)
    previous_by_key = previous_index.to_h { |row| [index_key(row), row] }
    raise 'duplicate existing occurrence key' unless previous_by_key.length == previous_index.length
    old_maire = previous_index.select { |row| row['entity_key'] == ENTITY }
    raise "unexpected pre-existing Maire rows: #{old_maire.map { |row| row['ID_Linha'] }.inspect}" unless
      old_maire.map { |row| row['ID_Linha'] }.sort_by(&:to_i) == EXISTING_IDS

    candidate_keys = all_candidates.map { |row| index_key(row) }
    existing_keys = old_maire.map { |row| index_key(row) }
    new_keys = candidate_keys - existing_keys
    raise "expected 67 new short-name keys, got #{new_keys.length}" unless new_keys.length == 67

    proposed = all_candidates.each_with_object([]) do |candidate, result|
      key = index_key(candidate)
      next if existing_keys.include?(key)

      source = inventory.fetch(source_key(candidate))
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      count = english.scan(/(?<![A-Za-z])Maire(?![A-Za-z])/i).length
      raise "source Maire missing at #{key.inspect}" unless count.positive?
      old = source.fetch('work_text')
      new_text = old.gsub(KOREAN_NAME) do |match|
        match.include?('Queen of Cups') ? '메어(Maire, Queen of Cups)' : '메어(Maire)'
      end
      raise "Korean Maire form missing at #{key.inspect}" if new_text == old &&
        !old.match?(/메어\(Maire\)/)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      evidence = [
        'English identifies Maire as Irion’s wife and Moon Camp co-leader across the aligned narrative; the full name Maire Ganan is already registered.',
        'Japanese uses メイア/マイア and Chinese 麦内 for the same person, corroborating identity without establishing a unique Korean transliteration.',
        'Reuse the confirmed glossary component 메어 and normalize only this exact short-name row to 메어(Maire); preserve title wording, particles, line breaks, other entities, and prior dispositions.'
      ].join(' ')
      result << {
        'resource' => source.fetch('resource'),
        'ID_Linha' => source.fetch('ID_Linha'),
        'Tipo_Variante' => source['Tipo_Variante'].to_s,
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => new_text,
        'evidence' => evidence,
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end.sort_by { |row| row.fetch('ID_Linha').to_i }
    raise 'discovery review count differs' unless proposed.length == 67

    candidate_by_key = all_candidates.to_h { |row| [index_key(row), row] }
    merged = all_candidates.map do |candidate|
      key = index_key(candidate)
      previous = previous_by_key[key]
      previous ? candidate.merge(
        'status' => previous.fetch('status'),
        'evidence' => previous.fetch('evidence')
      ) : candidate
    end
    absent = previous_by_key.keys - candidate_by_key.keys
    absent.each do |key|
      previous = previous_by_key.fetch(key)
      current = inventory.fetch([
        previous.fetch('resource'), previous.fetch('ID_Linha'),
        previous['Tipo_Variante'].to_s
      ]).fetch('work_text')
      raise "stale manually scoped key #{key.inspect}" unless
        current == previous.fetch('korean_current')
      merged << previous
    end
    merged.sort_by! do |row|
      [row.fetch('resource'), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s, row.fetch('entity_key')]
    end

    M.write_table(GLOSSARY_PATH, glossary_table.headers, glossary)
    M.write_table(INDEX_PATH, M.table(INDEX_PATH).headers, merged)
    M.write_table(REVIEW_PATH, M::HEADERS.take(12), proposed)
    M.write_table(ALIAS_PATH, %w[entity_key english_alias scope evidence], [{
      'entity_key' => ENTITY,
      'english_alias' => 'Maire',
      'scope' => 'English short form of the already registered person Maire Ganan; all aligned occurrences identify Irion’s wife and Moon Camp leader.',
      'evidence' => 'D-21120; aligned English, Japanese, and Chinese source rows; prior full-name decisions retained.'
    }])
    puts "Staged #{proposed.length} new Maire short-name keys; preserved #{old_maire.length} prior full-name keys."
    puts "New-key dispositions: #{proposed.group_by { |row| row['status'] }.transform_values(&:length).inspect}"
  end
end

PrepareMaireAliasD21120.run if $PROGRAM_NAME == __FILE__
