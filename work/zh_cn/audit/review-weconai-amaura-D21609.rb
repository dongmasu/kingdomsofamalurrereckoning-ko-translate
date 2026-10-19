#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewWeconaiAmauraD21609
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_609
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONTEXT = <<~TEXT.chomp
    English-led review of Weconai and Amaura across affix/base/default:
    21 exact source keys, three base and 18 default, no affix hits.
    Weconai is explicitly the magical ruin holding Maura Chalin, while
    Amaura has a gate/rendezvous and lies above Cann-Rane. They are
    different places, not person aliases. Reuse established base-label
    spellings 웨코나이(Weconai) at base:4126 and 아모라(Amaura) at
    base:4587. Japanese ウェコナイ/アモーラ corroborates those spellings;
    Chinese 威科纳/维科奈 and 阿茂拉 supports the same place identities.
    Normalize 위코나이 and 아마우라 only within these exact source scopes.
    Add missing English pairs without duplicating existing parentheses.
    Preserve the Amaura Stone item's existing name structure and the
    separate Dream-Eater/Cann-Rane/Ordo/Maura/entity decisions.
    The official Korean manual extraction/reference has no direct entries
    for these places. Preserve all other words, tokens and line endings.
    No existing terminal entity/key is reopened or recounted; these are
    newly registered place scopes, not global translation totals.
    Full discovery/residual validation remains incomplete. Release ZIP unchanged.
  TEXT
  SPECS = [
    {
      english: 'Weconai', korean: '웨코나이', pattern: /(?:웨코나이|위코나이)(?:\(Weconai\))?/,
      variants: '웨코나이|위코나이',
      base: %w[4126],
      default: %w[3442 3998 4553 24293 24515 26032 50660 52823 53078 53330 55109 55293 55538]
    },
    {
      english: 'Amaura', korean: '아모라', pattern: /(?:아마우라|아모라)(?:\(Amaura\))?/,
      variants: '아모라|아마우라',
      base: %w[3380 4587],
      default: %w[4036 26132 52286 53819 55774]
    }
  ].freeze

  def expected_keys(spec)
    spec.fetch(:base).map { |id| ['base', id, '11'] } +
      spec.fetch(:default).map { |id| ['default', id, ''] }
  end

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    index = M.table(M::INDEX)
    inventory = M.refresh_inventory
    definitions, reviews, generated_all = [], [], []
    SPECS.each do |spec|
      english, korean = spec.values_at(:english, :korean)
      entity = "place:#{english.downcase}"
      values = {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => 'place', 'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => '', 'korean_variants' => spec.fetch(:variants),
        'evidence_ids' => (["D-#{D}"] + expected_keys(spec).map { |key| key.reject(&:empty?).join(':') }).join('|'),
        'status' => 'confirmed', 'notes' => CONTEXT
      }
      definition = glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
      generated = build_occurrences(inventory.values, [definition]).map do |row|
        OCCURRENCE_HEADERS.zip(row).to_h
      end
      raise "unexpected #{english} source coverage" unless
        generated.map { |row| M.key(row) }.sort == expected_keys(spec).sort
      definitions << definition
      generated_all.concat(generated)
      generated.each do |match|
        key = M.key(match)
        source = inventory.fetch(key)
        old = source.fetch('work_text')
        raise "expected one #{english} Korean span at #{key.inspect}" unless
          old.scan(spec.fetch(:pattern)).length == 1
        revised = old.sub(spec.fetch(:pattern), "#{korean}(#{english})")
        status = old == revised ? 'not-an-issue' : 'accepted'
        reviews << {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'entity_key' => entity, 'status' => status, 'old' => old, 'new' => revised,
          'evidence' => CONTEXT,
          'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
          'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
          'chinese' => source.fetch('zh_text'),
          'entity_dispositions_json' => JSON.generate(entity => status)
        }
      end
    end
    raise 'expected 21 distinct row keys' unless reviews.map { |row| M.key(row) }.uniq.length == 21
    R.validate!(definitions, reviews, generated_all, glossary.map(&:to_h), index.map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.group_by { |row| row['resource'] }.each do |resource, rows|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)),
                                  rows.select { |row| row['old'] != row['new'] })
    end
    reviews.sort_by! { |row| [M::RESOURCES.index(row['resource']), row['ID_Linha'].to_i] }
    puts "D-#{D}: two places, 21 keys, #{reviews.count { |row| row['old'] != row['new'] }} Texto edits; prepare only."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'old', 'new')) if row['old'] != row['new']
    end
    [glossary.headers, definitions, reviews]
  end

  def apply
    headers, definitions, reviews = prepare
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewWeconaiAmauraD21609.prepare
  when ['apply'] then ReviewWeconaiAmauraD21609.apply
  else abort 'usage: review-weconai-amaura-D21609.rb [prepare|apply]'
  end
end
