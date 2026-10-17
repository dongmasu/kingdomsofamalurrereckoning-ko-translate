#!/usr/bin/env ruby

require_relative 'review-well-of-souls-D21510'

module PeaceEdictD21513
  extend self

  M = ReviewedNameBatches
  D = 21_513
  ENTITY = 'lore_term:peace-edict'
  CANONICAL = '평화 칙령(Peace Edict)'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  IDS = %w[430 860 2090 4721 6898 13449 16287 19596 25757 35711 46520 52903 53526 62817 63202].freeze
  NOTE = 'English default:19596 explicitly identifies the Peace Edict as the rule in Ysa; default:16287/53526 explain its weapons and peace restrictions. Japanese 平和の布告 and Chinese 和平法令 corroborate. Register the named decree as lore term, not an organization or an ordinary peace reference. Reuse the existing 평화 칙령(Peace Edict). Only pair the exact name: preserve every rule-description clause, especially default:63202 weapons controlled versus total prohibition, and all prior Ysa or sentence-level dispositions. No bare Peace/Edict alias, source edit, PAK evidence or historical tally recount.'
  DETAIL = <<~TEXT.chomp
    ### D-21513: Peace Edict

    Registered `lore_term:peace-edict` as `평화 칙령(Peace Edict)`.
    All 15 exact keys are in default; no affix/base matches.
    English establishes Ysa's named decree, with Japanese 平和の布告
    and Chinese 和平法令 corroboration. Added missing annotations to
    12 cells; retained the 3 already paired cells.
    The rule descriptions, especially default:63202's weapons-controlled
    wording, remain unchanged. This is not a fresh disposition of earlier
    sentence-level findings, and no historical translation total changed.
  TEXT

  def expected_pairs
    IDS.map { |id| [ENTITY, 'default', id, ''] }
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    fields = {
      'entity_key' => ENTITY, 'english_canonical' => 'Peace Edict',
      'category' => 'lore term', 'korean_canonical' => CANONICAL,
      'english_aliases' => '', 'korean_variants' => '평화 칙령',
      'evidence_ids' => "D-#{D}|default:16287|default:19596|default:53526",
      'status' => 'confirmed', 'notes' => NOTE
    }
    definition = glossary.headers.to_h { |h| [h, fields.fetch(h, '')] }
    inventory = WellOfSoulsD21510.load_inventory
    generated = build_occurrences(inventory.values, [definition]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise 'Peace Edict scope differs' unless
      generated.map { |r| [r.fetch('entity_key'), *M.key(r)] }.sort == expected_pairs.sort
    reviews = generated.sort_by { |r| r.fetch('ID_Linha').to_i }.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      raise "Peace Edict span differs #{key.inspect}" unless
        old.scan(/평화 칙령(?:\(Peace Edict\))?/).length == 1
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      raise "Peace Edict source support differs #{key.inspect}" unless
        english.scan(/Peace Edict/i).length == 1 &&
        japanese.include?('平和の布告') && source.fetch('zh_text').include?('和平法令')
      new_text = old.sub(/평화 칙령(?:\(Peace Edict\))?/, CANONICAL)
      status = old == new_text ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => ENTITY, 'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => NOTE, 'english' => english, 'japanese' => japanese,
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    raise 'Peace Edict edit count differs' unless reviews.count { |r| r['old'] != r['new'] } == 12
    ReviewedProperNameDiscovery.validate!(
      [definition], reviews, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    puts "D-#{D}: #{reviews.length} keys; 12 edits."
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
    raise 'Peace Edict additions differ' unless (current.keys - previous.keys).sort == expected_pairs.sort
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
  when [], ['prepare'] then PeaceEdictD21513.prepare
  when ['apply'] then PeaceEdictD21513.apply
  else abort 'usage: review-peace-edict-D21513.rb [prepare|apply]'
  end
end
