#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module ChernobogD21419
  extend self

  M = ReviewedNameBatches
  D = 21_419
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  ENTITY = 'monster:chernobog'

  def definition(glossary)
    glossary.headers.to_h do |header|
      value = case header
              when 'entity_key' then ENTITY
              when 'english_canonical' then 'Chernobog'
              when 'category' then 'monster'
              when 'korean_canonical' then '체르노보그(Chernobog)'
              when 'english_aliases' then ''
              when 'korean_variants' then '체르노보그'
              when 'evidence_ids' then 'D-21419'
              when 'status' then 'confirmed'
              when 'notes'
                'English repeatedly identifies Chernobog as the legendary bolgan champion/beast. Japanese and Chinese corroborate the same named creature. Keep this entity distinct from the general bolgan species and from the separately registered Chernobog item titles; do not add a global alias.'
              end
      [header, value]
    end
  end

  def add_missing_labels(text)
    updated = text.dup
    matches = updated.to_enum(:scan, /체르노보그/).map { Regexp.last_match.dup }
    matches.reverse_each do |match|
      before = updated[0...match.begin(0)]
      next if before.count('(') > before.count(')')

      after = updated[match.end(0)..]
      next if after.match?(/\A\s*\(\s*Chernobog\b/i)

      next_open = after.index('(')
      if next_open && next_open <= 24
        segment = after[0...next_open]
        label = after[(next_open + 1)..].to_s[/\A[^()]*/].to_s
        next if !segment.match?(/[.!?。！？\r\n]/) &&
          label.match?(/\bChernobog\b/i)
      end

      updated[match.begin(0)...match.end(0)] = '체르노보그(Chernobog)'
    end
    updated
  end

  def prepare
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    raise "#{ENTITY} already registered" if glossary.any? { |row| row['entity_key'] == ENTITY }
    raise 'D-21419 artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    definitions = [definition(glossary)]
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    raise "Chernobog source scope changed: #{generated.length}" unless generated.length == 27

    reviews = generated.map do |occurrence|
      key = M.key(occurrence)
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      raise "missing aligned source locale at #{key.inspect}" if
        [english, japanese, chinese].any?(&:empty?)
      raise "Korean Chernobog span absent at #{key.inspect}" unless old.include?('체르노보그')
      raise "source identity differs at #{key.inspect}" unless
        english.match?(/(?<![A-Za-z])Chernobog(?![A-Za-z])/i)

      new_text = add_missing_labels(old)
      status = new_text == old ? 'not-an-issue' : 'accepted'
      {
        'resource' => key[0], 'ID_Linha' => key[1],
        'Tipo_Variante' => key[2], 'entity_key' => ENTITY,
        'status' => status, 'old' => old, 'new' => new_text,
        'evidence' => 'English identifies Chernobog as the same legendary bolgan champion/beast; aligned Japanese and Chinese corroborate the named creature. Add only missing standalone bilingual name labels. Preserve complete bilingual item titles and all prior dispositions for other entities on this row.',
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

      ## D-#{D}: Chernobog

      Registered `Chernobog` as `monster:chernobog`, the named legendary
      Bolgan champion/beast, based on repeated explicit English descriptions
      and corroborating Japanese and Chinese. Reviewed all 27 exact source
      keys and added the bilingual name only where missing. Complete
      `Chernobog's Eye` and `Chernobog's Offering` item labels remain atomic;
      their existing item dispositions and all `monster:bolgan` dispositions
      were not reopened. No global alias or historical translation recount
      was added.
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
  ChernobogD21419.prepare
when 'apply'
  ChernobogD21419.apply
else
  abort 'usage: review-chernobog-D21419.rb [prepare|apply]'
end
