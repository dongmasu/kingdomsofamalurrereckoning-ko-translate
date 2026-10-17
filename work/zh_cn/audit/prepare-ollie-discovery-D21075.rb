#!/usr/bin/env ruby

require_relative 'apply-reviewed-proper-name-discovery'

module OllieDiscoveryD21075
  M = ReviewedNameBatches
  DEFINITIONS = File.join(M::AUDIT, 'proper-name-discovery-definitions-D21075.tsv')
  REVIEWS = File.join(M::AUDIT, 'proper-name-discovery-D21075.tsv')
  ENTITY = 'person:ollie-madsen'
  NOTES = 'English identifies Ollie Madsen as the former Dregshore master-at-arms who joins Gravehal Keep and provides combat/beast training. Japanese オリー・マドセン / オリー and Chinese 奥利·麦德森 / 奥利 confirm the full and contextual short names. Use the established 올리 매드슨(Ollie Madsen) and 올리(Ollie) forms, including repeated mentions. Keep the separately translated job descriptions unchanged in this focused person scope. The official manual supplies conversation and combat context (PDF pp. 6-8), not this DLC character roster. Prior entity/key dispositions and historical global totals are not reopened or recounted.'
  DEFINITION = {
    'entity_key' => ENTITY, 'english_canonical' => 'Ollie Madsen',
    'category' => 'person', 'korean_canonical' => '올리 매드슨(Ollie Madsen)',
    'english_aliases' => 'Ollie', 'korean_variants' => '올리 매드슨|올리',
    'evidence_ids' => 'D-21075|default:17267|default:19483|default:25107|default:41271',
    'status' => 'confirmed', 'notes' => NOTES
  }.freeze

  module_function

  def definitions
    [DEFINITION]
  end

  def edit_name(text)
    text = text.gsub(/올리 매드슨(?:\(Ollie Madsen\))?/, '올리 매드슨(Ollie Madsen)')
    text.gsub(/올리(?! 매드슨|\(Ollie\))/, '올리(Ollie)')
  end

  def run
    inventory = M.refresh_inventory
    generated = build_occurrences(inventory.values, definitions).map do |values|
      OCCURRENCE_HEADERS.zip(values).to_h
    end
    reviews = generated.group_by { |row| M.key(row) }.sort_by do |key, _|
      [M::RESOURCES.index(key[0]), key[1].to_i, key[2]]
    end.map do |key, matches|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = edit_name(old)
      evidence = NOTES
      if key == ['default', '13502', ''] && new_text.include?('초케이프 솔라스')
        new_text = new_text.sub('초케이프 솔라스', '케이프 솔라스')
        evidence += ' Also remove the stray 초 prefixed to Cape Solace: EN says inviting Ollie from Cape Solace, and JA/ZH both identify the ordinary place name; the sentence already ends with the complete verb 초빙했어.'
      end
      status = old == new_text ? 'not-an-issue' : 'accepted'
      dispositions = matches.to_h { |match| [match.fetch('entity_key'), status] }
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.join('|'), 'status' => status,
        'old' => old, 'new' => new_text, 'evidence' => evidence,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions),
        'previous_status' => '', 'previous_evidence' => ''
      }
    end
    glossary = M.table(ReviewedProperNameDiscovery::GLOSSARY)
    index = M.table(M::INDEX)
    ReviewedProperNameDiscovery.validate!(
      definitions, reviews, generated, glossary.map(&:to_h), index.map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    M.write_table(DEFINITIONS, glossary.headers, definitions)
    M.write_table(REVIEWS, M::HEADERS, reviews)
    puts "Prepared Ollie Madsen: #{reviews.length} rows, #{generated.length} entity matches: " \
         "#{reviews.group_by { |row| row['status'] }.transform_values(&:length)}"
  end
end

OllieDiscoveryD21075.run if $PROGRAM_NAME == __FILE__
