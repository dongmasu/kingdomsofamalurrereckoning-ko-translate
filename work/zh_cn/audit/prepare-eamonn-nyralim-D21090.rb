#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module EamonnNyralimD21090
  M = ReviewedNameBatches
  D = 21_090
  DEFINITIONS = File.join(M::AUDIT, "proper-name-discovery-definitions-D#{D}.tsv")
  REVIEWS = File.join(M::AUDIT, "proper-name-discovery-D#{D}.tsv")
  EAMONN_ROOT = /(?:이모넌|에이먼|이먼|이몬)(?:\(Eamonn\))?/
  NYRALIM_ROOT = /(?:나이랄림|나이라림|니랄림|니라림)(?:\(Nyralim\))?/
  EAMONN_PLACE = /(?:The )?Isle of Eamonn|Eamonn(?:'s)? Isle|Eamonn's (?:Path|Fortress)/i
  EVIDENCE = 'English anchors identity; Japanese イーモン / ニラリム and Chinese 埃蒙 / 尼拉利姆 corroborate. Official Korean manual PDF p.7 provides faction context but no spelling for these figures. Canonical Korean reuses the prevailing existing bilingual personal-name forms 이먼(Eamonn) and 니랄림(Nyralim), not a newly inferred pronunciation. Preserve complete place/item names atomically, and preserve existing unrelated entity decisions and text. Counts are new entity-specific index decisions, not global translation totals.'

  module_function

  def definitions
    [
      ['person:eamonn', 'Eamonn', 'person', '이먼(Eamonn)', '',
       '이몬|에이먼|이먼|이모넌', 'default:23229|default:38267|default:40361',
       'English identifies Eamonn as Eagonn’s father and Caerwyn’s grandfather; he is not Eagonn. Preserve all Eagonn references and father/son relationships. Complete Isle/Path/Fortress names are excluded from person-component rewriting.'],
      ['place:eamonn-isle', "Eamonn's Isle", 'place', "이먼의 섬(Eamonn's Isle)",
       'Isle of Eamonn|The Isle of Eamonn|Eamonn Isle',
       '이몬 섬|이먼 섬|이먼의 섬|이몬의 섬|에이먼의 섬|이모넌 섬',
       'base:2136:11|base:2546:11|default:21672|default:24101',
       'English quest travel, Japanese イーモン島, and Chinese 埃蒙岛 identify the same island under possessive, of-phrase, and nonpossessive English forms. Preserve each full source English form in the parenthetical, including The on the exact label.'],
      ['place:eamonn-path', "Eamonn's Path", 'place', "이먼의 길(Eamonn's Path)", '',
       '이먼의 길', 'base:286:11',
       'The exact base label, Japanese イーモンの通路, and Chinese 埃蒙之路 identify a named path. Use the complete English label, not a nested person label.'],
      ['place:eamonn-fortress', "Eamonn's Fortress", 'place', "이먼의 요새(Eamonn's Fortress)", '',
       '이먼 요새|이먼의 요새', 'base:3084:11|default:51294',
       'English names the fortress; Japanese イーモンの要塞 and Chinese 埃蒙的堡垒 confirm the complete place label. Keep it distinct from the island.'],
      ['person:nyralim', 'Nyralim', 'person', '니랄림(Nyralim)', '',
       '니랄림|니라림|나이랄림|나이라림', 'default:6501|default:9970|default:53853',
       'English explicitly identifies the sentient mortal Great Tree, not an ageless Fae. Caer Nyralim is a separately registered place. Preserve its complete labels and existing place dispositions; default:28854 contains both the person and the place. Ordinary wood/sap descriptions remain references to the named tree.'],
      ['item:nyralim-grace', "Nyralim's Grace", 'unique item', "니랄림의 은총(Nyralim's Grace)", '',
       '니랄림의 은총', 'base:856:11|default:52891',
       'The base name is a complete item label; Japanese ニラリムの恵み and Chinese 尼拉利姆的恩典 corroborate it. The sap pendant description at default:52891 supports the association without inventing an English title in that description.'],
      ['item:shard-of-nyralim', 'A Shard of Nyralim', 'unique item', '니랄림의 조각(A Shard of Nyralim)', '',
       '니랄림의 조각', 'base:1932:11|default:3826',
       'The exact base item label, Japanese ニラリムのかけら, and Chinese 尼拉利姆的碎片 identify the shard. The wood description at default:3826 remains a tree/material reference, not an invented full item title.']
    ].map do |entity, english, category, korean, aliases, variants, ids, notes|
      {
        'entity_key' => entity, 'english_canonical' => english,
        'category' => category, 'korean_canonical' => korean,
        'english_aliases' => aliases, 'korean_variants' => variants,
        'evidence_ids' => "D-#{D}|#{ids}", 'status' => 'confirmed',
        'notes' => "#{EVIDENCE} #{notes}"
      }
    end
  end

  def edit(text, entity, english)
    case entity
    when 'person:eamonn'
      return text if english.gsub(EAMONN_PLACE, '').scan(/\bEamonn\b/i).empty?
      text.gsub(EAMONN_ROOT, '이먼(Eamonn)')
    when 'person:nyralim'
      return text if english.gsub(/\bCaer Nyralim\b/i, '')
        .sub("Nyralim's Grace", '').sub('A Shard of Nyralim', '')
        .scan(/\bNyralim\b/i).empty?
      text.split(/(케어 니랄림\(Caer Nyralim\))/).map do |part|
        part == '케어 니랄림(Caer Nyralim)' ? part :
          part.gsub(NYRALIM_ROOT, '니랄림(Nyralim)')
      end.join
    when 'place:eamonn-isle'
      form = english[EAMONN_PLACE]
      raise 'wrong Eamonn place form' unless form && form.match?(/Isle/i)
      text.gsub(/#{EAMONN_ROOT.source}(?:의)? 섬(?:\((?:The )?Isle of Eamonn\)|\(Eamonn(?:'s)? Isle\))?/,
                "이먼의 섬(#{form})")
    when 'place:eamonn-path'
      text.gsub(/#{EAMONN_ROOT.source}의 길(?:\(Eamonn's Path\))?/, "이먼의 길(Eamonn's Path)")
    when 'place:eamonn-fortress'
      text.gsub(/#{EAMONN_ROOT.source}(?:의)? 요새(?:\(Eamonn's Fortress\))?/, "이먼의 요새(Eamonn's Fortress)")
    when 'item:nyralim-grace'
      text.sub(/#{NYRALIM_ROOT.source}의 은총/, "니랄림의 은총(Nyralim's Grace)")
    when 'item:shard-of-nyralim'
      text.sub(/#{NYRALIM_ROOT.source}의 조각/, '니랄림의 조각(A Shard of Nyralim)')
    else
      raise "unknown entity #{entity}"
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
        person_excluded = case entity
                          when 'person:eamonn'
                            !english.gsub(EAMONN_PLACE, '').match?(/\bEamonn\b/i)
                          when 'person:nyralim'
                            !english.gsub(/\bCaer Nyralim\b/i, '')
                              .sub("Nyralim's Grace", '').sub('A Shard of Nyralim', '')
                              .match?(/\bNyralim\b/i)
                          else
                            false
                          end
        if person_excluded
          dispositions[entity] = 'excluded'
          evidence << "Exclude #{entity} component rewriting in this complete place/item label; preserve its separately reviewed identity and avoid nested English labels."
          next
        end
        proposed = edit(new_text, entity, english)
        canonical = definition.fetch('korean_canonical')
        covered = if entity == 'place:eamonn-isle'
                    proposed.include?("이먼의 섬(#{english[EAMONN_PLACE]})")
                  else
                    proposed.include?(canonical)
                  end
        raise "unrecognized Korean name #{entity} #{key.inspect}" unless covered
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
    raise 'unexpected Eamonn/Nyralim scope' unless review_rows.length == 145
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS, review_rows)
    puts "Prepared Eamonn/Nyralim: #{review_rows.length} rows, #{generated.length} entity keys: " \
      "#{review_rows.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

EamonnNyralimD21090.run if $PROGRAM_NAME == __FILE__
