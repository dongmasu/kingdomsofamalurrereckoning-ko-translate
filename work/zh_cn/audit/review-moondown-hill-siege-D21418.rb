#!/usr/bin/env ruby

require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module MoondownHillSiegeD21418
  extend self

  M = ReviewedNameBatches
  D = 21_418
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  TARGETS = {
    ['place:moondown-hill', 'default', '18931', ''] => {
      'new' => '그들이 여기서 우리를 묶어 두면 남쪽, 문다운 언덕(Moondown Hill) 근처와 알라바스트라(Alabastra) 중부 깊숙한 곳에서 강력한 반격을 준비할 시간을 벌게 돼.',
      'evidence' => 'English explicitly names Moondown Hill as a southern geographic location; Japanese 月入りの丘 and Chinese 月落山 corroborate the hill. Register it separately from Camp Moondown. Add only the missing bilingual place label and preserve the sentence and Alabastra entity.'
    },
    ['event:siege-of-moondown', 'default', '48571', ''] => {
      'new' => '문다운 포위전(The Siege of Moondown)',
      'evidence' => 'English presents The Siege of Moondown as a standalone named historical event/title. Japanese 月入りの丘の包囲 and Chinese 月落营地之围 corroborate the siege and its place. Register the event separately from both Camp Moondown and Moondown Hill; add the complete bilingual title without nesting a place label.'
    },
    ['event:siege-of-moondown', 'default', '58659', ''] => {
      'new' => '문다운 포위전(The Siege of Moondown)',
      'evidence' => 'English presents The Siege of Moondown as a standalone named historical event/title; Japanese 月入りの丘の包囲 and Chinese 月落营地之围 corroborate it. Standardize the Korean typo 무운다운 and add the complete bilingual event title. Keep this event distinct from Camp Moondown and Moondown Hill.'
    }
  }.freeze

  def definition(glossary, entity, canonical, korean, category, evidence, notes, variants)
    glossary.headers.to_h do |header|
      value = case header
              when 'entity_key' then entity
              when 'english_canonical' then canonical
              when 'category' then category
              when 'korean_canonical' then "#{korean}(#{canonical})"
              when 'english_aliases' then ''
              when 'korean_variants' then variants
              when 'evidence_ids' then evidence
              when 'status' then 'confirmed'
              when 'notes' then notes
              end
      [header, value]
    end
  end

  def paths
    [DEFINITIONS, REVIEWS]
  end

  def prepare
    glossary = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    definitions = [
      definition(
        glossary, 'place:moondown-hill', 'Moondown Hill', '문다운 언덕',
        'place', 'D-21418|default:18931',
        'English explicitly names the hill near the southern counterattack route. Japanese 月入りの丘 and Chinese 月落山 corroborate the landform. This is a distinct geographic place from Camp Moondown; do not merge the two names or register bare Moondown as a global alias.',
        '문다운 언덕'
      ),
      definition(
        glossary, 'event:siege-of-moondown', 'The Siege of Moondown',
        '문다운 포위전', 'named event',
        'D-21418|default:48571|default:58659',
        'English presents The Siege of Moondown as a named historical event/title. Japanese 月入りの丘の包囲 and Chinese 月落营地之围 corroborate the siege. Keep this event separate from Camp Moondown and Moondown Hill; bare Moondown is not a global alias.',
        '문다운 포위전|무운다운 포위전'
      )
    ]
    raise 'D-21418 discovery artifacts already exist' if paths.any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = TARGETS.keys.sort
    actual = generated.map do |row|
      [row.fetch('entity_key'), *M.key(row)]
    end.sort
    raise "Moondown Hill/siege source scope changed: #{actual.inspect}" unless actual == expected

    reviews = generated.map do |occurrence|
      key = [occurrence.fetch('entity_key'), *M.key(occurrence)]
      source = inventory.fetch(M.key(occurrence))
      decision = TARGETS.fetch(key)
      old = source.fetch('work_text')
      new_text = decision.fetch('new')
      raise "stale Korean source at #{key.inspect}" if old == new_text
      raise "missing aligned source locale at #{key.inspect}" if
        [source.fetch('en_texts_json'), source.fetch('ja_texts_json'),
         source.fetch('zh_text')].any?(&:empty?)
      english = JSON.parse(source.fetch('en_texts_json') || '[]').compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json') || '[]').compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      {
        'resource' => key[1], 'ID_Linha' => key[2],
        'Tipo_Variante' => key[3], 'entity_key' => key[0],
        'status' => 'accepted', 'old' => old, 'new' => new_text,
        'evidence' => decision.fetch('evidence'), 'english' => english,
        'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(key[0] => 'accepted')
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

      ## D-#{D}: Moondown Hill And Siege

      Registered `Moondown Hill` as the separate place `문다운 언덕(Moondown
      Hill)` and `The Siege of Moondown` as the named event `문다운 포위전(The
      Siege of Moondown)`. Reviewed all three exact source keys and corrected
      all three Korean cells, including the existing `무운다운` typo. English
      is primary; Japanese and Chinese corroborate the landform and siege.
      Neither entry is merged with Camp Moondown, and no bare `Moondown` global
      alias was added. No historical translation totals were recounted.
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
  MoondownHillSiegeD21418.prepare
when 'apply'
  MoondownHillSiegeD21418.apply
else
  abort 'usage: review-moondown-hill-siege-D21418.rb [prepare|apply]'
end
