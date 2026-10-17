#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module SaturnynAliasD21318
  M = ReviewedNameBatches
  ENTITY = 'person:bisarane'
  START_D = 21318
  GLOSSARY = File.join(M::AUDIT, 'proper-name-glossary.tsv')
  REVIEW = File.join(M::AUDIT, 'proper-name-alias-review-D21318.tsv')
  DEFINITION = File.join(M::AUDIT, 'proper-name-alias-definition-D21318.tsv')
  PROOF = File.join(M::AUDIT, 'proper-name-alias-registration-D21318.json')
  CORRECTIVE_IDS = %w[2577 8567 12523 24852 32496 44296 49583].freeze
  PRESERVED_IDS = %w[27 5491 16690 55381 62058].freeze
  NAME = /(?:새터닌|사터닌|사투르닌)(?: ?\(Saturnyn\))?/
  NOTE = 'D-21318-D-21319: English default:2577 explicitly says Bisarane revealed he was Saturnyn, and default:32496 repeats the reveal; Japanese and Chinese corroborate the single identity. Register Saturnyn only as an alias of existing person:bisarane, not a new person. Preserve 비사라네(Bisarane); annotate the source-local alias 사투르닌(Saturnyn), normalizing 새터닌/사터닌. English anchors meaning, Japanese サタンニン and Chinese 萨图恩宁 support the name. Saturnalia is a distinct festival, Cadoroc is not established as this identity, and the creeping-vine comparison at default:34174 is a metaphor, not a named item. Official Korean manual PDF pp. 1-2 and 7 provide Winter Court/Fate and House of Sorrows faction context, not this alias spelling. Existing terminal keys are not newly discovered occurrences; seven accepted alias-span corrections retain their statuses and prior evidence, and five already correct keys are untouched.'

  module_function

  def fingerprint(value)
    Digest::SHA256.hexdigest(JSON.generate(value))
  end

  def append(old, extra)
    (old.to_s.split('|').reject(&:empty?) + extra).uniq.join('|')
  end

  def scope(inventory, index, entity)
    sources = inventory.values.select do |row|
      JSON.parse(row['en_texts_json']).compact.any? { |text| text.match?(/\bSaturnyn\b/) }
    end
    raise 'Saturnyn source scope changed' unless sources.length == 100 &&
      sources.all? { |row| row['resource'] == 'default' && row['Tipo_Variante'].to_s.empty? }
    by_key = index.to_h { |row| [[row['entity_key'], *M.key(row)], row] }
    raise 'duplicate indexed key' unless by_key.length == index.length
    generated = build_occurrences(inventory.values, [entity]).map { |row| OCCURRENCE_HEADERS.zip(row).to_h }
    missing = generated.reject { |row| by_key.key?([ENTITY, *M.key(row)]) }
    source_keys = sources.map { |row| M.key(row) }
    raise 'alias introduced non-Saturnyn missing keys' unless missing.length == 88 &&
      missing.all? { |row| source_keys.include?(M.key(row)) }
    existing = sources.map do |source|
      row = by_key[[ENTITY, *M.key(source)]]
      row && [source['ID_Linha'], row]
    end.compact.to_h
    raise 'existing source overlap changed' unless existing.keys.sort ==
      (CORRECTIVE_IDS + PRESERVED_IDS).sort
    CORRECTIVE_IDS.each { |id| raise 'corrective status changed' unless existing.fetch(id)['status'] == 'accepted' }
    PRESERVED_IDS.each do |id|
      text = inventory.fetch(M.key(existing.fetch(id)))['work_text']
      raise 'preserved alias is no longer correct' unless text.gsub(NAME, '사투르닌(Saturnyn)') == text
    end
    selected = sources.select { |row| !existing.key?(row['ID_Linha']) || CORRECTIVE_IDS.include?(row['ID_Linha']) }
    raise 'expected 95 distinct review keys' unless selected.length == 95 && selected.map { |r| M.key(r) }.uniq.length == 95
    rows = selected.sort_by { |row| row['ID_Linha'].to_i }.map do |source|
      old = source.fetch('work_text')
      raise 'unreviewed missing Korean alias span' unless old.match?(NAME)
      proposed = old.gsub(NAME, '사투르닌(Saturnyn)')
      raise 'line endings or tokens changed' unless old.scan(/\r\n|\r|\n/) == proposed.scan(/\r\n|\r|\n/) &&
        ProperNameCellEditor.tokens(old) == ProperNameCellEditor.tokens(proposed)
      status = old == proposed ? 'not-an-issue' : 'accepted'
      previous = existing[source['ID_Linha']]
      raise 'corrective alias already applied' if previous && status != 'accepted'
      evidence = [NOTE, previous && "Additional alias-span correction, not a new occurrence. Retain previous disposition #{previous['status']} and evidence: #{previous['evidence']}."].compact.join(' ')
      {
        'resource' => source['resource'], 'ID_Linha' => source['ID_Linha'],
        'Tipo_Variante' => source['Tipo_Variante'].to_s, 'entity_key' => ENTITY,
        'status' => status, 'old' => old, 'new' => proposed, 'evidence' => evidence,
        'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n---\n"),
        'chinese' => source['zh_text'], 'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    [missing, rows]
  end

  def run
    applying = ARGV == ['--apply']
    raise 'usage: prepare-saturnyn-alias-D21318.rb [--apply]' unless ARGV.empty? || applying
    glossary_table = M.table(GLOSSARY)
    index_table = M.table(M::INDEX)
    glossary = glossary_table.map(&:to_h)
    index = index_table.map(&:to_h)
    original = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'existing entity changed' unless original &&
      original['english_canonical'] == 'Bisarane' && original['korean_canonical'] == '비사라네(Bisarane)' &&
      original['english_aliases'].to_s.empty?
    glossary.each do |row|
      owned = [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
      raise "Saturnyn already registered at #{row['entity_key']}" if owned.compact.any? { |term| term.casecmp?('Saturnyn') }
    end
    entity = original.merge(
      'english_aliases' => 'Saturnyn',
      'korean_variants' => append(original['korean_variants'], %w[사투르닌 새터닌 사터닌]),
      'evidence_ids' => append(original['evidence_ids'], %w[D-21318-D-21319 default:2577 default:32496]),
      'notes' => [original['notes'], NOTE].join(' ')
    )
    initial_hashes = M.hashes
    initial_glossary = File.binread(GLOSSARY)
    initial_index = File.binread(M::INDEX)
    inventory = M.refresh_inventory
    missing, rows = scope(inventory, index, entity)
    (START_D..START_D + 1).each do |d|
      raise "D-#{d} already recorded" unless Dir.glob(File.join(M::AUDIT, "named-scope-*-D#{d}-*.md")).empty? &&
        !File.exist?(File.join(M::AUDIT, "proper-name-edits-D#{d}.tsv"))
    end
    if applying
      raise 'prepared manifest changed; review again' unless M.table(REVIEW).map(&:to_h) == rows &&
        M.table(DEFINITION).map(&:to_h) == [entity]
    else
      raise 'prepared artifacts already exist' if [REVIEW, DEFINITION, PROOF].any? { |path| File.exist?(path) }
    end
    rows.group_by { |row| row['resource'] }.each do |resource, reviews|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), reviews.select { |row| row['old'] != row['new'] })
    end
    raise 'active inputs changed during preflight' unless initial_hashes == M.hashes &&
      initial_glossary == File.binread(GLOSSARY) && initial_index == File.binread(M::INDEX)
    unless applying
      M.write_table(REVIEW, M::HEADERS, rows)
      M.write_table(DEFINITION, glossary_table.headers, [entity])
      puts "Prepared #{rows.length} rows: #{missing.length} new keys + #{CORRECTIVE_IDS.length} accepted alias corrections; #{rows.count { |r| r['old'] != r['new'] }} edits. No registration/CSV changes."
      return
    end
    pending = missing.map { |row| row.merge('evidence' => 'D-21318 Saturnyn alias extension; reviewed manifest pending, existing keys preserved.') }
    M.write_table(GLOSSARY, glossary_table.headers, glossary.map { |row| row['entity_key'] == ENTITY ? entity : row })
    M.write_table(M::INDEX, index_table.headers, index + pending)
    M.run(REVIEW, START_D, nil, review_states: %w[needs-context accepted])
    final_index = M.table(M::INDEX).map(&:to_h)
    final_by_key = final_index.to_h { |row| [[row['entity_key'], *M.key(row)], row] }
    changed_keys = rows.map { |row| [ENTITY, *M.key(row)] }
    projection = ->(row) { row.reject { |field, _| field == 'korean_current' } }
    index.each do |before|
      key = [before['entity_key'], *M.key(before)]
      after = final_by_key.fetch(key)
      if changed_keys.include?(key)
        raise 'existing disposition changed' unless before['status'] == after['status'] &&
          after['evidence'].include?(before['evidence'])
      else
        raise "unrelated historical record changed #{key.inspect}" unless projection.call(before) == projection.call(after)
      end
    end
    raise 'occurrence count mismatch' unless final_index.length == index.length + 88 && final_by_key.length == final_index.length
    final_glossary = M.table(GLOSSARY).map(&:to_h)
    raise 'unrelated glossary changes' unless final_glossary == glossary.map { |row| row['entity_key'] == ENTITY ? entity : row }
    proof = {
      'batches' => [21318, 21319], 'new_occurrences' => 88, 'corrective_existing_keys' => CORRECTIVE_IDS,
      'untouched_overlapping_keys' => PRESERVED_IDS, 'new_entities' => 0,
      'original_entity' => original, 'updated_entity' => entity,
      'initial_glossary_sha256' => Digest::SHA256.hexdigest(initial_glossary),
      'initial_index_sha256' => Digest::SHA256.hexdigest(initial_index),
      'original_index_non_snapshot_sha256' => fingerprint(index.map { |row| projection.call(row) }),
      'verified' => 'All original index records retained; only seven accepted alias-span corrections append evidence, keeping prior evidence and status. All unrelated records and glossary entries preserved. Exactly 88 new keys, no duplicate entity or occurrence.'
    }
    File.write(PROOF, JSON.pretty_generate(proof) + "\n")
    puts proof['verified']
  end
end

SaturnynAliasD21318.run if $PROGRAM_NAME == __FILE__
