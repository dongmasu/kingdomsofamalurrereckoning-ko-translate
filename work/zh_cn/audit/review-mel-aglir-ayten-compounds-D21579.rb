#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewMelAglirAytenCompoundsD21579
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_579
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  DATA = [
    ['person:lerkara-fel', 'Lerkara Fel', '레르카라 펠', 'Lerkara Fell', 22,
     'English default:6758 identifies the missing Scholia Arcana Adept Lerkara Fel; the letter, Mel Aglir investigation, rescue and display names identify this same complete personal name. Japanese ラーカラ・フェル and Chinese 勒卡拉·费尔 corroborate. Reuse established 레르카라 펠 and replace split given-name/surname annotations with one full-name pair. Default:37428 instead spells Lerkara Fell; its matching objective and Japanese/Chinese names support a full-name spelling alias, but preserve source-local Fell there. Do not register a global Fel, Fell or Lerkara alias.'],
    ['person:patrick-morkan', 'Patrick Morkan', '패트릭 모르칸', '', 22,
     'English default:14436 explicitly self-identifies Patrick Morkan, and the Mel Aglir investigation, rescue, house and key references use this full name. Japanese パトリック・モーカン and Chinese 帕特里克·莫尔坎 corroborate. Reuse consistent 패트릭 모르칸. At default:39080 the English has the full Patrick Morkan, while the current parenthetical says only Morkan; complete that annotation without changing the diary text. No global Morkan alias.'],
    ['person:kellis-cen', 'Kellis Cen', '켈리스 센', '', 4,
     'English default:4071 self-identifies Kellis Cen and default:60152 identifies the Ayten inn journal owner with this full name. Japanese ケリス・セン and Chinese 克尔里斯·岑 / 凯里斯·森 corroborate. Preserve existing 켈리스 센 and pair the unannotated display name at default:31539. Do not expand short Kellis or infer a family identity from Cen.'],
    ['person:rikka-egest', 'Rikka Egest', '리카 이게스트', '', 5,
     'English default:4023 identifies the journal found in Rikka Egest\'s bedroom, with matching display names and the mission anecdote at default:25329. Japanese リッカ・イジェスト and Chinese 丽卡·埃格斯特 corroborate. Preserve the consistent 리카 이게스트 full name. Do not reopen the separate Egest surname identity or introduce a global short-name alias.']
  ].freeze
  TITLE_KEYS = {
    ['default', '41777', ''] => 'person:lerkara-fel',
    ['default', '37896', ''] => 'person:patrick-morkan',
    ['default', '22140', ''] => 'person:rikka-egest'
  }.freeze
  CONTEXT = <<~TEXT.chomp
    Review four explicit full personal names across affix/base/default:
    48 distinct source row keys and 53 entity-row matches, including the
    source-local Lerkara Fell spelling. Two base keys; no affix matches.
    English anchors identity, Japanese informs pronunciation and Chinese
    corroborates. The official Korean manual has no direct entry for these
    names. Exclude the three standalone complete journal/memoir titles from
    this person-label correction; review titles separately. Names already
    contained in a complete rank/name annotation are not redundantly paired.
    Preserve short names, ranks, particles, other entities, tokens, line
    endings and all unrelated text. Existing component-name dispositions
    and historical translation totals are not reopened or recounted.
    Full proper-name discovery remains incomplete; these edits are not
    included in the verified D-21569 release ZIP.
  TEXT

  def transform(entity, key, text, english)
    return [text, 'excluded'] if TITLE_KEYS[key] == entity

    updated = case entity
              when 'person:lerkara-fel'
                spelling = english.match?(/\bLerkara Fell\b/) ? 'Lerkara Fell' : 'Lerkara Fel'
                text.gsub(/레르카라\(Lerkara\) 펠(?:\(Fel\))?/,
                          "레르카라 펠(#{spelling})")
              when 'person:patrick-morkan'
                text.gsub('패트릭 모르칸(Morkan)', '패트릭 모르칸(Patrick Morkan)')
              when 'person:kellis-cen'
                text.gsub(/켈리스 센(?!\(Kellis Cen\))/, '켈리스 센(Kellis Cen)')
              when 'person:rikka-egest'
                text
              else
                raise "unreviewed entity #{entity}"
              end
    [updated, updated == text ? 'not-an-issue' : 'accepted']
  end

  def prepare
    R.ensure_unused_batch!(D)
    raise 'discovery artifacts already exist' if
      [DEFINITIONS, REVIEWS].any? { |path| File.exist?(path) }
    glossary = M.table(R::GLOSSARY)
    entities = DATA.map do |key, english, korean, aliases, _count, notes|
      values = {
        'entity_key' => key, 'english_canonical' => english,
        'korean_canonical' => "#{korean}(#{english})", 'category' => 'person',
        'english_aliases' => aliases, 'korean_variants' => korean,
        'evidence_ids' => "D-#{D}", 'status' => 'confirmed',
        'notes' => "#{notes} #{CONTEXT}"
      }
      glossary.headers.to_h { |header| [header, values.fetch(header, '')] }
    end
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, entities).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    counts = generated.group_by { |row| row.fetch('entity_key') }.transform_values(&:length)
    raise "source counts differ: #{counts.inspect}" unless
      counts == DATA.to_h { |row| [row[0], row[4]] }
    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      updated = old.dup
      dispositions = {}
      matches.each do |match|
        entity = match.fetch('entity_key')
        updated, dispositions[entity] = transform(entity, key, updated, english)
      end
      status = if updated != old
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.sort.join('|'), 'status' => status,
        'old' => old, 'new' => updated,
        'evidence' => matches.map do |match|
          entities.find { |row| row['entity_key'] == match['entity_key'] }.fetch('notes')
        end.join(' '),
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    raise "expected 48 keys, got #{reviews.length}" unless reviews.length == 48
    raise 'expected 13 reviewed edits' unless reviews.count { |row| row['old'] != row['new'] } == 13
    R.validate!(entities, reviews, generated, glossary.map(&:to_h),
                M.table(M::INDEX).map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.select { |row| row['old'] != row['new'] }
           .group_by { |row| row['resource'] }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    puts "D-#{D}: #{reviews.length} keys, #{generated.length} matches, 13 edits; prepare only."
    [glossary.headers, entities, reviews]
  end

  def apply
    headers, entities, reviews = prepare
    M.write_table(DEFINITIONS, headers, entities)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Mel Aglir And Ayten Full Personal Names

      #{CONTEXT}
      Registered Lerkara Fel (including source-local Lerkara Fell),
      Patrick Morkan, Kellis Cen and Rikka Egest as four full identities.
      Corrected 13 default Texto cells: 11 split Lerkara annotations,
      one incomplete Patrick Morkan pair and one unannotated Kellis Cen
      label. The three complete journal/memoir titles remain unchanged
      and excluded from this personal-name scope, pending title review.
    TEXT
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      raise "missing checkpoint #{path}" unless text.include?(marker)
      File.write(path, text.sub(marker, "#{marker}\n\n#{detail}"))
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewMelAglirAytenCompoundsD21579.prepare
  when ['apply'] then ReviewMelAglirAytenCompoundsD21579.apply
  else abort 'usage: review-mel-aglir-ayten-compounds-D21579.rb [prepare|apply]'
  end
end
