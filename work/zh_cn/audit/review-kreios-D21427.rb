#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module KreiosD21427
  extend self

  M = ReviewedNameBatches
  D = 21_427
  ENTITY = 'person:kreios'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  DEFAULT_IDS = %w[7190 25379 29439 41916 44827 48065 52907 52937 54628 55823 56586 61685].freeze
  ITEM_IDS = %w[137 1694 2660 3190].freeze
  NOTE = 'English identifies Kreios as the historical Kollossae hero, herald, progenitor and first Primos. Default:61685 explicitly says the warrior formerly known as Boarmasher became known as Kreios; default:55823 repeats the same identity. Japanese クレイオス/ボアマッシャー and Chinese 克雷欧斯/屠彘勇士 corroborate. Register one person and the explicit prior-name/epithet alias, not a deity or second person. Retain 크레이오스(Kreios); standardize the already literal epithet as 멧돼지 분쇄자(Boarmasher). Protect the complete item titles registered in D-21425 and all prior dispositions for other entities.'

  def normalize(text, id)
    pattern = if id == '54628'
                # This Korean name expands English "He"; preserve that span.
                /크레이오스(?!\(Kreios\)|는 새로운 민족)/
              else
                /크레이오스(?!\(Kreios\))/
              end
    text.gsub(pattern, '크레이오스(Kreios)')
        .gsub(/(?:보아마셔|멧돼지 분쇄자)(?:\(Boarmasher\))?/, '멧돼지 분쇄자(Boarmasher)')
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'prepared output exists' if [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => 'Kreios', 'category' => 'person',
      'korean_canonical' => '크레이오스(Kreios)', 'english_aliases' => 'Boarmasher',
      'korean_variants' => '크레이오스|보아마셔|멧돼지 분쇄자',
      'evidence_ids' => 'D-21427|default:61685|default:55823|default:44827',
      'status' => 'confirmed', 'notes' => NOTE
    }
    definitions = [glossary.headers.to_h { |header| [header, fields.fetch(header, '')] }]
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected_keys = DEFAULT_IDS.map { |id| ['default', id, ''] } +
      ITEM_IDS.map { |id| ['base', id, '11'] }
    raise 'Kreios source scope differs' unless generated.map { |row| M.key(row) }.sort == expected_keys.sort
    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "unaligned Kreios #{key.inspect}" unless english.include?('Kreios') &&
        japanese.include?('クレイオス') && chinese.include?('克雷欧斯')
      old = source.fetch('work_text')
      item = key[0] == 'base'
      proposed = item ? old : normalize(old, key[1])
      if item
        raise "atomic item annotation missing #{key.inspect}" unless
          old.match?(/\((?:Crown|Fist|Chain) of Kreios\)/)
      end
      if key[1] == '54628'
        raise 'pronoun-expanded Korean name differs' unless
          proposed.scan('크레이오스는 새로운 민족').length == 1
        raise 'explicit Kreios labels differ' unless
          proposed.scan('크레이오스(Kreios)').length == english.scan(/\bKreios\b/).length
      end
      raise 'Kreios normalization not idempotent' unless item || normalize(proposed, key[1]) == proposed
      status = item ? 'excluded' : old == proposed ? 'not-an-issue' : 'accepted'
      evidence = NOTE
      evidence += if item
                    ' Exclude the owner component from this person-label pass: the complete Crown/Fist/Chain title is already independently registered and paired atomically by D-21425. Preserve it byte-for-byte; this exclusion does not deny the owner attribution in its source.'
                  elsif key[1] == '54628'
                    ' Annotate the four explicit English Kreios mentions; preserve the extra Korean 크레이오스는 that expands English He, and all unrelated person/title text.'
                  else
                    ' Annotate every explicit Korean Kreios/Boarmasher span in this exact source row; do not revise the narrator history or unrelated wording.'
                  end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => proposed,
        'evidence' => evidence, 'english' => english, 'japanese' => japanese,
        'chinese' => chinese, 'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "Prepared D-#{D}: #{reviews.length} keys; " \
         "#{reviews.count { |row| row['old'] != row['new'] }} edits; four atomic item exclusions."
    reviews.each { |row| puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new')) }
    [definitions, reviews]
  end

  def apply
    definitions, reviews = prepare
    M.write_table(DEFINITIONS, M.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers,
                  definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then KreiosD21427.prepare
  when 'apply' then KreiosD21427.apply
  else abort 'usage: review-kreios-D21427.rb [prepare|apply]'
  end
end
