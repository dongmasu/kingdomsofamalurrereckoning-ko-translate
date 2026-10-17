#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'
require_relative 'build-proper-name-occurrences'

module CharamsMineD21403
  module_function

  D = 21_403
  ENTITY = 'title:charams-mine'
  CANONICAL = "차람 광산(Charam's Mine)"
  KEY = ['base', '1618', '11'].freeze
  LABEL = /차람(?:\(Charam\))? 광산(?:\(Charam's Mine\))?/

  EVIDENCE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English base:1618 explicitly presents the complete display label Charam's
    Mine. Japanese チャラム鉱山 and Chinese 查拉姆的矿井 corroborate the
    mine wording. Standardize this complete label as 차람 광산(Charam's Mine),
    pairing the site name atomically rather than treating Charam as a global
    alias. The distinct Charam's Grotto occurrence at default:35864 is not
    included; no source establishes that the grotto and mine are the same
    place. The active affix/base/default resources were checked; this exact
    label occurs only at base:1618:11. The official Korean manual PDF p. 4
    supplies general map context, not this location or an identity link.
  TEXT

  def transform(text)
    raise 'missing complete Charam mine label' unless text.match?(LABEL)

    text.gsub(LABEL, CANONICAL)
  end

  def spec
    {
      key: ENTITY,
      english: "Charam's Mine",
      category: 'title',
      korean: CANONICAL,
      aliases: '',
      variants: '차람(Charam) 광산|차람 광산',
      count: 1,
      notes: EVIDENCE
    }
  end

  def plan
    m = ReviewedNameBatches
    inventory = m.refresh_inventory
    candidate = {
      'entity_key' => ENTITY,
      'english_canonical' => "Charam's Mine",
      'english_aliases' => ''
    }
    generated = build_occurrences(inventory.values, [candidate]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "unexpected Charam's Mine source coverage: #{generated.length}" unless generated.length == 1
    raise 'unexpected Charam mine source key' unless m.key(generated.first) == KEY
    source = inventory.fetch(KEY)
    current = source.fetch('work_text')
    raise 'unexpected existing Korean translation' unless
      ['차람(Charam) 광산', CANONICAL].include?(current)
    raise 'unexpected Charam mine proposed label' unless
      transform(current) == CANONICAL

    glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)
    registered = glossary.find { |row| row['entity_key'] == ENTITY }
    indexed = m.table(m::INDEX).map(&:to_h).select { |row| row['entity_key'] == ENTITY }
    if registered
      raise 'unexpected registered Charam mine canonical' unless
        registered['english_canonical'] == "Charam's Mine" &&
        registered['korean_canonical'] == CANONICAL &&
        registered['category'] == 'title'
      raise 'registered Charam mine index scope differs from source' unless
        indexed.map { |row| m.key(row) } == [KEY]
    else
      raise "partial index exists without registered entity #{ENTITY}" unless indexed.empty?
    end
    generated
  end

  def run
    plan
    context = <<~TEXT.gsub(/\s+/, ' ').strip
      Registered only the complete Charam's Mine display label. The separate
      Charam's Grotto source occurrence is excluded from this site identity
      scope; no general Charam alias or location merge is inferred.
    TEXT
    ReviewedDiscoverySpecs.run(
      D, "Charam's Mine Complete Label", [spec], context,
      '## D-21402: Bloodbane Named Crudok'
    ) do |_entity, key, text, _source|
      raise "unexpected Charam mine key #{key.inspect}" unless key == KEY
      [transform(text), false]
    end
  end
end

CharamsMineD21403.run if $PROGRAM_NAME == __FILE__
