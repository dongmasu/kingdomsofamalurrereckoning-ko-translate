#!/usr/bin/env ruby

require 'digest'
require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'

module ReviewIvanExistingScoutD21851
  extend self

  M = ReviewedNameBatches
  D = 21_851
  SCOUT = '/private/tmp/proper-name-unregistered-person-scout-D21851-offset100.tsv'
  SCOUT_SHA256 = 'da97b86ae76dc0149f28893f6c6348fb04cd9b47e6651173c75ed88c93f6ff39'
  ENTITY = 'person:hugues'
  LINKED_IDS = %w[6710 7051 12565 18069 23464 27918 32696 39675].freeze
  IDENTITY_HOLD = '22101'
  SEPARATE_LABEL = '40911'
  DISPOSITION_PATH = File.join(__dir__, 'proper-name-scout-dispositions-D21851.tsv')
  DISPOSITION_HEADERS = %w[
    candidate rank resource ID_Linha disposition scope evidence english japanese
    chinese korean
  ].freeze

  EVIDENCE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English-led cross-reference review of the existing Ivan scout group.
    These eight short Ivan references belong to the same account of the
    attack, Ivan's death, and Goyen Reen's responsibility: default:5657
    identifies Ivan as Goyen's old friend, default:27918 names Reen as
    responsible for Ivan's death, and default:7051 links killing Reen to
    Ivan's death. The remaining accepted rows describe that same attack,
    Ivan's heroism, or the aftermath. Aligned Japanese アイヴァン and
    Chinese 伊凡 corroborate the short name. Reuse the established
    이반(Ivan) only in these exact keys; do not add Ivan as a global
    English alias or merge other Ivan labels without source context.
  TEXT

  CORRECTIONS = {
    '12565' => {
      'old' => '그럼... 끝났구나. 다행이야. 복수했다는 걸 알고 아이반(Ivan)도 평안히 쉴 수 있겠지.',
      'new' => '그럼... 끝났구나. 다행이야. 복수했다는 걸 알고 이반(Ivan)도 평안히 쉴 수 있겠지.'
    },
    '32696' => {
      'old' => '이반은 사람을 너무 쉽게 믿었어. 경솔한 실수였지. 그 정도면 파멸을 부를 수도 있다는 걸 알았어야 해.',
      'new' => '이반(Ivan)은 사람을 너무 쉽게 믿었어. 경솔한 실수였지. 그 정도면 파멸을 부를 수도 있다는 걸 알았어야 해.'
    }
  }.freeze

  def read_scout
    raise 'existing scout checksum changed' unless Digest::SHA256.file(SCOUT).hexdigest == SCOUT_SHA256
    table = M.table(SCOUT)
    row = table.find { |candidate| candidate['english_candidate'] == 'Ivan' }
    raise 'existing Ivan scout row missing' unless row && row['rank'] == '142'
    ids = row.fetch('evidence_ids').split('|')
    raise 'Ivan scout source scope changed' unless ids.length == 37 && ids.include?('default:22101') &&
      ids.include?('default:40911')
    row
  end

  def source_keys(inventory, ids)
    ids.map do |id|
      matches = inventory.keys.select { |key| key[0] == 'default' && key[1] == id }
      raise "expected one default source key for #{id}" unless matches.length == 1
      matches.first
    end
  end

  def build_review(id, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
    raise "English Ivan source missing at #{id}" unless english.match?(/\bIvan\b/)
    raise "Japanese Ivan corroboration missing at #{id}" unless japanese.include?('アイヴァン')
    raise "Chinese Ivan corroboration missing at #{id}" unless source.fetch('zh_text').include?('伊凡')
    correction = CORRECTIONS[id]
    old = source.fetch('work_text')
    raise "stale Korean correction at #{id}" if correction && old != correction.fetch('old')
    new_text = correction ? correction.fetch('new') : old
    status = old == new_text ? 'not-an-issue' : 'accepted'
    {
      'resource' => 'default', 'ID_Linha' => id, 'Tipo_Variante' => '',
      'entity_key' => ENTITY, 'status' => status,
      'old' => old, 'new' => new_text, 'evidence' => EVIDENCE,
      'english' => english, 'japanese' => japanese, 'chinese' => source.fetch('zh_text'),
      'entity_dispositions_json' => JSON.generate(ENTITY => status)
    }
  end

  def build_unindexed_occurrence(id, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n")
    {
      'entity_key' => ENTITY, 'resource' => 'default', 'ID_Linha' => id,
      'Tipo_Variante' => '', 'matched_english' => 'Ivan',
      'english_source' => english, 'korean_current' => source.fetch('work_text'),
      'status' => 'needs-context',
      'evidence' => 'D-21851 existing-scout short-reference review; confirm English story linkage.'
    }
  end

  def candidate_dispositions(source_by_id)
    [
      ['Ivan', '142', 'default', IDENTITY_HOLD, 'uncertain', ENTITY,
       'The isolated instruction “Give Ivan my best” supplies no source context linking Ivan to Ivan Hugues. The current 이반(Ivan) rendering is already correct; do not register a global short-name alias.',
       source_by_id.fetch(IDENTITY_HOLD)],
      ['Ivan', '142', 'default', SEPARATE_LABEL, 'excluded', ENTITY,
       '“Ivan the Invincible” is listed as a gladiator sobriquet alongside The Dragon and Lotus Killer. Exclude this occurrence from Ivan Hugues; identity and the separate sobriquet scope are not inferred here.',
       source_by_id.fetch(SEPARATE_LABEL)]
    ].map do |candidate, rank, resource, id, disposition, scope, evidence, source|
      [
        candidate, rank, resource, id, disposition, scope, evidence,
        JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        source.fetch('zh_text'), source.fetch('work_text')
      ]
    end
  end

  def update_glossary!(glossary, ids)
    row = glossary.find { |entry| entry['entity_key'] == ENTITY }
    raise 'existing Hugues glossary entity missing' unless row
    raise 'unexpected global Ivan alias' if row['english_aliases'].to_s.split('|').include?('Ivan')
    additions = ['D-21851'] + ids.map { |id| "default:#{id}" }
    existing = row['evidence_ids'].to_s.split('|')
    note = 'D-21851 adds only the eight context-linked short Ivan row references in this batch; Ivan is not a global English alias. The isolated default:22101 identity remains uncertain, and default:40911 is excluded from this Hugues scope.'
    if existing.include?('D-21851')
      raise 'partial D-21851 glossary evidence' unless additions.all? { |value| existing.include?(value) } &&
        row['notes'].to_s.end_with?(note)
    else
      row['evidence_ids'] = (existing + additions).uniq.join('|')
      row['notes'] = "#{row['notes']} #{note}"
    end
  end

  def run
    raise 'D-21851 artifacts already exist' if [
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    ].any? { |path| File.exist?(path) }
    if File.exist?(DISPOSITION_PATH)
      partial = M.table(DISPOSITION_PATH)
      raise 'unexpected existing scout disposition data' unless
        partial.headers == DISPOSITION_HEADERS && partial.empty?
    end

    scout = read_scout
    inventory = M.refresh_inventory
    ids = LINKED_IDS
    keys = source_keys(inventory, ids + [IDENTITY_HOLD, SEPARATE_LABEL])
    index_table = M.table(M::INDEX)
    index = index_table.map(&:to_h)
    indexed_keys = index.map { |row| [row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s] }.to_set
    candidate_ids = scout.fetch('evidence_ids').split('|').map { |entry| entry.split(':', 2).last }.to_set
    actual_unindexed_ids = candidate_ids.reject do |id|
      inventory.keys.any? do |key|
        key[0] == 'default' && key[1] == id && indexed_keys.include?([key[0], key[1], key[2].to_s])
      end
    end.to_set
    staged = index.select { |row| row['entity_key'] == ENTITY && LINKED_IDS.include?(row['ID_Linha']) }
    if staged.empty?
      raise "unexpected unindexed Ivan IDs: #{actual_unindexed_ids.to_a.sort.inspect}" unless
        actual_unindexed_ids == (LINKED_IDS + [IDENTITY_HOLD, SEPARATE_LABEL]).to_set
    else
      raise 'partial or conflicting staged occurrence rows' unless staged.length == LINKED_IDS.length &&
        staged.all? do |row|
          row['status'] == 'needs-context' &&
            row['evidence'] == 'D-21851 existing-scout short-reference review; confirm English story linkage.'
        end &&
        actual_unindexed_ids == [IDENTITY_HOLD, SEPARATE_LABEL].to_set
    end
    reviews = LINKED_IDS.map { |id| build_review(id, inventory.fetch(['default', id, ''])) }
    reviews.each do |review|
      raise 'correction manifest is not byte-editor safe' if
        review['old'] != review['new'] &&
          ProperNameCellEditor.prepare(
            File.binread(M.csv_path('default')), [review]
          ).nil?
    end
    new_occurrences = LINKED_IDS.map do |id|
      build_unindexed_occurrence(id, inventory.fetch(['default', id, '']))
    end
    glossary_table = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    update_glossary!(glossary, LINKED_IDS)
    dispositions = candidate_dispositions({
      IDENTITY_HOLD => inventory.fetch(['default', IDENTITY_HOLD, '']),
      SEPARATE_LABEL => inventory.fetch(['default', SEPARATE_LABEL, ''])
    })

    occurrence_keys = index.map do |row|
      [row['entity_key'], row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s]
    end
    raise 'existing occurrence index has duplicate rows' unless occurrence_keys.uniq.length == index.length
    if staged.empty?
      additions = new_occurrences.map do |row|
        [row['entity_key'], row['resource'], row['ID_Linha'], row['Tipo_Variante'].to_s]
      end
      raise 'duplicate occurrence rows' unless
        (occurrence_keys + additions).uniq.length == index.length + additions.length
    end
    M.write_table(M::INDEX, index_table.headers, index + new_occurrences) if staged.empty?
    M.write_table(File.join(__dir__, 'proper-name-glossary.tsv'), glossary_table.headers, glossary)
    disposition_rows = dispositions.map do |values|
      DISPOSITION_HEADERS.zip(values).to_h
    end
    M.write_table(DISPOSITION_PATH, DISPOSITION_HEADERS, disposition_rows)
    review_path = File.join(__dir__, "proper-name-edits-D#{D}.tsv")
    M.write_table(review_path, M::HEADERS, reviews)
    M.run(review_path, D, 1)
  end
end

ReviewIvanExistingScoutD21851.run if $PROGRAM_NAME == __FILE__
