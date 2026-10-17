#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module SelkieVeilD21422
  extend self

  M = ReviewedNameBatches
  D = 21_422
  ENTITY = 'unique_item:selkie-veil'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")

  def definition(glossary)
    glossary.headers.to_h do |header|
      value = case header
              when 'entity_key' then ENTITY
              when 'english_canonical' then 'Selkie Veil'
              when 'category' then 'unique item'
              when 'korean_canonical' then '셀키의 베일(Selkie Veil)'
              when 'english_aliases' then ''
              when 'korean_variants' then '셀키(Selkie)의 베일|셀키의 장막|셀키의 베일'
              when 'evidence_ids' then 'D-21422'
              when 'status' then 'confirmed'
              when 'notes'
                'A named Fae relic explicitly called the Selkie Veil, stolen and recovered in the quest and said to transform its wearer. English establishes the complete artifact name; Japanese and Chinese corroborate the item and lore. Do not infer that the isolated label Selkie at default:23536 names this artifact, a creature, or a people group.'
              end
      [header, value]
    end
  end

  def normalize(text)
    text.gsub(/셀키(?:\(Selkie\))?(?:의)?\s*(?:베일|장막)(?:\(Selkie Veil\))?/i,
              '셀키의 베일(Selkie Veil)')
  end

  def prepare
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    raise "#{ENTITY} already registered" if glossary.any? { |row| row['entity_key'] == ENTITY }
    raise 'D-21422 artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    definitions = [definition(glossary)]
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "Selkie Veil source scope changed: #{generated.length}" unless generated.length == 9

    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "missing aligned source locale at #{key.inspect}" if
        [english, japanese, chinese].any?(&:empty?)
      raise "source artifact identity differs at #{key.inspect}" unless
        english.match?(/(?<![A-Za-z])Selkie Veil(?![A-Za-z])/i)

      new_text = normalize(old)
      raise "Korean artifact span absent at #{key.inspect}" unless
        new_text.include?('셀키의 베일(Selkie Veil)')
      status = new_text == old ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1],
        'Tipo_Variante' => key[2], 'entity_key' => ENTITY,
        'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => 'English identifies the complete named Fae artifact Selkie Veil; the quest describes its theft, recovery, and transformation power. Japanese and Chinese corroborate the relic and its name. Standardize only the complete item label to 셀키의 베일(Selkie Veil); do not infer an entity from the separate bare Selkie label.',
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(ENTITY => status)
      }
    end
    puts "Prepared D-#{D}: #{reviews.length} keys; " \
         "Texto edits=#{reviews.count { |row| row['old'] != row['new'] }}."
    [definitions, reviews]
  end

  def apply
    definitions, reviews = prepare
    M.write_table(DEFINITIONS, M.table(File.join(__dir__, 'proper-name-glossary.tsv')).headers,
                  definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])

    note = <<~TEXT

      ## D-#{D}: Selkie Veil

      Registered the named Fae relic `Selkie Veil` as
      `unique_item:selkie-veil` and reviewed all nine exact source keys.
      Standardized the complete item label to `셀키의 베일(Selkie Veil)`;
      English quest context identifies the stolen/recovered relic and its
      transformation power, with Japanese and Chinese corroboration. This
      cross-row evidence resolves the prior isolated-item uncertainty at
      `default:39328` for this artifact only. The distinct bare `Selkie` label
      at `default:23536` remains uncertain and unregistered; it is not inferred
      to be the item, creature, or people group. No historical global tally
      was recounted.
    TEXT
    [
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ].each do |path|
      File.write(path, File.read(path) + note)
    end
    [
      File.join(M::ROOT, 'NEXT-SESSION.md'),
      File.join(M::ROOT, 'work/zh_cn/TRANSLATION_PROGRESS.md'),
      File.join(__dir__, 'README.md'),
      File.join(__dir__, 'decision-register-20261009.md'),
      File.join(__dir__, 'proper-name-continuation-validation-20261015.md')
    ].each do |path|
      text = File.read(path)
      marker = '### Verified Run D-21391-D-21401'
      raise "missing historical insertion point in #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{note}\n#{marker}"))
    end
  end
end

case ARGV.fetch(0, 'prepare')
when 'prepare'
  SelkieVeilD21422.prepare
when 'apply'
  SelkieVeilD21422.apply
else
  abort 'usage: review-selkie-veil-D21422.rb [prepare|apply]'
end
