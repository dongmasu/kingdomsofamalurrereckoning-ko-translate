#!/usr/bin/env ruby

require_relative 'review-well-of-souls-D21510'

module CustomsHouseD21515
  extend self

  M = ReviewedNameBatches
  D = 21_515
  ENTITY = 'place:customs-house'
  CANONICAL = '세관(Customs House)'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  IDS = %w[1548 2412 8157 13051 15032 15050 15146 18374 34077 40645 41204 41569 46652 49182 51377 52623 61075 63633 63737].freeze
  COMPOUNDS = %w[2412 15146 61075 63633].freeze
  NOTE = 'English default:8157 explicitly locates the named Customs House in Rathir; base:1171 and repeated exact topic labels corroborate the building/office name. Japanese 収税局 corroborates, while Chinese includes 海关之屋 and mistranslated 自定义房屋/客服中心; Chinese is not the meaning authority. Reuse 세관(Customs House), with the complete source compound rendered atomically as 라시르 세관(Rathir Customs House). This is the building/office metonym, not the hidden lair beneath it. Preserve earlier inside/beneath, password, Gwyn and other sentence-level decisions; no historical recount or source/PAK changes.'
  DETAIL = <<~TEXT.chomp
    ### D-21515: Customs House

    Registered `place:customs-house` as `세관(Customs House)`, with
    the source-attested full form `라시르 세관(Rathir Customs House)`.
    Reviewed 20 lexical row keys: 18 named building/office references,
    one generic excluded use (default:51377), and one identity hold
    (default:41569). Added annotations to 17 cells; the existing
    bilingual default:18374 and both exceptions remain unchanged.

    English explicitly places the building in Rathir; Japanese 収税局
    corroborates. Isolated Chinese mistranslations do not determine
    the Korean name. The hidden lair is not merged into the building,
    and previous inside/beneath or narrative decisions are preserved.
    No broad `Customs` alias or historical translation tally was added.
  TEXT

  def expected_pairs
    [[ENTITY, 'base', '1171', '11']] + IDS.map { |id| [ENTITY, 'default', id, ''] }
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => 'Customs House',
      'category' => 'place', 'korean_canonical' => CANONICAL,
      'english_aliases' => 'Rathir Customs House', 'korean_variants' => '세관',
      'evidence_ids' => "D-#{D}|base:1171:11|default:8157|default:15146",
      'status' => 'confirmed', 'notes' => NOTE
    }
    definition = glossary.headers.to_h { |h| [h, fields.fetch(h, '')] }
    inventory = WellOfSoulsD21510.load_inventory
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'Customs House scope differs' unless
      generated.map { |r| [r.fetch('entity_key'), *M.key(r)] }.sort == expected_pairs.sort
    reviews = generated.sort_by do |r|
      [M::RESOURCES.index(r.fetch('resource')), r.fetch('ID_Linha').to_i]
    end.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      note = NOTE
      if key == ['default', '51377', '']
        new_text = old
        status = 'excluded'
        note += ' English a customs house describes a generic workplace skill; do not force a specific building annotation.'
      elsif key == ['default', '41569', '']
        new_text = old
        status = 'uncertain'
        note += ' English the lowercase customs house and the trader/captain question fit an office, but this isolated line and aligned locales do not independently establish the Rathir building identity. Retain the Korean cell and hold only this new entity relation, not any previous narrative judgment.'
      else
        raise "Customs House Japanese support differs #{key.inspect}" unless japanese.include?('収税局')
        if key[0] == 'default' && COMPOUNDS.include?(key[1])
          from = '라시르(Rathir) 세관'
          raise "Rathir Customs compound differs #{key.inspect}" unless
            english.scan('Rathir Customs House').length == 1 && old.scan(from).length == 1
          new_text = old.sub(from, '라시르 세관(Rathir Customs House)')
        else
          pattern = /세관(?:\(Customs House\))?/
          raise "Customs Korean span differs #{key.inspect}" unless old.scan(pattern).length == 1
          new_text = old.sub(pattern, CANONICAL)
        end
        status = old == new_text ? 'not-an-issue' : 'accepted'
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => note, 'english' => english, 'japanese' => japanese,
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    raise 'Customs House edit count differs' unless reviews.count { |r| r['old'] != r['new'] } == 17
    ReviewedProperNameDiscovery.validate!(
      [definition], reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: #{reviews.length} keys; 17 edits; 1 new entity hold."
    [glossary.headers, definition, reviews]
  end

  def apply
    headers, definition, reviews = prepare
    previous = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, [definition])
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |r|
      [[r.fetch('entity_key'), *M.key(r)], r.reject { |k, _| k == 'korean_current' }]
    end
    previous.each { |k, v| raise "prior occurrence changed #{k.inspect}" unless current[k] == v }
    raise 'Customs House additions differ' unless (current.keys - previous.keys).sort == expected_pairs.sort
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
    end
    %w[review edit-addendum].each do |kind|
      path = File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
      File.open(path, 'a') { |f| f.write("\n\n#{DETAIL}\n") }
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then CustomsHouseD21515.prepare
  when ['apply'] then CustomsHouseD21515.apply
  else abort 'usage: review-customs-house-D21515.rb [prepare|apply]'
  end
end
