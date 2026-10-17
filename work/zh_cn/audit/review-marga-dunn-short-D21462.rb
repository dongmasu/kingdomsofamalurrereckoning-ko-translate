#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module MargaDunnShortD21462
  extend self
  M = ReviewedNameBatches
  D = 21_462
  CONFIG = {
    'person:sammoc' => {
      english: 'Marga', japanese: 'マーガ', chinese: /玛加|玛尔加|马尔加/,
      ids: %w[637 1969 9708 9737 14253 17022 19926 21348 29444 32547 34655 41407 48188 48361 51172 52492 55010 57455 61479 63349],
      note: 'English 23730/36606 explicitly identifies Marga Sammoc and her lover Oreyn Vilsar, including the staged antelope transformation, silver necklace and Jottun capture. All scoped Marga references concern this same storyline, with Japanese マーガ and Chinese 玛加/玛尔加/马尔加 corroboration. Reuse 마르가 from the existing full-name pairs; replace 마가 only in her name spans. person:sammoc is the existing historical entity handle for these full-name rows; preserve that handle and canonical metadata rather than creating a duplicate or inferring a new surname identity.'
    },
    'person:orwin' => {
      english: 'Dunn', japanese: 'ダン', chinese: /顿恩|邓恩/,
      ids: %w[345 5942 20985 22382 24908 32699 36415 38803 49906 50640 52166 54594],
      note: 'English 55234 explicitly says Dunn. Orwin Dunn.; 12742 identifies the Sparrows enemy in the Rathir Quays, and 52166 identifies the same Dunn and Talibor accusation. Japanese ダン and Chinese 顿恩/邓恩 corroborate the surname in the same murder/trap storyline. Pair only the locally written surname as 던(Dunn), never expand it to an absent full name. person:orwin is the existing historical handle for these full-name rows; preserve it and its canonical metadata.'
    }
  }.freeze
  EXISTING_ID = '23730'

  def normalize(entity, text, id)
    if entity == 'person:orwin'
      return text.gsub(/(?<![가-힣])던(?!\()/, '던(Dunn)')
    end
    return text.sub('이 사실을 마르가에게', '이 사실을 마르가(Marga)에게') if id == '637'
    return text.sub('마르가는', '마르가(Marga)는') if id == '52492'
    return text if id == '61479'
    marker = '__D21462_PROTECTED_FULL__'
    raise 'reserved marker collision' if text.include?(marker)
    full = '마르가 새목(Marga Sammoc)'
    text.gsub(full, marker).gsub(/(?:마르가|마가)(?!\()/, '마르가(Marga)').gsub(marker, full)
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    inventory = M.refresh_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    definitions = CONFIG.map do |entity, config|
      entry = glossary.find { |row| row['entity_key'] == entity }
      raise 'historical full-name entity handle missing' unless entry
      entry.to_h.merge('english_aliases' => config[:english])
    end
    generated = build_occurrences(inventory.values, definitions).map { |values| OCCURRENCE_HEADERS.zip(values).to_h }
    previous = index.to_h { |row| [[row['entity_key'], *M.key(row)], row] }
    missing = generated.reject { |row| previous.key?([row['entity_key'], *M.key(row)]) }
    expected = CONFIG.flat_map { |entity, config| config[:ids].map { |id| [entity, 'default', id, ''] } }
    raise 'Marga/Dunn short source coverage differs' unless missing.map { |row| [row['entity_key'], *M.key(row)] }.sort == expected.sort
    prior = previous.fetch(['person:sammoc', 'default', EXISTING_ID, ''])
    raise 'mixed full/short Marga prior decision changed' unless prior['status'] == 'accepted'
    targets = missing.map(&:to_h) + [prior.to_h]
    reviews = targets.sort_by { |row| row['ID_Linha'].to_i }.map do |row|
      key = M.key(row)
      entity = row.fetch('entity_key')
      config = CONFIG.fetch(entity)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      proposed = normalize(entity, old, key[1])
      raise 'Marga/Dunn cross-locale evidence differs' unless english.include?(config[:english]) &&
        japanese.include?(config[:japanese]) && chinese.match?(config[:chinese])
      raise 'Marga/Dunn transformation is not idempotent' unless normalize(entity, proposed, key[1]) == proposed
      english_count = english.scan(/\b#{config[:english]}\b/).length
      paired_count = proposed.scan(/\([^()]*\b#{config[:english]}\b[^()]*\)/).length
      raise 'explicit name mention coverage differs' unless paired_count == english_count
      status = old == proposed ? 'not-an-issue' : 'accepted'
      rationale = if key[1] == EXISTING_ID
                    ' Existing-key follow-up: the previous full-name judgment missed the later explicit Marga annotation. Supersede that annotation omission only; preserve the preceding full pair and prior status/evidence, adding no occurrence record.'
                  elsif %w[637 52492 61479].include?(key[1]) && entity == 'person:sammoc'
                    ' Preserve Korean name mentions that expand English her/She without inventing additional explicit English mentions; pair only source-written Marga references.'
                  else
                    ' Exact row-scoped short reference; no global Marga/Dunn alias.'
                  end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => "#{config[:note]}#{rationale} All other entity/key and historical global dispositions, spelling outside these names, tokens, particles and paragraphs remain unchanged.",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: #{reviews.length} rows, #{missing.length} new keys and one existing-key annotation follow-up; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} edits"
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
      row.merge('notes' => "#{row['notes']} D-#{D}: #{config[:note]} Exact short keys only; no new global alias.",
                'evidence_ids' => "#{row['evidence_ids']}|D-#{D}")
    end
    M.write_table(ReviewedProperNameDiscovery::GLOSSARY, glossary.headers, updated)
    M.write_table(M::INDEX, index.headers, index.map(&:to_h) + missing)
    M.run(proposal, D, 1, review_states: %w[needs-context accepted not-an-issue])
    final = M.table(M::INDEX).to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    index.each do |row|
      next if row['entity_key'] == 'person:sammoc' && M.key(row) == ['default', EXISTING_ID, '']
      raise 'unrelated Marga/Dunn-run disposition changed' unless
        row.to_h.reject { |field, _| field == 'korean_current' } ==
          final.fetch([row['entity_key'], *M.key(row)]).reject { |field, _| field == 'korean_current' }
    end
    raise 'Marga/Dunn occurrence count differs' unless final.length == index.length + 32
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then MargaDunnShortD21462.prepare
  when 'apply' then MargaDunnShortD21462.apply
  else abort 'usage: review-marga-dunn-short-D21462.rb [prepare|apply]'
  end
end
