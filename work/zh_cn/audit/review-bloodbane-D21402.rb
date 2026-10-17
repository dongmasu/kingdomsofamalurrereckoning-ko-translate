#!/usr/bin/env ruby

require_relative 'run-reviewed-discovery-specs'
require_relative 'build-proper-name-occurrences'

module BloodbaneD21402
  module_function

  D = 21_402
  ENTITY = 'monster:bloodbane'
  CANONICAL = '블러드베인(Bloodbane)'
  COUNT = 38
  NAME_SPAN = /크루독 블러드베인\(Crudok Bloodbane\)|피의 재앙(?:\(Bloodbane\))?|브래드베인(?:\(Bloodbane\))?|블러드베인(?:\(Bloodbane\))?/

  EVIDENCE = <<~TEXT.gsub(/\s+/, ' ').strip.freeze
    English default:36419 and 37302 explicitly identify Bloodbane as a
    particular crudok; default:42339 and 56260 say mortals call that crudok
    Bloodbane. The aligned hunt, bounty, attack, and death rows confirm this
    is the same individually named monster, not the species or an item.
    Japanese ブラッドベイン supports the established Korean transliteration
    블러드베인; Chinese 血色灾祸 is supporting semantic evidence only.
    Standardize the 38 exact English source matches as 블러드베인(Bloodbane),
    correcting the isolated semantic rendering 피의 재앙 and typo
    브래드베인. In the compound crudok Bloodbane, pair the species and
    individual name separately. Preserve surrounding wording, particles,
    quotations, and other entity annotations. Search covered affix, base,
    and default; only default contains matches. The official Korean manual
    is a broad gameplay guide and has no Bloodbane entry; that omission is
    not evidence against this source-established monster identity.
  TEXT

  def transform(text)
    raise 'missing reviewed Bloodbane Korean span' unless text.match?(NAME_SPAN)

    normalized = text.gsub(NAME_SPAN) do |match|
      if match == '크루독 블러드베인(Crudok Bloodbane)'
        '크루독(Crudok) 블러드베인(Bloodbane)'
      else
        CANONICAL
      end
    end
    raise 'Bloodbane canonical label missing after transform' unless normalized.include?(CANONICAL)

    normalized
  end

  def spec
    {
      key: ENTITY,
      english: 'Bloodbane',
      category: 'monster',
      korean: CANONICAL,
      aliases: '',
      variants: '블러드베인|브래드베인|피의 재앙',
      count: COUNT,
      notes: EVIDENCE
    }
  end

  def plan
    m = ReviewedNameBatches
    inventory = m.refresh_inventory
    glossary = m.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h)

    candidate = {
      'entity_key' => ENTITY,
      'english_canonical' => 'Bloodbane',
      'english_aliases' => ''
    }
    generated = build_occurrences(inventory.values, [candidate]).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "unexpected Bloodbane source coverage: #{generated.length}" unless generated.length == COUNT
    raise 'Bloodbane matches outside default' unless generated.all? { |row| row['resource'] == 'default' }
    keys = generated.map { |row| m.key(row) }
    raise 'duplicate Bloodbane source row' unless keys.uniq.length == COUNT

    generated.each do |row|
      source = inventory.fetch(m.key(row))
      raise "unhandled Korean name form at #{m.key(row).join(':')}" unless
        transform(source.fetch('work_text')).include?(CANONICAL)
    end
    registered = glossary.find { |row| row['entity_key'] == ENTITY }
    indexed = m.table(m::INDEX).map(&:to_h).select { |row| row['entity_key'] == ENTITY }
    if registered
      raise 'unexpected registered Bloodbane canonical' unless
        registered['english_canonical'] == 'Bloodbane' &&
        registered['korean_canonical'] == CANONICAL &&
        registered['category'] == 'monster'
      raise 'registered Bloodbane index scope differs from source' unless
        indexed.map { |row| m.key(row) }.sort == keys.sort
    else
      raise 'partial Bloodbane index exists without glossary entity' unless indexed.empty?
    end
    generated
  end

  def run
    plan
    context = <<~TEXT.gsub(/\s+/, ' ').strip
      Registered the individually named crudok Bloodbane after comparing all
      38 English-led source keys with aligned Japanese and Chinese text.
      Reused the corpus transliteration 블러드베인 and standardized its
      bilingual label; the Chinese semantic rendering is supporting evidence.
      No species-wide or item alias is inferred, and prior row dispositions
      for unrelated entities remain intact.
    TEXT
    ReviewedDiscoverySpecs.run(
      D, 'Bloodbane Named Crudok', [spec], context,
      '## D-21395: Charnok Quarry And Royal Seal Complete Labels'
    ) do |_entity, key, text, _source|
      raise "unexpected Bloodbane resource #{key.inspect}" unless key.first == 'default'
      [transform(text), false]
    end
  end
end

BloodbaneD21402.run if $PROGRAM_NAME == __FILE__
