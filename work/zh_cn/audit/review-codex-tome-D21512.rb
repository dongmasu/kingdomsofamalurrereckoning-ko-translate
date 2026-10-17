#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-proper-name-inventory'

module CodexTomeD21512
  extend self

  M = ReviewedNameBatches
  D = 21_512
  CODEX = 'unique_item:codex-of-destiny'
  TOME = 'named_work:tome-of-synthesis'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CODEX_IDS = %w[
    2659 5343 12526 13845 19649 21651 22481 27021 27116
    28273 28854 38305 40748 47271 48609 60407
  ].freeze
  TOME_IDS = %w[
    502 10931 12787 20956 24704 27932 29614 33025
    41780 42618 44485 52931 60531 61399
  ].freeze
  SHORT_REFERENCES = {
    [CODEX, 'default', '13845', ''] => {
      english: 'The Codex', korean_old: '그 서에는', korean_new: '그 서(Codex)에는'
    }
  }.freeze
  NAMES = {
    CODEX => {
      en: 'Codex of Destiny', ko: '운명의 서(Codex of Destiny)',
      category: 'unique item', ja: '宿命の書', zh: /(?:命运|天命)法典/,
      pattern: /(?<![가-힣])운명의 (?:코덱스|법전|서)(?:\(Codex of Destiny\))?+(?!\()/,
      variants: '운명의 서|운명의 법전|운명의 코덱스',
      evidence: 'base:2750:11|base:4625:11|default:12526|default:5343|default:60407',
      note: 'English default:12526/19649 describes the Codex of Destiny as the High King of the Fae wisdom given to the first Fateweavers; default:60407 distinguishes it from the surrounding Destiny Stone. Japanese 宿命の書 and Chinese 命运法典/天命法典 corroborate the complete named artifact. Reuse 운명의 서; do not infer that the rejected forgery at default:5343/48609 is the authentic object. At default:12526 adjust 법전은 to 서는. At default:13845, English The Codex is a same-row anaphoric short reference to this artifact; annotate only Korean 그 서에는 as 그 서(Codex)에는, with no separate key or global alias. At default:19649 preserve the final copular 지 in 서지, not part of the name.'
    },
    TOME => {
      en: 'Tome of Synthesis', ko: '합성의 서(Tome of Synthesis)',
      category: 'named work', ja: '合成の書', zh: /合成之书/,
      pattern: /(?<![가-힣])(?:합성의 서|합성 고서|종합의 서)(?:\(Tome of Synthesis\))?+(?!\()/,
      variants: '합성의 서|합성 고서|종합의 서',
      evidence: 'base:2949:11|default:12787|default:20956|default:33025',
      note: 'English default:12787 places the Tome of Synthesis among the oldest and most valuable books in the Forbidden Stacks; default:20956/24704 describes its Chaos-potion use. Japanese 合成の書 and Chinese 合成之书 corroborate the complete book title. Reuse 합성의 서, correcting 합성 고서 and 종합의 서. Both full mentions at default:33025 are paired independently; preserve all four-lock/four-shelf puzzle wording and the tutorial warnings and opaque tokens at default:20956.'
    }
  }.freeze
  COMMON = 'Only complete English names are registered; no broad Codex, Tome, Destiny or Synthesis alias. The single Codex short reference is annotated only in its source row and adds no key or global alias. English is primary and every aligned Japanese/Chinese row is corroborated. Change only exact Korean name spans and explicitly scoped local text, retaining existing bilingual annotations, quotations, markup, quantities, line breaks, forgery distinctions and all prior unrelated dispositions/evidence. No source changes, PAK evidence, rarity inference or historical translation recount.'
  DETAIL = <<~TEXT.chomp
    ### D-21512: Codex Of Destiny And Tome Of Synthesis

    Registered `unique_item:codex-of-destiny` as
    `운명의 서(Codex of Destiny)` and `named_work:tome-of-synthesis` as
    `합성의 서(Tome of Synthesis)`, without broad short aliases.
    Reviewed 33 distinct keys (3 base, 30 default; no affix):
    Codex 18 keys/18 mentions and Tome 15 keys/16 mentions, no overlap.
    Changed 22 cells (Codex 11, Tome 11); retained 11 already-valid cells.
    Japanese 宿命の書/合成の書 and Chinese 命运法典/天命法典/合成之书
    corroborate the complete names.

    Preserve the forgery distinction at default:5343/48609, the two
    Tome mentions and puzzle instructions at default:33025, and the
    tutorial markup, warnings and CRLFs at default:20956. Only the
    법전은 -> 서는 particle at default:12526 changes. The same-row short
    reference `The Codex` at default:13845 becomes `그 서(Codex)에는`,
    with no global alias or added key. The copular 지 at default:19649
    remains outside the name. Prior entity dispositions,
    evidence and historical translation totals are not recounted.
  TEXT

  def expected_pairs
    %w[2750 4625].map { |id| [CODEX, 'base', id, '11'] } +
      CODEX_IDS.map { |id| [CODEX, 'default', id, ''] } +
      [[TOME, 'base', '2949', '11']] +
      TOME_IDS.map { |id| [TOME, 'default', id, ''] }
  end

  def definitions(headers)
    NAMES.map do |entity, name|
      fields = {
        'entity_key' => entity, 'english_canonical' => name.fetch(:en),
        'category' => name.fetch(:category), 'korean_canonical' => name.fetch(:ko),
        'english_aliases' => '', 'korean_variants' => name.fetch(:variants),
        'evidence_ids' => "D-#{D}|#{name.fetch(:evidence)}",
        'status' => 'confirmed', 'notes' => "#{name.fetch(:note)} #{COMMON}"
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def load_inventory
    rows = M::RESOURCES.flat_map do |resource|
      locales = %w[en_us ja_jp zh_cn work].map do |locale|
        read_rows(inventory_paths(M::ROOT, locale, resource))
      end
      build_inventory(resource, *locales).map { |values| OUTPUT_HEADERS.zip(values).to_h }
    end
    raise 'incomplete aligned inventory' unless rows.length == 73_430
    raise 'duplicate aligned inventory key' unless rows.map { |row| M.key(row) }.uniq.length == rows.length

    rows.to_h { |row| [M.key(row), row] }
  end

  def validate_scope!(generated)
    actual = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Codex/Tome source scope differs' unless actual.sort == expected_pairs.sort
    raise 'Codex/Tome row overlap' unless generated.map { |row| M.key(row) }.uniq.length == 33
  end

  def review_source(source, entity)
    key = M.key(source)
    raise "unreviewed Codex/Tome key #{key.inspect}" unless expected_pairs.include?([entity, *key])

    name = NAMES.fetch(entity)
    mentions = entity == TOME && key == ['default', '33025', ''] ? 2 : 1
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    chinese = source.fetch('zh_text')
    en_pattern = /(?<![A-Za-z])#{Regexp.escape(name.fetch(:en))}(?![A-Za-z])/i
    raise "Codex/Tome English multiplicity differs #{key.inspect}" unless english.scan(en_pattern).length == mentions
    raise "Codex/Tome Japanese support differs #{key.inspect}" unless
      japanese.scan(name.fetch(:ja)).length == mentions
    raise "Codex/Tome Chinese support differs #{key.inspect}" unless
      chinese.scan(name.fetch(:zh)).length == mentions

    old = source.fetch('work_text')
    pattern = name.fetch(:pattern)
    raise "Codex/Tome Korean multiplicity differs #{key.inspect}" unless old.scan(pattern).length == mentions
    new_text = old
    if entity == CODEX && key == ['default', '12526', '']
      if old.include?('운명의 법전(Codex of Destiny)은')
        new_text = old.sub('운명의 법전(Codex of Destiny)은', "#{name.fetch(:ko)}는")
      else
        raise 'Codex particle context differs' unless old.include?("#{name.fetch(:ko)}는")
      end
    end
    new_text = new_text.gsub(pattern, name.fetch(:ko))
    if (short = SHORT_REFERENCES[[entity, *key]])
      raise 'Codex short-reference source context differs' unless
        english.scan(/(?<![A-Za-z])#{Regexp.escape(short.fetch(:english))}(?![A-Za-z])/).length == 1 &&
        japanese.include?('書には') && chinese.include?('法典中')
      old_count = old.scan(Regexp.new(Regexp.escape(short.fetch(:korean_old)))).length
      new_count = new_text.scan(Regexp.new(Regexp.escape(short.fetch(:korean_new)))).length
      raise 'Codex short-reference Korean context differs' unless old_count + new_count == 1
      new_text = new_text.sub(short.fetch(:korean_old), short.fetch(:korean_new))
    end
    raise "Codex/Tome final label count differs #{key.inspect}" unless
      new_text.scan(name.fetch(:ko)).length == mentions
    status = old == new_text ? 'not-an-issue' : 'accepted'
    {
      'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
      'entity_key' => entity, 'status' => status, 'old' => old, 'new' => new_text,
      'evidence' => "#{name.fetch(:note)} #{COMMON}", 'english' => english,
      'japanese' => japanese, 'chinese' => chinese,
      'entity_dispositions_json' => JSON.generate(entity => status)
    }
  end

  def preflight!(reviews, inventory)
    reviews.each do |row|
      raise "Codex/Tome active text differs #{M.key(row).inspect}" unless
        inventory.fetch(M.key(row)).fetch('work_text') == row.fetch('old')
    end
    reviews.select { |row| row.fetch('old') != row.fetch('new') }.group_by do |row|
      row.fetch('resource')
    end.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    defs = definitions(glossary.headers)
    inventory = load_inventory
    generated = build_occurrences(inventory.values, defs).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    validate_scope!(generated)
    reviews = generated.sort_by do |row|
      key = M.key(row)
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map { |row| review_source(inventory.fetch(M.key(row)), row.fetch('entity_key')) }
    counts = NAMES.keys.to_h do |entity|
      [entity, reviews.count { |row| row['entity_key'] == entity && row['old'] != row['new'] }]
    end
    raise 'Codex/Tome changed-cell counts differ' unless counts == { CODEX => 11, TOME => 11 }
    ReviewedProperNameDiscovery.validate!(
      defs, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    preflight!(reviews, inventory)
    puts "D-#{D}: 33 keys; 33 entity matches; 34 full-name mentions; " \
         '22 changed cells (Codex 11, Tome 11); 11 unchanged; prepare mode, no writes.'
    [glossary.headers, defs, reviews]
  end

  def apply
    headers, defs, reviews = prepare
    previous_glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h)
    previous = occurrence_snapshot
    marker = '<!-- current-proper-name-batch:end -->'
    M::DOCS.each do |path|
      raise "missing or duplicate checkpoint #{path}" unless File.read(path).scan(marker).length == 1
    end
    inventory = load_inventory
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    preflight!(reviews, inventory)
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    M.write_table(DEFINITIONS, headers, defs)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    current = occurrence_snapshot
    previous.each { |key, value| raise "prior occurrence changed #{key.inspect}" unless current[key] == value }
    raise 'Codex/Tome occurrence additions differ' unless
      (current.keys - previous.keys).sort == expected_pairs.sort
    raise 'prior glossary or new definitions changed' unless
      M.table(ReviewedProperNameDiscovery::GLOSSARY).map(&:to_h) == previous_glossary + defs
    active = load_inventory
    reviews.each do |row|
      raise "Codex/Tome postflight text differs #{M.key(row).inspect}" unless
        active.fetch(M.key(row)).fetch('work_text') == row.fetch('new')
    end
    M.table(M::INDEX).each do |row|
      next unless reviews.any? { |review| M.key(review) == M.key(row) }
      raise "occurrence current text differs #{M.key(row).inspect}" unless
        row.fetch('korean_current') == active.fetch(M.key(row)).fetch('work_text')
    end
    M::DOCS.each do |path|
      text = File.read(path)
      raise "missing or duplicate checkpoint #{path}" unless text.scan(marker).length == 1
      File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
    end
    %w[review edit-addendum].each do |kind|
      path = File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
      raise "missing batch report #{path}" unless File.file?(path)
      File.open(path, 'a') { |file| file.write("\n\n#{DETAIL}\n") }
    end
  end

  def occurrence_snapshot
    M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'], ['--prepare'] then CodexTomeD21512.prepare
  when ['apply'], ['--apply'] then CodexTomeD21512.apply
  else abort 'usage: review-codex-tome-D21512.rb [prepare|--apply]'
  end
end
