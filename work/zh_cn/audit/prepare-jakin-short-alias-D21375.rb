#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module JakinShortAliasD21375
  M = ReviewedNameBatches
  ENTITY = 'person:jakin-madsen'
  ALIAS = 'Jakin'
  KOREAN = '제이킨'
  START_D = 21_375
  GLOSSARY = File.join(M::AUDIT, 'proper-name-glossary.tsv')
  INDEX = M::INDEX
  REVIEW = File.join(M::AUDIT, "proper-name-alias-review-D#{START_D}.tsv")
  DEFINITION = File.join(M::AUDIT, "proper-name-alias-definition-D#{START_D}.tsv")
  EVIDENCE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:44149 explicitly identifies Jakin as the brother of the
    speaker and arena master at the House of Valor; the already reviewed full
    name Jakin Madsen is the Valor Arena manager and reward contact in D-21171.
    All short-name hits occur in the same Valor Arena match/reward storyline,
    and the exact English, Japanese, and Chinese cells were checked row by row.
    Japanese ジェイキン・マドセン/ジェイキン and Chinese 雅金·麦德森/雅金
    corroborate the identity and support 제이킨. Pair only this attested short
    name as 제이킨(Jakin); keep the full-name source rows and their historical
    dispositions unchanged. There is no direct entry for this character in
    the official Korean manual.
  TEXT
  SHORT_PATTERN = /(?<![A-Za-z가-힣])(?:자킨|재킨|제이킨)(?:\s*\(Jakin\))?(?![A-Za-z])/

  module_function

  def updated_entity(glossary)
    row = glossary.find { |entry| entry.fetch('entity_key') == ENTITY }
    raise 'Jakin Madsen canonical entry changed' unless row &&
      row['english_canonical'] == 'Jakin Madsen' &&
      row['korean_canonical'] == '제이킨 매드슨(Jakin Madsen)' &&
      row['status'] == 'confirmed'
    raise 'Jakin short alias already registered' if
      row['english_aliases'].to_s.split('|').any? { |term| term.casecmp?(ALIAS) }
    collision = glossary.reject { |entry| entry['entity_key'] == ENTITY }.any? do |entry|
      ([entry['english_canonical']] + entry['english_aliases'].to_s.split('|'))
        .any? { |term| term.casecmp?(ALIAS) }
    end
    raise 'Jakin alias belongs to another glossary entity' if collision

    append = lambda do |old, values|
      (old.to_s.split('|').reject(&:empty?) + values).uniq.join('|')
    end
    row.merge(
      'english_aliases' => append.call(row['english_aliases'], [ALIAS]),
      'korean_variants' => append.call(row['korean_variants'], %w[자킨 재킨 제이킨]),
      'evidence_ids' => append.call(
        row['evidence_ids'],
        ["D-#{START_D}", *Array(@source_keys).map { |key| "#{key[0]}:#{key[1]}" }]
      ),
      'notes' => [row['notes'], EVIDENCE].reject(&:empty?).join(' ')
    )
  end

  def outside_parentheses?(text, position)
    text[0...position].count('(') <= text[0...position].count(')')
  end

  def normalize_short_names(text)
    result = text.dup
    matches = []
    result.to_enum(:scan, SHORT_PATTERN).each do
      match = Regexp.last_match
      matches << [match.begin(0), match.end(0)] if outside_parentheses?(result, match.begin(0))
    end
    matches.reverse_each { |start_at, finish| result[start_at...finish] = "#{KOREAN}(#{ALIAS})" }
    [result, matches.length]
  end

  def build_reviews(generated, inventory)
    generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text, count = normalize_short_names(old)
      raise "short Jakin span not found at #{key.inspect}" unless count.positive?
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => EVIDENCE,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row.fetch('Tipo_Variante')]
    end
  end

  def preserved_history?(before, after, inventory)
    before['status'] == after['status'] &&
      before['evidence'] == after['evidence'] &&
      after['korean_current'] == inventory.fetch(M.key(before)).fetch('work_text')
  end

  def run
    applying = ARGV == ['--apply']
    raise 'usage: prepare-jakin-short-alias-D21375.rb [--apply]' unless ARGV.empty? || applying
    ReviewedProperNameDiscovery.ensure_unused_batch!(START_D)

    glossary_table = M.table(GLOSSARY)
    index_table = M.table(INDEX)
    glossary = glossary_table.map(&:to_h)
    original_index = index_table.map(&:to_h)
    initial_hashes = M.hashes
    initial_glossary = File.binread(GLOSSARY)
    initial_index = File.binread(INDEX)
    inventory = M.refresh_inventory
    updated = updated_entity(glossary)
    generated = build_occurrences(inventory.values, [updated]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end.select do |row|
      row.fetch('matched_english').split('|').include?(ALIAS)
    end
    raise "expected 49 Jakin source rows, found #{generated.length}" unless generated.length == 49

    existing = original_index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row]
    end
    generated_by_key = generated.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row]
    end
    prior = generated_by_key.keys.select { |key| existing.key?(key) }
    raise "expected eight already-reviewed full-name rows, found #{prior.length}" unless prior.length == 8
    prior.each do |key|
      source = inventory.fetch(key.drop(1))
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      raise "unexpected prior Jakin row #{key.inspect}" unless
        english.match?(/(?<![A-Za-z])Jakin Madsen(?![A-Za-z])/i) &&
        %w[accepted not-an-issue excluded uncertain].include?(existing.fetch(key)['status'])
    end
    new_generated = generated.reject do |row|
      existing.key?([row.fetch('entity_key'), *M.key(row)])
    end
    raise "expected 41 new short-name rows, found #{new_generated.length}" unless
      new_generated.length == 41

    @source_keys = generated.map { |row| M.key(row) }
    updated = updated_entity(glossary)
    reviews = build_reviews(new_generated, inventory)
    raise 'unexpected short-name review totals' unless reviews.length == 41
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row.fetch('resource') }.each do |resource, rows|
      edits = rows.select { |row| row.fetch('old') != row.fetch('new') }
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits) unless edits.empty?
    end
    updated_index = original_index.dup
    prior.each do |key|
      match = generated_by_key.fetch(key)
      row = updated_index.find do |entry|
        [entry.fetch('entity_key'), *M.key(entry)] == key
      end
      row['matched_english'] = match.fetch('matched_english')
    end
    pending = new_generated.map do |row|
      row.merge(
        'status' => 'needs-context',
        'evidence' => "Candidate hit from newly registered English short-name alias #{ALIAS}."
      )
    end
    raise 'duplicate new Jakin source keys' unless
      pending.map { |row| [row.fetch('entity_key'), *M.key(row)] }.uniq.length == 41

    if applying
      raise 'prepared review changed; inspect and prepare again' unless
        M.table(REVIEW).map(&:to_h) == reviews &&
        M.table(DEFINITION).map(&:to_h) == [updated]
      raise 'active CSV/glossary/index changed since preflight' unless
        initial_hashes == M.hashes &&
        initial_glossary == File.binread(GLOSSARY) &&
        initial_index == File.binread(INDEX)

      updated_index.concat(pending)
      M.write_table(GLOSSARY, glossary_table.headers,
                    glossary.map { |row| row['entity_key'] == ENTITY ? updated : row })
      M.write_table(INDEX, index_table.headers, updated_index)
      M.run(REVIEW, START_D, 1)

      final_glossary = M.table(GLOSSARY).map(&:to_h)
      raise 'unexpected Jakin glossary mutation' unless final_glossary ==
        glossary.map { |row| row['entity_key'] == ENTITY ? updated : row }
      final_index = M.table(INDEX).map(&:to_h)
      final_inventory = M.refresh_inventory
      final_by_key = final_index.to_h do |row|
        [[row.fetch('entity_key'), *M.key(row)], row]
      end
      raise 'duplicate final occurrence key' unless final_by_key.length == final_index.length
      original_index.each do |before|
        key = [before.fetch('entity_key'), *M.key(before)]
        after = final_by_key.fetch(key)
        changed = before.dup
        changed['matched_english'] = generated_by_key.fetch(key)['matched_english'] if
          prior.include?(key)
        raise "historical disposition/evidence changed #{key.inspect}" unless
          preserved_history?(before, after, final_inventory)
        raise "unexpected prior match metadata #{key.inspect}" unless
          changed['matched_english'] == after['matched_english']
      end
      expected_keys = build_occurrences(
        M.refresh_inventory.values, final_glossary
      ).select { |values| values[0] == ENTITY }
        .map { |values| [values[0], values[1], values[2], values[3]] }.sort
      actual_keys = final_index.select { |row| row['entity_key'] == ENTITY }
        .map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
      raise 'post-registration source/index keys differ' unless expected_keys == actual_keys
      puts "Registered Jakin as a short alias of #{ENTITY}; reviewed #{reviews.length} new rows; " \
           "preserved #{prior.length} prior full-name rows."
    else
      M.write_table(REVIEW, M::HEADERS, reviews)
      M.write_table(DEFINITION, glossary_table.headers, [updated])
      puts "Prepared #{reviews.length} short-name rows (#{reviews.count { |row| row['old'] != row['new'] }} edits); " \
           "preserved #{prior.length} existing full-name rows. No glossary/index/CSV changes."
    end
  end
end

JakinShortAliasD21375.run if $PROGRAM_NAME == __FILE__
