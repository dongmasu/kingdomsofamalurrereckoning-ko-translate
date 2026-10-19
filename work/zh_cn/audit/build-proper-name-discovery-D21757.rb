#!/usr/bin/env ruby

require 'json'
require 'set'
require 'fileutils'
require_relative 'apply-reviewed-proper-name-discovery'
require_relative 'build-short-label-discovery-20261018'

module ProperNameDiscoveryD21757
  extend self
  M = ReviewedNameBatches
  D = 21_757
  DEFINITION_PATH = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  OUTPUT_PATH = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  DISPOSITION_PATH = File.join(__dir__, "proper-name-short-label-dispositions-D#{D}.tsv")
  SNAPSHOT_PATH = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
  REVIEW_HEADERS = %w[
    resource ID_Linha Tipo_Variante entity_key status old new evidence
    english japanese chinese entity_dispositions_json
  ].freeze
  DISPOSITION_HEADERS = %w[
    english_candidate disposition resource ID_Linha Tipo_Variante english
    japanese chinese korean evidence prior_index_dispositions_json
  ].freeze
  GROUPS = {
    'Hall of Accolades' => {
      'entity' => 'place:hall-of-accolades',
      'evidence' => 'English, Japanese 栄誉の大広間, and Chinese 荣誉殿堂 identify the Hall as a named location. Use 영예의 전당(Hall of Accolades). Preserve D-9231 at default:29381 as historical sentence-level not-an-issue; this batch adds only the separate proper-name classification.'
    },
    'Hallowed Tree' => {
      'entity' => 'place:hallowed-tree',
      'evidence' => 'English explicitly names the House of Sorrows beacon sapling Hallowed Tree; Japanese 聖なる木 and Chinese 圣树 corroborate. Use 성목(Hallowed Tree). Preserve D-3288 at default:11299 as a separate historical lore/rite uncertainty.'
    },
    'Hammer' => {
      'entity' => nil,
      'evidence' => 'English and Japanese use Hammer as a generic weapon class or common object, not an identified unique weapon. The official Korean manual lists Hammers as 해머; the active 망치 is a valid generic rendering. The one contextual source uses Hammer as a common object. Do not register a unique item or alter these translations.'
    },
    'Heart of the Sidhe' => {
      'entity' => 'place:heart-of-the-sidhe',
      'evidence' => 'English directs the player to stand at this named site and places a meditation pool within it; Japanese シーの中心 and Chinese 仙境之心 corroborate the location reading. Normalize to 시드의 심장(Heart of the Sidhe) without nested parentheses. Keep the separate lore:sidhe record at base:2119:11; D-17963 at default:61749 remains a broader historical uncertainty.'
    },
    'Heartstone' => {
      'entity' => 'item:heartstone',
      'evidence' => 'English identifies a ritual Heartstone given to the player and used to reflect affinity; Japanese ハートストーン and Chinese 心之石 corroborate. Register the item/class, not a unique one-of-a-kind object. Use 하트스톤(Heartstone). D-16940 at default:56130 remains a separate historical affinity uncertainty.'
    }
  }.freeze
  EDIT_SPANS = {
    ['base', '4634', '11'] => ['명예의 전당', '영예의 전당(Hall of Accolades)'],
    ['default', '8403', ''] => ['훈장 수여의 전당', '영예의 전당(Hall of Accolades)'],
    ['default', '20621', ''] => ['성목이여', '성목(Hallowed Tree)이여'],
    ['default', '25042', ''] => ['성스러운 나무여', '성목(Hallowed Tree)이여'],
    ['default', '33802', ''] => ['성스러운 나무라고', '성목(Hallowed Tree)이라고'],
    ['default', '52361', ''] => ['성목', '성목(Hallowed Tree)'],
    ['base', '2119', '11'] => ['시드(Sidhe)의 심장', '시드의 심장(Heart of the Sidhe)'],
    ['default', '7787', ''] => [
      '시드(Sidhe)의 심장(Heart of the Sidhe)',
      '시드의 심장(Heart of the Sidhe)'
    ],
    ['default', '34160', ''] => [
      '시드(Sidhe)의 심장에',
      '시드의 심장(Heart of the Sidhe)에'
    ],
    ['default', '45471', ''] => [
      '시드(Sidhe)의 심장부에',
      '시드의 심장(Heart of the Sidhe)에'
    ],
    ['default', '51226', ''] => [
      '시드(Sidhe)의 심장에',
      '시드의 심장(Heart of the Sidhe)에'
    ],
    ['default', '53541', ''] => [
      '시드(Sidhe)의 심장에',
      '시드의 심장(Heart of the Sidhe)에'
    ],
    ['default', '61749', ''] => [
      '시드(Sidhe)의 심장(Heart of the Sidhe)',
      '시드의 심장(Heart of the Sidhe)'
    ],
    ['base', '1434', '11'] => ['심장석', '하트스톤(Heartstone)'],
    ['default', '32644', ''] => [
      '이 하트스톤이',
      '이 하트스톤(Heartstone)이'
    ],
    ['default', '59607', ''] => [
      '심장석이',
      '하트스톤(Heartstone)이'
    ]
  }.freeze
  EXPECTED_GROUP_KEYS = {
    'Hall of Accolades' => 3,
    'Hallowed Tree' => 2,
    'Hammer' => 4,
    'Heart of the Sidhe' => 3,
    'Heartstone' => 2
  }.freeze
  EXPECTED_ENTITY_KEYS = {
    'place:hall-of-accolades' => [
      ['base', '4634', '11'], ['default', '8403', ''], ['default', '29381', '']
    ],
    'place:hallowed-tree' => [
      ['default', '11299', ''], ['default', '20621', ''],
      ['default', '25042', ''], ['default', '33802', ''], ['default', '52361', '']
    ],
    'place:heart-of-the-sidhe' => [
      ['base', '2119', '11'], ['default', '7787', ''], ['default', '34160', ''],
      ['default', '45471', ''], ['default', '51226', ''], ['default', '53541', ''],
      ['default', '61749', '']
    ],
    'item:heartstone' => [
      ['base', '1434', '11'], ['default', '32644', ''],
      ['default', '56130', ''], ['default', '59607', '']
    ]
  }.freeze

  def group_rows(snapshot)
    rows = M.table(snapshot).map(&:to_h).to_h do |row|
      [row.fetch('english_candidate'), row]
    end
    raise 'duplicate candidate group in snapshot' unless rows.length == M.table(snapshot).length
    rows
  end

  def source_keys(candidate)
    (
      JSON.parse(candidate.fetch('unpaired_label_keys_json')) +
      JSON.parse(candidate.fetch('paired_evidence_keys_json'))
    ).map { |key| key.map(&:to_s) }.uniq.sort_by do |key|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end
  end

  def write_or_verify(path, headers, rows)
    if File.exist?(path)
      return if M.table(path).map(&:to_h) == rows
      archive = path.sub(/\.tsv\z/, '-superseded-draft.tsv')
      raise "superseded D-21757 draft archive already exists: #{archive}" if File.exist?(archive)
      FileUtils.copy_file(path, archive)
      M.write_table(path, headers, rows)
    else
      M.write_table(path, headers, rows)
    end
  end

  def build
    raise 'D-21757 post-review snapshot already exists; preserve it' if File.exist?(SNAPSHOT_PATH)
    definitions = M.table(DEFINITION_PATH).map(&:to_h)
    raise 'unexpected D-21757 definition keys' unless
      definitions.map { |row| row.fetch('entity_key') }.sort == EXPECTED_ENTITY_KEYS.keys.sort
    inventory = M.refresh_inventory
    index = M.table(M::INDEX).map(&:to_h)
    candidates = group_rows(File.join(__dir__, 'proper-name-short-label-discovery-D21756.tsv'))
    group_keys = {}
    all_dispositions = []

    GROUPS.each do |term, spec|
      candidate = candidates.fetch(term) { raise "candidate missing: #{term}" }
      keys = source_keys(candidate)
      raise "unexpected #{term} candidate key count: #{keys.length}" unless
        keys.length == EXPECTED_GROUP_KEYS.fetch(term)
      group_keys[term] = keys
      keys.each do |key|
        source = inventory.fetch(key)
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
        korean = source.fetch('work_text')
        prior = index.select { |row| M.key(row) == key }.map do |row|
          [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
        end
        all_dispositions << {
          'english_candidate' => term,
          'disposition' => spec['entity'] ? 'pending' : 'not-an-issue',
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'english' => english, 'japanese' => japanese,
          'chinese' => source.fetch('zh_text'), 'korean' => korean,
          'evidence' => spec.fetch('evidence'),
          'prior_index_dispositions_json' => JSON.generate(prior)
        }
      end
    end

    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated.sort_by! do |row|
      key = M.key(row)
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2], row.fetch('entity_key')]
    end
    actual = generated.group_by { |row| row.fetch('entity_key') }.transform_values do |rows|
      rows.map { |row| M.key(row) }.sort_by { |key| [M::RESOURCES.index(key[0]), key[1].to_i, key[2]] }
    end
    raise "entity source scope differs: #{actual.inspect}" unless actual == EXPECTED_ENTITY_KEYS
    raise 'duplicate new-entity source row' unless generated.map { |row| M.key(row) }.uniq.length == generated.length

    reviews = generated.map do |hit|
      key = M.key(hit)
      entity = hit.fetch('entity_key')
      korean = hit.fetch('korean_current')
      span = EDIT_SPANS[key]
      if span
        old_span, new_span = span
        raise "expected one Korean name span at #{key.inspect}" unless korean.scan(old_span).length == 1
        new_text = korean.sub(old_span, new_span)
        status = 'accepted'
      else
        new_text = korean
        status = 'not-an-issue'
      end
      raise "unexpected empty edit at #{key.inspect}" if span && new_text == korean
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entity, 'status' => status, 'old' => korean,
        'new' => new_text, 'evidence' => GROUPS.fetch(
          definitions.find { |definition| definition.fetch('entity_key') == entity }
            .fetch('english_canonical')
        ).fetch('evidence'),
        'english' => JSON.parse(inventory.fetch(key).fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(inventory.fetch(key).fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => inventory.fetch(key).fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(entity => status)
      }
    end
    raise 'unexpected D-21757 edit count' unless reviews.count { |row| row['old'] != row['new'] } == 16
    raise 'candidate queue key count changed' unless group_keys.values.flatten(1).uniq.length == 14

    all_dispositions.each do |row|
      next unless row.fetch('disposition') == 'pending'
      key = [row.fetch('resource'), row.fetch('ID_Linha'), row.fetch('Tipo_Variante')]
      hit = reviews.find { |review| M.key(review) == key }
      raise "candidate row missing indexed entity match #{key.inspect}" unless hit
      row['disposition'] = hit.fetch('status')
    end
    reviewed_candidate_pairs = all_dispositions.map do |row|
      [row.fetch('english_candidate'), row.fetch('resource'), row.fetch('ID_Linha'), row.fetch('Tipo_Variante')]
    end.to_set
    generated.each do |hit|
      key = M.key(hit)
      definition = definitions.find { |row| row.fetch('entity_key') == hit.fetch('entity_key') }
      term = definition.fetch('english_canonical')
      pair = [term, *key]
      next if reviewed_candidate_pairs.include?(pair)
      source = inventory.fetch(key)
      prior = index.select { |row| M.key(row) == key }.map do |row|
        [row.fetch('entity_key'), row.fetch('status'), row.fetch('evidence')]
      end
      review = reviews.find { |row| row.fetch('entity_key') == hit.fetch('entity_key') && M.key(row) == key }
      all_dispositions << {
        'english_candidate' => term, 'disposition' => review.fetch('status'),
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'), 'korean' => source.fetch('work_text'),
        'evidence' => GROUPS.fetch(term).fetch('evidence'),
        'prior_index_dispositions_json' => JSON.generate(prior)
      }
    end
    raise 'unexpected complete candidate disposition count' unless all_dispositions.length == 23
    disposition_rows = all_dispositions.map do |row|
      raise 'pending candidate disposition was not resolved' if row.fetch('disposition') == 'pending'
      row
    end
    write_or_verify(OUTPUT_PATH, REVIEW_HEADERS, reviews)
    write_or_verify(DISPOSITION_PATH, DISPOSITION_HEADERS, disposition_rows)
    puts "Prepared #{reviews.length} indexed entity matches and #{disposition_rows.length} candidate-row dispositions."
    puts "Texto edits: #{reviews.count { |row| row['old'] != row['new'] }}."
  end

  def apply
    build
    ReviewedProperNameDiscovery.run([DEFINITION_PATH, OUTPUT_PATH, D.to_s])
    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    index = M.table(M::INDEX).map(&:to_h)
    candidates = ShortLabelDiscovery20261018.build(inventory.values, glossary, index)
    M.write_table(SNAPSHOT_PATH, ShortLabelDiscovery20261018::HEADERS, candidates)
    append_batch_notes(candidates.length)
    puts "Next bounded short-label snapshot: #{candidates.length} groups at #{SNAPSHOT_PATH}"
  end

  def append_batch_notes(next_count)
    section = <<~TEXT


      ## D-#{D}: Five Short-Label Candidates

      Reviewed all 23 distinct source keys across five candidate groups,
      including full-source checks beyond the bounded discovery snapshot.
      Registered four entities with 19 indexed source matches: Hall of
      Accolades as a place, Hallowed Tree as a named landmark, Heart of the
      Sidhe as a named site, and Heartstone as a named ritual item/class.
      Applied 16 exact Texto edits; three registered-name occurrences
      were already canonical. Hammer is generic weapon/common-object wording,
      not a unique named weapon, and its four rows remain unchanged.
      English anchors identity and meaning; aligned Japanese and Chinese
      corroborate. The manual's `Hammers` entry supports a generic weapon
      reading only. D-9231, D-3288, D-17963, and D-16940 remain historical
      sentence/lore/affinity dispositions and were not reopened or recounted.
      Existing `lore:sidhe` at base:2119:11 is preserved as a separate scope.
      Next: D-#{D + 1}; review the #{next_count}-group bounded snapshot
      `proper-name-short-label-discovery-D#{D}.tsv`. It is not exhaustive and
      does not represent an overall remaining-item count.
      Full proper-name discovery/residual validation remains incomplete.
      Exact evidence and prior index dispositions are in
      `proper-name-short-label-dispositions-D#{D}.tsv`; indexed name edits are
      in `proper-name-edits-D#{D}.tsv`.
    TEXT
    %w[README.md decision-register-20261009.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + section)
    end
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      File.write(path, File.read(path) + section)
    end
    M::DOCS.each do |path|
      text = File.read(path)
      text.sub!(
        /Next batch: D-#{D + 1};[^\n]*/,
        "Next batch: D-#{D + 1}; continue short-label review from `proper-name-short-label-discovery-D#{D}.tsv` (#{next_count} bounded groups; not exhaustive or a completion estimate)."
      )
      File.write(path, text)
    end
    %W[named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md
       named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      text = File.read(path)
      text.sub!(
        /Next batch: D-#{D + 1};[^\n]*/,
        "Next batch: D-#{D + 1}; continue short-label review from `proper-name-short-label-discovery-D#{D}.tsv` (#{next_count} bounded groups; not exhaustive or a completion estimate)."
      )
      File.write(path, text)
    end
  end
end

ProperNameDiscoveryD21757.apply if $PROGRAM_NAME == __FILE__
