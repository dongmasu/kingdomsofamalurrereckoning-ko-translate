#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'optparse'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'

module PaddyAliasD21076
  M = ReviewedNameBatches
  ENTITY = 'person:padrig-dower'
  START_D = 21076
  GLOSSARY = File.join(M::AUDIT, 'proper-name-glossary.tsv')
  REVIEW = '/private/tmp/proper-name-reviewed-paddy-D21076.tsv'
  ALIASES = ['Paddy', 'Paddy Dower'].freeze
  TERMINAL_IDS = %w[
    338 2271 4556 4675 12504 27852 31645 37989 39573 39866 40967
    43102 45773 47386 57473 59126 64678
  ].freeze
  PADDY_IDS = %w[
    859 1417 1853 1937 2061 2442 2816 3248 3274 3310 3469 4178
    5289 6191 6413 6739 7842 7955 8000 8746 9792 11813 11957
    11975 12052 12182 12504 12546 13099 14718 14752 15320 15580
    16002 17387 18922 19154 20660 20966 21098 21215 21659 21676
    21776 22078 22395 22466 22504 23041 23518 24339 26588 26695
    27146 27380 27456 27852 29217 30123 30883 31280 31384 31645
    32230 32862 32904 34111 35014 35148 35223 35238 35929 36199
    37099 37482 37855 38199 38411 38815 40005 40289 40485 40511
    40838 41271 42149 43240 43735 43823 44857 45202 46764 46810
    47305 47516 47542 48318 48828 48972 49533 49944 50850 51535
    52504 53393 54504 54566 55809 56534 56740 58438 58881 60841
    60844 61023 61959 61983 61988 62712 63784 63945 63963 64333 65048
  ].freeze
  EDIT_IDS = %w[
    1417 3274 6191 6413 8746 9792 12182 12546 14718 14752 15320
    15580 17387 18922 19154 20660 20966 21098 21215 22078 24339
    26588 26695 30123 30883 31280 31384 32230 32862 32904 34111
    35014 35148 35223 35238 35929 36199 37099 37482 37855 38199
    38411 38815 40005 40289 40485 40511 40838 41271 42149 43240
    43735 43823 44857 45202 46764 46810 47305 47516 47542 48318
    48828 48972 49533 49944 56534 56740 58438 58881 60844 61023
    63963 64333 65048
  ].freeze
  # Scope-local immutable evidence, not an unrelated whole-inventory snapshot.
  SOURCE_SHA = 'fe49905b45df605fe4090f7c844a9f5658efd7cb05138e96efb1198f055b8bd7'
  TERMINAL_SHA = '1e69801e48c9cd4ce7873a1e7de417771a0fc6a1e238f4836cd9025507c53bf8'
  NAME_SHA = '946e061981ac9533a81771695ac52edc56ec3dfc93fc6e099f2cc8719d651438'
  NAME = /(?<![가-힣A-Za-z])패디(?: 다워)?(?:\([^()\r\n]*\))?/
  OPAQUE = /\$[A-Za-z_가-힣][A-Za-z0-9_가-힣]*|\{[^}]*\}|<[^>]*>/
  TAIL = /\A(?:에게서|에게|한테|처럼|하고|라고도|라고는|라고|라는|라면|라서|야말로|만큼|으로|은|는|이|가|을|를|과|와|의|도|만|로|야|나)?(?:\z|[^가-힣A-Za-z])/
  NOTES = 'D-21076: default:12504 explicitly identifies Padrig Dower as Paddy; default:22395 uses Paddy Dower. Japanese パドリグ・ダワー/パディー/パディー・ダワー and Chinese 帕德里格·道尔/帕迪/帕迪道尔 corroborate this single Gravehal builder. Register Paddy and Paddy Dower as aliases of the existing person, never generic Dower. This supersedes the earlier row-scoped-only alias note for these two aliases only. Preserve 패드리그 다워(Padrig Dower); row-local aliases use 패디(Paddy) and 패디 다워(Paddy Dower). All 17 prior terminal dispositions/evidence are retained.'
  ROW_NOTES = {
    '22395' => 'Full alias Paddy Dower is supported in all three sources; retain the existing complete bilingual full name atomically.',
    '22504' => 'Myfa journal: the personal name in the third paragraph is already paired; preserve all paragraphs and other names.',
    '30123' => 'English names Paddy twice; Korean uses one explicit name and then a fluent implicit subject. Preserve that omission rather than inventing another label.',
    '40511' => 'English names Paddy once; Korean repeats the same referent naturally. Pair both existing Korean spans without deleting prose.',
    '21215' => 'Japanese describes planned tunnel restoration/material collection, unlike English/Chinese describing acquired materials. Identity agrees; leave this unrelated quest-state conflict unchanged.',
    '49944' => 'Chinese reverses the book-collection meaning; English/Japanese agree. Identity is unambiguous; do not revise the surrounding sentence in this name-only pass.',
    '63963' => 'Japanese omits the explicit personal name; English and Chinese name Paddy beside the player. Pair the existing Korean name only.',
    '47542' => 'Shipwreck journal: only the final paragraph names Paddy; preserve all ship headings, other entities and exact line-break sequences.',
    '41271' => 'Ollie work may overlap this cell. Preserve independent changes through guarded non-overlapping rebase; only Paddy spans belong to this review.',
    '65048' => 'Ollie work may overlap this cell. Preserve independent changes through guarded non-overlapping rebase; only Paddy spans belong to this review.'
  }.freeze

  module_function

  def keys(ids)
    ids.map { |id| ['default', id, ''] }.to_set
  end

  def sort_key(row)
    [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
     row['Tipo_Variante'].to_s]
  end

  def sha(value)
    Digest::SHA256.hexdigest(JSON.generate(value))
  end

  def texts(source)
    [JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
     JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
     source.fetch('zh_text')]
  end

  def append_terms(old, extra)
    (old.to_s.split('|').reject(&:empty?) + extra).uniq.join('|')
  end

  def updated_entity(glossary)
    raise 'duplicate glossary entity key' unless
      glossary.map { |row| row.fetch('entity_key') }.uniq.length == glossary.length
    entity = glossary.find { |row| row['entity_key'] == ENTITY }&.dup
    raise 'missing/changed confirmed Padrig Dower entity' unless entity &&
      entity['status'] == 'confirmed' && entity['category'] == 'person' &&
      entity['english_canonical'] == 'Padrig Dower' &&
      entity['korean_canonical'] == '패드리그 다워(Padrig Dower)'
    glossary.reject { |row| row['entity_key'] == ENTITY }.each do |row|
      owned = [row['english_canonical'], *row['english_aliases'].to_s.split('|')]
      raise "alias owned by #{row['entity_key']}" unless
        (owned.compact.map(&:downcase) & ALIASES.map(&:downcase)).empty?
    end
    entity['english_aliases'] = append_terms(entity['english_aliases'], ALIASES)
    raise 'generic Dower alias is forbidden' if
      entity['english_aliases'].split('|').any? { |term| term.casecmp?('Dower') }
    entity['korean_variants'] = append_terms(entity['korean_variants'], ['패디', '패디 다워'])
    entity['evidence_ids'] = append_terms(entity['evidence_ids'], ['D21076', 'default:12504', 'default:22395'])
    entity['notes'] = [entity['notes'], NOTES].reject(&:empty?).uniq.join(' ')
    entity
  end

  def missing_occurrences(generated, index)
    indexed = index.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'duplicate index entity/source key' unless indexed.uniq.length == indexed.length
    existing = indexed.to_set
    generated.reject { |row| existing.include?([row.fetch('entity_key'), *M.key(row)]) }
  end

  def terminal_guard!(index)
    old = index.select { |row| row['entity_key'] == ENTITY }.sort_by { |row| sort_key(row) }
    raise 'terminal entity scope changed; do not reopen it' unless
      old.map { |row| M.key(row) }.to_set == keys(TERMINAL_IDS) &&
      old.length == TERMINAL_IDS.length
    projection = old.map { |row| row.values_at('resource', 'ID_Linha', 'Tipo_Variante', 'status', 'evidence') }
    raise 'existing terminal status/evidence changed' unless sha(projection) == TERMINAL_SHA
  end

  def scope!(inventory, index, entity)
    terminal_guard!(index)
    generated = build_occurrences(inventory.values, [entity]).map do |row|
      OCCURRENCE_HEADERS.zip(row).to_h
    end
    expected = keys(PADDY_IDS) | keys(TERMINAL_IDS)
    raise 'generated source scope mismatch' unless generated.length == expected.length &&
      generated.map { |row| M.key(row) }.to_set == expected
    sources = generated.map { |row| inventory.fetch(M.key(row)) }.sort_by { |row| sort_key(row) }
    projection = sources.map do |row|
      row.values_at('resource', 'ID_Linha', 'Tipo_Variante', 'en_texts_json', 'ja_texts_json', 'zh_text')
    end
    raise 'aligned English/Japanese/Chinese source changed' unless sha(projection) == SOURCE_SHA
    paddy = sources.select { |row| texts(row).first.match?(/\bPaddy\b/i) }
    raise 'Paddy exact scope mismatch' unless paddy.map { |row| M.key(row) }.to_set == keys(PADDY_IDS)
    missing = missing_occurrences(generated, index).sort_by { |row| sort_key(row) }
    raise 'missing-key scope mismatch' unless missing.length == 121 &&
      missing.map { |row| M.key(row) }.to_set == keys(PADDY_IDS) - keys(TERMINAL_IDS)
    missing
  end

  def protected?(text, start)
    prefix = text[0...start]
    prefix.count('(') > prefix.count(')') ||
      text.to_enum(:scan, OPAQUE).any? do
        match = Regexp.last_match
        match.begin(0) <= start && start < match.end(0)
      end
  end

  def replace_names(old, english)
    return old unless english.match?(/(?<![A-Za-z])Paddy(?![A-Za-z])/)
    matches = old.to_enum(:scan, NAME).map { Regexp.last_match.dup }
    result = old.dup
    matches.reverse_each do |match|
      next if protected?(old, match.begin(0))
      raise 'unreviewed Korean compound tail' unless TAIL.match?(old[match.end(0)..])
      full = match[0].start_with?('패디 다워')
      label = full ? 'Paddy Dower' : 'Paddy'
      raise 'full alias unsupported by English' if full && !english.include?('Paddy Dower')
      annotation = match[0][/\(([^()]*)\)/, 1]
      raise "unsupported annotation #{annotation.inspect}" if annotation && annotation != label
      # Consume the whole supported full alias before considering short Paddy.
      result[match.begin(0)...match.end(0)] = full ? '패디 다워(Paddy Dower)' : '패디(Paddy)'
    end
    result
  end

  def invariant!(old, proposed)
    raise 'line breaks changed' unless old.scan(/\r\n|\r|\n/) == proposed.scan(/\r\n|\r|\n/)
    raise 'opaque spans changed' unless old.scan(OPAQUE) == proposed.scan(OPAQUE)
    raise 'format tokens changed' unless ProperNameCellEditor.tokens(old) == ProperNameCellEditor.tokens(proposed)
  end

  def name_guard!(rows)
    projection = rows.sort_by { |row| sort_key(row) }.map do |row|
      [row.fetch('ID_Linha'), row.fetch('old').scan(NAME)]
    end
    raise 'reviewed Korean name spans changed; focused re-review required' unless sha(projection) == NAME_SHA
  end

  def evidence(id)
    [NOTES, 'English is the anchor; complete aligned EN/JA/ZH are recorded in this row. This is a personal reference, not a title/opaque match. Preserve existing grammatical particles and all unrelated text.',
     ROW_NOTES[id]].compact.join(' ')
  end

  def prepare_rows(missing, inventory)
    rows = missing.map do |occurrence|
      source = inventory.fetch(M.key(occurrence))
      english, japanese, chinese = texts(source)
      raise 'missing aligned evidence' if [english, japanese, chinese].any? { |text| text.to_s.empty? }
      old = source.fetch('work_text')
      proposed = replace_names(old, english)
      invariant!(old, proposed)
      status = proposed == old ? 'not-an-issue' : 'accepted'
      expected = EDIT_IDS.include?(source['ID_Linha']) ? 'accepted' : 'not-an-issue'
      raise "unexpected disposition #{M.key(source).inspect}" unless status == expected
      {
        'resource' => source['resource'], 'ID_Linha' => source['ID_Linha'],
        'Tipo_Variante' => source['Tipo_Variante'].to_s, 'entity_key' => ENTITY,
        'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => evidence(source['ID_Linha']), 'english' => english,
        'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    name_guard!(rows)
    rows
  end

  def validate_reviews!(rows, missing, inventory)
    expected_keys = missing.map { |row| M.key(row) }.to_set
    raise 'manifest duplicate/missing/extra keys' unless rows.length == expected_keys.length &&
      rows.map { |row| M.key(row) }.to_set == expected_keys
    name_guard!(rows)
    rows.each do |row|
      source = inventory.fetch(M.key(row))
      expected_status = EDIT_IDS.include?(row['ID_Linha']) ? 'accepted' : 'not-an-issue'
      raise 'manifest entity/status/evidence changed' unless row['entity_key'] == ENTITY &&
        row['status'] == expected_status && row['evidence'] == evidence(row['ID_Linha']) &&
        JSON.parse(row.fetch('entity_dispositions_json')) == { ENTITY => expected_status } &&
        row['previous_status'].to_s.empty? && row['previous_evidence'].to_s.empty?
      raise 'manifest aligned evidence changed' unless
        row.values_at('english', 'japanese', 'chinese') == texts(source)
      invariant!(row.fetch('old'), row.fetch('new'))
      raise 'unreviewed replacement/nonaccepted edit' unless
        replace_names(row['old'], row['english']) == row['new'] &&
        (row['status'] == 'accepted' ? row['old'] != row['new'] : row['old'] == row['new'])
      current = source.fetch('work_text')
      rebased = M.rebase_review(row['old'], row['new'], current)
      raise 'rebased target differs from reviewed name-only transformation' unless
        replace_names(current, row['english']) == rebased
      invariant!(current, rebased)
      row['old'] = current
      row['new'] = rebased
      raise 'accepted target unexpectedly already applied' if row['status'] == 'accepted' && current == rebased
    end
    rows.sort_by! { |row| sort_key(row) }
  end

  def artifacts_guard!
    (START_D..START_D + 2).each do |d|
      paths = Dir.glob(File.join(M::AUDIT, "named-scope-*-D#{d}-*.md")) +
        Dir.glob(File.join(M::AUDIT, "proper-name-edits-D#{d}.tsv")) +
        Dir.glob(File.join(M::AUDIT, "proper-name-discovery*-D#{d}.tsv")) +
        Dir.glob("/private/tmp/ko-translate-backups/*/before-proper-name-D#{d}")
      raise "D-#{d} artifact collision: #{paths.join(', ')}" unless paths.empty?
    end
  end

  def byte_preflight!(rows)
    rows.group_by { |row| row.fetch('resource') }.each do |resource, group|
      bytes = File.binread(M.csv_path(resource))
      active = ProperNameCellEditor.parse(bytes).group_by do |row|
        [row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
      end
      group.each do |row|
        matches = active.fetch([row['ID_Linha'], row['Tipo_Variante']])
        raise 'stale/ambiguous active cell' unless matches.length == 1 && matches.first['Texto'] == row['old']
      end
      edits = group.select { |row| row['status'] == 'accepted' }
      ProperNameCellEditor.prepare(bytes, edits) unless edits.empty?
    end
  end

  def run(argv)
    options = { apply: false, review: REVIEW }
    parser = OptionParser.new do |opts|
      opts.banner = 'Usage: prepare-paddy-alias-D21076.rb [--review /private/tmp/FILE.tsv] [--apply]'
      opts.on('--apply') { options[:apply] = true }
      opts.on('--review PATH') { |path| options[:review] = path }
    end
    parser.parse!(argv)
    raise 'unexpected arguments' unless argv.empty?
    review_path = File.expand_path(options[:review])
    raise 'review must be a nonsymlink TSV directly under /private/tmp' unless
      File.dirname(review_path) == '/private/tmp' && review_path.end_with?('.tsv') &&
      !File.symlink?(review_path)
    raise 'review already exists; do not overwrite an independent review' if !options[:apply] && File.exist?(review_path)
    raise 'prepare and independently review the manifest first' if options[:apply] && !File.file?(review_path)
    glossary_bytes = File.binread(GLOSSARY)
    index_bytes = File.binread(M::INDEX)
    glossary_table = M.table(GLOSSARY)
    index_table = M.table(M::INDEX)
    glossary_headers = glossary_table.headers.dup
    index_headers = index_table.headers.dup
    glossary = glossary_table.map(&:to_h)
    index = index_table.map(&:to_h)
    entity = updated_entity(glossary)
    inventory = M.refresh_inventory
    active_hashes = M.hashes
    missing = scope!(inventory, index, entity)
    if options[:apply]
      review_table = M.table(review_path)
      raise 'nonstandard review headers' unless review_table.headers == M::HEADERS
      rows = review_table.map(&:to_h)
      validate_reviews!(rows, missing, inventory)
    else
      rows = prepare_rows(missing, inventory)
    end
    artifacts_guard!
    byte_preflight!(rows)
    raise 'glossary/index changed during preflight' unless
      File.binread(GLOSSARY) == glossary_bytes && File.binread(M::INDEX) == index_bytes
    raise 'active CSV changed during preflight' unless M.hashes == active_hashes
    unless options[:apply]
      M.write_table(review_path, M::HEADERS, rows)
      puts "Prepared #{rows.length} missing keys: #{rows.group_by { |row| row['status'] }.transform_values(&:length)}"
      puts "Review: #{review_path}; no glossary/index/CSV registration performed."
      return
    end

    # Only missing keys are appended; all fields of the 17 terminal records survive.
    pending = missing.map do |row|
      row.merge('evidence' => 'D-21076 Paddy alias extension: pending reviewed manifest; existing terminal keys excluded.')
    end
    merged = index + pending
    missing_occurrences([], merged) # Reject duplicate entity/source keys before registration.
    M.write_table(review_path, M::HEADERS, rows)
    M.write_table(GLOSSARY, glossary_headers, glossary.map { |row| row['entity_key'] == ENTITY ? entity : row })
    M.write_table(M::INDEX, index_headers, merged)
    M.run(review_path, START_D, nil)
    applied_index = M.table(M::INDEX).map(&:to_h)
    terminal = applied_index.select { |row| row['entity_key'] == ENTITY && TERMINAL_IDS.include?(row['ID_Linha']) }
    terminal_guard!(terminal)
    puts 'D-21076..D-21078 complete; original 17 terminal statuses/evidence preserved.'
  end
end

PaddyAliasD21076.run(ARGV) if $PROGRAM_NAME == __FILE__
