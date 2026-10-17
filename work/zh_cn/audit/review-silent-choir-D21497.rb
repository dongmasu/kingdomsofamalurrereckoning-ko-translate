#!/usr/bin/env ruby

require 'csv'
require 'json'
require_relative 'apply-reviewed-proper-name-discovery'

module SilentChoirD21497
  extend self

  M = ReviewedNameBatches
  D = 21_497
  FACTION = 'faction:silent-choir'
  MONSTER = 'monster:silent-choir-hound'
  FACTION_KOREAN = '침묵의 합창단(Silent Choir)'
  MONSTER_KOREAN = '침묵의 합창단 사냥개(Silent Choir Hound)'
  IDS = %w[
    11273 12361 13120 13562 13694 14803 18956 3082 40438 41162 43581
    44647 46802 47788 48848 50148 51244 56480 5925 60489 63143 63301
    64554 6623 7319 7395
  ].freeze
  HOUND_IDS = %w[7319].freeze
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  KOREAN_VARIANT = /(?:침묵의 성가대|무언의 성가대|성가대)(?:\((?:The )?Silent Choir\))?/
  PARTICLES = { '가' => '이', '는' => '은', '를' => '을', '와' => '과' }.freeze
  SHARED = 'English is the meaning and identity anchor; aligned Japanese 声なき聖歌隊 and Chinese 无声教团 corroborate the named group. No global Choir alias, inferred membership, source edit, or historical translation recount. Preserve unrelated names, wording, tokens, punctuation, and line breaks.'
  FACTION_NOTE = 'English default:13120 describes the Silent Choir as an organized group of faithful followers; default:40438 explicitly calls them Anokatos’s followers, and default:63143 calls them his disciples. The exact rows consistently identify this same named group; Japanese 声なき聖歌隊 and Chinese 无声教团 corroborate. Register only faction:silent-choir as 침묵의 합창단(Silent Choir). Normalize the previously mixed 침묵의 성가대/무언의 성가대 forms, missing annotations, and particles affected by the spelling change within exact source rows. Keep ordinary choir references, Anokatos, and other entities separate.'
  HOUND_NOTE = 'English default:7319 names the Silent Choir Hound; Japanese 声なき聖歌隊の犬 and Chinese 无声教团猎犬 corroborate the named creature. Register only monster:silent-choir-hound as 침묵의 합창단 사냥개(Silent Choir Hound), preserving the complete creature name atomically rather than nesting the faction label inside it.'
  DEFINITIONS_DATA = {
    FACTION => {
      'english' => 'Silent Choir',
      'category' => 'faction',
      'korean' => FACTION_KOREAN,
      'variants' => '침묵의 성가대|무언의 성가대|성가대',
      'ids' => IDS,
      'notes' => FACTION_NOTE
    },
    MONSTER => {
      'english' => 'Silent Choir Hound',
      'category' => 'monster',
      'korean' => MONSTER_KOREAN,
      'variants' => '침묵의 합창단 사냥개',
      'ids' => HOUND_IDS,
      'notes' => HOUND_NOTE
    }
  }.freeze

  def definition(entity, values, headers)
    evidence_ids = values.fetch('ids').map { |id| "default:#{id}" }
    fields = {
      'entity_key' => entity,
      'english_canonical' => values.fetch('english'),
      'category' => values.fetch('category'),
      'korean_canonical' => values.fetch('korean'),
      'english_aliases' => '',
      'korean_variants' => values.fetch('variants'),
      'evidence_ids' => "D-#{D}|#{evidence_ids.join('|')}",
      'status' => 'confirmed',
      'notes' => "#{values.fetch('notes')} #{SHARED}"
    }
    headers.to_h { |header| [header, fields.fetch(header, '')] }
  end

  def definitions(headers)
    DEFINITIONS_DATA.map { |entity, values| definition(entity, values, headers) }
  end

  def expected_pairs
    faction = IDS.map { |id| [FACTION, 'default', id, ''] }
    monster = HOUND_IDS.map { |id| [MONSTER, 'default', id, ''] }
    faction + monster
  end

  def normalize(entity, text, id)
    return text if entity == FACTION && HOUND_IDS.include?(id)
    if entity == MONSTER
      source = '침묵의 합창단 사냥개'
      raise "Silent Choir Hound Korean source differs #{id}" unless text.scan(source).length == 1
      return text.sub(source, MONSTER_KOREAN)
    end

    text.gsub(/침묵의 합창단\(The Silent Choir\)/, FACTION_KOREAN)
        .gsub(/(#{KOREAN_VARIANT})(가|는|를|와)/) do
          "#{FACTION_KOREAN}#{PARTICLES.fetch(Regexp.last_match(2))}"
        end
        .gsub(KOREAN_VARIANT, FACTION_KOREAN)
        .gsub(/침묵의 합창단(?!\([^)]*Silent Choir[^)]*\))/, FACTION_KOREAN)
  end

  def reviews_for(inventory, generated)
    actual_pairs = generated.map { |row| [row.fetch('entity_key'), *M.key(row)] }
    raise 'Silent Choir exact source scope differs' unless
      actual_pairs.sort == expected_pairs.sort

    generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, occurrences|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      japanese = JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n")
      chinese = source.fetch('zh_text')
      korean = source.fetch('work_text')
      dispositions = {}
      evidence = []
      new_text = korean
      occurrences.each do |occurrence|
        entity = occurrence.fetch('entity_key')
        values = DEFINITIONS_DATA.fetch(entity)
        pattern = /(?<![A-Za-z0-9_])#{Regexp.escape(values.fetch('english'))}(?![A-Za-z0-9_])/i
        raise "English evidence differs #{entity} #{key.inspect}" unless english.match?(pattern)
        japanese_pattern = entity == MONSTER ? /声なき聖歌隊の犬/ : /声なき聖歌隊/
        chinese_pattern = entity == MONSTER ? /无声教团猎犬/ : /无声教团/
        raise "Japanese evidence differs #{entity} #{key.inspect}" unless japanese.match?(japanese_pattern)
        raise "Chinese evidence differs #{entity} #{key.inspect}" unless chinese.match?(chinese_pattern)

        disposition = entity == FACTION && HOUND_IDS.include?(key[1]) ? 'excluded' : nil
        if disposition.nil?
          new_text = normalize(entity, new_text, key[1])
          disposition = new_text == korean ? 'not-an-issue' : 'accepted'
        end
        dispositions[entity] = disposition
        evidence << values.fetch('notes')
      end
      status = if new_text != korean
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      entities = occurrences.map { |row| row.fetch('entity_key') }.sort
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => entities.join('|'), 'status' => status, 'old' => korean,
        'new' => new_text,
        'evidence' => "#{evidence.uniq.join(' ')} #{SHARED}",
        'english' => english, 'japanese' => japanese, 'chinese' => chinese,
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
  end

  def prepare
    glossary_table = M.table(File.join(__dir__, 'proper-name-glossary.tsv'))
    glossary = glossary_table.map(&:to_h)
    existing = glossary.map { |row| row.fetch('entity_key') }
    raise 'Silent Choir entity already registered' unless
      (DEFINITIONS_DATA.keys & existing).empty?
    ReviewedProperNameDiscovery.ensure_unused_batch!(D)
    raise 'discovery outputs already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }

    inventory = M.refresh_inventory
    definition_rows = definitions(glossary_table.headers)
    generated = build_occurrences(inventory.values, definition_rows).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    index = M.table(M::INDEX).map(&:to_h)
    reviews = reviews_for(inventory, generated)
    ReviewedProperNameDiscovery.validate!(
      definition_rows, reviews, generated, glossary, index
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)

    edits = reviews.count { |row| row['old'] != row['new'] }
    puts "Prepared D-#{D}: #{reviews.length} exact row keys, " \
         "#{expected_pairs.length} entity matches; #{edits} Korean edits."
    reviews.each do |row|
      puts JSON.generate(row.slice('resource', 'ID_Linha', 'status', 'old', 'new'))
    end
    [definition_rows, reviews]
  end

  def append_detail(path, section)
    text = File.read(path)
    return if text.include?('### D-21497: Silent Choir')

    marker = '<!-- current-proper-name-batch:end -->'
    raise "missing current batch marker in #{path}" unless text.include?(marker)
    text.sub!(marker, "#{marker}\n\n#{section}")
    File.write(path, text)
  end

  def apply
    glossary_path = ReviewedProperNameDiscovery::GLOSSARY
    prior_glossary = M.table(glossary_path)
    prior_records = M.table(M::INDEX).map(&:to_h).to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)],
       row.reject { |field, _| field == 'korean_current' }]
    end
    definition_rows, reviews = prepare
    M.write_table(DEFINITIONS, prior_glossary.headers, definition_rows)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    ReviewedProperNameDiscovery.run([DEFINITIONS, REVIEWS, D.to_s])

    final_index = M.table(M::INDEX).map(&:to_h)
    final_records = final_index.to_h do |row|
      [[row.fetch('entity_key'), *M.key(row)],
       row.reject { |field, _| field == 'korean_current' }]
    end
    prior_records.each do |key, record|
      raise "prior occurrence changed #{key.inspect}" unless
        final_records[key] == record
    end
    expected_additions = expected_pairs
    raise 'unexpected occurrence additions' unless
      (final_records.keys - prior_records.keys).sort == expected_additions.sort
    final_glossary = M.table(glossary_path).map(&:to_h)
    raise 'prior glossary records changed' unless
      final_glossary == prior_glossary.map(&:to_h) + definition_rows

    detail = <<~TEXT.chomp
      ### D-21497: Silent Choir

      Registered `faction:silent-choir` as `침묵의 합창단(Silent Choir)` and
      `monster:silent-choir-hound` as
      `침묵의 합창단 사냥개(Silent Choir Hound)`. Reviewed
      #{IDS.length} faction-name source keys and the complete creature name at
      default:7319 (#{expected_pairs.length} entity matches across
      #{IDS.length} distinct row keys).
      English default:13120 describes the group of faithful followers;
      default:40438 explicitly calls them Anokatos's followers, and
      default:63143 calls them his disciples. Aligned Japanese
      声なき聖歌隊 and Chinese 无声教团 corroborate. Normalized the
      source-matched `침묵의 성가대`, `무언의 성가대`, and unannotated forms
      only in faction rows, correcting particles where the canonical Korean
      name's final consonant required it. The Hound label remains atomic;
      ordinary choir references, other entities, and historical findings
      were not reopened or recounted.
    TEXT
    [
      File.join(__dir__, "named-scope-review-D#{D}-#{M::RUN_DATE_COMPACT}.md"),
      File.join(__dir__, "named-scope-edit-addendum-D#{D}-#{M::RUN_DATE_COMPACT}.md")
    ].each do |path|
      File.open(path, 'a') { |file| file.write("\n\n#{detail}\n") }
    end
    M::DOCS.each { |path| append_detail(path, detail) }
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'usage: review-silent-choir-D21497.rb [prepare|apply]' if ARGV.length > 1
  case ARGV.fetch(0, 'prepare')
  when 'prepare' then SilentChoirD21497.prepare
  when 'apply' then SilentChoirD21497.apply
  else abort 'usage: review-silent-choir-D21497.rb [prepare|apply]'
  end
end
