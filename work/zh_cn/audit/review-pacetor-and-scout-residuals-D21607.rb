#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewPacetorAndScoutResidualsD21607
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_607
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONTEXT = <<~TEXT.chomp
    English-led review of six previously unregistered source-attested names.
    Search all affix/base/default rows and retain exact aligned English,
    Japanese and Chinese cells per reviewed key. The official Korean manual
    extraction/reference has no direct entry for these names. Preserve
    unrelated names, meaning, particles, tokens and line breaks. Pair the
    first name occurrence per row; later occurrences retain the same Korean
    spelling without repeated English. No existing terminal entity/key is
    reclassified or recounted. Galataea already has a glossary owner and is
    not registered as a new person here; the source variant Galatea at
    default:34960 needs a separate existing-owner scope review.
    These are focused discovery counts, not global translation totals.
    Full discovery/residual validation remains incomplete. Release ZIP unchanged.
  TEXT
  SPECS = [
    {
      entity: 'person:pacetor', english: 'Pacetor', korean: '페이서터',
      category: 'person',
      ids: %w[2738 9444 14306 17712 17900 19168 22201 23332 26003 30485 32936 34825 34960 36007 48160 50603 52145 52163 64434],
      pattern: /(?:페이세터|페이서터|페이서|파세토르|파세터)(?:\(Pacetor\))?/,
      variants: '페이세터|페이서터|페이서|파세토르|파세터',
      note: 'Pacetor is the Kollossae mason named in the Idylla/wife/statue quest. Reuse the frequent existing paired 페이서터 spelling at 14306/17712/17900, rather than inventing a new pronunciation. Japanese ペイスター supports its initial sound; Chinese 佩斯托尔 corroborates the same person. Normalize the shorter label 페이서 at 22201 and the 파세터/파세토르/페이세터 variants. Do not alter Galataea or Warren here.'
    },
    {
      entity: 'monster:kurn', english: 'Kurn', korean: '컨',
      category: 'monster',
      ids: %w[2738 6268 22727 23332 31007 43006 49977 51586 52145 53635 54419 58466 63267],
      pattern: /(?:카른|커른|컨)(?:\(Kurn\))?/,
      variants: '컨|커른|카른',
      note: 'English explicitly identifies Kurn as the troll that killed Pacetor’s wife. Reuse the existing standalone 컨(Kurn) label at 22727 and the repeated paired 컨 form. Japanese カーン and Chinese 克恩 corroborate the name/identity but do not establish an official Korean pronunciation. Normalize 카른/커른 to this established label; preserve all quest states and unrelated dialogue wording.'
    },
    {
      entity: 'skill:echoes-of-fate', english: 'Echoes of Fate',
      korean: '운명의 메아리', category: 'skill',
      ids: %w[3765 10351 53019], pattern: /운명의 메아리/,
      variants: '운명의 메아리',
      note: 'English names the Archmage ability/summoned ally mechanic Echoes of Fate, not the Colet musical ensemble or a generic echo. Japanese エコーオブフェイト labels and Chinese 命运回响 support the ability labels; Japanese 10351 paraphrases the effect without its English name. Retain existing 운명의 메아리, annotate the first occurrence, and preserve the separate Fate Echo Ally wording. Keep source-local Of capitalization in the projectile label.'
    },
    {
      entity: 'place:hall-of-echoes', english: 'Hall of Echoes',
      korean: '메아리의 전당', category: 'place',
      keys: [['base', '4567', '11']], pattern: /메아리의 전당/,
      variants: '메아리의 전당',
      note: 'The exact base place label Hall of Echoes is corroborated by Japanese 残響の広間 and Chinese 回声大厅. Preserve existing 메아리의 전당 and add the complete English label. Do not infer its location, inhabitants or a relation to Echoes of Fate.'
    },
    {
      entity: 'place:twilight-garden', english: 'Twilight Garden',
      korean: '황혼의 정원', category: 'place',
      ids: %w[9264], pattern: /황혼의 정원/,
      variants: '황혼의 정원',
      note: 'The letter explicitly situates a named Twilight Garden in its Rathir recollection. Japanese 黄昏の庭 and Chinese 微光花园 corroborate a garden reference; English defines the name. Preserve existing 황혼의 정원 and add the English pair, without conflating it with Twilight Pass or altering the surrounding letter.'
    },
    {
      entity: 'organization:martial-masters', english: 'Martial Masters',
      korean: '무술 사범단', category: 'organization',
      ids: %w[3122], pattern: /무술 사범단\(Martial Masters\)/,
      variants: '무술 사범단',
      note: 'English describes Martial Masters as a warrior sect steeped in discipline and spiritual meditation. Japanese マーシャル・マスターズ and Chinese 武术大师们 support this group reference. The existing complete 무술 사범단(Martial Masters) annotation is already adequate; retain it. Do not merge ordinary masters or the Bolgan Masters into this sect.'
    }
  ].freeze

  def expected_keys(spec)
    spec.fetch(:keys) { spec.fetch(:ids).map { |id| ['default', id, ''] } }.sort
  end

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    definitions, generated_all = [], []
    by_key = {}
    SPECS.each do |spec|
      english, korean, entity = spec.values_at(:english, :korean, :entity)
      evidence = "#{CONTEXT}\n#{spec.fetch(:note)}"
      values = {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => spec.fetch(:category),
        'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '', 'korean_variants' => spec.fetch(:variants),
        'evidence_ids' => (["D-#{D}"] + expected_keys(spec).map { |key| key.reject(&:empty?).join(':') }).join('|'),
        'status' => 'confirmed', 'notes' => evidence
      }
      definition = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
      generated = build_occurrences(inventory.values, [definition]).map do |row|
        OCCURRENCE_HEADERS.zip(row).to_h
      end
      raise "unexpected source coverage #{english}" unless
        generated.map { |row| M.key(row) }.sort == expected_keys(spec)
      definitions << definition
      generated_all.concat(generated)
      generated.each do |match|
        key = M.key(match)
        source = inventory.fetch(key)
        row = by_key[key] ||= {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'old' => source.fetch('work_text'), 'new' => source.fetch('work_text'),
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'), 'dispositions' => {}, 'notes' => []
        }
        before = row.fetch('new')
        raise "missing reviewed Korean span #{entity} #{key.inspect}" unless before.match?(spec.fetch(:pattern))
        local_english = entity == 'skill:echoes-of-fate' && key[1] == '3765' ?
          'Echoes Of Fate' : english
        first = true
        after = before.gsub(spec.fetch(:pattern)) do
          value = first ? "#{korean}(#{local_english})" : korean
          first = false
          value
        end
        row['new'] = after
        row['dispositions'][entity] = before == after ? 'not-an-issue' : 'accepted'
        row['notes'] << evidence
      end
    end
    reviews = by_key.values.map do |row|
      dispositions = row.delete('dispositions')
      row['entity_key'] = dispositions.keys.join('|')
      row['status'] = row['old'] == row['new'] ? 'not-an-issue' : 'accepted'
      row['entity_dispositions_json'] = JSON.generate(dispositions)
      row['evidence'] = row.delete('notes').join("\n\n")
      row
    end.sort_by { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
    raise "expected 35 distinct keys, got #{reviews.length}" unless reviews.length == 35
    R.validate!(definitions, reviews, generated_all, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)),
                                  rows.select { |row| row['old'] != row['new'] })
    end
    puts "D-#{D}: #{definitions.length} entities, #{generated_all.length} entity/row matches, " \
         "#{reviews.length} distinct rows, #{reviews.count { |row| row['old'] != row['new'] }} edits; prepare only."
    reviews.each do |row|
      next if row['old'] == row['new']
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'old', 'new'))
    end
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewPacetorAndScoutResidualsD21607.prepare
  when ['apply'] then ReviewPacetorAndScoutResidualsD21607.apply
  else abort 'usage: review-pacetor-and-scout-residuals-D21607.rb [prepare|apply]'
  end
end
