#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module TirnochEsharraD21094
  M = ReviewedNameBatches
  D = 21_094
  DEFINITIONS = File.join(M::AUDIT, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(M::AUDIT, "proper-name-discovery-D#{D}.tsv")
  TIRNOCH = /(?:티르노크|티아노크|티어노크|티르녹|티어녹)(?:\(Tirnoch\))?/
  ESHARRA = /에샤라(?:\(Esharra\))?/
  EYES = /\bEyes? of Tirnoch\b/i
  CHANTS = %w[35322 46088].freeze
  LOCALIZED_MARKERS = %w[14088 45747].freeze
  CONTEXT = 'English is the identity/meaning anchor; Japanese and Chinese corroborate rather than override it. The official Korean manual describes the Fae/faction setting but supplies no direct spelling for these late-story names. Reuse established bilingual Korean forms, preserve complete compound names, and change no surrounding prose, tokens, number, honorific particles, or line breaks. Do not reopen unrelated prior entity decisions or historical global tallies.'

  module_function

  def definitions
    [
      ['deity:tirnoch', 'Tirnoch', 'deity', '티르노크(Tirnoch)', '',
       '티르노크|티아노크|티어노크|티르녹|티어녹',
       'default:1834|default:55426|default:46584',
       'English names the being worshipped as Gadflow’s god and imprisoned in the Amethyn. Japanese ティアノック and Chinese 提尔诺克 confirm the same identity. Separate the named magical Eyes mirrors; ordinary possessive eyes/grace/power references still refer to Tirnoch. Two complete in-world-language chants are preserved, not partially translated.'],
      ['artifact:eyes-of-tirnoch', 'Eyes of Tirnoch', 'lore term',
       '티르노크의 눈(Eyes of Tirnoch)', 'Eye of Tirnoch',
       '티르노크의 눈|티어노크의 눈|티르녹의 눈',
       'base:1653:11|base:3147:11|default:19147|default:21220',
       'English default:19147 explicitly calls this a magical scrying mirror and default:21220 describes two immense prismere mirrors. Japanese ティアノックの眼 and Chinese 提尔诺克之眼 corroborate. Preserve singular Eye versus plural Eyes in each complete English label, and preserve existing quote marks. Do not convert Tirnoch’s ordinary anatomical/figurative eyes into this artifact.'],
      ['place:esharra', 'Esharra', 'place', '에샤라(Esharra)', '',
       '에샤라', 'default:2903|default:8102|default:36690',
       'English explicitly identifies Esharra as a realm of magic and distinguishes Telogrus’s form there from his embodied form here. Japanese イーシャラー and Chinese 艾莎拉 corroborate. Reuse established 에샤라, pair missing explicit references, and preserve existing statue/key context without renaming Amman or turning generic descriptors into new proper titles.'],
      ['title:esharra-song', "Esharra's Song", 'title',
       "에샤라의 노래(Esharra's Song)", '', '에샤라의 노래',
       'base:184:11',
       'This is the complete base label Esharra’s Song, corroborated by Japanese イーシャラーの詩歌 and Chinese 艾莎拉之歌. Pair the full label atomically. The title alone does not establish its item/weapon subtype; do not infer one.']
    ].map do |entity, english, category, korean, aliases, variants, ids, notes|
      {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => category, 'korean_canonical' => korean,
        'english_aliases' => aliases, 'korean_variants' => variants,
        'evidence_ids' => "D-#{D}|#{ids}", 'status' => 'confirmed',
        'notes' => "#{CONTEXT} #{notes}"
      }
    end
  end

  def excluded?(entity, english, id)
    case entity
    when 'deity:tirnoch'
      CHANTS.include?(id) || LOCALIZED_MARKERS.include?(id) ||
        !english.gsub(EYES, '').match?(/(?<![A-Za-z])Tirnoch(?![A-Za-z])/i)
    when 'place:esharra'
      !english.sub("Esharra's Song", '').match?(/\bEsharra\b/i)
    else
      false
    end
  end

  def edit(text, entity, english)
    case entity
    when 'deity:tirnoch'
      text.gsub(TIRNOCH, '티르노크(Tirnoch)')
    when 'artifact:eyes-of-tirnoch'
      form = english[EYES]
      text.gsub(/#{TIRNOCH.source}의 눈(?:\(Eyes? of Tirnoch\))?/,
                "티르노크의 눈(#{form})")
    when 'place:esharra'
      text.gsub(ESHARRA, '에샤라(Esharra)')
    when 'title:esharra-song'
      text.sub(/#{ESHARRA.source}의 노래/, "에샤라의 노래(Esharra's Song)")
    else
      raise "unknown Tirnoch/Esharra entity #{entity}"
    end
  end

  def reviews(inventory)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    generated.group_by { |row| M.key(row) }.sort_by do |key, _rows|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      english = JSON.parse(source.fetch('en_texts_json')).compact.join("\n")
      old = source.fetch('work_text')
      new_text = old
      dispositions = {}
      evidence = []
      matches.each do |match|
        entity = match.fetch('entity_key')
        definition = definitions.find { |row| row['entity_key'] == entity }
        if excluded?(entity, english, key[1])
          dispositions[entity] = 'excluded'
          evidence << if CHANTS.include?(key[1])
                        'Preserve the entire in-world-language Qualla chant unchanged; an English proper-name lexical hit alone does not authorize mixing a Korean translation into the chant.'
                      elsif LOCALIZED_MARKERS.include?(key[1])
                        'Tirnoch occurs solely inside the localized {*1Tirnoch} runtime-style span. Korean already has {*1티르노크}. Preserve the complete existing marker in this exact-byte terminology pass rather than changing opaque marker contents to insert a bilingual label.'
                      else
                        "Exclude #{entity} component rewriting inside a separately reviewed complete artifact/title name."
                      end
          next
        end
        proposed = edit(new_text, entity, english)
        covered = if entity == 'artifact:eyes-of-tirnoch'
                    proposed.include?("티르노크의 눈(#{english[EYES]})")
                  else
                    proposed.include?(definition.fetch('korean_canonical'))
                  end
        raise "unrecognized Tirnoch/Esharra Korean #{entity} #{key.inspect}" unless covered
        dispositions[entity] = proposed == new_text ? 'not-an-issue' : 'accepted'
        new_text = proposed
        evidence << definition.fetch('notes')
      end
      status = if old != new_text
                 'accepted'
               elsif dispositions.values.all? { |value| value == 'excluded' }
                 'excluded'
               else
                 'not-an-issue'
               end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.join('|'), 'status' => status,
        'old' => old, 'new' => new_text, 'evidence' => evidence.join(' '),
        'english' => english,
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
  end

  def run
    inventory = M.refresh_inventory
    review_rows = reviews(inventory)
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    ReviewedProperNameDiscovery.validate!(
      definitions, review_rows, generated, glossary.map(&:to_h), index.map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(review_rows, inventory)
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS, review_rows)
    puts "Prepared Tirnoch/Esharra: #{review_rows.length} rows, #{generated.length} entity keys: " \
      "#{review_rows.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

TirnochEsharraD21094.run if $PROGRAM_NAME == __FILE__
