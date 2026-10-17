#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module HeartOfSibunD21420
  extend self

  M = ReviewedNameBatches
  D = 21_420
  ENTITY = 'unique_item:heart-of-sibun'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")

  def definition(glossary)
    glossary.headers.to_h do |header|
      value = case header
              when 'entity_key' then ENTITY
              when 'english_canonical' then 'Heart of Sibun'
              when 'category' then 'unique item'
              when 'korean_canonical' then '시분의 심장(Heart of Sibun)'
              when 'english_aliases' then 'The Heart of Sibun'
              when 'korean_variants' then '시분(Sibun)의 심장|시분의 심장'
              when 'evidence_ids' then 'D-21420'
              when 'status' then 'confirmed'
              when 'notes'
                'A named Warsworn relic/artifact stolen from the Ancient Vault, sought and recovered in the quest, and used to summon Niskaru into Dalentarth. English establishes the item; Japanese and Chinese corroborate it. Register the complete item name only; Sibun itself remains unclassified and is not a global alias.'
              end
      [header, value]
    end
  end

  def normalize(text)
    text.gsub(/시분(?:\(Sibun\))?의 심장(?:\(Heart of Sibun\))?/i,
              '시분의 심장(Heart of Sibun)')
  end

  def prepare
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    raise "#{ENTITY} already registered" if glossary.any? { |row| row['entity_key'] == ENTITY }
    raise 'D-21420 artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    definitions = [definition(glossary)]
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "Heart of Sibun source scope changed: #{generated.length}" unless generated.length == 22

    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "missing aligned source locale at #{key.inspect}" if
        [english, japanese, chinese].any?(&:empty?)
      raise "source item identity differs at #{key.inspect}" unless
        english.match?(/(?<![A-Za-z])(?:The )?Heart of Sibun(?![A-Za-z])/i)

      new_text = normalize(old)
      raise "Korean item span absent at #{key.inspect}" if new_text == old &&
        !old.include?('시분의 심장(Heart of Sibun)')
      status = new_text == old ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1],
        'Tipo_Variante' => key[2], 'entity_key' => ENTITY,
        'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => 'English identifies the complete Heart of Sibun relic/artifact in the Warsworn Vault theft and recovery quest; aligned Japanese and Chinese corroborate it. Standardize only this complete item name to 시분의 심장(Heart of Sibun). Do not infer an identity or alias for Sibun itself; preserve all other entity dispositions on the row.',
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

      ## D-#{D}: Heart Of Sibun

      Registered the named Warsworn relic `Heart of Sibun` as
      `unique_item:heart-of-sibun`. Reviewed all 22 exact source keys and
      standardized missing or component-only Korean labels to
      `시분의 심장(Heart of Sibun)`. The English-led quest/lore context and
      aligned Japanese and Chinese identify the same stolen and recovered
      artifact. `Sibun` itself remains unclassified; no alias or separate
      deity/person/place entry was inferred. Existing row dispositions and
      historical translation totals were not reopened or recounted.
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
  HeartOfSibunD21420.prepare
when 'apply'
  HeartOfSibunD21420.apply
else
  abort 'usage: review-heart-of-sibun-D21420.rb [prepare|apply]'
end
