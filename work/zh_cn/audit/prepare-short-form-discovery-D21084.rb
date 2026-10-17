#!/usr/bin/env ruby

require 'json'
require_relative 'continue-proper-name-reviewed-batches'

module ShortFormDiscoveryD21084
  M = ReviewedNameBatches
  D = 21_084
  REVIEW_PATH = File.join(M::AUDIT, "proper-name-discovery-D#{D}.tsv")
  TRIAGE_PATH = File.join(M::AUDIT, "proper-name-discovery-scout-D#{D}.tsv")
  INDEX_HEADERS = %w[
    entity_key resource ID_Linha Tipo_Variante matched_english english_source
    korean_current status evidence
  ].freeze

  GROUPS = {
    'faction:scholia-arcana' => {
      term: 'Scholia',
      ids: %w[6162 16755 29110 31685 42870 46328 54028 56450 56941],
      evidence: 'English uses the row-local short form Scholia. The official Korean manual identifies Scholia Arcana as a faction (PDF p. 7); aligned Japanese and Chinese identify the same institution. Keep the exact short source form where Korean uses the short form, and retain the established full bilingual canonical name where Korean already expands it. No global Scholia alias is added.'
    },
    'place:shieldring-keep' => {
      term: 'Shieldring',
      ids: %w[2499 2881 3629 5216 7563 9576 10209 10933 33106 38310 40780 46186 56468 58558],
      evidence: 'English identifies Shieldring as the Warsworn stronghold/recruitment home; Japanese シールドリング corroborates it, and Chinese 盾环 is supporting evidence. English, Japanese, and Chinese context at default:10209/38310 explicitly associates the name with a keep/fortress. The manual identifies Warsworn (워스원, PDF p. 7) but does not supply a Shieldring spelling. Reuse place:shieldring-keep only on these row-scoped references; do not add a global Shieldring alias.'
    }
  }.freeze

  EDITS = {
    ['faction:scholia-arcana', '6162'] =>
      ['스콜리아의 진정한 중심', '스콜리아(Scholia)의 진정한 중심'],
    ['faction:scholia-arcana', '16755'] =>
      ['우리 스콜리아 아르카나가 살아가는 곳',
       '우리 스콜리아 아르카나(Scholia Arcana)가 살아가는 곳'],
    ['faction:scholia-arcana', '31685'] =>
      ['스콜리아의 고위 인사', '스콜리아(Scholia)의 고위 인사'],
    ['faction:scholia-arcana', '42870'] =>
      ['스콜리아는', '스콜리아(Scholia)는'],
    ['faction:scholia-arcana', '56941'] =>
      ['스콜리아에 들어갔어', '스콜리아(Scholia)에 들어갔어'],
    ['place:shieldring-keep', '3629'] =>
      ['방패 고리', '실드링(Shieldring)'],
    ['place:shieldring-keep', '9576'] =>
      ['실드링에서 왔지?', '실드링(Shieldring)에서 왔지?'],
    ['place:shieldring-keep', '10209'] =>
      ['이곳 실드링,', '이곳 실드링(Shieldring),'],
    ['place:shieldring-keep', '10933'] =>
      ['실드링 대장간', '실드링(Shieldring) 대장간'],
    ['place:shieldring-keep', '33106'] =>
      ['실드링이라고?', '실드링(Shieldring)이라고?'],
    ['place:shieldring-keep', '38310'] =>
      ['실드링 요새', '실드링(Shieldring) 요새'],
    ['place:shieldring-keep', '40780'] =>
      ['실드링에서 합류하고', '실드링(Shieldring)에서 합류하고'],
    ['place:shieldring-keep', '46186'] =>
      ['실드링이 세워진 뒤', '실드링(Shieldring)이 세워진 뒤'],
    ['place:shieldring-keep', '58558'] =>
      ['실드링에선 여기', '실드링(Shieldring)에선 여기']
  }.freeze

  TRIAGE = {
    'Senshir' => {
      id: '27686',
      status: 'not-an-issue',
      evidence: 'All four aligned locales contain only the isolated label Senshir; Korean already reads 센시르(Senshir). Do not infer that this label is the city Mel Senshir from the shared token alone; no correction or entity link is needed for this row.'
    },
    'Aglir' => {
      id: '9360',
      status: 'uncertain',
      evidence: 'All source locales provide only the isolated label Aglir and the Korean is 아글리르. The row supplies no category or context establishing whether this is the village Mel Aglir or another named entity. Leave unchanged and unregistered pending contextual evidence.'
    }
  }.freeze

  TRIAGE_HEADERS = %w[
    candidate resource ID_Linha status english japanese chinese korean evidence
  ].freeze

  module_function

  def exact_source_match?(row, term)
    english = JSON.parse(row.fetch('en_texts_json') || '[]').compact.join("\n---\n")
    english.match?(/(?<![A-Za-z])#{Regexp.escape(term)}(?![A-Za-z])/i)
  end

  def replace_once(text, pair, key)
    return text unless pair

    old, new_text = pair
    count = text.scan(Regexp.new(Regexp.escape(old))).length
    raise "expected one Korean target span at #{key.inspect}, got #{count}" unless count == 1

    text.sub(old, new_text)
  end

  def reviews(inventory)
    rows = GROUPS.flat_map do |entity, group|
      group.fetch(:ids).map do |id|
        key = ['default', id, '']
        source = inventory.fetch(key)
        raise "English short form missing at #{key.inspect}" unless
          exact_source_match?(source, group.fetch(:term))

        old = source.fetch('work_text')
        new_text = replace_once(old, EDITS[[entity, id]], [entity, *key])
        {
          'resource' => key[0],
          'ID_Linha' => key[1],
          'Tipo_Variante' => key[2],
          'entity_key' => entity,
          'status' => old == new_text ? 'not-an-issue' : 'accepted',
          'old' => old,
          'new' => new_text,
          'evidence' => group.fetch(:evidence),
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'),
          'entity_dispositions_json' => JSON.generate(entity => old == new_text ? 'not-an-issue' : 'accepted'),
          'previous_status' => '',
          'previous_evidence' => ''
        }
      end
    end
    rows.sort_by { |row| [row.fetch('entity_key'), row.fetch('ID_Linha').to_i] }
  end

  def triage_rows(inventory)
    TRIAGE.map do |candidate, details|
      source = inventory.fetch(['default', details.fetch(:id), ''])
      raise "candidate source mismatch at #{details.fetch(:id)}" unless
        exact_source_match?(source, candidate)

      {
        'candidate' => candidate,
        'resource' => 'default',
        'ID_Linha' => details.fetch(:id),
        'status' => details.fetch(:status),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'korean' => source.fetch('work_text'),
        'evidence' => details.fetch(:evidence)
      }
    end
  end

  def prepare_and_run
    M.command!('ruby', File.join(M::AUDIT, 'test-proper-name-short-forms-D21084.rb'))
    inventory = M.refresh_inventory
    review_rows = reviews(inventory)
    triage = triage_rows(inventory)
    raise 'unexpected reviewed row count' unless review_rows.length == 23
    raise 'unexpected edit/disposition counts' unless
      review_rows.group_by { |row| row.fetch('status') }.transform_values(&:length) ==
        { 'accepted' => 14, 'not-an-issue' => 9 }

    glossary = M.table(File.join(M::AUDIT, 'proper-name-glossary.tsv'))
      .to_h { |row| [row.fetch('entity_key'), row.to_h] }
    index = M.table(M::INDEX).map(&:to_h)
    indexed = index.to_h { |row| [[row.fetch('entity_key'), *M.key(row)], row.to_h] }
    review_rows.each do |review|
      entity = review.fetch('entity_key')
      raise "unregistered entity #{entity}" unless glossary.key?(entity)
      key = [entity, *M.key(review)]
      raise "review key is already indexed #{key.inspect}" if indexed.key?(key)
    end
    M.command!('ruby', File.join(M::AUDIT, 'verify-proper-name-batch-chain.rb'),
               '21080', '21083')
    new_occurrences = review_rows.map do |review|
      entity = review.fetch('entity_key')
      source = inventory.fetch(M.key(review))
      term = GROUPS.fetch(entity).fetch(:term)
      [
        entity, review.fetch('resource'), review.fetch('ID_Linha'),
        review.fetch('Tipo_Variante'), term,
        JSON.parse(source.fetch('en_texts_json')).compact.join("\n---\n"),
        source.fetch('work_text'), 'needs-context',
        "D-#{D} candidate: verify the row-scoped #{term} reference against the registered #{entity} entry."
      ]
    end
    index.concat(new_occurrences.map do |values|
      INDEX_HEADERS.zip(values).to_h
    end)
    M.write_table(M::INDEX, INDEX_HEADERS, index)
    M.write_table(REVIEW_PATH, M::HEADERS, review_rows)
    M.write_table(TRIAGE_PATH, TRIAGE_HEADERS, triage)
    M.run(REVIEW_PATH, D, nil)
  end
end

if $PROGRAM_NAME == __FILE__
  ShortFormDiscoveryD21084.prepare_and_run
end
