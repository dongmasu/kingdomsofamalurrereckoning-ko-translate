#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module FomoriansD21421
  extend self

  M = ReviewedNameBatches
  D = 21_421
  ENTITY = 'people:fomorians'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")

  def definition(glossary)
    glossary.headers.to_h do |header|
      value = case header
              when 'entity_key' then ENTITY
              when 'english_canonical' then 'Fomorians'
              when 'category' then 'people'
              when 'korean_canonical' then '포모리안족(Fomorians)'
              when 'english_aliases' then ''
              when 'korean_variants' then '포모르족|포모리안'
              when 'evidence_ids' then 'D-21421'
              when 'status' then 'confirmed'
              when 'notes'
                'English identifies the Fomorians as a named people; Japanese 巨人族 identifies a giant race in the title context, and Chinese 佛莫尔 corroborates the group name. Standardize the active Korean group form to 포모리안족(Fomorians). Do not merge this people entry with Pombero or infer a separate individual.'
              end
      [header, value]
    end
  end

  def normalize(text)
    text
      .gsub(/포모르족\(Fomorians\)/i, '포모리안족(Fomorians)')
      .gsub(/포모리안족(?!\(Fomorians\))/i, '포모리안족(Fomorians)')
      .gsub(/포모리안(?!족|\(Fomorians\))/i, '포모리안족(Fomorians)')
  end

  def prepare
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    raise "#{ENTITY} already registered" if glossary.any? { |row| row['entity_key'] == ENTITY }
    raise 'D-21421 artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    definitions = [definition(glossary)]
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "Fomorians source scope changed: #{generated.length}" unless generated.length == 3

    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "missing aligned source locale at #{key.inspect}" if
        [english, japanese, chinese].any?(&:empty?)
      raise "source people-name differs at #{key.inspect}" unless
        english.match?(/(?<![A-Za-z])Fomorians(?![A-Za-z])/i)

      new_text = normalize(old)
      raise "Korean people-name span absent at #{key.inspect}" unless
        new_text.include?('포모리안족(Fomorians)')
      status = new_text == old ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1],
        'Tipo_Variante' => key[2], 'entity_key' => ENTITY,
        'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => 'English identifies the named Fomorians people; Japanese and Chinese corroborate the group/race reading. Standardize the full Korean label to 포모리안족(Fomorians), without inferring an individual identity or changing the separate Pombero/Mabinogi names.',
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

      ## D-#{D}: Fomorians

      Registered the named people group `Fomorians` as `people:fomorians`,
      using `포모리안족(Fomorians)` consistently across all three source keys.
      English identifies the group; Japanese 巨人族 and Chinese 佛莫尔 support
      the race/name reading. The previous `포모르족` spelling was standardized
      only within this new entity scope. Pombero and Mabinogi remain separate;
      no individual identity or global alias was inferred. Historical row
      dispositions and translation totals were not reopened or recounted.
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
  FomoriansD21421.prepare
when 'apply'
  FomoriansD21421.apply
else
  abort 'usage: review-fomorians-D21421.rb [prepare|apply]'
end
