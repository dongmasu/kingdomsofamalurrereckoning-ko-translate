#!/usr/bin/env ruby

require 'json'
require 'set'
require_relative 'continue-proper-name-reviewed-batches'

module PrepareBrattiganTitleConsistencyD21852
  extend self

  M = ReviewedNameBatches
  D = 21_852
  ENTITY = 'person:rast-brattigan'
  REVIEW = File.join(__dir__, "proper-name-review-input-D#{D}.tsv")
  TARGETS = {
    ['default', '18642', ''] => {
      old: '브래티건(Brattigan) 선장',
      status: 'accepted',
      prior_status: 'not-an-issue',
      prior_batch: 'D-20732'
    },
    ['default', '42737', ''] => {
      old: '브래티건(Brattigan) 선장',
      status: 'accepted',
      prior_status: 'accepted',
      prior_batch: 'D-20736'
    }
  }.freeze
  NEW_TEXT = '브래티건 선장(Captain Brattigan)'
  ALIGNED = {
    english: 'Captain Brattigan',
    japanese: 'ブラティガン船長',
    chinese: '布拉提甘队长'
  }.freeze
  EVIDENCE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    Fresh cross-row consistency check: all eight other exact
    `Captain Brattigan` keys use the complete Korean display
    `브래티건 선장(Captain Brattigan)`, while these two standalone UI labels
    used `브래티건(Brattigan) 선장`. English, Japanese ブラティガン船長,
    and Chinese 布拉提甘队长 identify the same titled person. Pair the
    complete source-local title and name, preserving the established
    person:rast-brattigan identity and Korean spelling. This narrowly
    supersedes only the bilingual-display judgment at default:18642 and
    default:42737; no global alias, new entity, or other source row is added.
  TEXT

  def run
    raise "review input already exists: #{REVIEW}" if File.exist?(REVIEW)
    raise 'D-21852 is already recorded' if Dir.glob(
      File.join(__dir__, 'named-scope-review-D21852-*.md')
    ).any? || File.exist?(File.join(__dir__, 'proper-name-edits-D21852.tsv'))

    inventory = M.refresh_inventory
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    person = glossary.find { |row| row.fetch('entity_key') == ENTITY }
    raise "missing registered entity #{ENTITY}" unless person

    index = M.table(M::INDEX).map(&:to_h)
    reviews = TARGETS.map do |key, target|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact
      raise "unexpected English source at #{key.inspect}" unless english == [ALIGNED[:english]]
      raise "unexpected Japanese source at #{key.inspect}" unless japanese == [ALIGNED[:japanese]]
      raise "unexpected Chinese source at #{key.inspect}" unless source.fetch('zh_text') == ALIGNED[:chinese]
      raise "unexpected Korean source at #{key.inspect}" unless source.fetch('work_text') == target.fetch(:old)

      indexed = index.find do |row|
        row.fetch('entity_key') == ENTITY && M.key(row) == key
      end
      raise "missing existing indexed occurrence at #{key.inspect}" unless indexed
      raise "prior status differs at #{key.inspect}" unless indexed.fetch('status') == target.fetch(:prior_status)
      raise "prior evidence differs at #{key.inspect}" unless indexed.fetch('evidence').start_with?("#{target.fetch(:prior_batch)}:")
      raise "unexpected indexed English match at #{key.inspect}" unless indexed.fetch('matched_english') == 'Brattigan'

      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => target.fetch(:status),
        'old' => source.fetch('work_text'),
        'new' => NEW_TEXT,
        'evidence' => EVIDENCE,
        'english' => english.join("\n"),
        'japanese' => japanese.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => target.fetch(:status))
      }
    end

    other_ids = %w[15790 16701 17951 51360 52593 5581 6215 54370]
    other_ids.each do |id|
      source = inventory.fetch(['default', id, ''])
      raise "comparison row differs at default:#{id}" unless
        JSON.parse(source.fetch('en_texts_json')).compact.any? do |text|
          text.match?(/(?<![A-Za-z])Captain Brattigan(?![A-Za-z])/i)
        end &&
        source.fetch('work_text').include?(NEW_TEXT)
    end

    M.write_table(REVIEW, M::HEADERS, reviews)
    M.run(REVIEW, D, 1, review_states: %w[accepted not-an-issue])
    puts 'D-21852 prepared and applied: two targeted title-display corrections.'
  end
end

PrepareBrattiganTitleConsistencyD21852.run
