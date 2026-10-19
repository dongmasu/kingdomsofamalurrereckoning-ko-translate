#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module ReviewFullPersonCompoundsD21577
  extend self
  M = ReviewedNameBatches
  R = ReviewedProperNameDiscovery
  D = 21_577
  DEFINITIONS = File.join(__dir__, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(__dir__, "proper-name-discovery-D#{D}.tsv")
  PEOPLE = [
    ['person:erion-odi', 'Erion Odi', '에리온 오디',
     '에리온 오디|에리온(Erion) 오디|에리온 오디(Erion Odi)', 9,
     'English directly names the Seawatch healer/soldier Erion Odi. Japanese エリオン・オディ and Chinese 艾里恩·欧迪 corroborate. Reuse the established Korean forms in every complete-name row; correct only default:47685, where parentheses split the given name and surname instead of pairing the whole name.'],
    ['person:edar-odi', 'Edar Odi', '에다르 오디',
     '에다르 오디|에다르(Edar) 오디|에다르 오디(Edar Odi)', 3,
     'English directly names Edar Odi. Japanese エダー・オディ and Chinese 艾达尔·奥迪 corroborate. This is a distinct person from Erion Odi; reuse the established complete-name spelling and correct only default:32260, which currently pairs the given name alone.'],
    ['person:bede-pengaras', 'Bede Pengaras', '비드 펜가라스',
     '비드 펜가라스|비드 펜가라스(Bede Pengaras)|비드 펜가라스(Pengaras)', 3,
     'English directly names Bede Pengaras. Japanese ビード・ペンガラス and Chinese 比德·潘加拉斯 corroborate. Reuse the established full-name spelling and correct only default:59802, whose parenthetical omits the given name.'],
    ['person:bede-edithing', 'Bede Edithing', '비드 에디싱',
     '비드 에디싱|베데 에디싱(Bede Edithing)|비드 에디싱(Bede Edithing)', 1,
     'English directly names Bede Edithing. Japanese ビード・エディシング and Chinese 比德·伊迪辛 corroborate the same given name used in Bede Pengaras. Standardize 베데 to 비드 and retain the complete English name once. This person is distinct from Bede Pengaras.']
  ].freeze
  CONTEXT = <<~TEXT.chomp
    Review the four explicitly named compound personal identities across
    affix/base/default. English anchors each identity; aligned Japanese
    informs pronunciation and Chinese corroborates. The 16 distinct source
    row keys are all in default: nine Erion Odi, three Edar Odi, three Bede
    Pengaras and one Bede Edithing. No affix/base full-name hits. Register
    each full identity separately without creating global Odi or Bede aliases.
    Preserve all existing component-name dispositions and unrelated text.
    Do not assign owner-only Odi's Notes (base:3475; historian Odi at
    default:3040), Odi Speaks (default:5215), or Odi's Camp (default:52481)
    to any of the several Odi-named people. Bede's Journal (base:4218;
    default:28722, 33408, 53209) remains unassigned because the source also
    names Bede Pengaras and Bede Edithing without identifying the journal's
    author. These owner/title identities remain unresolved, not silently
    merged. The official Korean manual has no direct entries for these NPCs.
  TEXT

  def definitions(headers)
    PEOPLE.map do |key, english, korean, variants, count, notes|
      values = {
        'entity_key' => key,
        'english_canonical' => english,
        'korean_canonical' => "#{korean}(#{english})",
        'category' => 'person',
        'english_aliases' => '',
        'korean_variants' => variants,
        'evidence_ids' => "D-#{D}",
        'status' => 'confirmed',
        'notes' => "#{notes} #{CONTEXT}"
      }
      headers.to_h { |header| [header, values.fetch(header, '')] }
    end
  end

  def transform(entity, text)
    updated = case entity
              when 'person:erion-odi'
                text.gsub(/에리온\(Erion\) 오디/, '에리온 오디(Erion Odi)')
              when 'person:edar-odi'
                text.gsub(/에다르\(Edar\) 오디/, '에다르 오디(Edar Odi)')
              when 'person:bede-pengaras'
                text.gsub(/비드 펜가라스\(Pengaras\)/,
                          '비드 펜가라스(Bede Pengaras)')
              when 'person:bede-edithing'
                text.gsub(/베데 에디싱\(Bede Edithing\)/,
                          '비드 에디싱(Bede Edithing)')
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
    entities = definitions(glossary.headers)
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, entities).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    expected = PEOPLE.to_h { |row| [row[0], row[4]] }
    counts = generated.group_by { |row| row.fetch('entity_key') }
                      .transform_values(&:length)
    raise "source coverage mismatch: #{counts.inspect}" unless counts == expected
    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      updated = old.dup
      dispositions = {}
      matches.each do |match|
        entity = match.fetch('entity_key')
        updated, dispositions[entity] = transform(entity, updated)
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.sort.join('|'),
        'status' => old == updated ? 'not-an-issue' : 'accepted',
        'old' => old, 'new' => updated,
        'evidence' => "#{CONTEXT} #{dispositions.keys.map do |entity|
          entities.find { |row| row['entity_key'] == entity }.fetch('notes')
        end.join(' ')}",
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end
    raise "expected 16 keys, got #{reviews.length}" unless reviews.length == 16
    R.validate!(entities, reviews, generated, glossary.map(&:to_h),
                M.table(M::INDEX).map(&:to_h))
    R.validate_sources!(reviews, inventory)
    reviews.select { |row| row['old'] != row['new'] }
           .group_by { |row| row['resource'] }.each do |resource, edits|
      ProperNameCellEditor.prepare(File.binread(M.csv_path(resource)), edits)
    end
    puts "D-#{D}: #{reviews.length} keys, #{generated.length} matches, " \
         "#{reviews.count { |row| row['old'] != row['new'] }} edits; prepare only."
    [glossary.headers, entities, reviews]
  end

  def apply
    headers, entities, reviews = prepare
    M.write_table(DEFINITIONS, headers, entities)
    M.write_table(REVIEWS, M::HEADERS.take(12), reviews)
    R.run([DEFINITIONS, REVIEWS, D.to_s])
    detail = <<~TEXT.chomp
      ### D-#{D}: Full Personal-Name Compounds And Ambiguous Owners

      #{CONTEXT}
      Registered `에리온 오디(Erion Odi)`, `에다르 오디(Edar Odi)`,
      `비드 펜가라스(Bede Pengaras)` and `비드 에디싱(Bede Edithing)` as
      separate full-name identities. Corrected four cells: the split
      Erion Odi and Edar Odi annotations, the incomplete Bede Pengaras
      parenthetical, and the inconsistent Bede transliteration. Owner-only
      Odi/Bede references listed above remain unresolved and unchanged.
      Existing component-name dispositions and historical tallies were not
      reopened or recounted. Full proper-name discovery remains incomplete.
    TEXT
    M::DOCS.each do |path|
      text = File.read(path)
      marker = '<!-- current-proper-name-batch:end -->'
      text = text.include?(marker) ? text.sub(marker, "#{marker}\n\n#{detail}") :
        "#{text}\n\n#{detail}\n"
      File.write(path, text)
    end
  end
end

if $PROGRAM_NAME == __FILE__
  case ARGV
  when [], ['prepare'] then ReviewFullPersonCompoundsD21577.prepare
  when ['apply'] then ReviewFullPersonCompoundsD21577.apply
  else abort 'usage: review-full-person-compounds-D21577.rb [prepare|apply]'
  end
end
