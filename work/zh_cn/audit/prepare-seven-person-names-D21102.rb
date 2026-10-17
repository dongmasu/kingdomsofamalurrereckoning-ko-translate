#!/usr/bin/env ruby

require_relative 'continue-proper-name-reviewed-batches'
require_relative 'build-proper-name-occurrences'
require_relative 'apply-reviewed-proper-name-discovery'

module SevenPersonNamesD21102
  M = ReviewedNameBatches
  SPECS = [
    ['colbanus', 'Colbanus', '콜바누스', '', '콜바너스',
     'Three standalone labels agree on identity: Japanese コルバナス; Chinese 柯尔巴努斯. Reuse the prevailing active 콜바누스 spelling as an editorial standard, not a claim about recorded English pronunciation.'],
    ['cora-banick', 'Cora Banick', '코라 배닉', 'Cora|Banick', '코라 바닉',
     'Didenhil merchant, Japanese コーラ・バニック; Chinese 科拉·巴尼克. Cora mentions concern the village, plague, and Craft Hall; retain source-local Cora/Banick short labels.'],
    ['livia-fenan', 'Livia Fenan', '리비아 페난', 'Livia|Fenan', '리비아 페넌|페넌|펜난',
     'Vault-key Pledgeshield, Japanese リヴィア・フェナン; Chinese 利维亚·费南. Independent cross-locale review selects 페난 to reconcile the evenly split full-name labels and the prevalent rank-plus-surname spelling. This is an editorial standard, not an audio-derived pronunciation. Keep source-local short names and title-inclusive English labels.'],
    ['holden-lafayette', 'Holden LaFayette', '홀든 라파예트', 'Holden|LaFayette', '',
     'Vipers leader in the Valor Arena, Japanese ホールデン・ラファイエット; Chinese 霍尔登·拉法叶提. Holden and LaFayette short references explicitly concern the same team; preserve each source-local English label.'],
    ['elwa-brond', 'Elwa Brond', '엘와 브론드', '', '',
     'Cape Solace potion merchant in the Calum debt dispute; Japanese エルワ・ブロンド; Chinese 艾尔瓦·布朗德. Register only the full name, not Elwa or the surname Brond; Sveri Brond is a different person.'],
    ['fiona-terane', 'Fiona Terane', '피오나 테레인', '', '',
     'Keep blacksmith, Japanese フィオナ・テレイン; Chinese 菲奥娜·特兰恩. Register only the full name: Princess Fiona and Fiona Caid are distinct people.'],
    ['capstan-odvar', 'Capstan Odvar', '캡스턴 오드바르', 'Capstan', '캐프스턴',
     'Motus security chief and Dunehead crudok bounty contact, Japanese キャプスタン・オドヴァー; Chinese 凯普斯坦·欧达瓦尔. Capstan references concern this chief; do not register Odvar, which also names an ambassador.']
  ].freeze

  def self.definitions
    SPECS.map do |slug, english, korean, aliases, variants, note|
      {
        'entity_key' => "person:#{slug}", 'english_canonical' => english,
        'category' => 'person', 'korean_canonical' => "#{korean}(#{english})",
        'english_aliases' => aliases, 'korean_variants' => variants,
        'status' => 'confirmed', 'notes' => note
      }
    end
  end

  def self.pair(text, korean, english)
    text.gsub(/#{Regexp.escape(korean)}(?!\()/, "#{korean}(#{english})")
  end

  def self.transform(text, entity)
    case entity
    when 'person:colbanus'
      pair(text.gsub('콜바너스', '콜바누스'), '콜바누스', 'Colbanus')
    when 'person:cora-banick'
      text = pair(text.gsub('코라 바닉', '코라 배닉'), '코라 배닉', 'Cora Banick')
      text = text.gsub(/코라(?![ 가-힣]*배닉|\()/, '코라(Cora)')
      pair(text, '배닉', 'Banick')
    when 'person:livia-fenan'
      text = text.gsub('페넌', '페난').gsub('펜난', '페난')
      # Title-inclusive existing labels already contain the English name.
      text = text.gsub(/리비아 페난(?!\()/, '리비아 페난(Livia Fenan)')
      text = text.gsub(/리비아(?! 페난|\()/, '리비아(Livia)')
      text = text.gsub(/페난(?!\()/, '페난(Fenan)')
      text
    when 'person:holden-lafayette'
      text = pair(text, '홀든 라파예트', 'Holden LaFayette')
      text = text.gsub(/홀든(?! 라파예트|\()/, '홀든(Holden)')
      pair(text, '라파예트', 'LaFayette')
    when 'person:elwa-brond'
      text = pair(text, '엘와 브론드', 'Elwa Brond')
      text.gsub(/엘와(?! 브론드|\()/, '엘와(Elwa)')
    when 'person:fiona-terane'
      pair(text, '피오나 테레인', 'Fiona Terane')
    when 'person:capstan-odvar'
      text = text.gsub('캐프스턴', '캡스턴')
      text = pair(text, '캡스턴 오드바르', 'Capstan Odvar')
      text.gsub(/캡스턴(?! 오드바르|\()/, '캡스턴(Capstan)')
    else
      raise "unexpected entity #{entity}"
    end
  end

  def self.build
    inventory = M.refresh_inventory
    defs = definitions
    hits = build_occurrences(inventory.values, defs).map { |r| OCCURRENCE_HEADERS.zip(r).to_h }
    reviews = hits.group_by { |r| M.key(r) }.map do |key, group|
      source = inventory.fetch(key)
      old = source.fetch('work_text')
      new_text = old.dup
      dispositions = {}
      group.each do |hit|
        entity = hit.fetch('entity_key')
        before = new_text
        new_text = transform(new_text, entity)
        dispositions[entity] = new_text == before ? 'not-an-issue' : 'accepted'
      end
      note = group.map { |hit| defs.find { |d| d['entity_key'] == hit['entity_key'] }.fetch('notes') }.join(' ')
      note += ' Official manual PDF pp. 7-8 distinguishes faction quests and dialogue; retain Warsworn terminology and surrounding task/dialogue meaning.'
      if key[0] == 'default' && key[1] == '15183'
        note += ' New entity-only scope; historical D-4626 contract judgment, quantities, prices and layout are untouched.'
      end
      if key[0] == 'default' && %w[3157 16592 46163].include?(key[1])
        note += ' Prior dialogue/team judgments and the D-20945 Crows disposition are not reopened or recounted.'
      end
      if key[0] == 'default' && key[1] == '33910'
        note += ' The repeated Elwa in this same sentence is paired locally; this does not establish a global Elwa alias.'
      end
      {
        'resource' => key[0], 'ID_Linha' => key[1], 'Tipo_Variante' => key[2],
        'entity_key' => dispositions.keys.join('|'),
        'status' => dispositions.value?('accepted') ? 'accepted' : 'not-an-issue',
        'old' => old, 'new' => new_text, 'evidence' => note,
        'english' => JSON.parse(source.fetch('en_texts_json')).compact.join("\n"),
        'japanese' => JSON.parse(source.fetch('ja_texts_json')).compact.join("\n---\n"),
        'chinese' => source.fetch('zh_text'),
        'entity_dispositions_json' => JSON.generate(dispositions)
      }
    end.sort_by { |r| [M::RESOURCES.index(r['resource']), r['ID_Linha'].to_i, r['Tipo_Variante']] }
    defs.each do |d|
      keys = hits.select { |h| h['entity_key'] == d['entity_key'] }.map { |h| M.key(h).join(':') }
      d['evidence_ids'] = (['D-21102', 'D-21103'] + keys).join('|')
    end
    ReviewedProperNameDiscovery.validate!(
      defs, reviews, hits,
      M.table(File.join(__dir__, 'proper-name-glossary.tsv')).map(&:to_h),
      M.table(M::INDEX).map(&:to_h)
    )
    ReviewedProperNameDiscovery.validate_sources!(reviews, inventory)
    raise 'nested pairing' if reviews.any? { |r| r['new'].match?(/\([^()\r\n]*\(/) }
    M.write_table(File.join(__dir__, 'proper-name-discovery-definitions-D21102.tsv'), defs.first.keys, defs)
    M.write_table(File.join(__dir__, 'proper-name-discovery-D21102.tsv'), reviews.first.keys, reviews)
    puts "Prepared #{reviews.length} distinct rows, #{hits.length} entity matches; #{reviews.count { |r| r['old'] != r['new'] }} proposed edits."
    puts hits.group_by { |r| r['entity_key'] }.transform_values(&:length).inspect
  end
end

SevenPersonNamesD21102.build if $PROGRAM_NAME == __FILE__
