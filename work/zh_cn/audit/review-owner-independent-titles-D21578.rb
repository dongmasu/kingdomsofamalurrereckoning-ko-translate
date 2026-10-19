#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewOwnerIndependentTitlesD21578
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_578
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  DATA = [
    ['named work:notes-of-anker-edmure', 'Notes of Anker Edmure',
     '앵커 에드뮤어의 기록', 'named work',
     'English default:31080 names the complete work Notes of Anker Edmure; Japanese アンカー・エドミュアのメモ and Chinese 安科·艾德莫尔的笔记 corroborate. Retain the existing Korean title and pair it atomically. D-21070 explicitly excluded this standalone title from the person scope; do not reopen that disposition.'],
    ['named work:odis-notes', "Odi's Notes", '오디의 기록', 'named work',
     'English base:3475 names Odi\'s Notes; Japanese オディのメモ and Chinese 欧迪的笔记 corroborate. Default:3040 describes a historian named Odi, but this does not establish identity with Erion Odi or Edar Odi. Register the complete work independently of any owner-person identity.'],
    ['named work:odi-speaks', 'Odi Speaks', '오디의 이야기', 'named work',
     'English default:5215 is Odi Speaks (1480); Japanese オディの語り(1480年) and Chinese 奥迪的讲话（1480） corroborate a titled work with a year. Pair Odi Speaks and preserve the existing (1480) suffix exactly. Do not identify its author with a named Odi or merge it with Odi\'s Notes.'],
    ['named work:bedes-journal', "Bede's Journal", '비드의 일지', 'named work',
     'The identical English Bede\'s Journal occurs in base:4218 and default:28722/33408/53209, including two Read objectives. Japanese default consistently has ビードの日誌 and Chinese has 比德的日记; base instead has ベーデの日誌, a pronunciation discrepancy, not a different English title. Use existing default:53209 비드 for this title, correcting 베데/베드. Pair the complete title without asserting whether its owner is Bede Pengaras or Bede Edithing; that personal identity remains unresolved.'],
    ['place:odis-camp', "Odi's Camp", '오디의 야영지', 'place',
     'English default:52481 gives the complete place name Odi\'s Camp; Japanese オディのキャンプ and Chinese 欧迪的营地 corroborate. Retain the Korean place wording and pair the complete label. Do not infer the owner\'s full name from the label or introduce a global Odi person alias.']
  ].freeze
  CHANGES = {
    ['base', '3475', '11'] =>
      ['named work:odis-notes', '오디(Odi)의 기록', "오디의 기록(Odi's Notes)"],
    ['base', '4218', '11'] =>
      ['named work:bedes-journal', '베데(Bede)의 일지', "비드의 일지(Bede's Journal)"],
    ['default', '5215', ''] =>
      ['named work:odi-speaks', '오디의 이야기(1480)', '오디의 이야기(Odi Speaks)(1480)'],
    ['default', '28722', ''] =>
      ['named work:bedes-journal', '베드(Bede)의 일지 읽기', "비드의 일지(Bede's Journal) 읽기"],
    ['default', '31080', ''] =>
      ['named work:notes-of-anker-edmure', '앵커 에드뮤어의 기록',
       '앵커 에드뮤어의 기록(Notes of Anker Edmure)'],
    ['default', '33408', ''] =>
      ['named work:bedes-journal', '베데의 일지 읽기', "비드의 일지(Bede's Journal) 읽기"],
    ['default', '52481', ''] =>
      ['place:odis-camp', '오디(Odi)의 야영지', "오디의 야영지(Odi's Camp)"],
    ['default', '53209', ''] =>
      ['named work:bedes-journal', '비드(Bede)의 일지', "비드의 일지(Bede's Journal)"]
  }.freeze
  CONTEXT = <<~TEXT.chomp
    Review complete work/place labels independently of owner-person identity.
    Scan affix/base/default for all five English labels: eight distinct keys,
    two base and six default, with no affix hits. English defines the complete
    label; Japanese/Chinese corroborate, with the Bede pronunciation conflict
    explicitly recorded. The official Korean manual has no direct entry for
    these titles; its omission is not evidence against them. Register no short
    person alias and infer no family relationship or author identification.
    In particular, Odi and Bede owner-person identities left open at D-21577
    remain unresolved. Complete title annotations replace owner-only pairs
    without nested or redundant personal annotations. Preserve dates, actions,
    tokens, line breaks, all unrelated text and earlier entity dispositions.
    These working edits are not in the verified D-21569 release ZIP.
  TEXT

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    entities = DATA.map do |key, english, korean, category, notes|
      values = {
        'entity_key' => key, 'english_canonical' => english,
        'korean_canonical' => "#{korean}(#{english})", 'category' => category,
        'english_aliases' => '', 'korean_variants' => korean,
        'evidence_ids' => "D-#{D}", 'status' => 'confirmed',
        'notes' => "#{notes} #{CONTEXT}"
      }
      glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    end
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, entities).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = CHANGES.map { |key, change| [change.first, *key] }.sort
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }.sort
    raise "source coverage differs: #{actual.inspect}" unless actual == expected
    reviews = CHANGES.map do |key, (entity, old, updated)|
      source = inventory.fetch(key)
      raise "stale text #{key.inspect}" unless source.fetch('work_text') == old
      definition = entities.find { |row| row.fetch('entity_key') == entity }
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => 'accepted', 'old' => old, 'new' => updated,
        'evidence' => "#{definition.fetch('notes')}",
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => 'accepted')
      }
    end
    R.validate!(entities, reviews, generated, glossary.map(&:to_h),
                M.table(M::INDEX).map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row.fetch('resource') }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    puts "D-#{D}: #{entities.length} independent labels, #{reviews.length} keys/edits; prepare only."
    [glossary.headers, entities, reviews]
  end

  def apply
    headers, entities, reviews = prepare
    M.write_table(DEFINITIONS, headers, entities)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Complete Titles Without Inferred Owner Identities

      #{CONTEXT}
      Registered Notes of Anker Edmure, Odi's Notes, Odi Speaks,
      Bede's Journal and Odi's Camp as five independent complete labels.
      Corrected eight Texto cells; the Bede journal title now consistently
      uses 비드의 일지(Bede's Journal). Preserved the Odi Speaks (1480) year.
      The unknown full identities of the Odi/Bede owners remain unresolved;
      no prior person-name decision was reopened or counted again.
      Full proper-name discovery/residual validation remains incomplete.
    TEXT
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{detail}"))
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewOwnerIndependentTitlesD21578.prepare
  when ['apply'] then ReviewOwnerIndependentTitlesD21578.apply
  else abort 'usage: review-owner-independent-titles-D21578.rb [prepare|apply]'
  end
end
