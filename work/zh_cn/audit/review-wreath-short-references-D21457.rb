#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module WreathShortReferencesD21457
  extend self
  M = ReviewedNameBatches
  D = 21_457
  ENTITY = 'unique_item:wreath-of-absolution'
  SPECS = {
    '7265' => ['화관(Wreath)', '화관(Wreath)'],
    '18964' => ['화관', '화관(Wreath)'],
    '26481' => ['화관', '화관(Wreath)'],
    '36300' => ['화관', '화관(wreath)'],
    '38619' => ['화환', '화관(wreath)'],
    '40038' => ['화환', '화관(wreath)'],
    '44845' => ['화관', '화관(Wreath)'],
    '60137' => ['화관', '화관(Wreath)'],
    '61999' => ['화관', '화관(Wreath)'],
    '63113' => ['화환', '화관(Wreath)']
  }.freeze
  NOTE = 'English full-name rows 4616/6515 identify the Wreath of Absolution as Kollossae ceremonial regalia for atonement to Ethene, assembled from a circlet and pteryx vanes. These exact short-reference rows concern the same named regalia type: Cipher/atonement at 7265, Circlet of Arkes at 18964/63113, pteryx vanes at 26481/60137, ritual redemption at 61999, eyrie collection at 36300, and the construction/wearing explanations at 38619/40038/44845. Japanese 免赦の輪/花冠/輪 and Chinese 羽冠 corroborate. This links the named regalia type, not a claim that Arkes\' predecessor object and the newly assembled one are one physical instance. Reuse 화관, correcting inconsistent 화환 only in these scoped references. Keep source-local Wreath/wreath and do not register a global bare Wreath alias. Other entities, parts, narrative decisions and historical totals remain unchanged.'

  def normalize(text, id)
    old_span, new_span = SPECS.fetch(id)
    return text if old_span == new_span
    expected = %w[26481 40038].include?(id) ? 2 : 1
    raise 'Wreath Korean short span count changed' unless text.scan(old_span).length == expected
    if id == '40038'
      # The later Korean noun expands English "Its"; change its spelling only.
      text.sub(old_span, new_span).sub('화환', '화관')
    else
      text.gsub(old_span, new_span)
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    entry = glossary.find { |row| row['entity_key'] == ENTITY }
    raise 'Wreath full-name entry missing' unless entry
    temporary = entry.to_h.merge('english_aliases' => 'Wreath')
    generated = build_occurrences(inventory.values, [temporary]).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    previous = index.to_h { |row| [[row['entity_key'], *M.key(row)], row] }
    missing = generated.reject { |row| previous.key?([row['entity_key'], *M.key(row)]) }
    raise 'short Wreath source coverage differs' unless missing.map { |row| M.key(row) }.sort ==
      SPECS.keys.map { |id| ['default', id, ''] }.sort
    reviews = missing.sort_by { |row| row['ID_Linha'].to_i }.map do |row|
      key = M.key(row)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      proposed = normalize(old, key[1])
      raise 'Wreath locale evidence differs' unless english.match?(/\bwreath\b/i) &&
        japanese.match?(/免赦の輪|花冠|輪/) && chinese.include?('羽冠')
      status = old == proposed ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => NOTE, 'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: ten scoped short-reference keys; nine edits, one unchanged"
    [glossary, index, missing, reviews]
  end

  def apply
    glossary, index, missing, reviews = prepare
    proposal = File.join(__dir__, "proper-name-short-references-D#{D}.tsv")
    original = File.join(__dir__, "proper-name-short-reference-original-definitions-D#{D}.tsv")
    raise 'prepared outputs exist' if [proposal, original].any? { |path| File.exist?(path) }
    M.write_table(original, glossary.headers, glossary.select { |row| row['entity_key'] == ENTITY }.map(&:to_h))
    M.write_table(proposal, M::HEADERS.take(12), reviews)
    updated = glossary.map(&:to_h).map do |row|
      next row unless row['entity_key'] == ENTITY
      row.merge('notes' => "#{row['notes']} D-#{D}: #{NOTE}", 'evidence_ids' => "#{row['evidence_ids']}|D-#{D}")
    end
    M.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers, updated)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + missing)
    M.run(proposal, D, 1)
    final = M.table(M::INDEX).to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    index.each do |row|
      raise 'previous Wreath-run decision changed' unless
        row.to_h.reject { |field, _| field == 'korean_current' } ==
          final.fetch([row['entity_key'], *M.key(row)]).reject { |field, _| field == 'korean_current' }
    end
    raise 'short Wreath occurrence count differs' unless final.length == index.length + 10
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then WreathShortReferencesD21457.prepare
  when 'apply' then WreathShortReferencesD21457.apply
  else abort 'usage: review-wreath-short-references-D21457.rb [prepare|apply]'
  end
end
