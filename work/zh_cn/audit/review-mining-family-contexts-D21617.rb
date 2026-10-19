#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewMiningFamilyContextsD21617
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_617
  PATH = File.join(__dir__, "proper-name-scoped-review-D#{D}.tsv")
  CONTEXT = <<~TEXT.chomp
    English-led row-scoped continuation of the four mining families from
    default:32149. Search affix/base/default and compare the exact English,
    Japanese and Chinese cells. Explicit family, plural membership, land,
    collective action, inherited treasure and family-reputation contexts
    support the selected occurrences. Reuse the existing family owners and
    Korean stems, not new races or people. Japanese explicitly identifies
    the Skoria family in 3701/18909/39106/60387 and the Darkvari household
    in 23499/58119; other aligned references corroborate the named groups.
    Pair each selected family mention with its source-local English surname.
    At 39106 replace the racial-looking 스콜리아인 with membership of the
    established Skoria family; the lineage and profession remain unchanged.
    At 58119 retain the speaker's guess rather than asserting membership.
    At 62269 annotate both families without changing the English-led
    hostile relationship; Chinese reverses that idiom and is not followed.
    Generic outlaw/miner descriptors are not separate named individuals.
    Family-owned property does not imply a new place or item identity.
    No global surname alias is added. Existing person/place judgments and
    earlier terminal family keys remain intact and are not recounted.
    Bare labels, individual surnames and mine-short-form contexts are
    outside this scope. The two official Korean manual files were searched
    and provide no direct entry for these family names. Preserve all other
    names, statements, tokens and line endings. No PAK material is used.
    Full discovery/residual validation remains incomplete; release ZIP unchanged.
  TEXT
  # Each approved substitution belongs to an existing entity, in one exact row.
  TARGETS = {
    '321' => [['zungar', '준가르(Zungar)', '중가르 가문(Zungar)']],
    '2905' => [['zungar', '준가르(Zungar)의', '중가르 가문(Zungar)의']],
    '3701' => [['skoria', '스코리아(Skoria) 광산 가문의', '광산업을 하는 스코리아 가문(Skoria)의']],
    '7110' => [['skoria', '스코리아(Skoria)의', '스코리아 가문(Skoria)의']],
    '10442' => [['cynric', '신릭의', '신릭 가문(Cynric)의']],
    '18909' => [['skoria', '스코리아 땅이야', '스코리아 가문(Skoria) 땅이야']],
    '21063' => [['zungar', '중가르처럼', '중가르 가문(Zungar)처럼']],
    '22992' => [['darkvari', '다크바리(Darkvari)는', '다크바리 가문(Darkvari)은']],
    '23298' => [['cynric', '신릭(Cynric)', '신릭 가문(Cynric)']],
    '23499' => [['darkvari', '다크바리(Darkvari) 집안의', '다크바리 가문(Darkvari)의']],
    '27377' => [['darkvari', '다크바리(Darkvari)의 악명', '다크바리 가문(Darkvari)의 악명']],
    '30033' => [['skoria', '스코리아의 소유야', '스코리아 가문(Skoria)의 소유야']],
    '30533' => [['darkvari', '다크바리의 보물', '다크바리 가문(Darkvari)의 보물']],
    '30620' => [['darkvari', '다크바리(Darkvari)는', '다크바리 가문(Darkvari)은']],
    '36696' => [['skoria', '스코리아처럼', '스코리아 가문(Skoria) 사람처럼']],
    '36703' => [['zungar', '중가르 땅이다', '중가르 가문(Zungar) 땅이다']],
    '37740' => [['cynric', '시닉의 땅이다', '신릭 가문(Cynric)의 땅이다']],
    '37914' => [['zungar', '중가르 강철', '중가르 가문(Zungar)의 강철']],
    '38067' => [['zungar', '중가르 녀석들이', '중가르 가문(Zungar) 녀석들이']],
    '38986' => [['skoria', '스콜리아 광부', '스코리아 가문(Skoria) 광부']],
    '39106' => [['skoria', '스콜리아인이야', '스코리아 가문(Skoria) 사람이야']],
    '44875' => [['darkvari', '다크바리의 보물', '다크바리 가문(Darkvari)의 보물']],
    '45872' => [['darkvari', '다크바리 무법자', '다크바리 가문(Darkvari) 무법자']],
    '46371' => [['darkvari', '다크바리의 분노', '다크바리 가문(Darkvari)의 분노']],
    '49420' => [['skoria', '스코리아 남자들이', '스코리아 가문(Skoria) 남자들이']],
    '49927' => [['darkvari', '다크바리의 땅이다', '다크바리 가문(Darkvari)의 땅이다']],
    '55300' => [['darkvari', '다크바리(Darkvari)가 아니야', '다크바리 가문(Darkvari) 사람이 아니야']],
    '55752' => [['darkvari', '다크바리(Darkvari)의 보물', '다크바리 가문(Darkvari)의 보물']],
    '58119' => [['darkvari', '다크바리(Darkvari)겠지', '다크바리 가문(Darkvari) 사람이겠지']],
    '60387' => [['skoria', '스코리아(Skoria) 일당', '스코리아 가문(Skoria) 일당']],
    '60877' => [['darkvari', '다크바리(Darkvari)의 보물', '다크바리 가문(Darkvari)의 보물']],
    '62269' => [
      ['darkvari', '다크바리(Darkvari)와', '다크바리 가문(Darkvari)과'],
      ['zungar', '중가르(Zungar) 가문', '중가르 가문(Zungar)']
    ]
  }.freeze

  def prepare
    R.ensure_unused_batch!(D)
    raise 'scoped review already exists' if File.exist?(PATH)
    inventory = M.refresh_inventory
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    old_keys = index.map { |row| [row['entity_key'], *M.key(row)] }.to_set
    additions = []
    reviews = TARGETS.map do |id, substitutions|
      key = ['default', id, '']
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      revised = old.dup
      en = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      dispositions = {}
      substitutions.each do |suffix, from, to|
        entity = "family:#{suffix}"
        owner = glossary.find { |row| row['entity_key'] == entity }
        raise "missing confirmed family #{entity}" unless owner && owner['status'] == 'confirmed'
        raise "previously reviewed family key #{entity}/#{id}" if old_keys.include?([entity, *key])
        term = suffix.capitalize
        raise "missing source token #{term}/#{id}" unless en.match?(/\b#{term}\b/)
        raise "unexpected Korean span #{id}: #{from}" unless revised.scan(from).length == 1
        revised = revised.sub(from, to)
        additions << OCCURRENCE_HEADERS.zip([
          entity, *key, term,
          JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n"),
          old, 'needs-context', "Row-scoped family context; D-#{D} review manifest."
        ]).to_h
        dispositions[entity] = 'accepted'
      end
      {
        'resource' => key[0], 'ID_Linha' => id, 'Tipo_Variante' => '',
        'entity_key' => dispositions.keys.join('|'), 'status' => 'accepted',
        'old' => old, 'new' => revised, 'evidence' => CONTEXT,
        'english' => en,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end.sort_by { |row| row['ID_Linha'].to_i }
    raise 'unexpected scope size' unless reviews.length == 32 && additions.length == 33
    raise 'duplicate scoped occurrence' unless
      additions.map { |row| [row['entity_key'], *M.key(row)] }.uniq.length == additions.length
    R.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), reviews)
    puts "D-#{D}: #{reviews.length} rows, #{additions.length} new family occurrences; 32 Texto edits."
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'old', 'new')) }
    [glossary, index, additions, reviews]
  end

  def apply
    glossary, index, additions, reviews = prepare
    glossary.each do |entry|
      targets = additions.select { |row| row['entity_key'] == entry['entity_key'] }
      next if targets.empty?
      entry['evidence_ids'] = (entry['evidence_ids'].to_s.split('|') +
        ["D-#{D}"] + targets.map { |row| "default:#{row['ID_Linha']}" }).uniq.join('|')
      entry['notes'] = [entry['notes'], "D-#{D}: #{targets.length} further row-scoped family contexts; no global surname alias."].join("\n")
    end
    M.write_table(R::GLOSSARY, glossary.headers, glossary)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + additions)
    M.write_table(PATH, M::HEADERS.take(12), reviews)
    M.run(PATH, D, 1)
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewMiningFamilyContextsD21617.prepare
  when ['apply'] then ReviewMiningFamilyContextsD21617.apply
  else abort 'usage: review-mining-family-contexts-D21617.rb [prepare|apply]'
  end
end
