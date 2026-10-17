#!/usr/bin/env ruby
require_relative 'apply-reviewed-proper-name-discovery'

module AkaraD20992
  extend self
  M = ReviewedNameBatches
  ENTITY = 'deity:akara'
  DEFINITION = {
    'entity_key' => ENTITY,
    'english_canonical' => 'Akara',
    'category' => 'deity',
    'korean_canonical' => '아카라(Akara)',
    'english_aliases' => '',
    'korean_variants' => '아카라',
    'evidence_ids' => 'D-20992-D-20998|default:785|default:8464|default:37415',
    'status' => 'confirmed',
    'notes' => 'English explicitly identifies Akara as a god, ancient being, island guardian, and the great tree worshipped on Gallows End; Japanese アカラ and Chinese 阿卡拉 corroborate. Standardize direct references as 아카라(Akara), retaining Korean particles and honorifics. Keep Akara-Tor as the separate registered place, Akara-root as a compound material, and The Roots of Akara as a separate complete title outside deity normalization. English epithets Akara the Exile and Akara the Ageless refer to the same deity and retain their full source labels where translated.'
  }.freeze
  OPAQUE_NAMES = [
    /\bAkara-Tor\b/i,
    /\bAkara-root\b/i,
    /\bThe Roots of Akara\b/i
  ].freeze

  def english_text(row)
    JSON.parse(row.fetch('en_texts_json')).compact.join("\n")
  end

  def direct_deity_reference?(text)
    remainder = text.dup
    OPAQUE_NAMES.each { |pattern| remainder.gsub!(pattern, '') }
    remainder.match?(/\bAkara\b/i)
  end

  def transform(text, key, source_text)
    return text unless direct_deity_reference?(source_text)

    resource, id, = key
    if resource == 'default' && id == '19169'
      raise 'missing Akara epithet pair at 19169' unless
        text.include?('추방자 아카라') && text.include?('불멸자 아카라')
      text = text.sub('추방자 아카라', '추방자 아카라(Akara the Exile)')
      text = text.sub('불멸자 아카라', '불멸자 아카라(Akara the Ageless)')
    elsif resource == 'default' && id == '19820'
      raise 'missing Akara the Exile at 19820' unless text.include?('추방자 아카라')
      text = text.sub('추방자 아카라', '추방자 아카라(Akara the Exile)')
    elsif resource == 'default' && id == '37415'
      raise 'missing Akara the Exile at 37415' unless text.include?('유배자 아카라라 불리는')
      text = text.sub('유배자 아카라라 불리는', '추방자 아카라(Akara the Exile)라 불리는')
    end

    text.gsub(/(?<![가-힣A-Za-z])아카라(?!-)(?!\s*\(Akara\b)/) do |match|
      "#{match}(Akara)"
    end
  end

  def run(mode)
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, [DEFINITION]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "Akara scope changed: #{generated.length}" unless generated.length == 339
    distribution = generated.group_by { |row| row['resource'] }.transform_values(&:length)
    raise "unexpected Akara resource distribution: #{distribution.inspect}" unless
      distribution == { 'base' => 5, 'default' => 334 }

    reviews = generated.map do |match|
      key = M.key(match)
      source = inventory.fetch(key)
      source_english = english_text(source)
      old = source.fetch('work_text')
      direct = direct_deity_reference?(source_english)
      updated = transform(old, key, source_english)
      status = if !direct
                 'excluded'
               elsif old == updated
                 'not-an-issue'
               else
                 'accepted'
               end
      reason = if !direct
                 if source_english.match?(/\bAkara-Tor\b/i)
                   'The source occurrence is only the complete Akara-Tor place name; the registered place entity remains atomic and is not a deity mention.'
                 elsif source_english.match?(/\bAkara-root\b/i)
                   'The source occurrence is only the compound material name Akara-root; do not split or annotate its component as a deity mention in this pass.'
                 else
                   'The source occurrence is only the complete title The Roots of Akara; keep the title atomic and review its work/item category separately.'
                 end
               else
                 'English uses Akara for the worshipped island god/ancient being; aligned Japanese アカラ and Chinese 阿卡拉 corroborate. Pair only the deity name, preserving complete compounds, titles, epithets, particles, honorifics, and surrounding text.'
               end
      reason += ' Preserve both full epithets as names of the same deity.' if key[1] == '19169'
      reason += ' The English Akara the Exile is retained as a full bilingual epithet.' if %w[19820 37415].include?(key[1])
      reason += ' Unify the same Exile epithet as 추방자, matching 19169, 19820, and 62679.' if key[1] == '37415'
      reason += ' Akara-Tor is a separate place name; this row also contains an independent deity reference.' if key[1] == '44737' || key[1] == '59362'
      {
        'resource' => key[0],
        'ID_Linha' => key[1],
        'Tipo_Variante' => key[2],
        'entity_key' => ENTITY,
        'status' => status,
        'old' => old,
        'new' => updated,
        'evidence' => reason,
        'english' => JSON.parse(source['en_texts_json']).compact.join("\n"),
        'japanese' => JSON.parse(source['ja_texts_json']).compact.join("\n"),
        'chinese' => source['zh_text'],
        'entity_dispositions_json' => JSON.generate(ENTITY => status),
        'previous_status' => '',
        'previous_evidence' => ''
      }
    end

    definitions = File.join(__dir__, 'proper-name-discovery-definitions-D20992.tsv')
    proposals = File.join(__dir__, 'proper-name-discovery-D20992.tsv')
    M.write_table(definitions, M.table(ReviewedProperNameDiscovery::GLOSSARY).headers, [DEFINITION])
    M.write_table(proposals, M::HEADERS, reviews)
    counts = reviews.group_by { |row| row['status'] }.transform_values(&:length)
    edits = reviews.select { |row| row['old'] != row['new'] }
    puts "Akara reviewed source keys: #{reviews.length}; dispositions=#{counts.inspect}; edited_cells=#{edits.length}"
    puts "Prepared: #{File.basename(definitions)}, #{File.basename(proposals)}"

    if mode == 'apply'
      ReviewedProperNameDiscovery.run([definitions, proposals, '20992'])
    elsif mode != 'prepare'
      abort 'usage: review-akara-D20992.rb [prepare|apply]'
    end
  end
end

AkaraD20992.run(ARGV.fetch(0, 'prepare')) if $PROGRAM_NAME == __FILE__
