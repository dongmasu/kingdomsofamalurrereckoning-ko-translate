#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewSorcerySkillTreeD21796
  extend self

  M = ReviewedNameBatches
  D = 21_796
  INPUT = File.join(__dir__, 'proper-name-short-label-discovery-D21795.tsv')
  CANDIDATES = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  CANDIDATE_HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante
    english japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  ENTITY = 'skill:sorcery'
  REPLACEMENTS = {
    '3426' => [['마법 모두에서', '마법(Sorcery) 모두에서']],
    '4142' => [['마법', '마법(Sorcery)']],
    '4520' => [['마법 능력', '마법(Sorcery) 능력']],
    '5287' => [['마법 능력', '마법(Sorcery) 능력']],
    '7982' => [
      ['마법술(Sorcery)의 길은 마법사의 길입니다. 마법술은',
       '마법(Sorcery)의 길은 마법사의 길입니다. 마법은']
    ],
    '20540' => [['활성 마법 능력', '활성 마법(Sorcery) 능력']],
    '23521' => [['마법 능력', '마법(Sorcery) 능력']],
    '24216' => [['마법 능력', '마법(Sorcery) 능력']],
    '26885' => [['마법 보너스', '마법(Sorcery) 보너스']],
    '29216' => [['마법 능력은', '마법(Sorcery) 능력은']],
    '32144' => [['+1 마법 능력', '+1 마법(Sorcery) 능력']],
    '32495' => [['힘과 마법을 펼칩니다', '힘과 마법(Sorcery)을 펼칩니다']],
    '33690' => [['힘, 재주, 마법이라는', '힘, 재주, 마법(Sorcery)이라는']],
    '33991' => [['힘, 재주, 마법 계열', '힘, 재주, 마법(Sorcery) 계열']],
    '35397' => [['{*1마법}', '{*1마법(Sorcery)}']],
    '37072' => [['마법 ({1})', '마법(Sorcery) ({1})']],
    '43865' => [['마법 능력으로', '마법(Sorcery) 능력으로']],
    '45661' => [['마법 운명', '마법(Sorcery) 운명']],
    '45771' => [['마법', '마법(Sorcery)']],
    '47472' => [['마법 계열 능력', '마법(Sorcery) 계열 능력']],
    '47684' => [['마법 능력', '마법(Sorcery) 능력']],
    '23066' => [['{*1마법}', '{*1마법(Sorcery)}']],
    '48378' => [
      ['마법 능력은', '마법(Sorcery)은'],
      ['마법에 투자하면', '마법(Sorcery)에 투자하면']
    ],
    '60016' => [['{*1마법}', '{*1마법(Sorcery)}']],
    '51501' => [['마법 능력', '마법(Sorcery) 능력']],
    '53637' => [['마법은 캐릭터의', '마법(Sorcery)은 캐릭터의']],
    '55683' => [['마법 능력', '마법(Sorcery) 능력']],
    '65095' => [['마법', '마법(Sorcery)']]
  }.freeze
  EXCLUSIONS = {
    '2138' => 'Lowercase Almain sorcery is a generic subject, not the skill-tree label.',
    '2580' => 'Preserve the terminal D-19605 Finesse/Sorcery disposition without reopening it.',
    '5566' => 'Preserve the terminal D-1433 Might/Sorcery disposition without reopening it.',
    '6547' => 'Garments of Sorcery is a complete compound item label; do not nest the tree name.',
    '7776' => 'Lowercase sorcery is a generic description of the Nightblade arts.',
    '8510' => 'Sorcery-based Chakrams is a weapon-category modifier, not a tree label.',
    '17291' => 'Fae sorcery is a generic lore reference.',
    '19214' => 'Fae sorcery is a generic lore reference.',
    '19297' => 'Fae sorcery is a generic lore reference.',
    '19394' => 'Sword and sorcery is a generic literary expression.',
    '21182' => 'Lowercase sorcery describes a general arena combat role.',
    '31283' => 'Lowercase sorcery is a generic lore reference.',
    '31568' => 'Rare Sorcery Armor Surprise is a complete compound loot label.',
    '36411' => 'Unique Sorcery Armor Surprise is a complete compound loot label.',
    '39964' => 'Lowercase sorcery describes a general arena combat role.',
    '46988' => 'Sorcery-based Staff is a weapon-category modifier, not a tree label.',
    '47873' => 'Sorcery-based Sceptre is a weapon-category modifier, not a tree label.',
    '50816' => 'Fae sorcery is a generic lore reference.',
    '52589' => 'Lowercase sorcery means magic generally, not the named tree.',
    '54748' => 'Lowercase sorcery describes a general arena combat role.',
    '59745' => 'Lowercase sorcery means magic generally in the lesson text.',
    '60372' => 'Lowercase sorcery means magic generally in the story reference.'
  }.freeze
  SPECS = [{
    key: ENTITY,
    english: 'Sorcery',
    category: 'skill',
    korean: '마법(Sorcery)',
    aliases: '',
    variants: '마법술|마법 능력|마법 계열',
    count: 50,
    notes: 'The official Korean manual extraction, PDF page 5, explicitly labels the Ability Tree as 마법(Sorcery) and describes 마법 능력. English is the category/meaning anchor; aligned Japanese ソーサリー and Chinese 魔法 corroborate. Register the skill tree only where the source uses the formal gameplay category or its ability/stat descriptions. Generic magic/sorcery, complete compound item labels, and Sorcery-based weapon modifiers are excluded. Preserve the already-terminal D-19605 and D-1433 rows without changing their Korean cells or prior judgments.'
  }].freeze
  EDIT_EVIDENCE = 'Official Korean manual extraction PDF page 5 labels the Ability Tree `마법(Sorcery)` and describes `마법 능력`. English identifies formal tree/category uses; aligned Japanese and Chinese corroborate. Generic uses and compound item/weapon labels remain excluded. Existing terminal decisions are preserved.'

  def key(row)
    [row.fetch('resource'), row.fetch('ID_Linha'), row['Tipo_Variante'].to_s]
  end

  def source_term?(text)
    text.scan(/[A-Za-z]+/).any? { |token| token.casecmp('Sorcery').zero? }
  end

  def transform(spec, row_key, text, source)
    raise "Sorcery source term missing at #{row_key.inspect}" unless
      JSON.parse(source.fetch('en_texts_json')).compact.any? { |part| source_term?(part) }
    raise "unexpected resource for Sorcery #{row_key.inspect}" unless row_key[0] == 'default'

    replacements = REPLACEMENTS[row_key[1]]
    if replacements
      updated = text.dup
      replacements.each do |before, after|
        count = updated.scan(Regexp.new(Regexp.escape(before))).length
        raise "expected one Korean span at #{row_key.inspect}, got #{count}" unless count == 1
        updated = updated.sub(before, after)
      end
      [updated, false]
    else
      raise "unclassified Sorcery source row #{row_key.inspect}" unless
        EXCLUSIONS.key?(row_key[1])
      [text, true]
    end
  end

  def candidate_reviews(candidate_rows, inventory, index)
    candidate = candidate_rows.find { |row| row.fetch('english_candidate') == 'Sorcery' }
    raise 'Sorcery candidate missing from D-21795 snapshot' unless candidate
    memberships = (
      JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
      JSON.parse(candidate.fetch('paired_evidence_keys_json'))
    ).map { |parts| parts.map(&:to_s) }.uniq
    expected = [['default', '4142', ''], ['default', '45771', ''], ['default', '7982', '']]
    raise "Sorcery candidate membership changed: #{memberships.inspect}" unless
      memberships.to_set == expected.to_set

    memberships.map do |row_key|
      source = inventory.fetch(row_key)
      {
        'english_candidate' => 'Sorcery',
        'disposition' => 'accepted',
        'resource' => row_key[0], 'ID_Linha' => row_key[1], 'Tipo_Variante' => row_key[2],
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'), 'korean' => source.fetch('work_text'),
        'evidence' => "D-#{D}: #{EDIT_EVIDENCE}",
        'prior_index_dispositions_json' => JSON.generate(
          index.select { |entry| key(entry) == row_key }.map do |entry|
            [entry.fetch('entity_key'), entry.fetch('status'), entry.fetch('evidence')]
          end
        )
      }
    end
  end

  def refresh_candidate_checkpoint(candidate_rows)
    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    snapshot = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT, ShortLabelDiscovery20261018::HEADERS, snapshot)
    next_line = "Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{snapshot.length} bounded groups; first `#{snapshot.first&.fetch('english_candidate', 'none')}`; not exhaustive or a completion estimate)."
    candidate_line = "Short-label candidate memberships: #{candidate_rows.length} reviewed; 3 accepted and 0 already canonical. Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D#{D}.tsv`."
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    M::DOCS.each do |path|
      text = File.read(path)
      block = text.match(marker)&.[](0)
      raise "active checkpoint missing from #{path}" unless block
      updated = block.sub(/^Next batch:.*$/, next_line)
      updated = updated.sub(/^Next batch:.*\n/) { |line| "#{line}#{candidate_line}\n" }
      File.write(path, text.sub(marker, updated))
    end

    validation = M.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = M.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'proper-name residual validation failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0')
    note = <<~TEXT

      ## Refreshed Candidate Queue

      Rebuilt `proper-name-short-label-discovery-D#{D}.tsv` after registering
      the Sorcery skill tree. It contains #{snapshot.length} bounded groups and
      begins with `#{snapshot.first&.fetch('english_candidate', 'none')}`; it is
      not an exhaustive remainder or completion estimate.

      Validation: #{validation.strip}
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}
    TEXT
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |filename|
      File.open(File.join(__dir__, filename), 'a') { |file| file.write(note) }
    end
    [snapshot, validation, residual]
  end

  def run
    marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
    prior_block = File.read(M::DOCS.first)[marker]
    raise 'D-21795 is not the active checkpoint' unless
      prior_block&.include?('Latest verified proper-name batch: D-21795 ')
    raise 'checkpoint documents differ' unless
      M::DOCS.all? { |path| File.read(path)[marker] == prior_block }
    raise 'D-21796 outputs already exist' if [
      SNAPSHOT,
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    exact = inventory.values.select do |row|
      JSON.parse(row.fetch('en_texts_json')).compact.any? { |text| source_term?(text) }
    end
    raise "expected 50 exact Sorcery source rows, got #{exact.length}" unless exact.length == 50
    source_ids = exact.map { |row| row.fetch('ID_Linha') }.to_set
    raise 'formal and excluded source classifications do not cover all source hits' unless
      source_ids == (REPLACEMENTS.keys + EXCLUSIONS.keys).to_set
    previews = exact.map do |row|
      transform(SPECS.first, key(row), row.fetch('work_text'), row)
    end
    changed_count = exact.zip(previews).count do |row, (updated, excluded)|
      !excluded && updated != row.fetch('work_text')
    end
    raise 'formal row edit count differs from the reviewed map' unless
      changed_count == REPLACEMENTS.length
    exact.each do |row|
      raise "missing aligned Japanese source at #{key(row).inspect}" if
        JSON.parse(row.fetch('ja_texts_json')).compact.empty?
      raise "missing aligned Chinese source at #{key(row).inspect}" if row.fetch('zh_text').empty?
    end

    candidate_rows = candidate_reviews(
      M.table(INPUT).map(&:to_h), inventory, M.table(M::INDEX).map(&:to_h)
    )
    if File.exist?(CANDIDATES)
      raise 'partial D-21796 candidate dispositions differ from reviewed source' unless
        M.table(CANDIDATES).map(&:to_h) == candidate_rows
    else
      M.write_table(CANDIDATES, CANDIDATE_HEADERS, candidate_rows)
    end
    ReviewedDiscoverySpecs.run(
      D, 'Sorcery Ability-Tree Terminology',
      SPECS,
      EDIT_EVIDENCE,
      '<!-- current-proper-name-batch:start -->'
    ) { |spec, row_key, text, source| transform(spec, row_key, text, source) }

    snapshot, validation, residual = refresh_candidate_checkpoint(candidate_rows)
    puts "D-#{D}: reviewed 50 exact Sorcery source rows; registered #{REPLACEMENTS.length} formal tree references and excluded #{EXCLUSIONS.length} generic/compound uses; corrected #{REPLACEMENTS.length} Texto cells; next candidates=#{snapshot.length}."
  end
end

ReviewSorcerySkillTreeD21796.run if $PROGRAM_NAME == __FILE__
