#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module RepeatedPersonLabelsD21429
  extend self

  M = ReviewedNameBatches
  D = 21_429
  REVIEW = File.join(__dir__, "proper-name-corrective-review-D#{D}.tsv")
  RULES = {
    '3330' => {
      entities: ['person:arkes'],
      replacements: [['소중한 아르케스마저', '소중한 아르케스(Arkes)마저']]
    },
    '25915' => {
      entities: ['person:arkes'],
      replacements: [['소중한 아르케스마저', '소중한 아르케스(Arkes)마저']]
    },
    '51469' => {
      entities: ['person:eleanor-brea'],
      replacements: [
        ['마법사 브레아는', '마법사 브레아(Brea)는'],
        ['마법사 브레아만큼', '마법사 브레아(Brea)만큼'],
        ['엘리너(Eleanor Brea)에게서 배울 첫 번째', '엘리너(Eleanor)에게서 배울 첫 번째']
      ]
    },
    '60136' => {
      entities: %w[person:eleanor-brea person:elodan-bloodgood person:marus-torix],
      replacements: [
        ['토릭스와 블러드굿 두 스승', '토릭스(Torix)와 블러드굿(Bloodgood) 두 스승'],
        ['블러드굿 스승의', '블러드굿(Bloodgood) 스승의'],
        ['토릭스 스승의', '토릭스(Torix) 스승의'],
        ['브레아 여사의', '브레아(Brea) 여사의']
      ]
    }
  }.freeze
  NOTE = 'D-21429: Correct only missing later personal-name annotations in four already indexed rows. This explicitly supersedes the annotation omissions, not the established identities, spellings, semantic translations or full-name labels. English and aligned Japanese/Chinese identify the repeated Arkes and the same-row full/short Eleanor Brea, Elodan Bloodgood and Marus Torix. Retain all complete existing names; annotate local surnames as Brea, Bloodgood and Torix without registering global aliases. At default:51469 the source-short Eleanor requires Eleanor, not the prior full English Eleanor Brea, in that one partial Korean label. No new entity/occurrence or historical global translation count is added. The separate Anathon first-mention-only decisions and all held names are out of scope.'

  def transform(text, replacements)
    replacements.reduce(text) do |current, (old, replacement)|
      raise "missing/ambiguous correction span #{old}" unless current.scan(old).length == 1

      current.sub(old, replacement)
    end
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'prepared review exists' if File.exist?(REVIEW)
    inventory = M.refresh_inventory
    index = M.table(M::INDEX)
    indexed = index.to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    raise 'duplicate existing occurrence' unless indexed.length == index.length
    reviews = RULES.map do |id, rule|
      key = ['default', id, '']
      source = inventory.fetch(key)
      previous = rule.fetch(:entities).to_h do |entity|
        record = indexed.fetch([entity, *key])
        raise 'corrective target is held/unreviewed' unless %w[accepted not-an-issue].include?(record['status'])
        [entity, record.slice('status', 'evidence')]
      end
      old = source.fetch('work_text')
      proposed = transform(old, rule.fetch(:replacements))
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => rule.fetch(:entities).sort.join('|'), 'status' => 'accepted',
        'old' => old, 'new' => proposed,
        'evidence' => NOTE + ' Prior entity records retained: ' + JSON.generate(previous),
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(rule.fetch(:entities).to_h { |entity| [entity, 'accepted'] }),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    ProperNameCellEditor.prepare(File.binread(M.csv_path('default')), reviews)
    puts "Prepared D-#{D}: four corrective row keys, six existing entity/row records; zero new index keys."
    reviews.each { |row| puts JSON.generate(row.slice('ID_Linha', 'entity_key', 'old', 'new')) }
    [index, reviews]
  end

  def apply
    index, reviews = prepare
    glossary_path = File.join(__dir__, 'proper-name-glossary.tsv')
    original_glossary = File.binread(glossary_path)
    M.write_table(REVIEW, M::HEADERS, reviews)
    M.run(REVIEW, D, nil, review_states: %w[accepted not-an-issue])
    final = M.table(M::INDEX).to_h { |row| [[row['entity_key'], *M.key(row)], row.to_h] }
    affected = RULES.flat_map { |id, rule| rule[:entities].map { |entity| [entity, 'default', id, ''] } }
    projection = ->(row) { row.to_h.reject { |field, _| field == 'korean_current' } }
    index.each do |row|
      key = [row['entity_key'], *M.key(row)]
      current = final.fetch(key)
      if affected.include?(key)
        raise 'corrective history not retained' unless current['status'] == 'accepted' &&
          current['evidence'].include?(JSON.generate(row['evidence'])[1...-1])
      else
        raise 'unrelated occurrence changed' unless projection.call(row) == projection.call(current)
      end
    end
    raise 'occurrence keys changed' unless final.length == index.length
    raise 'glossary/global aliases changed' unless File.binread(glossary_path) == original_glossary
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then RepeatedPersonLabelsD21429.prepare
  when 'apply' then RepeatedPersonLabelsD21429.apply
  else abort 'usage: review-repeated-person-labels-D21429.rb [prepare|apply]'
  end
end
