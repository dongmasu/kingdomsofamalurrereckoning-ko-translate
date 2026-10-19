#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'
require_relative 'build-short-label-discovery-20261018'

module ReviewScarwoodScholiaD21791
  extend self

  D = 21_791
  TREE = '스카우드 나무(Scarwood Tree)'
  GROUNDS = '스콜리아 아르카나 구역(Scholia Arcana Grounds)'
  GROUNDS_LOWER = '스콜리아 아르카나 구역(Scholia Arcana grounds)'

  NOTES = {
    tree: <<~TEXT.gsub(/\s+/, ' ').strip.freeze,
      English default:61206 explains that the tree is aptly named and ties
      the name to its bark; base:2184 labels the same named tree. Japanese
      スカーウッドの木 / スカーウッド and Chinese 伤痕之木 / 伤痕树
      corroborate the object. Reuse the established Scarwood stem 스카우드
      from the distinct resource:scarwood-bark entity. Register the tree
      separately; do not merge it with the bark resource or globalize bare
      Scarwood. Preserve the existing resource:scarwood-bark row disposition
      at default:61206.
    TEXT
    grounds: <<~TEXT.gsub(/\s+/, ' ').strip.freeze
      English names the Scholia Arcana Grounds as a distinct site in
      base:329, default:17420, 23434, 25147, and 55994. The aligned Japanese
      アルカナ大学の中庭 and Chinese 奥术学院场地 corroborate the complete
      labels; English controls where the narrative locales shorten the name.
      Use 스콜리아 아르카나 구역, preserving the already reviewed
      faction:scholia-arcana owner in shared rows. Keep the source-local
      lowercase grounds at default:25147. At default:55994, normalize only
      the second, place-specific Scholia phrase and preserve the first
      faction mention and Main Hall. Exclude default:47028's complete
      Dreamworld scene label from the real-world place entity. Do not infer
      that the dreamworld instance is the physical Grounds.
    TEXT
  }.freeze

  SPECS = [
    {
      key: 'resource:scarwood-tree', english: 'Scarwood Tree',
      category: 'resource', korean: TREE, aliases: '',
      variants: '스카우드(Scarwood) 나무|상처나무(Scarwood Tree)',
      count: 2, notes: NOTES.fetch(:tree)
    },
    {
      key: 'place:scholia-arcana-grounds', english: 'Scholia Arcana Grounds',
      category: 'place', korean: GROUNDS, aliases: '',
      variants: [
        GROUNDS, GROUNDS_LOWER,
        '스콜리아 아르카나(Scholia Arcana) 구역',
        '스콜리아 아르카나(Scholia Arcana) 경내',
        '꿈의 세계 - 스콜리아 아르카나(Scholia Arcana) 부지'
      ].join('|'),
      count: 6, notes: NOTES.fetch(:grounds)
    }
  ].freeze

  def transform(spec, key, text, source)
    english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
    japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n")
    chinese = source.fetch('zh_text')
    term = spec.fetch(:english)
    raise "English source term missing #{key.inspect}" unless
      english.match?(/(?<![A-Za-z0-9])#{Regexp.escape(term)}(?![A-Za-z0-9])/i)

    case spec.fetch(:key)
    when 'resource:scarwood-tree'
      if key == ['base', '2184', '11']
        raise 'base Scarwood Tree locale corroboration missing' unless
          japanese.include?('スカーウッドの木') && chinese.include?('伤痕之木')
        old = '스카우드(Scarwood) 나무'
        raise 'base Scarwood Tree label changed' unless text == old
        [text.sub(old, TREE), false]
      elsif key == ['default', '61206', '']
        raise 'Scarwood Tree description locale corroboration missing' unless
          japanese.include?('スカーウッド') && chinese.include?('伤痕树')
        old = '상처나무(Scarwood Tree)'
        raise 'Scarwood Tree description label changed' unless text.include?(old)
        [text.sub(old, TREE), false]
      else
        raise "unexpected Scarwood Tree source key #{key.inspect}"
      end
    when 'place:scholia-arcana-grounds'
      raise 'Scholia Arcana Grounds source localization missing' if
        japanese.empty? || chinese.empty?
      if key == ['base', '329', '11']
        old = '스콜리아 아르카나(Scholia Arcana) 구역'
        raise 'base Grounds label changed' unless text == old
        [text.sub(old, GROUNDS), false]
      elsif key == ['default', '17420', '']
        old = '스콜리아 아르카나(Scholia Arcana) 경내'
        raise 'default Grounds label changed' unless text == old
        [text.sub(old, GROUNDS), false]
      elsif key == ['default', '23434', '']
        raise 'existing complete Grounds pair changed' unless text.include?(GROUNDS)
        [text, false]
      elsif key == ['default', '25147', '']
        old = '스콜리아 아르카나(Scholia Arcana) 구역'
        raise 'lowercase grounds phrase changed' unless text.include?(old)
        [text.sub(old, GROUNDS_LOWER), false]
      elsif key == ['default', '47028', '']
        raise 'Dreamworld scene label changed' unless
          text == '꿈의 세계 - 스콜리아 아르카나(Scholia Arcana) 부지'
        [text, true]
      elsif key == ['default', '55994', '']
        old = '스콜리아 아르카나(Scholia Arcana) 부지'
        raise 'place-specific Grounds phrase missing' unless text.include?(old)
        raise 'expected two distinct Scholia mentions' unless text.scan('스콜리아 아르카나').length == 2
        [text.sub(old, GROUNDS), false]
      else
        raise "unexpected Scholia Arcana Grounds source key #{key.inspect}"
      end
    else
      raise "unreviewed discovery entity #{spec.fetch(:key)}"
    end
  end

  def apply
    context = <<~TEXT.gsub(/\s+/, ' ').strip
      English is the identity and meaning anchor; exact aligned Japanese
      and Chinese source cells corroborate the named tree and place.
      Searched every exact English source hit across affix/base/default;
      no affix hit occurs in either scope. Updated only reviewed named spans,
      preserving all prior owners, particles, tokens and line breaks.
      Existing translation dispositions and historical global totals were
      not reopened or recounted. No PAK or PAK-derived data was consulted.
    TEXT
    ReviewedDiscoverySpecs.run(
      D, 'Scarwood Tree And Scholia Arcana Grounds',
      SPECS, context, '<!-- current-proper-name-batch:start -->'
    ) { |*args| transform(*args) }
    refresh_candidate_checkpoint
  end

  def refresh_candidate_checkpoint
    m = ReviewedNameBatches
    inventory = m.refresh_inventory
    glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    index = m.table(m::INDEX)
    candidates = ShortLabelDiscovery20261018.build(
      inventory.values, glossary.map(&:to_h), index.map(&:to_h)
    )
    snapshot_path = File.join(__dir__, "proper-name-short-label-discovery-D#{D}.tsv")
    raise "refusing to overwrite #{snapshot_path}" if File.exist?(snapshot_path)
    m.write_table(snapshot_path, ShortLabelDiscovery20261018::HEADERS, candidates)
    next_candidate = candidates.first&.fetch('english_candidate', 'none')
    next_line = "Next batch: D-#{D + 1}; continue refreshed short-label snapshot `proper-name-short-label-discovery-D#{D}.tsv` (#{candidates.length} bounded groups; first `#{next_candidate}`; not exhaustive or a completion estimate)."

    m::DOCS.each do |path|
      text = File.read(path)
      marker = /<!-- current-proper-name-batch:start -->.*?<!-- current-proper-name-batch:end -->/m
      block = text.match(marker)
      raise "current checkpoint missing in #{path}" unless block
      updated = block[0].sub(/^Next batch:.*$/, next_line)
      File.write(path, text.sub(marker, updated))
    end

    validation = m.command!('ruby', File.join(__dir__, 'validate-proper-name-data.rb'))
    residual = m.command!('ruby', File.join(__dir__, 'audit-proper-name-residual-final.rb'))
    raise 'proper-name data validation failed' unless validation.include?('PASS')
    raise 'proper-name residual validation failed' unless
      residual.include?('missing=0') && residual.include?('undocumented extras=0')
    report_note = <<~TEXT

      ## Refreshed Candidate Queue

      Rebuilt `proper-name-short-label-discovery-D#{D}.tsv` after the new
      registrations using the active aligned inventory. It contains
      #{candidates.length} bounded candidate groups and begins with
      `#{next_candidate}`; it is not an exhaustive remainder or a completion
      estimate. Full-source coverage and the byte-preserving edit manifest
      are recorded above.

      Validation: #{validation.strip}
      Residual bilingual/index audit: PASS; #{residual.lines.grep(/\A(?:Source\/index key differences:|Source\/occurrence comparison:|Terminal matches without)/).map(&:strip).join('; ')}
    TEXT
    %W[named-scope-review-D#{D}-#{m::RUN_DATE_COMPACT}.md named-scope-edit-addendum-D#{D}-#{m::RUN_DATE_COMPACT}.md].each do |filename|
      path = File.join(__dir__, filename)
      File.open(path, 'a') { |file| file.write(report_note) }
    end
  end
end

ReviewScarwoodScholiaD21791.apply if $PROGRAM_NAME == __FILE__
