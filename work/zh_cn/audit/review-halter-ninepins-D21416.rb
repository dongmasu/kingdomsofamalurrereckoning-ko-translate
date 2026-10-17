#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module HalterNinepinsD21416
  extend self

  M = ReviewedNameBatches
  ENTITY = 'person:halter-ninepins'
  ENGLISH = 'Halter Ninepins'
  KOREAN_FULL = '할터 나인핀스(Halter Ninepins)'
  KOREAN_SHORT = '할터(Halter)'
  ENGLISH_PATTERN = /(?<![A-Za-z])(?:Halter\s+Ninepins|Halter)(?![A-Za-z])/i
  KOREAN_PATTERN = /(?:할터|홀터)(?:\s+나인핀스)?(?:\s*\(Halter(?:\s+Ninepins)?\))?/i

  def paths
    [
      File.join(__dir__, 'proper-name-discovery-definitions-D21416.tsv'),
      File.join(__dir__, 'proper-name-discovery-D21416.tsv')
    ]
  end

  def definition(glossary, scope)
    glossary.headers.to_h do |header|
      value = case header
              when 'entity_key' then ENTITY
              when 'english_canonical' then ENGLISH
              when 'category' then 'person'
              when 'korean_canonical' then KOREAN_FULL
              when 'english_aliases' then 'Halter'
              when 'korean_variants'
                '할터|홀터|할터(Halter)|할터 나인핀스|홀터 나인핀스|할터 나인핀스(Halter Ninepins)'
              when 'evidence_ids'
                (['D-21416'] + scope.map do |row|
                  M.key(row).reject(&:empty?).join(':')
                end).join('|')
              when 'status' then 'confirmed'
              when 'notes'
                'English explicitly names Halter Ninepins in the ballad, then uses Halter and twice prints Halt for the same speaker; the same row and aligned locales establish these as one named person, not the common command halt. Japanese ハルター・ナインピンズ/ハルター corroborates. Chinese varies between 哈尔特 and 霍尔特, so English is the spelling anchor. Use 할터 나인핀스(Halter Ninepins) and 할터(Halter). Do not register Halt as a global English alias because it is a common command; normalize only the two source-local same-person typos inside the ballad. Preserve all verse lines and punctuation.'
              end
      [header, value]
    end
  end

  def prepare!
    inventory = M.refresh_inventory
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    raise 'Halter Ninepins entity already exists' if
      glossary.any? { |row| row['entity_key'] == ENTITY }
    raise 'Halter Ninepins canonical already belongs to another entity' if
      glossary.any? do |row|
        ([row['english_canonical']] + row['english_aliases'].to_s.split('|'))
          .compact.any? { |term| term.casecmp?(ENGLISH) }
      end
    raise 'Halter Ninepins index keys already exist' if
      index.any? { |row| row['entity_key'] == ENTITY }

    scoped = inventory.values.select do |row|
      JSON.parse(row.fetch('en_texts_json') || '[]').compact.any? do |text|
        text.match?(ENGLISH_PATTERN)
      end
    end.sort_by do |row|
      [M::RESOURCES.index(row.fetch('resource')), row.fetch('ID_Linha').to_i,
       row['Tipo_Variante'].to_s]
    end
    keys = scoped.map { |row| M.key(row).reject(&:empty?).join(':') }
    expected = %w[default:58563 default:64599]
    raise 'Halter source scope changed' unless keys.sort == expected.sort

    reviews = scoped.map do |source|
      key = M.key(source)
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      old = source.fetch('work_text')
      matches = old.to_enum(:scan, KOREAN_PATTERN)
        .map { Regexp.last_match.dup }
      raise "missing Korean Halter name at #{key.inspect}" if matches.empty?
      raise "missing aligned source locale at #{key.inspect}" if
        [english, japanese, chinese].any?(&:empty?)

      new_text = old.dup
      matches.reverse_each do |match|
        replacement = match[0].include?('나인핀스') ? KOREAN_FULL : KOREAN_SHORT
        new_text[match.begin(0)...match.end(0)] = replacement
      end
      status = new_text == old ? 'not-an-issue' : 'accepted'
      evidence = if status == 'accepted'
                   "English identifies Halter Ninepins in the ballad and uses the short name Halter throughout; the two source spellings Halt occur in the same speaker's lines and are source-local typos. Japanese ハルター・ナインピンズ/ハルター corroborates the person. Chinese 哈尔特/霍尔特 varies, so retain English as the spelling anchor. Standardize only this person's Korean spans to #{KOREAN_FULL} and #{KOREAN_SHORT}; preserve every verse line, punctuation, other names, and exact line breaks. Do not register the common verb Halt as an alias."
                 else
                   "The Korean personal name already uses the canonical bilingual form. Preserve the complete source-aligned poem/title and lineation."
                 end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => evidence, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end

    definition_path, review_path = paths
    raise 'D-21416 artifacts already exist' if paths.any? { |path| File.exist?(path) }
    M.write_table(definition_path, glossary.headers, [definition(glossary, scoped)])
    M.write_table(review_path, M::HEADERS.take(12), reviews)
    puts "Prepared D-21416: #{reviews.length} Halter Ninepins keys; #{reviews.group_by { |row| row['status'] }.transform_values(&:length).inspect}."
    puts "Changed rows: #{reviews.select { |row| row['old'] != row['new'] }.map { |row| M.key(row).reject(&:empty?).join(':') }.join(', ')}"
  end

  def apply!
    abort 'run prepare first; discovery TSVs are missing' unless paths.all? { |path| File.file?(path) }
    ReviewedProperNameDiscovery.run([*paths, '21416'])
  end
end

case ARGV.fetch(0, 'prepare')
when 'prepare'
  HalterNinepinsD21416.prepare!
when 'apply'
  HalterNinepinsD21416.apply!
else
  abort 'usage: review-halter-ninepins-D21416.rb [prepare|apply]'
end
