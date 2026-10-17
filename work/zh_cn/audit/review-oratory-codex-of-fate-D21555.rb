#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module OratoryCodexOfFateD21555
  extend self
  M = ReviewedNameBatches
  D = 21_555
  ORATORY = 'place:oratory'
  BALLADS = 'place:ballads-oratory'
  HOUSE = 'place:house-oratory'
  CODEX = 'item:codex-of-fate'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  ORATORY_IDS = %w[271 4627 5668 7060 17684 20804 25940 27115 36885 46875 50946 54202 57337 59225 59299 61496].freeze
  CODEX_IDS = %w[13240 58611 61025 64389].freeze
  COMPOUND_KEYS = [['base', '32', '11'], ['default', '27115', ''], ['default', '5668', '']].freeze
  ORATORY_SPAN = /(?:오라토리움|기도실|연설장|예배당|기도소)(?:\((?:The )?Oratory\))?/
  CODEX_SPAN = /운명의 (?:서|법전)(?:\(Codex of Fate\))?/
  ORATORY_NOTE = 'English default:61496 identifies the Oratory as an ancient House of Ballads palace in Ettinmere; default:25940 places King Wencen there, and default:46875 identifies its former use as a performance venue. Japanese 祈祷場 and Chinese 演讲厅/奥拉特里 corroborate the referent but do not decide a single literal Korean gloss. Reuse the existing paired 오라토리움(Oratory) from default:46875/61496 rather than inconsistently translating it as 기도실, 연설장, 예배당 or 기도소. Retain The in complete standalone labels. Both explicitly written Oratory mentions at default:17684 are paired. Do not alter neighboring character, faction or court annotations or infer the literal prayer/performance function from the name alone.'
  COMPOUND_NOTE = 'Ballads Oratory and House Oratory are complete source-local labels. Pair each complete name atomically and exclude the nested Oratory occurrence. Ballads Oratory retains the existing expanded Korean 발라드의 집, corroborated by Japanese ハウス・オブ・バラッドの祈祷場; House Oratory retains 하우스 and uses the consistent 오라토리움 stem. The contextual descriptions support a House venue in Ettinmere but no global alias or claim of identical/distinct physical buildings is introduced. Earlier House of Ballads dispositions are preserved; Ballads remains visible in the complete English label.'
  CODEX_NOTE = 'English default:13240 calls the Codex of Fate no simple lorestone and says a Loremaster of Ballads may interpret it. Three matching standalone labels use Japanese 運命の書, with 宿命の書 in that description, and Chinese 命运法典. Reuse the already paired 운명의 서(Codex of Fate), normalizing only the isolated 법전 spelling. Register this exact English source name independently: no evidence here proves whether Codex of Fate and the already registered Codex of Destiny are the same or different physical artifact. Do not merge their entities, English aliases or historical dispositions.'
  COMMON = 'English is the meaning and identity anchor; Japanese and Chinese are supporting evidence. The official Korean manual supplies world/quest context but no direct Oratory or Codex title. No PAK/PAK-derived inspection, source modification or historical global tally recount.'
  DETAIL = <<~TEXT.chomp
    ### D-21555: Oratory And Codex Of Fate

    Reviewed 21 distinct row keys / 24 new entity matches across all three
    resources (no affix matches). Reused the already paired
    `오라토리움(Oratory)` from two English-led location descriptions to
    normalize 기도실/연설장/예배당/기도소 in this exact place scope.
    The four complete `The Oratory` labels retain their source article.
    Full `Ballads Oratory` and `House Oratory` labels are paired atomically,
    with their nested Oratory matches excluded; no global location alias
    or building-equivalence claim is added.

    Registered the complete source name `운명의 서(Codex of Fate)` across
    four exact keys, correcting the isolated 법전 variant. This does not
    merge it with `Codex of Destiny` or assert separate physical objects.
    Their identity relationship remains unproved. All unrelated earlier
    name/entity dispositions on shared rows remain unchanged.
    Full proper-name discovery remains incomplete.
  TEXT

  def definitions(headers)
    configs = [
      [ORATORY, 'Oratory', '오라토리움(Oratory)', 'place', 'The Oratory',
       '오라토리움|기도실|연설장|예배당|기도소', ORATORY_NOTE],
      [BALLADS, 'Ballads Oratory', '발라드의 집 오라토리움(Ballads Oratory)',
       'place', '', '발라드의 집(House of Ballads) 기도실', COMPOUND_NOTE],
      [HOUSE, 'House Oratory', '하우스 오라토리움(House Oratory)',
       'place', '', '하우스 오라토리(House Oratory)', COMPOUND_NOTE],
      [CODEX, 'Codex of Fate', '운명의 서(Codex of Fate)', 'item', '',
       '운명의 서|운명의 법전', CODEX_NOTE]
    ]
    configs.map do |entity, english, korean, category, aliases, variants, note|
      fields = {
        'entity_key' => entity, 'english_canonical' => english,
        'korean_canonical' => korean, 'category' => category,
        'english_aliases' => aliases, 'korean_variants' => variants,
        'evidence_ids' => "D-#{D}", 'status' => 'confirmed',
        'notes' => "#{note} #{COMMON}"
      }
      headers.to_h { |header| [header, fields.fetch(header, '')] }
    end
  end

  def expected_pairs
    [
      [ORATORY, 'base', '32', '11'],
      *ORATORY_IDS.map { |id| [ORATORY, 'default', id, ''] },
      [BALLADS, 'base', '32', '11'], [BALLADS, 'default', '27115', ''],
      [HOUSE, 'default', '5668', ''],
      *CODEX_IDS.map { |id| [CODEX, 'default', id, ''] }
    ]
  end

  def transform(key, english, old, entities)
    if entities.include?(BALLADS)
      raise 'Ballads Oratory Korean span differs' unless old == '발라드의 집(House of Ballads) 기도실'
      '발라드의 집 오라토리움(Ballads Oratory)'
    elsif entities.include?(HOUSE)
      from = '하우스 오라토리(House Oratory)'
      raise 'House Oratory span differs' unless old.scan(from).length == 1
      old.sub(from, '하우스 오라토리움(House Oratory)')
    elsif entities.include?(CODEX)
      raise 'Codex of Fate span differs' unless old.scan(CODEX_SPAN).length == 1
      old.sub(CODEX_SPAN, '운명의 서(Codex of Fate)')
    else
      expected = key == ['default', '17684', ''] ? 2 : 1
      raise "Oratory source/Korean spans differ #{key.inspect}" unless
        english.scan(/(?<![A-Za-z])Oratory(?![A-Za-z])/).length == expected &&
        old.scan(ORATORY_SPAN).length == expected
      label = english == 'The Oratory' ? english : 'Oratory'
      old.gsub(ORATORY_SPAN, "오라토리움(#{label})")
    end
  end

  def review_rows(inventory, generated)
    actual = generated.map { |row| [row['entity_key'], *M.key(row)] }
    raise 'Oratory/Codex exact source scope differs' unless actual.sort == expected_pairs.sort
    rows = generated.group_by { |row| M.key(row) }.map do |key, occurrences|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      entities = occurrences.map { |row| row['entity_key'] }
      new_text = transform(key, english, old, entities)
      dispositions = entities.to_h do |entity|
        status = entity == ORATORY && COMPOUND_KEYS.include?(key) ? 'excluded' :
          new_text == old ? 'not-an-issue' : 'accepted'
        [entity, status]
      end
      notes = entities.map do |entity|
        case entity
        when ORATORY then ORATORY_NOTE
        when CODEX then CODEX_NOTE
        else COMPOUND_NOTE
        end
      end.uniq
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entities.sort.join('|'),
        'status' => new_text == old ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => new_text, 'evidence' => "#{notes.join(' ')} #{COMMON}",
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions.sort.to_h)
      }
    end
    rows.sort_by { |row| key = M.key(row); [M::RESOURCES.index(key[0]), key[1].to_i, key[2]] }
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    definitions = definitions(glossary.headers)
    inventory = M.table(M::INVENTORY).map(&:to_h).to_h { |row| [M.key(row), row] }
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    rows = review_rows(inventory, generated)
    raise 'Oratory/Codex distinct row count differs' unless rows.length == 21
    ReviewedProperNameDiscovery.validate!(
      definitions, rows, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(rows, inventory)
    puts "D-#{D}: #{rows.length} keys; #{generated.length} matches; #{rows.count { |row| row['old'] != row['new'] }} edits; prepare only."
    [glossary.headers, definitions, rows]
  end

  def apply
    headers, definitions, rows = prepare
    prior = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row['entity_key'], *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    M.write_table(DEFINITIONS, headers, definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), rows)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    current = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row['entity_key'], *M.key(row)], row.reject { |field, _| field == 'korean_current' }]
    end
    prior.each { |key, value| raise "prior decision changed #{key.inspect}" unless current[key] == value }
    raise 'unexpected Oratory/Codex index additions' unless (current.keys - prior.keys).sort == expected_pairs.sort
    paths = M::DOCS + %w[review edit-addendum].map do |kind|
      File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    end
    paths.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      if text.include?(marker)
        File.write(path, text.sub(marker, "#{marker}\n\n#{DETAIL}"))
      else
        File.open(path, 'a') { |file| file.write("\n\n#{DETAIL}\n") }
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then OratoryCodexOfFateD21555.prepare
  when ['apply'] then OratoryCodexOfFateD21555.apply
  else abort 'usage: review-oratory-codex-of-fate-D21555.rb [prepare|apply]'
  end
end
