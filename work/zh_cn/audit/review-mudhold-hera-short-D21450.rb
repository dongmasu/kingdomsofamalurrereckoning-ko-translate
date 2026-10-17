#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module MudholdHeraShortD21450
  extend self
  M = ReviewedNameBatches
  D = 21_450
  CONFIG = {
    'place:mudhold-fasting' => {
      short: 'Mudhold', korean: '머드홀드', ids: %w[32340 40567 42007 52629],
      japanese: 'マッドホールド', chinese: '泥岩',
      note: 'English 52629 names Mudhold as Dead Kel and the wizard\'s crew-making cavern; full Mudhold Fasting at 35537/46024 identifies the same refuge. The two poems explicitly list Mudhold among the four named fastings; the map fragment quotes the source-local short inscription. Japanese マッドホールド and Chinese 泥岩 corroborate. Retain the literal short English form rather than expanding the name or altering other poem names.'
    },
    'person:hera-orhelm' => {
      short: 'Hera', korean: '헤라', ids: %w[20767],
      japanese: 'ヘラ', chinese: '赫拉',
      note: 'English 20767 directs the player to ask Hera or look just outside Whitestone about the local trouble. English 12725/28469/31636 identifies the living Whitestone Bone Wall keeper as Hera Orhelm, who recruits help against the local bandit families. Japanese ヘラ and Chinese 赫拉 corroborate the given name. The separate Hera Edithing is identified as deceased on the grave at 29222. This accepts only the local living Whitestone reference; do not add an absent surname or a global Hera alias.'
    }
  }.freeze

  def normalize(text, korean, short)
    text.gsub(/#{Regexp.escape(korean)}(?!\()/, "#{korean}(#{short})")
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    previous = index.to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    definitions = CONFIG.map do |entity, config|
      entry = glossary.find { |row| row['entity_key'] == entity }
      raise "missing existing entity #{entity}" unless entry
      entry.to_h.merge('english_aliases' => [entry['english_aliases'], config[:short]].reject(&:empty?).join('|'))
    end
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    missing = generated.reject { |row| previous.key?([row['entity_key'], *M.key(row)]) }
    other_hera_keys = [['base', '2430', '11'], ['default', '29222', ''], ['default', '60355', '']]
    homonyms = missing.select do |row|
      row['entity_key'] == 'person:hera-orhelm' &&
        inventory.fetch(M.key(row)).fetch('en_texts_json').include?('Hera Edithing')
    end
    raise 'distinct Hera Edithing scope changed' unless homonyms.map { |row| M.key(row) }.sort == other_hera_keys.sort
    missing -= homonyms
    expected = CONFIG.flat_map { |entity, config| config[:ids].map { |id| [entity, 'default', id, ''] } }
    raise 'row-scoped source coverage differs' unless
      missing.map { |row| [row['entity_key'], *M.key(row)] }.sort == expected.sort
    reviews = missing.sort_by { |row| row['ID_Linha'].to_i }.map do |occurrence|
      key = M.key(occurrence)
      entity = occurrence.fetch('entity_key')
      config = CONFIG.fetch(entity)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise 'short-name locale evidence differs' unless
        english.match?(/\b#{config[:short]}\b/) &&
        japanese.include?(config[:japanese]) && chinese.include?(config[:chinese])
      old = source.fetch('work_text')
      proposed = normalize(old, config[:korean], config[:short])
      raise 'non-idempotent short label' unless normalize(proposed, config[:korean], config[:short]) == proposed
      status = old == proposed ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => "#{config[:note]} Exact row-scoped short form only. All three resources were searched. Existing full-name, other-entity and historical global dispositions are unchanged; no global English alias is registered.",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: #{reviews.length} scoped keys; #{reviews.count { |row| row['old'] != row['new'] }} edits"
    [glossary, index, missing, reviews]
  end

  def apply
    glossary, index, missing, reviews = prepare
    proposal = File.join(__dir__, "proper-name-short-references-D#{D}.tsv")
    original = File.join(__dir__, "proper-name-short-reference-original-definitions-D#{D}.tsv")
    raise 'prepared outputs exist' if [proposal, original].any? { |path| File.exist?(path) }
    M.write_table(original, glossary.headers, glossary.select { |row| CONFIG.key?(row['entity_key']) }.map(&:to_h))
    M.write_table(proposal, M::HEADERS.take(12), reviews)
    updated = glossary.map(&:to_h).map do |row|
      config = CONFIG[row['entity_key']]
      next row unless config
      row.merge('notes' => "#{row['notes']} D-#{D}: #{config[:note]} Row-scoped only; no global alias.",
                'evidence_ids' => "#{row['evidence_ids']}|D-#{D}")
    end
    M.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers, updated)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + missing)
    M.run(proposal, D, 1)
    final = M.table(M::INDEX).to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    index.each do |row|
      raise 'prior decision changed' unless
        row.to_h.reject { |field, _| field == 'korean_current' } ==
          final.fetch([row['entity_key'], *M.key(row)]).reject { |field, _| field == 'korean_current' }
    end
    raise 'new scoped-key count differs' unless final.length == index.length + 5
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then MudholdHeraShortD21450.prepare
  when 'apply' then MudholdHeraShortD21450.apply
  else abort 'usage: review-mudhold-hera-short-D21450.rb [prepare|apply]'
  end
end
