#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewHighCourtOrganizationsD21567
  extend self
  M = ReviewedNameBatches
  D = 21_567
  WINTER = 'organization:high-court-of-winter'
  SEELIE = 'organization:high-court-of-seelie-ysa'
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  CONFIG = {
    WINTER => {
      'english_canonical' => 'High Court of Winter',
      'korean_canonical' => '겨울 상궁정(High Court of Winter)',
      'category' => 'organization',
      'english_aliases' => '',
      'korean_variants' => '겨울 궁정|겨울 상궁정',
      'evidence_ids' => "D-#{D}|default:7155",
      'notes' => <<~TEXT.chomp
        English default:7155 explicitly calls the wearer's group a member of
        the High Court of Winter. Japanese and Chinese describe a member of
        the Winter Court but do not erase English's explicit High designation.
        Register this complete institutional name separately from the faction
        Winter Court; the membership wording does not make either phrase a
        global alias for the other or establish separate polity mechanics.
        Use 겨울 상궁정(High Court of Winter). Preserve the necklace, God Storm,
        Fae and every prior entity disposition on the shared row.
      TEXT
    },
    SEELIE => {
      'english_canonical' => 'High Court of the Seelie in Ysa',
      'korean_canonical' => '이사에 있는 실리 상궁정(High Court of the Seelie in Ysa)',
      'category' => 'organization',
      'english_aliases' => 'High Court',
      'korean_variants' => '이사에 있는 실리 궁정의 고등 법정|상궁정',
      'evidence_ids' => "D-#{D}|default:31067|default:57728",
      'notes' => <<~TEXT.chomp
        English default:57728 explicitly names the High Court of the Seelie in
        Ysa and says it directs member Houses to remain neutral; Japanese
        identifies the Seelie Court in Ysa and Chinese explicitly renders a
        high court. In the Ysa-history chapter at default:31067, the sitting
        High Court names the city after Ysa; Japanese 上宮廷 and Chinese 高等宫廷
        corroborate the institutional reading. Treat High Court as a
        source-local short form only for that passage, not a global alias:
        default:14300 and default:25940 do not identify the same polity, and
        lowercase default:57388 is generic. Keep this organization distinct
        from the broader Summer Court and from High Court of Winter. Reuse
        이사에 있는 실리 상궁정(High Court of the Seelie in Ysa) and
        상궁정(High Court) in the historical short reference. The pre-existing
        uncertain Ysa disposition at default:57728 and every other row/entity
        decision remain untouched.
      TEXT
    }
  }.freeze
  IDS = {
    WINTER => %w[7155],
    SEELIE => %w[7155 14300 25940 31067 57388 57728]
  }.freeze
  COMMON = 'English controls identity and meaning; Japanese and Chinese corroborate only where aligned. The official Korean manual provides no direct entry for these institutions. No PAK/PAK-derived inspection, source edit, prior-entity disposition change, or historical tally recount.'

  def definitions(headers)
    CONFIG.map do |entity, fields|
      values = fields.merge(
        'entity_key' => entity,
        'status' => 'confirmed',
        'notes' => "#{fields.fetch('notes')} #{COMMON}"
      )
      headers.to_h { |header| [header, values.fetch(header, '')] }
    end
  end

  def key_for(resource, id)
    [resource, id, '']
  end

  def prepare
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    entity_definitions = definitions(glossary.headers)
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, entity_definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = IDS.flat_map do |entity, ids|
      ids.map { |id| [entity, 'default', id, ''] }
    end
    actual = generated.map do |row|
      [row.fetch('entity_key'), row.fetch('resource'), row.fetch('ID_Linha'), row.fetch('Tipo_Variante')]
    end
    raise 'High Court exact source coverage differs' unless actual.sort == expected.sort

    rows = expected.map { |entity, resource, id, variant| [entity, resource, id, variant] }
      .group_by { |_entity, resource, id, variant| [resource, id, variant] }
      .map do |key, entity_rows|
        source = inventory.fetch(key)
        english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
        japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
        chinese = source.fetch('zh_text')
        old = source.fetch('work_text')
        new_text = old.dup
        dispositions = {}
        entities = entity_rows.map(&:first).sort
        entities.each do |entity|
          case [entity, key[1]]
          when [WINTER, '7155']
            raise 'unexpected Winter High Court source text' unless
              english.match?(/High Court of Winter/) &&
              old.include?('겨울 궁정(High Court of Winter)')
            new_text.sub!(
              '겨울 궁정(High Court of Winter)',
              '겨울 상궁정(High Court of Winter)'
            )
            dispositions[entity] = 'accepted'
          when [SEELIE, '31067']
            raise 'unexpected Ysa-history short reference' unless
              english.include?('the sitting High Court') &&
              japanese.include?('上宮廷') && chinese.include?('高等宫廷') &&
              old.include?('당시의 상궁정은')
            new_text.sub!('당시의 상궁정은', '당시의 상궁정(High Court)은')
            dispositions[entity] = 'accepted'
          when [SEELIE, '57728']
            raise 'unexpected complete Seelie High Court source text' unless
              english.include?('High Court of the Seelie in Ysa') &&
              old.include?('이사에 있는 실리 궁정의 고등 법정')
            new_text.sub!(
              '이사에 있는 실리 궁정의 고등 법정',
              '이사에 있는 실리 상궁정(High Court of the Seelie in Ysa)'
            )
            dispositions[entity] = 'accepted'
          when [SEELIE, '7155']
            dispositions[entity] = 'excluded'
          when [SEELIE, '14300'], [SEELIE, '25940']
            dispositions[entity] = 'excluded'
          when [SEELIE, '57388']
            dispositions[entity] = 'excluded'
          else
            raise "unexpected High Court entity/key #{[entity, key].inspect}"
          end
        end
        {
          'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
          'entity_key' => entities.join('|'),
          'status' => old == new_text ? 'excluded' : 'accepted',
          'old' => old, 'new' => new_text,
          'evidence' => "#{entities.map { |entity| CONFIG.fetch(entity).fetch('notes') }.join(' ')} #{COMMON}",
          'english' => english, 'japanese' => japanese, 'chinese' => chinese,
          'entity_dispositions_json' => JSON.generate(dispositions.sort.to_h)
        }
      end.sort_by { |row| row['ID_Linha'].to_i }
    raise 'High Court review row count differs' unless rows.length == 6
    raise 'High Court duplicate review row' unless rows.map { |row| M.key(row) }.uniq.length == rows.length
    ReviewedProperNameDiscovery.validate!(
      entity_definitions, rows, generated, glossary.map(&:to_h), M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(rows, inventory)
    puts "D-#{D} preparation: #{rows.length} default rows; #{generated.length} entity-row matches; #{rows.count { |row| row['old'] != row['new'] }} edits; prepare only."
    [glossary.headers, entity_definitions, rows]
  end

  def apply
    headers, entity_definitions, rows = prepare
    M.write_table(DEFINITIONS, headers, entity_definitions)
    M.write_table(REVIEWS, M::HEADERS.take(12), rows)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Qualified High Courts

      Reviewed six distinct default rows / seven entity-row matches. Registered
      `겨울 상궁정(High Court of Winter)` as a complete organization distinct
      from, and not an alias for, the `Winter Court` faction. Registered
      `이사에 있는 실리 상궁정(High Court of the Seelie in Ysa)` as a separate
      organization; the Ysa-history reference `상궁정(High Court)` is linked
      only in that exact context. The three unqualified High Court contexts
      at default:14300, 25940 and 57388 do not establish the same institution
      and remain unchanged/excluded. Prior decisions on default:7155,
      default:31067 and default:57728, including the uncertain Ysa match, were
      preserved. The two approved labels were the only Texto changes.
      Full proper-name discovery remains incomplete.
    TEXT
    paths = M::DOCS + %w[review edit-addendum].map do |kind|
      File.join(__dir__, "named-scope-#{kind}-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    end
    paths.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      if text.include?(marker)
        File.write(path, text.sub(marker, "#{marker}\n\n#{detail}"))
      else
        File.open(path, 'a') { |file| file.write("\n\n#{detail}\n") }
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewHighCourtOrganizationsD21567.prepare
  when ['apply'] then ReviewHighCourtOrganizationsD21567.apply
  else abort 'usage: review-high-court-organizations-D21567.rb [prepare|apply]'
  end
end
