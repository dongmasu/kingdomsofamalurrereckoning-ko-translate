#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-short-label-discovery-20261018'

module ShortLabelBatchD21689
  extend self

  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_689
  DEFINITIONS_PATH = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS_PATH = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  REFRESH_PATH = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")

  DEFINITIONS = [
    {
      'entity_key' => 'person:ambassador-keen',
      'english_canonical' => 'Ambassador Keen',
      'category' => 'person',
      'korean_canonical' => '킨 대사(Ambassador Keen)',
      'english_aliases' => '',
      'korean_variants' => '킨 대사|킨(Keen) 대사|킨 대사(Ambassador Keen)',
      'evidence_ids' => 'D-21689',
      'status' => 'confirmed',
      'notes' => 'English identifies the ambassador targeted in the Felltown assassination plot. Japanese キーン大使 and Chinese 基恩大使 corroborate. Register only this source-identified individual and title; do not merge with Cillian Keen or Cali Keen, and infer no personal given name.'
    },
    {
      'entity_key' => 'person:ambassador-kulder',
      'english_canonical' => 'Ambassador Kulder',
      'category' => 'person',
      'korean_canonical' => '쿨더 대사(Ambassador Kulder)',
      'english_aliases' => '',
      'korean_variants' => '쿨더 대사|컬더(Kulder)|대사 컬더(Kulder)|쿨더 대사(Ambassador Kulder)',
      'evidence_ids' => 'D-21689',
      'status' => 'confirmed',
      'notes' => 'English identifies the Almain ambassador; Japanese カルダー大使 and Chinese 库尔德大使 corroborate. Retain the source-established role/name only; do not infer a personal given name or other biography.'
    },
    {
      'entity_key' => 'item:ansilla-dolls',
      'english_canonical' => 'Ansilla Dolls',
      'category' => 'unique item',
      'korean_canonical' => '안실라 인형들(Ansilla Dolls)',
      'english_aliases' => 'Ansilla dolls',
      'korean_variants' => '안실라 인형들|앤실라 인형들|안실라(Ansilla) 인형|안실라(Ansilla)의 인형|안실라 인형(Ansilla dolls)',
      'evidence_ids' => 'D-21689',
      'status' => 'confirmed',
      'notes' => 'English describes the legendary five-doll antique collection organized by Lady Ansilla; Japanese アンシラの人形 and Chinese 安西拉玩偶 corroborate. Register only the named collection; preserve the separate House Ansilla, Lady Ansilla, and Castle Ansilla entities.'
    },
    {
      'entity_key' => 'event:blood-rite',
      'english_canonical' => 'Blood Rite',
      'category' => 'named event',
      'korean_canonical' => '피의 의식(Blood Rite)',
      'english_aliases' => '',
      'korean_variants' => '피의 의식|혈의 의식|혈맹 의식|혈맹의 의식|혈액 의식|피의 의식(Blood Rite)',
      'evidence_ids' => 'D-21689',
      'status' => 'confirmed',
      'notes' => 'English repeatedly identifies the Red Legion rite by the proper title Blood Rite and describes its two-lives-for-one rule and faction privilege. Japanese 血の儀式 and Chinese 鲜血仪式 corroborate the ritual. Standardize only exact source references; do not extend the name to generic blood rites or other ceremonies.'
    }
  ].freeze

  TRANSFORMS = {
    ['default', '5891', ''] => [['킨 대사', '킨 대사(Ambassador Keen)']],
    ['default', '12216', ''] => [['킨(Keen) 대사', '킨 대사(Ambassador Keen)']],
    ['default', '13810', ''] => [['킨 대사', '킨 대사(Ambassador Keen)']],
    ['default', '14922', ''] => [['킨 대사', '킨 대사(Ambassador Keen)']],
    ['default', '15098', ''] => [['킨 대사', '킨 대사(Ambassador Keen)']],
    ['default', '28758', ''] => [['킨(Keen) 대사', '킨 대사(Ambassador Keen)']],
    ['default', '39465', ''] => [['킨 대사', '킨 대사(Ambassador Keen)']],
    ['default', '43236', ''] => [['킨 대사', '킨 대사(Ambassador Keen)']],
    ['default', '48033', ''] => [['킨 대사', '킨 대사(Ambassador Keen)']],
    ['default', '48741', ''] => [['킨 대사', '킨 대사(Ambassador Keen)']],
    ['default', '17', ''] => [['컬더(Kulder)', '쿨더(Ambassador Kulder)']],
    ['default', '33632', ''] => [['쿨더 대사', '쿨더 대사(Ambassador Kulder)']],
    ['default', '43696', ''] => [['안실라 인형들', '안실라 인형들(Ansilla Dolls)']],
    ['default', '54527', ''] => [['앤실라 인형들', '안실라 인형들(Ansilla dolls)']],
    ['default', '61170', ''] => [['안실라(Ansilla) 인형', '안실라 인형(Ansilla dolls)']],
    ['default', '61887', ''] => [['안실라(Ansilla)의 인형', '안실라 인형(Ansilla dolls)']],
    ['default', '29084', ''] => [['피의 의식', '피의 의식(Blood Rite)']],
    ['default', '29618', ''] => [['혈의 의식', '피의 의식(Blood Rite)']],
    ['default', '32295', ''] => [['혈의 의식', '피의 의식(Blood Rite)']],
    ['default', '36317', ''] => [['혈맹 의식', '피의 의식(Blood Rite)']],
    ['default', '38885', ''] => [['혈맹의 의식', '피의 의식(Blood Rite)']],
    ['default', '40193', ''] => [['혈액 의식', '피의 의식(Blood Rite)']],
    ['default', '42110', ''] => [['혈액 의식', '피의 의식(Blood Rite)']],
    ['default', '47579', ''] => [['피의 의식', '피의 의식(Blood Rite)']]
  }.freeze

  EVIDENCE = {
    'person:ambassador-keen' => 'English identifies Ambassador Keen as the ambassador targeted in the Felltown assassination plot. Japanese キーン大使 and Chinese 基恩大使 corroborate. Use 킨 대사(Ambassador Keen) for this individual; do not merge with Cillian Keen or Cali Keen or infer a given name.',
    'person:ambassador-kulder' => 'English identifies Ambassador Kulder of the Almain. Japanese カルダー大使 and Chinese 库尔德大使 corroborate. Standardize the source-supported Korean label without inventing a given name or biography.',
    'item:ansilla-dolls' => 'English describes the legendary Ansilla Dolls as a collection of five antique toys; Japanese アンシラの人形 and Chinese 安西拉玩偶 corroborate. Use the established 안실라 stem and annotate only references to this collection.',
    'event:blood-rite' => 'English identifies the Red Legion Blood Rite and states its source-specific two-lives-for-one rule; Japanese 血の儀式 and Chinese 鲜血仪式 corroborate. Standardize only exact references to this named rite.'
  }.freeze

  EXPECTED_KEYS = {
    'person:ambassador-keen' => 13,
    'person:ambassador-kulder' => 3,
    'item:ansilla-dolls' => 5,
    'event:blood-rite' => 11
  }.freeze

  def key(row)
    M.key(row)
  end

  def transform(source_key, text)
    result = text.dup
    TRANSFORMS.fetch(source_key, []).each do |old, replacement|
      count = result.scan(old).length
      raise "expected one exact Korean span #{old.inspect} at #{source_key.inspect}, found #{count}" unless count == 1
      result.sub!(old, replacement)
    end
    result
  end

  def build_reviews(inventory)
    definitions_by_key = DEFINITIONS.to_h { |row| [row.fetch('entity_key'), row] }
    generated = build_occurrences(inventory.values, DEFINITIONS).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    grouped = generated.group_by { |row| [row.fetch('entity_key'), *key(row)] }
    counts = generated.group_by { |row| row.fetch('entity_key') }.transform_values(&:length)
    raise "source-key coverage differs: #{counts.inspect}" unless counts == EXPECTED_KEYS

    used_transforms = TRANSFORMS.keys.to_set
    generated_keys = generated.map { |row| key(row) }.to_set
    raise 'Korean transform has no aligned exact English source match' unless
      (used_transforms - generated_keys).empty?

    generated.map do |match|
      source_key = key(match)
      entity = match.fetch('entity_key')
      source = inventory.fetch(source_key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
      chinese = source.fetch('zh_text')
      old_text = source.fetch('work_text')
      new_text = transform(source_key, old_text)
      status = old_text == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => source_key[0],
        'ID_Linha' => source_key[1],
        'Tipo_Variante' => source_key[2],
        'entity_key' => entity,
        'status' => status,
        'old' => old_text,
        'new' => new_text,
        'evidence' => EVIDENCE.fetch(entity),
        'english' => english,
        'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(entity => status),
        'previous_status' => '{}',
        'previous_evidence' => '{}'
      }
    end.sort_by { |row| [row.fetch('resource'), row.fetch('ID_Linha').to_i, row.fetch('Tipo_Variante')] }
  end

  def short_label_refresh
    inventory = M.refresh_inventory
    glossary = M.table(R::GLOSSARY).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    rows = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    raise "unexpected fresh short-label count #{rows.length}" unless rows.length == 268
    M.write_table(REFRESH_PATH, ShortLabelDiscovery20261018::HEADERS, rows)
    rows
  end

  def append_audit_sections
    register = M::DOCS.fetch(3)
    readme = M::DOCS.fetch(2)
    sections = {
      register => <<~TEXT,

        ## D-#{D}: Short-Label Proper-Name Scope

        Reviewed 32 exact English source keys across affix/base/default for
        Ambassador Keen (13), Ambassador Kulder (3), Ansilla Dolls (5), and
        Blood Rite (11). English anchored each identity, item collection, and
        named rite; aligned Japanese and Chinese were checked as corroborating
        evidence. Registered four scoped glossary entries and added 32
        occurrence records (24 accepted Texto corrections and eight
        not-an-issue rows). Keen remains separate from Cillian Keen and Cali
        Keen; no given name was inferred. Ansilla Dolls remains separate from
        House Ansilla/Lady Ansilla/Castle Ansilla. Blood Rite applies only to
        the named Red Legion rite, not generic blood ceremonies.

        The 2026-10-18 short-label snapshot was stale: ten groups had already
        been resolved by D-21672, D-21674, and D-21676-D-21682; Bloodstone's
        default:20046 annotation was corrected in D-21688. The refreshed
        D-21689 candidate snapshot contains 268 bounded groups after this
        batch. Neither that count nor the indexed occurrence count is an
        exhaustive discovery remainder or completion percentage.
        Full proper-name discovery remains incomplete.
      TEXT
      readme => <<~TEXT

        ## D-#{D}: Short-Label Candidate Review

        Reviewed the four named scopes and all 32 exact source keys across
        affix/base/default. See `named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md`,
        `proper-name-edits-D#{D}.tsv`, and
        `proper-name-short-label-discovery-D#{D}.tsv`. The older
        `proper-name-short-label-discovery-20261018.tsv` is a dated snapshot,
        not a live queue: ten entries had already been resolved in D-21672,
        D-21674, and D-21676-D-21682, and Bloodstone received a focused
        D-21688 correction. The refreshed bounded snapshot has 268 candidate
        groups. Full discovery remains incomplete; the number is not a
        completion estimate.
      TEXT
    }
    sections.each do |path, section|
      current = File.read(path)
      heading = "## D-#{D}:"
      raise "D-#{D} audit section already exists in #{path}" if current.include?(heading)
      File.write(path, current + section)
    end
  end

  def run
    [DEFINITIONS_PATH, REVIEWS_PATH, REFRESH_PATH].each do |path|
      raise "D-#{D} output already exists: #{path}" if File.exist?(path)
    end

    inventory = M.refresh_inventory
    reviews = build_reviews(inventory)
    M.write_table(DEFINITIONS_PATH, DEFINITIONS.first.keys, DEFINITIONS)
    M.write_table(REVIEWS_PATH, M::HEADERS, reviews)
    R.run([DEFINITIONS_PATH, REVIEWS_PATH, D.to_s])

    refreshed = short_label_refresh
    old_count = M.table(File.join(__dir__, 'proper-name-short-label-discovery-20261018.tsv')).length
    raise "unexpected original snapshot count #{old_count}" unless old_count == 282

    report_path = File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    addendum_path = File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    report = File.read(report_path)
    report << <<~TEXT

      ## Source-Local Evidence

      - `Ambassador Keen` is the individual targeted by the Felltown assassination plot. All 13 exact source keys were checked; ten Korean labels were normalized to `킨 대사(Ambassador Keen)`. The other three already had an adequate bilingual form.
      - `Ambassador Kulder` is identified in English as an Almain ambassador. All three exact keys were checked; the standalone label and one existing sentence were normalized, while the remaining bilingual label was retained.
      - `Ansilla Dolls` is the named collection of five antique toys. All five exact keys were checked; four were normalized to the established 안실라 spelling and bilingual collection name. Lady Ansilla, House Ansilla, and Castle Ansilla remain separate.
      - `Blood Rite` is the Red Legion rite described as two lives for one. All eleven exact keys were checked; seven Korean variants were standardized as `피의 의식(Blood Rite)`. Existing paired rows were retained.

      The four entries add 32 scoped occurrence records: 24 accepted corrections and eight already-adequate rows. No prior row judgment or global translation tally was reopened or recounted. The official Korean manual files contain no direct entries for these terms. No PAK material was consulted.

      ## Candidate-Snapshot Reconciliation

      The earlier 282-group short-label snapshot predates D-21677-D-21682 and D-21688. Ten candidates were already resolved in those batches: Adarus Key, Aster Strongbox, Bag of Winds, Bloodstone, Breath of Abra, Breath of Arba, Brother Gamian, Concourse, Cowl of the Maiden, and Revival. This batch registers four further reviewed groups; the refreshed snapshot contains #{refreshed.length} candidate groups, all still requiring individual review. This bounded snapshot is not an exhaustive universe or completion percentage.
    TEXT
    File.write(report_path, report)

    addendum = File.read(addendum_path)
    addendum << <<~TEXT

      CSV changes are limited to the 24 reviewed name/rite spans in the
      manifest. The byte-identical pre-edit backups and inverse verification
      are recorded above. The refreshed candidate snapshot is
      `proper-name-short-label-discovery-D#{D}.tsv`; the earlier dated file is
      retained as a historical snapshot.
    TEXT
    File.write(addendum_path, addendum)

    append_audit_sections
    puts "D-#{D}: #{reviews.length} source keys; #{reviews.count { |r| r['status'] == 'accepted' }} edits; refreshed candidates=#{refreshed.length}."
  end
end

ShortLabelBatchD21689.run if $PROGRAM_NAME == __FILE__
